@implementation ATXDNDModeConfigurationClient

- (id)_init
{
  ATXDNDModeConfigurationClient *v2;
  uint64_t v3;
  DNDModeConfigurationService *dndConfigurationService;
  uint64_t v5;
  DNDGlobalConfigurationService *dndGlobalConfigurationService;
  ATXDNDModeConfigurationClientListener *v7;
  DNDModeConfigurationServiceListener *updateListener;
  uint64_t v9;
  NSHashTable *observers;
  NSObject *v11;
  dispatch_queue_t v12;
  OS_dispatch_queue *observerQueue;
  DNDModeConfigurationService *v14;
  DNDModeConfigurationServiceListener *v15;
  _QWORD v17[4];
  id v18;
  id location;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)ATXDNDModeConfigurationClient;
  v2 = -[ATXDNDModeConfigurationClient init](&v20, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0D1D688], "serviceForClientIdentifier:", CFSTR("com.apple.proactive.AppPredictionClient"));
    v3 = objc_claimAutoreleasedReturnValue();
    dndConfigurationService = v2->_dndConfigurationService;
    v2->_dndConfigurationService = (DNDModeConfigurationService *)v3;

    objc_msgSend(MEMORY[0x1E0D1D5E0], "serviceForClientIdentifier:", CFSTR("com.apple.proactive.AppPredictionClient"));
    v5 = objc_claimAutoreleasedReturnValue();
    dndGlobalConfigurationService = v2->_dndGlobalConfigurationService;
    v2->_dndGlobalConfigurationService = (DNDGlobalConfigurationService *)v5;

    v7 = -[ATXDNDModeConfigurationClientListener initWithDelegate:]([ATXDNDModeConfigurationClientListener alloc], "initWithDelegate:", v2);
    updateListener = v2->_updateListener;
    v2->_updateListener = (DNDModeConfigurationServiceListener *)v7;

    v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3690]), "initWithOptions:capacity:", 517, 0);
    observers = v2->_observers;
    v2->_observers = (NSHashTable *)v9;

    dispatch_queue_attr_make_with_autorelease_frequency(MEMORY[0x1E0C80D50], DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = dispatch_queue_create("ATXDNDModeConfigurationClient.observerQueue", v11);
    observerQueue = v2->_observerQueue;
    v2->_observerQueue = (OS_dispatch_queue *)v12;

    objc_initWeak(&location, v2);
    v14 = v2->_dndConfigurationService;
    v15 = v2->_updateListener;
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __38__ATXDNDModeConfigurationClient__init__block_invoke;
    v17[3] = &unk_1E4D5AAA8;
    objc_copyWeak(&v18, &location);
    -[DNDModeConfigurationService addListener:withCompletionHandler:](v14, "addListener:withCompletionHandler:", v15, v17);
    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }
  return v2;
}

void __38__ATXDNDModeConfigurationClient__init__block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  id *v6;
  id WeakRetained;
  NSObject *v8;

  v5 = a3;
  if (v5 || (a2 & 1) == 0)
  {
    v6 = (id *)(a1 + 32);
    WeakRetained = objc_loadWeakRetained(v6);
    objc_msgSend(WeakRetained, "invalidateCaches");

    __atxlog_handle_modes();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __38__ATXDNDModeConfigurationClient__init__block_invoke_cold_1(v6);

  }
}

+ (ATXDNDModeConfigurationClient)sharedInstance
{
  if (sharedInstance__pasOnceToken8 != -1)
    dispatch_once(&sharedInstance__pasOnceToken8, &__block_literal_global_62);
  return (ATXDNDModeConfigurationClient *)(id)sharedInstance__pasExprOnceResult_11;
}

void __47__ATXDNDModeConfigurationClient_sharedInstance__block_invoke()
{
  void *v0;
  id v1;
  void *v2;

  v0 = (void *)MEMORY[0x1A85A4F90]();
  v1 = -[ATXDNDModeConfigurationClient _init]([ATXDNDModeConfigurationClient alloc], "_init");
  v2 = (void *)sharedInstance__pasExprOnceResult_11;
  sharedInstance__pasExprOnceResult_11 = (uint64_t)v1;

  objc_autoreleasePoolPop(v0);
}

- (void)refreshCachedConfigs
{
  objc_class *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v0 = (objc_class *)objc_opt_class();
  NSStringFromClass(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_1_3(&dword_1A49EF000, v2, v3, "[%@] Failed to fetch configs with error %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_5_0();
}

- (void)invalidateCaches
{
  ATXDNDModeConfigurationClient *obj;

  obj = self;
  objc_sync_enter(obj);
  obj->_isCacheValid = 0;
  objc_sync_exit(obj);

}

- (id)appConfigurationsForModeIdentifier:(id)a3 error:(id *)a4
{
  return (id)-[DNDModeConfigurationService getAppConfigurationActionsForModeIdentifier:error:](self->_dndConfigurationService, "getAppConfigurationActionsForModeIdentifier:error:", a3, a4);
}

- (id)configuredModes
{
  ATXDNDModeConfigurationClient *v2;
  NSDictionary *v3;

  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_isCacheValid)
    -[ATXDNDModeConfigurationClient refreshCachedConfigs](v2, "refreshCachedConfigs");
  v3 = v2->_cachedModeConfig;
  objc_sync_exit(v2);

  return v3;
}

- (id)modesByModeIdentifiers
{
  ATXDNDModeConfigurationClient *v2;
  NSDictionary *v3;

  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_isCacheValid)
    -[ATXDNDModeConfigurationClient refreshCachedConfigs](v2, "refreshCachedConfigs");
  v3 = v2->_cachedModesByModeIdentifiers;
  objc_sync_exit(v2);

  return v3;
}

- (id)_configuredModesBySemanticType
{
  ATXDNDModeConfigurationClient *v2;
  NSDictionary *v3;

  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_isCacheValid)
    -[ATXDNDModeConfigurationClient refreshCachedConfigs](v2, "refreshCachedConfigs");
  v3 = v2->_cachedModesBySemanticType;
  objc_sync_exit(v2);

  return v3;
}

- (id)dndModeForDNDModeWithUUID:(id)a3
{
  return -[ATXDNDModeConfigurationClient dndModeForDNDModeWithUUID:useCache:](self, "dndModeForDNDModeWithUUID:useCache:", a3, 1);
}

- (id)dndModeForDNDModeWithUUID:(id)a3 useCache:(BOOL)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  int v12;
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (!a4)
  {
    __atxlog_handle_notification_management();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 136315138;
      v13 = "-[ATXDNDModeConfigurationClient dndModeForDNDModeWithUUID:useCache:]";
      _os_log_impl(&dword_1A49EF000, v7, OS_LOG_TYPE_DEFAULT, "%s: Invalidating cache in order to mitigate stale cache bugs", (uint8_t *)&v12, 0xCu);
    }

    -[ATXDNDModeConfigurationClient invalidateCaches](self, "invalidateCaches");
  }
  -[ATXDNDModeConfigurationClient configuredModes](self, "configuredModes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  v10 = 0;
  if (v6)
  {
    if (v8)
    {
      objc_msgSend(v8, "objectForKeyedSubscript:", v6);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
      {
        objc_msgSend(v9, "objectForKeyedSubscript:", v6);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
      }
    }
  }

  return v10;
}

- (unint64_t)atxModeForDNDMode:(id)a3
{
  void *v4;
  void *v5;
  unint64_t v6;

  -[ATXDNDModeConfigurationClient dndModeForDNDModeWithUUID:](self, "dndModeForDNDModeWithUUID:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
    v6 = -[ATXDNDModeConfigurationClient atxModeForDNDSemanticType:](self, "atxModeForDNDSemanticType:", objc_msgSend(v4, "semanticType"));
  else
    v6 = 0;

  return v6;
}

- (unint64_t)atxModeForDNDSemanticType:(int64_t)a3
{
  if ((unint64_t)(a3 + 1) > 0xA)
    return 0;
  else
    return qword_1A4B66E70[a3 + 1];
}

- (id)dndModeUUIDForDNDModeIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;

  v4 = a3;
  -[ATXDNDModeConfigurationClient modesByModeIdentifiers](self, "modesByModeIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4
    && v5
    && (objc_msgSend(v5, "objectForKeyedSubscript:", v4),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v7,
        v7))
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    __atxlog_handle_notification_management();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[ATXDNDModeConfigurationClient dndModeUUIDForDNDModeIdentifier:].cold.1();

    v9 = (void *)objc_opt_new();
  }

  return v9;
}

- (id)dndModeUUIDForDNDModeSemanticType:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;

  -[ATXDNDModeConfigurationClient _configuredModesBySemanticType](self, "_configuredModesBySemanticType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if ((unint64_t)objc_msgSend(v6, "count") < 2)
  {
    objc_msgSend(v6, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    __atxlog_handle_notification_management();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      -[ATXDNDModeConfigurationClient dndModeUUIDForDNDModeSemanticType:].cold.1(a3, v7);

    v8 = 0;
  }

  return v8;
}

- (id)dndSemanticTypeForATXMode:(unint64_t)a3
{
  if (a3 - 1 > 0xE)
    return 0;
  else
    return (id)qword_1E4D5AB18[a3 - 1];
}

- (id)dndModeForATXMode:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[ATXDNDModeConfigurationClient dndSemanticTypeForATXMode:](self, "dndSemanticTypeForATXMode:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[ATXDNDModeConfigurationClient _configuredModesBySemanticType](self, "_configuredModesBySemanticType");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)debug_allModeDescriptions
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[5];

  -[ATXDNDModeConfigurationClient configuredModes](self, "configuredModes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __58__ATXDNDModeConfigurationClient_debug_allModeDescriptions__block_invoke;
  v7[3] = &unk_1E4D5AAD0;
  v7[4] = self;
  objc_msgSend(v4, "_pas_mappedArrayWithTransform:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __58__ATXDNDModeConfigurationClient_debug_allModeDescriptions__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = a2;
  objc_msgSend(v4, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v4, "semanticType");
  v9 = *(void **)(a1 + 32);
  v10 = objc_msgSend(v4, "semanticType");

  ATXModeToString(objc_msgSend(v9, "atxModeForDNDSemanticType:", v10));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("Mode Name: %@, UUID: %@, Semantic Type: %ld, ATXMode: %@"), v5, v7, v8, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)iOSAppAllowListForMode:(int64_t)a3
{
  return -[ATXDNDModeConfigurationClient iOSAppListForMode:configurationType:](self, "iOSAppListForMode:configurationType:", a3, 0);
}

- (id)iOSAppDenyListForMode:(int64_t)a3
{
  return -[ATXDNDModeConfigurationClient iOSAppListForMode:configurationType:](self, "iOSAppListForMode:configurationType:", a3, 1);
}

- (id)iOSAppListForMode:(int64_t)a3 configurationType:(unint64_t)a4
{
  DNDModeConfigurationService *dndConfigurationService;
  void *v7;
  id v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  _QWORD v13[4];
  NSObject *v14;
  int64_t v15;
  unint64_t v16;
  id v17;

  dndConfigurationService = self->_dndConfigurationService;
  v17 = 0;
  -[DNDModeConfigurationService modeConfigurationsReturningError:](dndConfigurationService, "modeConfigurationsReturningError:", &v17);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v17;
  if (v7)
  {
    v9 = (void *)objc_opt_new();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __69__ATXDNDModeConfigurationClient_iOSAppListForMode_configurationType___block_invoke;
    v13[3] = &unk_1E4D5AAF8;
    v15 = a3;
    v16 = a4;
    v10 = v9;
    v14 = v10;
    objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", v13);
    v11 = v14;
  }
  else
  {
    __atxlog_handle_notification_management();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[ATXDNDModeConfigurationClient iOSAppListForMode:configurationType:].cold.1();
    v10 = 0;
  }

  return v10;
}

void __69__ATXDNDModeConfigurationClient_iOSAppListForMode_configurationType___block_invoke(_QWORD *a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "mode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "semanticType");
  v7 = a1[5];

  if (v6 == v7)
  {
    objc_msgSend(v4, "configuration");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "applicationConfigurationType");
    v10 = a1[6];

    if (v9 == v10)
    {
      v22 = 0u;
      v23 = 0u;
      v20 = 0u;
      v21 = 0u;
      objc_msgSend(v4, "configuration", 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "applicationsWithExceptions");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      if (v13)
      {
        v14 = v13;
        v15 = *(_QWORD *)v21;
        do
        {
          for (i = 0; i != v14; ++i)
          {
            if (*(_QWORD *)v21 != v15)
              objc_enumerationMutation(v12);
            v17 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
            if (objc_msgSend(v17, "platform") == 1)
            {
              v18 = (void *)a1[4];
              objc_msgSend(v17, "bundleID");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "addObject:", v19);

            }
          }
          v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
        }
        while (v14);
      }

    }
  }

}

- (id)iOSContactAllowListForMode:(int64_t)a3
{
  return -[ATXDNDModeConfigurationClient iOSContactListForMode:configurationType:](self, "iOSContactListForMode:configurationType:", a3, 0);
}

- (id)iOSContactDenyListForMode:(int64_t)a3
{
  return -[ATXDNDModeConfigurationClient iOSContactListForMode:configurationType:](self, "iOSContactListForMode:configurationType:", a3, 1);
}

- (id)iOSContactListForMode:(int64_t)a3 configurationType:(unint64_t)a4
{
  DNDModeConfigurationService *dndConfigurationService;
  void *v7;
  id v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  _QWORD v13[4];
  NSObject *v14;
  int64_t v15;
  unint64_t v16;
  id v17;

  dndConfigurationService = self->_dndConfigurationService;
  v17 = 0;
  -[DNDModeConfigurationService modeConfigurationsReturningError:](dndConfigurationService, "modeConfigurationsReturningError:", &v17);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v17;
  if (v7)
  {
    v9 = (void *)objc_opt_new();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __73__ATXDNDModeConfigurationClient_iOSContactListForMode_configurationType___block_invoke;
    v13[3] = &unk_1E4D5AAF8;
    v15 = a3;
    v16 = a4;
    v10 = v9;
    v14 = v10;
    objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", v13);
    v11 = v14;
  }
  else
  {
    __atxlog_handle_notification_management();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[ATXDNDModeConfigurationClient iOSContactListForMode:configurationType:].cold.1();
    v10 = 0;
  }

  return v10;
}

void __73__ATXDNDModeConfigurationClient_iOSContactListForMode_configurationType___block_invoke(_QWORD *a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[4];
  void *v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "mode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "semanticType");
  v7 = a1[5];

  if (v6 == v7)
  {
    objc_msgSend(v4, "configuration");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "senderConfigurationType");
    v10 = a1[6];

    if (v9 == v10)
    {
      v23 = 0u;
      v24 = 0u;
      v21 = 0u;
      v22 = 0u;
      objc_msgSend(v4, "configuration");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "contactsWithExceptions");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
      if (v13)
      {
        v14 = v13;
        v15 = *(_QWORD *)v22;
        do
        {
          for (i = 0; i != v14; ++i)
          {
            if (*(_QWORD *)v22 != v15)
              objc_enumerationMutation(v12);
            v17 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
            objc_msgSend(v17, "contactIdentifier");
            v18 = (void *)objc_claimAutoreleasedReturnValue();

            if (v18)
            {
              v19 = (void *)a1[4];
              objc_msgSend(v17, "contactIdentifier");
              v20 = objc_claimAutoreleasedReturnValue();
              objc_msgSend(v19, "addObject:", v20);
            }
            else
            {
              __atxlog_handle_notification_management();
              v20 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412290;
                v26 = v17;
                _os_log_impl(&dword_1A49EF000, v20, OS_LOG_TYPE_INFO, "Contact Identifier for %@ is nil. Skipping to next", buf, 0xCu);
              }
            }

          }
          v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
        }
        while (v14);
      }

    }
  }

}

- (id)modeConfigurationForDNDModeWithUUID:(id)a3
{
  return -[ATXDNDModeConfigurationClient modeConfigurationForDNDModeWithUUID:useCache:](self, "modeConfigurationForDNDModeWithUUID:useCache:", a3, 1);
}

- (id)modeConfigurationForDNDModeWithUUID:(id)a3 useCache:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  DNDModeConfigurationService *dndConfigurationService;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  id v15;

  v4 = a4;
  v6 = a3;
  -[ATXDNDModeConfigurationClient dndModeForDNDModeWithUUID:useCache:](self, "dndModeForDNDModeWithUUID:useCache:", v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "modeIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    dndConfigurationService = self->_dndConfigurationService;
    v15 = 0;
    -[DNDModeConfigurationService modeConfigurationForModeIdentifier:error:](dndConfigurationService, "modeConfigurationForModeIdentifier:error:", v8, &v15);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v15;
    v12 = v11;
    if (!v10 && v11)
    {
      __atxlog_handle_notification_management();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        -[ATXDNDModeConfigurationClient modeConfigurationForDNDModeWithUUID:useCache:].cold.2((uint64_t)v8, (uint64_t)v12, v13);

    }
  }
  else
  {
    __atxlog_handle_notification_management();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[ATXDNDModeConfigurationClient modeConfigurationForDNDModeWithUUID:useCache:].cold.1();
    v10 = 0;
  }

  return v10;
}

- (id)getAllModeConfigurationsWithoutCache
{
  DNDModeConfigurationService *dndConfigurationService;
  void *v3;
  id v4;
  NSObject *v5;
  id v6;
  id v8;

  dndConfigurationService = self->_dndConfigurationService;
  v8 = 0;
  -[DNDModeConfigurationService modeConfigurationsReturningError:](dndConfigurationService, "modeConfigurationsReturningError:", &v8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v8;
  if (v4)
  {
    __atxlog_handle_notification_management();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[ATXDNDModeConfigurationClient getAllModeConfigurationsWithoutCache].cold.1();

    v6 = 0;
  }
  else
  {
    v6 = v3;
  }

  return v6;
}

- (void)registerObserver:(id)a3
{
  ATXDNDModeConfigurationClient *v4;
  id v5;

  v5 = a3;
  v4 = self;
  objc_sync_enter(v4);
  -[NSHashTable addObject:](v4->_observers, "addObject:", v5);
  objc_sync_exit(v4);

}

- (void)unregisterObserver:(id)a3
{
  ATXDNDModeConfigurationClient *v4;
  id v5;

  v5 = a3;
  v4 = self;
  objc_sync_enter(v4);
  -[NSHashTable removeObject:](v4->_observers, "removeObject:", v5);
  objc_sync_exit(v4);

}

- (BOOL)isCloudSyncActive
{
  return -[DNDGlobalConfigurationService isCloudSyncActive](self->_dndGlobalConfigurationService, "isCloudSyncActive");
}

- (void)configuredModesDidChange
{
  ATXDNDModeConfigurationClient *v3;
  NSHashTable *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *observerQueue;
  _QWORD v11[6];
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  -[ATXDNDModeConfigurationClient invalidateCaches](self, "invalidateCaches");
  v3 = self;
  objc_sync_enter(v3);
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = v3->_observers;
  v5 = -[NSHashTable countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v13;
    v7 = MEMORY[0x1E0C809B0];
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v8);
        observerQueue = v3->_observerQueue;
        v11[0] = v7;
        v11[1] = 3221225472;
        v11[2] = __57__ATXDNDModeConfigurationClient_configuredModesDidChange__block_invoke;
        v11[3] = &unk_1E4D57258;
        v11[4] = v9;
        v11[5] = v3;
        dispatch_async(observerQueue, v11);
        ++v8;
      }
      while (v5 != v8);
      v5 = -[NSHashTable countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v5);
  }

  objc_sync_exit(v3);
}

uint64_t __57__ATXDNDModeConfigurationClient_configuredModesDidChange__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "configuredModesDidChange:", *(_QWORD *)(a1 + 40));
}

+ (id)dndSemanticTypeToString:(int64_t)a3
{
  return (id)DNDModeSemanticTypeToString();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedModesBySemanticType, 0);
  objc_storeStrong((id *)&self->_cachedModesByModeIdentifiers, 0);
  objc_storeStrong((id *)&self->_cachedModeConfig, 0);
  objc_storeStrong((id *)&self->_observerQueue, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_updateListener, 0);
  objc_storeStrong((id *)&self->_dndGlobalConfigurationService, 0);
  objc_storeStrong((id *)&self->_dndConfigurationService, 0);
}

void __38__ATXDNDModeConfigurationClient__init__block_invoke_cold_1(id *a1)
{
  id WeakRetained;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  WeakRetained = objc_loadWeakRetained(a1);
  v2 = (objc_class *)objc_opt_class();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_1_3(&dword_1A49EF000, v4, v5, "[%@] Configuration update handler failed with error %@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_5_0();
}

- (void)dndModeUUIDForDNDModeIdentifier:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0(&dword_1A49EF000, v0, v1, "Unable to get UUID for DND Mode associated with mode identifier: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)dndModeUUIDForDNDModeSemanticType:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  void *v3;
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  DNDModeSemanticTypeToString();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_2();
  _os_log_fault_impl(&dword_1A49EF000, a2, OS_LOG_TYPE_FAULT, "There is more than 1 mode of type: %{public}@", v4, 0xCu);

}

- (void)iOSAppListForMode:configurationType:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0(&dword_1A49EF000, v0, v1, "Could not fetch mode configurations and app allow list: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)iOSContactListForMode:configurationType:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0(&dword_1A49EF000, v0, v1, "Could not fetch mode configurations and contact allow list: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)modeConfigurationForDNDModeWithUUID:useCache:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0(&dword_1A49EF000, v0, v1, "Unable to access mode configuration for mode UUID because we couldn't find the modeIdentifier. Mode UUID: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)modeConfigurationForDNDModeWithUUID:(os_log_t)log useCache:.cold.2(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_error_impl(&dword_1A49EF000, log, OS_LOG_TYPE_ERROR, "Unable to fetch mode configuration for mode with mode identifier: %@. Error: %@", (uint8_t *)&v3, 0x16u);
  OUTLINED_FUNCTION_2();
}

- (void)getAllModeConfigurationsWithoutCache
{
  objc_class *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v0 = (objc_class *)objc_opt_class();
  NSStringFromClass(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_1_3(&dword_1A49EF000, v2, v3, "%@ - Unable to fetch mode configurations with err: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_5_0();
}

@end
