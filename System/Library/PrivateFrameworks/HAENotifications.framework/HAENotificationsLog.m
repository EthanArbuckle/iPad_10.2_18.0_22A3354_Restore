@implementation HAENotificationsLog

void __HAENotificationsLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.coreaudio.haenotifications", "ADAM");
  v1 = (void *)HAENotificationsLog_haeNotificationsLog;
  HAENotificationsLog_haeNotificationsLog = (uint64_t)v0;

}

@end
