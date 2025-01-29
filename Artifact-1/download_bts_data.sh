#!/bin/bash

YEAR=2023  # Change this to the desired year

BASE_URL="https://transtats.bts.gov/PREZIP"
DEST_DIR="./bts_data"  # Change to your object storage path if needed

mkdir -p "$DEST_DIR"

for MONTH in {1..12}; do
    FILE_NAME="${YEAR}_${MONTH}.zip"
    FILE_URL="${BASE_URL}/On_Time_Reporting_Carrier_On_Time_Performance_1987_present_${FILE_NAME}"
    
    echo "Downloading $FILE_NAME..."
    curl -k -o "${DEST_DIR}/${FILE_NAME}" "$FILE_URL"

    if [ $? -eq 0 ]; then
        echo "Successfully downloaded $FILE_NAME"
    else
        echo "Failed to download $FILE_NAME"
    fi
done

echo "All downloads completed."
