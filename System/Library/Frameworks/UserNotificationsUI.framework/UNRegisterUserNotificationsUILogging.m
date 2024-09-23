@implementation UNRegisterUserNotificationsUILogging

void __UNRegisterUserNotificationsUILogging_block_invoke()
{
  os_log_t v0;
  void *v1;
  os_log_t v2;
  void *v3;
  os_log_t v4;
  void *v5;

  v0 = os_log_create("com.apple.UserNotificationsUI", "Extensions");
  v1 = (void *)UNLogExtensions;
  UNLogExtensions = (uint64_t)v0;

  v2 = os_log_create("com.apple.UserNotificationsUI", "Extensions-host");
  v3 = (void *)UNLogExtensionsHost;
  UNLogExtensionsHost = (uint64_t)v2;

  v4 = os_log_create("com.apple.UserNotificationsUI", "Extensions-service");
  v5 = (void *)UNLogExtensionsService;
  UNLogExtensionsService = (uint64_t)v4;

}

@end
