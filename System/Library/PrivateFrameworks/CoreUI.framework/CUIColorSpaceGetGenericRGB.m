@implementation CUIColorSpaceGetGenericRGB

CGColorSpaceRef ___CUIColorSpaceGetGenericRGB_block_invoke()
{
  CGColorSpaceRef result;

  result = CGColorSpaceCreateWithName(kCGColorSpaceGenericRGB);
  _CUIColorSpaceGetGenericRGB_sGenericRGBColorSpace = (uint64_t)result;
  return result;
}

@end
