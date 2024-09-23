@implementation EQKitUtilGetDeviceColorSpace

CGColorSpaceRef __EQKitUtilGetDeviceColorSpace_block_invoke()
{
  CGColorSpaceRef result;

  result = CGColorSpaceCreateDeviceRGB();
  EQKitUtilGetDeviceColorSpace::sDeviceColor = (uint64_t)result;
  return result;
}

@end
