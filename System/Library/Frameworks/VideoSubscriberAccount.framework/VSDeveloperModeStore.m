@implementation VSDeveloperModeStore

void __68__VSDeveloperModeStore_fetchDeveloperSettingsWithCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  VSDeveloperSettings *v7;
  VSDeveloperSettings *v8;
  VSDeveloperSettings *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  NSObject *v21;
  uint64_t v22;
  NSObject *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  id v28;
  uint8_t buf[4];
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "settingsPropertiesURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    VSDefaultLogObject();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v2, "absoluteString");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v30 = v5;
      _os_log_impl(&dword_1D2419000, v4, OS_LOG_TYPE_DEFAULT, "Will fetch developer settings with path %@", buf, 0xCu);

    }
    if (v3)
    {
      v28 = 0;
      objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v3, 0, 0, &v28);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (VSDeveloperSettings *)v28;
      v8 = v7;
      if (v6)
      {
        v9 = objc_alloc_init(VSDeveloperSettings);
        objc_msgSend(v6, "objectForKey:", CFSTR("VSDeveloperSettingsPropertyIsInSetTopBoxModeKey"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[VSDeveloperSettings setIsInSetTopBoxMode:](v9, "setIsInSetTopBoxMode:", objc_msgSend(v10, "BOOLValue"));

        objc_msgSend(v6, "objectForKey:", CFSTR("VSDeveloperSettingsPropertyIsCacheBusterEnabledKey"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[VSDeveloperSettings setCacheBusterEnabled:](v9, "setCacheBusterEnabled:", objc_msgSend(v11, "BOOLValue"));

        objc_msgSend(v6, "objectForKey:", CFSTR("VSDeveloperSettingsPropertySetTopBoxBundleIdentifierKey"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[VSDeveloperSettings setSetTopBoxBundleIdentifier:](v9, "setSetTopBoxBundleIdentifier:", v12);

        objc_msgSend(v6, "objectForKey:", CFSTR("VSDeveloperSettingsPropertySetTopBoxUserTokenKey"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[VSDeveloperSettings setSetTopBoxUserToken:](v9, "setSetTopBoxUserToken:", v13);

        objc_msgSend(v6, "objectForKey:", CFSTR("VSDeveloperSettingsPropertySetTopBoxProviderIDKey"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[VSDeveloperSettings setSetTopBoxIdentityProviderID:](v9, "setSetTopBoxIdentityProviderID:", v14);

        objc_msgSend(v6, "objectForKey:", CFSTR("VSDeveloperSettingsPropertySetTopBoxUseDeviceProfileKey"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[VSDeveloperSettings setSetTopBoxUseDeviceProfile:](v9, "setSetTopBoxUseDeviceProfile:", objc_msgSend(v15, "BOOLValue"));

        objc_msgSend(v6, "objectForKey:", CFSTR("VSDeveloperSettingsPropertySetTopBoxSupportsOptOut"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[VSDeveloperSettings setSetTopBoxSupportsOptOut:](v9, "setSetTopBoxSupportsOptOut:", objc_msgSend(v16, "BOOLValue"));

        objc_msgSend(v6, "objectForKey:", CFSTR("VSDeveloperSettingsPropertySimulateExpiredToken"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[VSDeveloperSettings setSimulateExpiredToken:](v9, "setSimulateExpiredToken:", objc_msgSend(v17, "BOOLValue"));

        objc_msgSend(v6, "objectForKey:", CFSTR("VSDeveloperSettingsPropertyRequestTimeoutsEnabled"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = v18;
        if (v18)
        {
          v20 = objc_msgSend(v18, "BOOLValue") ^ 1;
        }
        else
        {
          objc_msgSend(v6, "objectForKey:", CFSTR("VSDeveloperSettingsPropertyRequestTimeoutsDisabled"));
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v25, "BOOLValue");

        }
        -[VSDeveloperSettings setRequestTimeoutsDisabled:](v9, "setRequestTimeoutsDisabled:", v20);
        v26 = *(_QWORD *)(a1 + 40);
        +[VSFailable failableWithObject:](VSFailable, "failableWithObject:", v9);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, void *))(v26 + 16))(v26, v27);

      }
      else
      {
        if (!v7)
          objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The serializationErrorOrNil parameter must not be nil."));
        v9 = v8;
        VSErrorLogObject();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          __68__VSDeveloperModeStore_fetchDeveloperSettingsWithCompletionHandler___block_invoke_cold_2();

        v24 = *(_QWORD *)(a1 + 40);
        +[VSFailable failableWithError:](VSFailable, "failableWithError:", v9);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, void *))(v24 + 16))(v24, v19);
      }

    }
    else
    {
      v8 = objc_alloc_init(VSDeveloperSettings);
      -[VSDeveloperSettings setDefaults](v8, "setDefaults");
      objc_msgSend(*(id *)(a1 + 32), "updateDeveloperSettings:completionHandler:", v8, *(_QWORD *)(a1 + 40));
    }
  }
  else
  {
    VSErrorLogObject();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      __68__VSDeveloperModeStore_fetchDeveloperSettingsWithCompletionHandler___block_invoke_cold_1();

    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("VSDeveloperServiceErrorDomain"), -2, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = *(_QWORD *)(a1 + 40);
    +[VSFailable failableWithError:](VSFailable, "failableWithError:", v3);
    v8 = (VSDeveloperSettings *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, VSDeveloperSettings *))(v22 + 16))(v22, v8);
  }

}

- (id)settingsPropertiesURL
{
  id v2;
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  id v13;
  NSObject *v14;
  void *v15;
  id v17;
  char v18;

  v2 = objc_alloc_init(MEMORY[0x1E0CB3620]);
  objc_msgSend(v2, "URLsForDirectory:inDomains:", 5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = v4;
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bundleIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      -[NSObject URLByAppendingPathComponent:](v5, "URLByAppendingPathComponent:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      if (v8)
      {
        objc_msgSend(v8, "path");
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v10)
          objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The [containerDirectoryOrNil path] parameter must not be nil."));
        objc_msgSend(v9, "path");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = 0;
        if ((objc_msgSend(v2, "fileExistsAtPath:isDirectory:", v11, &v18) & 1) == 0)
        {
          v17 = 0;
          v12 = objc_msgSend(v2, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v11, 0, 0, &v17);
          v13 = v17;
          if ((v12 & 1) == 0)
          {
            VSErrorLogObject();
            v14 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
              -[VSDeveloperModeStore settingsPropertiesURL].cold.2();

          }
        }
        objc_msgSend(v9, "URLByAppendingPathComponent:", CFSTR("DeveloperSettings.plist"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v15 = 0;
      }

    }
    else
    {
      v15 = 0;
    }

  }
  else
  {
    VSErrorLogObject();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[VSDeveloperModeStore settingsPropertiesURL].cold.1();
    v15 = 0;
  }

  return v15;
}

void __77__VSDeveloperModeStore_fetchDeveloperIdentityProvidersWithCompletionHandler___block_invoke_64(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  +[VSFailable failableWithObject:](VSFailable, "failableWithObject:", *(_QWORD *)(a1 + 32));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

void __77__VSDeveloperModeStore_fetchDeveloperIdentityProvidersWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  id v8;
  _QWORD *v9;
  _QWORD v10[5];
  _QWORD v11[5];
  id v12;

  v3 = a2;
  v11[0] = 0;
  v11[1] = v11;
  v11[2] = 0x3032000000;
  v11[3] = __Block_byref_object_copy__8;
  v11[4] = __Block_byref_object_dispose__8;
  v4 = MEMORY[0x1E0C809B0];
  v12 = 0;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __77__VSDeveloperModeStore_fetchDeveloperIdentityProvidersWithCompletionHandler___block_invoke_45;
  v10[3] = &unk_1E939F0C8;
  v10[4] = v11;
  objc_msgSend(v3, "unwrapObject:error:", v10, &__block_literal_global_31);
  v6[0] = v4;
  v6[1] = 3221225472;
  v6[2] = __77__VSDeveloperModeStore_fetchDeveloperIdentityProvidersWithCompletionHandler___block_invoke_48;
  v6[3] = &unk_1E93A02F0;
  v5 = *(void **)(a1 + 40);
  v7 = *(id *)(a1 + 32);
  v9 = v11;
  v8 = v5;
  objc_msgSend(v7, "_performIdentityProviderBlock:", v6);

  _Block_object_dispose(v11, 8);
}

- (OS_dispatch_queue)settingsQueue
{
  return self->_settingsQueue;
}

- (VSPersistentContainer)persistentContainer
{
  return self->_persistentContainer;
}

- (void)fetchDeveloperSettingsWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[4];
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  VSDefaultLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v11 = "-[VSDeveloperModeStore fetchDeveloperSettingsWithCompletionHandler:]";
    _os_log_impl(&dword_1D2419000, v5, OS_LOG_TYPE_DEFAULT, "Entering %s", buf, 0xCu);
  }

  -[VSDeveloperModeStore settingsQueue](self, "settingsQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __68__VSDeveloperModeStore_fetchDeveloperSettingsWithCompletionHandler___block_invoke;
  v8[3] = &unk_1E939F3B0;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_async(v6, v8);

}

- (void)fetchDeveloperIdentityProvidersWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;
  uint8_t buf[4];
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  VSDefaultLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v10 = "-[VSDeveloperModeStore fetchDeveloperIdentityProvidersWithCompletionHandler:]";
    _os_log_impl(&dword_1D2419000, v5, OS_LOG_TYPE_DEFAULT, "Entering %s", buf, 0xCu);
  }

  if (!v4)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The completionHandler parameter must not be nil."));
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __77__VSDeveloperModeStore_fetchDeveloperIdentityProvidersWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E939F338;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[VSDeveloperModeStore fetchDeveloperSettingsWithCompletionHandler:](self, "fetchDeveloperSettingsWithCompletionHandler:", v7);

}

- (void)_performIdentityProviderBlock:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[VSDeveloperModeStore persistentContainer](self, "persistentContainer");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "performBlock:", v4);

}

- (id)_identityProviderFetchRequest
{
  void *v2;
  void *v3;

  -[VSDeveloperModeStore persistentContainer](self, "persistentContainer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "developerIdentityProviderFetchRequest");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (VSDeveloperModeStore)init
{
  VSDeveloperModeStore *v2;
  VSPersistentContainer *v3;
  VSPersistentContainer *persistentContainer;
  dispatch_queue_t v5;
  OS_dispatch_queue *settingsQueue;
  VSRemoteNotifier *v7;
  VSRemoteNotifier *serviceChangeRemoteNotifier;
  VSRemoteNotifier *v9;
  VSRemoteNotifier *settingsChangeRemoteNotifier;
  VSRemoteNotifier *v11;
  VSRemoteNotifier *providersChangeRemoteNotifier;
  VSRemoteNotifier *v13;
  VSRemoteNotifier *accountStoreChangeRemoteNotifier;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)VSDeveloperModeStore;
  v2 = -[VSDeveloperModeStore init](&v16, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(VSPersistentContainer);
    persistentContainer = v2->_persistentContainer;
    v2->_persistentContainer = v3;

    v5 = dispatch_queue_create("Developer Settings Operation Queue", 0);
    settingsQueue = v2->_settingsQueue;
    v2->_settingsQueue = (OS_dispatch_queue *)v5;

    v7 = -[VSRemoteNotifier initWithNotificationName:]([VSRemoteNotifier alloc], "initWithNotificationName:", CFSTR("VSDeveloperServiceDidChangeNotification"));
    serviceChangeRemoteNotifier = v2->_serviceChangeRemoteNotifier;
    v2->_serviceChangeRemoteNotifier = v7;

    v9 = -[VSRemoteNotifier initWithNotificationName:]([VSRemoteNotifier alloc], "initWithNotificationName:", CFSTR("VSDeveloperServiceSettingsDidChangeNotification"));
    settingsChangeRemoteNotifier = v2->_settingsChangeRemoteNotifier;
    v2->_settingsChangeRemoteNotifier = v9;

    v11 = -[VSRemoteNotifier initWithNotificationName:]([VSRemoteNotifier alloc], "initWithNotificationName:", CFSTR("VSDeveloperServiceProvidersDidChangeNotification"));
    providersChangeRemoteNotifier = v2->_providersChangeRemoteNotifier;
    v2->_providersChangeRemoteNotifier = v11;

    v13 = -[VSRemoteNotifier initWithNotificationName:]([VSRemoteNotifier alloc], "initWithNotificationName:", CFSTR("VSAccountStoreDidChangeNotification"));
    accountStoreChangeRemoteNotifier = v2->_accountStoreChangeRemoteNotifier;
    v2->_accountStoreChangeRemoteNotifier = v13;

    -[VSDeveloperModeStore migrateSettingsPropertyFileIfNecessary](v2, "migrateSettingsPropertyFileIfNecessary");
  }
  return v2;
}

- (id)legacySettingsPropertiesPath
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;

  v2 = objc_alloc_init(MEMORY[0x1E0CB3620]);
  objc_msgSend(v2, "URLsForDirectory:inDomains:", 9, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6
    && (objc_msgSend(v4, "URLByAppendingPathComponent:", v6), (v7 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    v8 = v7;
    -[NSObject path](v8, "path");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      -[NSObject URLByAppendingPathComponent:](v8, "URLByAppendingPathComponent:", CFSTR("DeveloperSettings.plist"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      VSErrorLogObject();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        -[VSDeveloperModeStore legacySettingsPropertiesPath].cold.2();

      v10 = 0;
    }

    v11 = v8;
  }
  else
  {
    VSErrorLogObject();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[VSDeveloperModeStore legacySettingsPropertiesPath].cold.1();
    v11 = 0;
    v10 = 0;
  }

  return v10;
}

- (void)migrateSettingsPropertyFileIfNecessary
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2(&dword_1D2419000, v0, v1, "Error moving legacy developer settinsgs properties: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (id)_developerIdentityProviderInContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[VSDeveloperModeStore persistentContainer](self, "persistentContainer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "insertDeveloperIdentityProviderInContext:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)_noteServiceDidChange
{
  id v2;

  -[VSDeveloperModeStore serviceChangeRemoteNotifier](self, "serviceChangeRemoteNotifier");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotification");

}

- (void)_noteSettingsDidChange
{
  id v2;

  -[VSDeveloperModeStore settingsChangeRemoteNotifier](self, "settingsChangeRemoteNotifier");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotification");

}

- (void)_noteProvidersDidChange
{
  id v2;

  -[VSDeveloperModeStore providersChangeRemoteNotifier](self, "providersChangeRemoteNotifier");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotification");

}

- (id)_nullableObjectOrNSNull:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return v6;
}

void __77__VSDeveloperModeStore_fetchDeveloperIdentityProvidersWithCompletionHandler___block_invoke_45(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __77__VSDeveloperModeStore_fetchDeveloperIdentityProvidersWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  VSErrorLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __77__VSDeveloperModeStore_fetchDeveloperIdentityProvidersWithCompletionHandler___block_invoke_2_cold_1();

}

void __77__VSDeveloperModeStore_fetchDeveloperIdentityProvidersWithCompletionHandler___block_invoke_48(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  VSIdentityProvider *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  int v38;
  void *v39;
  NSObject *v40;
  id v41;
  id v42;
  NSObject *v43;
  id v44;
  NSObject *v45;
  uint64_t v46;
  id v47;
  void *v48;
  void *v49;
  void *v50;
  id v51;
  uint64_t v52;
  void *v53;
  id obj;
  uint64_t v55;
  _QWORD v56[4];
  id v57;
  id v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  id v63;
  uint8_t buf[4];
  const char *v65;
  _QWORD v66[2];
  _BYTE v67[128];
  _QWORD v68[4];

  v68[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v52 = a1;
  objc_msgSend(*(id *)(a1 + 32), "_identityProviderFetchRequest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithValue:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPredicate:", v5);

  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:selector:", CFSTR("nameForSorting"), 1, sel_localizedCaseInsensitiveCompare_);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v68[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v68, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSortDescriptors:", v7);

  objc_msgSend(v4, "setReturnsObjectsAsFaults:", 0);
  v63 = 0;
  objc_msgSend(v3, "executeFetchRequest:error:", v4, &v63);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v63;
  v10 = v9;
  if (v8)
  {
    v47 = v9;
    v49 = v6;
    v50 = v4;
    v51 = v3;
    v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v59 = 0u;
    v60 = 0u;
    v61 = 0u;
    v62 = 0u;
    v48 = v8;
    obj = v8;
    v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v59, v67, 16);
    v13 = v52;
    v53 = v11;
    if (v12)
    {
      v14 = v12;
      v55 = *(_QWORD *)v60;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v60 != v55)
            objc_enumerationMutation(obj);
          v16 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * i);
          v17 = objc_alloc_init(VSIdentityProvider);
          objc_msgSend(v11, "addObject:", v17);
          -[VSIdentityProvider setDeveloper:](v17, "setDeveloper:", 1);
          objc_msgSend(v16, "uniqueID");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = (void *)objc_msgSend(v18, "copy");
          +[VSOptional optionalWithObject:](VSOptional, "optionalWithObject:", v19);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          -[VSIdentityProvider setUniqueID:](v17, "setUniqueID:", v20);

          objc_msgSend(v16, "providerID");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = (void *)objc_msgSend(v21, "copy");
          +[VSOptional optionalWithObject:](VSOptional, "optionalWithObject:", v22);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          -[VSIdentityProvider setProviderID:](v17, "setProviderID:", v23);

          objc_msgSend(v16, "nameForSorting");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          -[VSIdentityProvider setNameForSorting:](v17, "setNameForSorting:", v24);

          objc_msgSend(v16, "authenticationSchemes");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = (void *)objc_msgSend(v25, "copy");
          -[VSIdentityProvider setSupportedAuthenticationSchemes:](v17, "setSupportedAuthenticationSchemes:", v26);

          -[VSIdentityProvider setRequireAuthenticationURLSystemTrust:](v17, "setRequireAuthenticationURLSystemTrust:", objc_msgSend(v16, "requireBootUrlSystemTrust"));
          -[VSIdentityProvider setRequireXHRRequestSystemTrust:](v17, "setRequireXHRRequestSystemTrust:", objc_msgSend(v16, "requireXHRRequestSystemTrust"));
          objc_msgSend(v16, "authenticationURL");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          if (v27)
          {
            objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v27);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            -[VSIdentityProvider setAuthenticationURL:](v17, "setAuthenticationURL:", v28);

          }
          VSPlatformTemplateElements();
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "allObjects");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          -[VSIdentityProvider setSupportedTemplates:](v17, "setSupportedTemplates:", v30);

          -[VSIdentityProvider supportedAuthenticationSchemes](v17, "supportedAuthenticationSchemes");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          if (!objc_msgSend(v31, "count"))
          {
            v66[0] = CFSTR("SAML");
            v66[1] = CFSTR("API");
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v66, 2);
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            -[VSIdentityProvider setSupportedAuthenticationSchemes:](v17, "setSupportedAuthenticationSchemes:", v32);

          }
          v33 = *(void **)(*(_QWORD *)(*(_QWORD *)(v13 + 48) + 8) + 40);
          if (v33)
          {
            v34 = v33;
            if (objc_msgSend(v34, "isInSetTopBoxMode"))
            {
              -[VSIdentityProvider uniqueID](v17, "uniqueID");
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v35, "forceUnwrapObject");
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v34, "setTopBoxIdentityProviderID");
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              v38 = objc_msgSend(v36, "isEqual:", v37);

              v13 = v52;
              v11 = v53;

              if (v38)
              {
                -[VSIdentityProvider setIsSTBOptOutAllowed:](v17, "setIsSTBOptOutAllowed:", objc_msgSend(v34, "setTopBoxSupportsOptOut"));
                objc_msgSend(v34, "setTopBoxUserToken");
                v39 = (void *)objc_claimAutoreleasedReturnValue();
                -[VSIdentityProvider setUserToken:](v17, "setUserToken:", v39);

                v11 = v53;
              }
            }

          }
        }
        v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v59, v67, 16);
      }
      while (v14);
    }

    VSDefaultLogObject();
    v40 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v65 = "-[VSDeveloperModeStore fetchDeveloperIdentityProvidersWithCompletionHandler:]_block_invoke";
      _os_log_impl(&dword_1D2419000, v40, OS_LOG_TYPE_DEFAULT, "Will call completion handler passed to %s", buf, 0xCu);
    }

    v56[0] = MEMORY[0x1E0C809B0];
    v56[1] = 3221225472;
    v56[2] = __77__VSDeveloperModeStore_fetchDeveloperIdentityProvidersWithCompletionHandler___block_invoke_64;
    v56[3] = &unk_1E939F1A8;
    v41 = *(id *)(v13 + 40);
    v57 = v53;
    v58 = v41;
    v42 = v53;
    __77__VSDeveloperModeStore_fetchDeveloperIdentityProvidersWithCompletionHandler___block_invoke_64((uint64_t)v56);
    VSDefaultLogObject();
    v43 = objc_claimAutoreleasedReturnValue();
    v4 = v50;
    v3 = v51;
    v8 = v48;
    v6 = v49;
    v10 = v47;
    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v65 = "-[VSDeveloperModeStore fetchDeveloperIdentityProvidersWithCompletionHandler:]_block_invoke_2";
      _os_log_impl(&dword_1D2419000, v43, OS_LOG_TYPE_DEFAULT, "Did call completion handler passed to %s", buf, 0xCu);
    }

    v44 = v58;
  }
  else
  {
    VSErrorLogObject();
    v45 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
      __77__VSDeveloperModeStore_fetchDeveloperIdentityProvidersWithCompletionHandler___block_invoke_48_cold_1();

    v46 = *(_QWORD *)(v52 + 40);
    if (!v10)
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The error parameter must not be nil."));
    v44 = v10;
    +[VSFailable failableWithError:](VSFailable, "failableWithError:", v44);
    v42 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v46 + 16))(v46, v42);
  }

}

- (void)addDeveloperIdentityProvider:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;
  uint8_t buf[4];
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  VSDefaultLogObject();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v15 = "-[VSDeveloperModeStore addDeveloperIdentityProvider:completionHandler:]";
    _os_log_impl(&dword_1D2419000, v8, OS_LOG_TYPE_DEFAULT, "Entering %s", buf, 0xCu);
  }

  if (!v6)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The identityProvider parameter must not be nil."));
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __71__VSDeveloperModeStore_addDeveloperIdentityProvider_completionHandler___block_invoke;
  v11[3] = &unk_1E93A0318;
  v11[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  -[VSDeveloperModeStore _performIdentityProviderBlock:](self, "_performIdentityProviderBlock:", v11);

}

void __71__VSDeveloperModeStore_addDeveloperIdentityProvider_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  NSObject *v18;
  uint64_t v19;
  id v20;
  void *v21;
  id v22;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "_developerIdentityProviderInContext:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "uniqueID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "forceUnwrapObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v5, "setUniqueID:", v8);

  objc_msgSend(*(id *)(a1 + 40), "providerID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "forceUnwrapObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "copy");
  objc_msgSend(v5, "setProviderID:", v11);

  objc_msgSend(*(id *)(a1 + 40), "nameForSorting");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setNameForSorting:", v12);

  objc_msgSend(*(id *)(a1 + 40), "authenticationURL");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "absoluteString");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAuthenticationURL:", v14);

  objc_msgSend(*(id *)(a1 + 40), "supportedAuthenticationSchemes");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v15, "copy");
  objc_msgSend(v5, "setAuthenticationSchemes:", v16);

  objc_msgSend(v5, "setRequireBootUrlSystemTrust:", objc_msgSend(*(id *)(a1 + 40), "requireAuthenticationURLSystemTrust"));
  objc_msgSend(v5, "setRequireXHRRequestSystemTrust:", objc_msgSend(*(id *)(a1 + 40), "requireXHRRequestSystemTrust"));
  v22 = 0;
  LODWORD(v15) = objc_msgSend(v4, "save:", &v22);

  v17 = v22;
  if ((_DWORD)v15)
  {
    objc_msgSend(*(id *)(a1 + 32), "fetchDeveloperIdentityProvidersWithCompletionHandler:", *(_QWORD *)(a1 + 48));
    objc_msgSend(*(id *)(a1 + 32), "_noteServiceDidChange");
    objc_msgSend(*(id *)(a1 + 32), "_noteProvidersDidChange");
  }
  else
  {
    VSErrorLogObject();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      __71__VSDeveloperModeStore_addDeveloperIdentityProvider_completionHandler___block_invoke_cold_1();

    v19 = *(_QWORD *)(a1 + 48);
    if (!v17)
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The saveError parameter must not be nil."));
    v20 = v17;
    +[VSFailable failableWithError:](VSFailable, "failableWithError:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v19 + 16))(v19, v21);

  }
}

- (void)updateExistingDeveloperIdentityProvider:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  int v9;
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  VSDefaultLogObject();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 136315138;
    v10 = "-[VSDeveloperModeStore updateExistingDeveloperIdentityProvider:completionHandler:]";
    _os_log_impl(&dword_1D2419000, v8, OS_LOG_TYPE_DEFAULT, "Entering %s", (uint8_t *)&v9, 0xCu);
  }

  if (!v6)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The identityProvider parameter must not be nil."));
  -[VSDeveloperModeStore addDeveloperIdentityProvider:completionHandler:](self, "addDeveloperIdentityProvider:completionHandler:", v6, v7);

}

- (void)removeDeveloperIdentityProviderWithUniqueID:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;
  uint8_t buf[4];
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  VSDefaultLogObject();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v15 = "-[VSDeveloperModeStore removeDeveloperIdentityProviderWithUniqueID:completionHandler:]";
    _os_log_impl(&dword_1D2419000, v8, OS_LOG_TYPE_DEFAULT, "Entering %s", buf, 0xCu);
  }

  if (!v6)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The uniqueID parameter must not be nil."));
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __86__VSDeveloperModeStore_removeDeveloperIdentityProviderWithUniqueID_completionHandler___block_invoke;
  v11[3] = &unk_1E93A0318;
  v11[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  -[VSDeveloperModeStore _performIdentityProviderBlock:](self, "_performIdentityProviderBlock:", v11);

}

void __86__VSDeveloperModeStore_removeDeveloperIdentityProviderWithUniqueID_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  id v14;
  void *v15;
  id v16;
  uint64_t v17;
  id v18;
  NSObject *v19;
  uint64_t v20;
  NSObject *v21;
  uint64_t v22;
  _QWORD v23[4];
  id v24;
  uint64_t v25;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  id v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_identityProviderFetchRequest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K = %@"), CFSTR("uniqueID"), *(_QWORD *)(a1 + 40));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPredicate:", v5);
  v31 = 0;
  objc_msgSend(v3, "executeFetchRequest:error:", v4, &v31);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v31;
  if (v6)
  {
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v8 = v6;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v28;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v28 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(v3, "deleteObject:", *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * v12++));
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
      }
      while (v10);
    }

    v26 = 0;
    v13 = objc_msgSend(v3, "save:", &v26);
    v14 = v26;
    if (v13)
    {
      objc_msgSend(*(id *)(a1 + 32), "fetchDeveloperIdentityProvidersWithCompletionHandler:", *(_QWORD *)(a1 + 48));
      objc_msgSend(*(id *)(a1 + 32), "_noteServiceDidChange");
      objc_msgSend(*(id *)(a1 + 32), "_noteProvidersDidChange");
      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = __86__VSDeveloperModeStore_removeDeveloperIdentityProviderWithUniqueID_completionHandler___block_invoke_2;
      v23[3] = &unk_1E93A03D0;
      v15 = *(void **)(a1 + 32);
      v16 = *(id *)(a1 + 40);
      v17 = *(_QWORD *)(a1 + 32);
      v24 = v16;
      v25 = v17;
      objc_msgSend(v15, "fetchDeveloperSettingsWithCompletionHandler:", v23);
      v18 = v24;
    }
    else
    {
      VSErrorLogObject();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        __86__VSDeveloperModeStore_removeDeveloperIdentityProviderWithUniqueID_completionHandler___block_invoke_cold_2();

      v22 = *(_QWORD *)(a1 + 48);
      if (!v14)
        objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The saveError parameter must not be nil."));
      v14 = v14;
      +[VSFailable failableWithError:](VSFailable, "failableWithError:", v14);
      v18 = (id)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, id))(v22 + 16))(v22, v18);

    }
  }
  else
  {
    VSErrorLogObject();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      __86__VSDeveloperModeStore_removeDeveloperIdentityProviderWithUniqueID_completionHandler___block_invoke_cold_1();

    v20 = *(_QWORD *)(a1 + 48);
    if (!v7)
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The fetchError parameter must not be nil."));
    v18 = v7;
    +[VSFailable failableWithError:](VSFailable, "failableWithError:", v18);
    v14 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v20 + 16))(v20, v14);
  }

}

void __86__VSDeveloperModeStore_removeDeveloperIdentityProviderWithUniqueID_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __86__VSDeveloperModeStore_removeDeveloperIdentityProviderWithUniqueID_completionHandler___block_invoke_3;
  v6[3] = &unk_1E93A0388;
  v4 = *(id *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v7 = v4;
  v8 = v5;
  objc_msgSend(a2, "unwrapObject:error:", v6, &__block_literal_global_85);

}

void __86__VSDeveloperModeStore_removeDeveloperIdentityProviderWithUniqueID_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[5];

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  objc_msgSend(v3, "setTopBoxIdentityProviderID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = objc_msgSend(v4, "isEqual:", v5);

  if ((_DWORD)v4)
  {
    objc_msgSend(v3, "setIsInSetTopBoxMode:", 0);
    v6 = *(void **)(a1 + 40);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __86__VSDeveloperModeStore_removeDeveloperIdentityProviderWithUniqueID_completionHandler___block_invoke_4;
    v7[3] = &unk_1E939EDB8;
    v7[4] = v6;
    objc_msgSend(v6, "updateDeveloperSettings:completionHandler:", v3, v7);
  }

}

uint64_t __86__VSDeveloperModeStore_removeDeveloperIdentityProviderWithUniqueID_completionHandler___block_invoke_4(uint64_t a1, void *a2)
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __86__VSDeveloperModeStore_removeDeveloperIdentityProviderWithUniqueID_completionHandler___block_invoke_5;
  v3[3] = &unk_1E93A0340;
  v3[4] = *(_QWORD *)(a1 + 32);
  return objc_msgSend(a2, "unwrapObject:error:", v3, &__block_literal_global_83);
}

uint64_t __86__VSDeveloperModeStore_removeDeveloperIdentityProviderWithUniqueID_completionHandler___block_invoke_5(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  VSDefaultLogObject();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1D2419000, v2, OS_LOG_TYPE_DEFAULT, "Successfully disable set-top box mode after all developer providers removed.", v4, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "_noteServiceDidChange");
  return objc_msgSend(*(id *)(a1 + 32), "_noteProvidersDidChange");
}

void __86__VSDeveloperModeStore_removeDeveloperIdentityProviderWithUniqueID_completionHandler___block_invoke_82(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  VSErrorLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __86__VSDeveloperModeStore_removeDeveloperIdentityProviderWithUniqueID_completionHandler___block_invoke_82_cold_1();

}

void __86__VSDeveloperModeStore_removeDeveloperIdentityProviderWithUniqueID_completionHandler___block_invoke_84(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  VSErrorLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __86__VSDeveloperModeStore_removeDeveloperIdentityProviderWithUniqueID_completionHandler___block_invoke_84_cold_1();

}

- (void)updateDeveloperSettings:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD block[5];
  id v13;
  id v14;
  uint8_t buf[4];
  const char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  VSDefaultLogObject();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v16 = "-[VSDeveloperModeStore updateDeveloperSettings:completionHandler:]";
    _os_log_impl(&dword_1D2419000, v8, OS_LOG_TYPE_DEFAULT, "Entering %s", buf, 0xCu);
  }

  if (!v6)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The settings parameter must not be nil."));
  -[VSDeveloperModeStore settingsQueue](self, "settingsQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66__VSDeveloperModeStore_updateDeveloperSettings_completionHandler___block_invoke;
  block[3] = &unk_1E939F1F8;
  block[4] = self;
  v13 = v6;
  v14 = v7;
  v10 = v7;
  v11 = v6;
  dispatch_async(v9, block);

}

void __66__VSDeveloperModeStore_updateDeveloperSettings_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  char v8;
  id v9;
  void *v10;
  id v11;
  NSObject *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  int v26;
  id v27;
  NSObject *v28;
  void *v29;
  uint64_t v30;
  id v31;
  NSObject *v32;
  uint64_t v33;
  NSObject *v34;
  uint64_t v35;
  void *v36;
  id v37;
  id v38;
  id v39;
  uint8_t buf[4];
  void *v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "settingsPropertiesURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "path");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v4)
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The [settingsURL path] parameter must not be nil."));
    objc_msgSend(v3, "path");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    VSDefaultLogObject();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v41 = v5;
      _os_log_impl(&dword_1D2419000, v6, OS_LOG_TYPE_DEFAULT, "Will update developer settings using path %@", buf, 0xCu);
    }

    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "fileExistsAtPath:", v5))
    {
      v39 = 0;
      v8 = objc_msgSend(v7, "removeItemAtPath:error:", v5, &v39);
      v9 = v39;
      v10 = v9;
      if ((v8 & 1) == 0)
      {
        if (!v9)
          objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The rmErrorOrNil parameter must not be nil."));
        v11 = v10;
        VSErrorLogObject();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          __66__VSDeveloperModeStore_updateDeveloperSettings_completionHandler___block_invoke_cold_4();

      }
    }
    v13 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(*(id *)(a1 + 40), "isInSetTopBoxMode"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKey:", v14, CFSTR("VSDeveloperSettingsPropertyIsInSetTopBoxModeKey"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(*(id *)(a1 + 40), "cacheBusterEnabled"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKey:", v15, CFSTR("VSDeveloperSettingsPropertyIsCacheBusterEnabledKey"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(*(id *)(a1 + 40), "requestTimeoutsDisabled"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKey:", v16, CFSTR("VSDeveloperSettingsPropertyRequestTimeoutsDisabled"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(*(id *)(a1 + 40), "simulateExpiredToken"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKey:", v17, CFSTR("VSDeveloperSettingsPropertySimulateExpiredToken"));

    objc_msgSend(*(id *)(a1 + 40), "setTopBoxBundleIdentifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "vs_setObjectUnlessNil:forKey:", v18, CFSTR("VSDeveloperSettingsPropertySetTopBoxBundleIdentifierKey"));

    objc_msgSend(*(id *)(a1 + 40), "setTopBoxUserToken");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "vs_setObjectUnlessNil:forKey:", v19, CFSTR("VSDeveloperSettingsPropertySetTopBoxUserTokenKey"));

    objc_msgSend(*(id *)(a1 + 40), "setTopBoxIdentityProviderID");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "vs_setObjectUnlessNil:forKey:", v20, CFSTR("VSDeveloperSettingsPropertySetTopBoxProviderIDKey"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(*(id *)(a1 + 40), "setTopBoxUseDeviceProfile"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKey:", v21, CFSTR("VSDeveloperSettingsPropertySetTopBoxUseDeviceProfileKey"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(*(id *)(a1 + 40), "setTopBoxSupportsOptOut"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKey:", v22, CFSTR("VSDeveloperSettingsPropertySetTopBoxSupportsOptOut"));

    v38 = 0;
    objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v13, 200, 0, &v38);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v38;
    v25 = v24;
    if (v23)
    {
      v37 = v24;
      v26 = objc_msgSend(v23, "writeToFile:options:error:", v5, 1, &v37);
      v27 = v37;

      if (v26)
      {
        VSDefaultLogObject();
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v41 = v5;
          _os_log_impl(&dword_1D2419000, v28, OS_LOG_TYPE_DEFAULT, "successfully wrote developer settings to %@", buf, 0xCu);
        }

        objc_msgSend(*(id *)(a1 + 32), "_noteServiceDidChange");
        objc_msgSend(*(id *)(a1 + 32), "_noteSettingsDidChange");
        objc_msgSend(*(id *)(a1 + 32), "accountStoreChangeRemoteNotifier");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "postNotification");

        v30 = *(_QWORD *)(a1 + 48);
        +[VSFailable failableWithObject:](VSFailable, "failableWithObject:", *(_QWORD *)(a1 + 40));
        v31 = (id)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, id))(v30 + 16))(v30, v31);
        goto LABEL_31;
      }
      if (!v27)
        objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The errorOrNil parameter must not be nil."));
      v31 = v27;
      VSErrorLogObject();
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        __66__VSDeveloperModeStore_updateDeveloperSettings_completionHandler___block_invoke_cold_3();
    }
    else
    {
      if (!v24)
        objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The errorOrNil parameter must not be nil."));
      v31 = v25;
      VSErrorLogObject();
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        __66__VSDeveloperModeStore_updateDeveloperSettings_completionHandler___block_invoke_cold_2();
    }

    v35 = *(_QWORD *)(a1 + 48);
    +[VSFailable failableWithError:](VSFailable, "failableWithError:", v31);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v35 + 16))(v35, v36);

    v27 = v31;
LABEL_31:

    goto LABEL_32;
  }
  VSErrorLogObject();
  v32 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    __68__VSDeveloperModeStore_fetchDeveloperSettingsWithCompletionHandler___block_invoke_cold_1();

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("VSDeveloperServiceErrorDomain"), -2, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = *(_QWORD *)(a1 + 48);
  +[VSFailable failableWithError:](VSFailable, "failableWithError:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v33 + 16))(v33, v7);
LABEL_32:

}

- (void)setPersistentContainer:(id)a3
{
  objc_storeStrong((id *)&self->_persistentContainer, a3);
}

- (void)setSettingsQueue:(id)a3
{
  objc_storeStrong((id *)&self->_settingsQueue, a3);
}

- (VSRemoteNotifier)serviceChangeRemoteNotifier
{
  return self->_serviceChangeRemoteNotifier;
}

- (void)setServiceChangeRemoteNotifier:(id)a3
{
  objc_storeStrong((id *)&self->_serviceChangeRemoteNotifier, a3);
}

- (VSRemoteNotifier)settingsChangeRemoteNotifier
{
  return self->_settingsChangeRemoteNotifier;
}

- (void)setSettingsChangeRemoteNotifier:(id)a3
{
  objc_storeStrong((id *)&self->_settingsChangeRemoteNotifier, a3);
}

- (VSRemoteNotifier)providersChangeRemoteNotifier
{
  return self->_providersChangeRemoteNotifier;
}

- (void)setProvidersChangeRemoteNotifier:(id)a3
{
  objc_storeStrong((id *)&self->_providersChangeRemoteNotifier, a3);
}

- (VSRemoteNotifier)accountStoreChangeRemoteNotifier
{
  return self->_accountStoreChangeRemoteNotifier;
}

- (void)setAccountStoreChangeRemoteNotifier:(id)a3
{
  objc_storeStrong((id *)&self->_accountStoreChangeRemoteNotifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountStoreChangeRemoteNotifier, 0);
  objc_storeStrong((id *)&self->_providersChangeRemoteNotifier, 0);
  objc_storeStrong((id *)&self->_settingsChangeRemoteNotifier, 0);
  objc_storeStrong((id *)&self->_serviceChangeRemoteNotifier, 0);
  objc_storeStrong((id *)&self->_settingsQueue, 0);
  objc_storeStrong((id *)&self->_persistentContainer, 0);
}

- (void)settingsPropertiesURL
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D2419000, v0, v1, "Error creating container directory %@: %@");
  OUTLINED_FUNCTION_3();
}

- (void)legacySettingsPropertiesPath
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_0(&dword_1D2419000, v0, v1, "Unable to obtain container directory path.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

void __77__VSDeveloperModeStore_fetchDeveloperIdentityProvidersWithCompletionHandler___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2(&dword_1D2419000, v0, v1, "Error fetching developer settings for developer provider enrichment: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __77__VSDeveloperModeStore_fetchDeveloperIdentityProvidersWithCompletionHandler___block_invoke_48_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2(&dword_1D2419000, v0, v1, "Error fetching developer identity providers: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __71__VSDeveloperModeStore_addDeveloperIdentityProvider_completionHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2(&dword_1D2419000, v0, v1, "Error adding provider: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __86__VSDeveloperModeStore_removeDeveloperIdentityProviderWithUniqueID_completionHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2(&dword_1D2419000, v0, v1, "Error fetching provider to delete: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __86__VSDeveloperModeStore_removeDeveloperIdentityProviderWithUniqueID_completionHandler___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2(&dword_1D2419000, v0, v1, "Error saving deletion: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __86__VSDeveloperModeStore_removeDeveloperIdentityProviderWithUniqueID_completionHandler___block_invoke_82_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2(&dword_1D2419000, v0, v1, "Error updating developer settings to disable set-top box mode: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __86__VSDeveloperModeStore_removeDeveloperIdentityProviderWithUniqueID_completionHandler___block_invoke_84_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2(&dword_1D2419000, v0, v1, "Error fetching developer settings to disable set-top box mode: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __68__VSDeveloperModeStore_fetchDeveloperSettingsWithCompletionHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_0(&dword_1D2419000, v0, v1, "Failed to get settings property file path", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

void __68__VSDeveloperModeStore_fetchDeveloperSettingsWithCompletionHandler___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2(&dword_1D2419000, v0, v1, "Error serializing settings properties: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __66__VSDeveloperModeStore_updateDeveloperSettings_completionHandler___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2(&dword_1D2419000, v0, v1, "Error serializing developer settings: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __66__VSDeveloperModeStore_updateDeveloperSettings_completionHandler___block_invoke_cold_3()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D2419000, v0, v1, "Error writing developer settings to %@: %@");
  OUTLINED_FUNCTION_3();
}

void __66__VSDeveloperModeStore_updateDeveloperSettings_completionHandler___block_invoke_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2(&dword_1D2419000, v0, v1, "Error deleting developer settings property file: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

@end
