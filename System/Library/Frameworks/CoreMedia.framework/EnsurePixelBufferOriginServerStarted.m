@implementation EnsurePixelBufferOriginServerStarted

uint64_t __EnsurePixelBufferOriginServerStarted_block_invoke()
{
  uint64_t result;

  result = FigXPCServerStartWithNewXPCEndpoint((uint64_t)"PixelBufferOriginServer", (uint64_t)&PixelBufferOriginServerStart_callbacks, 0, &gPixelBufferOriginServer);
  EnsurePixelBufferOriginServerStarted_sPixelBufferOriginServerStartError = result;
  return result;
}

@end
