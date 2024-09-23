@implementation AALoginPluginManager

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_20);
  return (id)sharedInstance_sharedInstance;
}

void __38__AALoginPluginManager_sharedInstance__block_invoke()
{
  AALoginPluginManager *v0;
  void *v1;

  v0 = objc_alloc_init(AALoginPluginManager);
  v1 = (void *)sharedInstance_sharedInstance;
  sharedInstance_sharedInstance = (uint64_t)v0;

}

- (AALoginPluginManager)init
{
  AALoginPluginManager *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *pluginNotificationQueue;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AALoginPluginManager;
  v2 = -[AALoginPluginManager init](&v6, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.AppleIDLoginPlugins", MEMORY[0x1E0C80D50]);
    pluginNotificationQueue = v2->_pluginNotificationQueue;
    v2->_pluginNotificationQueue = (OS_dispatch_queue *)v3;

  }
  return v2;
}

- (void)restrictToPluginBundleIDs:(id)a3
{
  NSArray *v4;
  NSArray *allowedPluginBundleIDs;

  v4 = (NSArray *)objc_msgSend(a3, "copy");
  allowedPluginBundleIDs = self->_allowedPluginBundleIDs;
  self->_allowedPluginBundleIDs = v4;

}

- (id)_plugins
{
  NSArray *plugins;
  NSArray *v4;
  NSArray *v5;

  plugins = self->_plugins;
  if (!plugins)
  {
    -[AALoginPluginManager _loadPluginsLimitedToBundleIDs:](self, "_loadPluginsLimitedToBundleIDs:", self->_allowedPluginBundleIDs);
    v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v5 = self->_plugins;
    self->_plugins = v4;

    plugins = self->_plugins;
  }
  return plugins;
}

- (id)_idsPlugin
{
  AASetupAssistantDelegateService *idsPlugin;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  AASetupAssistantDelegateService *v9;
  AASetupAssistantDelegateService *v10;
  NSObject *v11;
  AASetupAssistantDelegateService *v12;
  int v14;
  AASetupAssistantDelegateService *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  idsPlugin = self->_idsPlugin;
  if (!idsPlugin)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "URLsForDirectory:inDomains:", 5, 8);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "URLByAppendingPathComponent:", CFSTR("SetupAssistantBundles/SBSyncServiceSetupAssistantBundle.bundle"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithURL:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (AASetupAssistantDelegateService *)objc_alloc_init((Class)objc_msgSend(v8, "principalClass"));
    v10 = self->_idsPlugin;
    self->_idsPlugin = v9;

    _AALogSystem();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = self->_idsPlugin;
      v14 = 138412290;
      v15 = v12;
      _os_log_impl(&dword_19EACA000, v11, OS_LOG_TYPE_DEFAULT, "AALoginPluginManager: hacked IDS plugin loaded %@", (uint8_t *)&v14, 0xCu);
    }

    idsPlugin = self->_idsPlugin;
  }
  return idsPlugin;
}

- (id)collectParametersForLoginRequest
{
  id v3;
  void *v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  BOOL v14;
  NSObject *v15;
  NSObject *v16;
  const char *v17;
  uint32_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  void *v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  -[AALoginPluginManager _plugins](self, "_plugins");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
  if (v5)
  {
    v7 = v5;
    v8 = *(_QWORD *)v28;
    *(_QWORD *)&v6 = 138412546;
    v26 = v6;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v28 != v8)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        objc_msgSend(v10, "parametersForLoginRequest", v26);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "serviceIdentifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v12;
        if (v12)
          v14 = v11 == 0;
        else
          v14 = 1;
        if (v14)
        {
          _AALogSystem();
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v26;
            v32 = v13;
            v33 = 2112;
            v34 = v11;
            v16 = v15;
            v17 = "AALoginPluginManager: collectParametersForLoginRequest is skipping plugin with ID %@ and params %@";
            v18 = 22;
            goto LABEL_17;
          }
LABEL_18:

          goto LABEL_20;
        }
        if (self->_shouldSkipiTunesPlugin
          && objc_msgSend(v12, "isEqualToString:", CFSTR("com.apple.itunes")))
        {
          _AALogSystem();
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            v16 = v15;
            v17 = "AALoginPluginManager is skipping iTunes plugin.";
            v18 = 2;
LABEL_17:
            _os_log_impl(&dword_19EACA000, v16, OS_LOG_TYPE_DEFAULT, v17, buf, v18);
          }
          goto LABEL_18;
        }
        objc_msgSend(v3, "setObject:forKey:", v11, v13);
LABEL_20:

      }
      v7 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
    }
    while (v7);
  }

  -[AALoginPluginManager _idsPlugin](self, "_idsPlugin");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "delegateServiceIdentifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  -[AALoginPluginManager _idsPlugin](self, "_idsPlugin");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "accountSetupRequestParameters");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20 && v22)
  {
    objc_msgSend(v3, "setObject:forKey:", v22, v20);
  }
  else
  {
    _AALogSystem();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      -[AALoginPluginManager _idsPlugin](self, "_idsPlugin");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v32 = v24;
      v33 = 2112;
      v34 = v22;
      _os_log_impl(&dword_19EACA000, v23, OS_LOG_TYPE_DEFAULT, "AALoginPluginManager: collectParametersForLoginRequest is skipping IDS plugin %@ with params %@", buf, 0x16u);

    }
  }

  return v3;
}

- (id)collectParametersForIdentityEstablishmentRequest
{
  id v3;
  void *v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  _BOOL4 v14;
  BOOL v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  const __CFString *v23;
  id v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  void *v28;
  const __CFString *v29;
  void *v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  -[AALoginPluginManager _plugins](self, "_plugins");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v31, 16);
  if (v5)
  {
    v7 = v5;
    v8 = *(_QWORD *)v20;
    *(_QWORD *)&v6 = 138412290;
    v18 = v6;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v20 != v8)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(v10, "parametersForIdentityEstablishmentRequest", v18);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "serviceIdentifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        _AALogSystem();
        v13 = objc_claimAutoreleasedReturnValue();
        v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
        if (v12)
          v15 = v11 == 0;
        else
          v15 = 1;
        if (v15)
        {
          if (v14)
          {
            *(_DWORD *)buf = 138412546;
            v26 = v12;
            v27 = 2112;
            v28 = v11;
            _os_log_impl(&dword_19EACA000, v13, OS_LOG_TYPE_DEFAULT, "AALoginPluginManager: collectParametersForIdentityEstablishmentRequest is skipping plugin with ID %@ and params %@", buf, 0x16u);
          }
        }
        else
        {
          if (v14)
          {
            *(_DWORD *)buf = v18;
            v26 = v12;
            _os_log_impl(&dword_19EACA000, v13, OS_LOG_TYPE_DEFAULT, "AALoginPluginManager: collectParametersForIdentityEstablishmentRequest got parameters from plugin %@", buf, 0xCu);
          }

          v29 = CFSTR("service-data");
          v30 = v11;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v30, &v29, 1);
          v13 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, v12);
        }

      }
      v7 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v31, 16);
    }
    while (v7);
  }

  v23 = CFSTR("client-info");
  v24 = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (void)notifyServicesOfLoginResponse:(id)a3 forAppleID:(id)a4 password:(id)a5 completion:(id)a6
{
  -[AALoginPluginManager notifyServicesOfLoginResponse:forAppleID:password:rawPassword:completion:](self, "notifyServicesOfLoginResponse:forAppleID:password:rawPassword:completion:", a3, a4, a5, 0, a6);
}

- (void)notifyServicesOfLoginResponse:(id)a3 forAppleID:(id)a4 password:(id)a5 rawPassword:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  NSObject *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  _QWORD v23[5];
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  dispatch_get_global_queue(0, 0);
  v17 = objc_claimAutoreleasedReturnValue();
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __97__AALoginPluginManager_notifyServicesOfLoginResponse_forAppleID_password_rawPassword_completion___block_invoke;
  v23[3] = &unk_1E416FFB0;
  v23[4] = self;
  v24 = v12;
  v25 = v13;
  v26 = v14;
  v27 = v15;
  v28 = v16;
  v18 = v16;
  v19 = v15;
  v20 = v14;
  v21 = v13;
  v22 = v12;
  dispatch_async(v17, v23);

}

uint64_t __97__AALoginPluginManager_notifyServicesOfLoginResponse_forAppleID_password_rawPassword_completion___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_notifyServicesOfLoginResponse:forAppleID:password:rawPassword:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
}

- (id)_createLoginContextForAppleID:(id)a3 rawPassword:(id)a4 loginResponse:(id)a5
{
  NSObject *v7;
  id v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  NSObject *v26;
  objc_class *v27;
  void *v28;
  NSObject *v29;
  AAStorableLoginContext *v30;
  void *v31;
  NSObject *v32;
  NSObject *v33;
  NSObject *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  void *v39;
  void *v40;
  uint8_t buf[4];
  NSObject *v42;
  __int16 v43;
  void *v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a5;
  v9 = a4;
  _AALogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v42 = v7;
    _os_log_impl(&dword_19EACA000, v10, OS_LOG_TYPE_DEFAULT, "AALoginPluginManager: creating login context for stashing (appleID: %@)...", buf, 0xCu);
  }

  if (!v9)
  {
    _AALogSystem();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19EACA000, v11, OS_LOG_TYPE_DEFAULT, "AALoginPluginManager: bad news, no password for stashing!", buf, 2u);
    }

  }
  objc_msgSend(v8, "responseParametersForServiceIdentifier:", CFSTR("com.apple.mobileme"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("service-data"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("appleAccountInfo"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("aDsID"));
  v15 = objc_claimAutoreleasedReturnValue();

  if (!v15)
  {
    _AALogSystem();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19EACA000, v15, OS_LOG_TYPE_DEFAULT, "AALoginPluginManager: no altDSID was found in iCloud service data!", buf, 2u);
    }
    v16 = 0;
    goto LABEL_13;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[NSObject stringValue](v15, "stringValue");
    v16 = objc_claimAutoreleasedReturnValue();
LABEL_13:

    v15 = v16;
  }
  objc_msgSend(v8, "dsid");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
    goto LABEL_18;
  _AALogSystem();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19EACA000, v18, OS_LOG_TYPE_DEFAULT, "AALoginPluginManager: checking iCloud service data for DSID...", buf, 2u);
  }

  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("service-data"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("appleAccountInfo"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("dsPrsID"));
  v17 = objc_claimAutoreleasedReturnValue();

  if (v17)
  {
LABEL_18:
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_24;
    -[NSObject stringValue](v17, "stringValue");
    v21 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    _AALogSystem();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19EACA000, v17, OS_LOG_TYPE_DEFAULT, "AALoginPluginManager: no DSID was found in iCloud service data!", buf, 2u);
    }
    v21 = 0;
  }

  v17 = v21;
LABEL_24:
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("service-data"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("tokens"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("cloudKitToken"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v24)
  {
    _AALogSystem();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19EACA000, v25, OS_LOG_TYPE_DEFAULT, "AALoginPluginManager: no CloudKit token in iCloud service data!", buf, 2u);
    }

  }
  v39 = v12;
  v40 = v8;
  _AALogSystem();
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    v27 = (objc_class *)objc_opt_class();
    NSStringFromClass(v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v42 = v15;
    v43 = 2112;
    v44 = v28;
    _os_log_impl(&dword_19EACA000, v26, OS_LOG_TYPE_DEFAULT, "AALoginPluginManager: using altDSID %@ (%@)", buf, 0x16u);

  }
  v29 = v7;
  v30 = -[AAStorableLoginContext initWithAppleID:altDSID:]([AAStorableLoginContext alloc], "initWithAppleID:altDSID:", v7, v15);
  -[AAStorableLoginContext setCloudKitToken:](v30, "setCloudKitToken:", v24);
  -[AAStorableLoginContext setDSID:](v30, "setDSID:", v17);
  -[AAStorableLoginContext setRawPassword:](v30, "setRawPassword:", v9);

  objc_msgSend(MEMORY[0x1E0C8F2B8], "defaultStore");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "aa_authKitAccountForAltDSID:", v15);
  v32 = objc_claimAutoreleasedReturnValue();
  v33 = v32;
  if (v32)
  {
    -[NSObject credential](v32, "credential", v39, v40);
    v34 = objc_claimAutoreleasedReturnValue();
    _AALogSystem();
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v42 = v33;
      _os_log_impl(&dword_19EACA000, v35, OS_LOG_TYPE_DEFAULT, "Trying to add CK and PRK for %@ to login context...", buf, 0xCu);
    }

    -[NSObject credentialItemForKey:](v34, "credentialItemForKey:", *MEMORY[0x1E0C8F190]);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[AAStorableLoginContext setContinuationKey:](v30, "setContinuationKey:", v36);

    -[NSObject credentialItemForKey:](v34, "credentialItemForKey:", *MEMORY[0x1E0C8F238]);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[AAStorableLoginContext setPasswordResetKey:](v30, "setPasswordResetKey:", v37);

  }
  else
  {
    _AALogSystem();
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v42 = v15;
      _os_log_impl(&dword_19EACA000, v34, OS_LOG_TYPE_DEFAULT, "No AuthKit account to grab CK and PRK from for altDSID: %@", buf, 0xCu);
    }
  }

  return v30;
}

- (BOOL)_notifyServicesOfLoginResponse:(id)a3 forAppleID:(id)a4 password:(id)a5 rawPassword:(id)a6
{
  id v10;
  NSObject *v11;
  AALoginPluginManager *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *pluginNotificationQueue;
  NSObject *v27;
  id v28;
  id v29;
  id v30;
  dispatch_time_t v31;
  NSObject *v32;
  BOOL v33;
  id v35;
  id obj;
  id v37;
  id v38;
  NSObject *group;
  _QWORD v40[5];
  id v41;
  id v42;
  id v43;
  _QWORD block[4];
  id v45;
  void *v46;
  id v47;
  uint8_t *v48;
  uint8_t v49[16];
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  uint8_t buf[8];
  uint8_t *v55;
  uint64_t v56;
  char v57;
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v38 = a4;
  v37 = a5;
  v35 = a6;
  _AALogSystem();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19EACA000, v11, OS_LOG_TYPE_DEFAULT, "AALoginPluginManager: will notify services of login response.", buf, 2u);
  }

  *(_QWORD *)buf = 0;
  v55 = buf;
  v56 = 0x2020000000;
  v57 = 1;
  if (v10)
  {
    v12 = self;
    objc_sync_enter(v12);
    if (v12->_shouldStashLoginResponse)
    {
      -[AALoginPluginManager _createLoginContextForAppleID:rawPassword:loginResponse:](v12, "_createLoginContextForAppleID:rawPassword:loginResponse:", v38, v35, v10);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      +[AALoginContextManager sharedManager](AALoginContextManager, "sharedManager");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setStashedContext:", v13);

    }
    objc_sync_exit(v12);

  }
  group = dispatch_group_create();
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  -[AALoginPluginManager _plugins](self, "_plugins");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v50, v58, 16);
  if (v16)
  {
    v17 = *(_QWORD *)v51;
    obj = v15;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v51 != v17)
          objc_enumerationMutation(obj);
        v19 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * i);
        objc_msgSend(v19, "serviceIdentifier");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = v20;
        if (self->_shouldSkipiTunesPlugin
          && objc_msgSend(v20, "isEqualToString:", CFSTR("com.apple.itunes")))
        {
          _AALogSystem();
          v22 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v49 = 0;
            _os_log_impl(&dword_19EACA000, v22, OS_LOG_TYPE_DEFAULT, "AALoginPluginManager is NOT notifying iTunes plugin about login because _shouldSkipiTunesPlugin is YES.", v49, 2u);
          }
        }
        else
        {
          objc_msgSend(v10, "dsid");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "altDSID");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "augmentedResponseParametersForServiceIdentifier:withAppleID:password:DSID:altDSID:", v21, v38, v37, v23, v24);
          v25 = (void *)objc_claimAutoreleasedReturnValue();

          pluginNotificationQueue = self->_pluginNotificationQueue;
          block[0] = MEMORY[0x1E0C809B0];
          block[1] = 3221225472;
          block[2] = __87__AALoginPluginManager__notifyServicesOfLoginResponse_forAppleID_password_rawPassword___block_invoke;
          block[3] = &unk_1E4170000;
          v45 = v21;
          v46 = v19;
          v47 = v25;
          v48 = buf;
          v22 = v25;
          dispatch_group_async(group, pluginNotificationQueue, block);

        }
      }
      v15 = obj;
      v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v50, v58, 16);
    }
    while (v16);
  }

  v27 = self->_pluginNotificationQueue;
  v40[0] = MEMORY[0x1E0C809B0];
  v40[1] = 3221225472;
  v40[2] = __87__AALoginPluginManager__notifyServicesOfLoginResponse_forAppleID_password_rawPassword___block_invoke_35;
  v40[3] = &unk_1E4170050;
  v40[4] = self;
  v28 = v10;
  v41 = v28;
  v29 = v38;
  v42 = v29;
  v30 = v37;
  v43 = v30;
  dispatch_group_async(group, v27, v40);
  v31 = dispatch_time(0, 60000000000);
  if (dispatch_group_wait(group, v31))
  {
    _AALogSystem();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v49 = 0;
      _os_log_impl(&dword_19EACA000, v32, OS_LOG_TYPE_DEFAULT, "AALoginPluginManager: timed out while notifying plugins!", v49, 2u);
    }

    v33 = 1;
  }
  else
  {
    v33 = v55[24] != 0;
  }

  _Block_object_dispose(buf, 8);
  return v33;
}

void __87__AALoginPluginManager__notifyServicesOfLoginResponse_forAppleID_password_rawPassword___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  dispatch_semaphore_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  _QWORD v10[4];
  id v11;
  dispatch_semaphore_t v12;
  uint64_t v13;
  uint8_t buf[4];
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  _AALogSystem();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    v15 = v3;
    _os_log_impl(&dword_19EACA000, v2, OS_LOG_TYPE_DEFAULT, "AALoginPluginManager: notifying plugin %@ of login response...", buf, 0xCu);
  }

  v4 = dispatch_semaphore_create(0);
  v6 = *(void **)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 48);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __87__AALoginPluginManager__notifyServicesOfLoginResponse_forAppleID_password_rawPassword___block_invoke_33;
  v10[3] = &unk_1E416FFD8;
  v7 = *(id *)(a1 + 32);
  v8 = *(_QWORD *)(a1 + 56);
  v12 = v4;
  v13 = v8;
  v11 = v7;
  v9 = v4;
  objc_msgSend(v6, "handleLoginResponse:completion:", v5, v10);
  dispatch_semaphore_wait(v9, 0xFFFFFFFFFFFFFFFFLL);

}

void __87__AALoginPluginManager__notifyServicesOfLoginResponse_forAppleID_password_rawPassword___block_invoke_33(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  char v9;
  NSObject *v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  int v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  _AALogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = *(_QWORD *)(a1 + 32);
    v11 = 138412802;
    v12 = v7;
    v13 = 1024;
    v14 = a2;
    v15 = 2112;
    v16 = v5;
    _os_log_impl(&dword_19EACA000, v6, OS_LOG_TYPE_DEFAULT, "AALoginPluginManager: plugin %@ finished handling login response with success %d and error %@", (uint8_t *)&v11, 0x1Cu);
  }

  v8 = objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", CFSTR("com.apple.mobileme"));
  if (a2)
  {
    if ((v8 & 1) != 0)
    {
      v9 = 1;
LABEL_10:
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v9;
    }
  }
  else if (v8)
  {
    _AALogSystem();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v11) = 0;
      _os_log_impl(&dword_19EACA000, v10, OS_LOG_TYPE_DEFAULT, "AALoginPluginManager: Fatal error! The iCloud plugin failed while handling the login response.", (uint8_t *)&v11, 2u);
    }

    v9 = 0;
    goto LABEL_10;
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));

}

void __87__AALoginPluginManager__notifyServicesOfLoginResponse_forAppleID_password_rawPassword___block_invoke_35(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  dispatch_semaphore_t v11;
  void *v12;
  NSObject *v13;
  _QWORD v14[4];
  dispatch_semaphore_t v15;
  uint8_t buf[16];

  objc_msgSend(*(id *)(a1 + 32), "_idsPlugin");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "delegateServiceIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = *(void **)(a1 + 40);
    v5 = *(_QWORD *)(a1 + 48);
    v6 = *(_QWORD *)(a1 + 56);
    objc_msgSend(v4, "dsid");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "altDSID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "augmentedResponseParametersForServiceIdentifier:withAppleID:password:DSID:altDSID:", v3, v5, v6, v7, v8);
    v9 = objc_claimAutoreleasedReturnValue();

    _AALogSystem();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19EACA000, v10, OS_LOG_TYPE_DEFAULT, "AALoginPluginManager: about to notify IDS plugin of login response.", buf, 2u);
    }

    v11 = dispatch_semaphore_create(0);
    objc_msgSend(*(id *)(a1 + 32), "_idsPlugin");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __87__AALoginPluginManager__notifyServicesOfLoginResponse_forAppleID_password_rawPassword___block_invoke_36;
    v14[3] = &unk_1E4170028;
    v15 = v11;
    v13 = v11;
    objc_msgSend(v12, "completeSetupWithResponseParameters:handler:", v9, v14);

    dispatch_semaphore_wait(v13, 0xFFFFFFFFFFFFFFFFLL);
  }
  else
  {
    _AALogSystem();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19EACA000, v9, OS_LOG_TYPE_DEFAULT, "AALoginPluginManager: idsServiceID is nil. Skipping...", buf, 2u);
    }
  }

}

void __87__AALoginPluginManager__notifyServicesOfLoginResponse_forAppleID_password_rawPassword___block_invoke_36(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _AALogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_19EACA000, v5, OS_LOG_TYPE_DEFAULT, "AALoginPluginManager: finished notifying IDS. Error: %@", (uint8_t *)&v6, 0xCu);
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (BOOL)shouldStashLoginResponse
{
  AALoginPluginManager *v2;
  BOOL shouldStashLoginResponse;

  v2 = self;
  objc_sync_enter(v2);
  shouldStashLoginResponse = v2->_shouldStashLoginResponse;
  objc_sync_exit(v2);

  return shouldStashLoginResponse;
}

- (void)setShouldStashLoginResponse:(BOOL)a3
{
  AALoginPluginManager *obj;

  obj = self;
  objc_sync_enter(obj);
  obj->_shouldStashLoginResponse = a3;
  objc_sync_exit(obj);

}

- (void)unstashLoginResponse
{
  void *v2;
  AALoginPluginManager *obj;

  obj = self;
  objc_sync_enter(obj);
  if (obj->_shouldStashLoginResponse)
  {
    +[AALoginContextManager sharedManager](AALoginContextManager, "sharedManager");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "persistStashedContext");

  }
  objc_sync_exit(obj);

}

- (id)_loadPluginsLimitedToBundleIDs:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  objc_class *v17;
  NSObject *v18;
  NSObject *v19;
  NSObject *v20;
  NSObject *v21;
  NSObject *v22;
  id v24;
  id obj;
  _QWORD v26[5];
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t v34;
  uint8_t v35[128];
  _BYTE buf[24];
  void *v37;
  uint64_t *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  _AALogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19EACA000, v4, OS_LOG_TYPE_DEFAULT, "AALoginPluginManager: Loading plugin bundles...", buf, 2u);
  }

  v24 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v31 = 0;
  v32 = &v31;
  v33 = 0x2050000000;
  v5 = (void *)getACDPluginLoaderClass_softClass;
  v34 = getACDPluginLoaderClass_softClass;
  if (!getACDPluginLoaderClass_softClass)
  {
    *(_QWORD *)buf = MEMORY[0x1E0C809B0];
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = __getACDPluginLoaderClass_block_invoke;
    v37 = &unk_1E416F0A0;
    v38 = &v31;
    __getACDPluginLoaderClass_block_invoke((uint64_t)buf);
    v5 = (void *)v32[3];
  }
  v6 = objc_retainAutorelease(v5);
  _Block_object_dispose(&v31, 8);
  objc_msgSend(v6, "pluginBundlesAtSubpath:", CFSTR("/AppleIDLoginPlugins/"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  _AALogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = objc_msgSend(v7, "count");
    *(_DWORD *)buf = 134217984;
    *(_QWORD *)&buf[4] = v9;
    _os_log_impl(&dword_19EACA000, v8, OS_LOG_TYPE_DEFAULT, "AALoginPluginManager: found %lu service bundles.", buf, 0xCu);
  }

  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  obj = v7;
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v28 != v11)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        _AALogSystem();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)&buf[4] = v13;
          _os_log_impl(&dword_19EACA000, v14, OS_LOG_TYPE_DEFAULT, "AALoginPluginManager: processing plugin bundle %@.", buf, 0xCu);
        }

        if (v3
          && (v26[0] = MEMORY[0x1E0C809B0],
              v26[1] = 3221225472,
              v26[2] = __55__AALoginPluginManager__loadPluginsLimitedToBundleIDs___block_invoke,
              v26[3] = &unk_1E4170078,
              v26[4] = v13,
              objc_msgSend(v3, "indexOfObjectPassingTest:", v26) == 0x7FFFFFFFFFFFFFFFLL))
        {
          _AALogSystem();
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v13, "bundleIdentifier");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)&buf[4] = v16;
            _os_log_impl(&dword_19EACA000, v15, OS_LOG_TYPE_DEFAULT, "AALoginPluginManager: skipping plugin %@.", buf, 0xCu);

          }
        }
        else
        {
          v17 = (objc_class *)objc_msgSend(v13, "principalClass");
          if (-[objc_class conformsToProtocol:](v17, "conformsToProtocol:", &unk_1EE54EEF8))
          {
            v18 = objc_alloc_init(v17);
            v19 = v18;
            if (v18)
            {
              -[NSObject serviceIdentifier](v18, "serviceIdentifier");
              v20 = objc_claimAutoreleasedReturnValue();
              if (v20)
              {
                objc_msgSend(v24, "addObject:", v19);
              }
              else
              {
                _AALogSystem();
                v21 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  *(_QWORD *)&buf[4] = v19;
                  _os_log_impl(&dword_19EACA000, v21, OS_LOG_TYPE_DEFAULT, "AALoginPluginManager: Error! Service %@ has no identifier", buf, 0xCu);
                }

              }
            }
            else
            {
              _AALogSystem();
              v20 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412546;
                *(_QWORD *)&buf[4] = v17;
                *(_WORD *)&buf[12] = 2112;
                *(_QWORD *)&buf[14] = v13;
                _os_log_impl(&dword_19EACA000, v20, OS_LOG_TYPE_DEFAULT, "AALoginPluginManager: Could not instantiate object of class %@ for bundle %@", buf, 0x16u);
              }
            }

          }
          else
          {
            _AALogSystem();
            v19 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              *(_QWORD *)&buf[4] = v17;
              *(_WORD *)&buf[12] = 2112;
              *(_QWORD *)&buf[14] = v13;
              _os_log_impl(&dword_19EACA000, v19, OS_LOG_TYPE_DEFAULT, "AALoginPluginManager: Principal class %@ does not conform to AAAppleIDLoginPlugin for bundle %@", buf, 0x16u);
            }
          }

        }
      }
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
    }
    while (v10);
  }

  _AALogSystem();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19EACA000, v22, OS_LOG_TYPE_DEFAULT, "AALoginPluginManager: Finished loading service bundles.", buf, 2u);
  }

  return v24;
}

uint64_t __55__AALoginPluginManager__loadPluginsLimitedToBundleIDs___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  objc_msgSend(a2, "lowercaseString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lowercaseString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v3, "isEqualToString:", v5);

  return v6;
}

- (BOOL)shouldSkipiTunesPlugin
{
  return self->_shouldSkipiTunesPlugin;
}

- (void)setShouldSkipiTunesPlugin:(BOOL)a3
{
  self->_shouldSkipiTunesPlugin = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_idsPlugin, 0);
  objc_storeStrong((id *)&self->_pluginNotificationQueue, 0);
  objc_storeStrong((id *)&self->_plugins, 0);
  objc_storeStrong((id *)&self->_allowedPluginBundleIDs, 0);
}

@end
