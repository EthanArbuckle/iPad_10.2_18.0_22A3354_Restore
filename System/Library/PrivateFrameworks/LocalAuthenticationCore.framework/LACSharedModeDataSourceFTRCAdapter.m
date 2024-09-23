@implementation LACSharedModeDataSourceFTRCAdapter

- (LACSharedModeDataSourceFTRCAdapter)initWithReplyQueue:(id)a3
{
  id v5;
  LACSharedModeDataSourceFTRCAdapter *v6;
  LACSharedModeDataSourceFTRCAdapter *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)LACSharedModeDataSourceFTRCAdapter;
  v6 = -[LACSharedModeDataSourceFTRCAdapter init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_replyQueue, a3);

  return v7;
}

- (void)dealloc
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138543362;
  v3 = a1;
  _os_log_debug_impl(&dword_2409DC000, a2, OS_LOG_TYPE_DEBUG, "%{public}@ deallocated", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_2();
}

- (void)fetchSharedModeWithOptions:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  void *v8;
  char v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  _QWORD block[5];
  void (**v15)(id, void *);
  id v16;
  uint8_t buf[4];
  LACSharedModeDataSourceFTRCAdapter *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  +[LACFlags sharedInstance](LACFlags, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "featureFlagEssoniteClickEnabled");

  if ((v9 & 1) == 0)
  {
    +[LACSharedMode defaultSharedMode](LACSharedMode, "defaultSharedMode");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    LACLogSharedMode();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[LACSharedModeDataSourceFTRCAdapter fetchSharedModeWithOptions:completion:].cold.2();
    goto LABEL_12;
  }
  if (!getTUCallCenterClass() || !getTUUIXPCClientConnectionClass())
  {
    +[LACSharedMode defaultSharedMode](LACSharedMode, "defaultSharedMode");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    LACLogSharedMode();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[LACSharedModeDataSourceFTRCAdapter fetchSharedModeWithOptions:completion:].cold.1();
LABEL_12:

    v7[2](v7, v12);
    goto LABEL_13;
  }
  LACLogSharedMode();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v18 = self;
    _os_log_impl(&dword_2409DC000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ will start query", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  objc_msgSend((id)objc_opt_class(), "_workQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __76__LACSharedModeDataSourceFTRCAdapter_fetchSharedModeWithOptions_completion___block_invoke;
  block[3] = &unk_2510C1190;
  block[4] = self;
  objc_copyWeak(&v16, (id *)buf);
  v15 = v7;
  dispatch_async(v11, block);

  objc_destroyWeak(&v16);
  objc_destroyWeak((id *)buf);
LABEL_13:

}

void __76__LACSharedModeDataSourceFTRCAdapter_fetchSharedModeWithOptions_completion___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __76__LACSharedModeDataSourceFTRCAdapter_fetchSharedModeWithOptions_completion___block_invoke_2;
  v3[3] = &unk_2510C1168;
  objc_copyWeak(&v5, (id *)(a1 + 48));
  v4 = *(id *)(a1 + 40);
  objc_msgSend(v2, "_performFetchSharedModeWithCompletion:", v3);

  objc_destroyWeak(&v5);
}

void __76__LACSharedModeDataSourceFTRCAdapter_fetchSharedModeWithOptions_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject **WeakRetained;
  NSObject **v5;
  NSObject *v6;
  _QWORD block[4];
  id v8;
  id v9;
  id v10;

  v3 = a2;
  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v6 = WeakRetained[1];
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __76__LACSharedModeDataSourceFTRCAdapter_fetchSharedModeWithOptions_completion___block_invoke_3;
    block[3] = &unk_2510C1140;
    objc_copyWeak(&v10, (id *)(a1 + 40));
    v8 = v3;
    v9 = *(id *)(a1 + 32);
    dispatch_async(v6, block);

    objc_destroyWeak(&v10);
  }

}

uint64_t __76__LACSharedModeDataSourceFTRCAdapter_fetchSharedModeWithOptions_completion___block_invoke_3(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  uint64_t v4;
  int v6;
  id v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  LACLogSharedMode();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    v4 = *(_QWORD *)(a1 + 32);
    v6 = 138543618;
    v7 = WeakRetained;
    v8 = 2114;
    v9 = v4;
    _os_log_impl(&dword_2409DC000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ did finish query %{public}@", (uint8_t *)&v6, 0x16u);

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)_performFetchSharedModeWithCompletion:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  LACSharedMode *v8;
  NSObject *v9;
  _QWORD v10[4];
  id v11;
  id v12;
  _BYTE location[12];
  __int16 v14;
  LACSharedMode *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "_callCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countOfCallsPassingTest:", &__block_literal_global_1);

  if (v6)
  {
    objc_initWeak((id *)location, self);
    objc_msgSend((id)objc_opt_class(), "_callCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __76__LACSharedModeDataSourceFTRCAdapter__performFetchSharedModeWithCompletion___block_invoke_9;
    v10[3] = &unk_2510C1200;
    objc_copyWeak(&v12, (id *)location);
    v11 = v4;
    objc_msgSend(v7, "fetchAnonymousXPCEndpoint:", v10);

    objc_destroyWeak(&v12);
    objc_destroyWeak((id *)location);
  }
  else
  {
    v8 = -[LACSharedMode initWithActive:confirmed:]([LACSharedMode alloc], "initWithActive:confirmed:", 0, 1);
    LACLogSharedMode();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)location = 138543618;
      *(_QWORD *)&location[4] = self;
      v14 = 2114;
      v15 = v8;
      _os_log_impl(&dword_2409DC000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ falling back to %{public}@ because the TUCallCenter has no active calls", location, 0x16u);
    }

    (*((void (**)(id, LACSharedMode *))v4 + 2))(v4, v8);
  }

}

uint64_t __76__LACSharedModeDataSourceFTRCAdapter__performFetchSharedModeWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;

  v2 = a2;
  if (objc_msgSend(v2, "status") == 1)
    v3 = objc_msgSend(v2, "isConversation");
  else
    v3 = 0;

  return v3;
}

void __76__LACSharedModeDataSourceFTRCAdapter__performFetchSharedModeWithCompletion___block_invoke_9(uint64_t a1, void *a2, void *a3)
{
  LACSharedMode *v5;
  LACSharedMode *v6;
  _QWORD *WeakRetained;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  _QWORD *v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  LACSharedMode *v17;
  NSObject *v18;
  _QWORD *v19;
  _QWORD v20[4];
  id v21;
  id v22;
  uint8_t buf[4];
  _QWORD *v24;
  __int16 v25;
  LACSharedMode *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    if (v6)
    {
      +[LACSharedMode defaultSharedMode](LACSharedMode, "defaultSharedMode");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      LACLogSharedMode();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543874;
        v24 = WeakRetained;
        v25 = 2114;
        v26 = v6;
        v27 = 2114;
        v28 = v8;
        _os_log_error_impl(&dword_2409DC000, v9, OS_LOG_TYPE_ERROR, "%{public}@ Unable to determine current shared mode status %{public}@. Falling back to : %{public}@", buf, 0x20u);
      }

      (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    }
    else if (v5)
    {
      LACLogSharedMode();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v11 = objc_loadWeakRetained((id *)(a1 + 40));
        *(_DWORD *)buf = 138543618;
        v24 = v11;
        v25 = 2112;
        v26 = v5;
        _os_log_impl(&dword_2409DC000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ Obtained TUCallCenter endpoint %@", buf, 0x16u);

      }
      v12 = objc_alloc((Class)getTUUIXPCClientConnectionClass());
      objc_msgSend((id)objc_opt_class(), "_callCenter");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v12, "initWithListenerEndpoint:callCenter:", v5, v13);
      v15 = (void *)WeakRetained[2];
      WeakRetained[2] = v14;

      v16 = (void *)WeakRetained[2];
      v20[0] = MEMORY[0x24BDAC760];
      v20[1] = 3221225472;
      v20[2] = __76__LACSharedModeDataSourceFTRCAdapter__performFetchSharedModeWithCompletion___block_invoke_10;
      v20[3] = &unk_2510C11D8;
      objc_copyWeak(&v22, (id *)(a1 + 40));
      v21 = *(id *)(a1 + 32);
      objc_msgSend(v16, "fetchRemoteControlStatus:", v20);

      objc_destroyWeak(&v22);
    }
    else
    {
      v17 = -[LACSharedMode initWithActive:confirmed:]([LACSharedMode alloc], "initWithActive:confirmed:", 0, 1);
      LACLogSharedMode();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        v19 = objc_loadWeakRetained((id *)(a1 + 40));
        *(_DWORD *)buf = 138543618;
        v24 = v19;
        v25 = 2114;
        v26 = v17;
        _os_log_impl(&dword_2409DC000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@ falling back to %{public}@ because the TUCallCenter endpoint was nil", buf, 0x16u);

      }
      (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

    }
  }

}

void __76__LACSharedModeDataSourceFTRCAdapter__performFetchSharedModeWithCompletion___block_invoke_10(uint64_t a1, uint64_t a2, void *a3)
{
  LACSharedMode *v5;
  id WeakRetained;
  LACSharedMode *v7;
  NSObject *v8;
  int v9;
  id v10;
  __int16 v11;
  LACSharedMode *v12;
  __int16 v13;
  LACSharedMode *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    if (v5)
    {
      +[LACSharedMode defaultSharedMode](LACSharedMode, "defaultSharedMode");
      v7 = (LACSharedMode *)objc_claimAutoreleasedReturnValue();
      LACLogSharedMode();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        v9 = 138543874;
        v10 = WeakRetained;
        v11 = 2114;
        v12 = v5;
        v13 = 2114;
        v14 = v7;
        _os_log_error_impl(&dword_2409DC000, v8, OS_LOG_TYPE_ERROR, "%{public}@ Unable to determine current shared mode status %{public}@. Falling back to : %{public}@", (uint8_t *)&v9, 0x20u);
      }
    }
    else
    {
      v7 = -[LACSharedMode initWithActive:confirmed:]([LACSharedMode alloc], "initWithActive:confirmed:", a2 == 2, 1);
      LACLogSharedMode();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v9 = 138543618;
        v10 = WeakRetained;
        v11 = 2114;
        v12 = v7;
        _os_log_impl(&dword_2409DC000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ %{public}@", (uint8_t *)&v9, 0x16u);
      }
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

+ (id)_callCenter
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __49__LACSharedModeDataSourceFTRCAdapter__callCenter__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_callCenter_onceToken != -1)
    dispatch_once(&_callCenter_onceToken, block);
  return (id)_callCenter__center;
}

void __49__LACSharedModeDataSourceFTRCAdapter__callCenter__block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  void *v6;
  id v7;

  if (getTUCallCenterClass())
  {
    v2 = objc_alloc((Class)getTUCallCenterClass());
    objc_msgSend(*(id *)(a1 + 32), "_workQueue");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "initWithQueue:", v7);
    v4 = (void *)_callCenter__center;
    _callCenter__center = v3;

  }
  else
  {
    LACLogSharedMode();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __49__LACSharedModeDataSourceFTRCAdapter__callCenter__block_invoke_cold_1(a1, v5);

    v6 = (void *)_callCenter__center;
    _callCenter__center = 0;

  }
}

+ (id)_workQueue
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __48__LACSharedModeDataSourceFTRCAdapter__workQueue__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_workQueue_onceToken != -1)
    dispatch_once(&_workQueue_onceToken, block);
  return (id)_workQueue__queue;
}

void __48__LACSharedModeDataSourceFTRCAdapter__workQueue__block_invoke()
{
  objc_class *v0;
  uint64_t v1;
  void *v2;
  id v3;

  v0 = (objc_class *)objc_opt_class();
  NSStringFromClass(v0);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  +[LACConcurrencyUtilities createUserInitiatedSerialQueueWithIdentifier:](LACConcurrencyUtilities, "createUserInitiatedSerialQueueWithIdentifier:", v3);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)_workQueue__queue;
  _workQueue__queue = v1;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inCallService, 0);
  objc_storeStrong((id *)&self->_replyQueue, 0);
}

- (void)fetchSharedModeWithOptions:completion:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_2409DC000, v0, v1, "%{public}@ Unable to determine shared mode status due to missing dependencies %{public}@");
  OUTLINED_FUNCTION_2();
}

- (void)fetchSharedModeWithOptions:completion:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_2409DC000, v0, v1, "%{public}@ Required feature flags are not enabled %{public}@");
  OUTLINED_FUNCTION_2();
}

void __49__LACSharedModeDataSourceFTRCAdapter__callCenter__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = 138543362;
  v4 = v2;
  _os_log_error_impl(&dword_2409DC000, a2, OS_LOG_TYPE_ERROR, "%{public}@ Unable to determine shared mode status due to missing dependencies", (uint8_t *)&v3, 0xCu);
  OUTLINED_FUNCTION_2();
}

@end
