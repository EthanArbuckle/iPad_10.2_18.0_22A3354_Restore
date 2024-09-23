@implementation STSInitializeFlavorCreationState

CFMutableDictionaryRef __STSInitializeFlavorCreationState_block_invoke()
{
  CFMutableDictionaryRef result;

  sFigSTSFlavorCreationState_0 = FigSimpleMutexCreate();
  result = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B390], 0);
  sFigSTSFlavorCreationState_1 = (uint64_t)result;
  return result;
}

@end
