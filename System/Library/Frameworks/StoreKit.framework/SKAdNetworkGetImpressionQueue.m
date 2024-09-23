@implementation SKAdNetworkGetImpressionQueue

void ___SKAdNetworkGetImpressionQueue_block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;
  NSObject *v3;

  v0 = dispatch_queue_create("com.apple.StoreKit.SKAdNetworkImpressionQueue", 0);
  v1 = (void *)_SKAdNetworkGetImpressionQueue_sSKAdNetworkImpressionQueue;
  _SKAdNetworkGetImpressionQueue_sSKAdNetworkImpressionQueue = (uint64_t)v0;

  v2 = _SKAdNetworkGetImpressionQueue_sSKAdNetworkImpressionQueue;
  dispatch_get_global_queue(25, 0);
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_set_target_queue(v2, v3);

}

@end
