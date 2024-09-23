@implementation GKObserverMutationQueueCreatingIfNecessary

void __GKObserverMutationQueueCreatingIfNecessary_block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("com.apple.gamekit.observerMutationQueue", 0);
  v1 = (void *)GKObserverMutationQueue;
  GKObserverMutationQueue = (uint64_t)v0;

}

@end
