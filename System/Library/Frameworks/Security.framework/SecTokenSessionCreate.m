@implementation SecTokenSessionCreate

CFMutableDictionaryRef __SecTokenSessionCreate_block_invoke()
{
  CFMutableDictionaryRef result;

  result = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  SecTokenSessionCreate_sharedLAContexts = (uint64_t)result;
  return result;
}

@end
