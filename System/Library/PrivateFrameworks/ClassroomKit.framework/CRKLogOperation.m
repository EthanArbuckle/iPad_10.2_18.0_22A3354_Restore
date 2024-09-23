@implementation CRKLogOperation

void ___CRKLogOperation_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.classroom", "Operation");
  v1 = (void *)_CRKLogOperation_logObj;
  _CRKLogOperation_logObj = (uint64_t)v0;

}

void ___CRKLogOperation_block_invoke_0()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.classroom", "Operation");
  v1 = (void *)_CRKLogOperation_logObj_0;
  _CRKLogOperation_logObj_0 = (uint64_t)v0;

}

void ___CRKLogOperation_block_invoke_1()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.classroom", "Operation");
  v1 = (void *)_CRKLogOperation_logObj_1;
  _CRKLogOperation_logObj_1 = (uint64_t)v0;

}

void ___CRKLogOperation_block_invoke_2()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.classroom", "Operation");
  v1 = (void *)_CRKLogOperation_logObj_2;
  _CRKLogOperation_logObj_2 = (uint64_t)v0;

}

@end
