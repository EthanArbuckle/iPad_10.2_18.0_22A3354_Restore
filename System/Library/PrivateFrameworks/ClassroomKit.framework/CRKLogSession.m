@implementation CRKLogSession

void ___CRKLogSession_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.classroom", "Session");
  v1 = (void *)_CRKLogSession_logObj;
  _CRKLogSession_logObj = (uint64_t)v0;

}

void ___CRKLogSession_block_invoke_0()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.classroom", "Session");
  v1 = (void *)_CRKLogSession_logObj_0;
  _CRKLogSession_logObj_0 = (uint64_t)v0;

}

@end
