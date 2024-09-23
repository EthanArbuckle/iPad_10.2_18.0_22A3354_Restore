@implementation CDMDataDispatcherCompletionQueue

+ (id)getDataDispatcherCompletionQueue
{
  if (getDataDispatcherCompletionQueue_once != -1)
    dispatch_once(&getDataDispatcherCompletionQueue_once, &__block_literal_global_4050);
  return (id)getDataDispatcherCompletionQueue_queue;
}

void __68__CDMDataDispatcherCompletionQueue_getDataDispatcherCompletionQueue__block_invoke()
{
  NSObject *v0;
  dispatch_queue_t v1;
  void *v2;
  NSObject *v3;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_BACKGROUND, 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = dispatch_queue_create("com.apple.siri.cdm.CDMDataDispatcherQueue", v0);
  v2 = (void *)getDataDispatcherCompletionQueue_queue;
  getDataDispatcherCompletionQueue_queue = (uint64_t)v1;

}

@end
