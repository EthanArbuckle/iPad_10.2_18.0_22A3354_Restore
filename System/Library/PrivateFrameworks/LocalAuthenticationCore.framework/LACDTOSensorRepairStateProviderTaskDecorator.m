@implementation LACDTOSensorRepairStateProviderTaskDecorator

- (LACDTOSensorRepairStateProviderTaskDecorator)initWithProvider:(id)a3 replyQueue:(id)a4
{
  id v7;
  id v8;
  LACDTOSensorRepairStateProviderTaskDecorator *v9;
  LACDTOSensorRepairStateProviderTaskDecorator *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)LACDTOSensorRepairStateProviderTaskDecorator;
  v9 = -[LACDTOSensorRepairStateProviderTaskDecorator init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_provider, a3);
    objc_storeStrong((id *)&v10->_replyQueue, a4);
  }

  return v10;
}

- (void)dealloc
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl(&dword_2409DC000, a2, OS_LOG_TYPE_DEBUG, "%@ will dealloc", (uint8_t *)&v2, 0xCu);
}

- (void)fetchRepairStateWithCompletion:(id)a3
{
  void (**v4)(id, _QWORD, void *);
  id WeakRetained;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  OS_dispatch_queue *replyQueue;
  _QWORD v11[4];
  id v12;
  void (**v13)(id, _QWORD, void *);
  id v14;
  id location;

  v4 = (void (**)(id, _QWORD, void *))a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_backgroundTask);

  if (WeakRetained)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ is busy"), self->_provider);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    +[LACError errorWithCode:debugDescription:](LACError, "errorWithCode:debugDescription:", -1000, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    LACLogDTOSensor();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[LACDTOSensorRepairStateProviderCRAdapter _fetchRepairStateWithCompletion:].cold.1((uint64_t)self, (uint64_t)v7, v8);

    v4[2](v4, 0, v7);
  }
  else
  {
    -[LACDTOSensorRepairStateProviderTaskDecorator _repairStateBackgroundTask](self, "_repairStateBackgroundTask");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak(&location, self);
    replyQueue = self->_replyQueue;
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __79__LACDTOSensorRepairStateProviderTaskDecorator_fetchRepairStateWithCompletion___block_invoke;
    v11[3] = &unk_2510C0C38;
    objc_copyWeak(&v14, &location);
    v13 = v4;
    v6 = v9;
    v12 = v6;
    objc_msgSend(v6, "runWithTimeout:queue:completion:", replyQueue, v11, 1.0);
    objc_storeWeak((id *)&self->_backgroundTask, v6);

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }

}

void __79__LACDTOSensorRepairStateProviderTaskDecorator_fetchRepairStateWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id *WeakRetained;
  id *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  NSObject *v10;
  uint64_t v11;
  LACDTOMutableSensorRepairState *v12;
  LACDTOMutableSensorRepairState *v13;
  int v14;
  id *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    objc_storeWeak(WeakRetained + 3, 0);
    objc_msgSend(v3, "error");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      objc_msgSend(v6, "domain");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("LACBackgroundTaskErrorDomain"));

      if (!v9)
      {
        (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
        goto LABEL_10;
      }
      LACLogDTOSensor();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v14 = 138543618;
        v15 = v5;
        v16 = 2114;
        v17 = v7;
        _os_log_impl(&dword_2409DC000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ failed with background task error %{public}@. Resolving to unknown repair state.", (uint8_t *)&v14, 0x16u);
      }

      v11 = *(_QWORD *)(a1 + 40);
      v12 = -[LACDTOMutableSensorRepairState initWithFlag:]([LACDTOMutableSensorRepairState alloc], "initWithFlag:", 0);
    }
    else
    {
      v11 = *(_QWORD *)(a1 + 40);
      objc_msgSend(v3, "value");
      v12 = (LACDTOMutableSensorRepairState *)objc_claimAutoreleasedReturnValue();
    }
    v13 = v12;
    (*(void (**)(uint64_t, LACDTOMutableSensorRepairState *, _QWORD))(v11 + 16))(v11, v12, 0);

LABEL_10:
  }

}

- (id)_repairStateBackgroundTask
{
  LACBackgroundTask *v2;
  LACBackgroundTask *v3;
  _QWORD v5[4];
  id v6;
  id location;

  objc_initWeak(&location, self);
  v2 = [LACBackgroundTask alloc];
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __74__LACDTOSensorRepairStateProviderTaskDecorator__repairStateBackgroundTask__block_invoke;
  v5[3] = &unk_2510C0F20;
  objc_copyWeak(&v6, &location);
  v3 = -[LACBackgroundTask initWithIdentifier:worker:](v2, "initWithIdentifier:worker:", CFSTR("RepairStateQuery"), v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
  return v3;
}

void __74__LACDTOSensorRepairStateProviderTaskDecorator__repairStateBackgroundTask__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  _QWORD v7[4];
  id v8;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v6 = (void *)*((_QWORD *)WeakRetained + 1);
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __74__LACDTOSensorRepairStateProviderTaskDecorator__repairStateBackgroundTask__block_invoke_2;
    v7[3] = &unk_2510C26E8;
    v8 = v3;
    objc_msgSend(v6, "fetchRepairStateWithCompletion:", v7);

  }
}

void __74__LACDTOSensorRepairStateProviderTaskDecorator__repairStateBackgroundTask__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  LACBackgroundTaskResult *v7;
  uint64_t v8;
  void *v9;
  id v10;

  v10 = a2;
  v5 = a3;
  v6 = *(_QWORD *)(a1 + 32);
  v7 = [LACBackgroundTaskResult alloc];
  if (v5)
    v8 = -[LACBackgroundTaskResult initWithError:](v7, "initWithError:", v5);
  else
    v8 = -[LACBackgroundTaskResult initWithValue:](v7, "initWithValue:", v10);
  v9 = (void *)v8;
  (*(void (**)(uint64_t, uint64_t))(v6 + 16))(v6, v8);

}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_backgroundTask);
  objc_storeStrong((id *)&self->_replyQueue, 0);
  objc_storeStrong((id *)&self->_provider, 0);
}

@end
