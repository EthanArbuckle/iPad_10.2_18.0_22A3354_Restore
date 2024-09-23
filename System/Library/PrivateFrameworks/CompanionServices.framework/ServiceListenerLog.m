@implementation ServiceListenerLog

void __ServiceListenerLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.CompanionServices", "ServiceListener");
  v1 = (void *)ServiceListenerLog_log;
  ServiceListenerLog_log = (uint64_t)v0;

}

@end
