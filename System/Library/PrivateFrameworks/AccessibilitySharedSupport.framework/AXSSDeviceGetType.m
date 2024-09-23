@implementation AXSSDeviceGetType

uint64_t __AXSSDeviceGetType_block_invoke()
{
  uint64_t result;

  result = MGGetSInt32Answer();
  AXSSDeviceGetType__AXSSDeviceType = result;
  return result;
}

@end
