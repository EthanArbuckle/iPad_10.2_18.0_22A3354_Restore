@implementation TDColorSpaceGetExtendedRangeSRGB

CGColorSpaceRef __TDColorSpaceGetExtendedRangeSRGB_block_invoke()
{
  CGColorSpaceRef result;

  result = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x24BDBF278]);
  TDColorSpaceGetExtendedRangeSRGB_sExtendedRangeSRGBColorSpace = (uint64_t)result;
  return result;
}

@end
