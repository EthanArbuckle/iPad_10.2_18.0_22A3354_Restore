@implementation LACSharedModeDataSourceTaskDecorator

- (LACSharedModeDataSourceTaskDecorator)initWithDataSource:(id)a3 replyQueue:(id)a4
{
  id v6;
  id v7;
  LACSharedModeDataSourceTaskDecoratorRuntime *v8;
  LACSharedModeDataSourceTaskDecorator *v9;

  v6 = a4;
  v7 = a3;
  v8 = objc_alloc_init(LACSharedModeDataSourceTaskDecoratorRuntime);
  v9 = -[LACSharedModeDataSourceTaskDecorator initWithDataSource:runtime:replyQueue:](self, "initWithDataSource:runtime:replyQueue:", v7, v8, v6);

  return v9;
}

- (LACSharedModeDataSourceTaskDecorator)initWithDataSource:(id)a3 runtime:(id)a4 replyQueue:(id)a5
{
  id v9;
  id v10;
  id v11;
  LACSharedModeDataSourceTaskDecorator *v12;
  LACSharedModeDataSourceTaskDecorator *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)LACSharedModeDataSourceTaskDecorator;
  v12 = -[LACSharedModeDataSourceTaskDecorator init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_dataSource, a3);
    objc_storeStrong((id *)&v13->_runtime, a4);
    objc_storeStrong((id *)&v13->_replyQueue, a5);
  }

  return v13;
}

- (void)fetchSharedModeWithOptions:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  double v10;
  double v11;
  OS_dispatch_queue *replyQueue;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  id location;
  uint8_t buf[4];
  LACSharedModeDataSourceTaskDecorator *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  LACLogSharedMode();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v21 = self;
    _os_log_impl(&dword_2409DC000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ will start query", buf, 0xCu);
  }

  -[LACSharedModeDataSourceTaskDecorator _sharedModeBackgroundTaskWithOptions:](self, "_sharedModeBackgroundTaskWithOptions:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[LACSharedModeDataSourceTaskDecorator _timeoutForRequestWithOptions:](self, "_timeoutForRequestWithOptions:", v6);
  v11 = v10;
  replyQueue = self->_replyQueue;
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __78__LACSharedModeDataSourceTaskDecorator_fetchSharedModeWithOptions_completion___block_invoke;
  v15[3] = &unk_2510C0C38;
  objc_copyWeak(&v18, &location);
  v13 = v7;
  v17 = v13;
  v14 = v9;
  v16 = v14;
  objc_msgSend(v14, "runWithTimeout:queue:completion:", replyQueue, v15, v11);

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);

}

void __78__LACSharedModeDataSourceTaskDecorator_fetchSharedModeWithOptions_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  NSObject *v7;
  id v8;
  int v9;
  id v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "_sharedModeFromBackgroundTaskResult:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    LACLogSharedMode();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = objc_loadWeakRetained((id *)(a1 + 48));
      v9 = 138543618;
      v10 = v8;
      v11 = 2114;
      v12 = v6;
      _os_log_impl(&dword_2409DC000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ did finish query %{public}@", (uint8_t *)&v9, 0x16u);

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  }
}

- (id)_sharedModeBackgroundTaskWithOptions:(id)a3
{
  id v4;
  LACBackgroundTask *v5;
  id v6;
  LACBackgroundTask *v7;
  _QWORD v9[4];
  id v10;
  id v11;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v5 = [LACBackgroundTask alloc];
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __77__LACSharedModeDataSourceTaskDecorator__sharedModeBackgroundTaskWithOptions___block_invoke;
  v9[3] = &unk_2510C0C88;
  objc_copyWeak(&v11, &location);
  v6 = v4;
  v10 = v6;
  v7 = -[LACBackgroundTask initWithIdentifier:worker:](v5, "initWithIdentifier:worker:", CFSTR("SharedModeStateQuery"), v9);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

  return v7;
}

void __77__LACSharedModeDataSourceTaskDecorator__sharedModeBackgroundTaskWithOptions___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v6 = (void *)*((_QWORD *)WeakRetained + 1);
    v7 = *(_QWORD *)(a1 + 32);
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __77__LACSharedModeDataSourceTaskDecorator__sharedModeBackgroundTaskWithOptions___block_invoke_2;
    v8[3] = &unk_2510C0C60;
    v9 = v3;
    objc_msgSend(v6, "fetchSharedModeWithOptions:completion:", v7, v8);

  }
}

void __77__LACSharedModeDataSourceTaskDecorator__sharedModeBackgroundTaskWithOptions___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;
  LACBackgroundTaskResult *v4;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = a2;
  v4 = -[LACBackgroundTaskResult initWithValue:]([LACBackgroundTaskResult alloc], "initWithValue:", v3);

  (*(void (**)(uint64_t, LACBackgroundTaskResult *))(v2 + 16))(v2, v4);
}

- (id)_sharedModeFromBackgroundTaskResult:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  char isKindOfClass;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;

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
    -[LACSharedModeDataSourceTaskDecoratorRuntime resetMaxValue](self->_runtime, "resetMaxValue");
    objc_msgSend(v4, "value");
    v9 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v4, "error");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v4, "error");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "domain");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v12, "isEqualToString:", CFSTR("LACBackgroundTaskErrorDomain")) & 1) != 0)
      {
        objc_msgSend(v4, "error");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "code");

        if (v14 == 2)
          -[LACSharedModeDataSourceTaskDecoratorRuntime halveMaxValue](self->_runtime, "halveMaxValue");
      }
      else
      {

      }
      LACLogSharedMode();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        -[LACSharedModeDataSourceTaskDecorator _sharedModeFromBackgroundTaskResult:].cold.1((uint64_t)self, v4, v15);

    }
    +[LACSharedMode defaultSharedMode](LACSharedMode, "defaultSharedMode");
    v9 = objc_claimAutoreleasedReturnValue();
  }
  v16 = (void *)v9;

  return v16;
}

- (double)_timeoutForRequestWithOptions:(id)a3
{
  int v4;
  LACSharedModeDataSourceTaskDecoratorRuntime *runtime;
  double result;

  v4 = objc_msgSend(a3, "isPreflight");
  runtime = self->_runtime;
  if (v4)
    -[LACSharedModeDataSourceTaskDecoratorRuntime minValue](runtime, "minValue");
  else
    -[LACSharedModeDataSourceTaskDecoratorRuntime maxValue](runtime, "maxValue");
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_replyQueue, 0);
  objc_storeStrong((id *)&self->_runtime, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
}

- (void)_sharedModeFromBackgroundTaskResult:(NSObject *)a3 .cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  void *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a2, "error");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138543618;
  v7 = a1;
  v8 = 2114;
  v9 = v5;
  _os_log_error_impl(&dword_2409DC000, a3, OS_LOG_TYPE_ERROR, "%{public}@ query finished with error %{public}@", (uint8_t *)&v6, 0x16u);

}

@end
