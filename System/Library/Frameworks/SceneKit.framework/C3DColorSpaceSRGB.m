@implementation C3DColorSpaceSRGB

CGColorSpaceRef __C3DColorSpaceSRGB_block_invoke()
{
  CGColorSpaceRef result;

  result = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E0C9DA10]);
  C3DColorSpaceSRGB_kC3DColorSpaceSRGB = (uint64_t)result;
  return result;
}

@end
