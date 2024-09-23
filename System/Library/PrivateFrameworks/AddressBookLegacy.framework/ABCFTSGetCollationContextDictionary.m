@implementation ABCFTSGetCollationContextDictionary

CFMutableDictionaryRef __ABCFTSGetCollationContextDictionary_block_invoke()
{
  CFMutableDictionaryRef result;

  result = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, 0, 0);
  ABCFTSGetCollationContextDictionary_collalationContextDict = (uint64_t)result;
  return result;
}

@end
