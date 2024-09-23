@implementation C3DColorSpaceITUR

CGColorSpaceRef __C3DColorSpaceITUR_709_block_invoke()
{
  CGColorSpaceRef result;

  result = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E0C9D9D0]);
  C3DColorSpaceITUR_709_kC3DColorSpaceITUR_709 = (uint64_t)result;
  return result;
}

@end
