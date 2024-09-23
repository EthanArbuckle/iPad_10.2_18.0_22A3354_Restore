@implementation FigRemote

void __FigRemote_ReleaseAndClearLocalCAContextAndShutDownCAServer_block_invoke(uint64_t a1)
{
  dispatch_time_t v2;

  v2 = dispatch_time(0, 100000000);
  dispatch_after(v2, *(dispatch_queue_t *)(a1 + 32), &__block_literal_global_68);
}

uint64_t __FigRemote_ReleaseAndClearLocalCAContextAndShutDownCAServer_block_invoke_2()
{
  uint64_t result;

  result = FigAtomicDecrement32();
  if ((int)result <= 0)
    JUMPOUT(0x194029714);
  return result;
}

@end
