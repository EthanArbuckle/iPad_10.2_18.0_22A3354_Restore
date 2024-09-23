@implementation ExtendedSRGBColorSpace

CGColorSpaceRef __ExtendedSRGBColorSpace_block_invoke()
{
  CGColorSpaceRef result;

  result = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E0C9D960]);
  ExtendedSRGBColorSpace_extendedSRGBColorSpace = (uint64_t)result;
  return result;
}

@end
