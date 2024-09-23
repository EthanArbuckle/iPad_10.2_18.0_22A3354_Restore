@implementation MSUserNotificationsLog

void __MSUserNotificationsLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.email", "UserNotifications");
  v1 = (void *)MSUserNotificationsLog_os_log;
  MSUserNotificationsLog_os_log = (uint64_t)v0;

}

@end
