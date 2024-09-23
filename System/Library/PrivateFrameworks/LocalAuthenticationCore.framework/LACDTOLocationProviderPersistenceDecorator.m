@implementation LACDTOLocationProviderPersistenceDecorator

- (LACDTOLocationProviderPersistenceDecorator)initWithLocationProvider:(id)a3 store:(id)a4 cacheEnabled:(BOOL)a5
{
  id v9;
  id v10;
  LACDTOLocationProviderPersistenceDecorator *v11;
  LACDTOLocationProviderPersistenceDecorator *v12;
  LACDTOLocationState *locationState;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v15.receiver = self;
  v15.super_class = (Class)LACDTOLocationProviderPersistenceDecorator;
  v11 = -[LACDTOLocationProviderPersistenceDecorator init](&v15, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_locationProvider, a3);
    objc_storeStrong((id *)&v12->_store, a4);
    v12->_isCacheEnabled = a5;
    locationState = v12->_locationState;
    v12->_locationState = 0;

  }
  return v12;
}

- (void)checkIsInFamiliarLocationWithCompletion:(id)a3
{
  id v4;
  LACDTOLocationProvider *locationProvider;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  locationProvider = self->_locationProvider;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __86__LACDTOLocationProviderPersistenceDecorator_checkIsInFamiliarLocationWithCompletion___block_invoke;
  v7[3] = &unk_2510C0C10;
  objc_copyWeak(&v9, &location);
  v6 = v4;
  v8 = v6;
  -[LACDTOLocationProvider checkIsInFamiliarLocationWithCompletion:](locationProvider, "checkIsInFamiliarLocationWithCompletion:", v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

}

void __86__LACDTOLocationProviderPersistenceDecorator_checkIsInFamiliarLocationWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  id *WeakRetained;
  id *v6;
  id *v7;
  int v8;
  id v9;
  LACDTOKVStoreValue *v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;

  v4 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v6 = WeakRetained;
  if (WeakRetained)
  {
    if (*((_BYTE *)WeakRetained + 32)
      && (v7 = WeakRetained + 3, WeakRetained[3])
      && (v8 = objc_msgSend(v4, "isInFamiliarLocation"), v8 == objc_msgSend(*v7, "isInFamiliarLocation")))
    {
      objc_storeStrong(v6 + 3, a2);
      (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    }
    else
    {
      v9 = v6[2];
      v10 = -[LACDTOKVStoreValue initWithBoolValue:]([LACDTOKVStoreValue alloc], "initWithBoolValue:", objc_msgSend(v4, "isInFamiliarLocation"));
      v11[0] = MEMORY[0x24BDAC760];
      v11[1] = 3221225472;
      v11[2] = __86__LACDTOLocationProviderPersistenceDecorator_checkIsInFamiliarLocationWithCompletion___block_invoke_2;
      v11[3] = &unk_2510C14C0;
      objc_copyWeak(&v14, (id *)(a1 + 40));
      v12 = v4;
      v13 = *(id *)(a1 + 32);
      objc_msgSend(v9, "setValue:forKey:completion:", v10, 1, v11);

      objc_destroyWeak(&v14);
    }
  }

}

void __86__LACDTOLocationProviderPersistenceDecorator_checkIsInFamiliarLocationWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  _QWORD *WeakRetained;
  id v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  id v9;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v5 = *(id *)(a1 + 32);
    if (v3)
    {
      LACLogDTOLocation();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        __86__LACDTOLocationProviderPersistenceDecorator_checkIsInFamiliarLocationWithCompletion___block_invoke_2_cold_1((uint64_t)WeakRetained, (uint64_t)v3, v6);

      +[LACDTOLocationState nullInstance](LACDTOLocationState, "nullInstance");
      v7 = objc_claimAutoreleasedReturnValue();

      v5 = (id)v7;
    }
    v8 = (void *)WeakRetained[3];
    WeakRetained[3] = v5;
    v9 = v5;

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locationState, 0);
  objc_storeStrong((id *)&self->_store, 0);
  objc_storeStrong((id *)&self->_locationProvider, 0);
}

void __86__LACDTOLocationProviderPersistenceDecorator_checkIsInFamiliarLocationWithCompletion___block_invoke_2_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 138543618;
  v4 = a1;
  v5 = 2114;
  v6 = a2;
  _os_log_error_impl(&dword_2409DC000, log, OS_LOG_TYPE_ERROR, "%{public}@ did finish query with error %{public}@", (uint8_t *)&v3, 0x16u);
}

@end
