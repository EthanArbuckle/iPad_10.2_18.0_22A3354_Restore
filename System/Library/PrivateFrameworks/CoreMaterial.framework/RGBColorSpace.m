@implementation RGBColorSpace

CGColorSpaceRef __RGBColorSpace_block_invoke()
{
  CGColorSpaceRef result;

  result = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E0C9D960]);
  RGBColorSpace___RGBColorSpace = (uint64_t)result;
  return result;
}

@end
