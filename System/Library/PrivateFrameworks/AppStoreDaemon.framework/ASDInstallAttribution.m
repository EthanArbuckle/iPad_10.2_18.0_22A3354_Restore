@implementation ASDInstallAttribution

+ (id)interface
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE392490);
}

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__ASDInstallAttribution_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1ECFFAB08 != -1)
    dispatch_once(&qword_1ECFFAB08, block);
  return (id)_MergedGlobals_44;
}

void __39__ASDInstallAttribution_sharedInstance__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)_MergedGlobals_44;
  _MergedGlobals_44 = (uint64_t)v1;

}

- (ASDInstallAttribution)init
{
  void *v3;
  ASDInstallAttribution *v4;

  +[ASDServiceBroker defaultBroker](ASDServiceBroker, "defaultBroker");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[ASDInstallAttribution _initWithServiceBroker:](self, "_initWithServiceBroker:", v3);

  return v4;
}

- (id)_initWithServiceBroker:(id)a3
{
  id v5;
  ASDInstallAttribution *v6;
  ASDInstallAttribution *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ASDInstallAttribution;
  v6 = -[ASDInstallAttribution init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_serviceBroker, a3);

  return v7;
}

- (void)startImpressionWithConfig:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  ASDServiceBroker *serviceBroker;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  ASDLogHandleForCategory(31);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "sourceAppAdamId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "sourceAppBundleId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v18 = v9;
    v19 = 2114;
    v20 = v10;
    _os_log_impl(&dword_19A03B000, v8, OS_LOG_TYPE_DEFAULT, "Starting impression as requested from adamID: %{public}@ bundleID: %{public}@", buf, 0x16u);

  }
  serviceBroker = self->_serviceBroker;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __69__ASDInstallAttribution_startImpressionWithConfig_completionHandler___block_invoke;
  v14[3] = &unk_1E37BF460;
  v15 = v6;
  v16 = v7;
  v12 = v6;
  v13 = v7;
  -[ASDServiceBroker getInstallAttributionServiceWithCompletionHandler:](serviceBroker, "getInstallAttributionServiceWithCompletionHandler:", v14);

}

void __69__ASDInstallAttribution_startImpressionWithConfig_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  _QWORD v8[4];
  id v9;
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (a2)
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __69__ASDInstallAttribution_startImpressionWithConfig_completionHandler___block_invoke_2;
    v8[3] = &unk_1E37BDB60;
    v9 = *(id *)(a1 + 40);
    objc_msgSend(a2, "remoteObjectProxyWithErrorHandler:", v8);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "startAdImpressionWithConfig:completionHandler:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

  }
  else
  {
    ASDLogHandleForCategory(31);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v11 = v5;
      _os_log_error_impl(&dword_19A03B000, v7, OS_LOG_TYPE_ERROR, "Error getting the install attribution service %@", buf, 0xCu);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

void __69__ASDInstallAttribution_startImpressionWithConfig_completionHandler___block_invoke_2(uint64_t a1, void *a2)
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
    v5 = 138412290;
    v6 = v3;
    _os_log_error_impl(&dword_19A03B000, v4, OS_LOG_TYPE_ERROR, "Error getting service proxy for install attribution %@", (uint8_t *)&v5, 0xCu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)endImpressionWithConfig:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  ASDServiceBroker *serviceBroker;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  ASDLogHandleForCategory(31);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "sourceAppAdamId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "sourceAppBundleId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v18 = v9;
    v19 = 2114;
    v20 = v10;
    _os_log_impl(&dword_19A03B000, v8, OS_LOG_TYPE_DEFAULT, "Ending impression as requested from adamID: %{public}@ bundleID: %{public}@", buf, 0x16u);

  }
  serviceBroker = self->_serviceBroker;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __67__ASDInstallAttribution_endImpressionWithConfig_completionHandler___block_invoke;
  v14[3] = &unk_1E37BF460;
  v15 = v6;
  v16 = v7;
  v12 = v6;
  v13 = v7;
  -[ASDServiceBroker getInstallAttributionServiceWithCompletionHandler:](serviceBroker, "getInstallAttributionServiceWithCompletionHandler:", v14);

}

void __67__ASDInstallAttribution_endImpressionWithConfig_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  _QWORD v8[4];
  id v9;
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (a2)
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __67__ASDInstallAttribution_endImpressionWithConfig_completionHandler___block_invoke_2;
    v8[3] = &unk_1E37BDB60;
    v9 = *(id *)(a1 + 40);
    objc_msgSend(a2, "remoteObjectProxyWithErrorHandler:", v8);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "endAdImpressionWithConfig:completionHandler:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

  }
  else
  {
    ASDLogHandleForCategory(31);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v11 = v5;
      _os_log_error_impl(&dword_19A03B000, v7, OS_LOG_TYPE_ERROR, "Error getting the install attribution service %@", buf, 0xCu);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

void __67__ASDInstallAttribution_endImpressionWithConfig_completionHandler___block_invoke_2(uint64_t a1, void *a2)
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
    v5 = 138412290;
    v6 = v3;
    _os_log_error_impl(&dword_19A03B000, v4, OS_LOG_TYPE_ERROR, "Error getting service proxy for install attribution %@", (uint8_t *)&v5, 0xCu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)startPingbackTaskWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  ASDServiceBroker *serviceBroker;
  id v7;
  _QWORD v8[4];
  id v9;
  uint8_t buf[16];

  v4 = a3;
  ASDLogHandleForCategory(31);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19A03B000, v5, OS_LOG_TYPE_DEFAULT, "Starting pingback task", buf, 2u);
  }

  serviceBroker = self->_serviceBroker;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __64__ASDInstallAttribution_startPingbackTaskWithCompletionHandler___block_invoke;
  v8[3] = &unk_1E37BF488;
  v9 = v4;
  v7 = v4;
  -[ASDServiceBroker getInstallAttributionServiceWithCompletionHandler:](serviceBroker, "getInstallAttributionServiceWithCompletionHandler:", v8);

}

void __64__ASDInstallAttribution_startPingbackTaskWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (a2)
  {
    objc_msgSend(a2, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_18);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "startPingbackTaskWithCompletionHandler:", *(_QWORD *)(a1 + 32));

  }
  else
  {
    ASDLogHandleForCategory(31);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = 138412290;
      v9 = v5;
      _os_log_error_impl(&dword_19A03B000, v7, OS_LOG_TYPE_ERROR, "Error getting the install attribution service %@", (uint8_t *)&v8, 0xCu);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

void __64__ASDInstallAttribution_startPingbackTaskWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  ASDLogHandleForCategory(31);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v4 = 138412290;
    v5 = v2;
    _os_log_error_impl(&dword_19A03B000, v3, OS_LOG_TYPE_ERROR, "Error getting service proxy for install attribution %@", (uint8_t *)&v4, 0xCu);
  }

}

- (void)startGhostFetchTaskWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  ASDServiceBroker *serviceBroker;
  id v7;
  _QWORD v8[4];
  id v9;
  uint8_t buf[16];

  v4 = a3;
  ASDLogHandleForCategory(31);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19A03B000, v5, OS_LOG_TYPE_DEFAULT, "Starting pingback task", buf, 2u);
  }

  serviceBroker = self->_serviceBroker;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __66__ASDInstallAttribution_startGhostFetchTaskWithCompletionHandler___block_invoke;
  v8[3] = &unk_1E37BF488;
  v9 = v4;
  v7 = v4;
  -[ASDServiceBroker getInstallAttributionServiceWithCompletionHandler:](serviceBroker, "getInstallAttributionServiceWithCompletionHandler:", v8);

}

void __66__ASDInstallAttribution_startGhostFetchTaskWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (a2)
  {
    objc_msgSend(a2, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "startGhostFetchTaskWithCompletionHandler:", *(_QWORD *)(a1 + 32));

  }
  else
  {
    ASDLogHandleForCategory(31);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = 138412290;
      v9 = v5;
      _os_log_error_impl(&dword_19A03B000, v7, OS_LOG_TYPE_ERROR, "Error getting the install attribution service %@", (uint8_t *)&v8, 0xCu);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

void __66__ASDInstallAttribution_startGhostFetchTaskWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  ASDLogHandleForCategory(31);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v4 = 138412290;
    v5 = v2;
    _os_log_error_impl(&dword_19A03B000, v3, OS_LOG_TYPE_ERROR, "Error getting service proxy for install attribution %@", (uint8_t *)&v4, 0xCu);
  }

}

- (void)addInstallAttributionParamsWithConfig:(id)a3
{
  -[ASDInstallAttribution addInstallAttributionParamsWithConfig:completionHandler:](self, "addInstallAttributionParamsWithConfig:completionHandler:", a3, &__block_literal_global_4);
}

void __63__ASDInstallAttribution_addInstallAttributionParamsWithConfig___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  if (v2)
  {
    ASDLogHandleForCategory(31);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v4 = 138543362;
      v5 = v2;
      _os_log_error_impl(&dword_19A03B000, v3, OS_LOG_TYPE_ERROR, "Error getting install attribution service: %{public}@", (uint8_t *)&v4, 0xCu);
    }

  }
}

- (void)addInstallAttributionParamsWithConfig:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  ASDServiceBroker *serviceBroker;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  ASDLogHandleForCategory(31);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "sourceAppBundleId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "sourceAppAdamId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v18 = v9;
    v19 = 2114;
    v20 = v10;
    _os_log_impl(&dword_19A03B000, v8, OS_LOG_TYPE_DEFAULT, "Adding install attribution params from bundleID: %{public}@ adamID: %{public}@", buf, 0x16u);

  }
  serviceBroker = self->_serviceBroker;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __81__ASDInstallAttribution_addInstallAttributionParamsWithConfig_completionHandler___block_invoke;
  v14[3] = &unk_1E37BF460;
  v15 = v6;
  v16 = v7;
  v12 = v6;
  v13 = v7;
  -[ASDServiceBroker getInstallAttributionServiceWithCompletionHandler:](serviceBroker, "getInstallAttributionServiceWithCompletionHandler:", v14);

}

void __81__ASDInstallAttribution_addInstallAttributionParamsWithConfig_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
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
    v9[2] = __81__ASDInstallAttribution_addInstallAttributionParamsWithConfig_completionHandler___block_invoke_2;
    v9[3] = &unk_1E37BDB60;
    v10 = *(id *)(a1 + 40);
    objc_msgSend(a2, "remoteObjectProxyWithErrorHandler:", v9);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addInstallAttributionParamsWithConfig:completionHandler:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

  }
  else
  {
    ASDLogHandleForCategory(31);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v8 = 0;
      _os_log_error_impl(&dword_19A03B000, v7, OS_LOG_TYPE_ERROR, "Error getting install attribution service", v8, 2u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

void __81__ASDInstallAttribution_addInstallAttributionParamsWithConfig_completionHandler___block_invoke_2(uint64_t a1, void *a2)
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
    _os_log_error_impl(&dword_19A03B000, v4, OS_LOG_TYPE_ERROR, "Error getting install attribution remote proxy: %{public}@", (uint8_t *)&v5, 0xCu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)addInstallWebAttributionParamsWithConfig:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  ASDServiceBroker *serviceBroker;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  ASDLogHandleForCategory(31);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "sourceWebRegistrableDomain");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appAdamId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v18 = v9;
    v19 = 2114;
    v20 = v10;
    _os_log_impl(&dword_19A03B000, v8, OS_LOG_TYPE_DEFAULT, "Adding install attribution params from web from domain: %{public}@ for adamID: %{public}@", buf, 0x16u);

  }
  serviceBroker = self->_serviceBroker;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __84__ASDInstallAttribution_addInstallWebAttributionParamsWithConfig_completionHandler___block_invoke;
  v14[3] = &unk_1E37BF460;
  v15 = v6;
  v16 = v7;
  v12 = v6;
  v13 = v7;
  -[ASDServiceBroker getInstallAttributionServiceWithCompletionHandler:](serviceBroker, "getInstallAttributionServiceWithCompletionHandler:", v14);

}

void __84__ASDInstallAttribution_addInstallWebAttributionParamsWithConfig_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
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
    v9[2] = __84__ASDInstallAttribution_addInstallWebAttributionParamsWithConfig_completionHandler___block_invoke_2;
    v9[3] = &unk_1E37BDB60;
    v10 = *(id *)(a1 + 40);
    objc_msgSend(a2, "synchronousRemoteObjectProxyWithErrorHandler:", v9);
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
      _os_log_error_impl(&dword_19A03B000, v7, OS_LOG_TYPE_ERROR, "Error getting install attribution service", v8, 2u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

void __84__ASDInstallAttribution_addInstallWebAttributionParamsWithConfig_completionHandler___block_invoke_2(uint64_t a1, void *a2)
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
    _os_log_error_impl(&dword_19A03B000, v4, OS_LOG_TYPE_ERROR, "Error getting install attribution remote proxy: %{public}@", (uint8_t *)&v5, 0xCu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)registerInstallAttributionPingbackForApp:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  ASDServiceBroker *serviceBroker;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  ASDLogHandleForCategory(31);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19A03B000, v8, OS_LOG_TYPE_DEFAULT, "Registering install attribution pingback", buf, 2u);
  }

  serviceBroker = self->_serviceBroker;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __84__ASDInstallAttribution_registerInstallAttributionPingbackForApp_completionHandler___block_invoke;
  v12[3] = &unk_1E37BF460;
  v13 = v6;
  v14 = v7;
  v10 = v6;
  v11 = v7;
  -[ASDServiceBroker getInstallAttributionServiceWithCompletionHandler:](serviceBroker, "getInstallAttributionServiceWithCompletionHandler:", v12);

}

void __84__ASDInstallAttribution_registerInstallAttributionPingbackForApp_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
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
    v9[2] = __84__ASDInstallAttribution_registerInstallAttributionPingbackForApp_completionHandler___block_invoke_2;
    v9[3] = &unk_1E37BDB60;
    v10 = *(id *)(a1 + 40);
    objc_msgSend(a2, "remoteObjectProxyWithErrorHandler:", v9);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "registerPingbackForApp:completionHandler:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

  }
  else
  {
    ASDLogHandleForCategory(31);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v8 = 0;
      _os_log_error_impl(&dword_19A03B000, v7, OS_LOG_TYPE_ERROR, "Error getting install attribution service", v8, 2u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

void __84__ASDInstallAttribution_registerInstallAttributionPingbackForApp_completionHandler___block_invoke_2(uint64_t a1, void *a2)
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
    _os_log_error_impl(&dword_19A03B000, v4, OS_LOG_TYPE_ERROR, "Error getting install attribution remote proxy: %{public}@", (uint8_t *)&v5, 0xCu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)updateConversionValueForInstallAttributionPingbackForApp:(id)a3 conversionValue:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  ASDServiceBroker *serviceBroker;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  uint8_t buf[16];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  ASDLogHandleForCategory(31);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19A03B000, v11, OS_LOG_TYPE_DEFAULT, "Updating conversion value for install attribution pingback", buf, 2u);
  }

  serviceBroker = self->_serviceBroker;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __116__ASDInstallAttribution_updateConversionValueForInstallAttributionPingbackForApp_conversionValue_completionHandler___block_invoke;
  v16[3] = &unk_1E37BF4D0;
  v18 = v9;
  v19 = v10;
  v17 = v8;
  v13 = v9;
  v14 = v8;
  v15 = v10;
  -[ASDServiceBroker getInstallAttributionServiceWithCompletionHandler:](serviceBroker, "getInstallAttributionServiceWithCompletionHandler:", v16);

}

void __116__ASDInstallAttribution_updateConversionValueForInstallAttributionPingbackForApp_conversionValue_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
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
    v9[2] = __116__ASDInstallAttribution_updateConversionValueForInstallAttributionPingbackForApp_conversionValue_completionHandler___block_invoke_2;
    v9[3] = &unk_1E37BDB60;
    v10 = *(id *)(a1 + 48);
    objc_msgSend(a2, "remoteObjectProxyWithErrorHandler:", v9);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "updateConversionValueForApp:conversionValue:completionHandler:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

  }
  else
  {
    ASDLogHandleForCategory(31);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v8 = 0;
      _os_log_error_impl(&dword_19A03B000, v7, OS_LOG_TYPE_ERROR, "Error getting install attribution service", v8, 2u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

void __116__ASDInstallAttribution_updateConversionValueForInstallAttributionPingbackForApp_conversionValue_completionHandler___block_invoke_2(uint64_t a1, void *a2)
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
    _os_log_error_impl(&dword_19A03B000, v4, OS_LOG_TYPE_ERROR, "Error getting install attribution remote proxy: %{public}@", (uint8_t *)&v5, 0xCu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)updatePostbackConversionValuesForApp:(id)a3 fineConversionValue:(id)a4 coarseConversionValue:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  ASDServiceBroker *serviceBroker;
  id v16;
  id v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  id v24;
  uint8_t buf[16];

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  ASDLogHandleForCategory(31);
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19A03B000, v14, OS_LOG_TYPE_DEFAULT, "Updating conversion values for install attribution pingback", buf, 2u);
  }

  serviceBroker = self->_serviceBroker;
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __122__ASDInstallAttribution_updatePostbackConversionValuesForApp_fineConversionValue_coarseConversionValue_completionHandler___block_invoke;
  v20[3] = &unk_1E37BF4F8;
  v21 = v10;
  v22 = v11;
  v23 = v12;
  v24 = v13;
  v16 = v12;
  v17 = v11;
  v18 = v10;
  v19 = v13;
  -[ASDServiceBroker getInstallAttributionServiceWithCompletionHandler:](serviceBroker, "getInstallAttributionServiceWithCompletionHandler:", v20);

}

void __122__ASDInstallAttribution_updatePostbackConversionValuesForApp_fineConversionValue_coarseConversionValue_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
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
    v9[2] = __122__ASDInstallAttribution_updatePostbackConversionValuesForApp_fineConversionValue_coarseConversionValue_completionHandler___block_invoke_2;
    v9[3] = &unk_1E37BDB60;
    v10 = *(id *)(a1 + 56);
    objc_msgSend(a2, "remoteObjectProxyWithErrorHandler:", v9);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "updatePostbackConversionValuesForApp:fineConversionValue:coarseConversionValue:completionHandler:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

  }
  else
  {
    ASDLogHandleForCategory(31);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v8 = 0;
      _os_log_error_impl(&dword_19A03B000, v7, OS_LOG_TYPE_ERROR, "Error getting install attribution service", v8, 2u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }

}

void __122__ASDInstallAttribution_updatePostbackConversionValuesForApp_fineConversionValue_coarseConversionValue_completionHandler___block_invoke_2(uint64_t a1, void *a2)
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
    _os_log_error_impl(&dword_19A03B000, v4, OS_LOG_TYPE_ERROR, "Error getting install attribution remote proxy: %{public}@", (uint8_t *)&v5, 0xCu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)updatePostbackConversionValuesForApp:(id)a3 fineConversionValue:(id)a4 coarseConversionValue:(id)a5 lockWindow:(BOOL)a6 completionHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  ASDServiceBroker *serviceBroker;
  id v18;
  id v19;
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;
  id v26;
  BOOL v27;
  uint8_t buf[16];

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a7;
  ASDLogHandleForCategory(31);
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19A03B000, v16, OS_LOG_TYPE_DEFAULT, "Updating conversion values for install attribution pingback", buf, 2u);
  }

  serviceBroker = self->_serviceBroker;
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __133__ASDInstallAttribution_updatePostbackConversionValuesForApp_fineConversionValue_coarseConversionValue_lockWindow_completionHandler___block_invoke;
  v22[3] = &unk_1E37BF520;
  v23 = v12;
  v24 = v13;
  v25 = v14;
  v26 = v15;
  v27 = a6;
  v18 = v14;
  v19 = v13;
  v20 = v12;
  v21 = v15;
  -[ASDServiceBroker getInstallAttributionServiceWithCompletionHandler:](serviceBroker, "getInstallAttributionServiceWithCompletionHandler:", v22);

}

void __133__ASDInstallAttribution_updatePostbackConversionValuesForApp_fineConversionValue_coarseConversionValue_lockWindow_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
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
    v9[2] = __133__ASDInstallAttribution_updatePostbackConversionValuesForApp_fineConversionValue_coarseConversionValue_lockWindow_completionHandler___block_invoke_2;
    v9[3] = &unk_1E37BDB60;
    v10 = *(id *)(a1 + 56);
    objc_msgSend(a2, "remoteObjectProxyWithErrorHandler:", v9);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "updatePostbackConversionValuesForApp:fineConversionValue:coarseConversionValue:lockWindow:completionHandler:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 64), *(_QWORD *)(a1 + 56));

  }
  else
  {
    ASDLogHandleForCategory(31);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v8 = 0;
      _os_log_error_impl(&dword_19A03B000, v7, OS_LOG_TYPE_ERROR, "Error getting install attribution service", v8, 2u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }

}

void __133__ASDInstallAttribution_updatePostbackConversionValuesForApp_fineConversionValue_coarseConversionValue_lockWindow_completionHandler___block_invoke_2(uint64_t a1, void *a2)
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
    _os_log_error_impl(&dword_19A03B000, v4, OS_LOG_TYPE_ERROR, "Error getting install attribution remote proxy: %{public}@", (uint8_t *)&v5, 0xCu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceBroker, 0);
}

@end
