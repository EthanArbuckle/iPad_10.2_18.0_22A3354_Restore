@implementation BLTWorkQueue

void __BLTWorkQueue_block_invoke()
{
  NSObject *v0;
  dispatch_queue_t v1;
  void *v2;
  NSObject *attr;

  dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
  v0 = objc_claimAutoreleasedReturnValue();
  dispatch_queue_attr_make_with_autorelease_frequency(v0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  attr = objc_claimAutoreleasedReturnValue();

  v1 = dispatch_queue_create("bulletindistributord.workq", attr);
  v2 = (void *)BLTWorkQueue___workQueue;
  BLTWorkQueue___workQueue = (uint64_t)v1;

  dispatch_queue_set_specific((dispatch_queue_t)BLTWorkQueue___workQueue, (const void *)BLTWorkQueueKey, (void *)BLTWorkQueueIdentifier, 0);
}

@end
