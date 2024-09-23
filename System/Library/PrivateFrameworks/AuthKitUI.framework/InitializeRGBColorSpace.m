@implementation InitializeRGBColorSpace

CGColorSpaceRef ___InitializeRGBColorSpace_block_invoke()
{
  CGColorSpaceRef result;

  result = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E0C9DA10]);
  StandardRGB = (uint64_t)result;
  return result;
}

@end
