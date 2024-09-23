@implementation DKUDeviceRGBColorSpace

CGColorSpaceRef __DKUDeviceRGBColorSpace_block_invoke()
{
  CGColorSpaceRef result;

  result = CGColorSpaceCreateDeviceRGB();
  _MergedGlobals_147 = (uint64_t)result;
  return result;
}

@end
