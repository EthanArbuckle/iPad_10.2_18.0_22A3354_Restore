@implementation ENConfigurationStore

void __60__ENConfigurationStore_clearTemporaryCountrySubdivisionList__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  int v4;
  void *v5;
  int v6;
  id v7;
  id v8;
  char v9;

  objc_msgSend(*(id *)(a1 + 32), "developerSubdivisionListCacheURL");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "path");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = 1;
  objc_msgSend(MEMORY[0x1E0CB3618], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "fileExistsAtPath:isDirectory:", v2, &v9);

  if (!v4)
  {
LABEL_11:
    v7 = 0;
    goto LABEL_12;
  }
  objc_msgSend(MEMORY[0x1E0CB3618], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  v6 = objc_msgSend(v5, "removeItemAtPath:error:", v2, &v8);
  v7 = v8;

  if (v6 && !v7)
  {
    if (gLogCategory_ENConfigurationStore <= 30
      && (gLogCategory_ENConfigurationStore != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
    }
    goto LABEL_11;
  }
  if (gLogCategory_ENConfigurationStore <= 90
    && (gLogCategory_ENConfigurationStore != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }
LABEL_12:

}

void __58__ENConfigurationStore_clearTemporaryServerConfigurations__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  int v4;
  void *v5;
  int v6;
  id v7;
  id v8;
  char v9;

  objc_msgSend(*(id *)(a1 + 32), "developerConfigurationsURL");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "path");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = 1;
  objc_msgSend(MEMORY[0x1E0CB3618], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "fileExistsAtPath:isDirectory:", v2, &v9);

  if (!v4)
  {
LABEL_11:
    v7 = 0;
    goto LABEL_12;
  }
  objc_msgSend(MEMORY[0x1E0CB3618], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  v6 = objc_msgSend(v5, "removeItemAtPath:error:", v2, &v8);
  v7 = v8;

  if (v6 && !v7)
  {
    if (gLogCategory_ENConfigurationStore <= 30
      && (gLogCategory_ENConfigurationStore != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
    }
    goto LABEL_11;
  }
  if (gLogCategory_ENConfigurationStore <= 90
    && (gLogCategory_ENConfigurationStore != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }
LABEL_12:

}

- (id)subdivisionListCacheURL
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[ENConfigurationStore regionCacheURL](self, "regionCacheURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByAppendingPathComponent:", CFSTR("Subdivisions"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E90], "fileURLWithPath:isDirectory:", v4, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (OS_dispatch_queue)storeQueue
{
  return self->_storeQueue;
}

- (id)regionCacheURL
{
  void *v2;
  void *v3;

  -[NSString stringByAppendingPathComponent:](self->_directoryPath, "stringByAppendingPathComponent:", CFSTR("Regions"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E90], "fileURLWithPath:isDirectory:", v2, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)developerSubdivisionListCacheURL
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[ENConfigurationStore subdivisionListCacheURL](self, "subdivisionListCacheURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByAppendingPathComponent:", CFSTR("Developer"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E90], "fileURLWithPath:isDirectory:", v4, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)developerConfigurationsURL
{
  void *v2;
  void *v3;

  -[ENConfigurationStore configurationCacheURL](self, "configurationCacheURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByAppendingPathComponent:", CFSTR("developer"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)configurationCacheURL
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[ENConfigurationStore regionCacheURL](self, "regionCacheURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByAppendingPathComponent:", CFSTR("Configurations"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E90], "fileURLWithPath:isDirectory:", v4, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)clearTemporaryServerConfigurations
{
  NSObject *v3;
  _QWORD block[5];

  -[ENConfigurationStore storeQueue](self, "storeQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__ENConfigurationStore_clearTemporaryServerConfigurations__block_invoke;
  block[3] = &unk_1E87D9C28;
  block[4] = self;
  dispatch_sync(v3, block);

}

- (void)clearTemporaryCountrySubdivisionList
{
  NSObject *v3;
  _QWORD block[5];

  -[ENConfigurationStore storeQueue](self, "storeQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__ENConfigurationStore_clearTemporaryCountrySubdivisionList__block_invoke;
  block[3] = &unk_1E87D9C28;
  block[4] = self;
  dispatch_sync(v3, block);

}

- (ENConfigurationStore)init
{
  void *v3;
  ENConfigurationStore *v4;

  ENDataVaultPath();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[ENConfigurationStore initWithDirectoryPath:](self, "initWithDirectoryPath:", v3);

  return v4;
}

- (ENConfigurationStore)initWithDirectoryPath:(id)a3
{
  id v4;
  ENConfigurationStore *v5;
  uint64_t v6;
  NSString *directoryPath;
  NSObject *v8;
  dispatch_queue_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  char v13;
  id v14;
  void *v15;
  char v16;
  id v17;
  void *v18;
  char v19;
  id v20;
  NSObject *v21;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  id v28;
  _QWORD block[4];
  ENConfigurationStore *v30;
  id v31;
  id v32;
  id v33;
  objc_super v34;

  v4 = a3;
  v34.receiver = self;
  v34.super_class = (Class)ENConfigurationStore;
  v5 = -[ENConfigurationStore init](&v34, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    directoryPath = v5->_directoryPath;
    v5->_directoryPath = (NSString *)v6;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = dispatch_queue_create("com.apple.exposureNotification.configuration.store", v8);
    -[ENConfigurationStore setStoreQueue:](v5, "setStoreQueue:", v9);

    -[ENConfigurationStore setDeveloperServerConfiguration:](v5, "setDeveloperServerConfiguration:", CFPrefs_GetInt64() != 0);
    CFStringGetTypeID();
    v10 = (void *)CFPrefs_CopyTypedValue();
    -[ENConfigurationStore setRegionIdentifierOverride:](v5, "setRegionIdentifierOverride:", v10);

    -[ENConfigurationStore regionCacheURL](v5, "regionCacheURL");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = *MEMORY[0x1E0C999E0];
    v33 = 0;
    v13 = objc_msgSend(v11, "setResourceValue:forKey:error:", MEMORY[0x1E0C9AA98], v12, &v33);
    v14 = v33;

    if ((v13 & 1) == 0
      && gLogCategory_ENConfigurationStore <= 90
      && (gLogCategory_ENConfigurationStore != -1 || _LogCategory_Initialize()))
    {
      -[ENConfigurationStore regionCacheURL](v5, "regionCacheURL");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = v14;
      LogPrintF_safe();

    }
    -[ENConfigurationStore configurationCacheURL](v5, "configurationCacheURL", v23, v26);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = v14;
    v16 = objc_msgSend(v15, "setResourceValue:forKey:error:", MEMORY[0x1E0C9AA98], v12, &v32);
    v17 = v32;

    if ((v16 & 1) == 0
      && gLogCategory_ENConfigurationStore <= 90
      && (gLogCategory_ENConfigurationStore != -1 || _LogCategory_Initialize()))
    {
      -[ENConfigurationStore configurationCacheURL](v5, "configurationCacheURL");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = v17;
      LogPrintF_safe();

    }
    -[ENConfigurationStore systemConfigurationCacheURL](v5, "systemConfigurationCacheURL", v24, v27);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = v17;
    v19 = objc_msgSend(v18, "setResourceValue:forKey:error:", MEMORY[0x1E0C9AA98], v12, &v31);
    v20 = v31;

    if ((v19 & 1) == 0
      && gLogCategory_ENConfigurationStore <= 90
      && (gLogCategory_ENConfigurationStore != -1 || _LogCategory_Initialize()))
    {
      -[ENConfigurationStore systemConfigurationCacheURL](v5, "systemConfigurationCacheURL");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = v20;
      LogPrintF_safe();

    }
    -[ENConfigurationStore storeQueue](v5, "storeQueue", v25, v28);
    v21 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __46__ENConfigurationStore_initWithDirectoryPath___block_invoke;
    block[3] = &unk_1E87D9C28;
    v30 = v5;
    dispatch_async(v21, block);

  }
  return v5;
}

void __46__ENConfigurationStore_initWithDirectoryPath___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  int v13;
  uint64_t v14;
  void *v15;
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint64_t v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "subdivisionListCacheURL");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3618], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v3 = *MEMORY[0x1E0C999C8];
  v21 = *MEMORY[0x1E0C999C8];
  objc_msgSend(MEMORY[0x1E0C99D18], "arrayWithObjects:count:", &v21, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", v1, v4, 4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
  if (v6)
  {
    v7 = v6;
    v15 = v1;
    v8 = 0;
    v9 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        v11 = v8;
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v5);
        v12 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        v16 = 0;
        v13 = objc_msgSend(v12, "getResourceValue:forKey:error:", &v16, v3, 0);
        v8 = v16;

        if (v13 && (objc_msgSend(v8, "BOOLValue") & 1) == 0)
        {
          if (gLogCategory_ENConfigurationStore <= 30
            && (gLogCategory_ENConfigurationStore != -1 || _LogCategory_Initialize()))
          {
            LogPrintF_safe();
            objc_msgSend(v2, "removeItemAtURL:error:", v12, 0, v12);
          }
          else
          {
            objc_msgSend(v2, "removeItemAtURL:error:", v12, 0, v14);
          }
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
    }
    while (v7);

    v1 = v15;
  }

}

- (id)configurationForRegion:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__7;
  v16 = __Block_byref_object_dispose__7;
  v17 = 0;
  -[ENConfigurationStore storeQueue](self, "storeQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__ENConfigurationStore_configurationForRegion___block_invoke;
  block[3] = &unk_1E87D9D88;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(v5, block);

  v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __47__ENConfigurationStore_configurationForRegion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_configurationForRegion:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)_configurationForRegion:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  id v14;
  void *v16;

  v4 = a3;
  if (v4)
  {
    -[ENConfigurationStore _serverConfigurationResponseForRegion:](self, "_serverConfigurationResponseForRegion:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0CAA390]), "initWithServerResponseDictionary:", v5);
    v7 = (void *)v6;
    if (!v5 || !v6)
    {
      if (gLogCategory_ENConfigurationStore <= 90
        && (gLogCategory_ENConfigurationStore != -1 || _LogCategory_Initialize()))
      {
        LogPrintF_safe();
      }
      v14 = 0;
      goto LABEL_19;
    }
    -[ENConfigurationStore _existingConfigurationForRegion:](self, "_existingConfigurationForRegion:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CAA380]), "initWithVersion:region:", objc_msgSend(v7, "enVersion"), v4);
    objc_msgSend(v8, "userConsent");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9 && (unint64_t)objc_msgSend(v7, "enVersion") >= 2)
    {
      objc_msgSend(v7, "legalConsentVersion");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v10)
      {
LABEL_11:
        objc_msgSend(v8, "region");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "isEqual:", v4);

        if ((v13 & 1) != 0)
        {
          v14 = v8;
        }
        else
        {
          if (gLogCategory__ENConfigurationStore <= 90
            && (gLogCategory__ENConfigurationStore != -1 || _LogCategory_Initialize()))
          {
            objc_msgSend(v8, "region");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            LogPrintF_safe();

          }
          v14 = 0;
        }

LABEL_19:
        goto LABEL_20;
      }
      objc_msgSend(v7, "legalConsentVersion");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CAA3A8]), "initWithConsentVersion:", v9);
      objc_msgSend(v8, "setUserConsent:", v11);

    }
    goto LABEL_11;
  }
  if (gLogCategory_ENConfigurationStore <= 90
    && (gLogCategory_ENConfigurationStore != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }
  v14 = 0;
LABEL_20:

  return v14;
}

- (id)_existingConfigurationForRegion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "regionCode");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[ENConfigurationStore fileURLforRegionConfiguration:](self, "fileURLforRegionConfiguration:", v6);
    v7 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v7, "path");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3618], "defaultManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v7) = objc_msgSend(v9, "fileExistsAtPath:", v8);

    if ((v7 & 1) == 0)
    {
      objc_msgSend(v5, "countryCode");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[ENConfigurationStore fileURLforRegionConfiguration:](self, "fileURLforRegionConfiguration:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "path");
      v12 = objc_claimAutoreleasedReturnValue();

      v8 = (void *)v12;
    }
    -[ENConfigurationStore _existingConfigurationForRegionPath:](self, "_existingConfigurationForRegionPath:", v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if (gLogCategory_ENConfigurationStore <= 90
      && (gLogCategory_ENConfigurationStore != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
    }
    v13 = 0;
  }

  return v13;
}

- (id)_existingConfigurationForRegionPath:(id)a3
{
  id v3;
  void *v4;
  char v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  void *v14;
  id v15;
  id v16;

  v3 = a3;
  if (!v3)
  {
    if (gLogCategory_ENConfigurationStore > 90
      || gLogCategory_ENConfigurationStore == -1 && !_LogCategory_Initialize())
    {
      goto LABEL_29;
    }
LABEL_25:
    LogPrintF_safe();
LABEL_29:
    v11 = 0;
    goto LABEL_19;
  }
  objc_msgSend(MEMORY[0x1E0CB3618], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "fileExistsAtPath:", v3);

  if ((v5 & 1) == 0)
  {
    if (gLogCategory_ENConfigurationStore > 10
      || gLogCategory_ENConfigurationStore == -1 && !_LogCategory_Initialize())
    {
      goto LABEL_29;
    }
    goto LABEL_25;
  }
  v16 = 0;
  objc_msgSend(MEMORY[0x1E0C99D58], "dataWithContentsOfFile:options:error:", v3, 0, &v16);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v16;
  if (!v7 && v6)
    goto LABEL_10;
  if (gLogCategory_ENConfigurationStore <= 90
    && (gLogCategory_ENConfigurationStore != -1 || _LogCategory_Initialize()))
  {
    objc_msgSend(v3, "lastPathComponent");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    LogPrintF_safe();

  }
  if (v6)
  {
LABEL_10:
    v8 = (void *)MEMORY[0x1E0C99E68];
    v9 = objc_opt_class();
    objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v7;
    objc_msgSend(MEMORY[0x1E0CB3708], "unarchivedObjectOfClasses:fromData:error:", v10, v6, &v15);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v15;

    if (v12)
    {
      if (gLogCategory_ENConfigurationStore <= 90
        && (gLogCategory_ENConfigurationStore != -1 || _LogCategory_Initialize()))
      {
        LogPrintF_safe();
      }

      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
    v12 = v7;
  }

LABEL_19:
  return v11;
}

- (BOOL)saveRegionConfiguration:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  id v8;
  _QWORD v10[5];
  id v11;
  uint64_t *v12;
  id *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;

  v6 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  -[ENConfigurationStore storeQueue](self, "storeQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __54__ENConfigurationStore_saveRegionConfiguration_error___block_invoke;
  v10[3] = &unk_1E87DA0C0;
  v10[4] = self;
  v11 = v6;
  v12 = &v14;
  v13 = a4;
  v8 = v6;
  dispatch_barrier_sync(v7, v10);

  LOBYTE(self) = *((_BYTE *)v15 + 24);
  _Block_object_dispose(&v14, 8);
  return (char)self;
}

uint64_t __54__ENConfigurationStore_saveRegionConfiguration_error___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_saveRegionConfiguration:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = result;
  return result;
}

- (BOOL)_saveRegionConfiguration:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  id v17;
  uint64_t v18;
  char v19;
  id v20;
  void *v21;
  void *v23;
  void *v24;
  id v25;
  id v26;
  id v27;
  id v28;

  v6 = a3;
  if (MKBDeviceUnlockedSinceBoot() == 1)
  {
    objc_msgSend(v6, "region");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "regionCode");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[ENConfigurationStore fileURLforRegionConfiguration:](self, "fileURLforRegionConfiguration:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = v6;
    objc_msgSend(v10, "region");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[ENConfigurationStore _existingConfigurationForRegion:](self, "_existingConfigurationForRegion:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = v10;
    if (v12)
    {
      v13 = v10;
      if ((objc_msgSend(v12, "isEqual:", v10) & 1) == 0)
      {
        objc_msgSend(v12, "updatedWithConfiguration:", v10);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (gLogCategory_ENConfigurationStore <= 30
          && (gLogCategory_ENConfigurationStore != -1 || _LogCategory_Initialize()))
        {
          v23 = v13;
          LogPrintF_safe();
        }
      }
    }

    if (v9)
    {
      objc_msgSend(v9, "URLByDeletingLastPathComponent");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3618], "defaultManager");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = 0;
      v16 = objc_msgSend(v15, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v14, 1, 0, &v28);
      v17 = v28;

      if (v16)
      {
        v18 = *MEMORY[0x1E0C999E0];
        v27 = v17;
        v19 = objc_msgSend(v14, "setResourceValue:forKey:error:", MEMORY[0x1E0C9AA98], v18, &v27);
        v20 = v27;

        if ((v19 & 1) == 0
          && gLogCategory_ENConfigurationStore <= 90
          && (gLogCategory_ENConfigurationStore != -1 || _LogCategory_Initialize()))
        {
          v23 = v14;
          v25 = v20;
          LogPrintF_safe();
        }
        v26 = v20;
        LOBYTE(v16) = 1;
        objc_msgSend(MEMORY[0x1E0CB3700], "archivedDataWithRootObject:requiringSecureCoding:error:", v13, 1, &v26, v23, v25);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = v26;

        if (!v17)
        {
          if (objc_msgSend(v21, "writeToURL:atomically:", v9, 1))
          {
            if (gLogCategory_ENConfigurationStore <= 10
              && (gLogCategory_ENConfigurationStore != -1 || _LogCategory_Initialize()))
            {
              LogPrintF_safe();
            }
          }
          else
          {
            if (gLogCategory__ENConfigurationStore <= 90
              && (gLogCategory__ENConfigurationStore != -1 || _LogCategory_Initialize()))
            {
              objc_msgSend(v10, "region");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              LogPrintF_safe();

            }
            LOBYTE(v16) = 0;
          }
        }

      }
      if (a4)
        *a4 = objc_retainAutorelease(v17);

    }
    else
    {
      if (gLogCategory_ENConfigurationStore <= 90
        && (gLogCategory_ENConfigurationStore != -1 || _LogCategory_Initialize()))
      {
        LogPrintF_safe();
      }
      LOBYTE(v16) = 0;
      v17 = 0;
    }

  }
  else
  {
    ENErrorF();
    v17 = (id)objc_claimAutoreleasedReturnValue();
    LOBYTE(v16) = 0;
  }

  return v16;
}

- (BOOL)saveCountrySubdivisionList:(id)a3 region:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD block[5];
  id v15;
  id v16;
  uint64_t *v17;
  id *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  char v22;

  v8 = a3;
  v9 = a4;
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0;
  -[ENConfigurationStore storeQueue](self, "storeQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64__ENConfigurationStore_saveCountrySubdivisionList_region_error___block_invoke;
  block[3] = &unk_1E87D9CA0;
  block[4] = self;
  v15 = v8;
  v16 = v9;
  v17 = &v19;
  v18 = a5;
  v11 = v9;
  v12 = v8;
  dispatch_sync(v10, block);

  LOBYTE(self) = *((_BYTE *)v20 + 24);
  _Block_object_dispose(&v19, 8);
  return (char)self;
}

uint64_t __64__ENConfigurationStore_saveCountrySubdivisionList_region_error___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_saveCountrySubdivisionList:country:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 64));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = result;
  return result;
}

- (BOOL)_saveCountrySubdivisionList:(id)a3 country:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  uint64_t v14;
  char v15;
  id v16;
  int v17;
  void *v19;
  id v20;
  id v21;

  v8 = a3;
  objc_msgSend(a4, "countryCode");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[ENConfigurationStore fileURLforCountrySubdivisionList:](self, "fileURLforCountrySubdivisionList:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "URLByDeletingLastPathComponent");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3618], "defaultManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v11, 1, 0, a5);

  if (v13)
  {
    v14 = *MEMORY[0x1E0C999E0];
    v21 = 0;
    v15 = objc_msgSend(v11, "setResourceValue:forKey:error:", MEMORY[0x1E0C9AA98], v14, &v21);
    v16 = v21;
    if ((v15 & 1) == 0
      && gLogCategory_ENConfigurationStore <= 90
      && (gLogCategory_ENConfigurationStore != -1 || _LogCategory_Initialize()))
    {
      v19 = v11;
      v20 = v16;
      LogPrintF_safe();
    }
    v17 = objc_msgSend(v8, "writeToURL:error:", v10, a5, v19, v20);
    if (v17
      && gLogCategory_ENConfigurationStore <= 10
      && (gLogCategory_ENConfigurationStore != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
    }

  }
  else
  {
    LOBYTE(v17) = 0;
  }

  return v17;
}

- (BOOL)saveRegionHash:(id)a3 region:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD block[5];
  id v15;
  id v16;
  uint64_t *v17;
  id *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  char v22;

  v8 = a3;
  v9 = a4;
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0;
  -[ENConfigurationStore storeQueue](self, "storeQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__ENConfigurationStore_saveRegionHash_region_error___block_invoke;
  block[3] = &unk_1E87D9CA0;
  block[4] = self;
  v15 = v8;
  v16 = v9;
  v17 = &v19;
  v18 = a5;
  v11 = v9;
  v12 = v8;
  dispatch_sync(v10, block);

  LOBYTE(self) = *((_BYTE *)v20 + 24);
  _Block_object_dispose(&v19, 8);
  return (char)self;
}

uint64_t __52__ENConfigurationStore_saveRegionHash_region_error___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_saveRegionHash:region:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 64));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = result;
  return result;
}

- (BOOL)_saveRegionHash:(id)a3 region:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  uint64_t v14;
  char v15;
  id v16;
  void *v17;
  char v18;
  id v19;
  void *v20;
  char v21;
  BOOL v22;
  id v24;
  id v25;

  v8 = a3;
  objc_msgSend(a4, "countryCode");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[ENConfigurationStore fileURLForCountryRegionHash:](self, "fileURLForCountryRegionHash:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "URLByDeletingLastPathComponent");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3618], "defaultManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v11, 1, 0, a5);

  if (!v13)
  {
    v22 = 0;
    goto LABEL_24;
  }
  v14 = *MEMORY[0x1E0C999E0];
  v25 = 0;
  v15 = objc_msgSend(v11, "setResourceValue:forKey:error:", MEMORY[0x1E0C9AA98], v14, &v25);
  v16 = v25;
  if ((v15 & 1) == 0
    && gLogCategory_ENConfigurationStore <= 90
    && (gLogCategory_ENConfigurationStore != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3618], "defaultManager");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 0;
    v18 = objc_msgSend(v17, "removeItemAtURL:error:", v10, &v24);
    v19 = v24;

    if ((v18 & 1) == 0)
    {
      if (objc_msgSend(v19, "code") != 4
        || (objc_msgSend(v19, "domain"),
            v20 = (void *)objc_claimAutoreleasedReturnValue(),
            v21 = objc_msgSend(v20, "isEqualToString:", *MEMORY[0x1E0CB28B0]),
            v20,
            (v21 & 1) == 0))
      {
        if (a5)
          *a5 = objc_retainAutorelease(v19);

        goto LABEL_20;
      }
    }

LABEL_12:
    if (gLogCategory_ENConfigurationStore <= 10
      && (gLogCategory_ENConfigurationStore != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
    }
    v22 = 1;
    goto LABEL_23;
  }
  if ((objc_msgSend(v8, "writeToURL:atomically:encoding:error:", v10, 1, 4, a5) & 1) != 0)
    goto LABEL_12;
LABEL_20:
  v22 = 0;
LABEL_23:

LABEL_24:
  return v22;
}

- (BOOL)saveServerConfigurationResponse:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  id v8;
  _QWORD v10[5];
  id v11;
  uint64_t *v12;
  id *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;

  v6 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  -[ENConfigurationStore storeQueue](self, "storeQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __62__ENConfigurationStore_saveServerConfigurationResponse_error___block_invoke;
  v10[3] = &unk_1E87DA0C0;
  v10[4] = self;
  v11 = v6;
  v12 = &v14;
  v13 = a4;
  v8 = v6;
  dispatch_sync(v7, v10);

  LOBYTE(self) = *((_BYTE *)v15 + 24);
  _Block_object_dispose(&v14, 8);
  return (char)self;
}

uint64_t __62__ENConfigurationStore_saveServerConfigurationResponse_error___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_saveServerConfigurationResponse:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = result;
  return result;
}

- (BOOL)_saveServerConfigurationResponse:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  uint64_t v17;
  char v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  _BOOL4 v26;
  BOOL v27;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  id v34;

  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("config"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("enVersion"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8 && (int)objc_msgSend(v8, "intValue") > 0)
  {
    -[ENConfigurationStore regionFromServerResponse:](self, "regionFromServerResponse:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
    {
      objc_msgSend(v10, "regionCode");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[ENConfigurationStore fileURLforRegionServerConfiguration:](self, "fileURLforRegionServerConfiguration:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v13, "URLByDeletingLastPathComponent");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3618], "defaultManager");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v14, 1, 0, a4);

      if (v16)
      {
        v33 = v7;
        v17 = *MEMORY[0x1E0C999E0];
        v34 = 0;
        v18 = objc_msgSend(v14, "setResourceValue:forKey:error:", MEMORY[0x1E0C9AA98], v17, &v34);
        v19 = v34;
        if ((v18 & 1) == 0
          && gLogCategory_ENConfigurationStore <= 90
          && (gLogCategory_ENConfigurationStore != -1 || _LogCategory_Initialize()))
        {
          v29 = v14;
          v31 = v19;
          LogPrintF_safe();
        }
        v32 = v19;
        objc_msgSend(MEMORY[0x1E0CB3700], "archivedDataWithRootObject:requiringSecureCoding:error:", v6, 1, a4, v29, v31);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = v20;
        if (v20 && objc_msgSend(v20, "writeToURL:options:error:", v13, 1, a4))
        {
          if (gLogCategory_ENConfigurationStore <= 10
            && (gLogCategory_ENConfigurationStore != -1 || _LogCategory_Initialize()))
          {
            v30 = v13;
            LogPrintF_safe();
          }
          -[ENConfigurationStore _existingConfigurationForRegion:](self, "_existingConfigurationForRegion:", v11, v30);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = v22;
          v27 = 1;
          if (v22)
          {
            v24 = objc_msgSend(v22, "enVersion");
            if (v24 != objc_msgSend(v9, "unsignedIntegerValue"))
            {
              -[ENConfigurationStore _configurationForRegion:](self, "_configurationForRegion:", v11);
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v25, "setEnVersion:", objc_msgSend(v9, "unsignedIntegerValue"));
              v26 = -[ENConfigurationStore _saveRegionConfiguration:error:](self, "_saveRegionConfiguration:error:", v25, a4);

              if (!v26)
                v27 = 0;
            }
          }

        }
        else
        {
          v27 = 0;
        }

        v7 = v33;
      }
      else
      {
        v27 = 0;
      }

    }
    else if (a4)
    {
      ENErrorF();
      v27 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v27 = 0;
    }

  }
  else if (a4)
  {
    ENErrorF();
    v27 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v27 = 0;
  }

  return v27;
}

- (BOOL)removeConfigurationsForRegion:(id)a3 includingSubdivisions:(BOOL)a4 error:(id *)a5
{
  _BOOL4 v6;
  id v8;
  void *v9;
  BOOL v10;
  void *v11;
  BOOL v12;
  char v13;
  _QWORD v15[7];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;

  v6 = a4;
  v8 = a3;
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 1;
  objc_msgSend(v8, "countryCode");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[ENConfigurationStore removeConfigurationsForRegionCode:error:](self, "removeConfigurationsForRegionCode:error:", v9, a5);
  *((_BYTE *)v17 + 24) = v10;

  if (v6)
  {
    objc_msgSend(v8, "countryCode");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __82__ENConfigurationStore_removeConfigurationsForRegion_includingSubdivisions_error___block_invoke;
    v15[3] = &unk_1E87DB408;
    v15[4] = self;
    v15[5] = &v16;
    v15[6] = a5;
    -[ENConfigurationStore enumerateCachedRegionServerConfigurationsWithCountryCode:handler:](self, "enumerateCachedRegionServerConfigurationsWithCountryCode:handler:", v11, v15);
  }
  else
  {
    objc_msgSend(v8, "regionCode");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[ENConfigurationStore removeConfigurationsForRegionCode:error:](self, "removeConfigurationsForRegionCode:error:", v11, a5);
    *((_BYTE *)v17 + 24) = v12;
  }

  v13 = *((_BYTE *)v17 + 24);
  _Block_object_dispose(&v16, 8);

  return v13;
}

void __82__ENConfigurationStore_removeConfigurationsForRegion_includingSubdivisions_error___block_invoke(_QWORD *a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)a1[4];
  objc_msgSend(a2, "region");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "regionCode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeConfigurationsForRegionCode:error:", v5, a1[6]);

  if (*(_QWORD *)a1[6])
    *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = 0;
}

- (BOOL)removeConfigurationsForRegionCode:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  id v8;
  _QWORD v10[5];
  id v11;
  uint64_t *v12;
  id *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;

  v6 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 1;
  -[ENConfigurationStore storeQueue](self, "storeQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __64__ENConfigurationStore_removeConfigurationsForRegionCode_error___block_invoke;
  v10[3] = &unk_1E87DB430;
  v10[4] = self;
  v11 = v6;
  v12 = &v14;
  v13 = a4;
  v8 = v6;
  dispatch_sync(v7, v10);

  LOBYTE(v6) = *((_BYTE *)v15 + 24);
  _Block_object_dispose(&v14, 8);
  return (char)v6;
}

void __64__ENConfigurationStore_removeConfigurationsForRegionCode_error___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;

  objc_msgSend(*(id *)(a1 + 32), "fileURLforRegionConfiguration:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "path");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = 0;
  objc_msgSend(MEMORY[0x1E0CB3618], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "fileExistsAtPath:isDirectory:", v3, &v12);

  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3618], "defaultManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v6, "removeItemAtPath:error:", v3, *(_QWORD *)(a1 + 56));

    if (gLogCategory_ENConfigurationStore <= 10
      && (gLogCategory_ENConfigurationStore != -1 || _LogCategory_Initialize()))
    {
      v11 = v3;
      LogPrintF_safe();
    }
  }
  objc_msgSend(*(id *)(a1 + 32), "fileURLforRegionServerConfiguration:", *(_QWORD *)(a1 + 40), v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "path");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3618], "defaultManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v7) = objc_msgSend(v9, "fileExistsAtPath:isDirectory:", v8, &v12);

  if ((_DWORD)v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3618], "defaultManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v10, "removeItemAtPath:error:", v8, *(_QWORD *)(a1 + 56));

    if (gLogCategory_ENConfigurationStore <= 10
      && (gLogCategory_ENConfigurationStore != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
    }
  }

}

- (BOOL)removeSubdivisionListForRegion:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  id v8;
  _QWORD v10[5];
  id v11;
  uint64_t *v12;
  id *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;

  v6 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 1;
  -[ENConfigurationStore storeQueue](self, "storeQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __61__ENConfigurationStore_removeSubdivisionListForRegion_error___block_invoke;
  v10[3] = &unk_1E87DA0C0;
  v10[4] = self;
  v11 = v6;
  v12 = &v14;
  v13 = a4;
  v8 = v6;
  dispatch_sync(v7, v10);

  LOBYTE(self) = *((_BYTE *)v15 + 24);
  _Block_object_dispose(&v14, 8);
  return (char)self;
}

uint64_t __61__ENConfigurationStore_removeSubdivisionListForRegion_error___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_removeSubdivisionListForRegion:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = result;
  return result;
}

- (BOOL)_removeSubdivisionListForRegion:(id)a3 error:(id *)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  BOOL v12;

  objc_msgSend(a3, "countryCode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ENConfigurationStore fileURLforCountrySubdivisionList:](self, "fileURLforCountrySubdivisionList:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "path");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3618], "defaultManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v7) = objc_msgSend(v9, "fileExistsAtPath:", v8);

  if ((_DWORD)v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3618], "defaultManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "removeItemAtPath:error:", v8, a4);

    if (*a4)
      v12 = 0;
    else
      v12 = v11;
  }
  else
  {
    v12 = 1;
  }

  return v12;
}

- (void)enumerateCachedRegionServerConfigurationsWithHandler:(id)a3
{
  -[ENConfigurationStore enumerateCachedRegionServerConfigurationsWithCountryCode:handler:](self, "enumerateCachedRegionServerConfigurationsWithCountryCode:handler:", &stru_1E87DD6B8, a3);
}

- (void)enumerateCachedRegionServerConfigurationsWithCountryCode:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  _QWORD v12[4];
  id v13;
  _QWORD *v14;
  _QWORD v15[5];
  id v16;
  _QWORD block[6];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v6 = a3;
  v7 = a4;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__7;
  v22 = __Block_byref_object_dispose__7;
  v23 = 0;
  -[ENConfigurationStore storeQueue](self, "storeQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __89__ENConfigurationStore_enumerateCachedRegionServerConfigurationsWithCountryCode_handler___block_invoke;
  block[3] = &unk_1E87DB0A8;
  block[4] = self;
  block[5] = &v18;
  dispatch_sync(v8, block);

  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x3032000000;
  v15[3] = __Block_byref_object_copy__7;
  v15[4] = __Block_byref_object_dispose__7;
  v16 = 0;
  v10 = v19[5];
  v12[0] = v9;
  v12[1] = 3221225472;
  v12[2] = __89__ENConfigurationStore_enumerateCachedRegionServerConfigurationsWithCountryCode_handler___block_invoke_2;
  v12[3] = &unk_1E87DB458;
  v14 = v15;
  v11 = v7;
  v13 = v11;
  -[ENConfigurationStore _enumerateCachedServerResponseConfigurationsWithDirectoryURL:prefix:handler:](self, "_enumerateCachedServerResponseConfigurationsWithDirectoryURL:prefix:handler:", v10, v6, v12);

  _Block_object_dispose(v15, 8);
  _Block_object_dispose(&v18, 8);

}

void __89__ENConfigurationStore_enumerateCachedRegionServerConfigurationsWithCountryCode_handler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_directoryURLForCachedConfigurations");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __89__ENConfigurationStore_enumerateCachedRegionServerConfigurationsWithCountryCode_handler___block_invoke_2(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v3 = (objc_class *)MEMORY[0x1E0CAA390];
  v4 = a2;
  v5 = objc_msgSend([v3 alloc], "initWithServerResponseDictionary:", v4);

  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)allCachedCountries
{
  NSObject *v3;
  void *v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__7;
  v11 = __Block_byref_object_dispose__7;
  v12 = 0;
  v12 = objc_alloc_init(MEMORY[0x1E0C99E28]);
  -[ENConfigurationStore storeQueue](self, "storeQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __42__ENConfigurationStore_allCachedCountries__block_invoke;
  v6[3] = &unk_1E87DB4A8;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  objc_msgSend((id)v8[5], "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __42__ENConfigurationStore_allCachedCountries__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  _QWORD v4[5];

  objc_msgSend(*(id *)(a1 + 32), "_directoryURLForCachedConfigurations");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __42__ENConfigurationStore_allCachedCountries__block_invoke_2;
  v4[3] = &unk_1E87DB480;
  v2 = *(void **)(a1 + 32);
  v4[4] = *(_QWORD *)(a1 + 40);
  objc_msgSend(v2, "allCachedCountryCodesServerResponseWithDirectoryURL:handler:", v3, v4);

}

void __42__ENConfigurationStore_allCachedCountries__block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0CAA378], "regionWithCode:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "countryCode");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  v4 = v5;
  if (v5)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "addObject:", v5);
    v4 = v5;
  }

}

- (id)allCachedRegions
{
  NSObject *v3;
  void *v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__7;
  v11 = __Block_byref_object_dispose__7;
  v12 = 0;
  v12 = objc_alloc_init(MEMORY[0x1E0C99E28]);
  -[ENConfigurationStore storeQueue](self, "storeQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __40__ENConfigurationStore_allCachedRegions__block_invoke;
  v6[3] = &unk_1E87DB4A8;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  objc_msgSend((id)v8[5], "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __40__ENConfigurationStore_allCachedRegions__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  _QWORD v4[5];

  objc_msgSend(*(id *)(a1 + 32), "_directoryURLForCachedConfigurations");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __40__ENConfigurationStore_allCachedRegions__block_invoke_2;
  v4[3] = &unk_1E87DB480;
  v2 = *(void **)(a1 + 32);
  v4[4] = *(_QWORD *)(a1 + 40);
  objc_msgSend(v2, "allCachedCountryCodesServerResponseWithDirectoryURL:handler:", v3, v4);

}

void __40__ENConfigurationStore_allCachedRegions__block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CAA378], "regionWithCode:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "addObject:", v3);
    v3 = v4;
  }

}

- (void)allCachedCountryCodesServerResponseWithDirectoryURL:(id)a3 handler:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  void (**v25)(id, void *);
  uint64_t v26;
  id obj;
  id v28;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _QWORD v35[4];

  v35[2] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v25 = (void (**)(id, void *))a4;
  objc_msgSend(MEMORY[0x1E0CB3618], "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *MEMORY[0x1E0C99A98];
  v8 = *MEMORY[0x1E0C999C8];
  v35[0] = *MEMORY[0x1E0C99A98];
  v35[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D18], "arrayWithObjects:count:", v35, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v5;
  objc_msgSend(v6, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v5, v9, 5, &__block_literal_global_4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  obj = v10;
  v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v31;
    do
    {
      v14 = 0;
      v26 = v12;
      do
      {
        if (*(_QWORD *)v31 != v13)
          objc_enumerationMutation(obj);
        v15 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * v14);
        v16 = (void *)MEMORY[0x1D17A7CB8](v11);
        v29 = 0;
        objc_msgSend(v15, "getResourceValue:forKey:error:", &v29, v7, 0);
        v17 = v29;
        v28 = 0;
        objc_msgSend(v15, "getResourceValue:forKey:error:", &v28, v8, 0);
        v18 = v28;
        if ((objc_msgSend(v18, "BOOLValue") & 1) == 0)
        {
          v19 = v8;
          v20 = v7;
          objc_msgSend(v17, "stringByReplacingOccurrencesOfString:withString:", CFSTR(".json"), &stru_1E87DD6B8);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          +[ENLoggingPrefs sharedENLoggingPrefs](ENLoggingPrefs, "sharedENLoggingPrefs");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = objc_msgSend(v22, "isSensitiveLoggingAllowed");

          if (v23
            && gLogCategory_ENConfigurationStore <= 10
            && (gLogCategory_ENConfigurationStore != -1 || _LogCategory_Initialize()))
          {
            LogPrintF_safe();
          }
          v25[2](v25, v21);

          v7 = v20;
          v8 = v19;
          v12 = v26;
        }

        objc_autoreleasePoolPop(v16);
        ++v14;
      }
      while (v12 != v14);
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
      v12 = v11;
    }
    while (v11);
  }

}

BOOL __84__ENConfigurationStore_allCachedCountryCodesServerResponseWithDirectoryURL_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;

  v4 = a2;
  v5 = a3;
  if (v5
    && gLogCategory__ENConfigurationStore <= 90
    && (gLogCategory__ENConfigurationStore != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }

  return v5 == 0;
}

- (id)allRegionConfigurations
{
  NSObject *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  void *v11;
  _QWORD v13[6];
  id v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _QWORD block[6];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__7;
  v24 = __Block_byref_object_dispose__7;
  v25 = 0;
  objc_msgSend(MEMORY[0x1E0C99D18], "array");
  v25 = (id)objc_claimAutoreleasedReturnValue();
  -[ENConfigurationStore storeQueue](self, "storeQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__ENConfigurationStore_allRegionConfigurations__block_invoke;
  block[3] = &unk_1E87DB0A8;
  block[4] = self;
  block[5] = &v20;
  dispatch_async_and_wait(v3, block);

  objc_msgSend(MEMORY[0x1E0C99DE0], "arrayWithCapacity:", objc_msgSend((id)v21[5], "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = (id)v21[5];
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v26, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v16;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v5);
        v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CAA390]), "initWithServerResponseDictionary:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v8));
        if (v9)
        {
          -[ENConfigurationStore storeQueue](self, "storeQueue");
          v10 = objc_claimAutoreleasedReturnValue();
          v13[0] = MEMORY[0x1E0C809B0];
          v13[1] = 3221225472;
          v13[2] = __47__ENConfigurationStore_allRegionConfigurations__block_invoke_2;
          v13[3] = &unk_1E87D9EF8;
          v13[4] = self;
          v13[5] = v9;
          v14 = v4;
          dispatch_sync(v10, v13);

        }
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v26, 16);
    }
    while (v6);
  }

  v11 = (void *)objc_msgSend(v4, "copy");
  _Block_object_dispose(&v20, 8);

  return v11;
}

void __47__ENConfigurationStore_allRegionConfigurations__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_allCachedServerResponseConfigurationsWithPrefix:", &stru_1E87DD6B8);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __47__ENConfigurationStore_allRegionConfigurations__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "region");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_configurationForRegion:", v3);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  v4 = v5;
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 48), "addObject:", v5);
    v4 = v5;
  }

}

- (void)allRegionConfigurationsWithCompletion:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __62__ENConfigurationStore_allRegionConfigurationsWithCompletion___block_invoke;
  v6[3] = &unk_1E87DB510;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[ENConfigurationStore allCachedServerResponseConfigurationsWithCompletion:](self, "allCachedServerResponseConfigurationsWithCompletion:", v6);

}

void __62__ENConfigurationStore_allRegionConfigurationsWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(MEMORY[0x1E0C99DE0], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v19;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v19 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v9);
        v11 = objc_alloc(MEMORY[0x1E0CAA390]);
        v12 = (void *)objc_msgSend(v11, "initWithServerResponseDictionary:", v10, (_QWORD)v18);
        v13 = v12;
        if (v12)
        {
          v14 = *(void **)(a1 + 32);
          objc_msgSend(v12, "region");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "_configurationForRegion:", v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          if (v16)
            objc_msgSend(v4, "addObject:", v16);

        }
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v7);
  }

  v17 = *(_QWORD *)(a1 + 40);
  if (v17)
    (*(void (**)(uint64_t, void *))(v17 + 16))(v17, v4);

}

- (id)allRegionServerConfigurationsForCountryCode:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _QWORD block[5];
  id v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__7;
  v28 = __Block_byref_object_dispose__7;
  v29 = 0;
  objc_msgSend(MEMORY[0x1E0C99D18], "array");
  v29 = (id)objc_claimAutoreleasedReturnValue();
  -[ENConfigurationStore storeQueue](self, "storeQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __68__ENConfigurationStore_allRegionServerConfigurationsForCountryCode___block_invoke;
  block[3] = &unk_1E87D9D88;
  v23 = &v24;
  block[4] = self;
  v6 = v4;
  v22 = v6;
  dispatch_async_and_wait(v5, block);

  objc_msgSend(MEMORY[0x1E0C99DE0], "arrayWithCapacity:", objc_msgSend((id)v25[5], "count"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v8 = (id)v25[5];
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v30, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v18;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(v8);
        v12 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v11);
        v13 = objc_alloc(MEMORY[0x1E0CAA390]);
        v14 = (void *)objc_msgSend(v13, "initWithServerResponseDictionary:", v12, (_QWORD)v17);
        if (v14)
          objc_msgSend(v7, "addObject:", v14);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v30, 16);
    }
    while (v9);
  }

  v15 = (void *)objc_msgSend(v7, "copy");
  _Block_object_dispose(&v24, 8);

  return v15;
}

void __68__ENConfigurationStore_allRegionServerConfigurationsForCountryCode___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_allCachedServerResponseConfigurationsWithPrefix:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)allRegionServerConfigurations
{
  return -[ENConfigurationStore allRegionServerConfigurationsForCountryCode:](self, "allRegionServerConfigurationsForCountryCode:", &stru_1E87DD6B8);
}

- (void)allRegionServerConfigurationsWithCompletion:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __68__ENConfigurationStore_allRegionServerConfigurationsWithCompletion___block_invoke;
  v6[3] = &unk_1E87DB538;
  v7 = v4;
  v5 = v4;
  -[ENConfigurationStore allCachedServerResponseConfigurationsWithCompletion:](self, "allCachedServerResponseConfigurationsWithCompletion:", v6);

}

void __68__ENConfigurationStore_allRegionServerConfigurationsWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(MEMORY[0x1E0C99DE0], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v9);
        v11 = objc_alloc(MEMORY[0x1E0CAA390]);
        v12 = (void *)objc_msgSend(v11, "initWithServerResponseDictionary:", v10, (_QWORD)v14);
        if (v12)
          objc_msgSend(v4, "addObject:", v12);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  v13 = *(_QWORD *)(a1 + 32);
  if (v13)
    (*(void (**)(uint64_t, void *))(v13 + 16))(v13, v4);

}

- (void)allAgencyServerRegionConfigurationsWithCompletion:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __74__ENConfigurationStore_allAgencyServerRegionConfigurationsWithCompletion___block_invoke;
  v6[3] = &unk_1E87DB510;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[ENConfigurationStore allCachedServerResponseConfigurationsWithCompletion:](self, "allCachedServerResponseConfigurationsWithCompletion:", v6);

}

void __74__ENConfigurationStore_allAgencyServerRegionConfigurationsWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(MEMORY[0x1E0C99DE0], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v4 = v3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v17 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(*(id *)(a1 + 32), "regionFromServerResponse:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
        {
          v11 = objc_alloc(MEMORY[0x1E0CAA388]);
          objc_msgSend(*(id *)(a1 + 32), "_localeForRegion:", v10);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = (void *)objc_msgSend(v11, "initWithServerResponseDictionary:locale:", v9, v12);

          if (v13)
            objc_msgSend(v15, "addObject:", v13);

        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v6);
  }

  v14 = *(_QWORD *)(a1 + 40);
  if (v14)
    (*(void (**)(uint64_t, void *))(v14 + 16))(v14, v15);

}

- (id)serverConfigurationResponseForRegion:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v4 = a3;
  if (v4)
  {
    v11 = 0;
    v12 = &v11;
    v13 = 0x3032000000;
    v14 = __Block_byref_object_copy__7;
    v15 = __Block_byref_object_dispose__7;
    v16 = 0;
    -[ENConfigurationStore storeQueue](self, "storeQueue");
    v5 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __61__ENConfigurationStore_serverConfigurationResponseForRegion___block_invoke;
    block[3] = &unk_1E87D9D88;
    v10 = &v11;
    block[4] = self;
    v9 = v4;
    dispatch_sync(v5, block);

    v6 = (id)v12[5];
    _Block_object_dispose(&v11, 8);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

void __61__ENConfigurationStore_serverConfigurationResponseForRegion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_serverConfigurationResponseForRegion:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)_serverConfigurationResponseForRegion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  uint64_t v13;

  v4 = a3;
  objc_msgSend(v4, "regionCode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ENConfigurationStore fileURLforRegionServerConfiguration:](self, "fileURLforRegionServerConfiguration:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[ENConfigurationStore _serverConfigurationResponseForFileURL:](self, "_serverConfigurationResponseForFileURL:", v6);
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
  }
  else
  {
    objc_msgSend(v6, "path");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3618], "defaultManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "fileExistsAtPath:", v9);

    if ((v11 & 1) != 0)
    {
      v8 = 0;
    }
    else
    {
      objc_msgSend(v4, "countryCode");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[ENConfigurationStore fileURLforRegionServerConfiguration:](self, "fileURLforRegionServerConfiguration:", v12);
      v13 = objc_claimAutoreleasedReturnValue();

      -[ENConfigurationStore _serverConfigurationResponseForFileURL:](self, "_serverConfigurationResponseForFileURL:", v13);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (void *)v13;
    }

  }
  return v8;
}

- (id)_serverConfigurationResponseForFileURL:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  BOOL v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  void *v18;
  id v19;
  id v20;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "path");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 0;
    objc_msgSend(MEMORY[0x1E0C99D58], "dataWithContentsOfFile:options:error:", v5, 0, &v20);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v20;
    if (v7)
      v8 = 1;
    else
      v8 = v6 == 0;
    if (!v8)
      goto LABEL_12;
    if (gLogCategory_ENConfigurationStore <= 90
      && (gLogCategory_ENConfigurationStore != -1 || _LogCategory_Initialize()))
    {
      objc_msgSend(v5, "lastPathComponent");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF_safe();

    }
    if (!v6)
    {
      v14 = 0;
      v15 = v7;
    }
    else
    {
LABEL_12:
      v9 = (void *)MEMORY[0x1E0C99E68];
      v10 = objc_opt_class();
      v11 = objc_opt_class();
      v12 = objc_opt_class();
      objc_msgSend(v9, "setWithObjects:", v10, v11, v12, objc_opt_class(), 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v7;
      objc_msgSend(MEMORY[0x1E0CB3708], "unarchivedObjectOfClasses:fromData:error:", v13, v6, &v19);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v19;

      if ((v15 || !v14)
        && gLogCategory_ENConfigurationStore <= 90
        && (gLogCategory_ENConfigurationStore != -1 || _LogCategory_Initialize()))
      {
        LogPrintF_safe();
      }

    }
    v16 = v14;

  }
  else
  {
    if (gLogCategory_ENConfigurationStore <= 90
      && (gLogCategory_ENConfigurationStore != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
    }
    v16 = 0;
  }

  return v16;
}

- (void)allCachedServerResponseConfigurationsWithCountryCode:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[ENConfigurationStore storeQueue](self, "storeQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __88__ENConfigurationStore_allCachedServerResponseConfigurationsWithCountryCode_completion___block_invoke;
  block[3] = &unk_1E87DB560;
  v12 = v6;
  v13 = v7;
  block[4] = self;
  v9 = v6;
  v10 = v7;
  dispatch_async(v8, block);

}

void __88__ENConfigurationStore_allCachedServerResponseConfigurationsWithCountryCode_completion___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 48);
  if (v1)
  {
    objc_msgSend(*(id *)(a1 + 32), "_allCachedServerResponseConfigurationsWithPrefix:", *(_QWORD *)(a1 + 40));
    v2 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

  }
}

- (void)allCachedServerResponseConfigurationsWithCompletion:(id)a3
{
  -[ENConfigurationStore allCachedServerResponseConfigurationsWithCountryCode:completion:](self, "allCachedServerResponseConfigurationsWithCountryCode:completion:", &stru_1E87DD6B8, a3);
}

- (id)_allCachedServerResponseConfigurationsWithPrefix:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v11[4];
  id v12;

  v4 = (objc_class *)MEMORY[0x1E0C99DE0];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  -[ENConfigurationStore _directoryURLForCachedConfigurations](self, "_directoryURLForCachedConfigurations");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __73__ENConfigurationStore__allCachedServerResponseConfigurationsWithPrefix___block_invoke;
  v11[3] = &unk_1E87DB588;
  v12 = v6;
  v8 = v6;
  -[ENConfigurationStore _enumerateCachedServerResponseConfigurationsWithDirectoryURL:prefix:handler:](self, "_enumerateCachedServerResponseConfigurationsWithDirectoryURL:prefix:handler:", v7, v5, v11);

  v9 = (void *)objc_msgSend(v8, "copy");
  return v9;
}

uint64_t __73__ENConfigurationStore__allCachedServerResponseConfigurationsWithPrefix___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

- (id)_directoryURLForCachedConfigurations
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;

  if (-[ENConfigurationStore developerServerConfiguration](self, "developerServerConfiguration"))
    goto LABEL_4;
  -[ENConfigurationStore regionIdentifierOverride](self, "regionIdentifierOverride");
  v3 = objc_claimAutoreleasedReturnValue();
  if (!v3)
    goto LABEL_5;
  v4 = (void *)v3;
  -[ENConfigurationStore regionIdentifierOverride](self, "regionIdentifierOverride");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length");

  if (v6)
  {
LABEL_4:
    -[ENConfigurationStore developerConfigurationsURL](self, "developerConfigurationsURL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
LABEL_5:
    -[ENConfigurationStore serverConfigurationCacheURL](self, "serverConfigurationCacheURL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v7;
}

- (void)_enumerateCachedServerResponseConfigurationsWithDirectoryURL:(id)a3 prefix:(id)a4 handler:(id)a5
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t i;
  void *v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  id v26;
  void *v27;
  int v28;
  id v29;
  void *v30;
  void (**v31)(id, void *);
  uint64_t v32;
  uint64_t v33;
  id v34;
  void *v35;
  id obj;
  uint64_t v37;
  uint64_t v38;
  id v39;
  id v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  _QWORD v46[4];

  v46[2] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v31 = (void (**)(id, void *))a5;
  objc_msgSend(MEMORY[0x1E0CB3618], "defaultManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *MEMORY[0x1E0C99A98];
  v11 = *MEMORY[0x1E0C999C8];
  v46[0] = *MEMORY[0x1E0C99A98];
  v46[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D18], "arrayWithObjects:count:", v46, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = v7;
  objc_msgSend(v9, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v7, v12, 5, &__block_literal_global_65);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  obj = v13;
  v38 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
  if (v38)
  {
    v37 = *(_QWORD *)v42;
    v33 = v10;
    v34 = v8;
    v32 = v11;
    do
    {
      for (i = 0; i != v38; ++i)
      {
        if (*(_QWORD *)v42 != v37)
          objc_enumerationMutation(obj);
        v15 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
        v16 = (void *)MEMORY[0x1D17A7CB8]();
        v40 = 0;
        objc_msgSend(v15, "getResourceValue:forKey:error:", &v40, v10, 0);
        v17 = v40;
        v39 = 0;
        objc_msgSend(v15, "getResourceValue:forKey:error:", &v39, v11, 0);
        v18 = v39;
        if ((objc_msgSend(v18, "BOOLValue") & 1) == 0)
        {
          if (!objc_msgSend(v8, "length")
            || (objc_msgSend(v8, "lowercaseString"),
                v19 = (void *)objc_claimAutoreleasedReturnValue(),
                v20 = objc_msgSend(v17, "hasPrefix:", v19),
                v19,
                v20))
          {
            objc_msgSend(MEMORY[0x1E0C99D58], "dataWithContentsOfURL:", v15, v29);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            if (v21)
            {
              v22 = (void *)MEMORY[0x1E0C99E68];
              v23 = objc_opt_class();
              v24 = objc_opt_class();
              objc_opt_class();
              objc_opt_class();
              v29 = (id)v24;
              objc_msgSend(v22, "setWithObjects:", v23);
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0CB3708], "unarchivedObjectOfClasses:fromData:error:");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              v26 = 0;
              if (v26)
              {
                v10 = v33;
                v8 = v34;
                if (gLogCategory__ENConfigurationStore <= 90
                  && (gLogCategory__ENConfigurationStore != -1 || _LogCategory_Initialize()))
                {
                  v29 = v26;
                  LogPrintF_safe();
                }
              }
              else
              {
                +[ENLoggingPrefs sharedENLoggingPrefs](ENLoggingPrefs, "sharedENLoggingPrefs");
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                v28 = objc_msgSend(v27, "isSensitiveLoggingAllowed");

                if (v28
                  && gLogCategory_ENConfigurationStore <= 10
                  && (gLogCategory_ENConfigurationStore != -1 || _LogCategory_Initialize()))
                {
                  v29 = v15;
                  LogPrintF_safe();
                }
                v31[2](v31, v25);
                v10 = v33;
                v8 = v34;
              }

              v11 = v32;
            }

          }
        }

        objc_autoreleasePoolPop(v16);
      }
      v38 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
    }
    while (v38);
  }

}

BOOL __100__ENConfigurationStore__enumerateCachedServerResponseConfigurationsWithDirectoryURL_prefix_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;

  v4 = a2;
  v5 = a3;
  if (v5
    && gLogCategory__ENConfigurationStore <= 90
    && (gLogCategory__ENConfigurationStore != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }

  return v5 == 0;
}

- (BOOL)regionSupportsSubdivisions:(id)a3
{
  void *v3;
  BOOL v4;

  if (!a3)
    return 0;
  -[ENConfigurationStore subdivisionListForRegion:](self, "subdivisionListForRegion:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count") != 0;

  return v4;
}

- (id)serverConfigurationForRegion:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v4 = a3;
  if (v4)
  {
    v11 = 0;
    v12 = &v11;
    v13 = 0x3032000000;
    v14 = __Block_byref_object_copy__7;
    v15 = __Block_byref_object_dispose__7;
    v16 = 0;
    -[ENConfigurationStore storeQueue](self, "storeQueue");
    v5 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __53__ENConfigurationStore_serverConfigurationForRegion___block_invoke;
    block[3] = &unk_1E87D9D88;
    v10 = &v11;
    block[4] = self;
    v9 = v4;
    dispatch_sync(v5, block);

    v6 = (id)v12[5];
    _Block_object_dispose(&v11, 8);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

void __53__ENConfigurationStore_serverConfigurationForRegion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_serverConfigurationForRegion:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)_serverConfigurationForRegion:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  if (v4)
  {
    -[ENConfigurationStore _serverConfigurationResponseForRegion:](self, "_serverConfigurationResponseForRegion:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
      v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CAA390]), "initWithServerResponseDictionary:", v5);
    else
      v6 = 0;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)serverExposureConfigurationForRegion:(id)a3
{
  void *v3;
  void *v4;

  -[ENConfigurationStore serverConfigurationResponseForRegion:](self, "serverConfigurationResponseForRegion:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CAA398]), "initWithServerResponseDictionary:", v3);
  else
    v4 = 0;

  return v4;
}

- (id)agencyConfigurationForRegion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[ENConfigurationStore serverConfigurationResponseForRegion:](self, "serverConfigurationResponseForRegion:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = objc_alloc(MEMORY[0x1E0CAA388]);
    -[ENConfigurationStore localeForRegion:](self, "localeForRegion:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v6, "initWithServerResponseDictionary:locale:", v5, v7);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)_agencyConfigurationForRegion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;

  v4 = a3;
  if (v4)
  {
    -[ENConfigurationStore _serverConfigurationResponseForRegion:](self, "_serverConfigurationResponseForRegion:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = objc_alloc(MEMORY[0x1E0CAA388]);
      -[ENConfigurationStore _localeForRegion:](self, "_localeForRegion:", v4);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (void *)objc_msgSend(v6, "initWithServerResponseDictionary:locale:", v5, v7);

    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)downloadConfigurationForRegion:(id)a3
{
  void *v3;
  void *v4;

  -[ENConfigurationStore serverConfigurationResponseForRegion:](self, "serverConfigurationResponseForRegion:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CAA3A0]), "initWithServerResponseDictionary:", v3);
  else
    v4 = 0;

  return v4;
}

- (id)regionFromServerResponse:(id)a3
{
  id v4;
  void *v5;
  char isKindOfClass;
  void *v7;
  void *v8;
  uint64_t v9;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v7 = 0;
    goto LABEL_13;
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("countryCode"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v7 = 0;
    goto LABEL_12;
  }
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v7 = 0;
  if (!self || (isKindOfClass & 1) == 0)
    goto LABEL_12;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("state"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v8, "length"))
  {
    if ((objc_msgSend(MEMORY[0x1E0CAA378], "validSubdivisionCode:forCountryCode:", v8, v5) & 1) == 0)
    {
      if (gLogCategory_ENConfigurationStore <= 30
        && (gLogCategory_ENConfigurationStore != -1 || _LogCategory_Initialize()))
      {
        LogPrintF_safe();
      }
      v7 = 0;
      goto LABEL_11;
    }
    v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0CAA378]), "initWithCountryCode:subdivisionCode:", v5, v8);
  }
  else
  {
    v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0CAA378]), "initWithCountryCode:", v5);
  }
  v7 = (void *)v9;
LABEL_11:

LABEL_12:
LABEL_13:

  return v7;
}

- (id)subdivisionListForRegion:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__7;
  v16 = __Block_byref_object_dispose__7;
  v17 = 0;
  -[ENConfigurationStore storeQueue](self, "storeQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__ENConfigurationStore_subdivisionListForRegion___block_invoke;
  block[3] = &unk_1E87D9D88;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(v5, block);

  v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __49__ENConfigurationStore_subdivisionListForRegion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_subdivisionListForRegion:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)_subdivisionListForRegion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v13;
  void *v14;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "countryCode");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[ENConfigurationStore fileURLforCountrySubdivisionList:](self, "fileURLforCountrySubdivisionList:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "path");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (gLogCategory_ENConfigurationStore <= 30
      && (gLogCategory_ENConfigurationStore != -1 || _LogCategory_Initialize()))
    {
      objc_msgSend(v5, "countryCode");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v8;
      LogPrintF_safe();

    }
    objc_msgSend(MEMORY[0x1E0CB3618], "defaultManager", v13, v14);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "fileExistsAtPath:", v8);

    if (v10)
      v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D18]), "initWithContentsOfFile:", v8);
    else
      v11 = 0;

  }
  else
  {
    if (gLogCategory_ENConfigurationStore <= 90
      && (gLogCategory_ENConfigurationStore != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
    }
    v11 = 0;
  }

  return v11;
}

- (id)regionHashForRegion:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__7;
  v16 = __Block_byref_object_dispose__7;
  v17 = 0;
  -[ENConfigurationStore storeQueue](self, "storeQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__ENConfigurationStore_regionHashForRegion___block_invoke;
  block[3] = &unk_1E87D9D88;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(v5, block);

  v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __44__ENConfigurationStore_regionHashForRegion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_regionHashForRegion:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)_regionHashForRegion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  id v12;
  void *v14;
  void *v15;
  id v16;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "countryCode");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[ENConfigurationStore fileURLForCountryRegionHash:](self, "fileURLForCountryRegionHash:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "path");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (gLogCategory_ENConfigurationStore <= 30
      && (gLogCategory_ENConfigurationStore != -1 || _LogCategory_Initialize()))
    {
      objc_msgSend(v5, "countryCode");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v7;
      LogPrintF_safe();

    }
    objc_msgSend(MEMORY[0x1E0CB3618], "defaultManager", v14, v15);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "fileExistsAtPath:", v8);

    if (v10)
    {
      v16 = 0;
      v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3938]), "initWithContentsOfURL:encoding:error:", v7, 4, &v16);
      v12 = v16;
      if (!v11
        && gLogCategory_ENConfigurationStore <= 90
        && (gLogCategory_ENConfigurationStore != -1 || _LogCategory_Initialize()))
      {
        LogPrintF_safe();
      }

    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    if (gLogCategory_ENConfigurationStore <= 90
      && (gLogCategory_ENConfigurationStore != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
    }
    v11 = 0;
  }

  return v11;
}

- (id)localeIdentifiersForRegion:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__7;
  v16 = __Block_byref_object_dispose__7;
  v17 = 0;
  -[ENConfigurationStore storeQueue](self, "storeQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__ENConfigurationStore_localeIdentifiersForRegion___block_invoke;
  block[3] = &unk_1E87D9D88;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(v5, block);

  v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __51__ENConfigurationStore_localeIdentifiersForRegion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_localeIdentifiersForRegion:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)_localeIdentifiersForRegion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  void *v39;
  _BYTE v40[128];
  _QWORD v41[3];

  v41[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v32 = v4;
    -[ENConfigurationStore _serverConfigurationResponseForRegion:](self, "_serverConfigurationResponseForRegion:", v4);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("config"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE0], "array");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v30 = v5;
    objc_msgSend(v5, "allKeys");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v36;
      v33 = *(_QWORD *)v36;
      do
      {
        v11 = 0;
        v34 = v9;
        do
        {
          if (*(_QWORD *)v36 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * v11);
          if (objc_msgSend(v12, "hasPrefix:", CFSTR("agencyMessage")))
          {
            objc_msgSend(v12, "componentsSeparatedByString:", CFSTR("_"));
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v13, "count") == 3)
            {
              v14 = (void *)MEMORY[0x1E0CB3938];
              objc_msgSend(v13, "objectAtIndexedSubscript:", 1);
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v15, "lowercaseString");
              v16 = v7;
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "objectAtIndexedSubscript:", 2);
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "uppercaseString");
              v19 = v6;
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v14, "stringWithFormat:", CFSTR("%@_%@"), v17, v20);
              v21 = (void *)objc_claimAutoreleasedReturnValue();

              v6 = v19;
              v7 = v16;
              v9 = v34;

              v10 = v33;
              objc_msgSend(v19, "addObject:", v21);

            }
          }
          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
      }
      while (v9);
    }

    v4 = v32;
    if (gLogCategory_ENConfigurationStore <= 10
      && (gLogCategory_ENConfigurationStore != -1 || _LogCategory_Initialize()))
    {
      v28 = v32;
      v29 = v6;
      LogPrintF_safe();
    }
    if (objc_msgSend(v6, "count", v28, v29))
    {
      v22 = v6;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99DC0], "currentLocale");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "localeIdentifier");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = v27;
      objc_msgSend(MEMORY[0x1E0C99D18], "arrayWithObjects:count:", &v39, 1);
      v22 = (id)objc_claimAutoreleasedReturnValue();

    }
    v24 = v30;
    v23 = v31;

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DC0], "currentLocale");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "localeIdentifier");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v41[0] = v24;
    objc_msgSend(MEMORY[0x1E0C99D18], "arrayWithObjects:count:", v41, 1);
    v22 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v22;
}

- (id)localeForRegion:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__7;
  v16 = __Block_byref_object_dispose__7;
  v17 = 0;
  -[ENConfigurationStore storeQueue](self, "storeQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__ENConfigurationStore_localeForRegion___block_invoke;
  block[3] = &unk_1E87D9D88;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(v5, block);

  v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __40__ENConfigurationStore_localeForRegion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_localeForRegion:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)_localeForRegion:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  if (a3)
  {
    v3 = (void *)MEMORY[0x1E0CB34D8];
    -[ENConfigurationStore _localeIdentifiersForRegion:](self, "_localeIdentifiersForRegion:");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DC0], "preferredLanguages");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "preferredLocalizationsFromArray:forPreferences:", v4, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99DC0], "localeWithLocaleIdentifier:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DC0], "currentLocale");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v8;
}

- (void)prefsChanged
{
  NSObject *v3;
  _QWORD block[5];

  -[ENConfigurationStore storeQueue](self, "storeQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __36__ENConfigurationStore_prefsChanged__block_invoke;
  block[3] = &unk_1E87D9C28;
  block[4] = self;
  dispatch_sync(v3, block);

}

void __36__ENConfigurationStore_prefsChanged__block_invoke(uint64_t a1)
{
  uint64_t Int64;
  void *v3;
  void *v4;
  id v5;
  char v6;
  void *v7;
  uint64_t v8;
  void *v9;
  _BOOL8 v10;
  id v11;

  Int64 = CFPrefs_GetInt64();
  if ((Int64 != 0) != objc_msgSend(*(id *)(a1 + 32), "developerServerConfiguration"))
  {
    if (gLogCategory_ENConfigurationStore <= 30
      && (gLogCategory_ENConfigurationStore != -1 || _LogCategory_Initialize()))
    {
      v8 = objc_msgSend(*(id *)(a1 + 32), "developerServerConfiguration");
      v10 = Int64 != 0;
      LogPrintF_safe();
    }
    objc_msgSend(*(id *)(a1 + 32), "setDeveloperServerConfiguration:", Int64 != 0, v8, v10);
  }
  CFStringGetTypeID();
  v3 = (void *)CFPrefs_CopyTypedValue();
  objc_msgSend(*(id *)(a1 + 32), "regionIdentifierOverride");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v3;
  v5 = v4;
  if (v11 == v5)
  {

  }
  else
  {
    if ((v11 == 0) != (v5 != 0))
    {
      v6 = objc_msgSend(v11, "isEqual:", v5);

      v7 = v11;
      if ((v6 & 1) != 0)
        goto LABEL_19;
    }
    else
    {

    }
    if (gLogCategory_ENConfigurationStore <= 30
      && (gLogCategory_ENConfigurationStore != -1 || _LogCategory_Initialize()))
    {
      objc_msgSend(*(id *)(a1 + 32), "regionIdentifierOverride");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF_safe();

      objc_msgSend(*(id *)(a1 + 32), "setRegionIdentifierOverride:", v11, v9, v11);
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "setRegionIdentifierOverride:", v11, v8, v10);
    }
  }
  v7 = v11;
LABEL_19:

}

- (BOOL)saveTemporaryServerConfigurations:(id)a3 error:(id *)a4
{
  void *v6;
  void *v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  id *v15;
  int v16;
  NSObject *v17;
  BOOL v18;
  uint64_t v19;
  void *v20;
  void (**v22)(_QWORD);
  id v23;
  id obj;
  _QWORD block[8];
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _QWORD v31[7];
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  char v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  id v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v23 = a3;
  v36 = 0;
  v37 = &v36;
  v38 = 0x3032000000;
  v39 = __Block_byref_object_copy__7;
  v40 = __Block_byref_object_dispose__7;
  v41 = 0;
  v32 = 0;
  v33 = &v32;
  v34 = 0x2020000000;
  v35 = 0;
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __64__ENConfigurationStore_saveTemporaryServerConfigurations_error___block_invoke;
  v31[3] = &unk_1E87DB5D0;
  v31[5] = &v36;
  v31[6] = a4;
  v31[4] = &v32;
  v22 = (void (**)(_QWORD))MEMORY[0x1D17A7E5C](v31);
  if (-[ENConfigurationStore developerServerConfiguration](self, "developerServerConfiguration")
    || (-[ENConfigurationStore regionIdentifierOverride](self, "regionIdentifierOverride"),
        (v6 = (void *)objc_claimAutoreleasedReturnValue()) != 0)
    && (-[ENConfigurationStore regionIdentifierOverride](self, "regionIdentifierOverride"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "length") == 0,
        v7,
        v6,
        !v8))
  {
    objc_msgSend(MEMORY[0x1E0CB3618], "defaultManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[ENConfigurationStore developerConfigurationsURL](self, "developerConfigurationsURL");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    obj = v23;
    v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v42, 16);
    if (!v11)
      goto LABEL_27;
    v12 = *(_QWORD *)v28;
    while (2)
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v28 != v12)
          objc_enumerationMutation(obj);
        v14 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i);
        if (!v14
          || (v15 = (id *)(v37 + 5),
              v26 = (id)v37[5],
              v16 = objc_msgSend(v9, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v10, 1, 0, &v26), objc_storeStrong(v15, v26), !v16))
        {
          if (v37[5])
          {
            if (gLogCategory_ENConfigurationStore > 90
              || gLogCategory_ENConfigurationStore == -1 && !_LogCategory_Initialize())
            {
              goto LABEL_27;
            }
          }
          else
          {
            ENErrorF();
            v19 = objc_claimAutoreleasedReturnValue();
            v20 = (void *)v37[5];
            v37[5] = v19;

            if (gLogCategory_ENConfigurationStore > 90
              || gLogCategory_ENConfigurationStore == -1 && !_LogCategory_Initialize())
            {
              goto LABEL_27;
            }
          }
          LogPrintF_safe();
          goto LABEL_27;
        }
        -[ENConfigurationStore storeQueue](self, "storeQueue");
        v17 = objc_claimAutoreleasedReturnValue();
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __64__ENConfigurationStore_saveTemporaryServerConfigurations_error___block_invoke_2;
        block[3] = &unk_1E87DB0F8;
        block[4] = self;
        block[5] = v14;
        block[6] = &v32;
        block[7] = &v36;
        dispatch_sync(v17, block);

      }
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v42, 16);
      if (v11)
        continue;
      break;
    }
LABEL_27:

    v18 = *((_BYTE *)v33 + 24) != 0;
  }
  else if (a4)
  {
    ENErrorF();
    v18 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v18 = 0;
  }
  v22[2](v22);

  _Block_object_dispose(&v32, 8);
  _Block_object_dispose(&v36, 8);

  return v18;
}

void __64__ENConfigurationStore_saveTemporaryServerConfigurations_error___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) && *(_QWORD *)(a1 + 48))
  {
    v2 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    if (v2)
    {
      **(_QWORD **)(a1 + 48) = objc_retainAutorelease(v2);
    }
    else
    {
      ENErrorF();
      v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      **(_QWORD **)(a1 + 48) = v3;

    }
  }
}

void __64__ENConfigurationStore_saveTemporaryServerConfigurations_error___block_invoke_2(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  id obj;

  v2 = (void *)a1[4];
  v3 = a1[5];
  v4 = *(_QWORD *)(a1[7] + 8);
  obj = *(id *)(v4 + 40);
  v5 = objc_msgSend(v2, "_saveServerConfigurationResponse:error:", v3, &obj);
  objc_storeStrong((id *)(v4 + 40), obj);
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = v5;
}

- (void)resetStore
{
  void *v3;
  void *v4;
  int v5;
  id v6;
  void *v7;
  void *v8;
  int v9;
  id v10;
  void *v11;
  void *v12;
  int v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;

  objc_msgSend(MEMORY[0x1E0CB3618], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[ENConfigurationStore legacyAppCacheURL](ENConfigurationStore, "legacyAppCacheURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0;
  v5 = objc_msgSend(v3, "removeItemAtURL:error:", v4, &v19);
  v6 = v19;

  if (v5)
  {
    if (gLogCategory_ENConfigurationStore <= 30
      && (gLogCategory_ENConfigurationStore != -1 || _LogCategory_Initialize()))
    {
      goto LABEL_8;
    }
  }
  else if (gLogCategory_ENConfigurationStore <= 90
         && (gLogCategory_ENConfigurationStore != -1 || _LogCategory_Initialize()))
  {
    v15 = v6;
LABEL_8:
    LogPrintF_safe();
  }
  objc_msgSend(MEMORY[0x1E0CB3618], "defaultManager", v15);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ENConfigurationStore configurationCacheURL](self, "configurationCacheURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v6;
  v9 = objc_msgSend(v7, "removeItemAtURL:error:", v8, &v18);
  v10 = v18;

  if (v9)
  {
    if (gLogCategory_ENConfigurationStore <= 30
      && (gLogCategory_ENConfigurationStore != -1 || _LogCategory_Initialize()))
    {
      goto LABEL_19;
    }
  }
  else if (gLogCategory_ENConfigurationStore <= 90
         && (gLogCategory_ENConfigurationStore != -1 || _LogCategory_Initialize()))
  {
    v16 = v10;
LABEL_19:
    LogPrintF_safe();
  }
  objc_msgSend(MEMORY[0x1E0CB3618], "defaultManager", v16);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[ENConfigurationStore subdivisionListCacheURL](self, "subdivisionListCacheURL");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v10;
  v13 = objc_msgSend(v11, "removeItemAtURL:error:", v12, &v17);
  v14 = v17;

  if (v13)
  {
    if (gLogCategory_ENConfigurationStore <= 30
      && (gLogCategory_ENConfigurationStore != -1 || _LogCategory_Initialize()))
    {
LABEL_29:
      LogPrintF_safe();
    }
  }
  else if (gLogCategory_ENConfigurationStore <= 90
         && (gLogCategory_ENConfigurationStore != -1 || _LogCategory_Initialize()))
  {
    goto LABEL_29;
  }

}

- (id)systemConfigurationCacheURL
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[ENConfigurationStore configurationCacheURL](self, "configurationCacheURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByAppendingPathComponent:", CFSTR("System"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E90], "fileURLWithPath:isDirectory:", v4, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)fileURLforRegionConfiguration:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  -[ENConfigurationStore systemConfigurationCacheURL](self, "systemConfigurationCacheURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0CB3938];
  objc_msgSend(v4, "lowercaseString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "stringWithFormat:", CFSTR("%@.data"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "URLByAppendingPathComponent:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)serverConfigurationCacheURL
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[ENConfigurationStore configurationCacheURL](self, "configurationCacheURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByAppendingPathComponent:", CFSTR("Server"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E90], "fileURLWithPath:isDirectory:", v4, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)fileURLforRegionServerConfiguration:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v4 = a3;
  if (-[ENConfigurationStore developerServerConfiguration](self, "developerServerConfiguration"))
    goto LABEL_4;
  -[ENConfigurationStore regionIdentifierOverride](self, "regionIdentifierOverride");
  v5 = objc_claimAutoreleasedReturnValue();
  if (!v5)
    goto LABEL_5;
  v6 = (void *)v5;
  -[ENConfigurationStore regionIdentifierOverride](self, "regionIdentifierOverride");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "length");

  if (v8)
  {
LABEL_4:
    -[ENConfigurationStore developerConfigurationsURL](self, "developerConfigurationsURL");
    v9 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
LABEL_5:
    -[ENConfigurationStore serverConfigurationCacheURL](self, "serverConfigurationCacheURL");
    v9 = objc_claimAutoreleasedReturnValue();
  }
  v10 = (void *)v9;
  v11 = (void *)MEMORY[0x1E0CB3938];
  objc_msgSend(v4, "lowercaseString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringWithFormat:", CFSTR("%@.json"), v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "URLByAppendingPathComponent:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)serverSubdivisionListCacheURL
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[ENConfigurationStore subdivisionListCacheURL](self, "subdivisionListCacheURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByAppendingPathComponent:", CFSTR("Server"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E90], "fileURLWithPath:isDirectory:", v4, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)fileURLforCountrySubdivisionList:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v4 = a3;
  if (-[ENConfigurationStore developerServerConfiguration](self, "developerServerConfiguration"))
    goto LABEL_4;
  -[ENConfigurationStore regionIdentifierOverride](self, "regionIdentifierOverride");
  v5 = objc_claimAutoreleasedReturnValue();
  if (!v5)
    goto LABEL_5;
  v6 = (void *)v5;
  -[ENConfigurationStore regionIdentifierOverride](self, "regionIdentifierOverride");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "length");

  if (v8)
  {
LABEL_4:
    -[ENConfigurationStore developerSubdivisionListCacheURL](self, "developerSubdivisionListCacheURL");
    v9 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
LABEL_5:
    -[ENConfigurationStore serverSubdivisionListCacheURL](self, "serverSubdivisionListCacheURL");
    v9 = objc_claimAutoreleasedReturnValue();
  }
  v10 = (void *)v9;
  v11 = (void *)MEMORY[0x1E0CB3938];
  objc_msgSend(v4, "lowercaseString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringWithFormat:", CFSTR("%@.plist"), v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "URLByAppendingPathComponent:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)fileURLForCountryRegionHash:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v4 = a3;
  if (-[ENConfigurationStore developerServerConfiguration](self, "developerServerConfiguration"))
    goto LABEL_4;
  -[ENConfigurationStore regionIdentifierOverride](self, "regionIdentifierOverride");
  v5 = objc_claimAutoreleasedReturnValue();
  if (!v5)
    goto LABEL_5;
  v6 = (void *)v5;
  -[ENConfigurationStore regionIdentifierOverride](self, "regionIdentifierOverride");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "length");

  if (v8)
  {
LABEL_4:
    -[ENConfigurationStore developerSubdivisionListCacheURL](self, "developerSubdivisionListCacheURL");
    v9 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
LABEL_5:
    -[ENConfigurationStore serverSubdivisionListCacheURL](self, "serverSubdivisionListCacheURL");
    v9 = objc_claimAutoreleasedReturnValue();
  }
  v10 = (void *)v9;
  v11 = (void *)MEMORY[0x1E0CB3938];
  objc_msgSend(v4, "lowercaseString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "stringWithFormat:", CFSTR("%@_region_hash.plist"), v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "URLByAppendingPathComponent:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (id)legacyAppCacheURL
{
  if (legacyAppCacheURL_onceToken != -1)
    dispatch_once(&legacyAppCacheURL_onceToken, &__block_literal_global_130);
  return (id)legacyAppCacheURL_cacheURL;
}

void __41__ENConfigurationStore_legacyAppCacheURL__block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  int v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;

  v0 = container_system_group_path_for_identifier();
  if (v0)
  {
    v1 = (void *)v0;
    +[ENLoggingPrefs sharedENLoggingPrefs](ENLoggingPrefs, "sharedENLoggingPrefs");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "isSensitiveLoggingAllowed");

    if (v3
      && gLogCategory_ENConfigurationStore <= 30
      && (gLogCategory_ENConfigurationStore != -1 || _LogCategory_Initialize()))
    {
      v7 = v1;
      LogPrintF_safe();
    }
    objc_msgSend(MEMORY[0x1E0C99E90], "fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:", v1, 1, 0, v7);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "URLByAppendingPathComponent:", CFSTR("Library/Caches/Cloud/"));
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)legacyAppCacheURL_cacheURL;
    legacyAppCacheURL_cacheURL = v5;

    free(v1);
  }
  else if (gLogCategory__ENConfigurationStore <= 90
         && (gLogCategory__ENConfigurationStore != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }
}

- (id)cachedAppConfiguationForBundleID:(id)a3 forRegionID:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  id v11;
  _QWORD block[4];
  id v14;
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v6 = a3;
  v7 = a4;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__7;
  v21 = __Block_byref_object_dispose__7;
  v22 = 0;
  -[ENConfigurationStore storeQueue](self, "storeQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __69__ENConfigurationStore_cachedAppConfiguationForBundleID_forRegionID___block_invoke;
  block[3] = &unk_1E87DB618;
  v14 = v7;
  v15 = v6;
  v16 = &v17;
  v9 = v6;
  v10 = v7;
  dispatch_sync(v8, block);

  v11 = (id)v18[5];
  _Block_object_dispose(&v17, 8);

  return v11;
}

void __69__ENConfigurationStore_cachedAppConfiguationForBundleID_forRegionID___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  char v15;
  uint64_t v16;
  void *v17;
  id v18;

  if (a1[4])
  {
    +[ENConfigurationStore legacyAppCacheURL](ENConfigurationStore, "legacyAppCacheURL");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "URLByAppendingPathComponent:", a1[4]);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3938], "stringWithFormat:", CFSTR("%@.plist"), a1[5]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "URLByAppendingPathComponent:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99D58], "dataWithContentsOfURL:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = (void *)MEMORY[0x1E0C99E68];
      v8 = objc_opt_class();
      objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 0;
      objc_msgSend(MEMORY[0x1E0CB3708], "unarchivedObjectOfClasses:fromData:error:", v9, v6, &v18);
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = v18;
      v12 = *(_QWORD *)(a1[6] + 8);
      v13 = *(void **)(v12 + 40);
      *(_QWORD *)(v12 + 40) = v10;

      if (v11
        || (objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "appID"),
            v14 = (void *)objc_claimAutoreleasedReturnValue(),
            v15 = objc_msgSend(v14, "isEqualToString:", a1[5]),
            v14,
            (v15 & 1) == 0))
      {
        if (gLogCategory_ENConfigurationStore <= 90
          && (gLogCategory_ENConfigurationStore != -1 || _LogCategory_Initialize()))
        {
          LogPrintF_safe();
        }
        v16 = *(_QWORD *)(a1[6] + 8);
        v17 = *(void **)(v16 + 40);
        *(_QWORD *)(v16 + 40) = 0;

      }
      else if (gLogCategory_ENConfigurationStore <= 90
             && (gLogCategory_ENConfigurationStore != -1 || _LogCategory_Initialize()))
      {
        LogPrintF_safe();
      }

    }
  }
  else if (gLogCategory_ENConfigurationStore <= 90
         && (gLogCategory_ENConfigurationStore != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }
}

- (id)legacyAppConfiguationForMobileCountryCode:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v4 = a3;
  if (v4)
  {
    if (gLogCategory__ENConfigurationStore <= 90
      && (gLogCategory__ENConfigurationStore != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
    }
    v6 = 0;
  }
  else
  {
    v11 = 0;
    v12 = &v11;
    v13 = 0x3032000000;
    v14 = __Block_byref_object_copy__7;
    v15 = __Block_byref_object_dispose__7;
    v16 = 0;
    -[ENConfigurationStore storeQueue](self, "storeQueue");
    v5 = objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __66__ENConfigurationStore_legacyAppConfiguationForMobileCountryCode___block_invoke;
    v8[3] = &unk_1E87DB4A8;
    v9 = 0;
    v10 = &v11;
    dispatch_sync(v5, v8);

    v6 = (id)v12[5];
    _Block_object_dispose(&v11, 8);

  }
  return v6;
}

void __66__ENConfigurationStore_legacyAppConfiguationForMobileCountryCode___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  id v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  int v29;
  void *v30;
  int v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  id v37;
  void *v38;
  id v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  id v44;
  id v45;
  id v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _BYTE v51[128];
  _QWORD v52[4];

  v52[2] = *MEMORY[0x1E0C80C00];
  if (gLogCategory_ENConfigurationStore <= 30
    && (gLogCategory_ENConfigurationStore != -1 || _LogCategory_Initialize()))
  {
    v35 = *(_QWORD *)(a1 + 32);
    LogPrintF_safe();
  }
  +[ENConfigurationStore legacyAppCacheURL](ENConfigurationStore, "legacyAppCacheURL", v35);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByAppendingPathComponent:", *(_QWORD *)(a1 + 32));
  v3 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3618], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *MEMORY[0x1E0C999C8];
  v52[0] = *MEMORY[0x1E0C99A98];
  v5 = v52[0];
  v52[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D18], "arrayWithObjects:count:", v52, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = (void *)v3;
  objc_msgSend(v4, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v3, v7, 4, &__block_literal_global_142);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  v9 = v8;
  v10 = v5;
  v11 = v9;
  v12 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v47, v51, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v48;
    v39 = v11;
    v41 = v6;
    v43 = *(_QWORD *)v48;
    while (2)
    {
      v15 = 0;
      v42 = v13;
      do
      {
        if (*(_QWORD *)v48 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * v15);
        v46 = 0;
        objc_msgSend(v16, "getResourceValue:forKey:error:", &v46, v10, 0, v36, v37);
        v17 = v46;
        v45 = 0;
        objc_msgSend(v16, "getResourceValue:forKey:error:", &v45, v6, 0);
        v18 = v45;
        if ((objc_msgSend(v18, "BOOLValue") & 1) == 0)
        {
          objc_msgSend(MEMORY[0x1E0C99D58], "dataWithContentsOfURL:", v16);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          if (v19)
          {
            v20 = (void *)MEMORY[0x1E0C99E68];
            v21 = objc_opt_class();
            v36 = objc_opt_class();
            v37 = 0;
            objc_msgSend(v20, "setWithObjects:", v21);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v44 = 0;
            objc_msgSend(MEMORY[0x1E0CB3708], "unarchivedObjectOfClasses:fromData:error:", v22, v19, &v44);
            v23 = objc_claimAutoreleasedReturnValue();
            v24 = v44;
            v25 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
            v26 = *(void **)(v25 + 40);
            *(_QWORD *)(v25 + 40) = v23;

            if (v24)
            {
              if (gLogCategory__ENConfigurationStore <= 90
                && (gLogCategory__ENConfigurationStore != -1 || _LogCategory_Initialize()))
              {
                v36 = *(_QWORD *)(a1 + 32);
                v37 = v24;
                LogPrintF_safe();
              }
              v32 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
              v33 = *(void **)(v32 + 40);
              *(_QWORD *)(v32 + 40) = 0;

            }
            else
            {
              v40 = v22;
              objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "regionID");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              v28 = a1;
              v29 = objc_msgSend(v27, "isEqualToString:", *(_QWORD *)(a1 + 32));

              +[ENLoggingPrefs sharedENLoggingPrefs](ENLoggingPrefs, "sharedENLoggingPrefs");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              v31 = objc_msgSend(v30, "isSensitiveLoggingAllowed");

              a1 = v28;
              if (v29)
              {
                if (v31
                  && gLogCategory_ENConfigurationStore <= 30
                  && (gLogCategory_ENConfigurationStore != -1 || _LogCategory_Initialize()))
                {
                  LogPrintF_safe();
                }

                v11 = v39;
                goto LABEL_37;
              }
              v11 = v39;
              v22 = v40;
              if (v31
                && gLogCategory_ENConfigurationStore <= 30
                && (gLogCategory_ENConfigurationStore != -1 || _LogCategory_Initialize()))
              {
                v36 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
                LogPrintF_safe();
              }
            }

            v6 = v41;
            v13 = v42;
          }

          v14 = v43;
        }

        ++v15;
      }
      while (v13 != v15);
      v34 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v47, v51, 16);
      v13 = v34;
      if (v34)
        continue;
      break;
    }
  }
LABEL_37:

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40)
    && gLogCategory__ENConfigurationStore <= 90
    && (gLogCategory__ENConfigurationStore != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }

}

BOOL __66__ENConfigurationStore_legacyAppConfiguationForMobileCountryCode___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;

  v4 = a2;
  v5 = a3;
  if (v5
    && gLogCategory__ENConfigurationStore <= 90
    && (gLogCategory__ENConfigurationStore != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }

  return v5 == 0;
}

- (NSString)directoryPath
{
  return self->_directoryPath;
}

- (void)setStoreQueue:(id)a3
{
  objc_storeStrong((id *)&self->_storeQueue, a3);
}

- (BOOL)developerServerConfiguration
{
  return self->_developerServerConfiguration;
}

- (void)setDeveloperServerConfiguration:(BOOL)a3
{
  self->_developerServerConfiguration = a3;
}

- (NSString)regionIdentifierOverride
{
  return self->_regionIdentifierOverride;
}

- (void)setRegionIdentifierOverride:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_regionIdentifierOverride, 0);
  objc_storeStrong((id *)&self->_storeQueue, 0);
  objc_storeStrong((id *)&self->_directoryPath, 0);
}

@end
