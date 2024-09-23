@implementation NEAppPushManager

- (NEAppPushManager)init
{
  NEAppPushManager *v2;
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NEConfiguration *v11;
  SEL v12;
  NEAppPush *v13;
  SEL v14;
  SEL v15;
  SEL v16;
  SEL v17;
  void *v18;
  objc_super v20;
  uint8_t buf[4];
  NEAppPushManager *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (!self)
    return 0;
  v20.receiver = self;
  v20.super_class = (Class)NEAppPushManager;
  v2 = -[NEAppPushManager init](&v20, sel_init);
  if (v2)
  {
    if (+[NEProvider isRunningInProvider](NEProvider, "isRunningInProvider"))
    {
      ne_log_obj();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v22 = v2;
        _os_log_error_impl(&dword_19BD16000, v3, OS_LOG_TYPE_ERROR, "%@ objects cannot be instantiated from NEProvider processes", buf, 0xCu);
      }

      return 0;
    }
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "infoDictionary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", *MEMORY[0x1E0C9AAC8]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "bundleIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "infoDictionary");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectForKey:", *MEMORY[0x1E0C9AE88]);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

    }
    v11 = -[NEConfiguration initWithName:grade:]([NEConfiguration alloc], "initWithName:grade:", v6, 1);
    objc_setProperty_atomic_copy(v2, v12, v11, 32);

    v13 = objc_alloc_init(NEAppPush);
    objc_msgSend(objc_getProperty(v2, v14, 32, 1), "setAppPush:", v13);

    objc_msgSend(objc_getProperty(v2, v15, 32, 1), "setApplication:", v8);
    objc_msgSend(objc_getProperty(v2, v16, 32, 1), "setApplicationName:", v6);
    objc_msgSend(objc_getProperty(v2, v17, 32, 1), "appPush");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setPluginType:", v8);

    v2->_nesmConnection = 0;
    v2->_active = 0;
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[NEAppPushManager cancelSessionManagerConnection](self);
  v3.receiver = self;
  v3.super_class = (Class)NEAppPushManager;
  -[NEAppPushManager dealloc](&v3, sel_dealloc);
}

- (void)loadFromPreferencesWithCompletionHandler:(void *)completionHandler
{
  void *v4;
  const char *v5;
  void *v6;
  id Property;
  void *v8;
  _QWORD v9[5];
  id v10;

  v4 = completionHandler;
  if (v4)
  {
    +[NEConfigurationManager sharedManager](NEConfigurationManager, "sharedManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (self)
      Property = objc_getProperty(self, v5, 32, 1);
    else
      Property = 0;
    objc_msgSend(Property, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __61__NEAppPushManager_loadFromPreferencesWithCompletionHandler___block_invoke;
    v9[3] = &unk_1E3CC46F8;
    v9[4] = self;
    v10 = v4;
    objc_msgSend(v6, "loadConfigurationWithID:withCompletionQueue:handler:", v8, MEMORY[0x1E0C80D38], v9);

  }
}

- (void)removeFromPreferencesWithCompletionHandler:(void *)completionHandler
{
  void *v4;
  NEAppPushManager *v5;
  const char *v6;
  const char *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  SEL v12;
  id v13;
  uint64_t v14;
  id v15;
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;
  _QWORD block[4];
  id v21;

  v4 = completionHandler;
  if (v4)
  {
    v5 = self;
    objc_sync_enter(v5);
    if (v5 && objc_getProperty(v5, v6, 32, 1))
    {
      v8 = objc_getProperty(v5, v7, 32, 1);
      objc_msgSend(v8, "identifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)objc_msgSend(v9, "copy");

      +[NEConfigurationManager sharedManager](NEConfigurationManager, "sharedManager");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_getProperty(v5, v12, 32, 1);
      v14 = MEMORY[0x1E0C80D38];
      v15 = MEMORY[0x1E0C80D38];
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __63__NEAppPushManager_removeFromPreferencesWithCompletionHandler___block_invoke_2;
      v17[3] = &unk_1E3CC3080;
      v17[4] = v5;
      v16 = v10;
      v18 = v16;
      v19 = v4;
      objc_msgSend(v11, "removeConfiguration:withCompletionQueue:handler:", v13, v14, v17);

    }
    else
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __63__NEAppPushManager_removeFromPreferencesWithCompletionHandler___block_invoke;
      block[3] = &unk_1E3CC4720;
      v21 = v4;
      dispatch_async(MEMORY[0x1E0C80D38], block);
      v16 = v21;
    }

    objc_sync_exit(v5);
  }

}

- (void)saveToPreferencesWithCompletionHandler:(void *)completionHandler
{
  void *v4;
  NEAppPushManager *v5;
  const char *v6;
  id v7;
  const char *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  SEL v13;
  id v14;
  char v15;
  void *v16;
  SEL v17;
  id v18;
  uint64_t v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  NSObject *v29;
  _QWORD v30[5];
  id v31;
  _QWORD v32[4];
  id v33;
  id v34;
  _QWORD block[4];
  id v36;
  id v37;
  uint64_t v38;
  void *v39;
  uint8_t buf[4];
  NEAppPushManager *v41;
  __int16 v42;
  id v43;
  uint64_t v44;
  _QWORD v45[2];

  v45[1] = *MEMORY[0x1E0C80C00];
  v4 = completionHandler;
  if (v4)
  {
    v5 = self;
    objc_sync_enter(v5);
    if (!v5)
      goto LABEL_7;
    v7 = objc_getProperty(v5, v6, 32, 1);
    if (!v7)
      goto LABEL_7;
    v9 = v7;
    v10 = objc_getProperty(v5, v8, 32, 1);
    objc_msgSend(v10, "appPush");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      v12 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v14 = objc_getProperty(v5, v13, 32, 1);
      v15 = objc_msgSend(v14, "checkValidityAndCollectErrors:", v12);

      if ((v15 & 1) != 0)
      {
        +[NEConfigurationManager sharedManager](NEConfigurationManager, "sharedManager");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_getProperty(v5, v17, 32, 1);
        v19 = MEMORY[0x1E0C80D38];
        v20 = MEMORY[0x1E0C80D38];
        v30[0] = MEMORY[0x1E0C809B0];
        v30[1] = 3221225472;
        v30[2] = __59__NEAppPushManager_saveToPreferencesWithCompletionHandler___block_invoke_36;
        v30[3] = &unk_1E3CC4748;
        v30[4] = v5;
        v31 = v4;
        objc_msgSend(v16, "saveConfiguration:withCompletionQueue:handler:", v18, v19, v30);

      }
      else
      {
        if (objc_msgSend(v12, "count"))
        {
          v38 = *MEMORY[0x1E0CB2D50];
          objc_msgSend(v12, "componentsJoinedByString:", CFSTR("\n"));
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v39 = v25;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v39, &v38, 1);
          v26 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v26 = 0;
        }
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("NEAppPushErrorDomain"), 1, v26);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v32[0] = MEMORY[0x1E0C809B0];
        v32[1] = 3221225472;
        v32[2] = __59__NEAppPushManager_saveToPreferencesWithCompletionHandler___block_invoke_35;
        v32[3] = &unk_1E3CC46A8;
        v34 = v4;
        v28 = v27;
        v33 = v28;
        dispatch_async(MEMORY[0x1E0C80D38], v32);
        ne_log_obj();
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          v41 = v5;
          v42 = 2112;
          v43 = v28;
          _os_log_error_impl(&dword_19BD16000, v29, OS_LOG_TYPE_ERROR, "%@ Failed to save the configuration: %@", buf, 0x16u);
        }

      }
    }
    else
    {
LABEL_7:
      v21 = (void *)MEMORY[0x1E0CB35C8];
      v44 = *MEMORY[0x1E0CB2D50];
      v45[0] = CFSTR("invalid app push provider configuration");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v45, &v44, 1);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "errorWithDomain:code:userInfo:", CFSTR("NEAppPushErrorDomain"), 1, v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __59__NEAppPushManager_saveToPreferencesWithCompletionHandler___block_invoke;
      block[3] = &unk_1E3CC46A8;
      v37 = v4;
      v12 = v23;
      v36 = v12;
      dispatch_async(MEMORY[0x1E0C80D38], block);
      ne_log_obj();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v41 = v5;
        v42 = 2112;
        v43 = v12;
        _os_log_error_impl(&dword_19BD16000, v24, OS_LOG_TYPE_ERROR, "%@ Failed to save the configuration as configuration is nil, %@", buf, 0x16u);
      }

    }
    objc_sync_exit(v5);

  }
}

- (BOOL)isEnabled
{
  NEAppPushManager *v2;
  const char *v3;
  id Property;
  id v5;
  void *v6;
  char v7;

  v2 = self;
  objc_sync_enter(v2);
  if (v2)
    Property = objc_getProperty(v2, v3, 32, 1);
  else
    Property = 0;
  v5 = Property;
  objc_msgSend(v5, "appPush");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEnabled");

  objc_sync_exit(v2);
  return v7;
}

- (void)setEnabled:(BOOL)enabled
{
  _BOOL8 v3;
  const char *v4;
  id Property;
  id v6;
  void *v7;
  NEAppPushManager *selfa;

  v3 = enabled;
  selfa = self;
  objc_sync_enter(selfa);
  Property = selfa;
  if (selfa)
    Property = objc_getProperty(selfa, v4, 32, 1);
  v6 = Property;
  objc_msgSend(v6, "appPush");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setEnabled:", v3);

  objc_sync_exit(selfa);
}

- (NSArray)matchSSIDs
{
  NEAppPushManager *v2;
  const char *v3;
  id Property;
  id v5;
  void *v6;
  void *v7;

  v2 = self;
  objc_sync_enter(v2);
  if (v2)
    Property = objc_getProperty(v2, v3, 32, 1);
  else
    Property = 0;
  v5 = Property;
  objc_msgSend(v5, "appPush");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "matchSSIDs");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v2);
  return (NSArray *)v7;
}

- (void)setMatchSSIDs:(NSArray *)matchSSIDs
{
  NEAppPushManager *v4;
  const char *v5;
  id Property;
  id v7;
  void *v8;
  NSArray *v9;

  v9 = matchSSIDs;
  v4 = self;
  objc_sync_enter(v4);
  if (v4)
    Property = objc_getProperty(v4, v5, 32, 1);
  else
    Property = 0;
  v7 = Property;
  objc_msgSend(v7, "appPush");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setMatchSSIDs:", v9);

  objc_sync_exit(v4);
}

- (NSArray)matchPrivateLTENetworks
{
  NEAppPushManager *v2;
  const char *v3;
  id Property;
  id v5;
  void *v6;
  void *v7;

  v2 = self;
  objc_sync_enter(v2);
  if (v2)
    Property = objc_getProperty(v2, v3, 32, 1);
  else
    Property = 0;
  v5 = Property;
  objc_msgSend(v5, "appPush");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "matchPrivateLTENetworks");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v2);
  return (NSArray *)v7;
}

- (void)setMatchPrivateLTENetworks:(NSArray *)matchPrivateLTENetworks
{
  NEAppPushManager *v4;
  const char *v5;
  id Property;
  id v7;
  void *v8;
  NSArray *v9;

  v9 = matchPrivateLTENetworks;
  v4 = self;
  objc_sync_enter(v4);
  if (v4)
    Property = objc_getProperty(v4, v5, 32, 1);
  else
    Property = 0;
  v7 = Property;
  objc_msgSend(v7, "appPush");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setMatchPrivateLTENetworks:", v9);

  objc_sync_exit(v4);
}

- (NSDictionary)providerConfiguration
{
  NEAppPushManager *v2;
  const char *v3;
  id Property;
  id v5;
  void *v6;
  void *v7;

  v2 = self;
  objc_sync_enter(v2);
  if (v2)
    Property = objc_getProperty(v2, v3, 32, 1);
  else
    Property = 0;
  v5 = Property;
  objc_msgSend(v5, "appPush");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "providerConfiguration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v2);
  return (NSDictionary *)v7;
}

- (void)setProviderConfiguration:(NSDictionary *)providerConfiguration
{
  NEAppPushManager *v4;
  const char *v5;
  id Property;
  id v7;
  void *v8;
  NSDictionary *v9;

  v9 = providerConfiguration;
  v4 = self;
  objc_sync_enter(v4);
  if (v4)
    Property = objc_getProperty(v4, v5, 32, 1);
  else
    Property = 0;
  v7 = Property;
  objc_msgSend(v7, "appPush");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setProviderConfiguration:", v9);

  objc_sync_exit(v4);
}

- (NSString)localizedDescription
{
  NEAppPushManager *v2;
  const char *v3;
  id Property;
  id v5;
  void *v6;

  v2 = self;
  objc_sync_enter(v2);
  if (v2)
    Property = objc_getProperty(v2, v3, 32, 1);
  else
    Property = 0;
  v5 = Property;
  objc_msgSend(v5, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v2);
  return (NSString *)v6;
}

- (void)setLocalizedDescription:(NSString *)localizedDescription
{
  NEAppPushManager *v4;
  const char *v5;
  id Property;
  id v7;
  NSString *v8;

  v8 = localizedDescription;
  v4 = self;
  objc_sync_enter(v4);
  if (v4)
    Property = objc_getProperty(v4, v5, 32, 1);
  else
    Property = 0;
  v7 = Property;
  objc_msgSend(v7, "setName:", v8);

  objc_sync_exit(v4);
}

- (NSString)providerBundleIdentifier
{
  NEAppPushManager *v2;
  const char *v3;
  id Property;
  id v5;
  void *v6;
  void *v7;

  v2 = self;
  objc_sync_enter(v2);
  if (v2)
    Property = objc_getProperty(v2, v3, 32, 1);
  else
    Property = 0;
  v5 = Property;
  objc_msgSend(v5, "appPush");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "providerBundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v2);
  return (NSString *)v7;
}

- (void)setProviderBundleIdentifier:(NSString *)providerBundleIdentifier
{
  NEAppPushManager *v4;
  const char *v5;
  id Property;
  id v7;
  void *v8;
  NSString *v9;

  v9 = providerBundleIdentifier;
  v4 = self;
  objc_sync_enter(v4);
  if (v4)
    Property = objc_getProperty(v4, v5, 32, 1);
  else
    Property = 0;
  v7 = Property;
  objc_msgSend(v7, "appPush");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setProviderBundleIdentifier:", v9);

  objc_sync_exit(v4);
}

- (id)delegate
{
  return objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)delegate
{
  objc_storeWeak((id *)&self->_delegate, delegate);
}

- (BOOL)isActive
{
  return self->_active;
}

- (void)setActive:(BOOL)a3
{
  self->_active = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_configurationManager, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

uint64_t __59__NEAppPushManager_saveToPreferencesWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __59__NEAppPushManager_saveToPreferencesWithCompletionHandler___block_invoke_35(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __59__NEAppPushManager_saveToPreferencesWithCompletionHandler___block_invoke_36(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10;
  id v11;
  uint8_t buf[4];
  uint64_t v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    ne_log_obj();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v8 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      v13 = v8;
      v14 = 2112;
      v15 = v3;
      _os_log_error_impl(&dword_19BD16000, v4, OS_LOG_TYPE_ERROR, "%@: Failed to save the configuration: %@", buf, 0x16u);
    }

    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("NEAppPushErrorDomain"), 3, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __59__NEAppPushManager_saveToPreferencesWithCompletionHandler___block_invoke_37;
  v9[3] = &unk_1E3CC46A8;
  v6 = *(id *)(a1 + 40);
  v10 = v5;
  v11 = v6;
  v7 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v9);

}

uint64_t __59__NEAppPushManager_saveToPreferencesWithCompletionHandler___block_invoke_37(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __63__NEAppPushManager_removeFromPreferencesWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("NEAppPushErrorDomain"), 3, 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

void __63__NEAppPushManager_removeFromPreferencesWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10;
  id v11;
  uint8_t buf[4];
  uint64_t v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    ne_log_obj();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v8 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      v13 = v8;
      v14 = 2112;
      v15 = v3;
      _os_log_error_impl(&dword_19BD16000, v4, OS_LOG_TYPE_ERROR, "%@: failed to remove the configuration: %@", buf, 0x16u);
    }

  }
  +[NEAppPushManager loadedManagers]();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObjectForKey:", *(_QWORD *)(a1 + 40));

  -[NEAppPushManager cancelSessionManagerConnection](*(void **)(a1 + 32));
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __63__NEAppPushManager_removeFromPreferencesWithCompletionHandler___block_invoke_29;
  v9[3] = &unk_1E3CC46A8;
  v6 = *(id *)(a1 + 48);
  v10 = v3;
  v11 = v6;
  v7 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v9);

}

+ (id)loadedManagers
{
  uint64_t v0;
  _QWORD block[5];

  v0 = objc_opt_self();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __34__NEAppPushManager_loadedManagers__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = v0;
  if (loadedManagers_managers_init != -1)
    dispatch_once(&loadedManagers_managers_init, block);
  return (id)loadedManagers_loadedManagers;
}

- (void)cancelSessionManagerConnection
{
  _QWORD *v1;
  NSObject *v2;
  const char *v3;
  id v4;
  void *v5;
  int v6;
  _QWORD *v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v1 = a1;
    objc_sync_enter(v1);
    if (v1[5])
    {
      ne_session_cancel();
      v1[5] = 0;
      ne_log_obj();
      v2 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
      {
        v4 = objc_getProperty(v1, v3, 32, 1);
        objc_msgSend(v4, "identifier");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = 138412546;
        v7 = v1;
        v8 = 2112;
        v9 = v5;
        _os_log_impl(&dword_19BD16000, v2, OS_LOG_TYPE_INFO, "%@ cancelled connection with nesessionmanager for configuration id: %@", (uint8_t *)&v6, 0x16u);

      }
    }
    objc_sync_exit(v1);

  }
}

uint64_t __63__NEAppPushManager_removeFromPreferencesWithCompletionHandler___block_invoke_29(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __34__NEAppPushManager_loadedManagers__block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  _QWORD v5[5];

  v2 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v3 = (void *)loadedManagers_loadedManagers;
  loadedManagers_loadedManagers = (uint64_t)v2;

  +[NEConfigurationManager sharedManager](NEConfigurationManager, "sharedManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __34__NEAppPushManager_loadedManagers__block_invoke_2;
  v5[3] = &__block_descriptor_40_e17_v16__0__NSArray_8l;
  v5[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v4, "setChangedQueue:andHandler:", MEMORY[0x1E0C80D38], v5);

}

void __34__NEAppPushManager_loadedManagers__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  id obj;
  _QWORD v13[7];
  _QWORD v14[5];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  obj = a2;
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v22;
    v5 = (void *)MEMORY[0x1E0C80D38];
    v6 = MEMORY[0x1E0C809B0];
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v22 != v4)
          objc_enumerationMutation(obj);
        v8 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v7);
        v15 = 0;
        v16 = &v15;
        v17 = 0x3032000000;
        v18 = __Block_byref_object_copy__6475;
        v19 = __Block_byref_object_dispose__6476;
        objc_msgSend((id)loadedManagers_loadedManagers, "objectForKeyedSubscript:", v8);
        v20 = (id)objc_claimAutoreleasedReturnValue();
        v9 = (void *)v16[5];
        if (v9)
        {
          v14[0] = v6;
          v14[1] = 3221225472;
          v14[2] = __34__NEAppPushManager_loadedManagers__block_invoke_2;
          v14[3] = &__block_descriptor_40_e17_v16__0__NSError_8l;
          v14[4] = *(_QWORD *)(a1 + 32);
          objc_msgSend(v9, "loadFromPreferencesWithCompletionHandler:", v14);
        }
        else
        {
          +[NEConfigurationManager sharedManager](NEConfigurationManager, "sharedManager");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = v5;
          v13[0] = v6;
          v13[1] = 3221225472;
          v13[2] = __34__NEAppPushManager_loadedManagers__block_invoke_4;
          v13[3] = &unk_1E3CC0720;
          v13[4] = v8;
          v13[5] = &v15;
          v13[6] = *(_QWORD *)(a1 + 32);
          objc_msgSend(v10, "loadConfigurationWithID:withCompletionQueue:handler:", v8, v5, v13);

        }
        _Block_object_dispose(&v15, 8);

        ++v7;
      }
      while (v3 != v7);
      v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v3);
  }

}

{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    ne_log_obj();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = *(_QWORD *)(a1 + 32);
      v6 = 138412546;
      v7 = v5;
      v8 = 2112;
      v9 = v3;
      _os_log_error_impl(&dword_19BD16000, v4, OS_LOG_TYPE_ERROR, "%@ loadFromPreferencesWithCompletionHandler failed. error: %@", (uint8_t *)&v6, 0x16u);
    }

  }
}

void __34__NEAppPushManager_loadedManagers__block_invoke_4(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  NSObject *v11;
  NEAppPushManager *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  uint64_t v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend((id)loadedManagers_loadedManagers, "objectForKeyedSubscript:", a1[4]);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(a1[5] + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

  if (*(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40))
  {
    if (v6)
    {
LABEL_3:
      ne_log_obj();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        v18 = a1[6];
        v19 = 138412546;
        v20 = v18;
        v21 = 2112;
        v22 = v6;
        _os_log_error_impl(&dword_19BD16000, v11, OS_LOG_TYPE_ERROR, "%@ loadConfigurationWithID failed. error: %@", (uint8_t *)&v19, 0x16u);
      }

      goto LABEL_11;
    }
  }
  else
  {
    v12 = objc_alloc_init(NEAppPushManager);
    v13 = *(_QWORD *)(a1[5] + 8);
    v14 = *(void **)(v13 + 40);
    *(_QWORD *)(v13 + 40) = v12;

    if (v6)
      goto LABEL_3;
  }
  v15 = *(void **)(*(_QWORD *)(a1[5] + 8) + 40);
  if (v15
    && (objc_setProperty_atomic_copy(v15, v10, v5, 32), (v16 = *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40)) != 0))
  {
    *(_BYTE *)(v16 + 9) = 1;
    v17 = *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40);
  }
  else
  {
    v17 = 0;
  }
  objc_msgSend((id)loadedManagers_loadedManagers, "setObject:forKeyedSubscript:", v17, a1[4]);
LABEL_11:

}

void __61__NEAppPushManager_loadFromPreferencesWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  const char *v10;
  _QWORD *v11;
  id v12;
  id v13;
  void *v14;
  BOOL v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  NSObject *v21;
  id v22;
  id v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  id Property;
  id v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  int v32;
  uint64_t v33;
  __int16 v34;
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = *(id *)(a1 + 32);
  objc_sync_enter(v7);
  if (!v6)
  {
    if (!v5 || (objc_msgSend(v5, "appPush"), v9 = (void *)objc_claimAutoreleasedReturnValue(), v9, !v9))
    {
      ne_log_obj();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        v26 = *(_QWORD *)(a1 + 32);
        if (v26)
          Property = objc_getProperty(*(id *)(a1 + 32), v25, 32, 1);
        else
          Property = 0;
        v28 = Property;
        objc_msgSend(v28, "identifier");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = 138412546;
        v33 = v26;
        v34 = 2112;
        v35 = v29;
        _os_log_impl(&dword_19BD16000, v21, OS_LOG_TYPE_INFO, "%@ No configuration found with ID %@", (uint8_t *)&v32, 0x16u);

      }
      goto LABEL_24;
    }
    v11 = *(_QWORD **)(a1 + 32);
    if (v11)
    {
      if (v11[5])
      {
LABEL_14:
        v17 = *(void **)(a1 + 32);
        if (v17 && (objc_setProperty_atomic_copy(v17, v10, v5, 32), (v18 = *(_QWORD *)(a1 + 32)) != 0))
        {
          *(_BYTE *)(v18 + 9) = 1;
          v19 = *(_QWORD *)(a1 + 32);
        }
        else
        {
          v19 = 0;
        }
        +[NEAppPushManager loadedManagers]();
        v21 = objc_claimAutoreleasedReturnValue();
        v22 = *(id *)(a1 + 32);
        if (v22)
          v22 = objc_getProperty(v22, v20, 32, 1);
        v23 = v22;
        objc_msgSend(v23, "identifier");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject setObject:forKeyedSubscript:](v21, "setObject:forKeyedSubscript:", v19, v24);

LABEL_24:
        v6 = 0;
LABEL_25:
        (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
        goto LABEL_26;
      }
      v12 = objc_getProperty(*(id *)(a1 + 32), v10, 32, 1);
    }
    else
    {
      v12 = 0;
    }
    v13 = v12;
    objc_msgSend(v13, "identifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[NEAppPushManager establishSessionManagerConnectionWithConfigurationID:](v11, v14);

    if (!v15)
    {
      ne_log_obj();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        v31 = *(_QWORD *)(a1 + 32);
        v32 = 138412290;
        v33 = v31;
        _os_log_error_impl(&dword_19BD16000, v16, OS_LOG_TYPE_ERROR, "%@ establishSessionManagerConnectionWithConfigurationID failed.", (uint8_t *)&v32, 0xCu);
      }

      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("NEAppPushErrorDomain"), 1, 0);
      v6 = (id)objc_claimAutoreleasedReturnValue();
      if (v6)
        goto LABEL_25;
    }
    goto LABEL_14;
  }
  ne_log_obj();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    v30 = *(_QWORD *)(a1 + 32);
    v32 = 138412546;
    v33 = v30;
    v34 = 2112;
    v35 = v6;
    _os_log_error_impl(&dword_19BD16000, v8, OS_LOG_TYPE_ERROR, "%@ Failed to load the configuration: %@", (uint8_t *)&v32, 0x16u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
LABEL_26:
  objc_sync_exit(v7);

}

- (BOOL)establishSessionManagerConnectionWithConfigurationID:(void *)a1
{
  id v3;
  _QWORD *v4;
  uint64_t v5;
  _BOOL8 v6;
  id v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  uint8_t buf[4];
  _QWORD *v13;
  __int16 v14;
  id v15;
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1)
  {
    v4 = a1;
    objc_sync_enter(v4);
    v16[0] = 0;
    v16[1] = 0;
    -[NEAppPushManager cancelSessionManagerConnection](v4);
    objc_msgSend(v3, "getUUIDBytes:", v16);
    v5 = ne_session_create();
    v4[5] = v5;
    v6 = v5 != 0;
    if (v5)
    {
      v7 = MEMORY[0x1E0C80D38];
      ne_session_set_event_handler();

      v8 = v3;
      ne_session_get_info();

      ne_log_obj();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        v13 = v4;
        v14 = 2112;
        v15 = v8;
        _os_log_impl(&dword_19BD16000, v9, OS_LOG_TYPE_INFO, "%@ established connection with nesm for configuration id: %@", buf, 0x16u);
      }

    }
    else
    {
      ne_log_obj();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v13 = v4;
        v14 = 2112;
        v15 = v3;
        _os_log_error_impl(&dword_19BD16000, v10, OS_LOG_TYPE_ERROR, "%@: failed to create ne_session for configuration id: %@", buf, 0x16u);
      }

    }
    objc_sync_exit(v4);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

void __73__NEAppPushManager_establishSessionManagerConnectionWithConfigurationID___block_invoke(uint64_t a1, int a2)
{
  NSObject *v3;
  const char *v4;
  uint64_t v5;
  id Property;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t buf[4];
  uint64_t v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (a2 == 2)
  {
    ne_log_obj();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      v5 = *(_QWORD *)(a1 + 32);
      if (v5)
        Property = objc_getProperty(*(id *)(a1 + 32), v4, 32, 1);
      else
        Property = 0;
      objc_msgSend(Property, "identifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v11 = v5;
      v12 = 2112;
      v13 = v7;
      _os_log_impl(&dword_19BD16000, v3, OS_LOG_TYPE_INFO, "%@ cancelling nesm connection for [%@]", buf, 0x16u);

    }
    v8 = *(_QWORD *)(a1 + 32);
    if (v8)
    {
      if (*(_QWORD *)(v8 + 40))
      {
        ne_session_release();
        v9 = *(_QWORD *)(a1 + 32);
        if (v9)
          *(_QWORD *)(v9 + 40) = 0;
      }
    }
  }
  else if (a2 == 1)
  {
    ne_session_get_info();
  }
}

void __73__NEAppPushManager_establishSessionManagerConnectionWithConfigurationID___block_invoke_22(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  _BOOL8 v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (v3 && MEMORY[0x1A1ACFDA4](v3) == MEMORY[0x1E0C812F8])
  {
    v5 = xpc_dictionary_get_BOOL(v4, "IsAppPushActive");
    ne_log_obj();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = *(_QWORD *)(a1 + 32);
      v8 = *(_QWORD *)(a1 + 40);
      v9 = "[inactive]";
      if (v5)
        v9 = "[active]";
      v10 = 138412802;
      v11 = v7;
      v12 = 2112;
      v13 = v8;
      v14 = 2080;
      v15 = v9;
      _os_log_impl(&dword_19BD16000, v6, OS_LOG_TYPE_INFO, "%@ fetched extended status, new active value for [%@] is %s", (uint8_t *)&v10, 0x20u);
    }

    objc_msgSend(*(id *)(a1 + 32), "setActive:", v5);
  }

}

uint64_t __73__NEAppPushManager_establishSessionManagerConnectionWithConfigurationID___block_invoke_2(uint64_t a1, xpc_object_t xdict)
{
  _BOOL8 v3;
  NSObject *v4;
  const char *v5;
  uint64_t v6;
  id Property;
  uint64_t v8;
  void *v9;
  const char *v10;
  int v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = xpc_dictionary_get_BOOL(xdict, "IsAppPushActive");
  ne_log_obj();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v6 = *(_QWORD *)(a1 + 32);
    if (v6)
      Property = objc_getProperty(*(id *)(a1 + 32), v5, 32, 1);
    else
      Property = 0;
    objc_msgSend(Property, "identifier");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v8;
    v10 = "[inactive]";
    v12 = 138412802;
    v13 = v6;
    if (v3)
      v10 = "[active]";
    v14 = 2112;
    v15 = v8;
    v16 = 2080;
    v17 = v10;
    _os_log_impl(&dword_19BD16000, v4, OS_LOG_TYPE_INFO, "%@ fetched extended status, new active value for [%@] is %s", (uint8_t *)&v12, 0x20u);

  }
  return objc_msgSend(*(id *)(a1 + 32), "setActive:", v3);
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
    v5 = +[NEAppPushManager loadedManagers]();
    +[NEConfigurationManager sharedManager](NEConfigurationManager, "sharedManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __64__NEAppPushManager_loadAllFromPreferencesWithCompletionHandler___block_invoke;
    v7[3] = &unk_1E3CC4310;
    v9 = a1;
    v8 = v4;
    objc_msgSend(v6, "loadConfigurationsWithCompletionQueue:handler:", MEMORY[0x1E0C80D38], v7);

  }
}

void __64__NEAppPushManager_loadAllFromPreferencesWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  BOOL v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  NEAppPushManager *v21;
  uint64_t v22;
  id *v23;
  NEAppPushManager *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  id obj;
  void *v33;
  _QWORD block[4];
  id v35;
  _QWORD *v36;
  _BYTE *v37;
  _QWORD v38[4];
  _QWORD v39[2];
  NSObject *v40;
  _BYTE *v41;
  _QWORD *v42;
  uint64_t v43;
  _QWORD v44[4];
  NEAppPushManager *v45;
  NSObject *v46;
  _QWORD *v47;
  _BYTE *v48;
  uint64_t v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _QWORD v54[5];
  id v55;
  uint8_t v56[128];
  _BYTE buf[24];
  uint64_t (*v58)(uint64_t, uint64_t);
  void (*v59)(uint64_t);
  id v60;
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  obj = *(id *)(a1 + 40);
  objc_sync_enter(obj);
  v33 = v6;
  v31 = v5;
  if (v6)
  {
    ne_log_obj();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v30 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v30;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v6;
      _os_log_error_impl(&dword_19BD16000, v7, OS_LOG_TYPE_ERROR, "%@ Failed to load the configurations: %@", buf, 0x16u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v58 = __Block_byref_object_copy__6475;
    v59 = __Block_byref_object_dispose__6476;
    v60 = 0;
    v54[0] = 0;
    v54[1] = v54;
    v54[2] = 0x3032000000;
    v54[3] = __Block_byref_object_copy__6475;
    v54[4] = __Block_byref_object_dispose__6476;
    v55 = 0;
    v8 = dispatch_group_create();
    v50 = 0u;
    v51 = 0u;
    v52 = 0u;
    v53 = 0u;
    v9 = v5;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v50, v56, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v51;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v51 != v11)
            objc_enumerationMutation(v9);
          v13 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * i);
          if (v13)
          {
            objc_msgSend(*(id *)(*((_QWORD *)&v50 + 1) + 8 * i), "appPush");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = v14 == 0;

            if (!v15)
            {
              +[NEAppPushManager loadedManagers]();
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "identifier");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v16, "objectForKeyedSubscript:", v17);
              v18 = (void *)objc_claimAutoreleasedReturnValue();

              if (!*(_QWORD *)(*(_QWORD *)&buf[8] + 40))
              {
                v19 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
                v20 = *(void **)(*(_QWORD *)&buf[8] + 40);
                *(_QWORD *)(*(_QWORD *)&buf[8] + 40) = v19;

              }
              dispatch_group_enter(v8);
              if (v18)
              {
                v38[0] = MEMORY[0x1E0C809B0];
                v38[1] = 3221225472;
                v38[2] = __64__NEAppPushManager_loadAllFromPreferencesWithCompletionHandler___block_invoke_26;
                v38[3] = &unk_1E3CC0798;
                v21 = v18;
                v22 = *(_QWORD *)(a1 + 40);
                v41 = buf;
                v42 = v54;
                v43 = v22;
                v39[0] = v21;
                v39[1] = v13;
                v40 = v8;
                -[NEAppPushManager loadFromPreferencesWithCompletionHandler:](v21, "loadFromPreferencesWithCompletionHandler:", v38);

                v23 = (id *)v39;
              }
              else
              {
                v24 = objc_alloc_init(NEAppPushManager);
                +[NEConfigurationManager sharedManager](NEConfigurationManager, "sharedManager");
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v13, "identifier");
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                v27 = MEMORY[0x1E0C80D38];
                v28 = MEMORY[0x1E0C80D38];
                v44[0] = MEMORY[0x1E0C809B0];
                v44[1] = 3221225472;
                v44[2] = __64__NEAppPushManager_loadAllFromPreferencesWithCompletionHandler___block_invoke_24;
                v44[3] = &unk_1E3CC0770;
                v21 = v24;
                v29 = *(_QWORD *)(a1 + 40);
                v45 = v21;
                v49 = v29;
                v47 = v54;
                v48 = buf;
                v46 = v8;
                objc_msgSend(v25, "loadConfigurationWithID:withCompletionQueue:handler:", v26, v27, v44);

                v23 = (id *)&v45;
              }

            }
          }
        }
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v50, v56, 16);
      }
      while (v10);
    }

    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __64__NEAppPushManager_loadAllFromPreferencesWithCompletionHandler___block_invoke_27;
    block[3] = &unk_1E3CC07C0;
    v36 = v54;
    v37 = buf;
    v35 = *(id *)(a1 + 32);
    dispatch_group_notify(v8, MEMORY[0x1E0C80D38], block);

    _Block_object_dispose(v54, 8);
    _Block_object_dispose(buf, 8);

  }
  objc_sync_exit(obj);

}

void __64__NEAppPushManager_loadAllFromPreferencesWithCompletionHandler___block_invoke_24(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  const char *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  int v22;
  uint64_t v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    ne_log_obj();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v20 = *(_QWORD *)(a1 + 64);
      v22 = 138412546;
      v23 = v20;
      v24 = 2112;
      v25 = v6;
      _os_log_error_impl(&dword_19BD16000, v7, OS_LOG_TYPE_ERROR, "%@ loadConfigurationWithID failed. error: %@", (uint8_t *)&v22, 0x16u);
    }

    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a3);
  }
  else
  {
    v8 = *(void **)(a1 + 32);
    objc_msgSend(v5, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v8) = -[NEAppPushManager establishSessionManagerConnectionWithConfigurationID:](v8, v9);

    if ((v8 & 1) != 0)
    {
      v11 = *(void **)(a1 + 32);
      if (v11 && (objc_setProperty_atomic_copy(v11, v10, v5, 32), (v12 = *(_QWORD *)(a1 + 32)) != 0))
      {
        *(_BYTE *)(v12 + 9) = 1;
        v13 = *(_QWORD *)(a1 + 32);
      }
      else
      {
        v13 = 0;
      }
      +[NEAppPushManager loadedManagers]();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "identifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setObject:forKeyedSubscript:", v13, v15);

      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "addObject:", *(_QWORD *)(a1 + 32));
    }
    else
    {
      ne_log_obj();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        v21 = *(_QWORD *)(a1 + 64);
        v22 = 138412290;
        v23 = v21;
        _os_log_error_impl(&dword_19BD16000, v16, OS_LOG_TYPE_ERROR, "%@ establishSessionManagerConnectionWithConfigurationID failed.", (uint8_t *)&v22, 0xCu);
      }

      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("NEAppPushErrorDomain"), 1, 0);
      v17 = objc_claimAutoreleasedReturnValue();
      v18 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v19 = *(void **)(v18 + 40);
      *(_QWORD *)(v18 + 40) = v17;

    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));

}

void __64__NEAppPushManager_loadAllFromPreferencesWithCompletionHandler___block_invoke_26(uint64_t a1, void *a2)
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  if (v4)
  {
    ne_log_obj();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v9 = *(_QWORD *)(a1 + 72);
      v10 = 138412546;
      v11 = v9;
      v12 = 2112;
      v13 = v4;
      _os_log_error_impl(&dword_19BD16000, v5, OS_LOG_TYPE_ERROR, "%@ loadFromPreferencesWithCompletionHandler failed. error: %@", (uint8_t *)&v10, 0x16u);
    }

    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), a2);
    +[NEAppPushManager loadedManagers]();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeObjectForKey:", v7);

    -[NEAppPushManager cancelSessionManagerConnection](*(void **)(a1 + 32));
  }
  else
  {
    v8 = *(_QWORD *)(a1 + 32);
    if (v8 && *(_QWORD *)(v8 + 40))
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "addObject:");
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));

}

void __64__NEAppPushManager_loadAllFromPreferencesWithCompletionHandler___block_invoke_27(_QWORD *a1)
{
  uint64_t v2;
  void *v3;

  if (*(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "removeAllObjects");
    v2 = *(_QWORD *)(a1[6] + 8);
    v3 = *(void **)(v2 + 40);
    *(_QWORD *)(v2 + 40) = 0;

  }
  (*(void (**)(void))(a1[4] + 16))();
  objc_opt_self();
  if (!initCallKitXPCClient_client)
    dispatch_async(MEMORY[0x1E0C80D38], &__block_literal_global_6503);
}

void __40__NEAppPushManager_initCallKitXPCClient__block_invoke()
{
  NEAppPushCallKitXPCClient *v0;
  void *v1;

  v0 = objc_alloc_init(NEAppPushCallKitXPCClient);
  v1 = (void *)initCallKitXPCClient_client;
  initCallKitXPCClient_client = (uint64_t)v0;

  -[NEAppPushCallKitXPCClient registerVoIPMessagePayload](initCallKitXPCClient_client);
}

void __69__NEAppPushManager_deliverIncomingCallPayload_withCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  const char *v17;
  NSObject *v18;
  uint32_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD block[4];
  NSObject *v23;
  id v24;
  id v25;
  uint8_t buf[4];
  uint64_t v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = v7;
  v10 = *(void **)(a1 + 32);
  objc_msgSend(v9, "UUIDString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v10) = objc_msgSend(v10, "isEqualToString:", v11);

  if ((_DWORD)v10)
  {
    v12 = v8;
    ne_log_obj();
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v12)
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        v20 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138412290;
        v27 = v20;
        _os_log_debug_impl(&dword_19BD16000, v14, OS_LOG_TYPE_DEBUG, "found manager[%@] to deliver incoming call payload to", buf, 0xCu);
      }

      objc_msgSend(v12, "delegate");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v15)
      {
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __69__NEAppPushManager_deliverIncomingCallPayload_withCompletionHandler___block_invoke_42;
        block[3] = &unk_1E3CC3A30;
        v23 = v12;
        v24 = *(id *)(a1 + 40);
        v25 = *(id *)(a1 + 48);
        dispatch_async(MEMORY[0x1E0C80D38], block);

        v14 = v23;
LABEL_10:

        *a4 = 1;
        goto LABEL_11;
      }
      ne_log_obj();
      v14 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        goto LABEL_10;
      v21 = *(_QWORD *)(a1 + 56);
      *(_DWORD *)buf = 138412290;
      v27 = v21;
      v17 = "%@ app has not set the delegate to receive the incoming call payload";
      v18 = v14;
      v19 = 12;
    }
    else
    {
      if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        goto LABEL_10;
      v16 = *(_QWORD *)(a1 + 56);
      *(_DWORD *)buf = 138412546;
      v27 = v16;
      v28 = 2112;
      v29 = v9;
      v17 = "%@ failed to find a manager for configuration id [%@]";
      v18 = v14;
      v19 = 22;
    }
    _os_log_error_impl(&dword_19BD16000, v18, OS_LOG_TYPE_ERROR, v17, buf, v19);
    goto LABEL_10;
  }
LABEL_11:

}

uint64_t __69__NEAppPushManager_deliverIncomingCallPayload_withCompletionHandler___block_invoke_42(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appPushManager:didReceiveIncomingCallWithUserInfo:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

@end
