@implementation C3DColorSpaceExtendedLinearSRGB

CGColorSpaceRef __C3DColorSpaceExtendedLinearSRGB_block_invoke()
{
  CGColorSpaceRef result;

  result = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E0C9D958]);
  C3DColorSpaceExtendedLinearSRGB_kC3DColorSpaceExtendedLinearSRGB = (uint64_t)result;
  return result;
}

@end
