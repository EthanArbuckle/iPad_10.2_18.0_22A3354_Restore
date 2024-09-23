@implementation CUIColorSpaceGetExtendedLinearSRGB

CGColorSpaceRef ___CUIColorSpaceGetExtendedLinearSRGB_block_invoke()
{
  CGColorSpaceRef result;

  result = CGColorSpaceCreateWithName(kCGColorSpaceExtendedLinearSRGB);
  _CUIColorSpaceGetExtendedLinearSRGB_sExtendedLinearSRGBColorSpace = (uint64_t)result;
  return result;
}

@end
