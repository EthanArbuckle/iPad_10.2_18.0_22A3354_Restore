@implementation INUserActivityGetSerializationQueue

void __INUserActivityGetSerializationQueue_block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("com.apple.intents.user-activity.serialization", 0);
  v1 = (void *)INUserActivityGetSerializationQueue_queue;
  INUserActivityGetSerializationQueue_queue = (uint64_t)v0;

}

@end
