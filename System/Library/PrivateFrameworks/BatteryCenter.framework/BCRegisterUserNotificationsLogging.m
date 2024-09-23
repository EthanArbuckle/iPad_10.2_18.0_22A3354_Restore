@implementation BCRegisterUserNotificationsLogging

void __BCRegisterUserNotificationsLogging_block_invoke()
{
  os_log_t v0;
  void *v1;
  os_log_t v2;
  void *v3;
  os_log_t v4;
  void *v5;

  v0 = os_log_create((const char *)BCLogSubsystem, "Controller");
  v1 = (void *)BCLogDeviceController;
  BCLogDeviceController = (uint64_t)v0;

  v2 = os_log_create((const char *)BCLogSubsystem, "PowerSourceController");
  v3 = (void *)BCLogPowerSourceController;
  BCLogPowerSourceController = (uint64_t)v2;

  v4 = os_log_create((const char *)BCLogSubsystem, "Widget");
  v5 = (void *)BCLogWidget;
  BCLogWidget = (uint64_t)v4;

}

@end
