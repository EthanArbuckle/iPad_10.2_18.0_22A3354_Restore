@implementation MSPGetSharedTripLog

void __MSPGetSharedTripLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Maps.MSP", "SharedTrip");
  v1 = (void *)MSPGetSharedTripLog_log;
  MSPGetSharedTripLog_log = (uint64_t)v0;

}

@end
