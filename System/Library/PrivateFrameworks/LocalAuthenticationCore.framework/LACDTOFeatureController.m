@implementation LACDTOFeatureController

- (LACDTOFeatureController)initWithKVStore:(id)a3 requirementsDataSource:(id)a4 workQueue:(id)a5
{
  id v9;
  id v10;
  id v11;
  LACDTOFeatureController *v12;
  LACDTOFeatureController *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)LACDTOFeatureController;
  v12 = -[LACDTOFeatureController init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_kvStore, a3);
    objc_storeStrong((id *)&v13->_requirementsDataSource, a4);
    objc_storeStrong((id *)&v13->_workQueue, a5);
  }

  return v13;
}

- (void)fetchStateWithCompletion:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __52__LACDTOFeatureController_fetchStateWithCompletion___block_invoke;
  v6[3] = &unk_2510C2800;
  objc_copyWeak(&v8, &location);
  v5 = v4;
  v7 = v5;
  -[LACDTOFeatureController checkIsFeatureSupportedWithCompletion:](self, "checkIsFeatureSupportedWithCompletion:", v6);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);

}

void __52__LACDTOFeatureController_fetchStateWithCompletion___block_invoke(uint64_t a1, char a2)
{
  id WeakRetained;
  void *v5;
  _QWORD v6[5];
  id v7;
  char v8;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __52__LACDTOFeatureController_fetchStateWithCompletion___block_invoke_2;
    v6[3] = &unk_2510C27D8;
    v6[4] = WeakRetained;
    v7 = *(id *)(a1 + 32);
    v8 = a2;
    objc_msgSend(v5, "checkIsFeatureAvailableWithCompletion:", v6);

  }
}

void __52__LACDTOFeatureController_fetchStateWithCompletion___block_invoke_2(uint64_t a1, char a2)
{
  void *v2;
  _QWORD v5[5];
  id v6;
  char v7;
  char v8;

  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __52__LACDTOFeatureController_fetchStateWithCompletion___block_invoke_3;
    v5[3] = &unk_2510C27B0;
    v5[4] = v2;
    v6 = *(id *)(a1 + 40);
    v7 = *(_BYTE *)(a1 + 48);
    v8 = a2;
    objc_msgSend(v2, "checkIsFeatureEnabledWithCompletion:", v5);

  }
}

void __52__LACDTOFeatureController_fetchStateWithCompletion___block_invoke_3(uint64_t a1, char a2)
{
  void *v2;
  _QWORD v5[5];
  id v6;
  __int16 v7;
  char v8;

  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __52__LACDTOFeatureController_fetchStateWithCompletion___block_invoke_4;
    v5[3] = &unk_2510C2788;
    v5[4] = v2;
    v6 = *(id *)(a1 + 40);
    v7 = *(_WORD *)(a1 + 48);
    v8 = a2;
    objc_msgSend(v2, "checkIsFeatureStrictModeEnabledWithCompletion:", v5);

  }
}

void __52__LACDTOFeatureController_fetchStateWithCompletion___block_invoke_4(uint64_t a1, char a2)
{
  void *v2;
  _QWORD v5[5];
  id v6;
  char v7;
  __int16 v8;
  char v9;

  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __52__LACDTOFeatureController_fetchStateWithCompletion___block_invoke_5;
    v5[3] = &unk_2510C2760;
    v5[4] = v2;
    v6 = *(id *)(a1 + 40);
    v7 = *(_BYTE *)(a1 + 48);
    v8 = *(_WORD *)(a1 + 49);
    v9 = a2;
    objc_msgSend(v2, "_fetchRequirementsWithCompletion:", v5);

  }
}

void __52__LACDTOFeatureController_fetchStateWithCompletion___block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  int v9;

  v3 = a2;
  if (*(_QWORD *)(a1 + 32))
  {
    v4 = *(_QWORD *)(a1 + 40);
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __52__LACDTOFeatureController_fetchStateWithCompletion___block_invoke_6;
    v7[3] = &unk_2510C2738;
    v9 = *(_DWORD *)(a1 + 48);
    v6 = v3;
    v8 = v3;
    __52__LACDTOFeatureController_fetchStateWithCompletion___block_invoke_6((uint64_t)v7);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);

    v3 = v6;
  }

}

LACDTOMutableFeatureState *__52__LACDTOFeatureController_fetchStateWithCompletion___block_invoke_6(uint64_t a1)
{
  LACDTOMutableFeatureState *v2;

  v2 = objc_alloc_init(LACDTOMutableFeatureState);
  -[LACDTOMutableFeatureState setIsSupported:](v2, "setIsSupported:", *(unsigned __int8 *)(a1 + 40));
  -[LACDTOMutableFeatureState setIsAvailable:](v2, "setIsAvailable:", *(unsigned __int8 *)(a1 + 41));
  -[LACDTOMutableFeatureState setIsEnabled:](v2, "setIsEnabled:", *(unsigned __int8 *)(a1 + 42));
  -[LACDTOMutableFeatureState setIsStrictModeEnabled:](v2, "setIsStrictModeEnabled:", *(unsigned __int8 *)(a1 + 43));
  -[LACDTOMutableFeatureState setRequirements:](v2, "setRequirements:", *(_QWORD *)(a1 + 32));
  return v2;
}

- (void)checkIsFeatureEnabledWithCompletion:(id)a3
{
  id v4;
  LACDTOKVStore *kvStore;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  objc_initWeak(&location, self);
  kvStore = self->_kvStore;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __63__LACDTOFeatureController_checkIsFeatureEnabledWithCompletion___block_invoke;
  v7[3] = &unk_2510C1118;
  objc_copyWeak(&v9, &location);
  v6 = v4;
  v8 = v6;
  -[LACDTOKVStore valueForKey:completion:](kvStore, "valueForKey:completion:", 0, v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

}

void __63__LACDTOFeatureController_checkIsFeatureEnabledWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  NSObject *v8;
  NSObject *v9;
  int v10;
  const char *v11;
  int v12;
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    LACLogDTOFeature();
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v6)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        __63__LACDTOFeatureController_checkIsFeatureEnabledWithCompletion___block_invoke_cold_1();

      (*(void (**)(_QWORD, _QWORD, id))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), 0, v6);
    }
    else
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v10 = objc_msgSend(v5, "BOOLValue");
        v11 = "NO";
        if (v10)
          v11 = "YES";
        v12 = 136315138;
        v13 = v11;
        _os_log_impl(&dword_2409DC000, v9, OS_LOG_TYPE_DEFAULT, "isFeatureEnabled: %s", (uint8_t *)&v12, 0xCu);
      }

      (*(void (**)(_QWORD, uint64_t, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), objc_msgSend(v5, "BOOLValue"), 0);
    }
  }

}

- (void)checkIsFeatureStrictModeEnabledWithCompletion:(id)a3
{
  id v4;
  LACDTOKVStore *kvStore;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  objc_initWeak(&location, self);
  kvStore = self->_kvStore;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __73__LACDTOFeatureController_checkIsFeatureStrictModeEnabledWithCompletion___block_invoke;
  v7[3] = &unk_2510C1118;
  objc_copyWeak(&v9, &location);
  v6 = v4;
  v8 = v6;
  -[LACDTOKVStore valueForKey:completion:](kvStore, "valueForKey:completion:", 4, v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

}

void __73__LACDTOFeatureController_checkIsFeatureStrictModeEnabledWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  NSObject *v8;
  NSObject *v9;
  int v10;
  const char *v11;
  int v12;
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    LACLogDTOFeature();
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v6)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        __73__LACDTOFeatureController_checkIsFeatureStrictModeEnabledWithCompletion___block_invoke_cold_1();

      (*(void (**)(_QWORD, _QWORD, id))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), 0, v6);
    }
    else
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v10 = objc_msgSend(v5, "BOOLValue");
        v11 = "NO";
        if (v10)
          v11 = "YES";
        v12 = 136315138;
        v13 = v11;
        _os_log_impl(&dword_2409DC000, v9, OS_LOG_TYPE_DEFAULT, "isFeatureStrictModeEnabled: %s", (uint8_t *)&v12, 0xCu);
      }

      (*(void (**)(_QWORD, uint64_t, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), objc_msgSend(v5, "BOOLValue"), 0);
    }
  }

}

- (void)checkIsFeatureSupportedWithCompletion:(id)a3
{
  NSObject *workQueue;
  void (**v5)(id, uint64_t, _QWORD);
  NSObject *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  workQueue = self->_workQueue;
  v5 = (void (**)(id, uint64_t, _QWORD))a3;
  dispatch_assert_queue_V2(workQueue);
  if (-[LACDTOFeatureRequirementsDataSource isPhone](self->_requirementsDataSource, "isPhone"))
  {
    LACLogDTOFeature();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v10) = 0;
      _os_log_impl(&dword_2409DC000, v6, OS_LOG_TYPE_DEFAULT, "isFeatureSupported: YES", (uint8_t *)&v10, 2u);
    }

    v5[2](v5, 1, 0);
    v7 = v5;
  }
  else
  {
    +[LACLocalization dtoErrorDeviceTypeNotSupported](LACLocalization, "dtoErrorDeviceTypeNotSupported");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[LACError errorWithCode:localizedDescription:](LACError, "errorWithCode:localizedDescription:", -1027, v8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    LACLogDTOFeature();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 138543362;
      v11 = v7;
      _os_log_impl(&dword_2409DC000, v9, OS_LOG_TYPE_DEFAULT, "isFeatureSupported: NO (%{public}@)", (uint8_t *)&v10, 0xCu);
    }

    ((void (**)(id, uint64_t, void *))v5)[2](v5, 0, v7);
  }

}

- (void)checkIsFeatureAvailableWithCompletion:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id location;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __65__LACDTOFeatureController_checkIsFeatureAvailableWithCompletion___block_invoke;
  v6[3] = &unk_2510C2800;
  objc_copyWeak(&v8, &location);
  v5 = v4;
  v7 = v5;
  -[LACDTOFeatureController checkIsFeatureSupportedWithCompletion:](self, "checkIsFeatureSupportedWithCompletion:", v6);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);

}

void __65__LACDTOFeatureController_checkIsFeatureAvailableWithCompletion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  id *WeakRetained;
  id *v7;
  NSObject *v8;
  void (*v9)(void);
  void *v10;
  void *v11;
  NSObject *v12;
  _QWORD v13[4];
  id v14;
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v7 = WeakRetained;
  if (WeakRetained)
  {
    if (v5 || (a2 & 1) == 0)
    {
      v9 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
LABEL_10:
      v9();
      goto LABEL_15;
    }
    if ((objc_msgSend(WeakRetained[2], "hasPasscodeSetForCurrentUser") & 1) != 0)
    {
      if ((objc_msgSend(v7[2], "hasBiometricEnrollmentsForCurrentUser") & 1) == 0)
      {
        v13[0] = MEMORY[0x24BDAC760];
        v13[1] = 3221225472;
        v13[2] = __65__LACDTOFeatureController_checkIsFeatureAvailableWithCompletion___block_invoke_8;
        v13[3] = &unk_2510C0BE8;
        v14 = *(id *)(a1 + 32);
        objc_msgSend(v7, "checkIsFeatureEnabledWithCompletion:", v13);

        goto LABEL_15;
      }
      LACLogDTOFeature();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2409DC000, v8, OS_LOG_TYPE_DEFAULT, "isFeatureAvailable: YES", buf, 2u);
      }

      v9 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
      goto LABEL_10;
    }
    +[LACLocalization dtoErrorPasscodeNotSet](LACLocalization, "dtoErrorPasscodeNotSet");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[LACError errorWithCode:localizedDescription:](LACError, "errorWithCode:localizedDescription:", -5, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    LACLogDTOFeature();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v16 = v11;
      _os_log_impl(&dword_2409DC000, v12, OS_LOG_TYPE_DEFAULT, "isFeatureAvailable: NO (%{public}@)", buf, 0xCu);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
LABEL_15:

}

void __65__LACDTOFeatureController_checkIsFeatureAvailableWithCompletion___block_invoke_8(uint64_t a1, int a2, uint64_t a3)
{
  NSObject *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  if (a3 || !a2)
  {
    +[LACLocalization dtoErrorBiometryNotEnrolled](LACLocalization, "dtoErrorBiometryNotEnrolled");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[LACError errorWithCode:localizedDescription:](LACError, "errorWithCode:localizedDescription:", -7, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    LACLogDTOFeature();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 138543362;
      v9 = v6;
      _os_log_impl(&dword_2409DC000, v7, OS_LOG_TYPE_DEFAULT, "isFeatureAvailable: NO (%{public}@)", (uint8_t *)&v8, 0xCu);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    LACLogDTOFeature();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v8) = 0;
      _os_log_impl(&dword_2409DC000, v4, OS_LOG_TYPE_DEFAULT, "isFeatureAvailable = isFeatureEnabled = YES", (uint8_t *)&v8, 2u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
}

- (void)checkCanEnableFeatureWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;
  id location;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  objc_msgSend(MEMORY[0x24BDD1988], "currentConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __63__LACDTOFeatureController_checkCanEnableFeatureWithCompletion___block_invoke;
  v8[3] = &unk_2510C2828;
  objc_copyWeak(&v11, &location);
  v6 = v4;
  v10 = v6;
  v7 = v5;
  v9 = v7;
  -[LACDTOFeatureController checkIsFeatureAvailableWithCompletion:](self, "checkIsFeatureAvailableWithCompletion:", v8);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

}

void __63__LACDTOFeatureController_checkCanEnableFeatureWithCompletion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  NSObject *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v7 = WeakRetained;
  if (WeakRetained)
  {
    if (!v5 && (a2 & 1) == 0)
      __63__LACDTOFeatureController_checkCanEnableFeatureWithCompletion___block_invoke_cold_1();
    if (v5)
    {
      LACLogDTOFeature();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v9 = 138543362;
        v10 = v5;
        _os_log_impl(&dword_2409DC000, v8, OS_LOG_TYPE_DEFAULT, "isFeatureEnabled: NO (%{public}@)", (uint8_t *)&v9, 0xCu);
      }

      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    }
    else
    {
      objc_msgSend(WeakRetained, "_fetchDeviceHintsCurrentConnection:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
    }
  }

}

- (void)enableFeatureWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;
  id location;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  objc_msgSend(MEMORY[0x24BDD1988], "currentConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __55__LACDTOFeatureController_enableFeatureWithCompletion___block_invoke;
  v8[3] = &unk_2510C2850;
  objc_copyWeak(&v11, &location);
  v6 = v4;
  v10 = v6;
  v7 = v5;
  v9 = v7;
  -[LACDTOFeatureController checkCanEnableFeatureWithCompletion:](self, "checkCanEnableFeatureWithCompletion:", v8);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

}

void __55__LACDTOFeatureController_enableFeatureWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  NSObject *v8;
  uint64_t v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  uint8_t buf[4];
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    if (v6)
    {
      LACLogDTOFeature();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v15 = v6;
        _os_log_impl(&dword_2409DC000, v8, OS_LOG_TYPE_DEFAULT, "isFeatureEnabled: NO (%{public}@)", buf, 0xCu);
      }

      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    }
    else
    {
      v9 = *(_QWORD *)(a1 + 32);
      v10[0] = MEMORY[0x24BDAC760];
      v10[1] = 3221225472;
      v10[2] = __55__LACDTOFeatureController_enableFeatureWithCompletion___block_invoke_12;
      v10[3] = &unk_2510C1420;
      objc_copyWeak(&v13, (id *)(a1 + 48));
      v12 = *(id *)(a1 + 40);
      v11 = v5;
      objc_msgSend(WeakRetained, "_setFeatureEnabled:context:connection:completion:", 1, 0, v9, v10);

      objc_destroyWeak(&v13);
    }
  }

}

void __55__LACDTOFeatureController_enableFeatureWithCompletion___block_invoke_12(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;
  NSObject *v6;
  void (*v7)(void);
  uint8_t v8[16];

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    LACLogDTOFeature();
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v3)
    {
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        __55__LACDTOFeatureController_enableFeatureWithCompletion___block_invoke_12_cold_1();

      v7 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
    }
    else
    {
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v8 = 0;
        _os_log_impl(&dword_2409DC000, v6, OS_LOG_TYPE_DEFAULT, "isFeatureEnabled: YES", v8, 2u);
      }

      v7 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
    }
    v7();
  }

}

- (void)disableFeatureWithContext:(id)a3 completion:(id)a4
{
  NSObject *workQueue;
  id v7;
  id v8;
  id v9;

  workQueue = self->_workQueue;
  v7 = a4;
  v8 = a3;
  dispatch_assert_queue_V2(workQueue);
  objc_msgSend(MEMORY[0x24BDD1988], "currentConnection");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[LACDTOFeatureController _setFeatureEnabled:context:connection:completion:](self, "_setFeatureEnabled:context:connection:completion:", 0, v8, v9, v7);

}

- (void)enableFeatureStrictModeWithCompletion:(id)a3
{
  NSObject *workQueue;
  id v5;
  id v6;

  workQueue = self->_workQueue;
  v5 = a3;
  dispatch_assert_queue_V2(workQueue);
  objc_msgSend(MEMORY[0x24BDD1988], "currentConnection");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[LACDTOFeatureController _setFeatureStrictModeEnabled:context:connection:completion:](self, "_setFeatureStrictModeEnabled:context:connection:completion:", 1, 0, v6, v5);

}

- (void)disableFeatureStrictModeWithContext:(id)a3 completion:(id)a4
{
  NSObject *workQueue;
  id v7;
  id v8;
  id v9;

  workQueue = self->_workQueue;
  v7 = a4;
  v8 = a3;
  dispatch_assert_queue_V2(workQueue);
  objc_msgSend(MEMORY[0x24BDD1988], "currentConnection");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[LACDTOFeatureController _setFeatureStrictModeEnabled:context:connection:completion:](self, "_setFeatureStrictModeEnabled:context:connection:completion:", 0, v8, v9, v7);

}

- (void)_setFeatureEnabled:(BOOL)a3 context:(id)a4 connection:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  id v20;
  BOOL v21;
  id location;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  objc_initWeak(&location, self);
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __76__LACDTOFeatureController__setFeatureEnabled_context_connection_completion___block_invoke;
  v16[3] = &unk_2510C28A0;
  objc_copyWeak(&v20, &location);
  v13 = v12;
  v19 = v13;
  v21 = a3;
  v14 = v10;
  v17 = v14;
  v15 = v11;
  v18 = v15;
  -[LACDTOFeatureController checkIsFeatureEnabledWithCompletion:](self, "checkIsFeatureEnabledWithCompletion:", v16);

  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);

}

void __76__LACDTOFeatureController__setFeatureEnabled_context_connection_completion___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  id WeakRetained;
  void (*v7)(void);
  LACDTOKVStoreValue *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v11[4];
  id v12;
  id v13;
  char v14;

  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    if (v5)
    {
      v7 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
    }
    else
    {
      if (*(unsigned __int8 *)(a1 + 64) != a2)
      {
        v8 = -[LACDTOKVStoreValue initWithBoolValue:]([LACDTOKVStoreValue alloc], "initWithBoolValue:", *(unsigned __int8 *)(a1 + 64));
        v9 = *(_QWORD *)(a1 + 32);
        v10 = *(_QWORD *)(a1 + 40);
        v11[0] = MEMORY[0x24BDAC760];
        v11[1] = 3221225472;
        v11[2] = __76__LACDTOFeatureController__setFeatureEnabled_context_connection_completion___block_invoke_2;
        v11[3] = &unk_2510C2878;
        objc_copyWeak(&v13, (id *)(a1 + 56));
        v12 = *(id *)(a1 + 48);
        v14 = *(_BYTE *)(a1 + 64);
        objc_msgSend(WeakRetained, "_setValue:forKey:contextUUID:connection:completion:", v8, 0, v9, v10, v11);

        objc_destroyWeak(&v13);
        goto LABEL_7;
      }
      v7 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
    }
    v7();
  }
LABEL_7:

}

void __76__LACDTOFeatureController__setFeatureEnabled_context_connection_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id WeakRetained;
  LACDTOEvent *v4;
  void *v5;
  LACDTOEvent *v6;
  void *v7;
  id v8;

  v8 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    if (!v8)
    {
      v4 = [LACDTOEvent alloc];
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", *(unsigned __int8 *)(a1 + 48));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = -[LACDTOEvent initWithRawValue:value:](v4, "initWithRawValue:value:", 2, v5);

      objc_msgSend(WeakRetained, "eventBus");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "dispatchEvent:sender:", v6, WeakRetained);

    }
  }

}

- (void)_setFeatureStrictModeEnabled:(BOOL)a3 context:(id)a4 connection:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  id v20;
  BOOL v21;
  id location;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  objc_initWeak(&location, self);
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __86__LACDTOFeatureController__setFeatureStrictModeEnabled_context_connection_completion___block_invoke;
  v16[3] = &unk_2510C28A0;
  objc_copyWeak(&v20, &location);
  v13 = v12;
  v19 = v13;
  v21 = a3;
  v14 = v10;
  v17 = v14;
  v15 = v11;
  v18 = v15;
  -[LACDTOFeatureController checkIsFeatureStrictModeEnabledWithCompletion:](self, "checkIsFeatureStrictModeEnabledWithCompletion:", v16);

  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);

}

void __86__LACDTOFeatureController__setFeatureStrictModeEnabled_context_connection_completion___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  id WeakRetained;
  void (*v7)(void);
  LACDTOKVStoreValue *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v11[4];
  id v12;
  id v13;
  char v14;

  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    if (v5)
    {
      v7 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
    }
    else
    {
      if (*(unsigned __int8 *)(a1 + 64) != a2)
      {
        v8 = -[LACDTOKVStoreValue initWithBoolValue:]([LACDTOKVStoreValue alloc], "initWithBoolValue:", *(unsigned __int8 *)(a1 + 64));
        v9 = *(_QWORD *)(a1 + 32);
        v10 = *(_QWORD *)(a1 + 40);
        v11[0] = MEMORY[0x24BDAC760];
        v11[1] = 3221225472;
        v11[2] = __86__LACDTOFeatureController__setFeatureStrictModeEnabled_context_connection_completion___block_invoke_2;
        v11[3] = &unk_2510C2878;
        objc_copyWeak(&v13, (id *)(a1 + 56));
        v12 = *(id *)(a1 + 48);
        v14 = *(_BYTE *)(a1 + 64);
        objc_msgSend(WeakRetained, "_setValue:forKey:contextUUID:connection:completion:", v8, 4, v9, v10, v11);

        objc_destroyWeak(&v13);
        goto LABEL_7;
      }
      v7 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
    }
    v7();
  }
LABEL_7:

}

void __86__LACDTOFeatureController__setFeatureStrictModeEnabled_context_connection_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id WeakRetained;
  LACDTOEvent *v4;
  void *v5;
  LACDTOEvent *v6;
  void *v7;
  id v8;

  v8 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    if (!v8)
    {
      v4 = [LACDTOEvent alloc];
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", *(unsigned __int8 *)(a1 + 48));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = -[LACDTOEvent initWithRawValue:value:](v4, "initWithRawValue:value:", 3, v5);

      objc_msgSend(WeakRetained, "eventBus");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "dispatchEvent:sender:", v6, WeakRetained);

    }
  }

}

- (void)_setValue:(id)a3 forKey:(int64_t)a4 contextUUID:(id)a5 connection:(id)a6 completion:(id)a7
{
  LACDTOKVStore *kvStore;

  kvStore = self->_kvStore;
  if (a5)
    -[LACDTOKVStore setValue:forKey:contextUUID:connection:completion:](kvStore, "setValue:forKey:contextUUID:connection:completion:", a3, a4, a5, a6, a7);
  else
    -[LACDTOKVStore setValue:forKey:connection:completion:](kvStore, "setValue:forKey:connection:completion:", a3, a4, a6, a7);
}

- (void)_fetchDeviceHintsCurrentConnection:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  LACDTOKVStore *kvStore;
  id v9;
  _QWORD v10[4];
  id v11;
  _QWORD *v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x3032000000;
  v14[3] = __Block_byref_object_copy__7;
  v14[4] = __Block_byref_object_dispose__7;
  v15 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  kvStore = self->_kvStore;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __73__LACDTOFeatureController__fetchDeviceHintsCurrentConnection_completion___block_invoke;
  v10[3] = &unk_2510C28F0;
  objc_copyWeak(&v13, &location);
  v12 = v14;
  v9 = v7;
  v11 = v9;
  -[LACDTOKVStore valueForKey:connection:completion:](kvStore, "valueForKey:connection:completion:", 3, v6, v10);

  objc_destroyWeak(&v13);
  _Block_object_dispose(v14, 8);

  objc_destroyWeak(&location);
}

void __73__LACDTOFeatureController__fetchDeviceHintsCurrentConnection_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  _QWORD *WeakRetained;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  __int128 v14;
  _QWORD v15[4];
  __int128 v16;
  id v17;

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    if (v6)
    {
      LACLogDTOFeature();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        __73__LACDTOFeatureController__fetchDeviceHintsCurrentConnection_completion___block_invoke_cold_1();

    }
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v5, "BOOLValue"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v9, v11);

    v12 = (void *)WeakRetained[2];
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __73__LACDTOFeatureController__fetchDeviceHintsCurrentConnection_completion___block_invoke_19;
    v15[3] = &unk_2510C28C8;
    objc_copyWeak(&v17, (id *)(a1 + 48));
    v14 = *(_OWORD *)(a1 + 32);
    v13 = (id)v14;
    v16 = v14;
    objc_msgSend(v12, "hasLocationServicesEnabledWithCompletion:", v15);

    objc_destroyWeak(&v17);
  }

}

void __73__LACDTOFeatureController__fetchDeviceHintsCurrentConnection_completion___block_invoke_19(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  _QWORD *WeakRetained;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  __int128 v14;
  _QWORD v15[4];
  __int128 v16;
  id v17;

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    if (v6)
    {
      LACLogDTOFeature();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        __73__LACDTOFeatureController__fetchDeviceHintsCurrentConnection_completion___block_invoke_19_cold_1();

    }
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v5, "BOOLValue"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v9, v11);

    v12 = (void *)WeakRetained[2];
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __73__LACDTOFeatureController__fetchDeviceHintsCurrentConnection_completion___block_invoke_20;
    v15[3] = &unk_2510C28C8;
    objc_copyWeak(&v17, (id *)(a1 + 48));
    v14 = *(_OWORD *)(a1 + 32);
    v13 = (id)v14;
    v16 = v14;
    objc_msgSend(v12, "hasHSA2AccountWithCompletion:", v15);

    objc_destroyWeak(&v17);
  }

}

void __73__LACDTOFeatureController__fetchDeviceHintsCurrentConnection_completion___block_invoke_20(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    if (v6)
    {
      LACLogDTOFeature();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        __73__LACDTOFeatureController__fetchDeviceHintsCurrentConnection_completion___block_invoke_20_cold_1();

    }
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v5, "BOOLValue"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v9, v11);

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

- (void)_fetchRequirementsWithCompletion:(id)a3
{
  void (**v4)(id, LACDTOMutableFeatureRequirements *);
  LACDTOMutableFeatureRequirements *v5;

  v4 = (void (**)(id, LACDTOMutableFeatureRequirements *))a3;
  v5 = objc_alloc_init(LACDTOMutableFeatureRequirements);
  -[LACDTOMutableFeatureRequirements setHasPasscodeSet:](v5, "setHasPasscodeSet:", -[LACDTOFeatureRequirementsDataSource hasPasscodeSetForCurrentUser](self->_requirementsDataSource, "hasPasscodeSetForCurrentUser"));
  -[LACDTOMutableFeatureRequirements setHasBiometricEnrollments:](v5, "setHasBiometricEnrollments:", -[LACDTOFeatureRequirementsDataSource hasBiometricEnrollmentsForCurrentUser](self->_requirementsDataSource, "hasBiometricEnrollmentsForCurrentUser"));
  v4[2](v4, v5);

}

- (LACDTOEventBus)eventBus
{
  return self->eventBus;
}

- (void)setEventBus:(id)a3
{
  objc_storeStrong((id *)&self->eventBus, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->eventBus, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_requirementsDataSource, 0);
  objc_storeStrong((id *)&self->_kvStore, 0);
}

void __63__LACDTOFeatureController_checkIsFeatureEnabledWithCompletion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_2(&dword_2409DC000, v0, v1, "isFeatureEnabled: NO (%{public}@)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __73__LACDTOFeatureController_checkIsFeatureStrictModeEnabledWithCompletion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_2(&dword_2409DC000, v0, v1, "isFeatureStrictModeEnabled: NO (%{public}@)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __63__LACDTOFeatureController_checkCanEnableFeatureWithCompletion___block_invoke_cold_1()
{
  __assert_rtn("-[LACDTOFeatureController checkCanEnableFeatureWithCompletion:]_block_invoke", "LACDTOFeatureController.m", 187, "isAvailable || error != nil");
}

void __55__LACDTOFeatureController_enableFeatureWithCompletion___block_invoke_12_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_2(&dword_2409DC000, v0, v1, "isFeatureEnabled: NO (error: %{public}@)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __73__LACDTOFeatureController__fetchDeviceHintsCurrentConnection_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_2(&dword_2409DC000, v0, v1, "Could not fetch biometric liveness (%{public}@)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __73__LACDTOFeatureController__fetchDeviceHintsCurrentConnection_completion___block_invoke_19_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_2(&dword_2409DC000, v0, v1, "Could not fetch LocationServices status (%{public}@)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __73__LACDTOFeatureController__fetchDeviceHintsCurrentConnection_completion___block_invoke_20_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_2(&dword_2409DC000, v0, v1, "Could not fetch HSA2Account (%{public}@)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

@end
