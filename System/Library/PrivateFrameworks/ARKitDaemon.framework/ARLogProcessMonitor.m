@implementation ARLogProcessMonitor

void ___ARLogProcessMonitor_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.ARKit", "ProcessMonitor");
  v1 = (void *)_ARLogProcessMonitor_logObj;
  _ARLogProcessMonitor_logObj = (uint64_t)v0;

}

@end
