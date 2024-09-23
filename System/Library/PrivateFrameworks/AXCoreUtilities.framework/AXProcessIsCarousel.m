@implementation AXProcessIsCarousel

void __AXProcessIsCarousel_block_invoke()
{
  void *v0;
  int v1;

  AXApplicationGetMainBundleIdentifier();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "isEqualToString:", CFSTR("com.apple.Carousel"));

  if (v1)
    AXProcessIsCarousel__AXProcessIsCarousel = 1;
}

@end
