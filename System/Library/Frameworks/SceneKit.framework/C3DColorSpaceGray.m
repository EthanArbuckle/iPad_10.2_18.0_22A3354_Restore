@implementation C3DColorSpaceGray

CGColorSpaceRef __C3DColorSpaceGray_block_invoke()
{
  CGColorSpaceRef result;

  result = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E0C9D978]);
  C3DColorSpaceGray_kC3DColorSpaceGray = (uint64_t)result;
  return result;
}

@end
