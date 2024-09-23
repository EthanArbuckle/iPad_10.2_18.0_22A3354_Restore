@implementation PatternColorSpace

CGColorSpaceRef __PatternColorSpace_block_invoke()
{
  CGColorSpace *v0;
  CGColorSpaceRef result;

  v0 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E0C9D908]);
  result = CGColorSpaceCreatePattern(v0);
  PatternColorSpace_patternColorSpace = (uint64_t)result;
  return result;
}

@end
