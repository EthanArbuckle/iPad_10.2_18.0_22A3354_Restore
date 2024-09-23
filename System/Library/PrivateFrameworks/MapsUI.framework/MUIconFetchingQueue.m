@implementation MUIconFetchingQueue

void ___MUIconFetchingQueue_block_invoke()
{
  uint64_t v0;
  void *v1;

  geo_dispatch_queue_create_with_qos();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_MergedGlobals_131;
  _MergedGlobals_131 = v0;

}

@end
