@implementation MCLockdownOperationQueue

void __MCLockdownOperationQueue_block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("MC Lockdown Operation Queue", 0);
  v1 = (void *)MCLockdownOperationQueue_queue;
  MCLockdownOperationQueue_queue = (uint64_t)v0;

}

@end
