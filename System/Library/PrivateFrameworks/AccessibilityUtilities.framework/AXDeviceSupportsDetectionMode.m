@implementation AXDeviceSupportsDetectionMode

uint64_t __AXDeviceSupportsDetectionMode_block_invoke()
{
  uint64_t result;

  result = MGGetBoolAnswer();
  AXDeviceSupportsDetectionMode__AXDeviceSupportsDetectionMode = result;
  return result;
}

@end
