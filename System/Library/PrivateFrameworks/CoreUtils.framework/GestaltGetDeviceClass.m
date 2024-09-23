@implementation GestaltGetDeviceClass

uint64_t __GestaltGetDeviceClass_block_invoke()
{
  uint64_t result;

  result = MGGetSInt32Answer();
  GestaltGetDeviceClass_deviceClass = result;
  return result;
}

@end
