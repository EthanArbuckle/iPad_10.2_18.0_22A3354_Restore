@implementation NETransparentProxyManager

- (NETransparentProxyManager)init
{
  id *v3;
  NETransparentProxyManager *v4;
  NETransparentProxyManager *v5;
  objc_super v7;

  v3 = -[NEVPNConnection initWithType:]([NETunnelProviderSession alloc], 1);
  v7.receiver = self;
  v7.super_class = (Class)NETransparentProxyManager;
  v4 = -[NEVPNManager initWithGrade:connection:tunnelType:](&v7, sel_initWithGrade_connection_tunnelType_, 1, v3, 2);
  v5 = v4;
  if (v4)
    v4->super._hasLoaded = 1;

  return v5;
}

- (BOOL)isProtocolTypeValid:(int64_t)a3
{
  return a3 == 4;
}

- (void)additionalSetup
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  _QWORD *v9;
  id v10;

  -[NEVPNManager configuration](self, "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "VPN");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "protocol");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "providerBundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v6 = v5;

  objc_msgSend(v10, "setProviderBundleIdentifier:", v6);
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bundleIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setPluginType:", v8);

  -[NEVPNManager configuration](self, "configuration");
  v9 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  if (v9)
    v9[20] = 0;

}

- (void)loadFromPreferencesWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  if (v4)
  {
    +[NEVPNManager configurationManager]();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NEVPNManager configuration](self, "configuration");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __70__NETransparentProxyManager_loadFromPreferencesWithCompletionHandler___block_invoke;
    v8[3] = &unk_1E3CC46F8;
    v8[4] = self;
    v9 = v4;
    objc_msgSend(v5, "loadConfigurationWithID:withCompletionQueue:handler:", v7, MEMORY[0x1E0C80D38], v8);

  }
}

- (BOOL)isFromMDM
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;

  -[NEVPNManager configuration](self, "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "payloadInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
    return 0;
  -[NEVPNManager configuration](self, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "payloadInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "profileSource") == 2;

  return v7;
}

void __70__NETransparentProxyManager_loadFromPreferencesWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  int v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = *(id *)(a1 + 32);
  objc_sync_enter(v7);
  if (v6)
  {
    ne_log_obj();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v22 = 138412290;
      v23 = v6;
      _os_log_error_impl(&dword_19BD16000, v8, OS_LOG_TYPE_ERROR, "Got an error while loading a configuration: %@", (uint8_t *)&v22, 0xCu);
    }

    +[NEVPNManager mapError:]((uint64_t)NEVPNManager, v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

    goto LABEL_15;
  }
  if (!v5)
  {
    ne_log_obj();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "configuration");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "identifier");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 138412290;
      v23 = v21;
      _os_log_impl(&dword_19BD16000, v19, OS_LOG_TYPE_DEFAULT, "No configuration found with ID %@", (uint8_t *)&v22, 0xCu);

    }
    goto LABEL_14;
  }
  objc_msgSend(*(id *)(a1 + 32), "setConfiguration:", v5);
  v10 = *(_QWORD *)(a1 + 32);
  +[NEVPNManager loadedManagers]();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "configuration");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "identifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v10, v13);

  objc_msgSend(*(id *)(a1 + 32), "connection");
  v14 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    v15 = v14[7];

    if (v15)
    {
LABEL_14:
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
      goto LABEL_15;
    }
  }
  objc_msgSend(*(id *)(a1 + 32), "connection");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "configuration");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "identifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
    -[NEVPNConnection createSessionWithConfigurationIdentifier:forceInfoFetch:completionHandler:](v16, v18, 0, *(void **)(a1 + 40));

LABEL_15:
  objc_sync_exit(v7);

}

+ (void)loadAllFromPreferencesWithCompletionHandler:(void *)completionHandler
{
  void *v3;
  id v4;
  void *v5;
  _QWORD v6[4];
  id v7;

  v3 = completionHandler;
  if (v3)
  {
    v4 = +[NEVPNManager loadedManagers]();
    +[NEVPNManager configurationManager]();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __73__NETransparentProxyManager_loadAllFromPreferencesWithCompletionHandler___block_invoke;
    v6[3] = &unk_1E3CC4630;
    v7 = v3;
    objc_msgSend(v5, "loadConfigurationsWithCompletionQueue:handler:", MEMORY[0x1E0C80D38], v6);

  }
}

+ (void)loadEverythingFromPreferencesWithCompletionHandler:(id)a3
{
  id v3;

  v3 = a3;
  objc_opt_self();
  g_noAppFilter = 1;
  +[NETransparentProxyManager loadAllFromPreferencesWithCompletionHandler:](NETransparentProxyManager, "loadAllFromPreferencesWithCompletionHandler:", v3);

}

void __73__NETransparentProxyManager_loadAllFromPreferencesWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  BOOL v17;
  NSObject *v18;
  NETransparentProxyManager *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v29;
  NSObject *group;
  _QWORD block[4];
  id v32;
  id v33;
  _QWORD *v34;
  _QWORD v35[5];
  NSObject *v36;
  _QWORD *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _QWORD v42[5];
  id v43;
  uint8_t buf[4];
  void *v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v5 = a3;
  v29 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v26 = v4;
  v27 = v5;
  if (!v5)
  {
    v42[0] = 0;
    v42[1] = v42;
    v42[2] = 0x3032000000;
    v42[3] = __Block_byref_object_copy__175;
    v42[4] = __Block_byref_object_dispose__176;
    v43 = 0;
    group = dispatch_group_create();
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v8 = v4;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
    if (!v9)
      goto LABEL_25;
    v10 = *(_QWORD *)v39;
    while (1)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v39 != v10)
          objc_enumerationMutation(v8);
        v12 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
        objc_msgSend(v12, "VPN");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
        {
          objc_msgSend(v12, "VPN");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "protocol");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v15, "type") == 4)
          {
            objc_msgSend(v12, "VPN");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = objc_msgSend(v16, "tunnelType") == 2;

            if (v17)
            {
              objc_msgSend(v12, "pluginType");
              v18 = objc_claimAutoreleasedReturnValue();
              if ((isa_nsstring(v18) & 1) != 0)
              {
                v19 = objc_alloc_init(NETransparentProxyManager);
                -[NEVPNManager setConfiguration:](v19, "setConfiguration:", v12);
                objc_msgSend(v29, "addObject:", v19);
                +[NEVPNManager loadedManagers]();
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v12, "identifier");
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v20, "setObject:forKeyedSubscript:", v19, v21);

                if (v19)
                  v19->super._hasLoaded = 1;
                dispatch_group_enter(group);
                -[NEVPNManager connection](v19, "connection");
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v12, "identifier");
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                v35[0] = MEMORY[0x1E0C809B0];
                v35[1] = 3221225472;
                v35[2] = __73__NETransparentProxyManager_loadAllFromPreferencesWithCompletionHandler___block_invoke_6;
                v35[3] = &unk_1E3CC42C0;
                v35[4] = v12;
                v37 = v42;
                v36 = group;
                if (v22)
                  -[NEVPNConnection createSessionWithConfigurationIdentifier:forceInfoFetch:completionHandler:](v22, v23, 0, v35);

              }
              else
              {
                ne_log_obj();
                v19 = (NETransparentProxyManager *)objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(&v19->super.super, OS_LOG_TYPE_DEFAULT))
                {
                  objc_msgSend(v12, "name");
                  v25 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138412290;
                  v45 = v25;
                  _os_log_impl(&dword_19BD16000, &v19->super.super, OS_LOG_TYPE_DEFAULT, "Skipping configuration %@ because it has an invalid plugin type", buf, 0xCu);

                }
              }

              goto LABEL_23;
            }
          }
          else
          {

          }
        }
        ne_log_obj();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v12, "name");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v45 = v24;
          _os_log_impl(&dword_19BD16000, v18, OS_LOG_TYPE_DEFAULT, "Skipping configuration %@ because it is of the wrong type", buf, 0xCu);

        }
LABEL_23:

      }
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
      if (!v9)
      {
LABEL_25:

        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __73__NETransparentProxyManager_loadAllFromPreferencesWithCompletionHandler___block_invoke_8;
        block[3] = &unk_1E3CC42E8;
        v34 = v42;
        v32 = v29;
        v33 = *(id *)(a1 + 32);
        dispatch_group_notify(group, MEMORY[0x1E0C80D38], block);

        _Block_object_dispose(v42, 8);
        v7 = v29;
        goto LABEL_26;
      }
    }
  }
  +[NEVPNManager mapError:]((uint64_t)NEVPNManager, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v29;
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

LABEL_26:
}

void __73__NETransparentProxyManager_loadAllFromPreferencesWithCompletionHandler___block_invoke_6(uint64_t a1, void *a2)
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
      objc_msgSend(*(id *)(a1 + 32), "name");
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

uint64_t __73__NETransparentProxyManager_loadAllFromPreferencesWithCompletionHandler___block_invoke_8(uint64_t a1)
{
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
    objc_msgSend(*(id *)(a1 + 32), "removeAllObjects");
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

@end
