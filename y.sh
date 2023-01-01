#!/bin/bash

# Set your GitHub username and repository name
USERNAME="w3slee"
REPO="https://github.com/w3slee/squank.git"
# Set the start and end dates for the commit range in YYYY-MM-DD format
START_DATE="2023-01-01"
END_DATE="2023-11-01"

# Set the commit message
COMMIT_MESSAGE="Greening the GitHub contributions!"

# Iterate over the date range
while [ "$(date -jf "%Y-%m-%d" "$START_DATE" +%s)" -le "$(date -jf "%Y-%m-%d" "$END_DATE" +%s)" ]; do
	# Create an empty file for each day
	touch "$START_DATE.txt"

	# Stage the file
	git add .

	# Make the commit
	git commit -m "$COMMIT_MESSAGE" --date="$(date -u -jf "%Y-%m-%d" "$START_DATE" +'%Y-%m-%d %H:%M:%S')"

	# Move to the next day
	START_DATE=$(date -jf "%Y-%m-%d" -v+1d "$START_DATE" +'%Y-%m-%d')
done

# Push the commits to GitHub
git push origin master
