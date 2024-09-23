@implementation MTDynamicBlurRadiusGraphicsQuality

void __MTDynamicBlurRadiusGraphicsQuality_block_invoke()
{
  void *v0;
  void *v1;
  int v2;

  _MTLowQualityDevicesForDynamicBlurRadius();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  _MTCurrentProduct();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v0, "containsObject:", v1);

  if (v2)
    MTDynamicBlurRadiusGraphicsQuality___dynamicBlurRadiusGraphicsQuality = 1;
}

@end
