@implementation AXProcessIsSurfBoard

void __AXProcessIsSurfBoard_block_invoke()
{
  void *v0;
  int v1;

  AXApplicationGetMainBundleIdentifier();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "isEqualToString:", CFSTR("com.apple.SurfBoard"));

  if (v1)
    AXProcessIsSurfBoard__AXProcessIsSurfBoard = 1;
}

@end
