@implementation ANLogHandleSystemNotificationObserver

void __ANLogHandleSystemNotificationObserver_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.intercom", "SystemNotificationObserver");
  v1 = (void *)ANLogHandleSystemNotificationObserver_logger;
  ANLogHandleSystemNotificationObserver_logger = (uint64_t)v0;

}

@end
