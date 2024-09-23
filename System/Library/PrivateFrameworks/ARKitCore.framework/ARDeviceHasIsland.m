@implementation ARDeviceHasIsland

uint64_t __ARDeviceHasIsland_block_invoke()
{
  uint64_t result;

  result = MGGetBoolAnswer();
  s_deviceHasIsland = result;
  return result;
}

@end
