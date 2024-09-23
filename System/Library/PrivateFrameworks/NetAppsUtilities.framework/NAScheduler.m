@implementation NAScheduler

id __33__NAScheduler_immediateScheduler__block_invoke()
{
  if (_block_invoke_na_once_token_0 != -1)
    dispatch_once(&_block_invoke_na_once_token_0, &__block_literal_global_2);
  return (id)_block_invoke_na_once_object_0;
}

id __34__NAScheduler_mainThreadScheduler__block_invoke()
{
  if (_block_invoke_3_na_once_token_2 != -1)
    dispatch_once(&_block_invoke_3_na_once_token_2, &__block_literal_global_7);
  return (id)_block_invoke_3_na_once_object_2;
}

void __35__NAScheduler_globalAsyncScheduler__block_invoke_2()
{
  _NAQueueScheduler *v0;
  uint64_t v1;
  void *v2;
  id v3;

  v0 = [_NAQueueScheduler alloc];
  dispatch_get_global_queue(21, 0);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v1 = -[_NAQueueScheduler initWithQueue:](v0, "initWithQueue:", v3);
  v2 = (void *)_block_invoke_2_na_once_object_1;
  _block_invoke_2_na_once_object_1 = v1;

}

+ (id)serialDispatchQueueSchedulerWithName:(id)a3
{
  const char *v3;
  NSObject *v4;
  dispatch_queue_t v5;
  _NAQueueScheduler *v6;

  v3 = (const char *)objc_msgSend(objc_retainAutorelease(a3), "UTF8String");
  dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_DEFAULT, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = dispatch_queue_create(v3, v4);

  v6 = -[_NAQueueScheduler initWithQueue:]([_NAQueueScheduler alloc], "initWithQueue:", v5);
  return v6;
}

+ (NAScheduler)schedulerWithDispatchQueue:(id)a3
{
  id v3;
  _NAQueueScheduler *v4;

  v3 = a3;
  v4 = -[_NAQueueScheduler initWithQueue:]([_NAQueueScheduler alloc], "initWithQueue:", v3);

  return (NAScheduler *)v4;
}

id __35__NAScheduler_globalAsyncScheduler__block_invoke()
{
  if (_block_invoke_2_na_once_token_1 != -1)
    dispatch_once(&_block_invoke_2_na_once_token_1, &__block_literal_global_4);
  return (id)_block_invoke_2_na_once_object_1;
}

void __33__NAScheduler_immediateScheduler__block_invoke_2()
{
  _NAImmediateScheduler *v0;
  void *v1;

  v0 = objc_alloc_init(_NAImmediateScheduler);
  v1 = (void *)_block_invoke_na_once_object_0;
  _block_invoke_na_once_object_0 = (uint64_t)v0;

}

void __34__NAScheduler_mainThreadScheduler__block_invoke_2()
{
  _NAMainThreadScheduler *v0;
  void *v1;

  v0 = objc_alloc_init(_NAMainThreadScheduler);
  v1 = (void *)_block_invoke_3_na_once_object_2;
  _block_invoke_3_na_once_object_2 = (uint64_t)v0;

}

+ (id)operationQueueSchedulerWithMaxConcurrentOperationCount:(unint64_t)a3
{
  return -[_NAOperationQueueScheduler initWithMaxConcurrentOperationCount:]([_NAOperationQueueScheduler alloc], "initWithMaxConcurrentOperationCount:", a3);
}

@end
