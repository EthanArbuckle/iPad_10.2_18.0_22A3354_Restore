@implementation XAMLog

void __XAMLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.dt.automationmode", "Default");
  v1 = (void *)XAMLog_xamLog;
  XAMLog_xamLog = (uint64_t)v0;

}

@end
