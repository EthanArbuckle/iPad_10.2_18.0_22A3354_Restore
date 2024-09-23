@implementation FigInitialiseDeferredShaderCacheCopySemaphore

dispatch_semaphore_t __FigInitialiseDeferredShaderCacheCopySemaphore_block_invoke()
{
  dispatch_semaphore_t result;

  result = dispatch_semaphore_create(0);
  sDeferredShaderCacheCopySemaphore = (uint64_t)result;
  return result;
}

@end
