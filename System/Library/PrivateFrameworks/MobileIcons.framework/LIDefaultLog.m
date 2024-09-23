@implementation LIDefaultLog

void ___LIDefaultLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.iconservices.mobileicons", "default");
  v1 = (void *)_LIDefaultLog_log;
  _LIDefaultLog_log = (uint64_t)v0;

}

void ___LIDefaultLog_block_invoke_0()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.iconservices.mobileicons", "default");
  v1 = (void *)_LIDefaultLog_log_0;
  _LIDefaultLog_log_0 = (uint64_t)v0;

}

@end
