@implementation AXPhoenixAssetPolicy

- (id)assetType
{
  return CFSTR("com.apple.MobileAsset.AXBackTapModel");
}

- (id)launchActivityIdentifier
{
  return CFSTR("com.apple.ax.AXBackTapModel.LaunchActivity");
}

- (BOOL)shouldCopyLocally
{
  return 1;
}

@end
