@implementation DKPluggedInMonitorLog

void ___DKPluggedInMonitorLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.coreduet.monitors", "_DKPluggedInMonitor");
  v1 = (void *)_DKPluggedInMonitorLog__pluggedInLog;
  _DKPluggedInMonitorLog__pluggedInLog = (uint64_t)v0;

}

@end
