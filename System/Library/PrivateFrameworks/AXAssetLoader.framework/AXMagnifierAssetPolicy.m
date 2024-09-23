@implementation AXMagnifierAssetPolicy

- (id)assetType
{
  return CFSTR("com.apple.MobileAsset.MagnifierAsset");
}

- (id)launchActivityIdentifier
{
  return CFSTR("com.apple.ax.MagnifierAsset.LaunchActivity");
}

- (BOOL)shouldCopyLocally
{
  return 1;
}

- (BOOL)shouldUseProductionServerForInternalBuilds
{
  return 0;
}

- (id)maxSupportedFormatVersion
{
  return &unk_1E95D7C20;
}

- (id)minSupportedFormatVersion
{
  return &unk_1E95D7C20;
}

@end
