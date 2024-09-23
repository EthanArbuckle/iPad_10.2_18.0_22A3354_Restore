@implementation FigDataQueueRemoteSetupRemoteXPCClientIfNecessary

CFMutableDictionaryRef __FigDataQueueRemoteSetupRemoteXPCClientIfNecessary_block_invoke(uint64_t a1)
{
  CFMutableDictionaryRef result;

  gFigDataQueueRemoteXPCRemoteClientByPIDMutex = FigSimpleMutexCreate();
  result = CFDictionaryCreateMutable(*(CFAllocatorRef *)(a1 + 32), 0, 0, MEMORY[0x1E0C9B3A0]);
  gFigDataQueueRemoteXPCRemoteClientByPIDTable = (uint64_t)result;
  return result;
}

@end
