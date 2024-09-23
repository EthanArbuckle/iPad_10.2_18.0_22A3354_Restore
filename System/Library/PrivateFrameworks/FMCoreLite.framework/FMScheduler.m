@implementation FMScheduler

id __33__FMScheduler_immediateScheduler__block_invoke()
{
  if (_block_invoke_fm_once_token_0 != -1)
    dispatch_once(&_block_invoke_fm_once_token_0, &__block_literal_global_2);
  return (id)_block_invoke_fm_once_object_0;
}

void __33__FMScheduler_immediateScheduler__block_invoke_2()
{
  _FMImmediateScheduler *v0;
  void *v1;

  v0 = objc_alloc_init(_FMImmediateScheduler);
  v1 = (void *)_block_invoke_fm_once_object_0;
  _block_invoke_fm_once_object_0 = (uint64_t)v0;

}

id __35__FMScheduler_globalAsyncScheduler__block_invoke()
{
  if (_block_invoke_2_fm_once_token_1 != -1)
    dispatch_once(&_block_invoke_2_fm_once_token_1, &__block_literal_global_4);
  return (id)_block_invoke_2_fm_once_object_1;
}

void __35__FMScheduler_globalAsyncScheduler__block_invoke_2()
{
  _FMQueueScheduler *v0;
  uint64_t v1;
  void *v2;
  id v3;

  v0 = [_FMQueueScheduler alloc];
  dispatch_get_global_queue(21, 0);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v1 = -[_FMQueueScheduler initWithQueue:](v0, "initWithQueue:", v3);
  v2 = (void *)_block_invoke_2_fm_once_object_1;
  _block_invoke_2_fm_once_object_1 = v1;

}

id __34__FMScheduler_mainThreadScheduler__block_invoke()
{
  if (_block_invoke_3_fm_once_token_2 != -1)
    dispatch_once(&_block_invoke_3_fm_once_token_2, &__block_literal_global_7_0);
  return (id)_block_invoke_3_fm_once_object_2;
}

void __34__FMScheduler_mainThreadScheduler__block_invoke_2()
{
  _FMMainThreadScheduler *v0;
  void *v1;

  v0 = objc_alloc_init(_FMMainThreadScheduler);
  v1 = (void *)_block_invoke_3_fm_once_object_2;
  _block_invoke_3_fm_once_object_2 = (uint64_t)v0;

}

+ (FMScheduler)schedulerWithDispatchQueue:(id)a3
{
  id v3;
  _FMQueueScheduler *v4;

  v3 = a3;
  v4 = -[_FMQueueScheduler initWithQueue:]([_FMQueueScheduler alloc], "initWithQueue:", v3);

  return (FMScheduler *)v4;
}

+ (id)serialDispatchQueueSchedulerWithName:(id)a3
{
  const char *v3;
  NSObject *v4;
  dispatch_queue_t v5;
  _FMQueueScheduler *v6;

  v3 = (const char *)objc_msgSend(objc_retainAutorelease(a3), "UTF8String");
  dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_DEFAULT, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = dispatch_queue_create(v3, v4);

  v6 = -[_FMQueueScheduler initWithQueue:]([_FMQueueScheduler alloc], "initWithQueue:", v5);
  return v6;
}

+ (id)operationQueueSchedulerWithMaxConcurrentOperationCount:(int64_t)a3
{
  return -[_FMOperationQueueScheduler initWithMaxConcurrentOperationCount:]([_FMOperationQueueScheduler alloc], "initWithMaxConcurrentOperationCount:", a3);
}

@end
