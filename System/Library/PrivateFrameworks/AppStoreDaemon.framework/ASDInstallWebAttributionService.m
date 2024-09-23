@implementation ASDInstallWebAttributionService

+ (id)interface
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE392250);
}

+ (ASDInstallWebAttributionService)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__ASDInstallWebAttributionService_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1ECFFAA68 != -1)
    dispatch_once(&qword_1ECFFAA68, block);
  return (ASDInstallWebAttributionService *)(id)_MergedGlobals_35;
}

void __49__ASDInstallWebAttributionService_sharedInstance__block_invoke(uint64_t a1)
{
  id *v1;
  void *v2;
  id *v3;
  void *v4;
  id v5;
  objc_super v6;

  v1 = (id *)objc_alloc(*(Class *)(a1 + 32));
  +[ASDServiceBroker defaultBroker](ASDServiceBroker, "defaultBroker");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v2;
  if (v1)
  {
    v6.receiver = v1;
    v6.super_class = (Class)ASDInstallWebAttributionService;
    v3 = (id *)objc_msgSendSuper2(&v6, sel_init);
    v1 = v3;
    if (v3)
      objc_storeStrong(v3 + 1, v2);
  }

  v4 = (void *)_MergedGlobals_35;
  _MergedGlobals_35 = (uint64_t)v1;

}

- (void)addInstallWebAttributionParamsWithConfig:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  ASDServiceBroker *serviceBroker;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  ASDLogHandleForCategory(31);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = (void *)objc_opt_class();
    v10 = v9;
    objc_msgSend(v6, "sourceWebRegistrableDomain");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appAdamId");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v20 = v9;
    v21 = 2114;
    v22 = v11;
    v23 = 2114;
    v24 = v12;
    _os_log_impl(&dword_19A03B000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] Adding install attribution params from web from domain: %{public}@ for adamID: %{public}@", buf, 0x20u);

  }
  serviceBroker = self->_serviceBroker;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __94__ASDInstallWebAttributionService_addInstallWebAttributionParamsWithConfig_completionHandler___block_invoke;
  v16[3] = &unk_1E37BEE20;
  v17 = v6;
  v18 = v7;
  v14 = v6;
  v15 = v7;
  -[ASDServiceBroker getInstallWebAttributionServiceWithCompletionHandler:](serviceBroker, "getInstallWebAttributionServiceWithCompletionHandler:", v16);

}

void __94__ASDInstallWebAttributionService_addInstallWebAttributionParamsWithConfig_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  uint8_t v8[8];
  _QWORD v9[4];
  id v10;

  v5 = a3;
  if (a2)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __94__ASDInstallWebAttributionService_addInstallWebAttributionParamsWithConfig_completionHandler___block_invoke_2;
    v9[3] = &unk_1E37BDB60;
    v10 = *(id *)(a1 + 40);
    objc_msgSend(a2, "remoteObjectProxyWithErrorHandler:", v9);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addInstallWebAttributionParamsWithConfig:completionHandler:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

  }
  else
  {
    ASDLogHandleForCategory(31);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v8 = 0;
      _os_log_error_impl(&dword_19A03B000, v7, OS_LOG_TYPE_ERROR, "Error getting install web attribution service", v8, 2u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

void __94__ASDInstallWebAttributionService_addInstallWebAttributionParamsWithConfig_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  ASDLogHandleForCategory(31);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = 138543362;
    v6 = v3;
    _os_log_error_impl(&dword_19A03B000, v4, OS_LOG_TYPE_ERROR, "Error getting install web attribution service remote proxy: %{public}@", (uint8_t *)&v5, 0xCu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceBroker, 0);
}

@end
