@implementation CAFValueMonitorLogging

void __CAFValueMonitorLogging_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.caraccessoryframework", "CAFValueMonitor");
  v1 = (void *)CAFValueMonitorLogging_facility;
  CAFValueMonitorLogging_facility = (uint64_t)v0;

}

@end
