@implementation LACDTOLostModeController

- (LACDTOLostModeController)initWithLostModeProvider:(id)a3 store:(id)a4 workQueue:(id)a5
{
  id v9;
  id v10;
  id v11;
  LACDTOLostModeController *v12;
  LACDTOLostModeController *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)LACDTOLostModeController;
  v12 = -[LACDTOLostModeController init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_lostModeProvider, a3);
    objc_storeStrong((id *)&v13->_store, a4);
    objc_storeStrong((id *)&v13->_workQueue, a5);
  }

  return v13;
}

- (void)fetchLostMode:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  uint64_t StrategyFromRequest;
  NSObject *v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  uint8_t buf[4];
  LACDTOLostModeController *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  StrategyFromRequest = LACDTOLostModeFetchStrategyFromRequest(v6);
  LACLogDTOLostMode();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromLACDTOLostModeFetchStrategy(StrategyFromRequest);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v16 = self;
    v17 = 2112;
    v18 = v10;
    _os_log_impl(&dword_2409DC000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ will start query with '%@' strategy", buf, 0x16u);

  }
  objc_initWeak((id *)buf, self);
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __53__LACDTOLostModeController_fetchLostMode_completion___block_invoke;
  v12[3] = &unk_2510C19B0;
  objc_copyWeak(&v14, (id *)buf);
  v11 = v7;
  v13 = v11;
  -[LACDTOLostModeController _runLostModeBackgroundTaskWithStrategy:completion:](self, "_runLostModeBackgroundTaskWithStrategy:completion:", StrategyFromRequest, v12);

  objc_destroyWeak(&v14);
  objc_destroyWeak((id *)buf);

}

void __53__LACDTOLostModeController_fetchLostMode_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  dispatch_queue_t *WeakRetained;
  NSObject *v5;
  _QWORD v6[5];
  id v7;
  id v8;
  uint8_t buf[4];
  dispatch_queue_t *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = (dispatch_queue_t *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    LACLogDTOLostMode();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v10 = WeakRetained;
      v11 = 2112;
      v12 = v3;
      _os_log_impl(&dword_2409DC000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ did finish query %@", buf, 0x16u);
    }

    dispatch_assert_queue_V2(WeakRetained[3]);
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __53__LACDTOLostModeController_fetchLostMode_completion___block_invoke_1;
    v6[3] = &unk_2510C1988;
    v6[4] = WeakRetained;
    v8 = *(id *)(a1 + 32);
    v7 = v3;
    -[dispatch_queue_t _storeLostModeState:completion:](WeakRetained, "_storeLostModeState:completion:", v7, v6);

  }
}

void __53__LACDTOLostModeController_fetchLostMode_completion___block_invoke_1(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(v4 + 24));
    if (v3)
    {
      LACLogDTOLostMode();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        v6 = *(_QWORD *)(a1 + 32);
        v9 = 138543618;
        v10 = v6;
        v11 = 2114;
        v12 = v3;
        _os_log_impl(&dword_2409DC000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ did finish query with error %{public}@", (uint8_t *)&v9, 0x16u);
      }

      v7 = *(_QWORD *)(a1 + 48);
      +[LACDTOLostModeState nullInstance](LACDTOLostModeState, "nullInstance");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v8);

    }
    else
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    }
  }

}

- (LACBackgroundTask)lostModeBackgroundTask
{
  LACBackgroundTask *lostModeBackgroundTask;
  LACBackgroundTask *v4;
  LACBackgroundTask *v5;
  LACBackgroundTask *v6;
  _QWORD v8[4];
  id v9;
  id location;

  lostModeBackgroundTask = self->_lostModeBackgroundTask;
  if (!lostModeBackgroundTask)
  {
    objc_initWeak(&location, self);
    v4 = [LACBackgroundTask alloc];
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __50__LACDTOLostModeController_lostModeBackgroundTask__block_invoke;
    v8[3] = &unk_2510C0F20;
    objc_copyWeak(&v9, &location);
    v5 = -[LACBackgroundTask initWithIdentifier:worker:](v4, "initWithIdentifier:worker:", CFSTR("LostModeStateQuery"), v8);
    v6 = self->_lostModeBackgroundTask;
    self->_lostModeBackgroundTask = v5;

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
    lostModeBackgroundTask = self->_lostModeBackgroundTask;
  }
  return lostModeBackgroundTask;
}

void __50__LACDTOLostModeController_lostModeBackgroundTask__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _QWORD *WeakRetained;
  void *v5;
  void *v6;
  _QWORD v7[4];
  id v8;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    +[LACDTOSignpostEvent lostModeQueryWillStart](LACDTOSignpostEvent, "lostModeQueryWillStart");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "send");

    v6 = (void *)WeakRetained[1];
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __50__LACDTOLostModeController_lostModeBackgroundTask__block_invoke_2;
    v7[3] = &unk_2510C19D8;
    v8 = v3;
    objc_msgSend(v6, "lostModeStateWithCompletion:", v7);

  }
}

void __50__LACDTOLostModeController_lostModeBackgroundTask__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  LACBackgroundTaskResult *v6;

  v3 = a2;
  +[LACDTOSignpostEvent lostModeQueryDidFinish](LACDTOSignpostEvent, "lostModeQueryDidFinish");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "send");

  v5 = *(_QWORD *)(a1 + 32);
  v6 = -[LACBackgroundTaskResult initWithValue:]([LACBackgroundTaskResult alloc], "initWithValue:", v3);

  (*(void (**)(uint64_t, LACBackgroundTaskResult *))(v5 + 16))(v5, v6);
}

- (void)_runLostModeBackgroundTaskWithStrategy:(int64_t)a3 completion:(id)a4
{
  void (**v6)(id, uint64_t);
  NSObject *v7;
  uint64_t v8;
  int v9;
  LACDTOLostModeController *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v6 = (void (**)(id, uint64_t))a4;
  if (a3 == 1)
  {
    LACLogDTOLostMode();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 138543362;
      v10 = self;
      _os_log_impl(&dword_2409DC000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ will skip query because current ratchet state allows it", (uint8_t *)&v9, 0xCu);
    }

    +[LACDTOLostModeState nullInstance](LACDTOLostModeState, "nullInstance");
    v8 = objc_claimAutoreleasedReturnValue();
    v6[2](v6, v8);

    v6 = (void (**)(id, uint64_t))v8;
  }
  else
  {
    -[LACDTOLostModeController _runLostModeBackgroundTaskWithTimeout:completion:](self, "_runLostModeBackgroundTaskWithTimeout:completion:", v6, 1.35);
  }

}

- (void)_runLostModeBackgroundTaskWithTimeout:(double)a3 completion:(id)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  OS_dispatch_queue *workQueue;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id location;
  uint8_t buf[4];
  LACDTOLostModeController *v16;
  __int16 v17;
  double v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  objc_initWeak(&location, self);
  LACLogDTOLostMode();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v16 = self;
    v17 = 2048;
    v18 = a3;
    _os_log_impl(&dword_2409DC000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ will perform query with %.2f sec timeout", buf, 0x16u);
  }

  -[LACDTOLostModeController lostModeBackgroundTask](self, "lostModeBackgroundTask");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  workQueue = self->_workQueue;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __77__LACDTOLostModeController__runLostModeBackgroundTaskWithTimeout_completion___block_invoke;
  v11[3] = &unk_2510C0F48;
  objc_copyWeak(&v13, &location);
  v10 = v6;
  v12 = v10;
  objc_msgSend(v8, "runWithTimeout:queue:completion:", workQueue, v11, a3);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

}

void __77__LACDTOLostModeController__runLostModeBackgroundTaskWithTimeout_completion___block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  v7 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    v5 = *(_QWORD *)(a1 + 32);
    objc_msgSend(WeakRetained, "_lostModeStateFromBackgroundTaskResult:", v7);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);

  }
}

- (id)_lostModeStateFromBackgroundTaskResult:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  char isKindOfClass;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  int v15;
  LACDTOLostModeController *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "value");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5
    && (v6 = (void *)v5,
        objc_msgSend(v4, "value"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        isKindOfClass = objc_opt_isKindOfClass(),
        v7,
        v6,
        (isKindOfClass & 1) != 0))
  {
    objc_msgSend(v4, "value");
    v9 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v4, "error");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      LACLogDTOLostMode();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v4, "error");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = 138543618;
        v16 = self;
        v17 = 2114;
        v18 = v12;
        _os_log_impl(&dword_2409DC000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ query finished with error %{public}@", (uint8_t *)&v15, 0x16u);

      }
    }
    +[LACDTOLostModeState nullInstance](LACDTOLostModeState, "nullInstance");
    v9 = objc_claimAutoreleasedReturnValue();
  }
  v13 = (void *)v9;

  return v13;
}

- (void)_storeLostModeState:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  LACDTOKVStoreValue *v8;
  uint64_t v9;
  LACDTOKVStoreValue *v10;

  v6 = a4;
  v7 = a3;
  v8 = [LACDTOKVStoreValue alloc];
  v9 = objc_msgSend(v7, "isInLostMode");

  v10 = -[LACDTOKVStoreValue initWithBoolValue:](v8, "initWithBoolValue:", v9);
  -[LACDTOKVStore setValue:forKey:completion:](self->_store, "setValue:forKey:completion:", v10, 2, v6);

}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<%@ %p>"), objc_opt_class(), self);
}

- (void)setLostModeBackgroundTask:(id)a3
{
  objc_storeStrong((id *)&self->_lostModeBackgroundTask, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lostModeBackgroundTask, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_store, 0);
  objc_storeStrong((id *)&self->_lostModeProvider, 0);
}

@end
