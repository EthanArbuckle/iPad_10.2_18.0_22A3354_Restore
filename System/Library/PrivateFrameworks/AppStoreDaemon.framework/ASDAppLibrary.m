@implementation ASDAppLibrary

+ (id)interface
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE391E90);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0C99E60];
  v4 = objc_opt_class();
  objc_msgSend(v3, "setWithObjects:", v4, objc_opt_class(), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v5, sel_executeQueryWithPredicate_withReplyHandler_, 0, 1);

  v6 = (void *)MEMORY[0x1E0C99E60];
  v7 = objc_opt_class();
  objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v8, sel_executeQueryWithPredicate_onPairedDevice_withReplyHandler_, 0, 1);

  v9 = (void *)MEMORY[0x1E0C99E60];
  v10 = objc_opt_class();
  objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v11, sel_executeQueryForUpdatesReloadingFromServer_withReplyHandler_, 0, 1);

  return v2;
}

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __31__ASDAppLibrary_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1ECFFA9D0 != -1)
    dispatch_once(&qword_1ECFFA9D0, block);
  return (id)_MergedGlobals_26;
}

void __31__ASDAppLibrary_sharedInstance__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)_MergedGlobals_26;
  _MergedGlobals_26 = (uint64_t)v1;

}

- (ASDAppLibrary)init
{
  void *v3;
  void *v4;
  id v5;
  ASDAppLibrary *v6;
  objc_super v8;

  +[ASDServiceBroker defaultBroker](ASDServiceBroker, "defaultBroker");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[ASDNotificationCenter defaultCenter](ASDNotificationCenter, "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v3;
  if (self)
  {
    v8.receiver = self;
    v8.super_class = (Class)ASDAppLibrary;
    v6 = -[ASDAppLibrary init](&v8, sel_init);
    self = v6;
    if (v6)
      objc_storeWeak((id *)&v6->_serviceBroker, v5);
  }

  return self;
}

+ (int64_t)launchApp:(id)a3
{
  id v3;
  void *v4;
  id *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  int64_t v9;
  NSObject *v10;
  void *v12;
  uint64_t v13;
  id v14;
  _QWORD v15[5];
  _QWORD v16[5];
  id obj;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  id v31;
  __int16 v32;
  uint64_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__0;
  v26 = __Block_byref_object_dispose__0;
  v27 = 0;
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 2;
  +[ASDServiceBroker defaultBroker](ASDServiceBroker, "defaultBroker");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id *)(v23 + 5);
  obj = (id)v23[5];
  objc_msgSend(v4, "getLibraryServiceWithError:", &obj);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(v5, obj);

  v7 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __27__ASDAppLibrary_launchApp___block_invoke;
  v16[3] = &unk_1E37BDFB0;
  v16[4] = &v22;
  objc_msgSend(v6, "synchronousRemoteObjectProxyWithErrorHandler:", v16);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v7;
  v15[1] = 3221225472;
  v15[2] = __27__ASDAppLibrary_launchApp___block_invoke_2;
  v15[3] = &unk_1E37BDFD8;
  v15[4] = &v18;
  objc_msgSend(v8, "launchApp:withReplyHandler:", v3, v15);

  v9 = v19[3];
  if (v9 == 2)
  {
    ASDLogHandleForCategory(12);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v12 = (void *)objc_opt_class();
      v13 = v23[5];
      *(_DWORD *)buf = 138543874;
      v29 = v12;
      v30 = 2114;
      v31 = v3;
      v32 = 2114;
      v33 = v13;
      v14 = v12;
      _os_log_error_impl(&dword_19A03B000, v10, OS_LOG_TYPE_ERROR, "[%{public}@]: Failed to launch %{public}@ error: %{public}@", buf, 0x20u);

    }
    v9 = v19[3];
  }

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v22, 8);

  return v9;
}

void __27__ASDAppLibrary_launchApp___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

uint64_t __27__ASDAppLibrary_launchApp___block_invoke_2(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

+ (int64_t)launchApp:(id)a3 onPairedDevice:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  int64_t v13;
  NSObject *v14;
  void *v16;
  uint64_t v17;
  id v18;
  _QWORD v19[5];
  _QWORD v20[5];
  id obj;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  id v35;
  __int16 v36;
  id v37;
  __int16 v38;
  uint64_t v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__0;
  v30 = __Block_byref_object_dispose__0;
  v31 = 0;
  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = 2;
  +[ASDServiceBroker defaultBroker](ASDServiceBroker, "defaultBroker");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id *)(v27 + 5);
  obj = (id)v27[5];
  objc_msgSend(v7, "getLibraryServiceWithError:", &obj);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(v8, obj);

  v10 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __42__ASDAppLibrary_launchApp_onPairedDevice___block_invoke;
  v20[3] = &unk_1E37BDFB0;
  v20[4] = &v26;
  objc_msgSend(v9, "synchronousRemoteObjectProxyWithErrorHandler:", v20);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "pairingID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v10;
  v19[1] = 3221225472;
  v19[2] = __42__ASDAppLibrary_launchApp_onPairedDevice___block_invoke_2;
  v19[3] = &unk_1E37BDFD8;
  v19[4] = &v22;
  objc_msgSend(v11, "launchApp:onPairedDevice:withReplyHandler:", v5, v12, v19);

  v13 = v23[3];
  if (v13 == 2)
  {
    ASDLogHandleForCategory(12);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v16 = (void *)objc_opt_class();
      v17 = v27[5];
      *(_DWORD *)buf = 138544130;
      v33 = v16;
      v34 = 2114;
      v35 = v5;
      v36 = 2114;
      v37 = v6;
      v38 = 2114;
      v39 = v17;
      v18 = v16;
      _os_log_error_impl(&dword_19A03B000, v14, OS_LOG_TYPE_ERROR, "[%{public}@]: Failed to launch %{public}@ on %{public}@ error: %{public}@", buf, 0x2Au);

    }
    v13 = v23[3];
  }

  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v26, 8);

  return v13;
}

void __42__ASDAppLibrary_launchApp_onPairedDevice___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

uint64_t __42__ASDAppLibrary_launchApp_onPairedDevice___block_invoke_2(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

+ (void)launchApp:(id)a3 withResultHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  +[ASDServiceBroker defaultBroker](ASDServiceBroker, "defaultBroker");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __45__ASDAppLibrary_launchApp_withResultHandler___block_invoke;
  v11[3] = &unk_1E37BE078;
  v13 = v7;
  v14 = a1;
  v12 = v6;
  v9 = v7;
  v10 = v6;
  objc_msgSend(v8, "getLibraryServiceWithCompletionHandler:", v11);

}

void __45__ASDAppLibrary_launchApp_withResultHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  uint64_t v16;
  _QWORD v17[4];
  id v18;
  id v19;
  uint64_t v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (a2)
  {
    v6 = MEMORY[0x1E0C809B0];
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __45__ASDAppLibrary_launchApp_withResultHandler___block_invoke_2;
    v17[3] = &unk_1E37BE000;
    v20 = *(_QWORD *)(a1 + 48);
    v18 = *(id *)(a1 + 32);
    v19 = *(id *)(a1 + 40);
    objc_msgSend(a2, "remoteObjectProxyWithErrorHandler:", v17);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(void **)(a1 + 32);
    v13[0] = v6;
    v13[1] = 3221225472;
    v13[2] = __45__ASDAppLibrary_launchApp_withResultHandler___block_invoke_4;
    v13[3] = &unk_1E37BE050;
    v16 = *(_QWORD *)(a1 + 48);
    v14 = v8;
    v15 = *(id *)(a1 + 40);
    objc_msgSend(v7, "launchApp:withReplyHandler:", v14, v13);

  }
  else
  {
    ASDLogHandleForCategory(12);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = (void *)objc_opt_class();
      v11 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543874;
      v22 = v10;
      v23 = 2114;
      v24 = v11;
      v25 = 2114;
      v26 = v5;
      v12 = v10;
      _os_log_error_impl(&dword_19A03B000, v9, OS_LOG_TYPE_ERROR, "[%{public}@]: Failed to launch %{public}@ error: %{public}@", buf, 0x20u);

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

void __45__ASDAppLibrary_launchApp_withResultHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  id v9;
  int v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  ASDLogHandleForCategory(12);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v7 = (void *)objc_opt_class();
    v8 = *(_QWORD *)(a1 + 32);
    v10 = 138543874;
    v11 = v7;
    v12 = 2114;
    v13 = v8;
    v14 = 2114;
    v15 = v3;
    v9 = v7;
    _os_log_error_impl(&dword_19A03B000, v4, OS_LOG_TYPE_ERROR, "[%{public}@]: Failed to launch %{public}@ error: %{public}@", (uint8_t *)&v10, 0x20u);

  }
  (*(void (**)(_QWORD, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 2, v5, v6);

}

void __45__ASDAppLibrary_launchApp_withResultHandler___block_invoke_4(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  id v8;
  _QWORD v9[4];
  id v10;
  uint64_t v11;
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    ASDLogHandleForCategory(12);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v6 = (void *)objc_opt_class();
      v7 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543874;
      v13 = v6;
      v14 = 2114;
      v15 = v7;
      v16 = 2048;
      v17 = a2;
      v8 = v6;
      _os_log_error_impl(&dword_19A03B000, v4, OS_LOG_TYPE_ERROR, "[%{public}@]: Failed to launch %{public}@ status: %ld", buf, 0x20u);

    }
  }
  dispatch_get_global_queue(21, 0);
  v5 = objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __45__ASDAppLibrary_launchApp_withResultHandler___block_invoke_5;
  v9[3] = &unk_1E37BE028;
  v10 = *(id *)(a1 + 40);
  v11 = a2;
  dispatch_async(v5, v9);

}

uint64_t __45__ASDAppLibrary_launchApp_withResultHandler___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

+ (void)launchApp:(id)a3 onPairedDevice:(id)a4 withResultHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  +[ASDServiceBroker defaultBroker](ASDServiceBroker, "defaultBroker");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __60__ASDAppLibrary_launchApp_onPairedDevice_withResultHandler___block_invoke;
  v15[3] = &unk_1E37BE0F0;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v19 = a1;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  objc_msgSend(v11, "getLibraryServiceWithCompletionHandler:", v15);

}

void __60__ASDAppLibrary_launchApp_onPairedDevice_withResultHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  uint64_t v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  uint64_t v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (a2)
  {
    v6 = MEMORY[0x1E0C809B0];
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __60__ASDAppLibrary_launchApp_onPairedDevice_withResultHandler___block_invoke_2;
    v20[3] = &unk_1E37BE0A0;
    v24 = *(_QWORD *)(a1 + 56);
    v21 = *(id *)(a1 + 32);
    v22 = *(id *)(a1 + 40);
    v23 = *(id *)(a1 + 48);
    objc_msgSend(a2, "remoteObjectProxyWithErrorHandler:", v20);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "pairingID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = v6;
    v15[1] = 3221225472;
    v15[2] = __60__ASDAppLibrary_launchApp_onPairedDevice_withResultHandler___block_invoke_7;
    v15[3] = &unk_1E37BE0C8;
    v19 = *(_QWORD *)(a1 + 56);
    v16 = *(id *)(a1 + 32);
    v17 = *(id *)(a1 + 40);
    v18 = *(id *)(a1 + 48);
    objc_msgSend(v7, "launchApp:onPairedDevice:withReplyHandler:", v8, v9, v15);

  }
  else
  {
    ASDLogHandleForCategory(12);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = (void *)objc_opt_class();
      v12 = *(_QWORD *)(a1 + 32);
      v13 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138544130;
      v26 = v11;
      v27 = 2114;
      v28 = v12;
      v29 = 2114;
      v30 = v13;
      v31 = 2114;
      v32 = v5;
      v14 = v11;
      _os_log_error_impl(&dword_19A03B000, v10, OS_LOG_TYPE_ERROR, "[%{public}@]: Failed to launch %{public}@ on %{public}@ error: %{public}@", buf, 0x2Au);

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

void __60__ASDAppLibrary_launchApp_onPairedDevice_withResultHandler___block_invoke_2(_QWORD *a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  int v13;
  void *v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  ASDLogHandleForCategory(12);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v9 = (void *)objc_opt_class();
    v10 = a1[4];
    v11 = a1[5];
    v13 = 138544130;
    v14 = v9;
    v15 = 2114;
    v16 = v10;
    v17 = 2114;
    v18 = v11;
    v19 = 2114;
    v20 = v3;
    v12 = v9;
    _os_log_error_impl(&dword_19A03B000, v4, OS_LOG_TYPE_ERROR, "[%{public}@]: Failed to launch %{public}@ on %{public}@ error: %{public}@", (uint8_t *)&v13, 0x2Au);

  }
  (*(void (**)(_QWORD, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1[6] + 16))(a1[6], 2, v5, v6, v7, v8);

}

void __60__ASDAppLibrary_launchApp_onPairedDevice_withResultHandler___block_invoke_7(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  _QWORD v10[4];
  id v11;
  uint64_t v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    ASDLogHandleForCategory(12);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v6 = (void *)objc_opt_class();
      v7 = *(_QWORD *)(a1 + 32);
      v8 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138544130;
      v14 = v6;
      v15 = 2114;
      v16 = v7;
      v17 = 2114;
      v18 = v8;
      v19 = 2048;
      v20 = a2;
      v9 = v6;
      _os_log_error_impl(&dword_19A03B000, v4, OS_LOG_TYPE_ERROR, "[%{public}@]: Failed to launch %{public}@ on %{public}@ status: %ld", buf, 0x2Au);

    }
  }
  dispatch_get_global_queue(21, 0);
  v5 = objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __60__ASDAppLibrary_launchApp_onPairedDevice_withResultHandler___block_invoke_8;
  v10[3] = &unk_1E37BE028;
  v11 = *(id *)(a1 + 48);
  v12 = a2;
  dispatch_async(v5, v10);

}

uint64_t __60__ASDAppLibrary_launchApp_onPairedDevice_withResultHandler___block_invoke_8(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

+ (int64_t)launchMessagesExtensionForApp:(id)a3
{
  id v3;
  void *v4;
  id *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  int64_t v10;
  void *v12;
  uint64_t v13;
  id v14;
  _QWORD v15[5];
  _QWORD v16[5];
  id obj;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  id v31;
  __int16 v32;
  uint64_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__0;
  v26 = __Block_byref_object_dispose__0;
  v27 = 0;
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 2;
  +[ASDServiceBroker defaultBroker](ASDServiceBroker, "defaultBroker");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id *)(v23 + 5);
  obj = (id)v23[5];
  objc_msgSend(v4, "getLibraryServiceWithError:", &obj);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(v5, obj);

  v7 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __47__ASDAppLibrary_launchMessagesExtensionForApp___block_invoke;
  v16[3] = &unk_1E37BDFB0;
  v16[4] = &v22;
  objc_msgSend(v6, "synchronousRemoteObjectProxyWithErrorHandler:", v16);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v7;
  v15[1] = 3221225472;
  v15[2] = __47__ASDAppLibrary_launchMessagesExtensionForApp___block_invoke_2;
  v15[3] = &unk_1E37BDFD8;
  v15[4] = &v18;
  objc_msgSend(v8, "launchApp:extensionType:withReplyHandler:", v3, 1, v15);

  if (v23[5])
  {
    ASDLogHandleForCategory(12);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v12 = (void *)objc_opt_class();
      v13 = v23[5];
      *(_DWORD *)buf = 138543874;
      v29 = v12;
      v30 = 2114;
      v31 = v3;
      v32 = 2114;
      v33 = v13;
      v14 = v12;
      _os_log_error_impl(&dword_19A03B000, v9, OS_LOG_TYPE_ERROR, "[%{public}@]: Failed to launch extension for %{public}@ error: %{public}@", buf, 0x20u);

    }
  }
  v10 = v19[3];

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v22, 8);

  return v10;
}

void __47__ASDAppLibrary_launchMessagesExtensionForApp___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

uint64_t __47__ASDAppLibrary_launchMessagesExtensionForApp___block_invoke_2(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

+ (void)launchMessagesExtensionForApp:(id)a3 withResultHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  +[ASDServiceBroker defaultBroker](ASDServiceBroker, "defaultBroker");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __65__ASDAppLibrary_launchMessagesExtensionForApp_withResultHandler___block_invoke;
  v11[3] = &unk_1E37BE078;
  v13 = v7;
  v14 = a1;
  v12 = v6;
  v9 = v7;
  v10 = v6;
  objc_msgSend(v8, "getLibraryServiceWithCompletionHandler:", v11);

}

void __65__ASDAppLibrary_launchMessagesExtensionForApp_withResultHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  uint64_t v16;
  _QWORD v17[4];
  id v18;
  id v19;
  uint64_t v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (a2)
  {
    v6 = MEMORY[0x1E0C809B0];
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __65__ASDAppLibrary_launchMessagesExtensionForApp_withResultHandler___block_invoke_2;
    v17[3] = &unk_1E37BE000;
    v20 = *(_QWORD *)(a1 + 48);
    v18 = *(id *)(a1 + 32);
    v19 = *(id *)(a1 + 40);
    objc_msgSend(a2, "remoteObjectProxyWithErrorHandler:", v17);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(void **)(a1 + 32);
    v13[0] = v6;
    v13[1] = 3221225472;
    v13[2] = __65__ASDAppLibrary_launchMessagesExtensionForApp_withResultHandler___block_invoke_9;
    v13[3] = &unk_1E37BE050;
    v16 = *(_QWORD *)(a1 + 48);
    v14 = v8;
    v15 = *(id *)(a1 + 40);
    objc_msgSend(v7, "launchApp:extensionType:withReplyHandler:", v14, 1, v13);

  }
  else
  {
    ASDLogHandleForCategory(12);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = (void *)objc_opt_class();
      v11 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543874;
      v22 = v10;
      v23 = 2114;
      v24 = v11;
      v25 = 2114;
      v26 = v5;
      v12 = v10;
      _os_log_error_impl(&dword_19A03B000, v9, OS_LOG_TYPE_ERROR, "[%{public}@]: Failed to launch extension for %{public}@ error: %{public}@", buf, 0x20u);

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

void __65__ASDAppLibrary_launchMessagesExtensionForApp_withResultHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  id v9;
  int v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  ASDLogHandleForCategory(12);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v7 = (void *)objc_opt_class();
    v8 = *(_QWORD *)(a1 + 32);
    v10 = 138543874;
    v11 = v7;
    v12 = 2114;
    v13 = v8;
    v14 = 2114;
    v15 = v3;
    v9 = v7;
    _os_log_error_impl(&dword_19A03B000, v4, OS_LOG_TYPE_ERROR, "[%{public}@]: Failed to launch extension for %{public}@ error: %{public}@", (uint8_t *)&v10, 0x20u);

  }
  (*(void (**)(_QWORD, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 2, v5, v6);

}

void __65__ASDAppLibrary_launchMessagesExtensionForApp_withResultHandler___block_invoke_9(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  id v8;
  _QWORD v9[4];
  id v10;
  uint64_t v11;
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    ASDLogHandleForCategory(12);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v6 = (void *)objc_opt_class();
      v7 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543874;
      v13 = v6;
      v14 = 2114;
      v15 = v7;
      v16 = 2048;
      v17 = a2;
      v8 = v6;
      _os_log_error_impl(&dword_19A03B000, v4, OS_LOG_TYPE_ERROR, "[%{public}@]: Failed to launch extension for %{public}@ status: %ld", buf, 0x20u);

    }
  }
  dispatch_get_global_queue(21, 0);
  v5 = objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __65__ASDAppLibrary_launchMessagesExtensionForApp_withResultHandler___block_invoke_10;
  v9[3] = &unk_1E37BE028;
  v10 = *(id *)(a1 + 40);
  v11 = a2;
  dispatch_async(v5, v9);

}

uint64_t __65__ASDAppLibrary_launchMessagesExtensionForApp_withResultHandler___block_invoke_10(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

+ (void)lookupBundleIDsForDeletableSystemAppsWithItemIDs:(id)a3 withResultHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  +[ASDServiceBroker defaultBroker](ASDServiceBroker, "defaultBroker");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __84__ASDAppLibrary_lookupBundleIDsForDeletableSystemAppsWithItemIDs_withResultHandler___block_invoke;
  v11[3] = &unk_1E37BE078;
  v13 = v7;
  v14 = a1;
  v12 = v6;
  v9 = v7;
  v10 = v6;
  objc_msgSend(v8, "getLibraryServiceWithCompletionHandler:", v11);

}

void __84__ASDAppLibrary_lookupBundleIDsForDeletableSystemAppsWithItemIDs_withResultHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  uint64_t v16;
  _QWORD v17[4];
  id v18;
  id v19;
  uint64_t v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (a2)
  {
    v6 = MEMORY[0x1E0C809B0];
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __84__ASDAppLibrary_lookupBundleIDsForDeletableSystemAppsWithItemIDs_withResultHandler___block_invoke_2;
    v17[3] = &unk_1E37BE000;
    v20 = *(_QWORD *)(a1 + 48);
    v18 = *(id *)(a1 + 32);
    v19 = *(id *)(a1 + 40);
    objc_msgSend(a2, "remoteObjectProxyWithErrorHandler:", v17);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(void **)(a1 + 32);
    v13[0] = v6;
    v13[1] = 3221225472;
    v13[2] = __84__ASDAppLibrary_lookupBundleIDsForDeletableSystemAppsWithItemIDs_withResultHandler___block_invoke_11;
    v13[3] = &unk_1E37BE118;
    v16 = *(_QWORD *)(a1 + 48);
    v14 = v8;
    v15 = *(id *)(a1 + 40);
    objc_msgSend(v7, "lookupBundleIDsForDeletableSystemAppsWithItemIDs:withReplyHandler:", v14, v13);

  }
  else
  {
    ASDLogHandleForCategory(12);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = (void *)objc_opt_class();
      v11 = *(void **)(a1 + 32);
      v12 = v10;
      *(_DWORD *)buf = 138543874;
      v22 = v10;
      v23 = 2048;
      v24 = objc_msgSend(v11, "count");
      v25 = 2114;
      v26 = v5;
      _os_log_error_impl(&dword_19A03B000, v9, OS_LOG_TYPE_ERROR, "[%{public}@]: Failed to request mapping for %lu itemID(s) error: %{public}@", buf, 0x20u);

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

void __84__ASDAppLibrary_lookupBundleIDsForDeletableSystemAppsWithItemIDs_withResultHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  id v7;
  int v8;
  void *v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  ASDLogHandleForCategory(12);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = (void *)objc_opt_class();
    v6 = *(void **)(a1 + 32);
    v7 = v5;
    v8 = 138543874;
    v9 = v5;
    v10 = 2048;
    v11 = objc_msgSend(v6, "count");
    v12 = 2114;
    v13 = v3;
    _os_log_error_impl(&dword_19A03B000, v4, OS_LOG_TYPE_ERROR, "[%{public}@]: Failed to request mapping for %lu itemID(s) error: %{public}@", (uint8_t *)&v8, 0x20u);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __84__ASDAppLibrary_lookupBundleIDsForDeletableSystemAppsWithItemIDs_withResultHandler___block_invoke_11(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD block[4];
  id v16;
  id v17;
  id v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    ASDLogHandleForCategory(12);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v12 = (void *)objc_opt_class();
      v13 = *(void **)(a1 + 32);
      v14 = v12;
      *(_DWORD *)buf = 138543874;
      v20 = v12;
      v21 = 2048;
      v22 = objc_msgSend(v13, "count");
      v23 = 2114;
      v24 = v6;
      _os_log_error_impl(&dword_19A03B000, v7, OS_LOG_TYPE_ERROR, "[%{public}@]: Failed to request mapping for %lu itemID(s) error: %{public}@", buf, 0x20u);

    }
  }
  dispatch_get_global_queue(21, 0);
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __84__ASDAppLibrary_lookupBundleIDsForDeletableSystemAppsWithItemIDs_withResultHandler___block_invoke_12;
  block[3] = &unk_1E37BDF10;
  v9 = *(id *)(a1 + 40);
  v17 = v6;
  v18 = v9;
  v16 = v5;
  v10 = v6;
  v11 = v5;
  dispatch_async(v8, block);

}

uint64_t __84__ASDAppLibrary_lookupBundleIDsForDeletableSystemAppsWithItemIDs_withResultHandler___block_invoke_12(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

+ (void)lookupItemIDsForDeletableSystemAppsWithBundleIDs:(id)a3 withResultHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  +[ASDServiceBroker defaultBroker](ASDServiceBroker, "defaultBroker");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __84__ASDAppLibrary_lookupItemIDsForDeletableSystemAppsWithBundleIDs_withResultHandler___block_invoke;
  v11[3] = &unk_1E37BE078;
  v13 = v7;
  v14 = a1;
  v12 = v6;
  v9 = v7;
  v10 = v6;
  objc_msgSend(v8, "getLibraryServiceWithCompletionHandler:", v11);

}

void __84__ASDAppLibrary_lookupItemIDsForDeletableSystemAppsWithBundleIDs_withResultHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  uint64_t v16;
  _QWORD v17[4];
  id v18;
  id v19;
  uint64_t v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (a2)
  {
    v6 = MEMORY[0x1E0C809B0];
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __84__ASDAppLibrary_lookupItemIDsForDeletableSystemAppsWithBundleIDs_withResultHandler___block_invoke_2;
    v17[3] = &unk_1E37BE000;
    v20 = *(_QWORD *)(a1 + 48);
    v18 = *(id *)(a1 + 32);
    v19 = *(id *)(a1 + 40);
    objc_msgSend(a2, "remoteObjectProxyWithErrorHandler:", v17);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(void **)(a1 + 32);
    v13[0] = v6;
    v13[1] = 3221225472;
    v13[2] = __84__ASDAppLibrary_lookupItemIDsForDeletableSystemAppsWithBundleIDs_withResultHandler___block_invoke_14;
    v13[3] = &unk_1E37BE118;
    v16 = *(_QWORD *)(a1 + 48);
    v14 = v8;
    v15 = *(id *)(a1 + 40);
    objc_msgSend(v7, "lookupItemIDsForDeletableSystemAppsWithBundleIDs:withReplyHandler:", v14, v13);

  }
  else
  {
    ASDLogHandleForCategory(12);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = (void *)objc_opt_class();
      v11 = *(void **)(a1 + 32);
      v12 = v10;
      *(_DWORD *)buf = 138543874;
      v22 = v10;
      v23 = 2048;
      v24 = objc_msgSend(v11, "count");
      v25 = 2114;
      v26 = v5;
      _os_log_error_impl(&dword_19A03B000, v9, OS_LOG_TYPE_ERROR, "[%{public}@]: Failed to request mapping for %lu itemID(s) error: %{public}@", buf, 0x20u);

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

void __84__ASDAppLibrary_lookupItemIDsForDeletableSystemAppsWithBundleIDs_withResultHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  id v7;
  int v8;
  void *v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  ASDLogHandleForCategory(12);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = (void *)objc_opt_class();
    v6 = *(void **)(a1 + 32);
    v7 = v5;
    v8 = 138543874;
    v9 = v5;
    v10 = 2048;
    v11 = objc_msgSend(v6, "count");
    v12 = 2114;
    v13 = v3;
    _os_log_error_impl(&dword_19A03B000, v4, OS_LOG_TYPE_ERROR, "[%{public}@]: Failed to request mapping for %lu bundleID(s) error: %{public}@", (uint8_t *)&v8, 0x20u);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __84__ASDAppLibrary_lookupItemIDsForDeletableSystemAppsWithBundleIDs_withResultHandler___block_invoke_14(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD block[4];
  id v16;
  id v17;
  id v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    ASDLogHandleForCategory(12);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v12 = (void *)objc_opt_class();
      v13 = *(void **)(a1 + 32);
      v14 = v12;
      *(_DWORD *)buf = 138543874;
      v20 = v12;
      v21 = 2048;
      v22 = objc_msgSend(v13, "count");
      v23 = 2114;
      v24 = v6;
      _os_log_error_impl(&dword_19A03B000, v7, OS_LOG_TYPE_ERROR, "[%{public}@]: Failed to request mapping for %lu bundleID(s) error: %{public}@", buf, 0x20u);

    }
  }
  dispatch_get_global_queue(21, 0);
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __84__ASDAppLibrary_lookupItemIDsForDeletableSystemAppsWithBundleIDs_withResultHandler___block_invoke_15;
  block[3] = &unk_1E37BDF10;
  v9 = *(id *)(a1 + 40);
  v17 = v6;
  v18 = v9;
  v16 = v5;
  v10 = v6;
  v11 = v5;
  dispatch_async(v8, block);

}

uint64_t __84__ASDAppLibrary_lookupItemIDsForDeletableSystemAppsWithBundleIDs_withResultHandler___block_invoke_15(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

+ (void)lookupBundleIDsForDeletableSystemAppsForWatchWithItemIDs:(id)a3 withResultHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  +[ASDServiceBroker defaultBroker](ASDServiceBroker, "defaultBroker");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __92__ASDAppLibrary_lookupBundleIDsForDeletableSystemAppsForWatchWithItemIDs_withResultHandler___block_invoke;
  v11[3] = &unk_1E37BE078;
  v13 = v7;
  v14 = a1;
  v12 = v6;
  v9 = v7;
  v10 = v6;
  objc_msgSend(v8, "getLibraryServiceWithCompletionHandler:", v11);

}

void __92__ASDAppLibrary_lookupBundleIDsForDeletableSystemAppsForWatchWithItemIDs_withResultHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  uint64_t v16;
  _QWORD v17[4];
  id v18;
  id v19;
  uint64_t v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (a2)
  {
    v6 = MEMORY[0x1E0C809B0];
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __92__ASDAppLibrary_lookupBundleIDsForDeletableSystemAppsForWatchWithItemIDs_withResultHandler___block_invoke_2;
    v17[3] = &unk_1E37BE000;
    v20 = *(_QWORD *)(a1 + 48);
    v18 = *(id *)(a1 + 32);
    v19 = *(id *)(a1 + 40);
    objc_msgSend(a2, "remoteObjectProxyWithErrorHandler:", v17);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(void **)(a1 + 32);
    v13[0] = v6;
    v13[1] = 3221225472;
    v13[2] = __92__ASDAppLibrary_lookupBundleIDsForDeletableSystemAppsForWatchWithItemIDs_withResultHandler___block_invoke_16;
    v13[3] = &unk_1E37BE118;
    v16 = *(_QWORD *)(a1 + 48);
    v14 = v8;
    v15 = *(id *)(a1 + 40);
    objc_msgSend(v7, "lookupBundleIDsForDeletableSystemAppsForWatchWithItemIDs:withReplyHandler:", v14, v13);

  }
  else
  {
    ASDLogHandleForCategory(12);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = (void *)objc_opt_class();
      v11 = *(void **)(a1 + 32);
      v12 = v10;
      *(_DWORD *)buf = 138543874;
      v22 = v10;
      v23 = 2048;
      v24 = objc_msgSend(v11, "count");
      v25 = 2114;
      v26 = v5;
      _os_log_error_impl(&dword_19A03B000, v9, OS_LOG_TYPE_ERROR, "[%{public}@]: Failed to request mapping for %lu itemID(s) error: %{public}@", buf, 0x20u);

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

void __92__ASDAppLibrary_lookupBundleIDsForDeletableSystemAppsForWatchWithItemIDs_withResultHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  id v7;
  int v8;
  void *v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  ASDLogHandleForCategory(12);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = (void *)objc_opt_class();
    v6 = *(void **)(a1 + 32);
    v7 = v5;
    v8 = 138543874;
    v9 = v5;
    v10 = 2048;
    v11 = objc_msgSend(v6, "count");
    v12 = 2114;
    v13 = v3;
    _os_log_error_impl(&dword_19A03B000, v4, OS_LOG_TYPE_ERROR, "[%{public}@]: Failed to request mapping for %lu watch itemID(s) error: %{public}@", (uint8_t *)&v8, 0x20u);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __92__ASDAppLibrary_lookupBundleIDsForDeletableSystemAppsForWatchWithItemIDs_withResultHandler___block_invoke_16(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD block[4];
  id v16;
  id v17;
  id v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    ASDLogHandleForCategory(12);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v12 = (void *)objc_opt_class();
      v13 = *(void **)(a1 + 32);
      v14 = v12;
      *(_DWORD *)buf = 138543874;
      v20 = v12;
      v21 = 2048;
      v22 = objc_msgSend(v13, "count");
      v23 = 2114;
      v24 = v6;
      _os_log_error_impl(&dword_19A03B000, v7, OS_LOG_TYPE_ERROR, "[%{public}@]: Failed to request mapping for %lu watch itemID(s) error: %{public}@", buf, 0x20u);

    }
  }
  dispatch_get_global_queue(21, 0);
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __92__ASDAppLibrary_lookupBundleIDsForDeletableSystemAppsForWatchWithItemIDs_withResultHandler___block_invoke_17;
  block[3] = &unk_1E37BDF10;
  v9 = *(id *)(a1 + 40);
  v17 = v6;
  v18 = v9;
  v16 = v5;
  v10 = v6;
  v11 = v5;
  dispatch_async(v8, block);

}

uint64_t __92__ASDAppLibrary_lookupBundleIDsForDeletableSystemAppsForWatchWithItemIDs_withResultHandler___block_invoke_17(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

+ (void)lookupItemIDsForDeletableSystemAppsForWatchWithBundleIDs:(id)a3 withResultHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  +[ASDServiceBroker defaultBroker](ASDServiceBroker, "defaultBroker");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __92__ASDAppLibrary_lookupItemIDsForDeletableSystemAppsForWatchWithBundleIDs_withResultHandler___block_invoke;
  v11[3] = &unk_1E37BE078;
  v13 = v7;
  v14 = a1;
  v12 = v6;
  v9 = v7;
  v10 = v6;
  objc_msgSend(v8, "getLibraryServiceWithCompletionHandler:", v11);

}

void __92__ASDAppLibrary_lookupItemIDsForDeletableSystemAppsForWatchWithBundleIDs_withResultHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  uint64_t v16;
  _QWORD v17[4];
  id v18;
  id v19;
  uint64_t v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (a2)
  {
    v6 = MEMORY[0x1E0C809B0];
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __92__ASDAppLibrary_lookupItemIDsForDeletableSystemAppsForWatchWithBundleIDs_withResultHandler___block_invoke_2;
    v17[3] = &unk_1E37BE000;
    v20 = *(_QWORD *)(a1 + 48);
    v18 = *(id *)(a1 + 32);
    v19 = *(id *)(a1 + 40);
    objc_msgSend(a2, "remoteObjectProxyWithErrorHandler:", v17);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(void **)(a1 + 32);
    v13[0] = v6;
    v13[1] = 3221225472;
    v13[2] = __92__ASDAppLibrary_lookupItemIDsForDeletableSystemAppsForWatchWithBundleIDs_withResultHandler___block_invoke_18;
    v13[3] = &unk_1E37BE118;
    v16 = *(_QWORD *)(a1 + 48);
    v14 = v8;
    v15 = *(id *)(a1 + 40);
    objc_msgSend(v7, "lookupItemIDsForDeletableSystemAppsForWatchWithBundleIDs:withReplyHandler:", v14, v13);

  }
  else
  {
    ASDLogHandleForCategory(12);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = (void *)objc_opt_class();
      v11 = *(void **)(a1 + 32);
      v12 = v10;
      *(_DWORD *)buf = 138543874;
      v22 = v10;
      v23 = 2048;
      v24 = objc_msgSend(v11, "count");
      v25 = 2114;
      v26 = v5;
      _os_log_error_impl(&dword_19A03B000, v9, OS_LOG_TYPE_ERROR, "[%{public}@]: Failed to request mapping for %lu itemID(s) error: %{public}@", buf, 0x20u);

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

void __92__ASDAppLibrary_lookupItemIDsForDeletableSystemAppsForWatchWithBundleIDs_withResultHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  id v7;
  int v8;
  void *v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  ASDLogHandleForCategory(12);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = (void *)objc_opt_class();
    v6 = *(void **)(a1 + 32);
    v7 = v5;
    v8 = 138543874;
    v9 = v5;
    v10 = 2048;
    v11 = objc_msgSend(v6, "count");
    v12 = 2114;
    v13 = v3;
    _os_log_error_impl(&dword_19A03B000, v4, OS_LOG_TYPE_ERROR, "[%{public}@]: Failed to request mapping for %lu watch bundleID(s) error: %{public}@", (uint8_t *)&v8, 0x20u);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __92__ASDAppLibrary_lookupItemIDsForDeletableSystemAppsForWatchWithBundleIDs_withResultHandler___block_invoke_18(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD block[4];
  id v16;
  id v17;
  id v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    ASDLogHandleForCategory(12);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v12 = (void *)objc_opt_class();
      v13 = *(void **)(a1 + 32);
      v14 = v12;
      *(_DWORD *)buf = 138543874;
      v20 = v12;
      v21 = 2048;
      v22 = objc_msgSend(v13, "count");
      v23 = 2114;
      v24 = v6;
      _os_log_error_impl(&dword_19A03B000, v7, OS_LOG_TYPE_ERROR, "[%{public}@]: Failed to request mapping for %lu watch bundleID(s) error: %{public}@", buf, 0x20u);

    }
  }
  dispatch_get_global_queue(21, 0);
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __92__ASDAppLibrary_lookupItemIDsForDeletableSystemAppsForWatchWithBundleIDs_withResultHandler___block_invoke_19;
  block[3] = &unk_1E37BDF10;
  v9 = *(id *)(a1 + 40);
  v17 = v6;
  v18 = v9;
  v16 = v5;
  v10 = v6;
  v11 = v5;
  dispatch_async(v8, block);

}

uint64_t __92__ASDAppLibrary_lookupItemIDsForDeletableSystemAppsForWatchWithBundleIDs_withResultHandler___block_invoke_19(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

+ (unsigned)openableStatusForExecutableAtPath:(id)a3
{
  id v3;
  void *v4;
  id *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  void *v11;
  uint64_t v12;
  _QWORD v13[6];
  _QWORD v14[5];
  id obj;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  char v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  uint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = -1;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__0;
  v20 = __Block_byref_object_dispose__0;
  v21 = 0;
  +[ASDServiceBroker defaultBroker](ASDServiceBroker, "defaultBroker");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id *)(v17 + 5);
  obj = (id)v17[5];
  objc_msgSend(v4, "getLibraryServiceWithError:", &obj);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(v5, obj);

  if (v6)
  {
    v7 = MEMORY[0x1E0C809B0];
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __51__ASDAppLibrary_openableStatusForExecutableAtPath___block_invoke;
    v14[3] = &unk_1E37BDFB0;
    v14[4] = &v16;
    objc_msgSend(v6, "synchronousRemoteObjectProxyWithErrorHandler:", v14);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v7;
    v13[1] = 3221225472;
    v13[2] = __51__ASDAppLibrary_openableStatusForExecutableAtPath___block_invoke_2;
    v13[3] = &unk_1E37BE140;
    v13[4] = &v22;
    v13[5] = &v16;
    objc_msgSend(v8, "openableStatusForExecutableAtPath:withReplyHandler:", v3, v13);

  }
  LODWORD(v9) = *((unsigned __int8 *)v23 + 24);
  if ((_DWORD)v9 == 255)
  {
    ASDLogHandleForCategory(12);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v3, "lastPathComponent");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v17[5];
      *(_DWORD *)buf = 138543618;
      v27 = v11;
      v28 = 2114;
      v29 = v12;
      _os_log_error_impl(&dword_19A03B000, v9, OS_LOG_TYPE_ERROR, "[Library] Status for %{public}@ unknown: %{public}@", buf, 0x16u);

    }
    LOBYTE(v9) = *((_BYTE *)v23 + 24);
  }

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v22, 8);

  return v9;
}

void __51__ASDAppLibrary_openableStatusForExecutableAtPath___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __51__ASDAppLibrary_openableStatusForExecutableAtPath___block_invoke_2(uint64_t a1, void *a2, char a3)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a3;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
}

+ (void)uninstallApp:(id)a3 withResultHandler:(id)a4
{
  objc_msgSend(a1, "uninstallApp:requestUserConfirmation:withResultHandler:", a3, 1, a4);
}

+ (void)uninstallApp:(id)a3 requestUserConfirmation:(BOOL)a4 withResultHandler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  BOOL v17;

  v8 = a3;
  v9 = a5;
  +[ASDServiceBroker defaultBroker](ASDServiceBroker, "defaultBroker");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __72__ASDAppLibrary_uninstallApp_requestUserConfirmation_withResultHandler___block_invoke;
  v13[3] = &unk_1E37BE168;
  v15 = v9;
  v16 = a1;
  v14 = v8;
  v17 = a4;
  v11 = v9;
  v12 = v8;
  objc_msgSend(v10, "getLibraryServiceWithCompletionHandler:", v13);

}

void __72__ASDAppLibrary_uninstallApp_requestUserConfirmation_withResultHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  uint64_t v17;
  _QWORD v18[4];
  id v19;
  id v20;
  uint64_t v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (a2)
  {
    v6 = MEMORY[0x1E0C809B0];
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __72__ASDAppLibrary_uninstallApp_requestUserConfirmation_withResultHandler___block_invoke_2;
    v18[3] = &unk_1E37BE000;
    v21 = *(_QWORD *)(a1 + 48);
    v19 = *(id *)(a1 + 32);
    v20 = *(id *)(a1 + 40);
    objc_msgSend(a2, "remoteObjectProxyWithErrorHandler:", v18);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(void **)(a1 + 32);
    v9 = *(unsigned __int8 *)(a1 + 56);
    v14[0] = v6;
    v14[1] = 3221225472;
    v14[2] = __72__ASDAppLibrary_uninstallApp_requestUserConfirmation_withResultHandler___block_invoke_21;
    v14[3] = &unk_1E37BE000;
    v17 = *(_QWORD *)(a1 + 48);
    v15 = v8;
    v16 = *(id *)(a1 + 40);
    objc_msgSend(v7, "uninstallApp:requestUserConfirmation:withReplyHandler:", v15, v9, v14);

  }
  else
  {
    ASDLogHandleForCategory(12);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = (void *)objc_opt_class();
      v12 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543874;
      v23 = v11;
      v24 = 2114;
      v25 = v12;
      v26 = 2114;
      v27 = v5;
      v13 = v11;
      _os_log_error_impl(&dword_19A03B000, v10, OS_LOG_TYPE_ERROR, "[%{public}@]: Failed to request uninstall for %{public}@ error: %{public}@", buf, 0x20u);

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

void __72__ASDAppLibrary_uninstallApp_requestUserConfirmation_withResultHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  id v9;
  int v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  ASDLogHandleForCategory(12);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v7 = (void *)objc_opt_class();
    v8 = *(_QWORD *)(a1 + 32);
    v10 = 138543874;
    v11 = v7;
    v12 = 2114;
    v13 = v8;
    v14 = 2114;
    v15 = v3;
    v9 = v7;
    _os_log_error_impl(&dword_19A03B000, v4, OS_LOG_TYPE_ERROR, "[%{public}@]: Failed to request uninstall for %{public}@ error: %{public}@", (uint8_t *)&v10, 0x20u);

  }
  (*(void (**)(_QWORD, id, uint64_t, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), v3, v5, v6);

}

void __72__ASDAppLibrary_uninstallApp_requestUserConfirmation_withResultHandler___block_invoke_21(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    ASDLogHandleForCategory(12);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v8 = (void *)objc_opt_class();
      v9 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543874;
      v15 = v8;
      v16 = 2114;
      v17 = v9;
      v18 = 2114;
      v19 = v3;
      v10 = v8;
      _os_log_error_impl(&dword_19A03B000, v4, OS_LOG_TYPE_ERROR, "[%{public}@]: Failed to request uninstall for %{public}@ error: %{public}@", buf, 0x20u);

    }
  }
  dispatch_get_global_queue(21, 0);
  v5 = objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __72__ASDAppLibrary_uninstallApp_requestUserConfirmation_withResultHandler___block_invoke_22;
  v11[3] = &unk_1E37BDCC0;
  v6 = *(id *)(a1 + 40);
  v12 = v3;
  v13 = v6;
  v7 = v3;
  dispatch_async(v5, v11);

}

uint64_t __72__ASDAppLibrary_uninstallApp_requestUserConfirmation_withResultHandler___block_invoke_22(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_notificationCenter);
  objc_destroyWeak((id *)&self->_serviceBroker);
}

@end
