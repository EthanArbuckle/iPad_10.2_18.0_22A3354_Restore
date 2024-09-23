@implementation DisplayP3

CGColorSpaceRef __DisplayP3_block_invoke()
{
  CGColorSpaceRef result;

  result = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E0C9D908]);
  DisplayP3_displayP3ColorSpace = (uint64_t)result;
  return result;
}

@end
