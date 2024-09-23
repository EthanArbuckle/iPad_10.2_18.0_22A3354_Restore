@implementation CRKLogSettings

void ___CRKLogSettings_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.classroom", "Settings");
  v1 = (void *)_CRKLogSettings_logObj;
  _CRKLogSettings_logObj = (uint64_t)v0;

}

void ___CRKLogSettings_block_invoke_0()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.classroom", "Settings");
  v1 = (void *)_CRKLogSettings_logObj_0;
  _CRKLogSettings_logObj_0 = (uint64_t)v0;

}

@end
