@implementation AXDeviceHasForcePress3dTouch

uint64_t __AXDeviceHasForcePress3dTouch_block_invoke()
{
  uint64_t result;

  result = MGGetBoolAnswer();
  AXDeviceHasForcePress3dTouch_HasForcePress3dTouch = result;
  return result;
}

@end
