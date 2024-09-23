@implementation LNDaemonMediator

+ (void)getConnectionHostInterfaceForBundleIdentifier:(id)a3 completionHandler:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  uint8_t buf[4];
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  getLNLogCategoryDaemonMediator();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    v25 = v5;
  }

  v8 = objc_alloc(MEMORY[0x1E0CB3B38]);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.private.appintents.delegate.%@"), v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithMachServiceName:options:", v9, 0);

  LNConnectionHostXPCListenerEndpointVendingInterface();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setRemoteObjectInterface:", v11);

  objc_msgSend(v10, "setInterruptionHandler:", &__block_literal_global_10039);
  objc_msgSend(v10, "setInvalidationHandler:", &__block_literal_global_8);
  objc_msgSend(v10, "resume");
  v12 = MEMORY[0x1E0C809B0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __84__LNDaemonMediator_getConnectionHostInterfaceForBundleIdentifier_completionHandler___block_invoke_9;
  v22[3] = &unk_1E45DE2E8;
  v13 = v6;
  v23 = v13;
  objc_msgSend(v10, "remoteObjectProxyWithErrorHandler:", v22);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v12;
  v18[1] = 3221225472;
  v18[2] = __84__LNDaemonMediator_getConnectionHostInterfaceForBundleIdentifier_completionHandler___block_invoke_11;
  v18[3] = &unk_1E45DDD28;
  v20 = v5;
  v21 = v13;
  v19 = v10;
  v15 = v5;
  v16 = v13;
  v17 = v10;
  objc_msgSend(v14, "getListenerEndpointWithCompletionHandler:", v18);

}

void __84__LNDaemonMediator_getConnectionHostInterfaceForBundleIdentifier_completionHandler___block_invoke_9(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  getLNLogCategoryDaemonMediator();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = 138543362;
    v6 = v3;
    _os_log_impl(&dword_1A18F6000, v4, OS_LOG_TYPE_ERROR, "Unable to get remoteObjectProxyWithErrorHandler, error: %{public}@", (uint8_t *)&v5, 0xCu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __84__LNDaemonMediator_getConnectionHostInterfaceForBundleIdentifier_completionHandler___block_invoke_11(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void (**v10)(_QWORD);
  void (*v11)(void);
  NSObject *v12;
  uint64_t v13;
  _QWORD aBlock[4];
  id v15;
  uint8_t buf[4];
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __84__LNDaemonMediator_getConnectionHostInterfaceForBundleIdentifier_completionHandler___block_invoke_2;
  aBlock[3] = &unk_1E45DDE18;
  v15 = *(id *)(a1 + 32);
  v10 = (void (**)(_QWORD))_Block_copy(aBlock);
  v11 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
  if (v7)
  {
    v11();
    getLNLogCategoryDaemonMediator();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v13 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138543362;
      v17 = v13;
      _os_log_impl(&dword_1A18F6000, v12, OS_LOG_TYPE_INFO, "Successfully fetched XPC listener endpoint for %{public}@", buf, 0xCu);
    }

  }
  else
  {
    v11();
  }
  v10[2](v10);

}

uint64_t __84__LNDaemonMediator_getConnectionHostInterfaceForBundleIdentifier_completionHandler___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "invalidate");
}

void __84__LNDaemonMediator_getConnectionHostInterfaceForBundleIdentifier_completionHandler___block_invoke_7()
{
  NSObject *v0;
  uint8_t v1[16];

  getLNLogCategoryDaemonMediator();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1A18F6000, v0, OS_LOG_TYPE_INFO, "Daemon Mediator XPC connection has been invalidated", v1, 2u);
  }

}

void __84__LNDaemonMediator_getConnectionHostInterfaceForBundleIdentifier_completionHandler___block_invoke()
{
  NSObject *v0;
  uint8_t v1[16];

  getLNLogCategoryDaemonMediator();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1A18F6000, v0, OS_LOG_TYPE_INFO, "Daemon Mediator XPC connection has been interrupted", v1, 2u);
  }

}

@end
