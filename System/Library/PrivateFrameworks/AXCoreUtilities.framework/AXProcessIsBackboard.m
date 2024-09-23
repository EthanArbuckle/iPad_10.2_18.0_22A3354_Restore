@implementation AXProcessIsBackboard

void __AXProcessIsBackboard_block_invoke()
{
  void *v0;
  int v1;

  AXApplicationGetMainBundleIdentifier();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "isEqualToString:", CFSTR("com.apple.backboardd"));

  if (v1)
    AXProcessIsBackboard__AXProcessIsBackboard = 1;
}

@end
