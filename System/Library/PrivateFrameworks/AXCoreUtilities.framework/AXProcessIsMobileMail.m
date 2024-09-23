@implementation AXProcessIsMobileMail

void __AXProcessIsMobileMail_block_invoke()
{
  void *v0;
  int v1;

  AXApplicationGetMainBundleIdentifier();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "isEqualToString:", CFSTR("com.apple.mobilemail"));

  if (v1)
    AXProcessIsMobileMail__AXProcessIsMobileMail = 1;
}

@end
