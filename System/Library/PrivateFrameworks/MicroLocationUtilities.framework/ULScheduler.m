@implementation ULScheduler

+ (ULScheduler)immediateScheduler
{
  if (immediateScheduler_ul_once_token_0 != -1)
    dispatch_once(&immediateScheduler_ul_once_token_0, &__block_literal_global_3);
  return (ULScheduler *)(id)immediateScheduler_ul_once_object_0;
}

void __33__ULScheduler_immediateScheduler__block_invoke()
{
  ULImmediateScheduler *v0;
  void *v1;

  v0 = objc_alloc_init(ULImmediateScheduler);
  v1 = (void *)immediateScheduler_ul_once_object_0;
  immediateScheduler_ul_once_object_0 = (uint64_t)v0;

}

+ (ULScheduler)globalAsyncScheduler
{
  if (globalAsyncScheduler_ul_once_token_1 != -1)
    dispatch_once(&globalAsyncScheduler_ul_once_token_1, &__block_literal_global_60);
  return (ULScheduler *)(id)globalAsyncScheduler_ul_once_object_1;
}

void __35__ULScheduler_globalAsyncScheduler__block_invoke()
{
  ULQueueScheduler *v0;
  dispatch_queue_t v1;
  uint64_t v2;
  void *v3;
  NSObject *v4;

  v0 = [ULQueueScheduler alloc];
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v4 = objc_claimAutoreleasedReturnValue();
  v1 = dispatch_queue_create("com.apple.MicroLocationUtilities.ULGlobalAsyncScheduler", v4);
  v2 = -[ULQueueScheduler initWithQueue:](v0, "initWithQueue:", v1);
  v3 = (void *)globalAsyncScheduler_ul_once_object_1;
  globalAsyncScheduler_ul_once_object_1 = v2;

}

+ (id)dispatchQueueSchedulerWithQueue:(id)a3
{
  id v3;
  ULQueueScheduler *v4;

  v3 = a3;
  v4 = -[ULQueueScheduler initWithQueue:]([ULQueueScheduler alloc], "initWithQueue:", v3);

  return v4;
}

@end
