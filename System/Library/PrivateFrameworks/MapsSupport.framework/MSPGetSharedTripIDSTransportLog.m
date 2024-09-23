@implementation MSPGetSharedTripIDSTransportLog

void __MSPGetSharedTripIDSTransportLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Maps.MSP", "SharedTripIDSTransport");
  v1 = (void *)MSPGetSharedTripIDSTransportLog_log;
  MSPGetSharedTripIDSTransportLog_log = (uint64_t)v0;

}

@end
