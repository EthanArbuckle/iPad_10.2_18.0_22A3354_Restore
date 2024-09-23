@implementation SKANInteropService

+ (id)interface
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE3921F0);
}

+ (SKANInteropService)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __36__SKANInteropService_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1ECFFAA58 != -1)
    dispatch_once(&qword_1ECFFAA58, block);
  return (SKANInteropService *)(id)_MergedGlobals_34;
}

void __36__SKANInteropService_sharedInstance__block_invoke(uint64_t a1)
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
    v6.super_class = (Class)SKANInteropService;
    v3 = (id *)objc_msgSendSuper2(&v6, sel_init);
    v1 = v3;
    if (v3)
      objc_storeStrong(v3 + 1, v2);
  }

  v4 = (void *)_MergedGlobals_34;
  _MergedGlobals_34 = (uint64_t)v1;

}

- (void)getImpressionsForApp:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  ASDServiceBroker *serviceBroker;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  uint8_t buf[4];
  id v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  ASDLogHandleForCategory(31);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v17 = (id)objc_opt_class();
    v18 = 2114;
    v19 = v6;
    v9 = v17;
    _os_log_impl(&dword_19A03B000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] Getting skan impressions for adamID: %{public}@", buf, 0x16u);

  }
  serviceBroker = self->_serviceBroker;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __61__SKANInteropService_getImpressionsForApp_completionHandler___block_invoke;
  v13[3] = &unk_1E37BEDD0;
  v14 = v6;
  v15 = v7;
  v11 = v6;
  v12 = v7;
  -[ASDServiceBroker getSKANInteropServiceWithCompletionHandler:](serviceBroker, "getSKANInteropServiceWithCompletionHandler:", v13);

}

void __61__SKANInteropService_getImpressionsForApp_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v4;
  NSObject *v5;
  uint8_t v6[8];
  _QWORD v7[4];
  id v8;

  if (a2)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __61__SKANInteropService_getImpressionsForApp_completionHandler___block_invoke_2;
    v7[3] = &unk_1E37BDB60;
    v8 = *(id *)(a1 + 40);
    objc_msgSend(a2, "remoteObjectProxyWithErrorHandler:", v7);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "getImpressionsForApp:completionHandler:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

  }
  else
  {
    ASDLogHandleForCategory(31);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v6 = 0;
      _os_log_error_impl(&dword_19A03B000, v5, OS_LOG_TYPE_ERROR, "Error getting skan interop service", v6, 2u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
}

void __61__SKANInteropService_getImpressionsForApp_completionHandler___block_invoke_2(uint64_t a1, void *a2)
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
    _os_log_error_impl(&dword_19A03B000, v4, OS_LOG_TYPE_ERROR, "Error getting skan interop service remote proxy: %{public}@", (uint8_t *)&v5, 0xCu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)storeSkannerEvents:(id)a3 advertisedItemID:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  ASDServiceBroker *serviceBroker;
  id v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  uint8_t buf[4];
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  ASDLogHandleForCategory(31);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v22 = (id)objc_opt_class();
    v12 = v22;
    _os_log_impl(&dword_19A03B000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] Storing SKanner events from BD", buf, 0xCu);

  }
  serviceBroker = self->_serviceBroker;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __76__SKANInteropService_storeSkannerEvents_advertisedItemID_completionHandler___block_invoke;
  v17[3] = &unk_1E37BEDF8;
  v19 = v9;
  v20 = v10;
  v18 = v8;
  v14 = v9;
  v15 = v8;
  v16 = v10;
  -[ASDServiceBroker getSKANInteropServiceWithCompletionHandler:](serviceBroker, "getSKANInteropServiceWithCompletionHandler:", v17);

}

void __76__SKANInteropService_storeSkannerEvents_advertisedItemID_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v4;
  NSObject *v5;
  uint8_t v6[8];
  _QWORD v7[4];
  id v8;

  if (a2)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __76__SKANInteropService_storeSkannerEvents_advertisedItemID_completionHandler___block_invoke_2;
    v7[3] = &unk_1E37BDB60;
    v8 = *(id *)(a1 + 48);
    objc_msgSend(a2, "remoteObjectProxyWithErrorHandler:", v7);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "storeSkannerEvents:advertisedItemID:completionHandler:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

  }
  else
  {
    ASDLogHandleForCategory(31);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v6 = 0;
      _os_log_error_impl(&dword_19A03B000, v5, OS_LOG_TYPE_ERROR, "Error getting skan interop service", v6, 2u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
}

void __76__SKANInteropService_storeSkannerEvents_advertisedItemID_completionHandler___block_invoke_2(uint64_t a1, void *a2)
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
    _os_log_error_impl(&dword_19A03B000, v4, OS_LOG_TYPE_ERROR, "Error getting skan interop service remote proxy: %{public}@", (uint8_t *)&v5, 0xCu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)storePostbacks:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  ASDServiceBroker *serviceBroker;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  uint8_t buf[4];
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  ASDLogHandleForCategory(31);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v17 = (id)objc_opt_class();
    v9 = v17;
    _os_log_impl(&dword_19A03B000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] Storing postbacks from BD", buf, 0xCu);

  }
  serviceBroker = self->_serviceBroker;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __55__SKANInteropService_storePostbacks_completionHandler___block_invoke;
  v13[3] = &unk_1E37BEDD0;
  v14 = v6;
  v15 = v7;
  v11 = v6;
  v12 = v7;
  -[ASDServiceBroker getSKANInteropServiceWithCompletionHandler:](serviceBroker, "getSKANInteropServiceWithCompletionHandler:", v13);

}

void __55__SKANInteropService_storePostbacks_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v4;
  NSObject *v5;
  uint8_t v6[8];
  _QWORD v7[4];
  id v8;

  if (a2)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __55__SKANInteropService_storePostbacks_completionHandler___block_invoke_2;
    v7[3] = &unk_1E37BDB60;
    v8 = *(id *)(a1 + 40);
    objc_msgSend(a2, "remoteObjectProxyWithErrorHandler:", v7);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "storePostbacks:completionHandler:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

  }
  else
  {
    ASDLogHandleForCategory(31);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v6 = 0;
      _os_log_error_impl(&dword_19A03B000, v5, OS_LOG_TYPE_ERROR, "Error getting skan interop service", v6, 2u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
}

void __55__SKANInteropService_storePostbacks_completionHandler___block_invoke_2(uint64_t a1, void *a2)
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
    _os_log_error_impl(&dword_19A03B000, v4, OS_LOG_TYPE_ERROR, "Error getting skan interop service remote proxy: %{public}@", (uint8_t *)&v5, 0xCu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceBroker, 0);
}

@end
