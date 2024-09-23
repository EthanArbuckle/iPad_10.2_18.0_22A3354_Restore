@implementation CNScheduler

+ (id)serialDispatchQueueSchedulerWithName:(id)a3
{
  const char *v3;
  NSObject *v4;
  NSObject *v5;
  dispatch_queue_t v6;
  _CNQueueScheduler *v7;

  v3 = (const char *)objc_msgSend(objc_retainAutorelease(a3), "UTF8String");
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_queue_attr_make_with_qos_class(v4, QOS_CLASS_DEFAULT, 0);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = dispatch_queue_create(v3, v5);

  v7 = -[_CNQueueScheduler initWithQueue:]([_CNQueueScheduler alloc], "initWithQueue:", v6);
  return v7;
}

+ (id)synchronousSerialDispatchQueueWithName:(id)a3
{
  const char *v3;
  NSObject *v4;
  NSObject *v5;
  dispatch_queue_t v6;
  _CNSynchronousQueueScheduler *v7;

  v3 = (const char *)objc_msgSend(objc_retainAutorelease(a3), "UTF8String");
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_queue_attr_make_with_qos_class(v4, QOS_CLASS_DEFAULT, 0);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = dispatch_queue_create(v3, v5);

  v7 = -[_CNSynchronousQueueScheduler initWithQueue:]([_CNSynchronousQueueScheduler alloc], "initWithQueue:", v6);
  return v7;
}

+ (CNScheduler)immediateScheduler
{
  if (immediateScheduler_cn_once_token_1 != -1)
    dispatch_once(&immediateScheduler_cn_once_token_1, &__block_literal_global_25);
  return (CNScheduler *)(id)immediateScheduler_cn_once_object_1;
}

void __35__CNScheduler_globalAsyncScheduler__block_invoke()
{
  _CNQueueScheduler *v0;
  void *v1;

  v0 = objc_alloc_init(_CNQueueScheduler);
  v1 = (void *)globalAsyncScheduler_cn_once_object_2;
  globalAsyncScheduler_cn_once_object_2 = (uint64_t)v0;

}

void __33__CNScheduler_immediateScheduler__block_invoke()
{
  _CNImmediateScheduler *v0;
  void *v1;

  v0 = objc_alloc_init(_CNImmediateScheduler);
  v1 = (void *)immediateScheduler_cn_once_object_1;
  immediateScheduler_cn_once_object_1 = (uint64_t)v0;

}

void __30__CNScheduler_inlineScheduler__block_invoke()
{
  _CNInlineScheduler *v0;
  void *v1;

  v0 = objc_alloc_init(_CNInlineScheduler);
  v1 = (void *)inlineScheduler_cn_once_object_5;
  inlineScheduler_cn_once_object_5 = (uint64_t)v0;

}

void __34__CNScheduler_mainThreadScheduler__block_invoke()
{
  _CNMainThreadScheduler *v0;
  void *v1;

  v0 = objc_alloc_init(_CNMainThreadScheduler);
  v1 = (void *)mainThreadScheduler_cn_once_object_3;
  mainThreadScheduler_cn_once_object_3 = (uint64_t)v0;

}

+ (CNScheduler)inlineScheduler
{
  if (inlineScheduler_cn_once_token_5 != -1)
    dispatch_once(&inlineScheduler_cn_once_token_5, &__block_literal_global_7);
  return (CNScheduler *)(id)inlineScheduler_cn_once_object_5;
}

+ (CNScheduler)mainThreadScheduler
{
  if (mainThreadScheduler_cn_once_token_3 != -1)
    dispatch_once(&mainThreadScheduler_cn_once_token_3, &__block_literal_global_3_2);
  return (CNScheduler *)(id)mainThreadScheduler_cn_once_object_3;
}

+ (CNScheduler)globalAsyncScheduler
{
  if (globalAsyncScheduler_cn_once_token_2 != -1)
    dispatch_once(&globalAsyncScheduler_cn_once_token_2, &__block_literal_global_1_0);
  return (CNScheduler *)(id)globalAsyncScheduler_cn_once_object_2;
}

+ (id)operationQueueSchedulerWithMaxConcurrentOperationCount:(int64_t)a3
{
  return -[_CNOperationQueueScheduler initWithMaxConcurrentOperationCount:]([_CNOperationQueueScheduler alloc], "initWithMaxConcurrentOperationCount:", a3);
}

+ (CNScheduler)offMainThreadScheduler
{
  if (offMainThreadScheduler_cn_once_token_4 != -1)
    dispatch_once(&offMainThreadScheduler_cn_once_token_4, &__block_literal_global_5_0);
  return (CNScheduler *)(id)offMainThreadScheduler_cn_once_object_4;
}

void __37__CNScheduler_offMainThreadScheduler__block_invoke()
{
  _CNOffMainThreadScheduler *v0;
  void *v1;

  v0 = objc_alloc_init(_CNOffMainThreadScheduler);
  v1 = (void *)offMainThreadScheduler_cn_once_object_4;
  offMainThreadScheduler_cn_once_object_4 = (uint64_t)v0;

}

+ (id)offMainThreadSchedulerWithBackgroundScheduler:(id)a3
{
  id v3;
  _CNOffMainThreadScheduler *v4;

  v3 = a3;
  v4 = -[_CNOffMainThreadScheduler initWithBackgroundScheduler:]([_CNOffMainThreadScheduler alloc], "initWithBackgroundScheduler:", v3);

  return v4;
}

@end
