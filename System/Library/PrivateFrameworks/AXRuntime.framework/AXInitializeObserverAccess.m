@implementation AXInitializeObserverAccess

CFMutableDictionaryRef ___AXInitializeObserverAccess_block_invoke()
{
  CFMutableDictionaryRef result;

  result = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, 0, MEMORY[0x1E0C9B3A0]);
  ObserverDictionary = (uint64_t)result;
  return result;
}

@end
