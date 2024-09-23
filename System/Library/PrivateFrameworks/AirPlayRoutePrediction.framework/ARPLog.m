@implementation ARPLog

void __ARPLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.AirPlayRoutePrediction", "general");
  v1 = (void *)ARPLog_log;
  ARPLog_log = (uint64_t)v0;

}

@end
