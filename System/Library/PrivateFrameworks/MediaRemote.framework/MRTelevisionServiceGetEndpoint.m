@implementation MRTelevisionServiceGetEndpoint

void __MRTelevisionServiceGetEndpoint_block_invoke()
{
  NSObject *v0;
  dispatch_queue_t v1;
  void *v2;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = dispatch_queue_create("com.apple.mediaremote.televisionService", v0);
  v2 = (void *)MRTelevisionServiceGetEndpoint___queue;
  MRTelevisionServiceGetEndpoint___queue = (uint64_t)v1;

  MRTelevisionServiceSetEndpoint((uint64_t)&MRTelevisionServiceGetEndpoint___endpoint, (void *)MRTelevisionServiceGetEndpoint___queue);
}

@end
