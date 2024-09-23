@implementation ANLogHandleUserNotificationsController

void __ANLogHandleUserNotificationsController_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.intercom", "UserNotificationsController");
  v1 = (void *)ANLogHandleUserNotificationsController_logger;
  ANLogHandleUserNotificationsController_logger = (uint64_t)v0;

}

@end
