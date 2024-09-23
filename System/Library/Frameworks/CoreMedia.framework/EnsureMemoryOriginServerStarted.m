@implementation EnsureMemoryOriginServerStarted

uint64_t __EnsureMemoryOriginServerStarted_block_invoke()
{
  uint64_t v0;
  uint64_t result;

  v0 = getpid();
  gMemoryOriginServerToken = FigGetUpTimeNanoseconds() & 0x1FFFFFFFFFFLL | (v0 << 47);
  result = FigXPCServerStartWithNewXPCEndpoint((uint64_t)"MemoryOriginServer", (uint64_t)&MemoryOriginServerStart_callbacks, 0, &gMemoryOriginServer);
  EnsureMemoryOriginServerStarted_sMemoryOriginServerStartError = result;
  return result;
}

@end
