@implementation ADLogQueue

void ___ADLogQueue_block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;
  NSObject *v3;

  v0 = dispatch_queue_create("com.apple.iad.logging", 0);
  v1 = (void *)_ADLogQueue_loggingQueue;
  _ADLogQueue_loggingQueue = (uint64_t)v0;

  v2 = _ADLogQueue_loggingQueue;
  dispatch_get_global_queue(-32768, 0);
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_set_target_queue(v2, v3);

}

@end
