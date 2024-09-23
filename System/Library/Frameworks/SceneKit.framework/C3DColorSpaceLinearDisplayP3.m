@implementation C3DColorSpaceLinearDisplayP3

CGColorSpaceRef __C3DColorSpaceLinearDisplayP3_block_invoke()
{
  CGColorSpaceRef result;

  result = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E0C9D9E8]);
  C3DColorSpaceLinearDisplayP3_kC3DColorSpaceLinearDisplayP3 = (uint64_t)result;
  return result;
}

@end
