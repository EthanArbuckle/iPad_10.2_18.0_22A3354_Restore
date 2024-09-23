@implementation INCacheableGetSerializationQueue

void __INCacheableGetSerializationQueue_block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("com.apple.intents.cacheable.serialization", 0);
  v1 = (void *)INCacheableGetSerializationQueue_queue;
  INCacheableGetSerializationQueue_queue = (uint64_t)v0;

}

@end
