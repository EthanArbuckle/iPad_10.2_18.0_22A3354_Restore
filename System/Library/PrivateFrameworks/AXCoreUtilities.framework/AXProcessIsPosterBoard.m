@implementation AXProcessIsPosterBoard

void __AXProcessIsPosterBoard_block_invoke()
{
  void *v0;
  int v1;

  AXApplicationGetMainBundleIdentifier();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "isEqualToString:", CFSTR("com.apple.PosterBoard"));

  if (v1)
    AXProcessIsPosterBoard__AXProcessIsPosterBoard = 1;
}

@end
