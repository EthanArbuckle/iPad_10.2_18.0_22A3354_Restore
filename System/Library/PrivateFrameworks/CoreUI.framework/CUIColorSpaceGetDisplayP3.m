@implementation CUIColorSpaceGetDisplayP3

CGColorSpaceRef ___CUIColorSpaceGetDisplayP3_block_invoke()
{
  CGColorSpaceRef result;

  result = CGColorSpaceCreateWithName(kCGColorSpaceDisplayP3);
  _CUIColorSpaceGetDisplayP3_sDisplayP3ColorSpace = (uint64_t)result;
  return result;
}

@end
