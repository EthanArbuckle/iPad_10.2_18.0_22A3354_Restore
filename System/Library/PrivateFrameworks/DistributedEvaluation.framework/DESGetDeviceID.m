@implementation DESGetDeviceID

void __DESGetDeviceID_block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = MGCopyAnswer();
  v1 = (void *)DESGetDeviceID_deviceID;
  DESGetDeviceID_deviceID = v0;

}

@end
