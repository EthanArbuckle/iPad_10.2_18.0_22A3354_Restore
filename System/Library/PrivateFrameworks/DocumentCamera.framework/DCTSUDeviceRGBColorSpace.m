@implementation DCTSUDeviceRGBColorSpace

CGColorSpaceRef __DCTSUDeviceRGBColorSpace_block_invoke()
{
  CGColorSpaceRef result;

  result = CGColorSpaceCreateDeviceRGB();
  DCTSUDeviceRGBColorSpace_sDeviceRGBColorSpace = (uint64_t)result;
  return result;
}

@end
