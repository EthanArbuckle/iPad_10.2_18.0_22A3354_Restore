@implementation CAFAssetVariantsLogging

void __CAFAssetVariantsLogging_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.caraccessoryframework", "CAFAssetVariants");
  v1 = (void *)CAFAssetVariantsLogging_facility;
  CAFAssetVariantsLogging_facility = (uint64_t)v0;

}

@end
