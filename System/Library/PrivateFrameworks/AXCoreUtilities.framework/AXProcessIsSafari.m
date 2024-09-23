@implementation AXProcessIsSafari

void __AXProcessIsSafari_block_invoke()
{
  id v0;

  AXApplicationGetMainBundleIdentifier();
  v0 = (id)objc_claimAutoreleasedReturnValue();
  AXProcessIsSafari_AXIsSafari = objc_msgSend(v0, "isEqualToString:", CFSTR("com.apple.mobilesafari"));

}

@end
