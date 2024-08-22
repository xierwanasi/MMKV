#!/bin/bash

rm -rf archives
xcodebuild archive \
-workspace MMKV.xcworkspace \
-scheme MMKV \
-configuration Release \
-destination "generic/platform=iOS" \
-archivePath "archives/MMKV-iOS" \
SKIP_INSTALL=NO \
BUILD_LIBRARY_FOR_DISTRIBUTION=YES

xcodebuild archive \
-workspace MMKV.xcworkspace \
-scheme MMKV \
-configuration Release \
-destination "generic/platform=iOS Simulator" \
-archivePath "archives/MMKV-iOS-Simulator" \
SKIP_INSTALL=NO \
BUILD_LIBRARY_FOR_DISTRIBUTION=YES

xcodebuild archive \
-workspace MMKV.xcworkspace \
-scheme MMKV \
-configuration Release \
-destination "generic/platform=macOS" \
-archivePath "archives/MMKV-macOS" \
SKIP_INSTALL=NO \
BUILD_LIBRARY_FOR_DISTRIBUTION=YES

xcodebuild \
-create-xcframework \
-archive archives/MMKV-iOS.xcarchive -framework MMKV.framework \
-archive archives/MMKV-iOS-Simulator.xcarchive -framework MMKV.framework \
-archive archives/MMKV-macOS.xcarchive -framework MMKV.framework \
-output archives/MMKV.xcframework

zip -r -X "archives/MMKV.xcframework.zip" "archives/MMKV.xcframework"
