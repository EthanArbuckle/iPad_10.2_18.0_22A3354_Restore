@implementation BSLogPowerMonitor

void __BSLogPowerMonitor_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.BaseBoard", "PowerMonitor");
  v1 = (void *)BSLogPowerMonitor___logObj;
  BSLogPowerMonitor___logObj = (uint64_t)v0;

}

@end
