@implementation AMUILogSwitcher

void __AMUILogSwitcher_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.ambient.AmbientUI", "Switcher");
  v1 = (void *)AMUILogSwitcher___logObj;
  AMUILogSwitcher___logObj = (uint64_t)v0;

}

@end
