@implementation CUIColorGetSRGBBlack

CGColorRef ___CUIColorGetSRGBBlack_block_invoke()
{
  CGColorRef result;

  result = CGColorCreateSRGB(0.0, 0.0, 0.0, 1.0);
  _CUIColorGetSRGBBlack_sBlackColor = (uint64_t)result;
  return result;
}

@end
