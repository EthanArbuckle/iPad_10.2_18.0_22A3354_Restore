@implementation ARPearlCameraSupported

uint64_t __ARPearlCameraSupported_block_invoke()
{
  uint64_t result;

  result = MGGetBoolAnswer();
  ARPearlCameraSupported_supported = result;
  return result;
}

@end
