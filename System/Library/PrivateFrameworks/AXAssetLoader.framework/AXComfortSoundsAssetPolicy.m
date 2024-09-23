@implementation AXComfortSoundsAssetPolicy

- (id)assetType
{
  return CFSTR("com.apple.MobileAsset.ComfortSoundsAssets");
}

- (id)launchActivityIdentifier
{
  return CFSTR("com.apple.ax.ComfortSounds.LaunchActivity");
}

- (BOOL)shouldCopyLocally
{
  return 1;
}

- (id)maxSupportedFormatVersion
{
  return &unk_1E95D7BF0;
}

- (id)minSupportedFormatVersion
{
  return &unk_1E95D7BF0;
}

@end
