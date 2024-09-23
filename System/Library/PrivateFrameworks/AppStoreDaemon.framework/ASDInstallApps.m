@implementation ASDInstallApps

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
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE3924F0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0C99E60];
  v4 = objc_opt_class();
  objc_msgSend(v3, "setWithObjects:", v4, objc_opt_class(), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v5, sel_installAppReviewApps_withReplyHandler_, 0, 0);

  v6 = (void *)MEMORY[0x1E0C99E60];
  v7 = objc_opt_class();
  objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v8, sel_installAppReviewApps_withReplyHandler_, 0, 1);

  v9 = (void *)MEMORY[0x1E0C99E60];
  v10 = objc_opt_class();
  objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v11, sel_installEnterpriseApps_onPairedDevice_withReplyHandler_, 0, 0);

  v12 = (void *)MEMORY[0x1E0C99E60];
  v13 = objc_opt_class();
  objc_msgSend(v12, "setWithObjects:", v13, objc_opt_class(), 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v14, sel_installEnterpriseApps_onPairedDevice_withReplyHandler_, 0, 1);

  v15 = (void *)MEMORY[0x1E0C99E60];
  v16 = objc_opt_class();
  objc_msgSend(v15, "setWithObjects:", v16, objc_opt_class(), 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v17, sel_installSystemApps_onPairedDevice_withReplyHandler_, 0, 0);

  v18 = (void *)MEMORY[0x1E0C99E60];
  v19 = objc_opt_class();
  objc_msgSend(v18, "setWithObjects:", v19, objc_opt_class(), 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v20, sel_installSystemApps_onPairedDevice_withReplyHandler_, 0, 1);

  v21 = (void *)MEMORY[0x1E0C99E60];
  v22 = objc_opt_class();
  objc_msgSend(v21, "setWithObjects:", v22, objc_opt_class(), 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v23, sel_installTestFlightApps_onPairedDevice_withReplyHandler_, 0, 0);

  v24 = (void *)MEMORY[0x1E0C99E60];
  v25 = objc_opt_class();
  objc_msgSend(v24, "setWithObjects:", v25, objc_opt_class(), 0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v26, sel_installTestFlightApps_onPairedDevice_withReplyHandler_, 0, 1);

  v27 = (void *)MEMORY[0x1E0C99E60];
  v28 = objc_opt_class();
  objc_msgSend(v27, "setWithObjects:", v28, objc_opt_class(), 0);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v29, sel_installWatchApps_onPairedDevice_withReplyHandler_, 0, 0);

  v30 = (void *)MEMORY[0x1E0C99E60];
  v31 = objc_opt_class();
  objc_msgSend(v30, "setWithObjects:", v31, objc_opt_class(), 0);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v32, sel_installWatchApps_onPairedDevice_withReplyHandler_, 0, 1);

  return v2;
}

+ (BOOL)initialContentDownloadsEnabled
{
  void *v2;
  id *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  BOOL v8;
  uint64_t v10;
  _QWORD v11[5];
  _QWORD v12[5];
  id obj;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  uint8_t buf[4];
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__9;
  v22 = __Block_byref_object_dispose__9;
  v23 = 0;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  +[ASDServiceBroker defaultBroker](ASDServiceBroker, "defaultBroker");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (id *)(v19 + 5);
  obj = (id)v19[5];
  objc_msgSend(v2, "getInstallationServiceWithError:", &obj);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(v3, obj);
  v5 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __48__ASDInstallApps_initialContentDownloadsEnabled__block_invoke;
  v12[3] = &unk_1E37BDFB0;
  v12[4] = &v18;
  objc_msgSend(v4, "synchronousRemoteObjectProxyWithErrorHandler:", v12);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v5;
  v11[1] = 3221225472;
  v11[2] = __48__ASDInstallApps_initialContentDownloadsEnabled__block_invoke_2;
  v11[3] = &unk_1E37BE510;
  v11[4] = &v14;
  objc_msgSend(v6, "areInitialContentDownloadsEnabledWithReplyHandler:", v11);

  if (v19[5])
  {
    ASDLogHandleForCategory(12);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v10 = v19[5];
      *(_DWORD *)buf = 138543362;
      v25 = v10;
      _os_log_error_impl(&dword_19A03B000, v7, OS_LOG_TYPE_ERROR, "Error getting initial content download value: %{public}@", buf, 0xCu);
    }

  }
  v8 = *((_BYTE *)v15 + 24) != 0;
  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v18, 8);

  return v8;
}

void __48__ASDInstallApps_initialContentDownloadsEnabled__block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

uint64_t __48__ASDInstallApps_initialContentDownloadsEnabled__block_invoke_2(uint64_t result, char a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

+ (void)setInitialContentDownloadsEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  id v8;
  uint8_t buf[4];
  _BOOL4 v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v3 = a3;
  v13 = *MEMORY[0x1E0C80C00];
  +[ASDServiceBroker defaultBroker](ASDServiceBroker, "defaultBroker");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  objc_msgSend(v4, "getInstallationServiceWithError:", &v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v8;
  objc_msgSend(v5, "setInitialContentDownloadsEnabled:", v3);

  if (v6)
  {
    ASDLogHandleForCategory(12);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109378;
      v10 = v3;
      v11 = 2114;
      v12 = v6;
      _os_log_error_impl(&dword_19A03B000, v7, OS_LOG_TYPE_ERROR, "Error setting initial content download to %{BOOL}d: %{public}@", buf, 0x12u);
    }

  }
}

+ (void)installApp:(id)a3 onPairedDevice:(id)a4 withCompletionHandler:(id)a5
{
  id v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v8 = a5;
  v16[0] = a3;
  v9 = (void *)MEMORY[0x1E0C99D20];
  v10 = a4;
  v11 = a3;
  objc_msgSend(v9, "arrayWithObjects:count:", v16, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __66__ASDInstallApps_installApp_onPairedDevice_withCompletionHandler___block_invoke;
  v14[3] = &unk_1E37BDBD8;
  v15 = v8;
  v13 = v8;
  objc_msgSend(a1, "installApps:onPairedDevice:withCompletionHandler:", v12, v10, v14);

}

void __66__ASDInstallApps_installApp_onPairedDevice_withCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4;
  id v5;
  id v6;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = a3;
  objc_msgSend(a2, "firstObject");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, v6, v5);

}

+ (void)installApp:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v13[0] = a3;
  v7 = (void *)MEMORY[0x1E0C99D20];
  v8 = a3;
  objc_msgSend(v7, "arrayWithObjects:count:", v13, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __51__ASDInstallApps_installApp_withCompletionHandler___block_invoke;
  v11[3] = &unk_1E37BDBD8;
  v12 = v6;
  v10 = v6;
  +[ASDInstallApps _installApps:onPairedDevice:withCompletionHandler:]((uint64_t)a1, v9, 0, v11);

}

void __51__ASDInstallApps_installApp_withCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4;
  id v5;
  id v6;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = a3;
  objc_msgSend(a2, "firstObject");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, v6, v5);

}

+ (void)_installApps:(void *)a3 onPairedDevice:(void *)a4 withCompletionHandler:
{
  id v6;
  id v7;
  void (**v8)(id, _QWORD, void *);
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  NSObject *v23;
  void *v24;
  uint64_t v25;
  NSObject *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  id v31;
  _QWORD v32[4];
  id v33;
  id v34;
  id v35;
  uint64_t v36;
  _QWORD v37[4];
  id v38;
  void (**v39)(id, _QWORD, void *);
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint8_t buf[4];
  void *v45;
  __int16 v46;
  uint64_t v47;
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a3;
  v8 = a4;
  objc_opt_self();
  objc_msgSend(v6, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_opt_class();

  objc_opt_self();
  if (qword_1ECFFAB18 != -1)
    dispatch_once(&qword_1ECFFAB18, &__block_literal_global_19);
  v11 = (id)_MergedGlobals_45;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v12 = v6;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v41;
LABEL_5:
    v16 = 0;
    while (1)
    {
      if (*(_QWORD *)v41 != v15)
        objc_enumerationMutation(v12);
      if ((objc_msgSend(v11, "containsObject:", objc_opt_class()) & 1) == 0)
        break;
      if (objc_opt_class() != v10)
      {
        ASDLogHandleForCategory(12);
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
        {
          v30 = (void *)objc_opt_class();
          *(_DWORD *)buf = 138412546;
          v45 = v30;
          v46 = 2112;
          v47 = v10;
          v31 = v30;

        }
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = 507;
LABEL_19:
        ASDErrorWithUnderlyingErrorAndDescription(0, CFSTR("ASDErrorDomain"), v25, v24);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v8[2](v8, 0, v27);

        v22 = v12;
        goto LABEL_20;
      }
      if (v14 == ++v16)
      {
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
        if (v14)
          goto LABEL_5;
        goto LABEL_12;
      }
    }
    ASDLogHandleForCategory(12);
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
    {
      v28 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138412290;
      v45 = v28;
      v29 = v28;

    }
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 909;
    goto LABEL_19;
  }
LABEL_12:

  v17 = MEMORY[0x1E0C809B0];
  v37[0] = MEMORY[0x1E0C809B0];
  v37[1] = 3221225472;
  v37[2] = __68__ASDInstallApps__installApps_onPairedDevice_withCompletionHandler___block_invoke;
  v37[3] = &unk_1E37BDD10;
  v18 = v12;
  v38 = v18;
  v39 = v8;
  v19 = (void *)MEMORY[0x19AEC5B88](v37);
  +[ASDServiceBroker defaultBroker](ASDServiceBroker, "defaultBroker");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = v17;
  v32[1] = 3221225472;
  v32[2] = __68__ASDInstallApps__installApps_onPairedDevice_withCompletionHandler___block_invoke_87;
  v32[3] = &unk_1E37BF570;
  v35 = v19;
  v36 = v10;
  v33 = v18;
  v34 = v7;
  v21 = v19;
  objc_msgSend(v20, "getInstallationServiceWithCompletionHandler:", v32);

  v22 = v38;
LABEL_20:

}

+ (void)installApps:(id)a3 onPairedDevice:(id)a4 withCompletionHandler:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v8 = a5;
  objc_msgSend(a4, "pairingID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    +[ASDInstallApps _installApps:onPairedDevice:withCompletionHandler:]((uint64_t)a1, v11, v9, v8);
  }
  else
  {
    ASDErrorWithUnderlyingErrorAndDescription(0, CFSTR("ASDErrorDomain"), 507, CFSTR("Paired device has no identifier, did you mean to install locally?"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v8 + 2))(v8, 0, v10);

  }
}

+ (void)installApps:(id)a3 withCompletionHandler:(id)a4
{
  +[ASDInstallApps _installApps:onPairedDevice:withCompletionHandler:]((uint64_t)a1, a3, 0, a4);
}

void __43__ASDInstallApps__availableMetadataClasses__block_invoke()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v0 = (void *)MEMORY[0x1E0C99E60];
  v1 = objc_opt_class();
  v2 = objc_opt_class();
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  objc_msgSend(v0, "setWithObjects:", v1, v2, v3, v4, objc_opt_class(), 0);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)_MergedGlobals_45;
  _MergedGlobals_45 = v5;

}

void __68__ASDInstallApps__installApps_onPairedDevice_withCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  _BOOL4 v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, void *, uint64_t);
  void *v18;
  NSObject *v19;
  id v20;
  uint8_t buf[4];
  uint64_t v22;
  __int16 v23;
  NSObject *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  ASDLogHandleForCategory(12);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v9 = objc_msgSend(*(id *)(a1 + 32), "count");
      *(_DWORD *)buf = 134218242;
      v22 = v9;
      v23 = 2114;
      v24 = v6;
      _os_log_error_impl(&dword_19A03B000, v8, OS_LOG_TYPE_ERROR, "Installation request for %lu app(s) failed with error: %{public}@", buf, 0x16u);
    }
  }
  else
  {
    v10 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);

    if (v10)
    {
      v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithString:", CFSTR("["));
      v15 = MEMORY[0x1E0C809B0];
      v16 = 3221225472;
      v17 = __68__ASDInstallApps__installApps_onPairedDevice_withCompletionHandler___block_invoke_81;
      v18 = &unk_1E37BF548;
      v8 = v11;
      v19 = v8;
      v20 = *(id *)(a1 + 32);
      -[NSObject enumerateObjectsUsingBlock:](v5, "enumerateObjectsUsingBlock:", &v15);
      -[NSObject appendString:](v8, "appendString:", CFSTR("\n]"), v15, v16, v17, v18);
      ASDLogHandleForCategory(12);
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        v14 = objc_msgSend(*(id *)(a1 + 32), "count");
        *(_DWORD *)buf = 134218242;
        v22 = v14;
        v23 = 2114;
        v24 = v8;
        _os_log_debug_impl(&dword_19A03B000, v12, OS_LOG_TYPE_DEBUG, "Installation request for %lu app(s) completed: %{public}@", buf, 0x16u);
      }

    }
    else
    {
      ASDLogHandleForCategory(12);
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v13 = objc_msgSend(*(id *)(a1 + 32), "count");
        *(_DWORD *)buf = 134218242;
        v22 = v13;
        v23 = 2114;
        v24 = v5;
        _os_log_impl(&dword_19A03B000, v8, OS_LOG_TYPE_DEFAULT, "Installation request for %lu app(s) completed with identifiers: %{public}@", buf, 0x16u);
      }
    }
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __68__ASDInstallApps__installApps_onPairedDevice_withCompletionHandler___block_invoke_81(uint64_t a1, void *a2, uint64_t a3)
{
  void *v4;
  void *v5;
  id v6;
  id v7;

  v4 = *(void **)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  v6 = a2;
  objc_msgSend(v5, "objectAtIndexedSubscript:", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR("\n%@: %@"), v6, v7);

}

void __68__ASDInstallApps__installApps_onPairedDevice_withCompletionHandler___block_invoke_87(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  _QWORD v30[4];
  id v31;
  _QWORD v32[4];
  id v33;
  _QWORD v34[4];
  id v35;
  _QWORD v36[4];
  id v37;
  _QWORD v38[4];
  id v39;
  uint8_t buf[4];
  uint64_t v41;
  __int16 v42;
  id v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v7 = *(_QWORD *)(a1 + 56);
    if (v7 == objc_opt_class())
    {
      v38[0] = MEMORY[0x1E0C809B0];
      v38[1] = 3221225472;
      v38[2] = __68__ASDInstallApps__installApps_onPairedDevice_withCompletionHandler___block_invoke_2;
      v38[3] = &unk_1E37BDB60;
      v39 = *(id *)(a1 + 48);
      objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v38);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "installEnterpriseApps:onPairedDevice:withReplyHandler:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

      v24 = v39;
    }
    else
    {
      v8 = *(_QWORD *)(a1 + 56);
      if (v8 == objc_opt_class())
      {
        v36[0] = MEMORY[0x1E0C809B0];
        v36[1] = 3221225472;
        v36[2] = __68__ASDInstallApps__installApps_onPairedDevice_withCompletionHandler___block_invoke_3;
        v36[3] = &unk_1E37BDB60;
        v37 = *(id *)(a1 + 48);
        objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v36);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "installAppReviewApps:withReplyHandler:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));

        v24 = v37;
      }
      else
      {
        v9 = *(_QWORD *)(a1 + 56);
        if (v9 == objc_opt_class())
        {
          v34[0] = MEMORY[0x1E0C809B0];
          v34[1] = 3221225472;
          v34[2] = __68__ASDInstallApps__installApps_onPairedDevice_withCompletionHandler___block_invoke_4;
          v34[3] = &unk_1E37BDB60;
          v35 = *(id *)(a1 + 48);
          objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v34);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "installSystemApps:onPairedDevice:withReplyHandler:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

          v24 = v35;
        }
        else
        {
          v10 = *(_QWORD *)(a1 + 56);
          if (v10 == objc_opt_class())
          {
            v32[0] = MEMORY[0x1E0C809B0];
            v32[1] = 3221225472;
            v32[2] = __68__ASDInstallApps__installApps_onPairedDevice_withCompletionHandler___block_invoke_5;
            v32[3] = &unk_1E37BDB60;
            v33 = *(id *)(a1 + 48);
            objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v32);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "installTestFlightApps:onPairedDevice:withReplyHandler:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

            v24 = v33;
          }
          else
          {
            v11 = *(_QWORD *)(a1 + 56);
            if (v11 != objc_opt_class())
            {
              v12 = *(_QWORD *)(a1 + 48);
              NSStringFromClass(*(Class *)(a1 + 56));
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              ASDErrorWithUserInfoAndFormat(507, 0, CFSTR("Attempting installation with invalid metadata class: %@"), v14, v15, v16, v17, v18, (uint64_t)v13);
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              (*(void (**)(uint64_t, _QWORD, void *))(v12 + 16))(v12, 0, v19);

              goto LABEL_17;
            }
            v30[0] = MEMORY[0x1E0C809B0];
            v30[1] = 3221225472;
            v30[2] = __68__ASDInstallApps__installApps_onPairedDevice_withCompletionHandler___block_invoke_6;
            v30[3] = &unk_1E37BDB60;
            v31 = *(id *)(a1 + 48);
            objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v30);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "installWatchApps:onPairedDevice:withReplyHandler:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

            v24 = v31;
          }
        }
      }
    }

    goto LABEL_17;
  }
  ASDLogHandleForCategory(12);
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
  {
    v29 = objc_msgSend(*(id *)(a1 + 32), "count");
    *(_DWORD *)buf = 134218242;
    v41 = v29;
    v42 = 2114;
    v43 = v6;
    _os_log_error_impl(&dword_19A03B000, v20, OS_LOG_TYPE_ERROR, "Installation request for %lu app(s) failed with error: %{public}@", buf, 0x16u);
  }

  v21 = *(_QWORD *)(a1 + 48);
  ASDErrorWithSafeUserInfo(v6);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, void *))(v21 + 16))(v21, 0, v22);

LABEL_17:
}

void __68__ASDInstallApps__installApps_onPairedDevice_withCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  ASDErrorWithSafeUserInfo(a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v2 + 16))(v2, 0, v3);

}

void __68__ASDInstallApps__installApps_onPairedDevice_withCompletionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  ASDErrorWithSafeUserInfo(a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v2 + 16))(v2, 0, v3);

}

void __68__ASDInstallApps__installApps_onPairedDevice_withCompletionHandler___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  ASDErrorWithSafeUserInfo(a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v2 + 16))(v2, 0, v3);

}

void __68__ASDInstallApps__installApps_onPairedDevice_withCompletionHandler___block_invoke_5(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  ASDErrorWithSafeUserInfo(a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v2 + 16))(v2, 0, v3);

}

void __68__ASDInstallApps__installApps_onPairedDevice_withCompletionHandler___block_invoke_6(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  ASDErrorWithSafeUserInfo(a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v2 + 16))(v2, 0, v3);

}

@end
