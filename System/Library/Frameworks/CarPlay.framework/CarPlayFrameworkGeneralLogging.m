@implementation CarPlayFrameworkGeneralLogging

void __CarPlayFrameworkGeneralLogging_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.carplayframework", "General");
  v1 = (void *)CarPlayFrameworkGeneralLogging_facility;
  CarPlayFrameworkGeneralLogging_facility = (uint64_t)v0;

}

@end
