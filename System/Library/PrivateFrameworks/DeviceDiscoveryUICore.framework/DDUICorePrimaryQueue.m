@implementation DDUICorePrimaryQueue

void __DDUICorePrimaryQueue_block_invoke()
{
  NSObject *v0;
  dispatch_queue_t v1;
  void *v2;
  NSObject *attr;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  attr = objc_claimAutoreleasedReturnValue();
  dispatch_get_global_queue(25, 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = dispatch_queue_create_with_target_V2("com.apple.DeviceDiscoveryUI.queue", attr, v0);
  v2 = (void *)DDUICorePrimaryQueue_primaryQueue;
  DDUICorePrimaryQueue_primaryQueue = (uint64_t)v1;

}

@end
