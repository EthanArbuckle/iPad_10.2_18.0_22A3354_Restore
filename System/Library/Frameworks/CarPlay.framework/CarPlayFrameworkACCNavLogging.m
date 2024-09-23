@implementation CarPlayFrameworkACCNavLogging

void __CarPlayFrameworkACCNavLogging_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.carplayframework", "ACCNav");
  v1 = (void *)CarPlayFrameworkACCNavLogging_facility;
  CarPlayFrameworkACCNavLogging_facility = (uint64_t)v0;

}

@end
