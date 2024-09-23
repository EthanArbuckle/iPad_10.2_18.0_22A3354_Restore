@implementation AXProcessIsPreferences

void __AXProcessIsPreferences_block_invoke()
{
  void *v0;
  int v1;

  AXApplicationGetMainBundleIdentifier();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "isEqualToString:", CFSTR("com.apple.Preferences"));

  if (v1)
    AXProcessIsPreferences__AXIsProcess = 1;
}

@end
