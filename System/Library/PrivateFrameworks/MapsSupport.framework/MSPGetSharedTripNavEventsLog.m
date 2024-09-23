@implementation MSPGetSharedTripNavEventsLog

void __MSPGetSharedTripNavEventsLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Maps.MSP", "SharedTripNavEvents");
  v1 = (void *)MSPGetSharedTripNavEventsLog_log;
  MSPGetSharedTripNavEventsLog_log = (uint64_t)v0;

}

@end
