@implementation ITKDeviceRGBColorSpace

CGColorSpaceRef __ITKDeviceRGBColorSpace_block_invoke()
{
  CGColorSpaceRef result;

  result = CGColorSpaceCreateDeviceRGB();
  ITKDeviceRGBColorSpace_sDeviceRGBColorSpace = (uint64_t)result;
  return result;
}

@end
