@implementation AXCUProcessIsPreferences

void __AXCUProcessIsPreferences_block_invoke()
{
  void *v0;
  int v1;

  AXCUApplicationGetMainBundleIdentifier();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "isEqualToString:", CFSTR("com.apple.Preferences"));

  if (v1)
    AXCUProcessIsPreferences__IsPreferences = 1;
}

@end
