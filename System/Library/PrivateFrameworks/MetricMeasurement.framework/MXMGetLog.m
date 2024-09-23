@implementation MXMGetLog

void ___MXMGetLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.metricmeasurement", "Default");
  v1 = (void *)_MXMGetLog__defaultLogger;
  _MXMGetLog__defaultLogger = (uint64_t)v0;

}

@end
