@implementation DMTLogOperation

void ___DMTLogOperation_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.devicemanagementtools", "Operation");
  v1 = (void *)_DMTLogOperation_logObj;
  _DMTLogOperation_logObj = (uint64_t)v0;

}

void ___DMTLogOperation_block_invoke_0()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.devicemanagementtools", "Operation");
  v1 = (void *)_DMTLogOperation_logObj_0;
  _DMTLogOperation_logObj_0 = (uint64_t)v0;

}

@end
