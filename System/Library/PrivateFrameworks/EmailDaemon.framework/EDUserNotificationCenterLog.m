@implementation EDUserNotificationCenterLog

void __EDUserNotificationCenterLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.email", "UserNotificationCenter");
  v1 = (void *)EDUserNotificationCenterLog_log;
  EDUserNotificationCenterLog_log = (uint64_t)v0;

}

@end
