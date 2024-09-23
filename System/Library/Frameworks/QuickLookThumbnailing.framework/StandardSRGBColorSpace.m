@implementation StandardSRGBColorSpace

CGColorSpaceRef __StandardSRGBColorSpace_block_invoke()
{
  CGColorSpaceRef result;

  result = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E0C9DA10]);
  StandardSRGBColorSpace_standardSRGBColorSpace = (uint64_t)result;
  return result;
}

@end
