@implementation AXProcessIsPreBoard

void __AXProcessIsPreBoard_block_invoke()
{
  void *v0;
  int v1;

  AXApplicationGetMainBundleIdentifier();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "isEqualToString:", CFSTR("com.apple.PreBoard"));

  if (v1)
    AXProcessIsPreBoard_AXProcessIsPreBoard = 1;
}

@end
