@implementation LACDTOLostModeProviderKVSAdapter

- (LACDTOLostModeProviderKVSAdapter)initWithKVStore:(id)a3
{
  id v5;
  LACDTOLostModeProviderKVSAdapter *v6;
  LACDTOLostModeProviderKVSAdapter *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)LACDTOLostModeProviderKVSAdapter;
  v6 = -[LACDTOLostModeProviderKVSAdapter init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_kvStore, a3);

  return v7;
}

- (void)lostModeStateWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  LACDTOKVStore *kvStore;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  uint8_t buf[4];
  LACDTOLostModeProviderKVSAdapter *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  LACLogDTOLostMode();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v12 = self;
    _os_log_impl(&dword_2409DC000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ will start query", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  kvStore = self->_kvStore;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __64__LACDTOLostModeProviderKVSAdapter_lostModeStateWithCompletion___block_invoke;
  v8[3] = &unk_2510C1118;
  objc_copyWeak(&v10, (id *)buf);
  v7 = v4;
  v9 = v7;
  -[LACDTOKVStore valueForKey:completion:](kvStore, "valueForKey:completion:", 2, v8);

  objc_destroyWeak(&v10);
  objc_destroyWeak((id *)buf);

}

void __64__LACDTOLostModeProviderKVSAdapter_lostModeStateWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  LACDTOLostModeState *v11;
  LACDTOLostModeState *v12;
  int v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    LACLogDTOLostMode();
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v6)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        __86__LACDTOLocationProviderPersistenceDecorator_checkIsInFamiliarLocationWithCompletion___block_invoke_2_cold_1((uint64_t)WeakRetained, (uint64_t)v6, v9);

      v10 = *(_QWORD *)(a1 + 32);
      +[LACDTOLostModeState nullInstance](LACDTOLostModeState, "nullInstance");
      v11 = (LACDTOLostModeState *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v13 = 138543362;
        v14 = WeakRetained;
        _os_log_impl(&dword_2409DC000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ did finish query", (uint8_t *)&v13, 0xCu);
      }

      v10 = *(_QWORD *)(a1 + 32);
      v11 = -[LACDTOLostModeState initWithIsInLostMode:]([LACDTOLostModeState alloc], "initWithIsInLostMode:", objc_msgSend(v5, "BOOLValue"));
    }
    v12 = v11;
    (*(void (**)(uint64_t, LACDTOLostModeState *))(v10 + 16))(v10, v11);

  }
}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<%@ %p>"), objc_opt_class(), self);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_kvStore, 0);
}

@end
