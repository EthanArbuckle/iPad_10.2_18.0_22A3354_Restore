@implementation DMFEmergencyModeMonitor

- (void)emergencyModeStatusWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;

  v4 = a3;
  -[DMFEmergencyModeMonitor xpcConnection](self, "xpcConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __68__DMFEmergencyModeMonitor_emergencyModeStatusWithCompletionHandler___block_invoke;
  v12[3] = &unk_1E6ED85E0;
  v7 = v4;
  v13 = v7;
  objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v10[0] = v6;
  v10[1] = 3221225472;
  v10[2] = __68__DMFEmergencyModeMonitor_emergencyModeStatusWithCompletionHandler___block_invoke_65;
  v10[3] = &unk_1E6ED8608;
  v11 = v7;
  v9 = v7;
  objc_msgSend(v8, "emergencyModeStatusWithCompletionHandler:", v10);

}

- (NSXPCConnection)xpcConnection
{
  return self->_xpcConnection;
}

- (DMFEmergencyModeMonitor)init
{
  void *v3;
  DMFEmergencyModeMonitor *v4;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.dmd.emergency-mode"), 4096);
  v4 = -[DMFEmergencyModeMonitor initWithXPCConnection:](self, "initWithXPCConnection:", v3);

  return v4;
}

- (DMFEmergencyModeMonitor)initWithXPCConnection:(id)a3
{
  id v5;
  DMFEmergencyModeMonitor *v6;
  DMFEmergencyModeMonitor *v7;
  void *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)DMFEmergencyModeMonitor;
  v6 = -[DMFEmergencyModeMonitor init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_xpcConnection, a3);
    +[DMFEmergencyModeMonitor remoteInterface](DMFEmergencyModeMonitor, "remoteInterface");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](v7->_xpcConnection, "setRemoteObjectInterface:", v8);

    -[NSXPCConnection resume](v7->_xpcConnection, "resume");
  }

  return v7;
}

+ (id)remoteInterface
{
  if (remoteInterface_onceToken != -1)
    dispatch_once(&remoteInterface_onceToken, &__block_literal_global_4);
  return (id)remoteInterface_remoteInterface;
}

void __42__DMFEmergencyModeMonitor_remoteInterface__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EF1DDB50);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)remoteInterface_remoteInterface;
  remoteInterface_remoteInterface = v0;

}

+ (DMFEmergencyModeMonitor)sharedMonitor
{
  if (sharedMonitor_onceToken != -1)
    dispatch_once(&sharedMonitor_onceToken, &__block_literal_global_5);
  return (DMFEmergencyModeMonitor *)(id)sharedMonitor_emergencyModeMonitor;
}

void __40__DMFEmergencyModeMonitor_sharedMonitor__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedMonitor_emergencyModeMonitor;
  sharedMonitor_emergencyModeMonitor = v0;

}

- (void)dealloc
{
  objc_super v3;

  -[NSXPCConnection invalidate](self->_xpcConnection, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)DMFEmergencyModeMonitor;
  -[DMFEmergencyModeMonitor dealloc](&v3, sel_dealloc);
}

- (BOOL)enableEmergencyModeWithError:(id *)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  BOOL v7;
  _QWORD v9[5];
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__1;
  v15 = __Block_byref_object_dispose__1;
  v16 = 0;
  -[DMFEmergencyModeMonitor xpcConnection](self, "xpcConnection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __56__DMFEmergencyModeMonitor_enableEmergencyModeWithError___block_invoke;
  v10[3] = &unk_1E6ED8568;
  v10[4] = &v11;
  objc_msgSend(v4, "synchronousRemoteObjectProxyWithErrorHandler:", v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v9[0] = v5;
  v9[1] = 3221225472;
  v9[2] = __56__DMFEmergencyModeMonitor_enableEmergencyModeWithError___block_invoke_60;
  v9[3] = &unk_1E6ED8568;
  v9[4] = &v11;
  objc_msgSend(v6, "enableEmergencyModeWithCompletionHandler:", v9);
  if (a3)
    *a3 = objc_retainAutorelease((id)v12[5]);
  v7 = v12[5] == 0;

  _Block_object_dispose(&v11, 8);
  return v7;
}

void __56__DMFEmergencyModeMonitor_enableEmergencyModeWithError___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;

  v3 = a2;
  DMFEmergencyModeLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __56__DMFEmergencyModeMonitor_enableEmergencyModeWithError___block_invoke_cold_1();

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;

}

void __56__DMFEmergencyModeMonitor_enableEmergencyModeWithError___block_invoke_60(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  id v7;
  uint8_t v8[16];

  v3 = a2;
  DMFEmergencyModeLog();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __56__DMFEmergencyModeMonitor_enableEmergencyModeWithError___block_invoke_60_cold_1();

    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v7 = v3;
    v5 = *(NSObject **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v7;
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_1B8C0C000, v5, OS_LOG_TYPE_DEFAULT, "Emergency Mode enabled", v8, 2u);
  }

}

- (BOOL)enableEmergencyModeForDuration:(double)a3 withError:(id *)a4
{
  void *v6;
  uint64_t v7;
  void *v8;
  BOOL v9;
  _QWORD v11[6];
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__1;
  v17 = __Block_byref_object_dispose__1;
  v18 = 0;
  -[DMFEmergencyModeMonitor xpcConnection](self, "xpcConnection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __68__DMFEmergencyModeMonitor_enableEmergencyModeForDuration_withError___block_invoke;
  v12[3] = &unk_1E6ED8568;
  v12[4] = &v13;
  objc_msgSend(v6, "synchronousRemoteObjectProxyWithErrorHandler:", v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v11[0] = v7;
  v11[1] = 3221225472;
  v11[2] = __68__DMFEmergencyModeMonitor_enableEmergencyModeForDuration_withError___block_invoke_61;
  v11[3] = &unk_1E6ED8590;
  *(double *)&v11[5] = a3;
  v11[4] = &v13;
  objc_msgSend(v8, "enableEmergencyModeForDuration:withCompletionHandler:", v11, a3);
  if (a4)
    *a4 = objc_retainAutorelease((id)v14[5]);
  v9 = v14[5] == 0;

  _Block_object_dispose(&v13, 8);
  return v9;
}

void __68__DMFEmergencyModeMonitor_enableEmergencyModeForDuration_withError___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;

  v3 = a2;
  DMFEmergencyModeLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __56__DMFEmergencyModeMonitor_enableEmergencyModeWithError___block_invoke_cold_1();

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;

}

void __68__DMFEmergencyModeMonitor_enableEmergencyModeForDuration_withError___block_invoke_61(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  DMFEmergencyModeLog();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __68__DMFEmergencyModeMonitor_enableEmergencyModeForDuration_withError___block_invoke_61_cold_1(a1, (uint64_t)v3, v5);

    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v7 = v3;
    v5 = *(NSObject **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v7;
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v8 = *(_QWORD *)(a1 + 40);
    v9 = 134217984;
    v10 = v8;
    _os_log_impl(&dword_1B8C0C000, v5, OS_LOG_TYPE_DEFAULT, "Emergency Mode enabled for duration %f", (uint8_t *)&v9, 0xCu);
  }

}

- (BOOL)disableEmergencyModeWithError:(id *)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  BOOL v7;
  _QWORD v9[5];
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__1;
  v15 = __Block_byref_object_dispose__1;
  v16 = 0;
  -[DMFEmergencyModeMonitor xpcConnection](self, "xpcConnection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __57__DMFEmergencyModeMonitor_disableEmergencyModeWithError___block_invoke;
  v10[3] = &unk_1E6ED8568;
  v10[4] = &v11;
  objc_msgSend(v4, "synchronousRemoteObjectProxyWithErrorHandler:", v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v9[0] = v5;
  v9[1] = 3221225472;
  v9[2] = __57__DMFEmergencyModeMonitor_disableEmergencyModeWithError___block_invoke_62;
  v9[3] = &unk_1E6ED8568;
  v9[4] = &v11;
  objc_msgSend(v6, "disableEmergencyModeWithCompletionHandler:", v9);
  if (a3)
    *a3 = objc_retainAutorelease((id)v12[5]);
  v7 = v12[5] == 0;

  _Block_object_dispose(&v11, 8);
  return v7;
}

void __57__DMFEmergencyModeMonitor_disableEmergencyModeWithError___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;

  v3 = a2;
  DMFEmergencyModeLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __56__DMFEmergencyModeMonitor_enableEmergencyModeWithError___block_invoke_cold_1();

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;

}

void __57__DMFEmergencyModeMonitor_disableEmergencyModeWithError___block_invoke_62(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  id v7;
  uint8_t v8[16];

  v3 = a2;
  DMFEmergencyModeLog();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __57__DMFEmergencyModeMonitor_disableEmergencyModeWithError___block_invoke_62_cold_1();

    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v7 = v3;
    v5 = *(NSObject **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v7;
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_1B8C0C000, v5, OS_LOG_TYPE_DEFAULT, "Emergency Mode disabled", v8, 2u);
  }

}

- (id)emergencyModeStatusWithError:(id *)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  _QWORD v9[6];
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__1;
  v21 = __Block_byref_object_dispose__1;
  v22 = 0;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__1;
  v15 = __Block_byref_object_dispose__1;
  v16 = 0;
  -[DMFEmergencyModeMonitor xpcConnection](self, "xpcConnection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __56__DMFEmergencyModeMonitor_emergencyModeStatusWithError___block_invoke;
  v10[3] = &unk_1E6ED8568;
  v10[4] = &v17;
  objc_msgSend(v4, "synchronousRemoteObjectProxyWithErrorHandler:", v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v9[0] = v5;
  v9[1] = 3221225472;
  v9[2] = __56__DMFEmergencyModeMonitor_emergencyModeStatusWithError___block_invoke_63;
  v9[3] = &unk_1E6ED85B8;
  v9[4] = &v17;
  v9[5] = &v11;
  objc_msgSend(v6, "emergencyModeStatusWithCompletionHandler:", v9);
  if (a3)
    *a3 = objc_retainAutorelease((id)v18[5]);
  v7 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  _Block_object_dispose(&v17, 8);

  return v7;
}

void __56__DMFEmergencyModeMonitor_emergencyModeStatusWithError___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;

  v3 = a2;
  DMFEmergencyModeLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __56__DMFEmergencyModeMonitor_enableEmergencyModeWithError___block_invoke_cold_1();

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;

}

void __56__DMFEmergencyModeMonitor_emergencyModeStatusWithError___block_invoke_63(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  double v8;
  NSObject *v9;
  const char *v10;
  NSObject *v11;
  void **v12;
  double v13;
  double v14;
  _BOOL4 v15;
  NSObject *v16;
  uint32_t v17;
  id v18;
  void *v19;
  int v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v7 = v5;
    objc_msgSend(v7, "doubleValue");
    if (v8 <= 0.0)
    {
      objc_msgSend(v7, "doubleValue");
      v14 = v13;
      DMFEmergencyModeLog();
      v9 = objc_claimAutoreleasedReturnValue();
      v15 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
      if (v14 >= 0.0)
      {
        if (v15)
        {
          LOWORD(v20) = 0;
          v10 = "Emergency Mode is disabled";
          v16 = v9;
          v17 = 2;
          goto LABEL_14;
        }
      }
      else if (v15)
      {
        v20 = 138543362;
        v21 = v7;
        v10 = "Emergency Mode was disabled %{public}@ seconds ago";
        goto LABEL_11;
      }
    }
    else
    {
      DMFEmergencyModeLog();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v20 = 138543362;
        v21 = v7;
        v10 = "Emergency Mode is enabled for %{public}@ more seconds";
LABEL_11:
        v16 = v9;
        v17 = 12;
LABEL_14:
        _os_log_impl(&dword_1B8C0C000, v16, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v20, v17);
      }
    }

    v12 = (void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    goto LABEL_16;
  }
  DMFEmergencyModeLog();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    __56__DMFEmergencyModeMonitor_emergencyModeStatusWithError___block_invoke_63_cold_1();

  v12 = (void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  v7 = v6;
LABEL_16:
  v18 = v7;
  v19 = *v12;
  *v12 = v18;

}

void __68__DMFEmergencyModeMonitor_emergencyModeStatusWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  DMFEmergencyModeLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __56__DMFEmergencyModeMonitor_enableEmergencyModeWithError___block_invoke_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __68__DMFEmergencyModeMonitor_emergencyModeStatusWithCompletionHandler___block_invoke_65(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  double v8;
  NSObject *v9;
  const char *v10;
  NSObject *v11;
  double v12;
  double v13;
  _BOOL4 v14;
  NSObject *v15;
  uint32_t v16;
  int v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v7 = v5;
    objc_msgSend(v7, "doubleValue");
    if (v8 <= 0.0)
    {
      objc_msgSend(v7, "doubleValue");
      v13 = v12;
      DMFEmergencyModeLog();
      v9 = objc_claimAutoreleasedReturnValue();
      v14 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
      if (v13 >= 0.0)
      {
        if (v14)
        {
          LOWORD(v17) = 0;
          v10 = "Emergency Mode is disabled";
          v15 = v9;
          v16 = 2;
          goto LABEL_14;
        }
      }
      else if (v14)
      {
        v17 = 138543362;
        v18 = v7;
        v10 = "Emergency Mode was disabled %{public}@ seconds ago";
        goto LABEL_11;
      }
    }
    else
    {
      DMFEmergencyModeLog();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v17 = 138543362;
        v18 = v7;
        v10 = "Emergency Mode is enabled for %{public}@ more seconds";
LABEL_11:
        v15 = v9;
        v16 = 12;
LABEL_14:
        _os_log_impl(&dword_1B8C0C000, v15, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v17, v16);
      }
    }

    (*(void (**)(_QWORD, id))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), v7);
    goto LABEL_16;
  }
  DMFEmergencyModeLog();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    __56__DMFEmergencyModeMonitor_emergencyModeStatusWithError___block_invoke_63_cold_1();

  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), 0);
LABEL_16:

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcConnection, 0);
}

void __56__DMFEmergencyModeMonitor_enableEmergencyModeWithError___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1B8C0C000, v0, v1, "Could not create Emergency Mode proxy: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_2();
}

void __56__DMFEmergencyModeMonitor_enableEmergencyModeWithError___block_invoke_60_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1B8C0C000, v0, v1, "Failed to enabled Emergency Mode: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_2();
}

void __68__DMFEmergencyModeMonitor_enableEmergencyModeForDuration_withError___block_invoke_61_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 40);
  v4 = 134218242;
  v5 = v3;
  v6 = 2114;
  v7 = a2;
  _os_log_error_impl(&dword_1B8C0C000, log, OS_LOG_TYPE_ERROR, "Failed to enabled Emergency Mode for duration %f: %{public}@", (uint8_t *)&v4, 0x16u);
  OUTLINED_FUNCTION_1_2();
}

void __57__DMFEmergencyModeMonitor_disableEmergencyModeWithError___block_invoke_62_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1B8C0C000, v0, v1, "Failed to disable Emergency Mode: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_2();
}

void __56__DMFEmergencyModeMonitor_emergencyModeStatusWithError___block_invoke_63_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_1B8C0C000, v0, v1, "Failed to fetch Emergency Mode status: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_2();
}

@end
