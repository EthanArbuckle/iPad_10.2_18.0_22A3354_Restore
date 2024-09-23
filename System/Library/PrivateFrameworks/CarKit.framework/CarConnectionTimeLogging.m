@implementation CarConnectionTimeLogging

void __CarConnectionTimeLogging_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.carkit", "ConnectionTime");
  v1 = (void *)CarConnectionTimeLogging_facility;
  CarConnectionTimeLogging_facility = (uint64_t)v0;

}

@end
