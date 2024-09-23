@implementation FigCustomURLHandlerRemoteClientCopyExistingOrCreateIfNeccessaryWithXPCEndpoint

uint64_t __FigCustomURLHandlerRemoteClientCopyExistingOrCreateIfNeccessaryWithXPCEndpoint_block_invoke()
{
  gFigCustomURLRemoteXPCRemoteClientByPIDMutex = (uint64_t)FigSimpleMutexCreate();
  return FigCFWeakReferenceTableCreate((const __CFAllocator *)*MEMORY[0x1E0C9AE00], 1, &gFigCustomURLRemoteXPCRemoteClientByPIDTable);
}

@end
