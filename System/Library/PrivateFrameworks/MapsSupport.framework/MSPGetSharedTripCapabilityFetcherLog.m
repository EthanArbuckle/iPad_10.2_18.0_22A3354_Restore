@implementation MSPGetSharedTripCapabilityFetcherLog

void __MSPGetSharedTripCapabilityFetcherLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Maps.MSP", "SharedTripCapabilityFetcher");
  v1 = (void *)qword_1ED328458;
  qword_1ED328458 = (uint64_t)v0;

}

@end
