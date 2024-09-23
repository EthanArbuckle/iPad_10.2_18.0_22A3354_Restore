@implementation MCMSharedDeathrowQueue

void __MCMSharedDeathrowQueue_block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("com.apple.containermanagerd.deathrow", v2);
  v1 = (void *)MCMSharedDeathrowQueue_queue;
  MCMSharedDeathrowQueue_queue = (uint64_t)v0;

}

@end
