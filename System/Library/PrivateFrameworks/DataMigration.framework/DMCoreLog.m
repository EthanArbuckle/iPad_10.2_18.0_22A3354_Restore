@implementation DMCoreLog

void ___DMCoreLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.migration", "core");
  v1 = (void *)_DMCoreLog_log;
  _DMCoreLog_log = (uint64_t)v0;

}

@end
