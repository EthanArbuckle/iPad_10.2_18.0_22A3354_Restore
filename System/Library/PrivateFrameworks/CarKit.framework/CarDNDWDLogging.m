@implementation CarDNDWDLogging

void __CarDNDWDLogging_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.carkit", "DNDWD");
  v1 = (void *)CarDNDWDLogging_facility;
  CarDNDWDLogging_facility = (uint64_t)v0;

}

@end
