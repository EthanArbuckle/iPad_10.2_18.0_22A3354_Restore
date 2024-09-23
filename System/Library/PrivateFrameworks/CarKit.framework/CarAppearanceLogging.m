@implementation CarAppearanceLogging

void __CarAppearanceLogging_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.carkit", "Appearance");
  v1 = (void *)CarAppearanceLogging_facility;
  CarAppearanceLogging_facility = (uint64_t)v0;

}

@end
