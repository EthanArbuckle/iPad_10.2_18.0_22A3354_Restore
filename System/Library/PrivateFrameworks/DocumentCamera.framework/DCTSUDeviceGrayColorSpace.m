@implementation DCTSUDeviceGrayColorSpace

CGColorSpaceRef __DCTSUDeviceGrayColorSpace_block_invoke()
{
  CGColorSpaceRef result;

  result = CGColorSpaceCreateDeviceGray();
  DCTSUDeviceGrayColorSpace_sDeviceGrayColorSpace = (uint64_t)result;
  return result;
}

@end
