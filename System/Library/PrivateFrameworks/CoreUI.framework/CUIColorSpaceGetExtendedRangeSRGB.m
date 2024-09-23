@implementation CUIColorSpaceGetExtendedRangeSRGB

CGColorSpaceRef ___CUIColorSpaceGetExtendedRangeSRGB_block_invoke()
{
  CGColorSpaceRef result;

  result = CGColorSpaceCreateWithName(kCGColorSpaceExtendedSRGB);
  _CUIColorSpaceGetExtendedRangeSRGB_sExtendedRangeSRGBColorSpace = (uint64_t)result;
  return result;
}

@end
