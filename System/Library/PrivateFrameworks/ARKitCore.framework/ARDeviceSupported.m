@implementation ARDeviceSupported

void __ARDeviceSupported_block_invoke()
{
  id v0;

  v0 = (id)MGCopyAnswer();
  ARDeviceSupported_supported = objc_msgSend(v0, "BOOLValue");

}

@end
