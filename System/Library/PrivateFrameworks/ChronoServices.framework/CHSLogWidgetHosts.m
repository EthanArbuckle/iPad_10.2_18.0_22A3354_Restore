@implementation CHSLogWidgetHosts

void __CHSLogWidgetHosts_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.chrono", "WidgetHosts");
  v1 = (void *)CHSLogWidgetHosts___logObj;
  CHSLogWidgetHosts___logObj = (uint64_t)v0;

}

@end
