@implementation AXProcessIsCheckerBoard

void __AXProcessIsCheckerBoard_block_invoke()
{
  void *v0;
  int v1;

  AXApplicationGetMainBundleIdentifier();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "isEqualToString:", CFSTR("com.apple.CheckerBoard"));

  if (v1)
    AXProcessIsCheckerBoard__AXProcessIsCheckerBoard = 1;
}

@end
