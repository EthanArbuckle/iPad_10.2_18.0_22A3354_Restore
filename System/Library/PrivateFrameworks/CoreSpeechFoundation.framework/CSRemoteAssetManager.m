@implementation CSRemoteAssetManager

- (CSRemoteAssetManager)init
{
  CSRemoteAssetManager *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *queue;
  uint64_t v5;
  NSHashTable *observers;
  NSString *currentLanguageCode;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CSRemoteAssetManager;
  v2 = -[CSRemoteAssetManager init](&v10, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("CSRemoteAssetManager", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v5 = objc_claimAutoreleasedReturnValue();
    observers = v2->_observers;
    v2->_observers = (NSHashTable *)v5;

    currentLanguageCode = v2->_currentLanguageCode;
    v2->_currentLanguageCode = (NSString *)CFSTR("en-US");

    -[CSRemoteAssetManager _remoteAssetMetaPath](v2, "_remoteAssetMetaPath");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CSRemoteAssetManager _loadFromJsonFile:](v2, "_loadFromJsonFile:", v8);

  }
  return v2;
}

- (BOOL)_loadPreinstalledAssetMetaIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  __CFString *v6;
  void *v7;
  _BOOL4 v8;
  NSObject *v9;
  BOOL v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  NSObject *v19;
  NSObject *v20;
  int v22;
  const char *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  if (+[CSUtils isDarwinOS](CSUtils, "isDarwinOS")
    && (+[CSFPreferences sharedPreferences](CSFPreferences, "sharedPreferences"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v3, "languageCodeDarwin"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v4,
        v3,
        v4))
  {
    +[CSFPreferences sharedPreferences](CSFPreferences, "sharedPreferences");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "languageCodeDarwin");
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = CFSTR("en-US");
  }
  if (-[NSString isEqualToString:](self->_currentLanguageCode, "isEqualToString:", v6)
    && (-[CSRemoteAssetManager _remoteAssetMetaPath](self, "_remoteAssetMetaPath"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = -[CSRemoteAssetManager _loadFromJsonFile:](self, "_loadFromJsonFile:", v7),
        v7,
        v8))
  {
    v9 = CSLogCategoryAsset;
    v10 = 1;
    if (os_log_type_enabled((os_log_t)CSLogCategoryAsset, OS_LOG_TYPE_INFO))
    {
      v22 = 136315138;
      v23 = "-[CSRemoteAssetManager _loadPreinstalledAssetMetaIfNeeded]";
      _os_log_impl(&dword_1B502E000, v9, OS_LOG_TYPE_INFO, "%s Skip reload assets, already up-to-date", (uint8_t *)&v22, 0xCu);
    }
  }
  else if (+[CSUtils isDarwinOS](CSUtils, "isDarwinOS"))
  {
    +[CSAsset fallBackAssetResourcePath](CSAsset, "fallBackAssetResourcePath");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringByAppendingPathComponent:", CFSTR("preinstalledMeta.json"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "fileExistsAtPath:", v12);

    if ((v14 & 1) != 0)
    {
      -[CSRemoteAssetManager _loadJsonDataFromFile:](self, "_loadJsonDataFromFile:", v12);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "objectForKeyedSubscript:", v6);
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = (void *)v16;
      if (v15 && v16 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        -[CSRemoteAssetManager _setAssetsInfoFromMetaData:](self, "_setAssetsInfoFromMetaData:", v17);
        -[CSRemoteAssetManager _remoteAssetMetaPath](self, "_remoteAssetMetaPath");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = -[CSRemoteAssetManager _writeToJsonFile:](self, "_writeToJsonFile:", v18);

      }
      else
      {
        v20 = CSLogCategoryAsset;
        if (os_log_type_enabled((os_log_t)CSLogCategoryAsset, OS_LOG_TYPE_ERROR))
        {
          v22 = 136315394;
          v23 = "-[CSRemoteAssetManager _loadPreinstalledAssetMetaIfNeeded]";
          v24 = 2114;
          v25 = v15;
          _os_log_error_impl(&dword_1B502E000, v20, OS_LOG_TYPE_ERROR, "%s Invalid rawRemoteAssetMeta : %{public}@", (uint8_t *)&v22, 0x16u);
        }
        v10 = 0;
      }

    }
    else
    {
      v19 = CSLogCategoryAsset;
      v10 = 0;
      if (os_log_type_enabled((os_log_t)CSLogCategoryAsset, OS_LOG_TYPE_DEFAULT))
      {
        v22 = 136315394;
        v23 = "-[CSRemoteAssetManager _loadPreinstalledAssetMetaIfNeeded]";
        v24 = 2114;
        v25 = v12;
        _os_log_impl(&dword_1B502E000, v19, OS_LOG_TYPE_DEFAULT, "%s preinstalled model meta not found : %{public}@", (uint8_t *)&v22, 0x16u);
        v10 = 0;
      }
    }

  }
  else
  {
    v10 = 1;
  }

  return v10;
}

- (id)_remoteAssetMetaPath
{
  void *v2;
  void *v3;
  void *v4;

  +[CSFPreferences sharedPreferences](CSFPreferences, "sharedPreferences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "baseDir");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "stringByAppendingPathComponent:", CFSTR("VoiceTrigger/assetMeta.json"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)assetForCurrentLanguageOfType:(unint64_t)a3
{
  NSObject *queue;
  id v5;
  _QWORD block[7];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  if (a3)
    return 0;
  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__11163;
  v11 = __Block_byref_object_dispose__11164;
  v12 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__CSRemoteAssetManager_assetForCurrentLanguageOfType___block_invoke;
  block[3] = &unk_1E6880E38;
  block[4] = self;
  block[5] = &v7;
  block[6] = 0;
  dispatch_sync(queue, block);
  v5 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v5;
}

- (BOOL)_writeToJsonFile:(id)a3
{
  id v4;
  NSString *currentLanguageCode;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  char v11;
  NSObject *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  char v17;
  id v18;
  void *v19;
  char v20;
  void *v21;
  NSObject *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  id v27;
  id v28;
  uint8_t buf[4];
  const char *v30;
  __int16 v31;
  id v32;
  __int16 v33;
  void *v34;
  _QWORD v35[4];
  NSString *v36;
  __int128 v37;
  NSString *assetHash;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  currentLanguageCode = self->_currentLanguageCode;
  v35[0] = CFSTR("languageCode");
  v35[1] = CFSTR("resourcePath");
  v37 = *(_OWORD *)&self->_resourcePath;
  v35[2] = CFSTR("configVersion");
  v35[3] = CFSTR("assetHash");
  v36 = currentLanguageCode;
  assetHash = self->_assetHash;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v36, v35, 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0;
  objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v6, 3, &v28);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v28;
  if (v7)
  {
    objc_msgSend(v4, "stringByDeletingLastPathComponent");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "fileExistsAtPath:", v9);

    if ((v11 & 1) == 0)
    {
      v12 = CSLogCategoryAsset;
      if (os_log_type_enabled((os_log_t)CSLogCategoryAsset, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v30 = "-[CSRemoteAssetManager _writeToJsonFile:]";
        v31 = 2114;
        v32 = v9;
        _os_log_impl(&dword_1B502E000, v12, OS_LOG_TYPE_DEFAULT, "%s Creating directory : %{public}@", buf, 0x16u);
      }
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v9, 1, 0, 0);

    }
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "fileExistsAtPath:", v4);

    if (v15)
    {
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = v8;
      v17 = objc_msgSend(v16, "removeItemAtPath:error:", v4, &v27);
      v18 = v27;

      if ((v17 & 1) == 0)
      {
        v19 = (void *)CSLogCategoryAsset;
        if (os_log_type_enabled((os_log_t)CSLogCategoryAsset, OS_LOG_TYPE_ERROR))
        {
          v25 = v19;
          objc_msgSend(v18, "localizedDescription");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136315650;
          v30 = "-[CSRemoteAssetManager _writeToJsonFile:]";
          v31 = 2114;
          v32 = v4;
          v33 = 2114;
          v34 = v26;
          _os_log_error_impl(&dword_1B502E000, v25, OS_LOG_TYPE_ERROR, "%s Cannot remove asset meta file : %{public}@, %{public}@", buf, 0x20u);

        }
        v20 = 0;
        goto LABEL_16;
      }
    }
    else
    {
      v18 = v8;
    }
    v20 = objc_msgSend(v7, "writeToFile:atomically:", v4, 1);
LABEL_16:

    v8 = v18;
    goto LABEL_17;
  }
  v21 = (void *)CSLogCategoryAsset;
  if (os_log_type_enabled((os_log_t)CSLogCategoryAsset, OS_LOG_TYPE_ERROR))
  {
    v23 = v21;
    objc_msgSend(v8, "localizedDescription");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v30 = "-[CSRemoteAssetManager _writeToJsonFile:]";
    v31 = 2114;
    v32 = v24;
    _os_log_error_impl(&dword_1B502E000, v23, OS_LOG_TYPE_ERROR, "%s Cannot create json file : %{public}@", buf, 0x16u);

  }
  v20 = 0;
LABEL_17:

  return v20;
}

- (BOOL)_loadFromJsonFile:(id)a3
{
  void *v4;

  -[CSRemoteAssetManager _loadJsonDataFromFile:](self, "_loadJsonDataFromFile:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    -[CSRemoteAssetManager _setAssetsInfoFromMetaData:](self, "_setAssetsInfoFromMetaData:", v4);

  return v4 != 0;
}

- (void)_setAssetsInfoFromMetaData:(id)a3
{
  id v4;
  NSString *v5;
  NSString *currentLanguageCode;
  NSString *v7;
  NSString *resourcePath;
  NSString *v9;
  NSString *configVersion;
  NSString *v11;
  NSString *assetHash;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("languageCode"));
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  currentLanguageCode = self->_currentLanguageCode;
  self->_currentLanguageCode = v5;

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("resourcePath"));
  v7 = (NSString *)objc_claimAutoreleasedReturnValue();
  resourcePath = self->_resourcePath;
  self->_resourcePath = v7;

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("configVersion"));
  v9 = (NSString *)objc_claimAutoreleasedReturnValue();
  configVersion = self->_configVersion;
  self->_configVersion = v9;

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("assetHash"));
  v11 = (NSString *)objc_claimAutoreleasedReturnValue();

  assetHash = self->_assetHash;
  self->_assetHash = v11;

}

- (id)_loadJsonDataFromFile:(id)a3
{
  id v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  id v13;
  NSObject *v14;
  NSObject *v15;
  id v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "fileExistsAtPath:", v3);

  if ((v5 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      v14 = CSLogCategoryAsset;
      if (os_log_type_enabled((os_log_t)CSLogCategoryAsset, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v19 = "-[CSRemoteAssetManager _loadJsonDataFromFile:]";
        v20 = 2114;
        v21 = v3;
        _os_log_impl(&dword_1B502E000, v14, OS_LOG_TYPE_DEFAULT, "%s Cannot read configuration file : %{public}@", buf, 0x16u);
      }
      v13 = 0;
      goto LABEL_18;
    }
    v17 = 0;
    objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v6, 0, &v17);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v17;
    if (v8)
    {
      v9 = (void *)CSLogCategoryAsset;
      if (os_log_type_enabled((os_log_t)CSLogCategoryAsset, OS_LOG_TYPE_DEFAULT))
      {
        v10 = v9;
        objc_msgSend(v8, "localizedDescription");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315394;
        v19 = "-[CSRemoteAssetManager _loadJsonDataFromFile:]";
        v20 = 2114;
        v21 = v11;
        _os_log_impl(&dword_1B502E000, v10, OS_LOG_TYPE_DEFAULT, "%s Cannot decode configuration json file : %{public}@", buf, 0x16u);

      }
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v13 = v7;
LABEL_17:

LABEL_18:
        goto LABEL_19;
      }
      v15 = CSLogCategoryAsset;
      if (os_log_type_enabled((os_log_t)CSLogCategoryAsset, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v19 = "-[CSRemoteAssetManager _loadJsonDataFromFile:]";
        _os_log_impl(&dword_1B502E000, v15, OS_LOG_TYPE_DEFAULT, "%s Configuration json file is not expected format", buf, 0xCu);
      }
    }
    v13 = 0;
    goto LABEL_17;
  }
  v12 = CSLogCategoryAsset;
  if (os_log_type_enabled((os_log_t)CSLogCategoryAsset, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v19 = "-[CSRemoteAssetManager _loadJsonDataFromFile:]";
    v20 = 2114;
    v21 = v3;
    _os_log_impl(&dword_1B502E000, v12, OS_LOG_TYPE_DEFAULT, "%s Remote asset file is not exists : %{public}@", buf, 0x16u);
  }
  v13 = 0;
LABEL_19:

  return v13;
}

- (void)setLanguageCode:(id)a3 resourcePath:(id)a4 configVersion:(id)a5 assetHash:(id)a6 assetType:(unint64_t)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  uint64_t v17;
  NSObject *queue;
  NSObject *v19;
  _QWORD v20[5];
  _QWORD block[5];
  id v22;
  id v23;
  id v24;
  id v25;
  uint8_t buf[4];
  const char *v27;
  __int16 v28;
  id v29;
  __int16 v30;
  id v31;
  __int16 v32;
  id v33;
  __int16 v34;
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = CSLogCategoryAsset;
  if (os_log_type_enabled((os_log_t)CSLogCategoryAsset, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316162;
    v27 = "-[CSRemoteAssetManager setLanguageCode:resourcePath:configVersion:assetHash:assetType:]";
    v28 = 2114;
    v29 = v12;
    v30 = 2114;
    v31 = v13;
    v32 = 2114;
    v33 = v14;
    v34 = 2114;
    v35 = v15;
    _os_log_impl(&dword_1B502E000, v16, OS_LOG_TYPE_DEFAULT, "%s LanguageCode : %{public}@, resourcePath : %{public}@, configVersion : %{public}@, assetHash : %{public}@", buf, 0x34u);
  }
  if (!a7)
  {
    v17 = MEMORY[0x1E0C809B0];
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __87__CSRemoteAssetManager_setLanguageCode_resourcePath_configVersion_assetHash_assetType___block_invoke;
    block[3] = &unk_1E6880E60;
    block[4] = self;
    v22 = v12;
    v23 = v13;
    v24 = v14;
    v25 = v15;
    dispatch_sync(queue, block);
    v19 = self->_queue;
    v20[0] = v17;
    v20[1] = 3221225472;
    v20[2] = __87__CSRemoteAssetManager_setLanguageCode_resourcePath_configVersion_assetHash_assetType___block_invoke_2;
    v20[3] = &unk_1E6881138;
    v20[4] = self;
    dispatch_async(v19, v20);

  }
}

- (id)languageCode
{
  return self->_currentLanguageCode;
}

- (id)assetConfigVersionForAssetType:(unint64_t)a3
{
  NSString *v3;

  if (a3)
    v3 = 0;
  else
    v3 = self->_configVersion;
  return v3;
}

- (id)assetHashForAssetType:(unint64_t)a3
{
  NSString *v3;

  if (a3)
    v3 = 0;
  else
    v3 = self->_assetHash;
  return v3;
}

- (id)resourcePathForAssetType:(unint64_t)a3
{
  NSString *v3;

  if (a3)
    v3 = 0;
  else
    v3 = self->_resourcePath;
  return v3;
}

- (void)addObserver:(id)a3 forAssetType:(unint64_t)a4
{
  id v6;
  NSObject *queue;
  id v8;
  _QWORD block[5];
  id v10;

  v6 = a3;
  if (!a4)
  {
    queue = self->_queue;
    block[1] = 3221225472;
    block[2] = __49__CSRemoteAssetManager_addObserver_forAssetType___block_invoke;
    block[3] = &unk_1E6880E88;
    block[4] = self;
    v8 = v6;
    block[0] = MEMORY[0x1E0C809B0];
    v10 = v6;
    dispatch_sync(queue, block);

    v6 = v8;
  }

}

- (void)removeObserver:(id)a3 forAssetType:(unint64_t)a4
{
  id v6;
  NSObject *queue;
  id v8;
  _QWORD block[5];
  id v10;

  v6 = a3;
  if (!a4)
  {
    queue = self->_queue;
    block[1] = 3221225472;
    block[2] = __52__CSRemoteAssetManager_removeObserver_forAssetType___block_invoke;
    block[3] = &unk_1E6880E88;
    block[4] = self;
    v8 = v6;
    block[0] = MEMORY[0x1E0C809B0];
    v10 = v6;
    dispatch_sync(queue, block);

    v6 = v8;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_assetHash, 0);
  objc_storeStrong((id *)&self->_configVersion, 0);
  objc_storeStrong((id *)&self->_resourcePath, 0);
  objc_storeStrong((id *)&self->_currentLanguageCode, 0);
}

uint64_t __52__CSRemoteAssetManager_removeObserver_forAssetType___block_invoke(uint64_t result)
{
  if (*(_QWORD *)(*(_QWORD *)(result + 32) + 48))
    return objc_msgSend(*(id *)(*(_QWORD *)(result + 32) + 48), "removeObject:", *(_QWORD *)(result + 40));
  return result;
}

uint64_t __49__CSRemoteAssetManager_addObserver_forAssetType___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
  if (!v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 48);
    *(_QWORD *)(v4 + 48) = v3;

    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
  }
  return objc_msgSend(v2, "addObject:", *(_QWORD *)(a1 + 40));
}

void __87__CSRemoteAssetManager_setLanguageCode_resourcePath_configVersion_assetHash_assetType___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 8), *(id *)(a1 + 40));
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 16), *(id *)(a1 + 48));
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 24), *(id *)(a1 + 56));
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 32), *(id *)(a1 + 64));
  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "_remoteAssetMetaPath");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_writeToJsonFile:", v3);

}

void __87__CSRemoteAssetManager_setLanguageCode_resourcePath_configVersion_assetHash_assetType___block_invoke_2(uint64_t a1)
{
  void *v1;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v1 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
  if (v1)
  {
    v11 = 0u;
    v12 = 0u;
    v9 = 0u;
    v10 = 0u;
    v3 = v1;
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v10;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v10 != v6)
            objc_enumerationMutation(v3);
          v8 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * v7);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v8, "CSRemoteAssetManagerDidDownloadNewAsset:", *(_QWORD *)(a1 + 32), (_QWORD)v9);
          ++v7;
        }
        while (v5 != v7);
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      }
      while (v5);
    }

  }
}

void __54__CSRemoteAssetManager_assetForCurrentLanguageOfType___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  if (objc_msgSend(*(id *)(a1 + 32), "_loadPreinstalledAssetMetaIfNeeded"))
  {
    +[CSAsset assetForAssetType:resourcePath:configVersion:](CSAsset, "assetForAssetType:resourcePath:configVersion:", *(_QWORD *)(a1 + 48), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24));
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = v2;

  }
}

+ (id)sharedManager
{
  if (sharedManager_onceToken_11181 != -1)
    dispatch_once(&sharedManager_onceToken_11181, &__block_literal_global_11182);
  return (id)sharedManager_sharedManager;
}

void __37__CSRemoteAssetManager_sharedManager__block_invoke()
{
  CSRemoteAssetManager *v0;
  void *v1;

  v0 = objc_alloc_init(CSRemoteAssetManager);
  v1 = (void *)sharedManager_sharedManager;
  sharedManager_sharedManager = (uint64_t)v0;

}

@end
