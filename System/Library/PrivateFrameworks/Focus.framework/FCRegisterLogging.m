@implementation FCRegisterLogging

void __FCRegisterLogging_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.focus", "Activities");
  v1 = (void *)FCLogActivities;
  FCLogActivities = (uint64_t)v0;

}

@end
