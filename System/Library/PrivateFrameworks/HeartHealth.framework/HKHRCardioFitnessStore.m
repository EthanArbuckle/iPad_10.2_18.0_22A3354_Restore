@implementation HKHRCardioFitnessStore

- (HKHRCardioFitnessStore)initWithHealthStore:(id)a3
{
  id v5;
  HKHRCardioFitnessStore *v6;
  HKHRCardioFitnessStore *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  HKTaskServerProxyProvider *proxyProvider;
  objc_super v14;

  v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)HKHRCardioFitnessStore;
  v6 = -[HKHRCardioFitnessStore init](&v14, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_healthStore, a3);
    v8 = objc_alloc(MEMORY[0x1E0CB6CC0]);
    +[HKHRCardioFitnessStore taskIdentifier](HKHRCardioFitnessStore, "taskIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v8, "initWithHealthStore:taskIdentifier:exportedObject:taskUUID:", v5, v9, v7, v10);
    proxyProvider = v7->_proxyProvider;
    v7->_proxyProvider = (HKTaskServerProxyProvider *)v11;

    -[HKTaskServerProxyProvider setShouldRetryOnInterruption:](v7->_proxyProvider, "setShouldRetryOnInterruption:", 0);
  }

  return v7;
}

- (void)saveCardioFitnessEventWithValue:(id)a3 threshold:(id)a4 dateInterval:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  HKTaskServerProxyProvider *proxyProvider;
  uint64_t v15;
  id v16;
  id v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;
  id v26;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  -[HKTaskServerProxyProvider clientQueueActionHandlerWithCompletion:](self->_proxyProvider, "clientQueueActionHandlerWithCompletion:", a6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  proxyProvider = self->_proxyProvider;
  v15 = MEMORY[0x1E0C809B0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __92__HKHRCardioFitnessStore_saveCardioFitnessEventWithValue_threshold_dateInterval_completion___block_invoke;
  v22[3] = &unk_1E9C25CD8;
  v23 = v10;
  v24 = v11;
  v25 = v12;
  v26 = v13;
  v20[0] = v15;
  v20[1] = 3221225472;
  v20[2] = __92__HKHRCardioFitnessStore_saveCardioFitnessEventWithValue_threshold_dateInterval_completion___block_invoke_2;
  v20[3] = &unk_1E9C25D00;
  v21 = v26;
  v16 = v26;
  v17 = v12;
  v18 = v11;
  v19 = v10;
  -[HKTaskServerProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", v22, v20);

}

void __92__HKHRCardioFitnessStore_saveCardioFitnessEventWithValue_threshold_dateInterval_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  id v8;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5 = *(void **)(a1 + 48);
  v6 = a2;
  objc_msgSend(v5, "startDate");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "endDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "remote_saveCardioFitnessAlertWithValue:threshold:startDate:endDate:options:completion:", v3, v4, v8, v7, 0, *(_QWORD *)(a1 + 56));

}

uint64_t __92__HKHRCardioFitnessStore_saveCardioFitnessEventWithValue_threshold_dateInterval_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)saveCardioFitnessEventWithValue:(id)a3 threshold:(id)a4 dateInterval:(id)a5 options:(unint64_t)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  HKTaskServerProxyProvider *proxyProvider;
  uint64_t v17;
  id v18;
  id v19;
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  id v28;
  unint64_t v29;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  -[HKTaskServerProxyProvider clientQueueActionHandlerWithCompletion:](self->_proxyProvider, "clientQueueActionHandlerWithCompletion:", a7);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  proxyProvider = self->_proxyProvider;
  v17 = MEMORY[0x1E0C809B0];
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __100__HKHRCardioFitnessStore_saveCardioFitnessEventWithValue_threshold_dateInterval_options_completion___block_invoke;
  v24[3] = &unk_1E9C25D28;
  v25 = v12;
  v26 = v13;
  v27 = v14;
  v29 = a6;
  v28 = v15;
  v22[0] = v17;
  v22[1] = 3221225472;
  v22[2] = __100__HKHRCardioFitnessStore_saveCardioFitnessEventWithValue_threshold_dateInterval_options_completion___block_invoke_2;
  v22[3] = &unk_1E9C25D00;
  v23 = v28;
  v18 = v28;
  v19 = v14;
  v20 = v13;
  v21 = v12;
  -[HKTaskServerProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", v24, v22);

}

void __100__HKHRCardioFitnessStore_saveCardioFitnessEventWithValue_threshold_dateInterval_options_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  id v8;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5 = *(void **)(a1 + 48);
  v6 = a2;
  objc_msgSend(v5, "startDate");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "endDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "remote_saveCardioFitnessAlertWithValue:threshold:startDate:endDate:options:completion:", v3, v4, v8, v7, *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 56));

}

uint64_t __100__HKHRCardioFitnessStore_saveCardioFitnessEventWithValue_threshold_dateInterval_options_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (id)taskIdentifier
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (HKHealthStore)healthStore
{
  return self->_healthStore;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_healthStore, 0);
  objc_storeStrong((id *)&self->_proxyProvider, 0);
}

@end
