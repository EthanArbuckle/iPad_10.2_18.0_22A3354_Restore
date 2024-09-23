@implementation C3DColorSpaceExtendedSRGB

CGColorSpaceRef __C3DColorSpaceExtendedSRGB_block_invoke()
{
  CGColorSpaceRef result;

  result = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E0C9D960]);
  C3DColorSpaceExtendedSRGB_kC3DColorSpaceExtendedSRGB = (uint64_t)result;
  return result;
}

@end
