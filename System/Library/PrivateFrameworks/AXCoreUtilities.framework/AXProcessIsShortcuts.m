@implementation AXProcessIsShortcuts

void __AXProcessIsShortcuts_block_invoke()
{
  id v0;

  AXApplicationGetMainBundleIdentifier();
  v0 = (id)objc_claimAutoreleasedReturnValue();
  AXProcessIsShortcuts_AXProcessIsShortcuts = objc_msgSend(v0, "isEqualToString:", CFSTR("com.apple.shortcuts"));

}

@end
