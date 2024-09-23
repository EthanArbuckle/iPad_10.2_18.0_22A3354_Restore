@implementation AXProcessIsMomentsUIService

void __AXProcessIsMomentsUIService_block_invoke()
{
  void *v0;
  int v1;

  AXApplicationGetMainBundleIdentifier();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "isEqualToString:", CFSTR("com.apple.MomentsUIService"));

  if (v1)
    AXProcessIsMomentsUIService__AXProcessIsMomentsUIService = 1;
}

@end
