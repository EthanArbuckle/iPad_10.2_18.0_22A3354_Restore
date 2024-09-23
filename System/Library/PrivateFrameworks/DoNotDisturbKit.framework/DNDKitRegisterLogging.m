@implementation DNDKitRegisterLogging

void __DNDKitRegisterLogging_block_invoke()
{
  os_log_t v0;
  void *v1;
  os_log_t v2;
  void *v3;
  os_log_t v4;
  void *v5;

  v0 = os_log_create("com.apple.donotdisturb", "Location");
  v1 = (void *)DNDLogLocation;
  DNDLogLocation = (uint64_t)v0;

  v2 = os_log_create("com.apple.donotdisturb", "Notifications");
  v3 = (void *)DNDLogNotifications;
  DNDLogNotifications = (uint64_t)v2;

  v4 = os_log_create("com.apple.donotdisturb", "ToggleManager");
  v5 = (void *)DNDLogToggleManager;
  DNDLogToggleManager = (uint64_t)v4;

}

@end
