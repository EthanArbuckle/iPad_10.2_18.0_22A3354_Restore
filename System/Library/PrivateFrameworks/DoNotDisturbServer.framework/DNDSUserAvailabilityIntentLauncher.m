@implementation DNDSUserAvailabilityIntentLauncher

- (DNDSUserAvailabilityIntentLauncher)initWithApplicationRecord:(id)a3 available:(BOOL)a4
{
  id v7;
  DNDSUserAvailabilityIntentLauncher *v8;
  DNDSUserAvailabilityIntentLauncher *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)DNDSUserAvailabilityIntentLauncher;
  v8 = -[DNDSUserAvailabilityIntentLauncher init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_applicationRecord, a3);
    v9->_available = a4;
  }

  return v9;
}

- (void)launchIntentExtensionWithCompletion:(id)a3
{
  id v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  INCExtensionConnection *v11;
  INCExtensionConnection *connection;
  INCExtensionConnection *v13;
  uint64_t v14;
  id v15;
  INCExtensionConnection *v16;
  id v17;
  INCExtensionConnection *v18;
  id v19;
  _QWORD v20[5];
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  _QWORD v25[4];
  id v26;
  id v27;
  id location;

  v4 = a3;
  v5 = objc_alloc(MEMORY[0x1E0CBDBE0]);
  v6 = objc_alloc(MEMORY[0x1E0CBD8C0]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", !self->_available);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithIsFocused:", v7);
  v9 = (void *)objc_msgSend(v5, "initWithFocusStatus:", v8);

  -[LSApplicationRecord bundleIdentifier](self->_applicationRecord, "bundleIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_setLaunchId:", v10);

  v11 = (INCExtensionConnection *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3E530]), "initWithIntent:", v9);
  connection = self->_connection;
  self->_connection = v11;

  objc_initWeak(&location, self);
  -[INCExtensionConnection setRequiresTCC:](self->_connection, "setRequiresTCC:", 0);
  v13 = self->_connection;
  v14 = MEMORY[0x1E0C809B0];
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __74__DNDSUserAvailabilityIntentLauncher_launchIntentExtensionWithCompletion___block_invoke;
  v25[3] = &unk_1E86A6E30;
  objc_copyWeak(&v27, &location);
  v15 = v4;
  v26 = v15;
  -[INCExtensionConnection setTimeoutHandler:](v13, "setTimeoutHandler:", v25);
  v16 = self->_connection;
  v22[0] = v14;
  v22[1] = 3221225472;
  v22[2] = __74__DNDSUserAvailabilityIntentLauncher_launchIntentExtensionWithCompletion___block_invoke_4;
  v22[3] = &unk_1E86A6E30;
  objc_copyWeak(&v24, &location);
  v17 = v15;
  v23 = v17;
  -[INCExtensionConnection setInterruptionHandler:](v16, "setInterruptionHandler:", v22);
  v18 = self->_connection;
  v20[0] = v14;
  v20[1] = 3221225472;
  v20[2] = __74__DNDSUserAvailabilityIntentLauncher_launchIntentExtensionWithCompletion___block_invoke_5;
  v20[3] = &unk_1E86A6E80;
  v20[4] = self;
  v19 = v17;
  v21 = v19;
  -[INCExtensionConnection resumeWithCompletionHandler:](v18, "resumeWithCompletionHandler:", v20);

  objc_destroyWeak(&v24);
  objc_destroyWeak(&v27);
  objc_destroyWeak(&location);

}

void __74__DNDSUserAvailabilityIntentLauncher_launchIntentExtensionWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;

  v3 = a2;
  if (os_log_type_enabled((os_log_t)DNDSLogStateProvider, OS_LOG_TYPE_ERROR))
    __74__DNDSUserAvailabilityIntentLauncher_launchIntentExtensionWithCompletion___block_invoke_cold_1();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained, "_cleanupWithError:completion:", v3, *(_QWORD *)(a1 + 32));

}

void __74__DNDSUserAvailabilityIntentLauncher_launchIntentExtensionWithCompletion___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;

  v3 = a2;
  if (os_log_type_enabled((os_log_t)DNDSLogStateProvider, OS_LOG_TYPE_ERROR))
    __74__DNDSUserAvailabilityIntentLauncher_launchIntentExtensionWithCompletion___block_invoke_4_cold_1();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained, "_cleanupWithError:completion:", v3, *(_QWORD *)(a1 + 32));

}

void __74__DNDSUserAvailabilityIntentLauncher_launchIntentExtensionWithCompletion___block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  _QWORD v9[5];
  id v10;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (!v5 || v6)
  {
    if (os_log_type_enabled((os_log_t)DNDSLogStateProvider, OS_LOG_TYPE_ERROR))
      __74__DNDSUserAvailabilityIntentLauncher_launchIntentExtensionWithCompletion___block_invoke_5_cold_1();
    objc_msgSend(*(id *)(a1 + 32), "_cleanupWithError:completion:", v7, *(_QWORD *)(a1 + 40));
  }
  else
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __74__DNDSUserAvailabilityIntentLauncher_launchIntentExtensionWithCompletion___block_invoke_6;
    v9[3] = &unk_1E86A6E58;
    v8 = *(void **)(a1 + 40);
    v9[4] = *(_QWORD *)(a1 + 32);
    v10 = v8;
    objc_msgSend(v5, "handleIntentWithCompletionHandler:", v9);

  }
}

void __74__DNDSUserAvailabilityIntentLauncher_launchIntentExtensionWithCompletion___block_invoke_6(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  unsigned __int8 *v8;
  unsigned __int8 v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (!v5 || v6)
  {
    if (os_log_type_enabled((os_log_t)DNDSLogStateProvider, OS_LOG_TYPE_ERROR))
      __74__DNDSUserAvailabilityIntentLauncher_launchIntentExtensionWithCompletion___block_invoke_6_cold_1();
    v13 = *(void **)(a1 + 32);
    objc_msgSend(v7, "underlyingError");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "_cleanupWithError:completion:", v14, *(_QWORD *)(a1 + 40));

  }
  else
  {
    v8 = (unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 25);
    do
      v9 = __ldaxr(v8);
    while (__stlxr(1u, v8));
    if ((v9 & 1) == 0)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "reset");
      v10 = *(_QWORD *)(a1 + 32);
      v11 = *(void **)(v10 + 8);
      *(_QWORD *)(v10 + 8) = 0;

      v12 = *(_QWORD *)(a1 + 40);
      if (v12)
        (*(void (**)(uint64_t, id, _QWORD))(v12 + 16))(v12, v5, 0);
    }
  }

}

- (void)_cleanupWithError:(id)a3 completion:(id)a4
{
  void (**v6)(id, _QWORD, id);
  atomic_flag *p_completionFiredFlag;
  unsigned __int8 v8;
  INCExtensionConnection *connection;
  id v10;

  v10 = a3;
  v6 = (void (**)(id, _QWORD, id))a4;
  p_completionFiredFlag = &self->_completionFiredFlag;
  do
    v8 = __ldaxr((unsigned __int8 *)p_completionFiredFlag);
  while (__stlxr(1u, (unsigned __int8 *)p_completionFiredFlag));
  if ((v8 & 1) == 0)
  {
    -[INCExtensionConnection reset](self->_connection, "reset");
    connection = self->_connection;
    self->_connection = 0;

    if (v6)
      v6[2](v6, 0, v10);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_applicationRecord, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

void __74__DNDSUserAvailabilityIntentLauncher_launchIntentExtensionWithCompletion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_1CB895000, v0, v1, "INCExtensionConnection timeout!! %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __74__DNDSUserAvailabilityIntentLauncher_launchIntentExtensionWithCompletion___block_invoke_4_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_1CB895000, v0, v1, "INCExtensionConnection interrupted!! %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __74__DNDSUserAvailabilityIntentLauncher_launchIntentExtensionWithCompletion___block_invoke_5_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_1CB895000, v0, v1, "INCExtensionConnection resumeWithCompletionHandler error!! %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __74__DNDSUserAvailabilityIntentLauncher_launchIntentExtensionWithCompletion___block_invoke_6_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_1CB895000, v0, v1, "INCExtensionConnection proxy handle error!! %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
