@implementation AXProcessIsChronod

void __AXProcessIsChronod_block_invoke()
{
  void *v0;
  int v1;

  AXApplicationGetMainBundleIdentifier();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "isEqualToString:", CFSTR("com.apple.chronod"));

  if (v1)
    AXProcessIsChronod__AXProcessIsChronod = 1;
}

@end
