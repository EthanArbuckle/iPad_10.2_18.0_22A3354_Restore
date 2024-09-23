@implementation EFScheduler

+ (EFScheduler)mainThreadScheduler
{
  if (mainThreadScheduler_onceToken != -1)
    dispatch_once(&mainThreadScheduler_onceToken, &__block_literal_global_8);
  return (EFScheduler *)(id)mainThreadScheduler_scheduler;
}

+ (id)serialDispatchQueueSchedulerWithName:(id)a3
{
  objc_msgSend(a1, "serialDispatchQueueSchedulerWithName:qualityOfService:", a3, -1);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)serialDispatchQueueSchedulerWithName:(id)a3 qualityOfService:(int64_t)a4
{
  id v6;
  NSObject *v7;
  NSObject *v8;
  unint64_t v9;
  dispatch_qos_class_t v10;
  dispatch_qos_class_t v11;
  NSObject *v12;
  id v13;
  dispatch_queue_t v14;
  void *v15;

  v6 = a3;
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  v9 = __ROR8__(a4 - 9, 3);
  v10 = 8 * v9 + 9;
  if (v9 >= 4)
    v11 = QOS_CLASS_DEFAULT;
  else
    v11 = v10;
  dispatch_queue_attr_make_with_qos_class(v7, v11, 0);
  v12 = objc_claimAutoreleasedReturnValue();

  v13 = objc_retainAutorelease(v6);
  v14 = dispatch_queue_create((const char *)objc_msgSend(v13, "UTF8String"), v12);
  objc_msgSend(a1, "dispatchQueueSchedulerWithQueue:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

+ (id)dispatchQueueSchedulerWithQueue:(id)a3
{
  id v3;
  EFQueueScheduler *v4;

  v3 = a3;
  v4 = -[EFQueueScheduler initWithQueue:]([EFQueueScheduler alloc], "initWithQueue:", v3);

  return v4;
}

+ (EFScheduler)globalAsyncScheduler
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35__EFScheduler_globalAsyncScheduler__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (globalAsyncScheduler_onceToken != -1)
    dispatch_once(&globalAsyncScheduler_onceToken, block);
  return (EFScheduler *)(id)globalAsyncScheduler_scheduler;
}

+ (EFScheduler)immediateScheduler
{
  if (immediateScheduler_onceToken != -1)
    dispatch_once(&immediateScheduler_onceToken, &__block_literal_global_27);
  return (EFScheduler *)(id)immediateScheduler_scheduler;
}

+ (id)onScheduler:(id)a3 performWithObject:(id)a4
{
  +[EFSchedulerTrampoline trampolineWithScheduler:object:](EFSchedulerTrampoline, "trampolineWithScheduler:object:", a3, a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

void __56__EFScheduler_globalAsyncSchedulerWithQualityOfService___block_invoke(uint64_t a1)
{
  id *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[5];
  _QWORD v11[6];

  v11[5] = *MEMORY[0x1E0C80C00];
  v10[0] = &unk_1E62BDBE8;
  v2 = (id *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 32), "_globalAsyncSchedulerWithQualityOfService:", -1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v3;
  v10[1] = &unk_1E62BDC00;
  objc_msgSend(*v2, "_globalAsyncSchedulerWithQualityOfService:", 9);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v4;
  v10[2] = &unk_1E62BDC18;
  objc_msgSend(*(id *)(a1 + 32), "_globalAsyncSchedulerWithQualityOfService:", 17);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[2] = v5;
  v10[3] = &unk_1E62BDC30;
  objc_msgSend(*(id *)(a1 + 32), "_globalAsyncSchedulerWithQualityOfService:", 25);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[3] = v6;
  v10[4] = &unk_1E62BDC48;
  objc_msgSend(*(id *)(a1 + 32), "_globalAsyncSchedulerWithQualityOfService:", 33);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[4] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 5);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)globalAsyncSchedulerWithQualityOfService__qosSchedulers;
  globalAsyncSchedulerWithQualityOfService__qosSchedulers = v8;

}

+ (id)_globalAsyncSchedulerWithQualityOfService:(int64_t)a3
{
  NSObject *v5;
  NSObject *v6;
  unint64_t v7;
  dispatch_qos_class_t v8;
  dispatch_qos_class_t v9;
  NSObject *v10;
  dispatch_queue_t v11;
  void *v12;

  dispatch_queue_attr_make_with_autorelease_frequency(MEMORY[0x1E0C80D50], DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  v7 = __ROR8__(a3 - 9, 3);
  v8 = 8 * v7 + 9;
  if (v7 >= 4)
    v9 = QOS_CLASS_DEFAULT;
  else
    v9 = v8;
  dispatch_queue_attr_make_with_qos_class(v5, v9, 0);
  v10 = objc_claimAutoreleasedReturnValue();

  v11 = dispatch_queue_create(0, v10);
  objc_msgSend(a1, "dispatchQueueSchedulerWithQueue:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

void __34__EFScheduler_mainThreadScheduler__block_invoke()
{
  EFMainThreadScheduler *v0;
  void *v1;

  v0 = objc_alloc_init(EFMainThreadScheduler);
  v1 = (void *)mainThreadScheduler_scheduler;
  mainThreadScheduler_scheduler = (uint64_t)v0;

}

void __35__EFScheduler_globalAsyncScheduler__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "globalAsyncSchedulerWithQualityOfService:", -1);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)globalAsyncScheduler_scheduler;
  globalAsyncScheduler_scheduler = v1;

}

+ (id)globalAsyncSchedulerWithQualityOfService:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__EFScheduler_globalAsyncSchedulerWithQualityOfService___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (globalAsyncSchedulerWithQualityOfService__onceToken != -1)
    dispatch_once(&globalAsyncSchedulerWithQualityOfService__onceToken, block);
  v4 = (void *)globalAsyncSchedulerWithQualityOfService__qosSchedulers;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

void __33__EFScheduler_immediateScheduler__block_invoke()
{
  EFImmediateScheduler *v0;
  void *v1;

  v0 = objc_alloc_init(EFImmediateScheduler);
  v1 = (void *)immediateScheduler_scheduler;
  immediateScheduler_scheduler = (uint64_t)v0;

}

+ (id)operationQueueSchedulerWithMaxConcurrentOperationCount:(int64_t)a3
{
  return -[EFOperationQueueScheduler initWithMaxConcurrentOperationCount:]([EFOperationQueueScheduler alloc], "initWithMaxConcurrentOperationCount:", a3);
}

@end
