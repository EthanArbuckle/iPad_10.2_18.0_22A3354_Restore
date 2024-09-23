@implementation ASDUpdateWatchApps

+ (BOOL)shouldPromptBeforeUpdating
{
  return CFPreferencesGetAppBooleanValue(CFSTR("AutoUpdatesEnabled"), CFSTR("com.apple.itunesstored"), 0) != 0;
}

+ (void)shouldPromptBeforeUpdatingWithResultHandler:(id)a3
{
  id v5;

  v5 = a3;
  (*((void (**)(id, uint64_t, _QWORD))a3 + 2))(v5, objc_msgSend(a1, "shouldPromptBeforeUpdating"), 0);

}

+ (BOOL)updateBundleIDs:(id)a3 userInitiated:(BOOL)a4 error:(id *)a5
{
  _BOOL8 v6;
  id v7;
  void *v8;
  id *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  BOOL v14;
  _QWORD v16[5];
  _QWORD v17[5];
  id obj;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v6 = a4;
  v7 = a3;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__11;
  v23 = __Block_byref_object_dispose__11;
  v24 = 0;
  +[ASDServiceBroker defaultBroker](ASDServiceBroker, "defaultBroker");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id *)(v20 + 5);
  obj = (id)v20[5];
  objc_msgSend(v8, "getUpdatesServiceWithError:", &obj);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(v9, obj);

  if (v10)
  {
    v11 = MEMORY[0x1E0C809B0];
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __58__ASDUpdateWatchApps_updateBundleIDs_userInitiated_error___block_invoke;
    v17[3] = &unk_1E37BDFB0;
    v17[4] = &v19;
    objc_msgSend(v10, "synchronousRemoteObjectProxyWithErrorHandler:", v17);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v11;
    v16[1] = 3221225472;
    v16[2] = __58__ASDUpdateWatchApps_updateBundleIDs_userInitiated_error___block_invoke_2;
    v16[3] = &unk_1E37BDFB0;
    v16[4] = &v19;
    objc_msgSend(v12, "compatibilityUpdateForBundleIDs:userInitiated:withReplyHandler:", v7, v6, v16);

  }
  v13 = (void *)v20[5];
  if (a5 && v13)
  {
    *a5 = objc_retainAutorelease(v13);
    v13 = (void *)v20[5];
  }
  v14 = v13 == 0;

  _Block_object_dispose(&v19, 8);
  return v14;
}

void __58__ASDUpdateWatchApps_updateBundleIDs_userInitiated_error___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __58__ASDUpdateWatchApps_updateBundleIDs_userInitiated_error___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

+ (void)updateBundleIDs:(id)a3 userInitiated:(BOOL)a4 withResultHandler:(id)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  BOOL v15;

  v7 = a3;
  v8 = a5;
  +[ASDServiceBroker defaultBroker](ASDServiceBroker, "defaultBroker");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __70__ASDUpdateWatchApps_updateBundleIDs_userInitiated_withResultHandler___block_invoke;
  v12[3] = &unk_1E37BF9C8;
  v13 = v7;
  v14 = v8;
  v15 = a4;
  v10 = v7;
  v11 = v8;
  objc_msgSend(v9, "getUpdatesServiceWithCompletionHandler:", v12);

}

void __70__ASDUpdateWatchApps_updateBundleIDs_userInitiated_withResultHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;

  if (a2)
  {
    v4 = MEMORY[0x1E0C809B0];
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __70__ASDUpdateWatchApps_updateBundleIDs_userInitiated_withResultHandler___block_invoke_2;
    v10[3] = &unk_1E37BDB60;
    v11 = *(id *)(a1 + 40);
    objc_msgSend(a2, "remoteObjectProxyWithErrorHandler:", v10);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(unsigned __int8 *)(a1 + 48);
    v8[0] = v4;
    v8[1] = 3221225472;
    v8[2] = __70__ASDUpdateWatchApps_updateBundleIDs_userInitiated_withResultHandler___block_invoke_3;
    v8[3] = &unk_1E37BDB60;
    v7 = *(_QWORD *)(a1 + 32);
    v9 = *(id *)(a1 + 40);
    objc_msgSend(v5, "compatibilityUpdateForBundleIDs:userInitiated:withReplyHandler:", v7, v6, v8);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
}

uint64_t __70__ASDUpdateWatchApps_updateBundleIDs_userInitiated_withResultHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __70__ASDUpdateWatchApps_updateBundleIDs_userInitiated_withResultHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
