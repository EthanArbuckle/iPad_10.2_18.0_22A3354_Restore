@implementation AADeviceListLogSystem

void ___AADeviceListLogSystem_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.appleaccount", "deviceList");
  v1 = (void *)_AADeviceListLogSystem_log;
  _AADeviceListLogSystem_log = (uint64_t)v0;

}

@end
