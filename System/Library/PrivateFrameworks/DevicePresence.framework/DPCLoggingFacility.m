@implementation DPCLoggingFacility

void ___DPCLoggingFacility_block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.devicepresence", *(const char **)(a1 + 32));
  v2 = (void *)_DPCLoggingFacility_oslog;
  _DPCLoggingFacility_oslog = (uint64_t)v1;

}

@end
