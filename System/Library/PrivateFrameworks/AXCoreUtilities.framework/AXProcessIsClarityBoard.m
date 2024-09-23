@implementation AXProcessIsClarityBoard

void __AXProcessIsClarityBoard_block_invoke()
{
  void *v0;
  int v1;

  AXApplicationGetMainBundleIdentifier();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "isEqualToString:", CFSTR("com.apple.ClarityBoard"));

  if (v1)
    AXProcessIsClarityBoard__AXProcessIsClarityBoard = 1;
}

@end
