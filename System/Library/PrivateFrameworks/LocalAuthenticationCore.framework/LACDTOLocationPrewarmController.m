@implementation LACDTOLocationPrewarmController

- (LACDTOLocationPrewarmController)initWithLocationProvider:(id)a3 strategy:(id)a4 workQueue:(id)a5
{
  id v9;
  id v10;
  id v11;
  LACDTOLocationPrewarmController *v12;
  LACDTOLocationPrewarmController *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)LACDTOLocationPrewarmController;
  v12 = -[LACDTOLocationPrewarmController init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_locationProvider, a3);
    objc_storeStrong((id *)&v13->_strategy, a4);
    objc_storeStrong((id *)&v13->_workQueue, a5);
  }

  return v13;
}

- (void)notificationCenter:(id)a3 didReceiveNotification:(__CFString *)a4
{
  NSObject *workQueue;
  _QWORD v6[4];
  id v7;
  id location;

  if (LACDarwinNotificationsEqual(a4, CFSTR("com.apple.springboard.lockstate")))
  {
    objc_initWeak(&location, self);
    workQueue = self->_workQueue;
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __77__LACDTOLocationPrewarmController_notificationCenter_didReceiveNotification___block_invoke;
    v6[3] = &unk_2510C0EB0;
    objc_copyWeak(&v7, &location);
    dispatch_async(workQueue, v6);
    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
}

void __77__LACDTOLocationPrewarmController_notificationCenter_didReceiveNotification___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "prewarmWithCompletion:", &__block_literal_global_10);
    WeakRetained = v2;
  }

}

- (void)prewarmWithCompletion:(id)a3
{
  void (**v4)(id, uint64_t);
  NSObject *v5;
  NSObject *v6;
  _QWORD v7[4];
  void (**v8)(id, uint64_t);
  id v9;
  uint8_t buf[8];
  id location;

  v4 = (void (**)(id, uint64_t))a3;
  if (self->_running)
  {
    LACLogDTOLocation();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      -[LACDTOLocationPrewarmController prewarmWithCompletion:].cold.1(v5);

    v4[2](v4, 1);
  }
  else
  {
    self->_running = 1;
    objc_initWeak(&location, self);
    LACLogDTOLocation();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2409DC000, v6, OS_LOG_TYPE_DEFAULT, "Will start location prewarm", buf, 2u);
    }

    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __57__LACDTOLocationPrewarmController_prewarmWithCompletion___block_invoke;
    v7[3] = &unk_2510C2250;
    objc_copyWeak(&v9, &location);
    v8 = v4;
    -[LACDTOLocationPrewarmController _prewarmWithCompletion:](self, "_prewarmWithCompletion:", v7);

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }

}

void __57__LACDTOLocationPrewarmController_prewarmWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  _BYTE *WeakRetained;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    LACLogDTOLocation();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromLACDTOLocationPrewarmResult(a2);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 138543362;
      v8 = v6;
      _os_log_impl(&dword_2409DC000, v5, OS_LOG_TYPE_DEFAULT, "Did finish location prewarm with result: %{public}@", (uint8_t *)&v7, 0xCu);

    }
    WeakRetained[8] = 0;
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

- (void)_prewarmWithCompletion:(id)a3
{
  id v4;
  LACDTOLocationPrewarmStrategy *strategy;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  strategy = self->_strategy;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __58__LACDTOLocationPrewarmController__prewarmWithCompletion___block_invoke;
  v7[3] = &unk_2510C2278;
  objc_copyWeak(&v9, &location);
  v6 = v4;
  v8 = v6;
  -[LACDTOLocationPrewarmStrategy checkNeedsPrewarmWithCompletion:](strategy, "checkNeedsPrewarmWithCompletion:", v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

}

void __58__LACDTOLocationPrewarmController__prewarmWithCompletion___block_invoke(uint64_t a1, char a2)
{
  id WeakRetained;
  void *v5;
  void *v6;
  _QWORD v7[4];
  id v8;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    if ((a2 & 1) != 0)
    {
      v6 = (void *)*((_QWORD *)WeakRetained + 2);
      v7[0] = MEMORY[0x24BDAC760];
      v7[1] = 3221225472;
      v7[2] = __58__LACDTOLocationPrewarmController__prewarmWithCompletion___block_invoke_2;
      v7[3] = &unk_2510C0EF8;
      v8 = *(id *)(a1 + 32);
      objc_msgSend(v6, "checkIsInFamiliarLocationWithCompletion:", v7);

    }
    else
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    }
  }

}

uint64_t __58__LACDTOLocationPrewarmController__prewarmWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_strategy, 0);
  objc_storeStrong((id *)&self->_locationProvider, 0);
}

- (void)prewarmWithCompletion:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_2409DC000, log, OS_LOG_TYPE_DEBUG, "Ignoring redundant prewarm request", v1, 2u);
}

@end
