@implementation DILogHandleDeviceManager

void __DILogHandleDeviceManager_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.dropin", "DeviceManager");
  v1 = (void *)DILogHandleDeviceManager_logger;
  DILogHandleDeviceManager_logger = (uint64_t)v0;

}

@end
