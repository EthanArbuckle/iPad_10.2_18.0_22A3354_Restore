@implementation ARPHomeControlLog

void __ARPHomeControlLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.AirPlayRoutePrediction", "homeControl");
  v1 = (void *)ARPHomeControlLog_log;
  ARPHomeControlLog_log = (uint64_t)v0;

}

@end
