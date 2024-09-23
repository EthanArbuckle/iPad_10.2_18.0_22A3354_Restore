@implementation GetGenericRGBColorSpace

CGColorSpaceRef ___GetGenericRGBColorSpace_block_invoke()
{
  CGColorSpaceRef result;

  result = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E0C9D988]);
  _GetGenericRGBColorSpace_genericRGBColorSpace = (uint64_t)result;
  return result;
}

@end
