@implementation CarSilentModeLogging

void __CarSilentModeLogging_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.carkit", "SilentMode");
  v1 = (void *)CarSilentModeLogging_facility;
  CarSilentModeLogging_facility = (uint64_t)v0;

}

@end
