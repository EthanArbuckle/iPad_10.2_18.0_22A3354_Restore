@implementation LACDTOLocationProviderTaskDecorator

- (LACDTOLocationProviderTaskDecorator)initWithLocationProvider:(id)a3 workQueue:(id)a4
{
  id v7;
  id v8;
  LACDTOLocationProviderTaskDecorator *v9;
  LACDTOLocationProviderTaskDecorator *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)LACDTOLocationProviderTaskDecorator;
  v9 = -[LACDTOLocationProviderTaskDecorator init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_locationProvider, a3);
    objc_storeStrong((id *)&v10->_workQueue, a4);
  }

  return v10;
}

- (void)checkIsInFamiliarLocationWithCompletion:(id)a3
{
  NSObject *v4;
  id v5;

  v5 = a3;
  -[LACDTOLocationProviderTaskDecorator workQueue](self, "workQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  -[LACDTOLocationProviderTaskDecorator _runLocationStateBackgroundTask:completion:](self, "_runLocationStateBackgroundTask:completion:", v5, 1.0);
}

- (LACBackgroundTask)locationStateBackgroundTask
{
  LACBackgroundTask *locationStateBackgroundTask;
  LACBackgroundTask *v4;
  LACBackgroundTask *v5;
  LACBackgroundTask *v6;
  _QWORD v8[4];
  id v9;
  id location;

  locationStateBackgroundTask = self->_locationStateBackgroundTask;
  if (!locationStateBackgroundTask)
  {
    objc_initWeak(&location, self);
    v4 = [LACBackgroundTask alloc];
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __66__LACDTOLocationProviderTaskDecorator_locationStateBackgroundTask__block_invoke;
    v8[3] = &unk_2510C0F20;
    objc_copyWeak(&v9, &location);
    v5 = -[LACBackgroundTask initWithIdentifier:worker:](v4, "initWithIdentifier:worker:", CFSTR("LocationStateQuery"), v8);
    v6 = self->_locationStateBackgroundTask;
    self->_locationStateBackgroundTask = v5;

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
    locationStateBackgroundTask = self->_locationStateBackgroundTask;
  }
  return locationStateBackgroundTask;
}

void __66__LACDTOLocationProviderTaskDecorator_locationStateBackgroundTask__block_invoke(uint64_t a1, void *a2)
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
    +[LACDTOSignpostEvent locationStatusQueryWillStart](LACDTOSignpostEvent, "locationStatusQueryWillStart");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "send");

    v6 = (void *)WeakRetained[1];
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __66__LACDTOLocationProviderTaskDecorator_locationStateBackgroundTask__block_invoke_2;
    v7[3] = &unk_2510C0EF8;
    v8 = v3;
    objc_msgSend(v6, "checkIsInFamiliarLocationWithCompletion:", v7);

  }
}

void __66__LACDTOLocationProviderTaskDecorator_locationStateBackgroundTask__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  LACBackgroundTaskResult *v6;

  v3 = a2;
  +[LACDTOSignpostEvent locationStatusQueryDidFinish](LACDTOSignpostEvent, "locationStatusQueryDidFinish");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "send");

  v5 = *(_QWORD *)(a1 + 32);
  v6 = -[LACBackgroundTaskResult initWithValue:]([LACBackgroundTaskResult alloc], "initWithValue:", v3);

  (*(void (**)(uint64_t, LACBackgroundTaskResult *))(v5 + 16))(v5, v6);
}

- (void)_runLocationStateBackgroundTask:(double)a3 completion:(id)a4
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
  LACDTOLocationProviderTaskDecorator *v16;
  __int16 v17;
  double v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  objc_initWeak(&location, self);
  LACLogDTOLocation();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v16 = self;
    v17 = 2048;
    v18 = a3;
    _os_log_impl(&dword_2409DC000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ will perform query with %.2f sec timeout", buf, 0x16u);
  }

  -[LACDTOLocationProviderTaskDecorator locationStateBackgroundTask](self, "locationStateBackgroundTask");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  workQueue = self->_workQueue;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __82__LACDTOLocationProviderTaskDecorator__runLocationStateBackgroundTask_completion___block_invoke;
  v11[3] = &unk_2510C0F48;
  objc_copyWeak(&v13, &location);
  v10 = v6;
  v12 = v10;
  objc_msgSend(v8, "runWithTimeout:queue:completion:", workQueue, v11, a3);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

}

void __82__LACDTOLocationProviderTaskDecorator__runLocationStateBackgroundTask_completion___block_invoke(uint64_t a1, void *a2)
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
    objc_msgSend(WeakRetained, "_locationStateFromBackgroundTaskResult:", v7);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);

  }
}

- (id)_locationStateFromBackgroundTaskResult:(id)a3
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
  LACDTOLocationProviderTaskDecorator *v16;
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
      LACLogDTOLocation();
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
    +[LACDTOLocationState nullInstance](LACDTOLocationState, "nullInstance");
    v9 = objc_claimAutoreleasedReturnValue();
  }
  v13 = (void *)v9;

  return v13;
}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<%@ %p>"), objc_opt_class(), self);
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setWorkQueue:(id)a3
{
  objc_storeStrong((id *)&self->_workQueue, a3);
}

- (void)setLocationStateBackgroundTask:(id)a3
{
  objc_storeStrong((id *)&self->_locationStateBackgroundTask, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locationStateBackgroundTask, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_locationProvider, 0);
}

@end
