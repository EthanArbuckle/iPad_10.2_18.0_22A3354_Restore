@implementation NERelayManager

- (void)getLastClientErrors:(double)a3 completionHandler:(id)a4
{
  const char *v5;
  id v6;
  id Property;
  void *v8;
  id v9;
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (self)
    Property = objc_getProperty(self, v5, 16, 1);
  else
    Property = 0;
  v10[0] = 0;
  v10[1] = 0;
  objc_msgSend(Property, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "getUUIDBytes:", v10);

  if (ne_session_create())
  {
    v9 = v6;
    ne_session_get_info();

  }
  else
  {
    (*((void (**)(id, _QWORD))v6 + 2))(v6, 0);
  }

}

- (void)loadFromPreferencesWithCompletionHandler:(void *)completionHandler
{
  void *v4;
  NERelayManager *v5;
  const char *v6;
  void *v7;
  id Property;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;
  id *v13;
  id v14;
  _QWORD v15[5];
  id v16;
  _QWORD v17[5];
  id v18;

  v4 = completionHandler;
  if (v4)
  {
    v5 = self;
    objc_sync_enter(v5);
    if (v5 && v5->_isShared)
    {
      +[NERelayManager configurationManager]();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (id)MEMORY[0x1E0C80D38];
      v14 = MEMORY[0x1E0C80D38];
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __59__NERelayManager_loadFromPreferencesWithCompletionHandler___block_invoke;
      v17[3] = &unk_1E3CC46D0;
      v17[4] = v5;
      v18 = v4;
      objc_msgSend(v7, "loadConfigurationsWithCompletionQueue:handler:", v9, v17);
      v13 = &v18;
    }
    else
    {
      +[NERelayManager configurationManager]();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v5)
        Property = objc_getProperty(v5, v6, 16, 1);
      else
        Property = 0;
      v9 = Property;
      objc_msgSend(v9, "identifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = MEMORY[0x1E0C80D38];
      v12 = MEMORY[0x1E0C80D38];
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __59__NERelayManager_loadFromPreferencesWithCompletionHandler___block_invoke_3;
      v15[3] = &unk_1E3CC46F8;
      v15[4] = v5;
      v16 = v4;
      objc_msgSend(v7, "loadConfigurationWithID:withCompletionQueue:handler:", v10, v11, v15);
      v13 = &v16;

    }
    objc_sync_exit(v5);

  }
}

- (void)removeFromPreferencesWithCompletionHandler:(void *)completionHandler
{
  void *v4;
  NERelayManager *v5;
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
  _QWORD v16[5];
  id v17;
  _QWORD block[4];
  id v19;
  _QWORD v20[4];
  id v21;

  v4 = completionHandler;
  v5 = self;
  objc_sync_enter(v5);
  if (v5 && objc_getProperty(v5, v6, 16, 1))
  {
    v8 = objc_getProperty(v5, v7, 16, 1);
    objc_msgSend(v8, "payloadInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      +[NERelayManager configurationManager]();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_getProperty(v5, v12, 16, 1);
      v14 = MEMORY[0x1E0C80D38];
      v15 = MEMORY[0x1E0C80D38];
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __61__NERelayManager_removeFromPreferencesWithCompletionHandler___block_invoke_3;
      v16[3] = &unk_1E3CC4748;
      v16[4] = v5;
      v17 = v4;
      objc_msgSend(v11, "removeConfiguration:withCompletionQueue:handler:", v13, v14, v16);

      v10 = v17;
      goto LABEL_9;
    }
    if (v4)
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __61__NERelayManager_removeFromPreferencesWithCompletionHandler___block_invoke_2;
      block[3] = &unk_1E3CC4720;
      v19 = v4;
      dispatch_async(MEMORY[0x1E0C80D38], block);
      v10 = v19;
LABEL_9:

    }
  }
  else if (v4)
  {
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __61__NERelayManager_removeFromPreferencesWithCompletionHandler___block_invoke;
    v20[3] = &unk_1E3CC4720;
    v21 = v4;
    dispatch_async(MEMORY[0x1E0C80D38], v20);
    v10 = v21;
    goto LABEL_9;
  }
  objc_sync_exit(v5);

}

- (void)saveToPreferencesWithCompletionHandler:(void *)completionHandler
{
  void *v4;
  NERelayManager *v5;
  void *v6;
  id v7;
  void *v8;
  SEL v9;
  id v10;
  uint64_t v11;
  id v12;
  _QWORD v13[5];
  id v14;
  _QWORD block[4];
  id v16;

  v4 = completionHandler;
  v5 = self;
  objc_sync_enter(v5);
  if (v5 && v5->_hasLoaded)
  {
    v7 = +[NERelayManager loadedManagers]();
    v5->_notificationSent = 0;
    +[NERelayManager configurationManager]();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_getProperty(v5, v9, 16, 1);
    v11 = MEMORY[0x1E0C80D38];
    v12 = MEMORY[0x1E0C80D38];
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __57__NERelayManager_saveToPreferencesWithCompletionHandler___block_invoke_2;
    v13[3] = &unk_1E3CC4748;
    v13[4] = v5;
    v14 = v4;
    objc_msgSend(v8, "saveConfiguration:withCompletionQueue:handler:", v10, v11, v13);

    v6 = v14;
    goto LABEL_6;
  }
  if (v4)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __57__NERelayManager_saveToPreferencesWithCompletionHandler___block_invoke;
    block[3] = &unk_1E3CC4720;
    v16 = v4;
    dispatch_async(MEMORY[0x1E0C80D38], block);
    v6 = v16;
LABEL_6:

  }
  objc_sync_exit(v5);

}

- (BOOL)isEnabled
{
  NERelayManager *v2;
  const char *v3;
  id Property;
  id v5;
  void *v6;
  char v7;

  v2 = self;
  objc_sync_enter(v2);
  if (v2)
    Property = objc_getProperty(v2, v3, 16, 1);
  else
    Property = 0;
  v5 = Property;
  objc_msgSend(v5, "relay");
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
  NERelayManager *selfa;

  v3 = enabled;
  selfa = self;
  objc_sync_enter(selfa);
  Property = selfa;
  if (selfa)
    Property = objc_getProperty(selfa, v4, 16, 1);
  v6 = Property;
  objc_msgSend(v6, "relay");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setEnabled:", v3);

  objc_sync_exit(selfa);
}

- (NSArray)relays
{
  NERelayManager *v2;
  const char *v3;
  id Property;
  id v5;
  void *v6;
  void *v7;

  v2 = self;
  objc_sync_enter(v2);
  if (v2)
    Property = objc_getProperty(v2, v3, 16, 1);
  else
    Property = 0;
  v5 = Property;
  objc_msgSend(v5, "relay");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "relays");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v2);
  return (NSArray *)v7;
}

- (void)setRelays:(NSArray *)relays
{
  NERelayManager *v4;
  const char *v5;
  id Property;
  id v7;
  void *v8;
  NSArray *v9;

  v9 = relays;
  v4 = self;
  objc_sync_enter(v4);
  if (v4)
    Property = objc_getProperty(v4, v5, 16, 1);
  else
    Property = 0;
  v7 = Property;
  objc_msgSend(v7, "relay");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setRelays:", v9);

  objc_sync_exit(v4);
}

- (NSArray)matchDomains
{
  NERelayManager *v2;
  const char *v3;
  id Property;
  id v5;
  void *v6;
  void *v7;

  v2 = self;
  objc_sync_enter(v2);
  if (v2)
    Property = objc_getProperty(v2, v3, 16, 1);
  else
    Property = 0;
  v5 = Property;
  objc_msgSend(v5, "relay");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "matchDomains");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v2);
  return (NSArray *)v7;
}

- (void)setMatchDomains:(NSArray *)matchDomains
{
  NERelayManager *v4;
  const char *v5;
  id Property;
  id v7;
  void *v8;
  NSArray *v9;

  v9 = matchDomains;
  v4 = self;
  objc_sync_enter(v4);
  if (v4)
    Property = objc_getProperty(v4, v5, 16, 1);
  else
    Property = 0;
  v7 = Property;
  objc_msgSend(v7, "relay");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setMatchDomains:", v9);

  objc_sync_exit(v4);
}

- (NSArray)excludedDomains
{
  NERelayManager *v2;
  const char *v3;
  id Property;
  id v5;
  void *v6;
  void *v7;

  v2 = self;
  objc_sync_enter(v2);
  if (v2)
    Property = objc_getProperty(v2, v3, 16, 1);
  else
    Property = 0;
  v5 = Property;
  objc_msgSend(v5, "relay");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "excludedDomains");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v2);
  return (NSArray *)v7;
}

- (void)setExcludedDomains:(NSArray *)excludedDomains
{
  NERelayManager *v4;
  const char *v5;
  id Property;
  id v7;
  void *v8;
  NSArray *v9;

  v9 = excludedDomains;
  v4 = self;
  objc_sync_enter(v4);
  if (v4)
    Property = objc_getProperty(v4, v5, 16, 1);
  else
    Property = 0;
  v7 = Property;
  objc_msgSend(v7, "relay");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setExcludedDomains:", v9);

  objc_sync_exit(v4);
}

- (NSArray)onDemandRules
{
  NERelayManager *v2;
  const char *v3;
  id Property;
  id v5;
  void *v6;
  void *v7;

  v2 = self;
  objc_sync_enter(v2);
  if (v2)
    Property = objc_getProperty(v2, v3, 16, 1);
  else
    Property = 0;
  v5 = Property;
  objc_msgSend(v5, "relay");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "onDemandRules");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v2);
  return (NSArray *)v7;
}

- (void)setOnDemandRules:(NSArray *)onDemandRules
{
  NERelayManager *v4;
  const char *v5;
  id Property;
  id v7;
  void *v8;
  NSArray *v9;

  v9 = onDemandRules;
  v4 = self;
  objc_sync_enter(v4);
  if (v4)
    Property = objc_getProperty(v4, v5, 16, 1);
  else
    Property = 0;
  v7 = Property;
  objc_msgSend(v7, "relay");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setOnDemandRules:", v9);

  objc_sync_exit(v4);
}

- (NSString)localizedDescription
{
  NERelayManager *v2;
  const char *v3;
  id Property;
  id v5;
  void *v6;

  v2 = self;
  objc_sync_enter(v2);
  if (v2)
    Property = objc_getProperty(v2, v3, 16, 1);
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
  NERelayManager *v4;
  const char *v5;
  id Property;
  id v7;
  NSString *v8;

  v8 = localizedDescription;
  v4 = self;
  objc_sync_enter(v4);
  if (v4)
    Property = objc_getProperty(v4, v5, 16, 1);
  else
    Property = 0;
  v7 = Property;
  objc_msgSend(v7, "setName:", v8);

  objc_sync_exit(v4);
}

- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4
{
  uint64_t v5;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = *(_QWORD *)&a3;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithCapacity:", 0);
  -[NERelayManager localizedDescription](self, "localizedDescription");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", v8, CFSTR("localizedDescription"), v5, a4);

  objc_msgSend(v7, "appendPrettyBOOL:withName:andIndent:options:", -[NERelayManager isEnabled](self, "isEnabled"), CFSTR("enabled"), v5, a4);
  -[NERelayManager relays](self, "relays");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", v9, CFSTR("relays"), v5, a4);

  -[NERelayManager onDemandRules](self, "onDemandRules");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", v10, CFSTR("onDemandRules"), v5, a4);

  return v7;
}

- (id)description
{
  return -[NERelayManager descriptionWithIndent:options:](self, "descriptionWithIndent:options:", 0, 14);
}

- (NSUUID)identifier
{
  if (self)
    self = (NERelayManager *)objc_getProperty(self, a2, 16, 1);
  return -[NERelayManager identifier](self, "identifier");
}

- (NSString)appBundleIdentifier
{
  if (self)
    self = (NERelayManager *)objc_getProperty(self, a2, 16, 1);
  return (NSString *)-[NERelayManager application](self, "application");
}

- (BOOL)isFromProfile
{
  void *v2;
  BOOL v3;

  if (self)
    self = (NERelayManager *)objc_getProperty(self, a2, 16, 1);
  -[NERelayManager payloadInfo](self, "payloadInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (NERelayManagerDelegate)delegate
{
  return (NERelayManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_configuration, 0);
}

void __57__NERelayManager_saveToPreferencesWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("NERelayErrorDomain"), 3, 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

+ (id)loadedManagers
{
  uint64_t v0;
  _QWORD block[5];

  v0 = objc_opt_self();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __32__NERelayManager_loadedManagers__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = v0;
  if (loadedManagers_managers_init_24528 != -1)
    dispatch_once(&loadedManagers_managers_init_24528, block);
  return (id)loadedManagers_loadedManagers_24529;
}

+ (id)configurationManager
{
  objc_opt_self();
  if ((g_noAppFilter_24526 & 1) != 0)
    +[NEConfigurationManager sharedManagerForAllUsers](NEConfigurationManager, "sharedManagerForAllUsers");
  else
    +[NEConfigurationManager sharedManager](NEConfigurationManager, "sharedManager");
  return (id)objc_claimAutoreleasedReturnValue();
}

void __57__NERelayManager_saveToPreferencesWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  _QWORD v14[4];
  id v15;
  id v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (v3 && objc_msgSend(v3, "code") != 9)
  {
    ne_log_obj();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v18 = "-[NERelayManager saveToPreferencesWithCompletionHandler:]_block_invoke_2";
      v19 = 2112;
      v20 = v4;
      _os_log_error_impl(&dword_19BD16000, v9, OS_LOG_TYPE_ERROR, "%s: failed to save the new configuration: %@", buf, 0x16u);
    }

    if (objc_msgSend(v4, "code") == 5)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("NERelayErrorDomain"), 3, 0);
      v10 = objc_claimAutoreleasedReturnValue();

      v4 = (void *)v10;
    }
    v11 = *(_QWORD *)(a1 + 32);
    if (v11)
      *(_BYTE *)(v11 + 10) = 1;
  }
  else
  {
    v5 = *(_QWORD *)(a1 + 32);
    if (!v5 || (*(_BYTE *)(v5 + 10) & 1) == 0)
    {
      ne_log_obj();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        v13 = *(const char **)(a1 + 32);
        *(_DWORD *)buf = 138412290;
        v18 = v13;
        _os_log_debug_impl(&dword_19BD16000, v6, OS_LOG_TYPE_DEBUG, "Post NERelayConfigurationDidChangeNotification to app for manager %@", buf, 0xCu);
      }

      v7 = *(_QWORD *)(a1 + 32);
      if (v7)
        *(_BYTE *)(v7 + 10) = 1;
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "postNotificationName:object:", CFSTR("com.apple.networkextension.relay-configuration-changed"), *(_QWORD *)(a1 + 32));

    }
  }
  v12 = *(void **)(a1 + 40);
  if (v12)
  {
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __57__NERelayManager_saveToPreferencesWithCompletionHandler___block_invoke_37;
    v14[3] = &unk_1E3CC46A8;
    v16 = v12;
    v15 = v4;
    dispatch_async(MEMORY[0x1E0C80D38], v14);

  }
}

uint64_t __57__NERelayManager_saveToPreferencesWithCompletionHandler___block_invoke_37(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __32__NERelayManager_loadedManagers__block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  _QWORD v5[5];

  v2 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v3 = (void *)loadedManagers_loadedManagers_24529;
  loadedManagers_loadedManagers_24529 = (uint64_t)v2;

  +[NERelayManager configurationManager]();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __32__NERelayManager_loadedManagers__block_invoke_2;
  v5[3] = &__block_descriptor_40_e17_v16__0__NSArray_8l;
  v5[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v4, "setChangedQueue:andHandler:", MEMORY[0x1E0C80D38], v5);

}

void __32__NERelayManager_loadedManagers__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  uint8_t v13[8];
  _QWORD v14[4];
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v17;
    v7 = MEMORY[0x1E0C809B0];
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v17 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend((id)loadedManagers_loadedManagers_24529, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v8));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9
          || (objc_msgSend(*(id *)(a1 + 32), "sharedManager"), (v9 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
        {
          v14[0] = v7;
          v14[1] = 3221225472;
          v14[2] = __32__NERelayManager_loadedManagers__block_invoke_3;
          v14[3] = &unk_1E3CC45C8;
          v15 = v9;
          v10 = v9;
          objc_msgSend(v10, "loadFromPreferencesWithCompletionHandler:", v14);

        }
        else
        {
          ne_log_obj();
          v11 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)v13 = 0;
            _os_log_debug_impl(&dword_19BD16000, v11, OS_LOG_TYPE_DEBUG, "Post NERelayConfigurationDidChangeNotification to app", v13, 2u);
          }

          objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
          v10 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "postNotificationName:object:", CFSTR("com.apple.networkextension.relay-configuration-changed"), 0);
        }

        ++v8;
      }
      while (v5 != v8);
      v12 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      v5 = v12;
    }
    while (v12);
  }

}

void __32__NERelayManager_loadedManagers__block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  if (!v2 || (*(_BYTE *)(v2 + 10) & 1) == 0)
  {
    ne_log_obj();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      v6 = *(_QWORD *)(a1 + 32);
      v7 = 138412290;
      v8 = v6;
      _os_log_debug_impl(&dword_19BD16000, v3, OS_LOG_TYPE_DEBUG, "Post NERelayConfigurationDidChangeNotification to app for manager %@", (uint8_t *)&v7, 0xCu);
    }

    v4 = *(_QWORD *)(a1 + 32);
    if (v4)
      *(_BYTE *)(v4 + 10) = 1;
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "postNotificationName:object:", CFSTR("com.apple.networkextension.relay-configuration-changed"), *(_QWORD *)(a1 + 32));

  }
}

void __61__NERelayManager_removeFromPreferencesWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("NERelayErrorDomain"), 3, 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

void __61__NERelayManager_removeFromPreferencesWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("NERelayErrorDomain"), 4, 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

void __61__NERelayManager_removeFromPreferencesWithCompletionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  const char *v3;
  id v4;
  NSObject *v5;
  void *v6;
  const char *v7;
  void *v8;
  id Property;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  const char *v16;
  _QWORD v17[4];
  id v18;
  id v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  if (v4)
  {
    ne_log_obj();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v21 = "-[NERelayManager removeFromPreferencesWithCompletionHandler:]_block_invoke_3";
      v22 = 2112;
      v23 = v4;
      _os_log_error_impl(&dword_19BD16000, v5, OS_LOG_TYPE_ERROR, "%s: failed to remove the configuration: %@", buf, 0x16u);
    }

  }
  v6 = *(void **)(a1 + 32);
  if (!v6)
    goto LABEL_12;
  if (objc_getProperty(v6, v3, 16, 1))
  {
    +[NERelayManager loadedManagers]();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    Property = *(id *)(a1 + 32);
    if (Property)
      Property = objc_getProperty(Property, v7, 16, 1);
    objc_msgSend(Property, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeObjectForKey:", v10);

  }
  v11 = *(_QWORD *)(a1 + 32);
  if (!v11 || (*(_BYTE *)(v11 + 10) & 1) == 0)
  {
LABEL_12:
    ne_log_obj();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      v16 = *(const char **)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      v21 = v16;
      _os_log_debug_impl(&dword_19BD16000, v12, OS_LOG_TYPE_DEBUG, "Post NERelayConfigurationDidChangeNotification to app for manager %@", buf, 0xCu);
    }

    v13 = *(_QWORD *)(a1 + 32);
    if (v13)
      *(_BYTE *)(v13 + 10) = 1;
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "postNotificationName:object:", CFSTR("com.apple.networkextension.relay-configuration-changed"), *(_QWORD *)(a1 + 32));

  }
  v15 = *(void **)(a1 + 40);
  if (v15)
  {
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __61__NERelayManager_removeFromPreferencesWithCompletionHandler___block_invoke_36;
    v17[3] = &unk_1E3CC46A8;
    v19 = v15;
    v18 = v4;
    dispatch_async(MEMORY[0x1E0C80D38], v17);

  }
}

uint64_t __61__NERelayManager_removeFromPreferencesWithCompletionHandler___block_invoke_36(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __59__NERelayManager_loadFromPreferencesWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  BOOL v14;
  void *v15;
  BOOL v16;
  id v17;
  const char *v18;
  void *v19;
  uint64_t v20;
  const char *v21;
  void *v22;
  id Property;
  id v24;
  void *v25;
  uint64_t v26;
  void *v27;
  id v28;
  _QWORD block[4];
  id v30;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v28 = a2;
  v5 = a3;
  v6 = *(id *)(a1 + 32);
  objc_sync_enter(v6);
  if (v5)
    goto LABEL_26;
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v7 = v28;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
  if (v8)
  {
    v9 = 0;
    v10 = *(_QWORD *)v33;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v33 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
        objc_msgSend(v12, "relay");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v13 == 0;

        if (!v14)
        {
          objc_msgSend(v12, "payloadInfo");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = v15 == 0;

          if (!v16)
          {
            v17 = v12;

            v9 = v17;
            goto LABEL_15;
          }
          if (!v9)
            v9 = v12;
        }
      }
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
      if (v8)
        continue;
      break;
    }
LABEL_15:

    if (v9)
    {
      v19 = *(void **)(a1 + 32);
      if (v19)
      {
        objc_setProperty_atomic(v19, v18, v9, 16);
        v20 = *(_QWORD *)(a1 + 32);
      }
      else
      {
        v20 = 0;
      }
      +[NERelayManager loadedManagers]();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      Property = *(id *)(a1 + 32);
      if (Property)
        Property = objc_getProperty(Property, v21, 16, 1);
      v24 = Property;
      objc_msgSend(v24, "identifier");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setObject:forKeyedSubscript:", v20, v25);

      goto LABEL_23;
    }
  }
  else
  {

  }
  -[NERelayManager createEmptyConfigurationWithGrade:](*(void **)(a1 + 32));
  v9 = 0;
LABEL_23:
  v26 = *(_QWORD *)(a1 + 32);
  if (v26)
    *(_BYTE *)(v26 + 9) = 1;

LABEL_26:
  v27 = *(void **)(a1 + 40);
  if (v27)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __59__NERelayManager_loadFromPreferencesWithCompletionHandler___block_invoke_2;
    block[3] = &unk_1E3CC46A8;
    v31 = v27;
    v30 = v5;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
  objc_sync_exit(v6);

}

void __59__NERelayManager_loadFromPreferencesWithCompletionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  const char *v8;
  NSObject *v9;
  void *v10;
  id v11;
  uint64_t v12;
  const char *v13;
  void *v14;
  id Property;
  id v16;
  void *v17;
  id v18;
  void *v19;
  const char *v20;
  id v21;
  uint64_t v22;
  int v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = *(id *)(a1 + 32);
  objc_sync_enter(v7);
  if (v6)
  {
    ne_log_obj();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v23 = 138412290;
      v24 = v6;
      _os_log_error_impl(&dword_19BD16000, v9, OS_LOG_TYPE_ERROR, "Failed to load the configuration: %@", (uint8_t *)&v23, 0xCu);
    }

    +[NERelayManager mapError:]((uint64_t)NERelayManager, v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    v11 = *(id *)(a1 + 32);
    if (v5)
    {
      if (v11)
      {
        objc_setProperty_atomic(v11, v8, v5, 16);
        v12 = *(_QWORD *)(a1 + 32);
      }
      else
      {
        v12 = 0;
      }
      +[NERelayManager loadedManagers]();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      Property = *(id *)(a1 + 32);
      if (Property)
        Property = objc_getProperty(Property, v13, 16, 1);
      v16 = Property;
      objc_msgSend(v16, "identifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setObject:forKeyedSubscript:", v12, v17);
    }
    else
    {
      if (v11)
        v11 = objc_getProperty(v11, v8, 16, 1);
      v18 = v11;
      objc_msgSend(v18, "relay");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setEnabled:", 0);

      +[NERelayManager loadedManagers]();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = *(id *)(a1 + 32);
      if (v21)
        v21 = objc_getProperty(v21, v20, 16, 1);
      v16 = v21;
      objc_msgSend(v16, "identifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "removeObjectForKey:", v17);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    v22 = *(_QWORD *)(a1 + 32);
    v10 = 0;
    if (v22)
      *(_BYTE *)(v22 + 9) = 1;
  }
  objc_sync_exit(v7);

}

+ (id)mapError:(uint64_t)a1
{
  id v2;
  void *v3;
  int v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v11;
  void *v12;
  uint8_t buf[8];
  uint64_t v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v2 = a2;
  objc_opt_self();
  objc_msgSend(v2, "domain");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", CFSTR("NEConfigurationErrorDomain"));

  if (v4)
  {
    switch(objc_msgSend(v2, "code"))
    {
      case 1:
      case 2:
      case 3:
      case 4:
      case 6:
      case 7:
      case 8:
      case 10:
      case 11:
      case 12:
      case 20:
      case 21:
        objc_msgSend(v2, "localizedDescription");
        v5 = objc_claimAutoreleasedReturnValue();
        goto LABEL_5;
      case 5:
        objc_msgSend(v2, "localizedDescription");
        v5 = objc_claimAutoreleasedReturnValue();
        v6 = 3;
        goto LABEL_6;
      case 9:
        ne_log_obj();
        v5 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_19BD16000, v5, OS_LOG_TYPE_DEFAULT, "The configuration was not saved because it was unchanged from the previously saved version", buf, 2u);
        }
        v9 = 0;
        break;
      default:
        v11 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v2, "localizedDescription");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "stringWithFormat:", CFSTR("Unknown: %@"), v12);
        v5 = objc_claimAutoreleasedReturnValue();

        goto LABEL_5;
    }
  }
  else
  {
    v5 = CFSTR("Unknown.");
LABEL_5:
    v6 = 1;
LABEL_6:
    v7 = (void *)MEMORY[0x1E0CB35C8];
    v14 = *MEMORY[0x1E0CB2D50];
    v15[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "errorWithDomain:code:userInfo:", CFSTR("NERelayErrorDomain"), v6, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v9;
}

- (void)createEmptyConfigurationWithGrade:(void *)a1
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NEConfiguration *v8;
  SEL v9;
  NERelayConfiguration *v10;
  SEL v11;
  SEL v12;
  SEL v13;
  id v14;

  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "infoDictionary");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKey:", *MEMORY[0x1E0C9AAC8]);
    v14 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bundleIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v14)
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "infoDictionary");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKey:", *MEMORY[0x1E0C9AE88]);
      v14 = (id)objc_claimAutoreleasedReturnValue();

    }
    v8 = -[NEConfiguration initWithName:grade:]([NEConfiguration alloc], "initWithName:grade:", v14, 2);
    objc_setProperty_atomic(a1, v9, v8, 16);

    v10 = objc_alloc_init(NERelayConfiguration);
    objc_msgSend(objc_getProperty(a1, v11, 16, 1), "setRelay:", v10);

    objc_msgSend(objc_getProperty(a1, v12, 16, 1), "setApplication:", v5);
    objc_msgSend(objc_getProperty(a1, v13, 16, 1), "setApplicationName:", v14);

  }
}

uint64_t __59__NERelayManager_loadFromPreferencesWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __56__NERelayManager_getLastClientErrors_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  _QWORD v6[6];
  _QWORD v7[5];
  id v8;

  v3 = a2;
  v4 = v3;
  if (v3 && MEMORY[0x1A1ACFDA4](v3) == MEMORY[0x1E0C812F8])
  {
    v7[0] = 0;
    v7[1] = v7;
    v7[2] = 0x3032000000;
    v7[3] = __Block_byref_object_copy__24549;
    v7[4] = __Block_byref_object_dispose__24550;
    v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    xpc_dictionary_get_array(v4, "SortedRelayErrors");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __56__NERelayManager_getLastClientErrors_completionHandler___block_invoke_20;
    v6[3] = &unk_1E3CC4658;
    v6[5] = *(_QWORD *)(a1 + 40);
    v6[4] = v7;
    xpc_array_apply(v5, v6);
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

    _Block_object_dispose(v7, 8);
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

uint64_t __56__NERelayManager_getLastClientErrors_completionHandler___block_invoke_20(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  int64_t int64;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;

  v4 = a3;
  v5 = v4;
  if (!v4 || MEMORY[0x1A1ACFDA4](v4) != MEMORY[0x1E0C812F8])
  {
LABEL_18:
    v13 = 1;
    goto LABEL_19;
  }
  v6 = xpc_dictionary_get_double(v5, "TimeEpoch");
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "timeIntervalSince1970");
  v9 = v8 - v6;
  v10 = *(double *)(a1 + 40);

  if (v9 <= v10)
  {
    int64 = xpc_dictionary_get_int64(v5, "LastCause");
    switch(int64)
    {
      case 17:
        v12 = 2;
        break;
      case 18:
      case 19:
      case 22:
      case 23:
      case 26:
      case 29:
        goto LABEL_9;
      case 20:
        v12 = 3;
        break;
      case 21:
        v12 = 4;
        break;
      case 24:
        v12 = 5;
        break;
      case 25:
        v12 = 6;
        break;
      case 27:
        v12 = 7;
        break;
      case 28:
        v12 = 8;
        break;
      case 30:
        v12 = 9;
        break;
      default:
        if (int64)
LABEL_9:
          v12 = 10;
        else
          v12 = 1;
        break;
    }
    v14 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("NERelayErrorDomain"), v12, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObject:", v15);

    goto LABEL_18;
  }
  v13 = 0;
LABEL_19:

  return v13;
}

- (_BYTE)initWithGrade:(void *)a1
{
  _BYTE *v1;
  NSObject *v2;
  void *v4;
  id v5;
  objc_super v6;
  uint8_t buf[4];
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v6.receiver = a1;
  v6.super_class = (Class)NERelayManager;
  v1 = objc_msgSendSuper2(&v6, sel_init);
  if (v1)
  {
    if (!+[NEProvider isRunningInProvider](NEProvider, "isRunningInProvider"))
    {
      v1[10] = 0;
      -[NERelayManager createEmptyConfigurationWithGrade:](v1);
      return v1;
    }
    ne_log_obj();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      v4 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138412290;
      v8 = v4;
      v5 = v4;
      _os_log_error_impl(&dword_19BD16000, v2, OS_LOG_TYPE_ERROR, "%@ objects cannot be instantiated from NEProvider processes", buf, 0xCu);

    }
    return 0;
  }
  return v1;
}

+ (NERelayManager)sharedManager
{
  void *v2;
  id v3;

  if (sharedManager_onceToken_24565 != -1)
    dispatch_once(&sharedManager_onceToken_24565, &__block_literal_global_24566);
  v2 = (void *)sharedManager_gRelayManager;
  if (sharedManager_gRelayManager)
    v3 = (id)sharedManager_gRelayManager;
  return (NERelayManager *)v2;
}

+ (void)loadAllManagersFromPreferencesWithCompletionHandler:(void *)completionHandler
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v3 = completionHandler;
  v4 = +[NERelayManager loadedManagers]();
  +[NERelayManager configurationManager]();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __70__NERelayManager_loadAllManagersFromPreferencesWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E3CC4630;
  v8 = v3;
  v6 = v3;
  objc_msgSend(v5, "loadConfigurationsWithCompletionQueue:handler:", MEMORY[0x1E0C80D38], v7);

}

+ (void)loadAllFromPreferencesWithCompletionHandler:(id)a3
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;

  v3 = a3;
  objc_opt_self();
  g_noAppFilter_24526 = 1;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __62__NERelayManager_loadAllFromPreferencesWithCompletionHandler___block_invoke;
  v5[3] = &unk_1E3CC4630;
  v6 = v3;
  v4 = v3;
  +[NERelayManager loadAllManagersFromPreferencesWithCompletionHandler:](NERelayManager, "loadAllManagersFromPreferencesWithCompletionHandler:", v5);

}

uint64_t __62__NERelayManager_loadAllFromPreferencesWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __70__NERelayManager_loadAllManagersFromPreferencesWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  NERelayManager *v16;
  id v17;
  id v18;
  _BYTE *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  id v24;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  objc_super v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (a3)
  {
    +[NERelayManager mapError:]((uint64_t)NERelayManager, a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1 + 32);
    v8 = objc_alloc_init(MEMORY[0x1E0C99D20]);
    (*(void (**)(uint64_t, id, void *))(v7 + 16))(v7, v8, v6);

  }
  else
  {
    v24 = v5;
    v25 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v9 = v5;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v27;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v27 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v14, "relay");
            v15 = (void *)objc_claimAutoreleasedReturnValue();

            if (v15)
            {
              v16 = [NERelayManager alloc];
              v17 = v14;
              if (v16
                && (v30.receiver = v16,
                    v30.super_class = (Class)NERelayManager,
                    (v18 = objc_msgSendSuper2(&v30, sel_init)) != 0))
              {
                v19 = v18;
                objc_storeStrong((id *)v18 + 2, v14);

                v19[9] = 1;
              }
              else
              {

                v19 = 0;
              }
              objc_msgSend(v25, "addObject:", v19);
              +[NERelayManager loadedManagers]();
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "identifier");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v20, "setObject:forKeyedSubscript:", v19, v21);

            }
          }
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
      }
      while (v11);
    }

    v22 = *(_QWORD *)(a1 + 32);
    v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithArray:", v25);
    (*(void (**)(uint64_t, void *, _QWORD))(v22 + 16))(v22, v23, 0);

    v5 = v24;
  }

}

id __31__NERelayManager_sharedManager__block_invoke()
{
  _BYTE *v0;
  void *v1;

  if (NEInitCFTypes_onceToken != -1)
    dispatch_once(&NEInitCFTypes_onceToken, &__block_literal_global_22195);
  v0 = -[NERelayManager initWithGrade:]([NERelayManager alloc]);
  v1 = (void *)sharedManager_gRelayManager;
  sharedManager_gRelayManager = (uint64_t)v0;

  if (sharedManager_gRelayManager)
    *(_BYTE *)(sharedManager_gRelayManager + 8) = 1;
  return +[NERelayManager loadedManagers]();
}

@end
