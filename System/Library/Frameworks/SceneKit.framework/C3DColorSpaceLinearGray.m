@implementation C3DColorSpaceLinearGray

CGColorSpaceRef __C3DColorSpaceLinearGray_block_invoke()
{
  CGColorSpaceRef result;

  result = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E0C9D9F0]);
  C3DColorSpaceLinearGray_kC3DColorSpaceLinearGray = (uint64_t)result;
  return result;
}

@end
