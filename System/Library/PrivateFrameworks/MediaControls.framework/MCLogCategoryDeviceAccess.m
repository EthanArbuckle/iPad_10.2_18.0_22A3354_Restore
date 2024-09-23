@implementation MCLogCategoryDeviceAccess

void __MCLogCategoryDeviceAccess_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.amp.mediacontrols", "DeviceAccess");
  v1 = (void *)MCLogCategoryDeviceAccess__log;
  MCLogCategoryDeviceAccess__log = (uint64_t)v0;

}

@end
