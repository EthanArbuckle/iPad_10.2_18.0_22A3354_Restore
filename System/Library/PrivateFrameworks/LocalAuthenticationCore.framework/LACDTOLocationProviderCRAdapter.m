@implementation LACDTOLocationProviderCRAdapter

- (LACDTOLocationProviderCRAdapter)initWithWorkQueue:(id)a3
{
  id v5;
  LACDTOLocationProviderCRAdapter *v6;
  uint64_t v7;
  RTRoutineManager *manager;
  objc_class *v9;
  void *v10;
  uint64_t v11;
  OS_dispatch_queue *internalQueue;
  objc_super v14;

  v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)LACDTOLocationProviderCRAdapter;
  v6 = -[LACDTOLocationProviderCRAdapter init](&v14, sel_init);
  if (v6)
  {
    if (getRTRoutineManagerClass())
    {
      objc_msgSend(getRTRoutineManagerClass(), "defaultManager");
      v7 = objc_claimAutoreleasedReturnValue();
      manager = v6->_manager;
      v6->_manager = (RTRoutineManager *)v7;

    }
    objc_storeStrong((id *)&v6->_replyQueue, a3);
    v9 = (objc_class *)objc_opt_class();
    NSStringFromClass(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[LACConcurrencyUtilities createUserInitiatedSerialQueueWithIdentifier:](LACConcurrencyUtilities, "createUserInitiatedSerialQueueWithIdentifier:", v10);
    v11 = objc_claimAutoreleasedReturnValue();
    internalQueue = v6->_internalQueue;
    v6->_internalQueue = (OS_dispatch_queue *)v11;

  }
  return v6;
}

- (void)checkIsInFamiliarLocationWithCompletion:(id)a3
{
  void (**v4)(id, LACDTOLocationState *);
  LACDTOLocationState *locationState;
  void *v6;
  BOOL v7;
  NSObject *v8;
  LACDTOLocationState *v9;
  NSObject *v10;
  LACDTOLocationState *v11;
  LACDTOLocationState *v12;
  NSObject *internalQueue;
  _QWORD v14[4];
  void (**v15)(id, LACDTOLocationState *);
  id v16;
  uint8_t buf[4];
  LACDTOLocationProviderCRAdapter *v18;
  __int16 v19;
  LACDTOLocationState *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, LACDTOLocationState *))a3;
  if (self->_manager)
  {
    locationState = self->_locationState;
    if (locationState)
    {
      objc_msgSend(MEMORY[0x24BDBCE60], "now");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = -[LACDTOLocationState isValid:](locationState, "isValid:", v6);

      if (v7)
      {
        LACLogDTOLocation();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          v9 = self->_locationState;
          *(_DWORD *)buf = 138543618;
          v18 = self;
          v19 = 2112;
          v20 = v9;
          _os_log_impl(&dword_2409DC000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ will use cached value %@", buf, 0x16u);
        }

        v4[2](v4, self->_locationState);
        goto LABEL_13;
      }
      v12 = self->_locationState;
    }
    else
    {
      v12 = 0;
    }
    self->_locationState = 0;

    objc_initWeak((id *)buf, self);
    internalQueue = self->_internalQueue;
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __75__LACDTOLocationProviderCRAdapter_checkIsInFamiliarLocationWithCompletion___block_invoke;
    v14[3] = &unk_2510C1B50;
    objc_copyWeak(&v16, (id *)buf);
    v15 = v4;
    dispatch_async(internalQueue, v14);

    objc_destroyWeak(&v16);
    objc_destroyWeak((id *)buf);
    goto LABEL_13;
  }
  LACLogDTOLocation();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    -[LACDTOLocationProviderCRAdapter checkIsInFamiliarLocationWithCompletion:].cold.1((uint64_t)self, v10);

  +[LACDTOLocationState nullInstance](LACDTOLocationState, "nullInstance");
  v11 = (LACDTOLocationState *)objc_claimAutoreleasedReturnValue();
  v4[2](v4, v11);

LABEL_13:
}

void __75__LACDTOLocationProviderCRAdapter_checkIsInFamiliarLocationWithCompletion___block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  _QWORD v4[4];
  id v5;
  id v6;

  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v4[0] = MEMORY[0x24BDAC760];
    v4[1] = 3221225472;
    v4[2] = __75__LACDTOLocationProviderCRAdapter_checkIsInFamiliarLocationWithCompletion___block_invoke_2;
    v4[3] = &unk_2510C0C10;
    objc_copyWeak(&v6, v2);
    v5 = *(id *)(a1 + 32);
    objc_msgSend(WeakRetained, "_checkIsInFamiliarLocationWithCompletion:", v4);

    objc_destroyWeak(&v6);
  }

}

void __75__LACDTOLocationProviderCRAdapter_checkIsInFamiliarLocationWithCompletion___block_invoke_2(uint64_t a1, void *a2)
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
    v6 = WeakRetained[4];
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __75__LACDTOLocationProviderCRAdapter_checkIsInFamiliarLocationWithCompletion___block_invoke_3;
    block[3] = &unk_2510C0B08;
    objc_copyWeak(&v10, (id *)(a1 + 40));
    v9 = *(id *)(a1 + 32);
    v8 = v3;
    dispatch_async(v6, block);

    objc_destroyWeak(&v10);
  }

}

void __75__LACDTOLocationProviderCRAdapter_checkIsInFamiliarLocationWithCompletion___block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    WeakRetained = v3;
  }

}

- (void)_checkIsInFamiliarLocationWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  RTRoutineManager *manager;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  uint8_t buf[4];
  LACDTOLocationProviderCRAdapter *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  LACLogDTOLocation();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v12 = self;
    _os_log_impl(&dword_2409DC000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ will start query", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  manager = self->_manager;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __76__LACDTOLocationProviderCRAdapter__checkIsInFamiliarLocationWithCompletion___block_invoke;
  v8[3] = &unk_2510C1FB0;
  objc_copyWeak(&v10, (id *)buf);
  v7 = v4;
  v9 = v7;
  -[RTRoutineManager fetchAuthorizedLocationStatus:](manager, "fetchAuthorizedLocationStatus:", v8);

  objc_destroyWeak(&v10);
  objc_destroyWeak((id *)buf);

}

void __76__LACDTOLocationProviderCRAdapter__checkIsInFamiliarLocationWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  _QWORD *WeakRetained;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  LACDTOLocationState *v11;
  LACDTOLocationState *v12;
  void *v13;
  int v14;
  _QWORD *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    LACLogDTOLocation();
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v6)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        __76__LACDTOLocationProviderKVSAdapter_checkIsInFamiliarLocationWithCompletion___block_invoke_cold_1((uint64_t)WeakRetained, (uint64_t)v6, v9);

      v10 = *(_QWORD *)(a1 + 32);
      +[LACDTOLocationState nullInstance](LACDTOLocationState, "nullInstance");
      v11 = (LACDTOLocationState *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, LACDTOLocationState *))(v10 + 16))(v10, v11);
    }
    else
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v14 = 138543362;
        v15 = WeakRetained;
        _os_log_impl(&dword_2409DC000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ did finish query", (uint8_t *)&v14, 0xCu);
      }

      v12 = -[LACDTOLocationState initWithIsInFamiliarLocation:confirmed:]([LACDTOLocationState alloc], "initWithIsInFamiliarLocation:confirmed:", objc_msgSend(v5, "eStatus") == 2, 1);
      v13 = (void *)WeakRetained[2];
      WeakRetained[2] = v12;
      v11 = v12;

      (*(void (**)(_QWORD, LACDTOLocationState *))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), v11);
    }

  }
}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<%@ %p>"), objc_opt_class(), self);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_replyQueue, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
  objc_storeStrong((id *)&self->_locationState, 0);
  objc_storeStrong((id *)&self->_manager, 0);
}

- (void)checkIsInFamiliarLocationWithCompletion:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_2409DC000, a2, OS_LOG_TYPE_ERROR, "%{public}@ Missing required RTRoutineManager dependency", (uint8_t *)&v2, 0xCu);
}

@end
