@implementation AXProcessIsSiri

void __AXProcessIsSiri_block_invoke()
{
  void *v0;
  int v1;

  AXApplicationGetMainBundleIdentifier();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "isEqualToString:", CFSTR("com.apple.siri"));

  if (v1)
    AXProcessIsSiri__AXProcessIsSiri = 1;
}

@end
