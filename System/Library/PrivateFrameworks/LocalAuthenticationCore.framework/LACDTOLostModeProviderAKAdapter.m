@implementation LACDTOLostModeProviderAKAdapter

- (LACDTOLostModeProviderAKAdapter)initWithWorkQueue:(id)a3 deviceInfo:(id)a4
{
  id v7;
  id v8;
  LACDTOLostModeProviderAKAdapter *v9;
  LACDTOLostModeProviderAKAdapter *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)LACDTOLostModeProviderAKAdapter;
  v9 = -[LACDTOLostModeProviderAKAdapter init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_workQueue, a3);
    objc_storeStrong((id *)&v10->_deviceInfo, a4);
  }

  return v10;
}

- (void)lostModeStateWithCompletion:(id)a3
{
  void (**v4)(id, LACDTOLostModeState *);
  LACDTOLostModeState *lostModeState;
  void *v6;
  BOOL v7;
  NSObject *v8;
  LACDTOLostModeState *v9;
  LACDTOLostModeState *v10;
  NSObject *v11;
  _QWORD v12[4];
  void (**v13)(id, LACDTOLostModeState *);
  id v14;
  uint8_t buf[4];
  LACDTOLostModeProviderAKAdapter *v16;
  __int16 v17;
  LACDTOLostModeState *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, LACDTOLostModeState *))a3;
  lostModeState = self->_lostModeState;
  if (lostModeState)
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "now");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[LACDTOLostModeState isValid:](lostModeState, "isValid:", v6);

    if (v7)
    {
      LACLogDTOLostMode();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v9 = self->_lostModeState;
        *(_DWORD *)buf = 138543618;
        v16 = self;
        v17 = 2112;
        v18 = v9;
        _os_log_impl(&dword_2409DC000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ will use cached value %@", buf, 0x16u);
      }

      v4[2](v4, self->_lostModeState);
      goto LABEL_11;
    }
    v10 = self->_lostModeState;
  }
  else
  {
    v10 = 0;
  }
  self->_lostModeState = 0;

  LACLogDTOLostMode();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v16 = self;
    _os_log_impl(&dword_2409DC000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ will start query", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __63__LACDTOLostModeProviderAKAdapter_lostModeStateWithCompletion___block_invoke;
  v12[3] = &unk_2510C1A28;
  objc_copyWeak(&v14, (id *)buf);
  v13 = v4;
  -[LACDTOLostModeProviderAKAdapter _lostModeStateWithCompletion:](self, "_lostModeStateWithCompletion:", v12);

  objc_destroyWeak(&v14);
  objc_destroyWeak((id *)buf);
LABEL_11:

}

void __63__LACDTOLostModeProviderAKAdapter_lostModeStateWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject **WeakRetained;
  NSObject **v8;
  NSObject *v9;
  _QWORD v10[4];
  id v11;
  NSObject **v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 40));
  v8 = WeakRetained;
  if (WeakRetained)
  {
    v9 = WeakRetained[1];
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __63__LACDTOLostModeProviderAKAdapter_lostModeStateWithCompletion___block_invoke_2;
    v10[3] = &unk_2510C1A00;
    v11 = v6;
    v12 = v8;
    v14 = *(id *)(a1 + 32);
    v13 = v5;
    dispatch_async(v9, v10);

  }
}

void __63__LACDTOLostModeProviderAKAdapter_lostModeStateWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t *v2;
  uint64_t v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v2 = (uint64_t *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 32);
  LACLogDTOLostMode();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __63__LACDTOLostModeProviderAKAdapter_lostModeStateWithCompletion___block_invoke_2_cold_1(a1, v2, v5);

    v6 = *(_QWORD *)(a1 + 56);
    +[LACDTOLostModeState nullInstance](LACDTOLostModeState, "nullInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v7);

  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(_QWORD *)(a1 + 40);
      v9 = *(_QWORD *)(a1 + 48);
      v10 = 138543618;
      v11 = v8;
      v12 = 2112;
      v13 = v9;
      _os_log_impl(&dword_2409DC000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ did finish query with value: %@", (uint8_t *)&v10, 0x16u);
    }

    objc_storeStrong((id *)(*(_QWORD *)(a1 + 40) + 16), *(id *)(a1 + 48));
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
}

- (void)_lostModeStateWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (getAKDeviceListRequestContextClass() && getAKAccountManagerClass() && getAKAppleIDAuthenticationControllerClass())
  {
    -[LACDTODeviceInfoProvider serialNumber](self->_deviceInfo, "serialNumber");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5 && objc_msgSend(v5, "length"))
    {
      objc_msgSend(getAKAccountManagerClass(), "sharedInstance");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(getAKAccountManagerClass(), "sharedInstance");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "primaryAuthKitAccount");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "altDSIDForAccount:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10 && objc_msgSend(v10, "length"))
      {
        v11 = objc_alloc_init((Class)getAKDeviceListRequestContextClass());
        objc_msgSend(v11, "setAltDSID:", v10);
        v19[0] = v6;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v19, 1);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setSerialNumbers:", v12);

        objc_msgSend(v11, "setFetchDeviceSafetyState:", 1);
        v13 = objc_alloc_init((Class)getAKAppleIDAuthenticationControllerClass());
        v15[0] = MEMORY[0x24BDAC760];
        v15[1] = 3221225472;
        v15[2] = __64__LACDTOLostModeProviderAKAdapter__lostModeStateWithCompletion___block_invoke;
        v15[3] = &unk_2510C1A78;
        v18 = v4;
        v16 = v6;
        v17 = v13;
        v14 = v13;
        objc_msgSend(v14, "deviceListWithContext:completion:", v11, v15);

      }
      else
      {
        +[LACError errorWithCode:debugDescription:](LACError, "errorWithCode:debugDescription:", -1000, CFSTR("Could not determine altDISD for account"));
        v11 = (id)objc_claimAutoreleasedReturnValue();
        (*((void (**)(id, _QWORD, id))v4 + 2))(v4, 0, v11);
      }

    }
    else
    {
      +[LACError errorWithCode:debugDescription:](LACError, "errorWithCode:debugDescription:", -1000, CFSTR("Could not determine device SN"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, void *))v4 + 2))(v4, 0, v10);
    }

  }
  else
  {
    +[LACError errorWithCode:debugDescription:](LACError, "errorWithCode:debugDescription:", -1020, CFSTR("Missing AuthKit dependencies"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v4 + 2))(v4, 0, v6);
  }

}

void __64__LACDTOLostModeProviderAKAdapter__lostModeStateWithCompletion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _BOOL8 v13;
  uint64_t v14;
  LACDTOLostModeState *v15;
  uint64_t v16;
  id v17;
  _QWORD v18[4];
  id v19;

  v5 = a2;
  v17 = v5;
  if (a3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    objc_msgSend(v5, "deviceList");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __64__LACDTOLostModeProviderAKAdapter__lostModeStateWithCompletion___block_invoke_2;
    v18[3] = &unk_2510C1A50;
    v19 = *(id *)(a1 + 32);
    v7 = objc_msgSend(v6, "indexOfObjectPassingTest:", v18);

    if (v7 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v8 = *(_QWORD *)(a1 + 48);
      +[LACError errorWithCode:debugDescription:](LACError, "errorWithCode:debugDescription:", -1000, CFSTR("Could not determine safety state. Device not found."));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v8 + 16))(v8, 0, v9);
    }
    else
    {
      objc_msgSend(v17, "deviceList");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectAtIndex:", v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v9, "deviceRestrictionState");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      if (v11)
      {
        v13 = objc_msgSend(v11, "reason") != 1;
        v14 = *(_QWORD *)(a1 + 48);
        v15 = -[LACDTOLostModeState initWithIsInLostMode:confirmed:]([LACDTOLostModeState alloc], "initWithIsInLostMode:confirmed:", v13, 1);
        (*(void (**)(uint64_t, LACDTOLostModeState *, _QWORD))(v14 + 16))(v14, v15, 0);
      }
      else
      {
        v16 = *(_QWORD *)(a1 + 48);
        +[LACError errorWithCode:debugDescription:](LACError, "errorWithCode:debugDescription:", -1000, CFSTR("Could not determine safety state. Missing value"));
        v15 = (LACDTOLostModeState *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, _QWORD, LACDTOLostModeState *))(v16 + 16))(v16, 0, v15);
      }

    }
  }

}

uint64_t __64__LACDTOLostModeProviderAKAdapter__lostModeStateWithCompletion___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned __int8 *a4)
{
  void *v6;

  objc_msgSend(a2, "serialNumber");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  *a4 = objc_msgSend(v6, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return *a4;
}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<%@ %p>"), objc_opt_class(), self);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceInfo, 0);
  objc_storeStrong((id *)&self->_lostModeState, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
}

void __63__LACDTOLostModeProviderAKAdapter_lostModeStateWithCompletion___block_invoke_2_cold_1(uint64_t a1, uint64_t *a2, os_log_t log)
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *a2;
  v5 = 138543618;
  v6 = v3;
  v7 = 2114;
  v8 = v4;
  _os_log_error_impl(&dword_2409DC000, log, OS_LOG_TYPE_ERROR, "%{public}@ did finish query with error: %{public}@", (uint8_t *)&v5, 0x16u);
}

@end
