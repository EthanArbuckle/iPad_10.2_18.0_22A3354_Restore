@implementation C3DColorSpaceLinearSRGB

CGColorSpaceRef __C3DColorSpaceLinearSRGB_block_invoke()
{
  CGColorSpaceRef result;

  result = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E0C9DA00]);
  C3DColorSpaceLinearSRGB_kC3DColorSpaceLinearSRGB = (uint64_t)result;
  return result;
}

@end
