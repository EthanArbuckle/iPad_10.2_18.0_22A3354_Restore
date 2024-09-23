@implementation MSPGetSharedTripStorageLog

void __MSPGetSharedTripStorageLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Maps.MSP", "SharedTripStorage");
  v1 = (void *)MSPGetSharedTripStorageLog_log;
  MSPGetSharedTripStorageLog_log = (uint64_t)v0;

}

@end
