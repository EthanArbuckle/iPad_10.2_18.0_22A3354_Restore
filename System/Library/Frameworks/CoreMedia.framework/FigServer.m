@implementation FigServer

void __FigServer_InitializeWithEnvironment_block_invoke(uint64_t a1)
{
  unsigned int v2;

  if (checkFigRemotePrivTrace_onceToken != -1)
    dispatch_once(&checkFigRemotePrivTrace_onceToken, &__block_literal_global_38);
  v2 = *(_DWORD *)(a1 + 32);
  if (v2 >= 0xA)
    v2 = 10;
  gServerEnvironment = v2;
}

dispatch_queue_t __FigServer_RememberProcessInfoForAFewSeconds_block_invoke()
{
  dispatch_queue_t result;

  result = dispatch_queue_create("com.apple.coremedia.retain-process-info", 0);
  FigServer_RememberProcessInfoForAFewSeconds_queue = (uint64_t)result;
  return result;
}

void __FigServer_RememberProcessInfoForAFewSeconds_block_invoke_2(uint64_t a1)
{
  const void *v1;

  v1 = *(const void **)(a1 + 32);
  if (v1)
    CFRelease(v1);
}

@end
