@implementation AXDeviceHasPearl

uint64_t __AXDeviceHasPearl_block_invoke()
{
  uint64_t result;

  result = MGGetBoolAnswer();
  AXDeviceHasPearl_hasPearl = result;
  return result;
}

@end
