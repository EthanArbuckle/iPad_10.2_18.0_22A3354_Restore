@implementation AXProcessIsPineBoard

void __AXProcessIsPineBoard_block_invoke()
{
  void *v0;
  int v1;

  AXApplicationGetMainBundleIdentifier();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "isEqualToString:", CFSTR("com.apple.PineBoard"));

  if (v1)
    AXProcessIsPineBoard__AXProcessIsPineBoard = 1;
}

@end
