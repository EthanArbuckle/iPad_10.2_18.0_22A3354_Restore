@implementation FigBufferedAirPlayOutputProxyCreateFactory

uint64_t __FigBufferedAirPlayOutputProxyCreateFactory_block_invoke(uint64_t a1)
{
  uint64_t result;

  gBaoProxyDictionary = (uint64_t)CFDictionaryCreateMutable(*(CFAllocatorRef *)(a1 + 32), 0, 0, MEMORY[0x1E0C9B3A0]);
  result = FigSimpleMutexCreate();
  gMutex = result;
  return result;
}

@end
