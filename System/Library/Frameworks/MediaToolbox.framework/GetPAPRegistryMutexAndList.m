@implementation GetPAPRegistryMutexAndList

CFMutableDictionaryRef __pap_GetPAPRegistryMutexAndList_block_invoke()
{
  CFMutableDictionaryRef result;

  pap_GetPAPRegistryMutexAndList_sListLock = FigSimpleMutexCreate();
  result = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  pap_GetPAPRegistryMutexAndList_sList = (uint64_t)result;
  return result;
}

@end
