@implementation AXProcessIsSpringBoard

void __AXProcessIsSpringBoard_block_invoke()
{
  void *v0;
  int v1;

  AXApplicationGetMainBundleIdentifier();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "isEqualToString:", CFSTR("com.apple.springboard"));

  if (v1)
    AXProcessIsSpringBoard__AXProcessIsSpringBoard = 1;
}

@end
