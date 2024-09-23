@implementation CarGeneralLogging

void __CarGeneralLogging_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.carkit", "General");
  v1 = (void *)CarGeneralLogging_facility;
  CarGeneralLogging_facility = (uint64_t)v0;

}

@end
