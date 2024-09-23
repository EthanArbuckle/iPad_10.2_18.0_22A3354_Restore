@implementation LACLogNotifications

void __LACLogNotifications_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.LocalAuthentication", "Notifications");
  v1 = (void *)LACLogNotifications___logObj;
  LACLogNotifications___logObj = (uint64_t)v0;

}

@end
