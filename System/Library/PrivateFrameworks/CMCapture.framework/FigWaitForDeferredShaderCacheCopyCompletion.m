@implementation FigWaitForDeferredShaderCacheCopyCompletion

intptr_t __FigWaitForDeferredShaderCacheCopyCompletion_block_invoke(uint64_t a1)
{
  NSObject *v2;
  dispatch_time_t v3;
  intptr_t result;

  if (FigInitialiseDeferredShaderCacheCopySemaphore_onceToken != -1)
    dispatch_once(&FigInitialiseDeferredShaderCacheCopySemaphore_onceToken, &__block_literal_global_414);
  v2 = sDeferredShaderCacheCopySemaphore;
  v3 = dispatch_time(0, 180000000000);
  result = dispatch_semaphore_wait(v2, v3);
  if (result)
  {
    fig_log_get_emitter();
    result = FigDebugAssert3();
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = -15420;
  }
  return result;
}

@end
