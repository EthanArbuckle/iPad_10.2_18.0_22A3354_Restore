@implementation AXDeviceSupportsLaneChange

uint64_t __AXDeviceSupportsLaneChange_block_invoke()
{
  uint64_t result;

  result = MGGetBoolAnswer();
  AXDeviceSupportsLaneChange__AXDeviceSupportsLaneChange = result;
  return result;
}

@end
