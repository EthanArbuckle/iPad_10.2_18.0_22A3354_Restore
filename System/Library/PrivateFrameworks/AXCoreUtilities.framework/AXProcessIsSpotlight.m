@implementation AXProcessIsSpotlight

void __AXProcessIsSpotlight_block_invoke()
{
  void *v0;
  int v1;

  AXApplicationGetMainBundleIdentifier();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "isEqualToString:", CFSTR("com.apple.Spotlight"));

  if (v1)
    AXProcessIsSpotlight__AXProcessIsSpotlight = 1;
}

@end
