@implementation _DKCloudUtilities

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35___DKCloudUtilities_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_initialized != -1)
    dispatch_once(&sharedInstance_initialized, block);
  return (id)sharedInstance_sharedInstance;
}

+ (NSString)containerIdentifier
{
  return (NSString *)CFSTR("com.apple.knowledgestore4");
}

+ (BOOL)isCloudKitEnabled
{
  return _DKIsCloudKitEnabled;
}

+ (void)setCloudKitEnabled:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v4;
  const __CFString *v5;
  int v6;
  const __CFString *v7;
  uint64_t v8;

  v3 = a3;
  v8 = *MEMORY[0x1E0C80C00];
  +[_CDLogging syncChannel](_CDLogging, "syncChannel");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = CFSTR("disabled");
    if (v3)
      v5 = CFSTR("enabled");
    v6 = 138412290;
    v7 = v5;
    _os_log_impl(&dword_18DDBE000, v4, OS_LOG_TYPE_INFO, "Cloud kit is being %@", (uint8_t *)&v6, 0xCu);
  }

  _DKIsCloudKitEnabled = v3;
}

+ (BOOL)isUnitTesting
{
  return _DKIsUnitTesting;
}

+ (void)setUnitTesting:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v4;
  const __CFString *v5;
  int v6;
  const __CFString *v7;
  uint64_t v8;

  v3 = a3;
  v8 = *MEMORY[0x1E0C80C00];
  +[_CDLogging syncChannel](_CDLogging, "syncChannel");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = CFSTR("disabled");
    if (v3)
      v5 = CFSTR("enabled");
    v6 = 138412290;
    v7 = v5;
    _os_log_impl(&dword_18DDBE000, v4, OS_LOG_TYPE_INFO, "Unit tesing is being %@", (uint8_t *)&v6, 0xCu);
  }

  _DKIsUnitTesting = v3;
}

+ (BOOL)isSyncAvailableAndEnabled
{
  return objc_msgSend(a1, "isSyncAvailableAndEnabledWithVerboseLogging:", 0);
}

+ (BOOL)isSyncAvailableAndEnabledWithVerboseLogging:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  int v6;
  uint64_t v7;
  int v8;
  NSObject *v9;
  const __CFString *v10;
  const __CFString *v11;
  const __CFString *v12;
  const __CFString *v13;
  int v15;
  const __CFString *v16;
  __int16 v17;
  const __CFString *v18;
  __int16 v19;
  const __CFString *v20;
  __int16 v21;
  const __CFString *v22;
  __int16 v23;
  const __CFString *v24;
  __int16 v25;
  const __CFString *v26;
  uint64_t v27;

  v3 = a3;
  v27 = *MEMORY[0x1E0C80C00];
  +[_DKCloudUtilities sharedInstance](_DKCloudUtilities, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isCloudSyncAvailable");

  +[_DKCloudUtilities sharedInstance](_DKCloudUtilities, "sharedInstance");
  v7 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v7, "isSiriCloudSyncEnabled");

  LODWORD(v7) = objc_msgSend(a1, "isCloudKitEnabled");
  v8 = v7 & ~objc_msgSend(a1, "isUnitTesting") & v6;
  if (v3)
  {
    +[_CDLogging syncChannel](_CDLogging, "syncChannel");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      if (objc_msgSend(a1, "isCloudKitEnabled"))
        v10 = CFSTR("yes");
      else
        v10 = CFSTR("no");
      if (v6)
        v11 = CFSTR("yes");
      else
        v11 = CFSTR("no");
      v15 = 138413570;
      if (objc_msgSend(a1, "isUnitTesting"))
        v12 = CFSTR("yes");
      else
        v12 = CFSTR("no");
      v16 = v10;
      if (v8)
        v13 = CFSTR("yes");
      else
        v13 = CFSTR("no");
      v17 = 2112;
      v18 = v11;
      v19 = 2112;
      v20 = CFSTR("yes");
      v21 = 2112;
      v22 = CFSTR("yes");
      v23 = 2112;
      v24 = v12;
      v25 = 2112;
      v26 = v13;
      _os_log_impl(&dword_18DDBE000, v9, OS_LOG_TYPE_INFO, "isCloudKitEnabled = %@, isCloudSyncAvailable = %@, syncEnabledByPolicy = %@, siriCloudSyncEnabled = %@, isUnitTesting = %@, isSyncAvailableAndEnabled = %@", (uint8_t *)&v15, 0x3Eu);
    }

  }
  return v8;
}

- (_DKCloudUtilities)init
{
  _DKCloudUtilities *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *fetchQueue;
  void *v6;
  OS_dispatch_queue *v7;
  uint64_t v8;
  _QWORD *v9;
  NSObject *v10;
  void *v11;
  id v12;
  NSObject *v13;
  uint64_t v14;
  _QWORD v16[4];
  _DKCloudUtilities *v17;
  objc_super v18;
  _QWORD block[4];
  id v20;
  id v21;

  v18.receiver = self;
  v18.super_class = (Class)_DKCloudUtilities;
  v2 = -[_DKCloudUtilities init](&v18, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.apple.coreduet.cloud.utilities", v3);
    fetchQueue = v2->_fetchQueue;
    v2->_fetchQueue = (OS_dispatch_queue *)v4;

    if (_DKIsUnitTesting
      || !+[_DKCloudUtilities isCloudKitEnabled](_DKCloudUtilities, "isCloudKitEnabled"))
    {
      v2->_supportsDeviceToDeviceEncryption = 0;
    }
    else
    {
      v2->_supportsDeviceToDeviceEncryption = 0;
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addObserver:selector:name:object:", v2, sel__accountDidChange_, *MEMORY[0x1E0C94690], 0);

      v7 = v2->_fetchQueue;
      v8 = MEMORY[0x1E0C809B0];
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __25___DKCloudUtilities_init__block_invoke;
      v16[3] = &unk_1E26E2F20;
      v17 = v2;
      v9 = v16;
      v10 = v7;
      v11 = (void *)os_transaction_create();
      block[0] = v8;
      block[1] = 3221225472;
      block[2] = __cd_dispatch_async_capture_tx_block_invoke_0;
      block[3] = &unk_1E26E3380;
      v20 = v11;
      v21 = v9;
      v12 = v11;
      dispatch_async(v10, block);

    }
    +[_CDLogging syncChannel](_CDLogging, "syncChannel");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      -[_DKCloudUtilities init].cold.1((uint64_t)v2, v13, v14);

  }
  return v2;
}

- (id)keyValueStore
{
  objc_class *v1;
  void *v2;
  void *v3;

  if (a1)
  {
    v1 = (objc_class *)objc_opt_class();
    NSStringFromClass(v1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    +[_DKSync2Coordinator keyValueStoreForDomain:]((uint64_t)_DKSync2Coordinator, v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (void)_fetchCloudKitConfigurationAndStatus
{
  void *v2;
  void *v3;
  _QWORD v4[5];

  if (a1)
  {
    v2 = *(void **)(a1 + 16);
    +[_DKSyncSerializer underlyingQueue](_DKSyncSerializer, "underlyingQueue");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __57___DKCloudUtilities__fetchCloudKitConfigurationAndStatus__block_invoke;
    v4[3] = &unk_1E26E2F20;
    v4[4] = a1;
    objc_msgSend(v2, "performWithMinimumIntervalInSecondsOf:name:queue:activityBlock:", CFSTR("FetchAccountInfo"), v3, v4, 60.0);

  }
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  if (!_DKIsUnitTesting && +[_DKCloudUtilities isCloudKitEnabled](_DKCloudUtilities, "isCloudKitEnabled"))
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0C94690], 0);

  }
  v4.receiver = self;
  v4.super_class = (Class)_DKCloudUtilities;
  -[_DKCloudUtilities dealloc](&v4, sel_dealloc);
}

- (id)containerKeyValueStore
{
  void *v1;
  objc_class *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v1 = (void *)MEMORY[0x1E0CB3940];
  v2 = (objc_class *)objc_opt_class();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v3;
  +[_DKCloudUtilities containerIdentifier](_DKCloudUtilities, "containerIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "pathWithComponents:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  +[_DKSync2Coordinator keyValueStoreForDomain:]((uint64_t)_DKSync2Coordinator, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)isCloudSyncAvailable
{
  return self->_supportsDeviceToDeviceEncryption;
}

- (void)setCloudSyncAvailable:(BOOL)a3
{
  self->_supportsDeviceToDeviceEncryption = a3;
}

- (BOOL)isSingleDevice
{
  void *v3;
  void *v4;
  _BOOL4 v5;
  NSObject *v6;
  _BOOL4 v7;

  -[_DKCloudUtilities keyValueStore]((uint64_t)self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayForKey:", CFSTR("_DKCloudSyncDevices"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    v5 = (unint64_t)objc_msgSend(v4, "count") < 2;
  else
    v5 = 0;
  if (isSingleDevice_firstTime != 1 || self->_isSingleDevice != v5)
  {
    isSingleDevice_firstTime = 1;
    +[_CDLogging syncChannel](_CDLogging, "syncChannel");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG);
    if (v4)
    {
      if (v7)
        -[_DKCloudUtilities isSingleDevice].cold.2(v4, v6);
    }
    else if (v7)
    {
      -[_DKCloudUtilities isSingleDevice].cold.1();
    }

  }
  self->_isSingleDevice = v5;

  return v5;
}

- (BOOL)isSiriCloudSyncEnabled
{
  void *v2;
  char v3;

  -[objc_class sharedPreferences](getAFPreferencesClass(), "sharedPreferences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "cloudSyncEnabled");

  return v3;
}

- (BOOL)supportsDeviceToDeviceEncryption
{
  return self->_supportsDeviceToDeviceEncryption;
}

- (void)_accountDidChange:(id)a3
{
  uint64_t v3;
  OS_dispatch_queue *fetchQueue;
  _QWORD *v5;
  NSObject *v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  _QWORD block[4];
  id v11;
  id v12;

  v3 = MEMORY[0x1E0C809B0];
  fetchQueue = self->_fetchQueue;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __39___DKCloudUtilities__accountDidChange___block_invoke;
  v9[3] = &unk_1E26E2F20;
  v9[4] = self;
  v5 = v9;
  v6 = fetchQueue;
  v7 = (void *)os_transaction_create();
  block[0] = v3;
  block[1] = 3221225472;
  block[2] = __cd_dispatch_async_capture_tx_block_invoke_0;
  block[3] = &unk_1E26E3380;
  v11 = v7;
  v12 = v5;
  v8 = v7;
  dispatch_async(v6, block);

}

- (void)_updateNumberOfSyncedDevicesWithCompletionHandler:(uint64_t)a1
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[5];
  id v10;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    v5 = MEMORY[0x1E0C809B0];
    v6 = *(void **)(a1 + 16);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __71___DKCloudUtilities__updateNumberOfSyncedDevicesWithCompletionHandler___block_invoke;
    v9[3] = &unk_1E26E2FC0;
    v9[4] = a1;
    v10 = v3;
    v7[0] = v5;
    v7[1] = 3221225472;
    v7[2] = __71___DKCloudUtilities__updateNumberOfSyncedDevicesWithCompletionHandler___block_invoke_2;
    v7[3] = &unk_1E26E3448;
    v8 = v10;
    objc_msgSend(v6, "performNoMoreOftenInDaysThan:name:activityBlock:throttleBlock:", CFSTR("UpdateNumberOfSyncedDevices"), v9, v7, 1.0);

  }
}

- (void)_fetchAccountInfoWithCompletionHandler:(void *)a1
{
  id v3;
  NSObject *v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id location[6];

  location[5] = *(id *)MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1)
  {
    +[_CDLogging syncChannel](_CDLogging, "syncChannel");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      -[_DKCloudUtilities _fetchAccountInfoWithCompletionHandler:].cold.2();

    objc_msgSend(MEMORY[0x1E0C94C28], "containerWithIdentifier:", CFSTR("com.apple.knowledgestore4"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_initWeak(location, a1);
      v6[0] = MEMORY[0x1E0C809B0];
      v6[1] = 3221225472;
      v6[2] = __60___DKCloudUtilities__fetchAccountInfoWithCompletionHandler___block_invoke;
      v6[3] = &unk_1E26E33D8;
      objc_copyWeak(&v8, location);
      v7 = v3;
      objc_msgSend(v5, "accountInfoWithCompletionHandler:", v6);

      objc_destroyWeak(&v8);
      objc_destroyWeak(location);
    }

  }
}

- (void)_updateAccountInfo:(void *)a3 error:
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  int v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;

  v5 = a2;
  v6 = a3;
  if (a1)
  {
    +[_CDLogging syncChannel](_CDLogging, "syncChannel");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v5)
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
        -[_DKCloudUtilities _updateAccountInfo:error:].cold.4();

      v9 = *(unsigned __int8 *)(a1 + 24);
      if (v9 != objc_msgSend(v5, "supportsDeviceToDeviceEncryption"))
      {
        +[_DKCloudUtilities isSyncAvailableAndEnabledWithVerboseLogging:](_DKCloudUtilities, "isSyncAvailableAndEnabledWithVerboseLogging:", 1);
        +[_CDLogging syncChannel](_CDLogging, "syncChannel");
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
          -[_DKCloudUtilities _updateAccountInfo:error:].cold.3(v5, v10);

        *(_BYTE *)(a1 + 24) = objc_msgSend(v5, "supportsDeviceToDeviceEncryption");
        +[_DKCloudUtilities isSyncAvailableAndEnabledWithVerboseLogging:](_DKCloudUtilities, "isSyncAvailableAndEnabledWithVerboseLogging:", 1);
      }
      *(_BYTE *)(a1 + 24) = objc_msgSend(v5, "supportsDeviceToDeviceEncryption");
    }
    else
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        -[_DKCloudUtilities _updateAccountInfo:error:].cold.2(v6);

      if (*(_BYTE *)(a1 + 24))
      {
        +[_CDLogging syncChannel](_CDLogging, "syncChannel");
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
          -[_DKCloudUtilities _updateAccountInfo:error:].cold.1();

      }
      *(_BYTE *)(a1 + 24) = 0;
    }
    dispatch_get_global_queue(2, 0);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)os_transaction_create();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __cd_dispatch_async_capture_tx_block_invoke_0;
    v15[3] = &unk_1E26E3380;
    v16 = v13;
    v17 = &__block_literal_global_374;
    v14 = v13;
    dispatch_async(v12, v15);

  }
}

- (void)deleteRemoteStateWithReply:(id)a3
{
  void (**v3)(id, uint64_t, _QWORD);
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, uint64_t, uint64_t, void *);
  void *v18;
  id v19;
  void (**v20)(id, uint64_t, _QWORD);
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v3 = (void (**)(id, uint64_t, _QWORD))a3;
  if (+[_DKCloudUtilities isUnitTesting](_DKCloudUtilities, "isUnitTesting")
    || !+[_DKCloudUtilities isCloudKitEnabled](_DKCloudUtilities, "isCloudKitEnabled"))
  {
    v3[2](v3, 1, 0);
  }
  else
  {
    v4 = (void *)os_transaction_create();
    v5 = (void *)MEMORY[0x1E0C94C28];
    +[_DKCloudUtilities containerIdentifier](_DKCloudUtilities, "containerIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "containerWithIdentifier:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "privateCloudDatabase");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C95088]), "initWithZoneName:", CFSTR("com.apple.coredata.cloudkit.zone"));
    v10 = objc_alloc(MEMORY[0x1E0C94EF0]);
    objc_msgSend(v9, "zoneID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = v11;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v10, "initWithRecordZonesToSave:recordZoneIDsToDelete:", 0, v12);

    v15 = MEMORY[0x1E0C809B0];
    v16 = 3221225472;
    v17 = __48___DKCloudUtilities_deleteRemoteStateWithReply___block_invoke;
    v18 = &unk_1E26E3420;
    v19 = v4;
    v20 = v3;
    v14 = v4;
    objc_msgSend(v13, "setModifyRecordZonesCompletionBlock:", &v15);
    objc_msgSend(v8, "addOperation:", v13, v15, v16, v17, v18);

  }
}

- (void)_performUpdateNumberOfSyncedDevicesWithAttempt:(void *)a3 completionHandler:
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  _QWORD v32[4];
  id v33;
  id v34;
  id v35;
  uint64_t v36;
  id v37;
  id v38;
  uint64_t v39;
  _QWORD v40[4];
  id v41;
  _QWORD v42[4];
  id v43;
  uint64_t v44;
  _QWORD v45[4];
  id v46;
  uint64_t v47;
  void *v48;
  void *v49;
  _QWORD v50[3];

  v50[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (a1)
  {
    v28 = a2;
    v27 = (void *)os_transaction_create();
    +[_CDLogging syncChannel](_CDLogging, "syncChannel");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      -[_DKCloudUtilities _performUpdateNumberOfSyncedDevicesWithAttempt:completionHandler:].cold.1();
    v31 = v5;

    objc_msgSend(MEMORY[0x1E0C94C28], "containerWithIdentifier:", CFSTR("com.apple.knowledgestore4"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "privateCloudDatabase");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[_DKCloudUtilities keyValueStore](a1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C95088]), "initWithZoneName:", CFSTR("metadata_zone"));
    objc_msgSend(v8, "zoneID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[_DKCloudUtilities containerKeyValueStore](a1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dataForKey:", CFSTR("_DKCloudSyncMetadataChangeToken"));
    v11 = objc_claimAutoreleasedReturnValue();
    v50[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v50, 1);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_opt_new();
    if (v11)
    {
      objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v11, 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setPreviousServerChangeToken:", v14);

    }
    v48 = v9;
    v49 = v13;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v49, &v48, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = (void *)v11;
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C94DE8]), "initWithRecordZoneIDs:optionsByRecordZoneID:", v12, v15);
    objc_msgSend(v16, "setFetchAllChanges:", 1);
    v25 = (void *)v12;
    v17 = MEMORY[0x1E0C809B0];
    v45[0] = MEMORY[0x1E0C809B0];
    v45[1] = 3221225472;
    v45[2] = __86___DKCloudUtilities__performUpdateNumberOfSyncedDevicesWithAttempt_completionHandler___block_invoke;
    v45[3] = &unk_1E26E3470;
    v18 = v7;
    v46 = v18;
    v47 = a1;
    objc_msgSend(v16, "setRecordChangedBlock:", v45);
    v42[0] = v17;
    v42[1] = 3221225472;
    v42[2] = __86___DKCloudUtilities__performUpdateNumberOfSyncedDevicesWithAttempt_completionHandler___block_invoke_399;
    v42[3] = &unk_1E26E3498;
    v19 = v18;
    v43 = v19;
    v44 = a1;
    objc_msgSend(v16, "setRecordWithIDWasDeletedBlock:", v42);
    v40[0] = v17;
    v40[1] = 3221225472;
    v40[2] = __86___DKCloudUtilities__performUpdateNumberOfSyncedDevicesWithAttempt_completionHandler___block_invoke_2;
    v40[3] = &unk_1E26E34C0;
    v20 = v10;
    v41 = v20;
    objc_msgSend(v16, "setRecordZoneFetchCompletionBlock:", v40);
    v32[0] = v17;
    v32[1] = 3221225472;
    v32[2] = __86___DKCloudUtilities__performUpdateNumberOfSyncedDevicesWithAttempt_completionHandler___block_invoke_3;
    v32[3] = &unk_1E26E34E8;
    v33 = v19;
    v34 = v8;
    v39 = v28;
    v35 = v20;
    v36 = a1;
    v5 = v31;
    v37 = v27;
    v38 = v31;
    v21 = v27;
    v22 = v20;
    v23 = v8;
    v24 = v19;
    objc_msgSend(v16, "setFetchRecordZoneChangesCompletionBlock:", v32);
    objc_msgSend(v29, "addOperation:", v16);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activityThrottler, 0);
  objc_storeStrong((id *)&self->_fetchQueue, 0);
}

- (void)init
{
  const __CFString *v3;
  int v4;
  const __CFString *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if (*(_BYTE *)(a1 + 24))
    v3 = CFSTR("enabled");
  else
    v3 = CFSTR("disabled");
  v4 = 138412290;
  v5 = v3;
  OUTLINED_FUNCTION_2_0(&dword_18DDBE000, a2, a3, "Cloud sync initialized to %@", (uint8_t *)&v4);
}

- (void)isSingleDevice
{
  void *v3;
  uint64_t v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(a1, "count"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v3;
  OUTLINED_FUNCTION_2_0(&dword_18DDBE000, a2, v4, "There are %@ devices syncing", (uint8_t *)&v5);

  OUTLINED_FUNCTION_1();
}

- (void)_fetchAccountInfoWithCompletionHandler:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_fault_impl(&dword_18DDBE000, a2, OS_LOG_TYPE_FAULT, "Failed to fetch account info: %@", (uint8_t *)&v2, 0xCu);
}

- (void)_fetchAccountInfoWithCompletionHandler:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_8(&dword_18DDBE000, v0, v1, "Fetching account info", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)_updateAccountInfo:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_8(&dword_18DDBE000, v0, v1, "Device to device encryption is being disabled due to error fetching account info", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)_updateAccountInfo:(void *)a1 error:.cold.2(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "domain");
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6_3();
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_5_2(&dword_18DDBE000, v2, v3, "Failed to fetch account info: %{public}@:%lld (%@)", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_7_1();
}

- (void)_updateAccountInfo:(void *)a1 error:(NSObject *)a2 .cold.3(void *a1, NSObject *a2)
{
  int v3;
  uint64_t v4;
  const __CFString *v5;
  int v6;
  const __CFString *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = objc_msgSend(a1, "supportsDeviceToDeviceEncryption");
  v5 = CFSTR("disabled");
  if (v3)
    v5 = CFSTR("enabled");
  v6 = 138412290;
  v7 = v5;
  OUTLINED_FUNCTION_2_0(&dword_18DDBE000, a2, v4, "Device to device encryption is %@", (uint8_t *)&v6);
  OUTLINED_FUNCTION_1();
}

- (void)_updateAccountInfo:error:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_8(&dword_18DDBE000, v0, v1, "Fetched account info", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)_performUpdateNumberOfSyncedDevicesWithAttempt:completionHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_8(&dword_18DDBE000, v0, v1, "Fetching number of sync devices", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

@end
