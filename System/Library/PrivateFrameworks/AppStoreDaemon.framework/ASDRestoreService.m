@implementation ASDRestoreService

+ (id)interface
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE392910);
}

+ (ASDRestoreService)sharedInstance
{
  if (_MergedGlobals_56 != -1)
    dispatch_once(&_MergedGlobals_56, &__block_literal_global_31);
  return (ASDRestoreService *)(id)qword_1ECFFABC8;
}

void __35__ASDRestoreService_sharedInstance__block_invoke()
{
  ASDRestoreService *v0;
  void *v1;

  v0 = objc_alloc_init(ASDRestoreService);
  v1 = (void *)qword_1ECFFABC8;
  qword_1ECFFABC8 = (uint64_t)v0;

}

- (ASDRestoreService)init
{
  ASDRestoreService *v2;
  uint64_t v3;
  ASDServiceBroker *serviceBroker;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ASDRestoreService;
  v2 = -[ASDRestoreService init](&v6, sel_init);
  if (v2)
  {
    +[ASDServiceBroker defaultBroker](ASDServiceBroker, "defaultBroker");
    v3 = objc_claimAutoreleasedReturnValue();
    serviceBroker = v2->_serviceBroker;
    v2->_serviceBroker = (ASDServiceBroker *)v3;

  }
  return v2;
}

- (void)clearFollowupsForAccountID:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  id v7;
  ASDServiceBroker *serviceBroker;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  serviceBroker = self->_serviceBroker;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __70__ASDRestoreService_clearFollowupsForAccountID_withCompletionHandler___block_invoke;
  v11[3] = &unk_1E37C0110;
  v12 = v6;
  v13 = v7;
  v9 = v6;
  v10 = v7;
  -[ASDServiceBroker getRestoreServiceWithCompletionHandler:](serviceBroker, "getRestoreServiceWithCompletionHandler:", v11);

}

void __70__ASDRestoreService_clearFollowupsForAccountID_withCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;
  uint8_t buf[4];
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (a2)
  {
    v6 = MEMORY[0x1E0C809B0];
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __70__ASDRestoreService_clearFollowupsForAccountID_withCompletionHandler___block_invoke_2;
    v12[3] = &unk_1E37BDB60;
    v13 = *(id *)(a1 + 40);
    objc_msgSend(a2, "remoteObjectProxyWithErrorHandler:", v12);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = v6;
    v10[1] = 3221225472;
    v10[2] = __70__ASDRestoreService_clearFollowupsForAccountID_withCompletionHandler___block_invoke_4;
    v10[3] = &unk_1E37BDB88;
    v8 = *(_QWORD *)(a1 + 32);
    v11 = *(id *)(a1 + 40);
    objc_msgSend(v7, "clearFollowupsForAccountID:replyHandler:", v8, v10);

  }
  else
  {
    ASDLogHandleForCategory(12);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v15 = v5;
      _os_log_error_impl(&dword_19A03B000, v9, OS_LOG_TYPE_ERROR, "[RestoreService] Prioritize failed, service unavailable: %{public}@", buf, 0xCu);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

void __70__ASDRestoreService_clearFollowupsForAccountID_withCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  ASDLogHandleForCategory(12);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = 138543362;
    v6 = v3;
    _os_log_error_impl(&dword_19A03B000, v4, OS_LOG_TYPE_ERROR, "[RestoreService] Clear followups failed, request failed: %{public}@", (uint8_t *)&v5, 0xCu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __70__ASDRestoreService_clearFollowupsForAccountID_withCompletionHandler___block_invoke_4(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  ASDLogHandleForCategory(12);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v8 = 138543362;
      v9 = v5;
      _os_log_error_impl(&dword_19A03B000, v7, OS_LOG_TYPE_ERROR, "[RestoreService] Clear followups, error: %{public}@", (uint8_t *)&v8, 0xCu);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v8 = 67109120;
    LODWORD(v9) = a2;
    _os_log_impl(&dword_19A03B000, v7, OS_LOG_TYPE_INFO, "[RestoreService] Clear followups returned: %d", (uint8_t *)&v8, 8u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)estimateTotalDownloadSizeWithCompletionHandler:(id)a3
{
  id v4;
  ASDServiceBroker *serviceBroker;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  serviceBroker = self->_serviceBroker;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __68__ASDRestoreService_estimateTotalDownloadSizeWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E37C0160;
  v8 = v4;
  v6 = v4;
  -[ASDServiceBroker getRestoreServiceWithCompletionHandler:](serviceBroker, "getRestoreServiceWithCompletionHandler:", v7);

}

void __68__ASDRestoreService_estimateTotalDownloadSizeWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[4];
  id v12;
  uint8_t buf[4];
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (a2)
  {
    v6 = MEMORY[0x1E0C809B0];
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __68__ASDRestoreService_estimateTotalDownloadSizeWithCompletionHandler___block_invoke_7;
    v11[3] = &unk_1E37BDB60;
    v12 = *(id *)(a1 + 32);
    objc_msgSend(a2, "remoteObjectProxyWithErrorHandler:", v11);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = v6;
    v9[1] = 3221225472;
    v9[2] = __68__ASDRestoreService_estimateTotalDownloadSizeWithCompletionHandler___block_invoke_8;
    v9[3] = &unk_1E37C0138;
    v10 = *(id *)(a1 + 32);
    objc_msgSend(v7, "estimateTotalDownloadSizeWithReplyHandler:", v9);

  }
  else
  {
    ASDLogHandleForCategory(12);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v14 = v5;
      _os_log_error_impl(&dword_19A03B000, v8, OS_LOG_TYPE_ERROR, "[RestoreService] Download size estimate failed, service unavailable: %{public}@", buf, 0xCu);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

void __68__ASDRestoreService_estimateTotalDownloadSizeWithCompletionHandler___block_invoke_7(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  ASDLogHandleForCategory(12);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = 138543362;
    v6 = v3;
    _os_log_error_impl(&dword_19A03B000, v4, OS_LOG_TYPE_ERROR, "[RestoreService] Download size estimate failed, request failed: %{public}@", (uint8_t *)&v5, 0xCu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __68__ASDRestoreService_estimateTotalDownloadSizeWithCompletionHandler___block_invoke_8(uint64_t a1, void *a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  ASDLogHandleForCategory(12);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v8 = 138543362;
      v9 = v5;
      _os_log_error_impl(&dword_19A03B000, v7, OS_LOG_TYPE_ERROR, "[RestoreService] Download size estimate failed, error: %{public}@", (uint8_t *)&v8, 0xCu);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v8 = 134217984;
    v9 = a2;
    _os_log_impl(&dword_19A03B000, v7, OS_LOG_TYPE_INFO, "[RestoreService] Download size estimate returned: %{iec-bytes}lu", (uint8_t *)&v8, 0xCu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)prioritizeBundleIDs:(id)a3 userInitiated:(BOOL)a4 withCompletionHandler:(id)a5
{
  id v8;
  id v9;
  ASDServiceBroker *serviceBroker;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  BOOL v16;

  v8 = a3;
  v9 = a5;
  serviceBroker = self->_serviceBroker;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __77__ASDRestoreService_prioritizeBundleIDs_userInitiated_withCompletionHandler___block_invoke;
  v13[3] = &unk_1E37C0188;
  v14 = v8;
  v15 = v9;
  v16 = a4;
  v11 = v8;
  v12 = v9;
  -[ASDServiceBroker getRestoreServiceWithCompletionHandler:](serviceBroker, "getRestoreServiceWithCompletionHandler:", v13);

}

void __77__ASDRestoreService_prioritizeBundleIDs_userInitiated_withCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;
  uint8_t buf[4];
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (a2)
  {
    v6 = MEMORY[0x1E0C809B0];
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __77__ASDRestoreService_prioritizeBundleIDs_userInitiated_withCompletionHandler___block_invoke_10;
    v13[3] = &unk_1E37BDB60;
    v14 = *(id *)(a1 + 40);
    objc_msgSend(a2, "remoteObjectProxyWithErrorHandler:", v13);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(unsigned __int8 *)(a1 + 48);
    v11[0] = v6;
    v11[1] = 3221225472;
    v11[2] = __77__ASDRestoreService_prioritizeBundleIDs_userInitiated_withCompletionHandler___block_invoke_11;
    v11[3] = &unk_1E37BDB88;
    v9 = *(_QWORD *)(a1 + 32);
    v12 = *(id *)(a1 + 40);
    objc_msgSend(v7, "prioritizeBundleIDs:userInitiated:replyHandler:", v9, v8, v11);

  }
  else
  {
    ASDLogHandleForCategory(12);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v16 = v5;
      _os_log_error_impl(&dword_19A03B000, v10, OS_LOG_TYPE_ERROR, "[RestoreService] Prioritize failed, service unavailable: %{public}@", buf, 0xCu);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

void __77__ASDRestoreService_prioritizeBundleIDs_userInitiated_withCompletionHandler___block_invoke_10(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  ASDLogHandleForCategory(12);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = 138543362;
    v6 = v3;
    _os_log_error_impl(&dword_19A03B000, v4, OS_LOG_TYPE_ERROR, "[RestoreService] Prioritize failed, request failed: %{public}@", (uint8_t *)&v5, 0xCu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __77__ASDRestoreService_prioritizeBundleIDs_userInitiated_withCompletionHandler___block_invoke_11(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  ASDLogHandleForCategory(12);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v8 = 138543362;
      v9 = v5;
      _os_log_error_impl(&dword_19A03B000, v7, OS_LOG_TYPE_ERROR, "[RestoreService] Prioritize, error: %{public}@", (uint8_t *)&v8, 0xCu);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v8 = 67109120;
    LODWORD(v9) = a2;
    _os_log_impl(&dword_19A03B000, v7, OS_LOG_TYPE_INFO, "[RestoreService] Prioritize returned: %d", (uint8_t *)&v8, 8u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceBroker, 0);
}

@end
