@implementation APSCFArrayGetEmpty

CFArrayRef __APSCFArrayGetEmpty_block_invoke()
{
  CFArrayRef result;

  result = CFArrayCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, 0, MEMORY[0x1E0C9B378]);
  APSCFArrayGetEmpty_sAPSCFArrayEmpty = (uint64_t)result;
  return result;
}

@end
