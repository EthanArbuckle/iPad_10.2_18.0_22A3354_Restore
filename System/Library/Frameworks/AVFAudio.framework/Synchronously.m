@implementation Synchronously

void __Synchronously_block_invoke(uint64_t a1)
{
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  dispatch_release(*(dispatch_object_t *)(a1 + 32));
}

@end
