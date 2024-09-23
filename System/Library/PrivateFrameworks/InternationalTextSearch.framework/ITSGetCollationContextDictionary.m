@implementation ITSGetCollationContextDictionary

CFMutableDictionaryRef __ITSGetCollationContextDictionary_block_invoke()
{
  CFMutableDictionaryRef result;

  result = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, 0, 0);
  ITSGetCollationContextDictionary_collalationContextDict = (uint64_t)result;
  return result;
}

@end
