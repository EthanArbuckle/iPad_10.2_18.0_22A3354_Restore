@implementation DKSyncSerializer

void __35___DKSyncSerializer_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedInstance_dispatcher;
  sharedInstance_dispatcher = v0;

}

void __39___DKSyncSerializer_performAsyncBlock___block_invoke(uint64_t a1)
{
  __DKSYNCDISPATCHER_IS_CALLING_ASYNC_OUT_TO_A_BLOCK__(*(void **)(a1 + 32));
}

void __38___DKSyncSerializer_performSyncBlock___block_invoke(uint64_t a1)
{
  __DKSYNCDISPATCHER_IS_CALLING_SYNC_OUT_TO_A_BLOCK__(*(void **)(a1 + 32));
}

void __40___DKSyncSerializer_performAfter_block___block_invoke(uint64_t a1)
{
  __DKSYNCDISPATCHER_IS_CALLING_AFTER_OUT_TO_A_BLOCK__(*(void **)(a1 + 32));
}

@end
