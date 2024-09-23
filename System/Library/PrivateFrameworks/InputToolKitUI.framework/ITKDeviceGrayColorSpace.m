@implementation ITKDeviceGrayColorSpace

CGColorSpaceRef __ITKDeviceGrayColorSpace_block_invoke()
{
  CGColorSpaceRef result;

  result = CGColorSpaceCreateDeviceGray();
  ITKDeviceGrayColorSpace_sDeviceGrayColorSpace = (uint64_t)result;
  return result;
}

@end
