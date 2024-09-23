@implementation AXProcessIsAppleTVApp

void __AXProcessIsAppleTVApp_block_invoke()
{
  void *v0;
  int v1;

  AXApplicationGetMainBundleIdentifier();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "isEqualToString:", CFSTR("com.apple.tv"));

  if (v1)
    AXProcessIsAppleTVApp__IsAppleTVApp = 1;
}

@end
