@implementation SharedICDeviceHardwareHandler

void __SharedICDeviceHardwareHandler_block_invoke()
{
  ICDeviceHardwareHandler *v0;
  void *v1;

  v0 = objc_alloc_init(ICDeviceHardwareHandler);
  v1 = (void *)_gICDeviceHardwareHandler;
  _gICDeviceHardwareHandler = (uint64_t)v0;

}

@end
