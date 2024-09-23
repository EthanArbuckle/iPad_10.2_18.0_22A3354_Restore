@implementation NEAppProxyProviderManager

- (NEAppProxyProviderManager)init
{
  NSObject *v3;
  uint8_t v5[16];

  ne_log_obj();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v5 = 0;
    _os_log_error_impl(&dword_19BD16000, v3, OS_LOG_TYPE_ERROR, "MDM must be used to create NEAppProxyProvider configurations", v5, 2u);
  }

  return 0;
}

+ (void)loadAllFromPreferencesWithCompletionHandler:(void *)completionHandler
{
  void *v4;
  id v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v4 = completionHandler;
  if (v4)
  {
    v5 = +[NEVPNManager loadedManagers]();
    +[NEVPNManager configurationManager]();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __73__NEAppProxyProviderManager_loadAllFromPreferencesWithCompletionHandler___block_invoke;
    v7[3] = &unk_1E3CC4310;
    v9 = a1;
    v8 = v4;
    objc_msgSend(v6, "loadConfigurationsWithCompletionQueue:handler:", MEMORY[0x1E0C80D38], v7);

  }
}

void __73__NEAppProxyProviderManager_loadAllFromPreferencesWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  NEAppProxyProviderManager *v16;
  void *v17;
  void *v18;
  _BOOL4 v19;
  NEAppProxyProviderManager *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  id obj;
  id v29;
  id v30;
  NSObject *group;
  _QWORD block[4];
  id v33;
  id v34;
  uint64_t *v35;
  _QWORD v36[5];
  NSObject *v37;
  uint64_t *v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t (*v46)(uint64_t, uint64_t);
  void (*v47)(uint64_t);
  id v48;
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v29 = a2;
  v5 = a3;
  v27 = a1;
  obj = *(id *)(a1 + 40);
  objc_sync_enter(obj);
  v30 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v43 = 0;
  v44 = &v43;
  v45 = 0x3032000000;
  v46 = __Block_byref_object_copy__238;
  v47 = __Block_byref_object_dispose__239;
  v6 = v5;
  v48 = v6;
  v26 = v6;
  if (v6)
  {
    +[NEVPNManager mapError:]((uint64_t)NEVPNManager, v6);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v44[5];
    v44[5] = v7;

    v9 = v44[5];
  }
  else
  {
    v9 = 0;
  }
  if (!v29 || v9 || !objc_msgSend(v29, "count", v26))
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    goto LABEL_29;
  }
  group = dispatch_group_create();
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v10 = v29;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v39, v49, 16);
  if (!v11)
    goto LABEL_27;
  v12 = *(_QWORD *)v40;
  do
  {
    for (i = 0; i != v11; ++i)
    {
      if (*(_QWORD *)v40 != v12)
        objc_enumerationMutation(v10);
      v14 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
      objc_msgSend(v14, "appVPN");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (v15)
      {
        objc_msgSend(v14, "appVPN");
        v16 = (NEAppProxyProviderManager *)objc_claimAutoreleasedReturnValue();
        -[NEVPNManager protocol](v16, "protocol");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v17, "type") == 4)
        {
          objc_msgSend(v14, "appVPN");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v18, "tunnelType") == 2;

          if (!v19)
            continue;
          objc_msgSend(v14, "pluginType");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if (isa_nsstring(v15)
            && !+[NETunnelProviderProtocol isLegacyPluginType:](NETunnelProviderProtocol, "isLegacyPluginType:", v15))
          {
            v20 = [NEAppProxyProviderManager alloc];
            objc_msgSend(v14, "appVPN");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = -[NETunnelProviderManager initWithSessionType:tunnelType:](v20, "initWithSessionType:tunnelType:", 2, objc_msgSend(v21, "tunnelType"));

            -[NEVPNManager setConfiguration:](v16, "setConfiguration:", v14);
            objc_msgSend(v30, "addObject:", v16);
            +[NEVPNManager loadedManagers]();
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "identifier");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "setObject:forKeyedSubscript:", v16, v23);

            if (v16)
              v16->super.super._hasLoaded = 1;
            dispatch_group_enter(group);
            -[NEVPNManager connection](v16, "connection");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "identifier");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v36[0] = MEMORY[0x1E0C809B0];
            v36[1] = 3221225472;
            v36[2] = __73__NEAppProxyProviderManager_loadAllFromPreferencesWithCompletionHandler___block_invoke_4;
            v36[3] = &unk_1E3CC42C0;
            v36[4] = v14;
            v38 = &v43;
            v37 = group;
            if (v24)
              -[NEVPNConnection createSessionWithConfigurationIdentifier:forceInfoFetch:completionHandler:](v24, v25, 0, v36);

LABEL_23:
          }

          continue;
        }

        goto LABEL_23;
      }
    }
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v39, v49, 16);
  }
  while (v11);
LABEL_27:

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __73__NEAppProxyProviderManager_loadAllFromPreferencesWithCompletionHandler___block_invoke_5;
  block[3] = &unk_1E3CC42E8;
  v35 = &v43;
  v33 = v30;
  v34 = *(id *)(v27 + 32);
  dispatch_group_notify(group, MEMORY[0x1E0C80D38], block);

LABEL_29:
  _Block_object_dispose(&v43, 8);

  objc_sync_exit(obj);
}

void __73__NEAppProxyProviderManager_loadAllFromPreferencesWithCompletionHandler___block_invoke_4(uint64_t a1, void *a2)
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  if (v4)
  {
    ne_log_obj();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 32), "identifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 138412546;
      v8 = v6;
      v9 = 2112;
      v10 = v4;
      _os_log_error_impl(&dword_19BD16000, v5, OS_LOG_TYPE_ERROR, "Error creating connection for configuration %@: %@", (uint8_t *)&v7, 0x16u);

    }
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a2);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));

}

uint64_t __73__NEAppProxyProviderManager_loadAllFromPreferencesWithCompletionHandler___block_invoke_5(uint64_t a1)
{
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
    objc_msgSend(*(id *)(a1 + 32), "removeAllObjects");
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

@end
