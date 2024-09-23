@implementation ARDeviceHasGPSCapability

void __ARDeviceHasGPSCapability_block_invoke()
{
  id v0;

  v0 = (id)MGCopyAnswer();
  s_deviceHasGPSCapability = objc_msgSend(v0, "BOOLValue");

}

@end
