@implementation CarThemeAssetsLogging

void __CarThemeAssetsLogging_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.carkit", "ThemeAssets");
  v1 = (void *)CarThemeAssetsLogging_facility;
  CarThemeAssetsLogging_facility = (uint64_t)v0;

}

@end
