@implementation GrayColorSpace

CGColorSpaceRef __GrayColorSpace_block_invoke()
{
  CGColorSpaceRef result;

  result = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E0C9D930]);
  GrayColorSpace___GrayColorSpace = (uint64_t)result;
  return result;
}

@end
