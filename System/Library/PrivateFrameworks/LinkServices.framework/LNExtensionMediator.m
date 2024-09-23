@implementation LNExtensionMediator

+ (void)getConnectionHostInterfaceForBundleIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  objc_msgSend(a1, "sharedQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __87__LNExtensionMediator_getConnectionHostInterfaceForBundleIdentifier_completionHandler___block_invoke;
  block[3] = &unk_1E45DD110;
  v12 = v6;
  v13 = v7;
  v14 = a1;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

+ (void)getWidgetKitXPCListenerEndpointForBundleIdentifier:(id)a3 completionHandler:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  objc_class *v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  __int128 buf;
  Class (*v23)(uint64_t);
  void *v24;
  uint64_t *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  getLNLogCategoryExtensionMediator();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 138543362;
    *(_QWORD *)((char *)&buf + 4) = v5;
    _os_log_impl(&dword_1A18F6000, v7, OS_LOG_TYPE_INFO, "Fetching an XPC listener endpoint from Chrono for %{public}@", (uint8_t *)&buf, 0xCu);
  }

  v18 = 0;
  v19 = &v18;
  v20 = 0x2050000000;
  v8 = (void *)getCHSAppIntentsXPCListenerEndpointProviderClass_softClass;
  v21 = getCHSAppIntentsXPCListenerEndpointProviderClass_softClass;
  v9 = MEMORY[0x1E0C809B0];
  if (!getCHSAppIntentsXPCListenerEndpointProviderClass_softClass)
  {
    *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
    *((_QWORD *)&buf + 1) = 3221225472;
    v23 = __getCHSAppIntentsXPCListenerEndpointProviderClass_block_invoke;
    v24 = &unk_1E45DDB30;
    v25 = &v18;
    __getCHSAppIntentsXPCListenerEndpointProviderClass_block_invoke((uint64_t)&buf);
    v8 = (void *)v19[3];
  }
  v10 = objc_retainAutorelease(v8);
  _Block_object_dispose(&v18, 8);
  v14[0] = v9;
  v14[1] = 3221225472;
  v14[2] = __92__LNExtensionMediator_getWidgetKitXPCListenerEndpointForBundleIdentifier_completionHandler___block_invoke;
  v14[3] = &unk_1E45DDD28;
  v16 = (id)objc_msgSend([v10 alloc], "initWithBundleIdentifier:", v5);
  v17 = v6;
  v15 = v5;
  v11 = v16;
  v12 = v6;
  v13 = v5;
  objc_msgSend(v11, "getAppIntentsXPCListenerEndpointWithCompletion:", v14);

}

+ (void)getXPCListenerEndpointForBundleIdentifier:(id)a3 extensionMediatorBundleIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  LNConnection *v13;
  id v14;
  NSObject *v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  uint8_t buf[4];
  id v21;
  __int16 v22;
  id v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(a1, "sharedQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v11);

  getLNLogCategoryExtensionMediator();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v21 = v9;
    v22 = 2112;
    v23 = v8;
    _os_log_impl(&dword_1A18F6000, v12, OS_LOG_TYPE_INFO, "Fetching an XPC listener endpoint from an internal mediator (%@) for %@", buf, 0x16u);
  }

  v19 = 0;
  v13 = -[LNConnection initWithBundleIdentifier:bundleURL:bundleType:appBundleIdentifier:appIntentsEnabledOnly:userIdentity:error:]([LNConnection alloc], "initWithBundleIdentifier:bundleURL:bundleType:appBundleIdentifier:appIntentsEnabledOnly:userIdentity:error:", v9, 0, 0, 0, 0, 0, &v19);
  v14 = v19;
  if (v13)
  {
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __117__LNExtensionMediator_getXPCListenerEndpointForBundleIdentifier_extensionMediatorBundleIdentifier_completionHandler___block_invoke;
    v16[3] = &unk_1E45DD138;
    v18 = v10;
    v17 = v8;
    -[LNConnection getListenerEndpointForBundleIdentifier:action:completionHandler:](v13, "getListenerEndpointForBundleIdentifier:action:completionHandler:", v17, 0, v16);

  }
  else
  {
    getLNLogCategoryExtensionMediator();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      v21 = v9;
      v22 = 2112;
      v23 = v8;
      v24 = 2112;
      v25 = v14;
      _os_log_impl(&dword_1A18F6000, v15, OS_LOG_TYPE_ERROR, "Error fetching XPC listener endpoint from an internal mediator (%@) for %@: %@", buf, 0x20u);
    }

    (*((void (**)(id, _QWORD, _QWORD, id))v10 + 2))(v10, 0, 0, v14);
  }

}

+ (id)sharedQueue
{
  if (sharedQueue_onceToken != -1)
    dispatch_once(&sharedQueue_onceToken, &__block_literal_global_22_7274);
  return (id)sharedQueue_queue;
}

void __34__LNExtensionMediator_sharedQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_DEFAULT, 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("com.apple.appintents.extension-mediator.internal-queue", v2);
  v1 = (void *)sharedQueue_queue;
  sharedQueue_queue = (uint64_t)v0;

}

void __117__LNExtensionMediator_getXPCListenerEndpointForBundleIdentifier_extensionMediatorBundleIdentifier_completionHandler___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  getLNLogCategoryExtensionMediator();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = 138543362;
    v5 = v3;
    _os_log_impl(&dword_1A18F6000, v2, OS_LOG_TYPE_INFO, "Successfully fetched XPC listener endpoint for %{public}@", (uint8_t *)&v4, 0xCu);
  }

}

void __92__LNExtensionMediator_getWidgetKitXPCListenerEndpointForBundleIdentifier_completionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v6;
  NSObject *v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (a2)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    getLNLogCategoryExtensionMediator();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = *(_QWORD *)(a1 + 32);
      v11 = 138543362;
      v12 = v8;
      _os_log_impl(&dword_1A18F6000, v7, OS_LOG_TYPE_INFO, "Successfully fetched XPC listener endpoint for %{public}@", (uint8_t *)&v11, 0xCu);
    }

  }
  else
  {
    getLNLogCategoryExtensionMediator();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = *(_QWORD *)(a1 + 32);
      v11 = 138543618;
      v12 = v10;
      v13 = 2112;
      v14 = v6;
      _os_log_impl(&dword_1A18F6000, v9, OS_LOG_TYPE_ERROR, "Error fetching XPC listener endpoint for %{public}@: %@", (uint8_t *)&v11, 0x16u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

void __87__LNExtensionMediator_getConnectionHostInterfaceForBundleIdentifier_completionHandler___block_invoke(id *a1)
{
  NSObject *v2;
  id v3;
  id v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  NSObject *v15;
  id v16;
  uint64_t v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  _QWORD v25[4];
  id v26;
  id v27;
  id v28;
  uint64_t v29;
  id v30;
  uint8_t buf[4];
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  getLNLogCategoryExtensionMediator();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = a1[4];
    *(_DWORD *)buf = 138543362;
    v32 = v3;
  }

  v4 = objc_alloc(MEMORY[0x1E0CA5848]);
  v5 = a1[4];
  v30 = 0;
  v6 = (void *)objc_msgSend(v4, "initWithBundleIdentifier:error:", v5, &v30);
  v7 = v30;
  if (v6)
  {
    objc_msgSend(v6, "entitlements");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKey:ofClass:", CFSTR("com.apple.private.appintents.extension-mediator.bundle-identifier"), objc_opt_class());
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(a1[6], "getXPCListenerEndpointForBundleIdentifier:extensionMediatorBundleIdentifier:completionHandler:", a1[4], v9, a1[5]);
    }
    else
    {
      v28 = v7;
      v29 = 0;
      +[LNExtensionHostConfigurator extensionProcessWithExtensionRecord:extensionType:error:](LNExtensionHostConfigurator, "extensionProcessWithExtensionRecord:extensionType:error:", v6, &v29, &v28);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v28;

      if (v29 == 1)
      {
        objc_msgSend(a1[6], "getWidgetKitXPCListenerEndpointForBundleIdentifier:completionHandler:", a1[4], a1[5]);
      }
      else if (v11)
      {
        (*((void (**)(void))a1[5] + 2))();
      }
      else
      {
        v27 = 0;
        v12 = (void *)objc_msgSend(v10, "newXPCConnectionWithError:", &v27);
        v11 = v27;
        if (v11)
        {
          (*((void (**)(void))a1[5] + 2))();
        }
        else
        {
          v13 = a1[4];
          LNConnectionHostXPCInterface();
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "ln_configureWithBundleIdentifier:interface:", v13, v14);

          objc_msgSend(v12, "setInterruptionHandler:", &__block_literal_global_7295);
          objc_msgSend(v12, "setInvalidationHandler:", &__block_literal_global_14);
          objc_msgSend(v12, "resume");
          getLNLogCategoryExtensionMediator();
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
          {
            v16 = a1[4];
            *(_DWORD *)buf = 138543362;
            v32 = v16;
          }

          v17 = MEMORY[0x1E0C809B0];
          v25[0] = MEMORY[0x1E0C809B0];
          v25[1] = 3221225472;
          v25[2] = __87__LNExtensionMediator_getConnectionHostInterfaceForBundleIdentifier_completionHandler___block_invoke_15;
          v25[3] = &unk_1E45DE2E8;
          v26 = a1[5];
          objc_msgSend(v12, "synchronousRemoteObjectProxyWithErrorHandler:", v25);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19[0] = v17;
          v19[1] = 3221225472;
          v19[2] = __87__LNExtensionMediator_getConnectionHostInterfaceForBundleIdentifier_completionHandler___block_invoke_17;
          v19[3] = &unk_1E45DD0E8;
          v24 = a1[6];
          v20 = a1[4];
          v21 = v10;
          v22 = v12;
          v23 = a1[5];
          objc_msgSend(v18, "getListenerEndpointWithCompletionHandler:", v19);

        }
      }

      v7 = v11;
    }

  }
  else
  {
    (*((void (**)(void))a1[5] + 2))();
  }

}

void __87__LNExtensionMediator_getConnectionHostInterfaceForBundleIdentifier_completionHandler___block_invoke_15(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  getLNLogCategoryExtensionMediator();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = 138543362;
    v6 = v3;
    _os_log_impl(&dword_1A18F6000, v4, OS_LOG_TYPE_ERROR, "Unable to get synchronousRemoteObjectProxy, error: %{public}@", (uint8_t *)&v5, 0xCu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __87__LNExtensionMediator_getConnectionHostInterfaceForBundleIdentifier_completionHandler___block_invoke_17(id *a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;

  v6 = a2;
  v7 = a4;
  objc_msgSend(a1[8], "sharedQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __87__LNExtensionMediator_getConnectionHostInterfaceForBundleIdentifier_completionHandler___block_invoke_2;
  v12[3] = &unk_1E45DD0C0;
  v13 = a1[4];
  v14 = a1[5];
  v15 = a1[6];
  v9 = a1[7];
  v17 = v7;
  v18 = v9;
  v16 = v6;
  v10 = v7;
  v11 = v6;
  dispatch_async(v8, v12);

}

void __87__LNExtensionMediator_getConnectionHostInterfaceForBundleIdentifier_completionHandler___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  _OWORD v11[2];
  uint8_t buf[4];
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  getLNLogCategoryExtensionMediator();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    v13 = v3;
    _os_log_impl(&dword_1A18F6000, v2, OS_LOG_TYPE_INFO, "Successfully fetched XPC listener endpoint for %{public}@", buf, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 40), "invalidate");
  objc_msgSend(*(id *)(a1 + 48), "invalidate");
  getLNLogCategoryExtensionMediator();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    v13 = v5;
    _os_log_impl(&dword_1A18F6000, v4, OS_LOG_TYPE_INFO, "Invalidated extension process and XPC connection for %{public}@", buf, 0xCu);
  }

  v6 = *(_QWORD *)(a1 + 72);
  v7 = *(_QWORD *)(a1 + 56);
  v8 = (void *)MEMORY[0x1E0C99D50];
  v9 = *(void **)(a1 + 40);
  if (v9)
    objc_msgSend(v9, "auditToken");
  else
    memset(v11, 0, sizeof(v11));
  objc_msgSend(v8, "if_dataWithAuditToken:", v11);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, uint64_t, void *, _QWORD))(v6 + 16))(v6, v7, v10, *(_QWORD *)(a1 + 64));

}

void __87__LNExtensionMediator_getConnectionHostInterfaceForBundleIdentifier_completionHandler___block_invoke_13()
{
  NSObject *v0;
  uint8_t v1[16];

  getLNLogCategoryExtensionMediator();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1A18F6000, v0, OS_LOG_TYPE_INFO, "Extension Mediator XPC connection has been invalidated", v1, 2u);
  }

}

void __87__LNExtensionMediator_getConnectionHostInterfaceForBundleIdentifier_completionHandler___block_invoke_11()
{
  NSObject *v0;
  uint8_t v1[16];

  getLNLogCategoryExtensionMediator();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1A18F6000, v0, OS_LOG_TYPE_INFO, "Extension Mediator XPC connection has been interrupted", v1, 2u);
  }

}

@end
