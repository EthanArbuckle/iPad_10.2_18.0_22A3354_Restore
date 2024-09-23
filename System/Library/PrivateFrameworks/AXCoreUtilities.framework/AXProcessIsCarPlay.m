@implementation AXProcessIsCarPlay

void __AXProcessIsCarPlay_block_invoke()
{
  void *v0;
  int v1;

  AXApplicationGetMainBundleIdentifier();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "isEqualToString:", CFSTR("com.apple.CarPlayApp"));

  if (v1)
    AXProcessIsCarPlay__AXProcessIsCarPlay = 1;
}

@end
