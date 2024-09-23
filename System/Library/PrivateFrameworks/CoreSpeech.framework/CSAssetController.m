@implementation CSAssetController

- (CSAssetController)init
{
  CSAssetController *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSMutableDictionary *observers;
  uint64_t v10;
  NSDictionary *csAssetsDictionary;
  NSObject *v12;
  NSDictionary *v13;
  dispatch_queue_t v14;
  OS_dispatch_queue *queue;
  dispatch_queue_t v16;
  OS_dispatch_queue *assetsMigrationQueue;
  NSObject *v18;
  _QWORD block[4];
  CSAssetController *v21;
  objc_super v22;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  NSDictionary *v26;
  _QWORD v27[7];
  _QWORD v28[8];

  v28[7] = *MEMORY[0x1E0C80C00];
  v22.receiver = self;
  v22.super_class = (Class)CSAssetController;
  v2 = -[CSAssetController init](&v22, sel_init);
  if (v2)
  {
    +[CSAssetController getVoiceTriggerAssetTypeString](CSAssetController, "getVoiceTriggerAssetTypeString");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    +[CSAssetController getEndpointAssetTypeString](CSAssetController, "getEndpointAssetTypeString");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[CSAssetController getLanguageDetectorAssetTypeString](CSAssetController, "getLanguageDetectorAssetTypeString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[CSAssetController getAdBlockerAssetTypeString](CSAssetController, "getAdBlockerAssetTypeString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[CSAssetController getSpeakerRecognitionAssetTypeString](CSAssetController, "getSpeakerRecognitionAssetTypeString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v8 = objc_claimAutoreleasedReturnValue();
    observers = v2->_observers;
    v2->_observers = (NSMutableDictionary *)v8;

    v27[0] = &unk_1E7C63938;
    v27[1] = &unk_1E7C63950;
    v28[0] = v3;
    v28[1] = v4;
    v27[2] = &unk_1E7C63968;
    v27[3] = &unk_1E7C63980;
    v28[2] = v5;
    v28[3] = v7;
    v27[4] = &unk_1E7C63998;
    v27[5] = &unk_1E7C639B0;
    v28[4] = v6;
    v28[5] = CFSTR("com.apple.MobileAsset.VoiceTriggerAssetsStudioDisplay");
    v27[6] = &unk_1E7C639C8;
    v28[6] = CFSTR("com.apple.MobileAsset.VoiceTriggerAssetsMac");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, v27, 7);
    v10 = objc_claimAutoreleasedReturnValue();
    csAssetsDictionary = v2->_csAssetsDictionary;
    v2->_csAssetsDictionary = (NSDictionary *)v10;

    v12 = *MEMORY[0x1E0D18F30];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F30], OS_LOG_TYPE_DEFAULT))
    {
      v13 = v2->_csAssetsDictionary;
      *(_DWORD *)buf = 136315394;
      v24 = "-[CSAssetController init]";
      v25 = 2114;
      v26 = v13;
      _os_log_impl(&dword_1C2614000, v12, OS_LOG_TYPE_DEFAULT, "%s _csAssetsDictionary = %{public}@", buf, 0x16u);
    }
    v14 = dispatch_queue_create("Serial CSAssetController queue", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v14;

    v16 = dispatch_queue_create("V1 Assets Clean-up queue", 0);
    assetsMigrationQueue = v2->_assetsMigrationQueue;
    v2->_assetsMigrationQueue = (OS_dispatch_queue *)v16;

    v18 = v2->_assetsMigrationQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __25__CSAssetController_init__block_invoke;
    block[3] = &unk_1E7C292C8;
    v21 = v2;
    dispatch_async(v18, block);

  }
  return v2;
}

- (void)_cleanUpMobileAssetV1Directory
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0D18F30];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F30], OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315138;
    v8 = "-[CSAssetController _cleanUpMobileAssetV1Directory]";
    _os_log_impl(&dword_1C2614000, v2, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v7, 0xCu);
  }
  +[CSAssetController getVoiceTriggerAssetTypeString](CSAssetController, "getVoiceTriggerAssetTypeString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  _MACleanV1Repository();

  +[CSAssetController getEndpointAssetTypeString](CSAssetController, "getEndpointAssetTypeString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _MACleanV1Repository();

  +[CSAssetController getLanguageDetectorAssetTypeString](CSAssetController, "getLanguageDetectorAssetTypeString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  _MACleanV1Repository();

  +[CSAssetController getAdBlockerAssetTypeString](CSAssetController, "getAdBlockerAssetTypeString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  _MACleanV1Repository();

}

- (id)assetOfType:(unint64_t)a3 language:(id)a4
{
  id v6;
  void *v7;
  NSObject *queue;
  NSObject *v9;
  _QWORD block[5];
  id v12;
  unint64_t v13;
  uint8_t buf[4];
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (v6)
  {
    -[CSAssetController installedAssetOfType:withLanguage:](self, "installedAssetOfType:withLanguage:", a3, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __42__CSAssetController_assetOfType_language___block_invoke;
    block[3] = &unk_1E7C28B58;
    block[4] = self;
    v13 = a3;
    v12 = v6;
    dispatch_async(queue, block);

  }
  else
  {
    v9 = *MEMORY[0x1E0D18F30];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F30], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v15 = "-[CSAssetController assetOfType:language:]";
      _os_log_error_impl(&dword_1C2614000, v9, OS_LOG_TYPE_ERROR, "%s CSAssetController cannot query for nil language", buf, 0xCu);
    }
    v7 = 0;
  }

  return v7;
}

- (id)allInstalledAssetsOfType:(unint64_t)a3 language:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  id v13;
  NSObject *v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(uint64_t, void *);
  void *v26;
  id v27;
  unint64_t v28;
  uint8_t buf[4];
  const char *v30;
  __int16 v31;
  unint64_t v32;
  __int16 v33;
  unint64_t v34;
  __int16 v35;
  uint64_t v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (v6)
  {
    -[CSAssetController _assetQueryForAssetType:](self, "_assetQueryForAssetType:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "returnTypes:", 2);
    v8 = objc_msgSend(v7, "queryMetaDataSync");
    objc_msgSend(v7, "results");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[CSAssetController filteredAssetsForAssets:assetType:language:](CSAssetController, "filteredAssetsForAssets:assetType:language:", v9, a3, v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = *MEMORY[0x1E0D18F30];
    v12 = *MEMORY[0x1E0D18F30];
    if ((v8 & 0xFFFFFFFFFFFFFFFDLL) != 0)
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315906;
        v30 = "-[CSAssetController allInstalledAssetsOfType:language:]";
        v31 = 2050;
        v32 = a3;
        v33 = 2114;
        v34 = (unint64_t)v7;
        v35 = 2050;
        v36 = v8;
        _os_log_error_impl(&dword_1C2614000, v11, OS_LOG_TYPE_ERROR, "%s Error running asset-query for assetType:%{public}lu, query: %{public}@, error: %{public}lu", buf, 0x2Au);
      }
      v13 = 0;
    }
    else
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v15 = v11;
        v16 = objc_msgSend(v10, "count");
        objc_msgSend(v7, "queryParams");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315906;
        v30 = "-[CSAssetController allInstalledAssetsOfType:language:]";
        v31 = 2050;
        v32 = v16;
        v33 = 2050;
        v34 = a3;
        v35 = 2114;
        v36 = (uint64_t)v17;
        _os_log_impl(&dword_1C2614000, v15, OS_LOG_TYPE_DEFAULT, "%s ::: found %{public}lu installed assets for assetType=%{public}lu, matching query: %{public}@", buf, 0x2Au);

      }
      objc_msgSend(v10, "sortedArrayUsingComparator:", &__block_literal_global_192);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = MEMORY[0x1E0C809B0];
      v24 = 3221225472;
      v25 = __55__CSAssetController_allInstalledAssetsOfType_language___block_invoke_2;
      v26 = &unk_1E7C25878;
      v27 = v19;
      v28 = a3;
      v20 = v19;
      objc_msgSend(v18, "enumerateObjectsUsingBlock:", &v23);
      if (objc_msgSend(v20, "count", v23, v24, v25, v26))
        v21 = v20;
      else
        v21 = 0;
      v13 = v21;

    }
  }
  else
  {
    v14 = *MEMORY[0x1E0D18F30];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F30], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v30 = "-[CSAssetController allInstalledAssetsOfType:language:]";
      _os_log_error_impl(&dword_1C2614000, v14, OS_LOG_TYPE_ERROR, "%s CSAssetController cannot query for nil language", buf, 0xCu);
    }
    v13 = 0;
  }

  return v13;
}

- (void)assetOfType:(unint64_t)a3 language:(id)a4 completion:(id)a5
{
  id v8;
  void (**v9)(id, _QWORD, void *);
  NSObject *queue;
  NSObject *v11;
  void *v12;
  _QWORD block[5];
  id v14;
  unint64_t v15;
  uint8_t buf[4];
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = (void (**)(id, _QWORD, void *))a5;
  if (!v8)
  {
    v11 = *MEMORY[0x1E0D18F30];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F30], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v17 = "-[CSAssetController assetOfType:language:completion:]";
      _os_log_error_impl(&dword_1C2614000, v11, OS_LOG_TYPE_ERROR, "%s CSAssetController cannot query for nil language", buf, 0xCu);
      if (!v9)
        goto LABEL_6;
    }
    else if (!v9)
    {
      goto LABEL_6;
    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18E80], 114, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v9[2](v9, 0, v12);

    goto LABEL_6;
  }
  -[CSAssetController installedAssetOfType:withLanguage:completion:](self, "installedAssetOfType:withLanguage:completion:", a3, v8, v9);
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__CSAssetController_assetOfType_language_completion___block_invoke;
  block[3] = &unk_1E7C28B58;
  block[4] = self;
  v15 = a3;
  v14 = v8;
  dispatch_async(queue, block);

LABEL_6:
}

- (void)assetOfType:(unint64_t)a3 language:(id)a4 compatibilityVersion:(unint64_t)a5 completion:(id)a6
{
  id v10;
  void (**v11)(id, _QWORD, void *);
  NSObject *queue;
  NSObject *v13;
  void *v14;
  _QWORD block[5];
  id v16;
  void (**v17)(id, _QWORD, void *);
  unint64_t v18;
  unint64_t v19;
  uint8_t buf[4];
  const char *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v11 = (void (**)(id, _QWORD, void *))a6;
  if (!v10)
  {
    v13 = *MEMORY[0x1E0D18F30];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F30], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v21 = "-[CSAssetController assetOfType:language:compatibilityVersion:completion:]";
      _os_log_error_impl(&dword_1C2614000, v13, OS_LOG_TYPE_ERROR, "%s CSAssetController cannot query for nil language", buf, 0xCu);
      if (!v11)
        goto LABEL_6;
    }
    else if (!v11)
    {
      goto LABEL_6;
    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18E80], 114, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v11[2](v11, 0, v14);

    goto LABEL_6;
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __74__CSAssetController_assetOfType_language_compatibilityVersion_completion___block_invoke;
  block[3] = &unk_1E7C27198;
  block[4] = self;
  v18 = a3;
  v19 = a5;
  v16 = v10;
  v17 = v11;
  dispatch_async(queue, block);

LABEL_6:
}

- (id)installedAssetOfType:(unint64_t)a3 language:(id)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  int v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (v6)
  {
    -[CSAssetController installedAssetOfType:withLanguage:](self, "installedAssetOfType:withLanguage:", a3, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = *MEMORY[0x1E0D18F30];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F30], OS_LOG_TYPE_ERROR))
    {
      v10 = 136315138;
      v11 = "-[CSAssetController installedAssetOfType:language:]";
      _os_log_error_impl(&dword_1C2614000, v8, OS_LOG_TYPE_ERROR, "%s CSAssetController cannot query for nil language", (uint8_t *)&v10, 0xCu);
    }
    v7 = 0;
  }

  return v7;
}

- (void)installedAssetOfType:(unint64_t)a3 language:(id)a4 completion:(id)a5
{
  id v8;
  void (**v9)(id, _QWORD, void *);
  NSObject *v10;
  void *v11;
  int v12;
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = (void (**)(id, _QWORD, void *))a5;
  if (!v8)
  {
    v10 = *MEMORY[0x1E0D18F30];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F30], OS_LOG_TYPE_ERROR))
    {
      v12 = 136315138;
      v13 = "-[CSAssetController installedAssetOfType:language:completion:]";
      _os_log_error_impl(&dword_1C2614000, v10, OS_LOG_TYPE_ERROR, "%s CSAssetController cannot query for nil language", (uint8_t *)&v12, 0xCu);
      if (!v9)
        goto LABEL_6;
    }
    else if (!v9)
    {
      goto LABEL_6;
    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18E80], 114, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v9[2](v9, 0, v11);

    goto LABEL_6;
  }
  -[CSAssetController installedAssetOfType:withLanguage:completion:](self, "installedAssetOfType:withLanguage:completion:", a3, v8, v9);
LABEL_6:

}

- (id)installedAssetOfType:(unint64_t)a3 withLanguage:(id)a4
{
  id v6;
  NSObject *queue;
  id v8;
  void *v9;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t);
  void *v14;
  CSAssetController *v15;
  id v16;
  uint64_t *v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v6 = a4;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__11136;
  v23 = __Block_byref_object_dispose__11137;
  v24 = 0;
  queue = self->_queue;
  v11 = MEMORY[0x1E0C809B0];
  v12 = 3221225472;
  v13 = __55__CSAssetController_installedAssetOfType_withLanguage___block_invoke;
  v14 = &unk_1E7C26290;
  v17 = &v19;
  v18 = a3;
  v15 = self;
  v8 = v6;
  v16 = v8;
  dispatch_sync(queue, &v11);
  objc_msgSend((id)v20[5], "getCSAssetOfType:", a3, v11, v12, v13, v14, v15);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(&v19, 8);
  return v9;
}

- (void)installedAssetOfType:(unint64_t)a3 withLanguage:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  NSObject *queue;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  unint64_t v16;

  v8 = a4;
  v9 = a5;
  queue = self->_queue;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __66__CSAssetController_installedAssetOfType_withLanguage_completion___block_invoke;
  v13[3] = &unk_1E7C258C8;
  v13[4] = self;
  v14 = v8;
  v15 = v9;
  v16 = a3;
  v11 = v9;
  v12 = v8;
  dispatch_async(queue, v13);

}

- (id)_installedAssetOfType:(unint64_t)a3 withLanguage:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  int v18;
  const char *v19;
  __int16 v20;
  unint64_t v21;
  __int16 v22;
  unint64_t v23;
  __int16 v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  -[CSAssetController _assetQueryForAssetType:](self, "_assetQueryForAssetType:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "returnTypes:", 2);
  v8 = objc_msgSend(v7, "queryMetaDataSync");
  objc_msgSend(v7, "results");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[CSAssetController filteredAssetsForAssets:assetType:language:](CSAssetController, "filteredAssetsForAssets:assetType:language:", v9, a3, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = *MEMORY[0x1E0D18F30];
  v12 = *MEMORY[0x1E0D18F30];
  if ((v8 & 0xFFFFFFFFFFFFFFFDLL) != 0)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v18 = 136315906;
      v19 = "-[CSAssetController _installedAssetOfType:withLanguage:]";
      v20 = 2050;
      v21 = a3;
      v22 = 2114;
      v23 = (unint64_t)v7;
      v24 = 2050;
      v25 = v8;
      _os_log_error_impl(&dword_1C2614000, v11, OS_LOG_TYPE_ERROR, "%s Error running asset-query for assetType:%{public}lu, query: %{public}@, error: %{public}lu", (uint8_t *)&v18, 0x2Au);
    }
    v13 = 0;
  }
  else
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v14 = v11;
      v15 = objc_msgSend(v10, "count");
      objc_msgSend(v7, "queryParams");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 136315906;
      v19 = "-[CSAssetController _installedAssetOfType:withLanguage:]";
      v20 = 2050;
      v21 = v15;
      v22 = 2050;
      v23 = a3;
      v24 = 2114;
      v25 = (uint64_t)v16;
      _os_log_impl(&dword_1C2614000, v14, OS_LOG_TYPE_DEFAULT, "%s ::: found %{public}lu assets for assetType=%{public}lu, matching query: %{public}@", (uint8_t *)&v18, 0x2Au);

    }
    -[CSAssetController _findLatestInstalledAsset:](self, "_findLatestInstalledAsset:", v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v13;
}

- (void)_installedAssetOfType:(unint64_t)a3 withLanguage:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;

  v8 = a5;
  v9 = a4;
  -[CSAssetController _assetQueryForAssetType:](self, "_assetQueryForAssetType:", a3);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[CSAssetController _installedAssetOfType:query:withLanguage:completion:](self, "_installedAssetOfType:query:withLanguage:completion:", a3, v10, v9, v8);

}

- (void)_installedAssetOfType:(unint64_t)a3 query:(id)a4 withLanguage:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  CSAssetController *v19;
  id v20;
  unint64_t v21;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  objc_msgSend(v10, "returnTypes:", 2);
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __73__CSAssetController__installedAssetOfType_query_withLanguage_completion___block_invoke;
  v16[3] = &unk_1E7C258F0;
  v20 = v12;
  v21 = a3;
  v17 = v10;
  v18 = v11;
  v19 = self;
  v13 = v12;
  v14 = v11;
  v15 = v10;
  objc_msgSend(v15, "queryMetaData:", v16);

}

- (id)_findLatestInstalledAsset:(id)a3
{
  uint64_t v3;
  __int128 v4;
  os_log_t *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  unint64_t v11;
  NSObject *v12;
  id v14;
  os_log_t v15;
  NSObject *v16;
  void *v17;
  __int128 v19;
  id obj;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  unint64_t v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  obj = a3;
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
  v5 = (os_log_t *)MEMORY[0x1E0D18F30];
  if (v3)
  {
    v6 = v3;
    v7 = 0;
    v8 = *(_QWORD *)v22;
    *(_QWORD *)&v4 = 136315394;
    v19 = v4;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v22 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        v11 = objc_msgSend(v10, "state", v19);
        v12 = *v5;
        if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v19;
          v26 = "-[CSAssetController _findLatestInstalledAsset:]";
          v27 = 2050;
          v28 = v11;
          _os_log_impl(&dword_1C2614000, v12, OS_LOG_TYPE_DEFAULT, "%s Asset state : %{public}ld", buf, 0x16u);
        }
        if (v11 <= 6 && ((1 << v11) & 0x6C) != 0)
        {
          if (v7)
          {
            if (objc_msgSend(v10, "isLatestCompareTo:", v7))
            {
              v14 = v10;

              v7 = v14;
            }
          }
          else
          {
            v7 = v10;
          }
        }
      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
    }
    while (v6);
  }
  else
  {
    v7 = 0;
  }
  v15 = *v5;
  if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
  {
    v16 = v15;
    objc_msgSend(v7, "attributes");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v26 = "-[CSAssetController _findLatestInstalledAsset:]";
    v27 = 2114;
    v28 = (unint64_t)v17;
    _os_log_impl(&dword_1C2614000, v16, OS_LOG_TYPE_DEFAULT, "%s %{public}@", buf, 0x16u);

  }
  return v7;
}

- (id)_assetQueryForAssetType:(unint64_t)a3
{
  NSObject *v5;
  id v6;
  NSDictionary *csAssetsDictionary;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  unint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = *MEMORY[0x1E0D18F30];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F30], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v15 = "-[CSAssetController _assetQueryForAssetType:]";
    v16 = 2050;
    v17 = a3;
    _os_log_impl(&dword_1C2614000, v5, OS_LOG_TYPE_INFO, "%s ::: assetType: %{public}lu", buf, 0x16u);
  }
  v6 = objc_alloc(MEMORY[0x1E0D4E050]);
  csAssetsDictionary = self->_csAssetsDictionary;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](csAssetsDictionary, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v6, "initWithType:", v9);

  v13 = v10;
  +[CSAssetController addKeyValuePairForQuery:assetType:](CSAssetController, "addKeyValuePairForQuery:assetType:", &v13, a3);
  v11 = v13;

  -[CSAssetController _setAssetQueryParameters:](self, "_setAssetQueryParameters:", v11);
  return v11;
}

- (void)_setAssetQueryParameters:(id)a3
{
  id v3;
  NSObject *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = *MEMORY[0x1E0D18F30];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F30], OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315138;
    v6 = "-[CSAssetController _setAssetQueryParameters:]";
    _os_log_impl(&dword_1C2614000, v4, OS_LOG_TYPE_DEFAULT, "%s setDoNotBlockBeforeFirstUnlock: YES", (uint8_t *)&v5, 0xCu);
  }
  objc_msgSend(v3, "setDoNotBlockBeforeFirstUnlock:", 1);

}

- (void)_runAssetQuery:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = *MEMORY[0x1E0D18F30];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F30], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v14 = "-[CSAssetController _runAssetQuery:completion:]";
    v15 = 2082;
    v16 = "-[CSAssetController _runAssetQuery:completion:]";
    v17 = 2114;
    v18 = v5;
    _os_log_impl(&dword_1C2614000, v7, OS_LOG_TYPE_INFO, "%s ::: %{public}s; query: %{public}@", buf, 0x20u);
  }
  kdebug_trace();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __47__CSAssetController__runAssetQuery_completion___block_invoke;
  v10[3] = &unk_1E7C25918;
  v11 = v5;
  v12 = v6;
  v8 = v6;
  v9 = v5;
  objc_msgSend(v9, "queryMetaData:", v10);

}

- (void)fetchRemoteMetaOfType:(unint64_t)a3
{
  -[CSAssetController fetchRemoteMetaOfType:allowRetry:](self, "fetchRemoteMetaOfType:allowRetry:", a3, 1);
}

- (void)fetchRemoteMetaOfType:(unint64_t)a3 allowRetry:(BOOL)a4
{
  NSObject *v7;
  _QWORD v8[6];
  BOOL v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v7 = *MEMORY[0x1E0D18F30];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F30], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v11 = "-[CSAssetController fetchRemoteMetaOfType:allowRetry:]";
    v12 = 1026;
    v13 = a3;
    _os_log_impl(&dword_1C2614000, v7, OS_LOG_TYPE_DEFAULT, "%s ::: Request Fetching RemoteMetaData : assetType : %{public}d", buf, 0x12u);
  }
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __54__CSAssetController_fetchRemoteMetaOfType_allowRetry___block_invoke;
  v8[3] = &unk_1E7C25968;
  v8[4] = self;
  v8[5] = a3;
  v9 = a4;
  -[CSAssetController _downloadAssetCatalogForAssetType:complete:](self, "_downloadAssetCatalogForAssetType:complete:", a3, v8);
}

- (void)_fetchRemoteAssetOfType:(unint64_t)a3 withLanguage:(id)a4 completion:(id)a5
{
  NSObject *queue;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  int v13;
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  queue = self->_queue;
  v9 = a5;
  v10 = a4;
  dispatch_assert_queue_V2(queue);
  v11 = *MEMORY[0x1E0D18F30];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F30], OS_LOG_TYPE_DEFAULT))
  {
    v13 = 136315138;
    v14 = "-[CSAssetController _fetchRemoteAssetOfType:withLanguage:completion:]";
    _os_log_impl(&dword_1C2614000, v11, OS_LOG_TYPE_DEFAULT, "%s ::: Request fetching remote asset", (uint8_t *)&v13, 0xCu);
  }
  -[CSAssetController _assetQueryForAssetType:](self, "_assetQueryForAssetType:", a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSAssetController _fetchRemoteAssetOfType:withLanguage:query:completion:](self, "_fetchRemoteAssetOfType:withLanguage:query:completion:", a3, v10, v12, v9);

}

- (void)_fetchRemoteAssetOfType:(unint64_t)a3 withLanguage:(id)a4 query:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;
  unint64_t v20;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  objc_msgSend(v11, "returnTypes:", 2);
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __75__CSAssetController__fetchRemoteAssetOfType_withLanguage_query_completion___block_invoke;
  v16[3] = &unk_1E7C258F0;
  v16[4] = self;
  v17 = v11;
  v19 = v12;
  v20 = a3;
  v18 = v10;
  v13 = v12;
  v14 = v10;
  v15 = v11;
  objc_msgSend(v15, "queryMetaData:", v16);

}

- (void)_downloadAssetCatalogForAssetType:(unint64_t)a3 complete:(id)a4
{
  id v6;
  void *v7;
  NSDictionary *csAssetsDictionary;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[5];
  id v14;
  unint64_t v15;

  v6 = a4;
  v7 = (void *)MEMORY[0x1E0D4E038];
  csAssetsDictionary = self->_csAssetsDictionary;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](csAssetsDictionary, "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSAssetController _defaultDownloadOptions](self, "_defaultDownloadOptions");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __64__CSAssetController__downloadAssetCatalogForAssetType_complete___block_invoke;
  v13[3] = &unk_1E7C25990;
  v14 = v6;
  v15 = a3;
  v13[4] = self;
  v12 = v6;
  objc_msgSend(v7, "startCatalogDownload:options:then:", v10, v11, v13);

}

- (BOOL)_isRetryRecommendedWithResult:(int64_t)a3
{
  BOOL result;

  result = 1;
  if ((unint64_t)(a3 - 8) > 0x3F || ((1 << (a3 - 8)) & 0x800000800C410723) == 0)
    return (unint64_t)(a3 - 1) < 3;
  return result;
}

- (void)_updateFromRemoteToLocalAssets:(id)a3 forAssetType:(unint64_t)a4 completion:(id)a5
{
  id v7;
  NSObject *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  id v25;
  void *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  NSObject *v34;
  void *v35;
  void *v36;
  CSAssetController *v38;
  id v39;
  id v40;
  _QWORD v41[5];
  id v42;
  unint64_t v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  uint8_t buf[4];
  const char *v53;
  __int16 v54;
  unint64_t v55;
  _BYTE v56[128];
  _BYTE v57[128];
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v38 = self;
  v39 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v8 = *MEMORY[0x1E0D18F30];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F30], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v53 = "-[CSAssetController _updateFromRemoteToLocalAssets:forAssetType:completion:]";
    _os_log_impl(&dword_1C2614000, v8, OS_LOG_TYPE_DEFAULT, "%s ::: Fetching remote asset", buf, 0xCu);
  }
  v50 = 0u;
  v51 = 0u;
  v49 = 0u;
  v48 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v48, v57, 16);
  if (!v10)
  {
    v12 = 0;
    v13 = 0;
    v14 = 0;
    goto LABEL_24;
  }
  v11 = v10;
  v12 = 0;
  v13 = 0;
  v14 = 0;
  v15 = *(_QWORD *)v49;
  do
  {
    for (i = 0; i != v11; ++i)
    {
      if (*(_QWORD *)v49 != v15)
        objc_enumerationMutation(v9);
      v17 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * i);
      if (v14)
      {
        if (objc_msgSend(*(id *)(*((_QWORD *)&v48 + 1) + 8 * i), "isLatestCompareTo:", v14))
        {
          v18 = v17;

          v14 = v18;
        }
      }
      else
      {
        v14 = v17;
      }
      if (objc_msgSend(v17, "isCSAssetInstalled"))
      {
        if (!v13)
        {
          v13 = v17;
          continue;
        }
        if (objc_msgSend(v17, "isLatestCompareTo:", v13))
        {
          v19 = v13;

          v13 = v17;
        }
        else
        {
          if (!objc_msgSend(v17, "isLatestCompareTo:", v12))
            continue;
          v19 = v17;

        }
        v12 = v19;
      }
    }
    v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v48, v57, 16);
  }
  while (v11);
LABEL_24:

  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  v20 = v9;
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v44, v56, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v45;
    v40 = v20;
    do
    {
      for (j = 0; j != v22; ++j)
      {
        if (*(_QWORD *)v45 != v23)
          objc_enumerationMutation(v20);
        v25 = *(id *)(*((_QWORD *)&v44 + 1) + 8 * j);
        if (v25 != v14 && v25 != v13 && v25 != v12)
        {
          if (objc_msgSend(*(id *)(*((_QWORD *)&v44 + 1) + 8 * j), "isDownloading"))
          {
            objc_msgSend(v25, "cancelDownloadSync");
          }
          else if (objc_msgSend(v25, "canBePurged"))
          {
            v28 = (void *)*MEMORY[0x1E0D18F30];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F30], OS_LOG_TYPE_DEFAULT))
            {
              v29 = v28;
              objc_msgSend(v25, "path");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 136315394;
              v53 = "-[CSAssetController _updateFromRemoteToLocalAssets:forAssetType:completion:]";
              v54 = 2114;
              v55 = (unint64_t)v30;
              _os_log_impl(&dword_1C2614000, v29, OS_LOG_TYPE_DEFAULT, "%s ::: Purging installed asset : %{public}@", buf, 0x16u);

            }
            objc_msgSend(v25, "purgeSync");
            objc_msgSend(MEMORY[0x1E0D19110], "sharedPreferences");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "getOnDeviceCompilationCacheDirectory");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            v33 = +[CSOnDeviceMAAssetCachedIrPurger purgeCachedIrForMAAsset:cachedIrDir:](CSOnDeviceMAAssetCachedIrPurger, "purgeCachedIrForMAAsset:cachedIrDir:", v25, v32);

            v20 = v40;
          }
        }
      }
      v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v44, v56, 16);
    }
    while (v22);
  }

  if (!v14 || v14 == v13)
  {
    v35 = v39;
    if (v13)
    {
      if (v39)
        (*((void (**)(id, _QWORD))v39 + 2))(v39, 0);
    }
    else if (v39)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18E80], 802, 0);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, void *))v39 + 2))(v39, v36);

    }
  }
  else
  {
    v34 = *MEMORY[0x1E0D18F30];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F30], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v53 = "-[CSAssetController _updateFromRemoteToLocalAssets:forAssetType:completion:]";
      v54 = 2050;
      v55 = a4;
      _os_log_impl(&dword_1C2614000, v34, OS_LOG_TYPE_DEFAULT, "%s ::: Request downloading remote asset for assetType %{public}lu", buf, 0x16u);
    }
    v41[0] = MEMORY[0x1E0C809B0];
    v41[1] = 3221225472;
    v41[2] = __76__CSAssetController__updateFromRemoteToLocalAssets_forAssetType_completion___block_invoke;
    v41[3] = &unk_1E7C277F8;
    v35 = v39;
    v41[4] = v38;
    v42 = v39;
    v43 = a4;
    -[CSAssetController _downloadAsset:withComplete:](v38, "_downloadAsset:withComplete:", v14, v41);

  }
}

- (id)_defaultDownloadOptions
{
  void *v2;

  v2 = (void *)objc_opt_new();
  objc_msgSend(v2, "setAllowsCellularAccess:", 0);
  objc_msgSend(v2, "setCanUseLocalCacheServer:", 0);
  objc_msgSend(v2, "setDiscretionary:", 0);
  return v2;
}

- (void)_downloadAsset:(id)a3 withComplete:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  uint8_t buf[4];
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v8 = *MEMORY[0x1E0D18F30];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F30], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v15 = "-[CSAssetController _downloadAsset:withComplete:]";
    _os_log_impl(&dword_1C2614000, v8, OS_LOG_TYPE_DEFAULT, "%s ::: Start downloading asset", buf, 0xCu);
  }
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __49__CSAssetController__downloadAsset_withComplete___block_invoke_214;
  v11[3] = &unk_1E7C259F8;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  -[CSAssetController _startDownloadingAsset:progress:completion:](self, "_startDownloadingAsset:progress:completion:", v10, &__block_literal_global_213, v11);

}

- (void)_startDownloadingAsset:(id)a3 progress:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  int v21;
  int v22;
  void *v23;
  _QWORD v24[4];
  id v25;
  _QWORD v26[4];
  id v27;
  id v28;
  _BYTE buf[12];
  __int16 v30;
  id v31;
  __int16 v32;
  uint64_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)*MEMORY[0x1E0D18F30];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F30], OS_LOG_TYPE_INFO))
  {
    v12 = v11;
    *(_DWORD *)buf = 136315650;
    *(_QWORD *)&buf[4] = "-[CSAssetController _startDownloadingAsset:progress:completion:]";
    v30 = 2114;
    v31 = v8;
    v32 = 2050;
    v33 = objc_msgSend(v8, "state");
    _os_log_impl(&dword_1C2614000, v12, OS_LOG_TYPE_INFO, "%s Attempting to download asset %{public}@, asset state : %{public}ld", buf, 0x20u);

  }
  v13 = MEMORY[0x1E0C809B0];
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __64__CSAssetController__startDownloadingAsset_progress_completion___block_invoke;
  v26[3] = &unk_1E7C25A20;
  v14 = v9;
  v28 = v14;
  v15 = v8;
  v27 = v15;
  v16 = (void *)MEMORY[0x1C3BC4734](v26);
  switch(objc_msgSend(v15, "state"))
  {
    case 0:
      v17 = (void *)MEMORY[0x1E0CB35C8];
      v18 = *MEMORY[0x1E0D18E80];
      v19 = 808;
      goto LABEL_5;
    case 1:
      *(_QWORD *)buf = 0;
      v22 = objc_msgSend(v15, "spaceCheck:", buf);
      if (v22)
      {
        objc_msgSend(v15, "attachProgressCallBack:", v16);
        -[CSAssetController _defaultDownloadOptions](self, "_defaultDownloadOptions");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24[0] = v13;
        v24[1] = 3221225472;
        v24[2] = __64__CSAssetController__startDownloadingAsset_progress_completion___block_invoke_2;
        v24[3] = &unk_1E7C25A48;
        v25 = v10;
        objc_msgSend(v15, "startDownload:then:", v23, v24);

        v20 = 0;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18E80], 807, 0);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v21 = v22 ^ 1;
      if (!v10)
        goto LABEL_9;
      goto LABEL_7;
    case 2:
    case 3:
    case 5:
    case 6:
      v17 = (void *)MEMORY[0x1E0CB35C8];
      v18 = *MEMORY[0x1E0D18E80];
      v19 = 806;
      goto LABEL_5;
    case 4:
      v17 = (void *)MEMORY[0x1E0CB35C8];
      v18 = *MEMORY[0x1E0D18E80];
      v19 = 805;
LABEL_5:
      objc_msgSend(v17, "errorWithDomain:code:userInfo:", v18, v19, 0);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      v20 = 0;
      break;
  }
  v21 = 1;
  if (v10)
  {
LABEL_7:
    if (v21)
      (*((void (**)(id, void *))v10 + 2))(v10, v20);
  }
LABEL_9:

}

- (void)addObserver:(id)a3 forAssetType:(unint64_t)a4
{
  id v6;
  NSObject *queue;
  id v8;
  _QWORD block[5];
  id v10;
  unint64_t v11;

  v6 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__CSAssetController_addObserver_forAssetType___block_invoke;
  block[3] = &unk_1E7C28B58;
  v10 = v6;
  v11 = a4;
  block[4] = self;
  v8 = v6;
  dispatch_async(queue, block);

}

- (void)removeObserver:(id)a3 forAssetType:(unint64_t)a4
{
  id v6;
  NSObject *queue;
  id v8;
  _QWORD block[5];
  id v10;
  unint64_t v11;

  v6 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__CSAssetController_removeObserver_forAssetType___block_invoke;
  block[3] = &unk_1E7C28B58;
  v10 = v6;
  v11 = a4;
  block[4] = self;
  v8 = v6;
  dispatch_async(queue, block);

}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (OS_dispatch_queue)assetsMigrationQueue
{
  return self->_assetsMigrationQueue;
}

- (void)setAssetsMigrationQueue:(id)a3
{
  objc_storeStrong((id *)&self->_assetsMigrationQueue, a3);
}

- (NSDictionary)csAssetsDictionary
{
  return self->_csAssetsDictionary;
}

- (void)setCsAssetsDictionary:(id)a3
{
  objc_storeStrong((id *)&self->_csAssetsDictionary, a3);
}

- (NSMutableDictionary)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
  objc_storeStrong((id *)&self->_observers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_csAssetsDictionary, 0);
  objc_storeStrong((id *)&self->_assetsMigrationQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __49__CSAssetController_removeObserver_forAssetType___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "observers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 48));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "observers");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 48));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeObject:", *(_QWORD *)(a1 + 40));

  }
}

void __46__CSAssetController_addObserver_forAssetType___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  objc_msgSend(*(id *)(a1 + 32), "observers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 48));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "observers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 48));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v5, v7);

  }
  objc_msgSend(*(id *)(a1 + 32), "observers");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 48));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObject:", *(_QWORD *)(a1 + 40));

}

void __64__CSAssetController__startDownloadingAsset_progress_completion___block_invoke(uint64_t a1, void *a2)
{
  double v3;
  double v4;
  uint64_t v5;
  id v6;

  v6 = a2;
  objc_msgSend(v6, "expectedTimeRemaining");
  if (v3 <= 0.0)
  {
    objc_msgSend(*(id *)(a1 + 32), "attachProgressCallBack:", 0);
  }
  else
  {
    v4 = (double)objc_msgSend(v6, "totalWritten");
    if (v4 / (float)objc_msgSend(v6, "totalExpected") > 0.0)
    {
      v5 = *(_QWORD *)(a1 + 40);
      if (v5)
        (*(void (**)(void))(v5 + 16))();
    }
  }

}

void __64__CSAssetController__startDownloadingAsset_progress_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  if (a2)
  {
    if (v2)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18E80], 804, 0);
      v3 = (id)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

    }
  }
  else if (v2)
  {
    (*(void (**)(_QWORD, _QWORD))(v2 + 16))(*(_QWORD *)(a1 + 32), 0);
  }
}

void __49__CSAssetController__downloadAsset_withComplete___block_invoke_214(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  int v13;
  const char *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)*MEMORY[0x1E0D18F30];
  if (v3)
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F30], OS_LOG_TYPE_ERROR))
    {
      v5 = *(void **)(a1 + 32);
      v6 = v4;
      objc_msgSend(v5, "assetServerUrl");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "localizedDescription");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 136315650;
      v14 = "-[CSAssetController _downloadAsset:withComplete:]_block_invoke";
      v15 = 2114;
      v16 = v7;
      v17 = 2114;
      v18 = v8;
      _os_log_error_impl(&dword_1C2614000, v6, OS_LOG_TYPE_ERROR, "%s ::: Error downloading from %{public}@ with error %{public}@", (uint8_t *)&v13, 0x20u);

    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F30], OS_LOG_TYPE_DEFAULT))
    {
      v9 = *(void **)(a1 + 32);
      v10 = v4;
      objc_msgSend(v9, "assetServerUrl");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 136315394;
      v14 = "-[CSAssetController _downloadAsset:withComplete:]_block_invoke";
      v15 = 2114;
      v16 = v11;
      _os_log_impl(&dword_1C2614000, v10, OS_LOG_TYPE_DEFAULT, "%s ::: download completed successfully from %{public}@.", (uint8_t *)&v13, 0x16u);

    }
    v12 = *(_QWORD *)(a1 + 40);
    if (v12)
      (*(void (**)(void))(v12 + 16))();
  }

}

void __49__CSAssetController__downloadAsset_withComplete___block_invoke(double a1)
{
  NSObject *v2;
  int v3;
  const char *v4;
  __int16 v5;
  double v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0D18F30];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F30], OS_LOG_TYPE_DEFAULT))
  {
    v3 = 136315394;
    v4 = "-[CSAssetController _downloadAsset:withComplete:]_block_invoke";
    v5 = 2050;
    v6 = a1 * 100.0;
    _os_log_impl(&dword_1C2614000, v2, OS_LOG_TYPE_DEFAULT, "%s ::: download progress: %{public}3.0f%%", (uint8_t *)&v3, 0x16u);
  }
}

void __76__CSAssetController__updateFromRemoteToLocalAssets_forAssetType_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  id v3;
  _QWORD block[5];
  id v5;
  uint64_t v6;

  objc_msgSend(*(id *)(a1 + 32), "queue");
  v2 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __76__CSAssetController__updateFromRemoteToLocalAssets_forAssetType_completion___block_invoke_2;
  block[3] = &unk_1E7C277F8;
  v3 = *(id *)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  v6 = *(_QWORD *)(a1 + 48);
  dispatch_async(v2, block);

}

void __76__CSAssetController__updateFromRemoteToLocalAssets_forAssetType_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
    (*(void (**)(uint64_t, _QWORD))(v2 + 16))(v2, 0);
  objc_msgSend(*(id *)(a1 + 32), "observers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 48));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    objc_msgSend(*(id *)(a1 + 32), "observers", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 48));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v15;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v15 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v12);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v13, "CSAssetController:didDownloadNewAssetForType:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));
          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v10);
    }

  }
}

void __64__CSAssetController__downloadAssetCatalogForAssetType_complete___block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  const char *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = *MEMORY[0x1E0D18F30];
  v5 = *MEMORY[0x1E0D18F30];
  if (a2)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v9 = *(_QWORD *)(a1 + 48);
      v10 = 136315650;
      v11 = "-[CSAssetController _downloadAssetCatalogForAssetType:complete:]_block_invoke";
      v12 = 2050;
      v13 = v9;
      v14 = 2050;
      v15 = a2;
      _os_log_error_impl(&dword_1C2614000, v4, OS_LOG_TYPE_ERROR, "%s Failed to download meta data for assetType %{public}lu with error %{public}lu", (uint8_t *)&v10, 0x20u);
    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18E80], 804, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(_QWORD *)(a1 + 48);
      v10 = 136315394;
      v11 = "-[CSAssetController _downloadAssetCatalogForAssetType:complete:]_block_invoke";
      v12 = 2050;
      v13 = v7;
      _os_log_impl(&dword_1C2614000, v4, OS_LOG_TYPE_DEFAULT, "%s Meta data downloaded successfully for assetType %{public}lu", (uint8_t *)&v10, 0x16u);
    }
    v6 = 0;
  }
  v8 = *(_QWORD *)(a1 + 40);
  if (v8)
    (*(void (**)(uint64_t, void *, uint64_t))(v8 + 16))(v8, v6, objc_msgSend(*(id *)(a1 + 32), "_isRetryRecommendedWithResult:", a2));

}

void __75__CSAssetController__fetchRemoteAssetOfType_withLanguage_query_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  id v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10;
  id v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;

  objc_msgSend(*(id *)(a1 + 32), "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __75__CSAssetController__fetchRemoteAssetOfType_withLanguage_query_completion___block_invoke_2;
  v9[3] = &unk_1E7C26B08;
  v14 = a2;
  v5 = *(id *)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 64);
  v10 = v5;
  v15 = v6;
  v7 = *(id *)(a1 + 48);
  v8 = *(_QWORD *)(a1 + 32);
  v11 = v7;
  v12 = v8;
  v13 = *(id *)(a1 + 56);
  dispatch_async(v4, v9);

}

void __75__CSAssetController__fetchRemoteAssetOfType_withLanguage_query_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  const char *v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 64);
  if (!v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "results");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[CSAssetController filteredAssetsForAssets:assetType:language:](CSAssetController, "filteredAssetsForAssets:assetType:language:", v6, *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 40));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = (void *)*MEMORY[0x1E0D18F30];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F30], OS_LOG_TYPE_DEFAULT))
    {
      v8 = v7;
      v9 = objc_msgSend(v5, "count");
      v10 = *(_QWORD *)(a1 + 72);
      v12 = 136315650;
      v13 = "-[CSAssetController _fetchRemoteAssetOfType:withLanguage:query:completion:]_block_invoke_2";
      v14 = 2050;
      v15 = v9;
      v16 = 2050;
      v17 = v10;
      _os_log_impl(&dword_1C2614000, v8, OS_LOG_TYPE_DEFAULT, "%s ::: found %{public}lu assets for assetType %{public}lu", (uint8_t *)&v12, 0x20u);

    }
    objc_msgSend(*(id *)(a1 + 48), "_updateFromRemoteToLocalAssets:forAssetType:completion:", v5, *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 56));
    goto LABEL_9;
  }
  v3 = *MEMORY[0x1E0D18F30];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F30], OS_LOG_TYPE_ERROR))
  {
    v11 = *(_QWORD *)(a1 + 72);
    v12 = 136315650;
    v13 = "-[CSAssetController _fetchRemoteAssetOfType:withLanguage:query:completion:]_block_invoke";
    v14 = 2050;
    v15 = v11;
    v16 = 2050;
    v17 = v2;
    _os_log_error_impl(&dword_1C2614000, v3, OS_LOG_TYPE_ERROR, "%s Failed to finish query for assetType %{public}lu with error %{public}lu", (uint8_t *)&v12, 0x20u);
  }
  v4 = *(_QWORD *)(a1 + 56);
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18E80], 802, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);
LABEL_9:

  }
}

void __54__CSAssetController_fetchRemoteMetaOfType_allowRetry___block_invoke(uint64_t a1, void *a2, int a3)
{
  id v5;
  BOOL v6;
  NSObject *v7;
  dispatch_time_t v8;
  NSObject *v9;
  void *v10;
  _QWORD v11[4];
  id v12[2];
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (v5)
  {
    if (*(_BYTE *)(a1 + 48))
      v6 = a3 == 0;
    else
      v6 = 1;
    if (!v6)
    {
      v7 = *MEMORY[0x1E0D18F30];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F30], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v14 = "-[CSAssetController fetchRemoteMetaOfType:allowRetry:]_block_invoke";
        v15 = 2050;
        v16 = 0x4072C00000000000;
        _os_log_impl(&dword_1C2614000, v7, OS_LOG_TYPE_DEFAULT, "%s Fetching remote meta data failed, scheduled retry after %{public}f seconds", buf, 0x16u);
      }
      objc_initWeak((id *)buf, *(id *)(a1 + 32));
      v8 = dispatch_time(0, 0x45D9648000);
      v9 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __54__CSAssetController_fetchRemoteMetaOfType_allowRetry___block_invoke_203;
      v11[3] = &unk_1E7C25940;
      objc_copyWeak(v12, (id *)buf);
      v12[1] = *(id *)(a1 + 40);
      dispatch_after(v8, v9, v11);
      objc_destroyWeak(v12);
      objc_destroyWeak((id *)buf);
    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_assetQueryForAssetType:", *(_QWORD *)(a1 + 40));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "_runAssetQuery:completion:", v10, 0);

  }
}

void __54__CSAssetController_fetchRemoteMetaOfType_allowRetry___block_invoke_203(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "fetchRemoteMetaOfType:allowRetry:", *(_QWORD *)(a1 + 40), 0);

}

void __47__CSAssetController__runAssetQuery_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  int v14;
  const char *v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (a2
    || (objc_msgSend(*(id *)(a1 + 32), "results"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "count"),
        v7,
        !v8))
  {
    v4 = *MEMORY[0x1E0D18F30];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F30], OS_LOG_TYPE_ERROR))
    {
      v14 = 136315394;
      v15 = "-[CSAssetController _runAssetQuery:completion:]_block_invoke";
      v16 = 2050;
      v17 = a2;
      _os_log_error_impl(&dword_1C2614000, v4, OS_LOG_TYPE_ERROR, "%s Error running asset query: error %{public}lu, or result is empty", (uint8_t *)&v14, 0x16u);
    }
    v5 = *(_QWORD *)(a1 + 40);
    if (v5)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18E80], 802, 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v5 + 16))(v5, 0, v6);
LABEL_11:

    }
  }
  else
  {
    v9 = (void *)*MEMORY[0x1E0D18F30];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F30], OS_LOG_TYPE_DEFAULT))
    {
      v10 = *(void **)(a1 + 32);
      v11 = v9;
      objc_msgSend(v10, "results");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 136315394;
      v15 = "-[CSAssetController _runAssetQuery:completion:]_block_invoke";
      v16 = 2050;
      v17 = objc_msgSend(v12, "count");
      _os_log_impl(&dword_1C2614000, v11, OS_LOG_TYPE_DEFAULT, "%s Found %{public}lu assets", (uint8_t *)&v14, 0x16u);

    }
    v13 = *(_QWORD *)(a1 + 40);
    if (v13)
    {
      objc_msgSend(*(id *)(a1 + 32), "results");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *, _QWORD))(v13 + 16))(v13, v6, 0);
      goto LABEL_11;
    }
  }
}

void __73__CSAssetController__installedAssetOfType_query_withLanguage_completion___block_invoke(uint64_t a1, unint64_t a2)
{
  NSObject *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  const char *v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  unint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  if ((a2 & 0xFFFFFFFFFFFFFFFDLL) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "results");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[CSAssetController filteredAssetsForAssets:assetType:language:](CSAssetController, "filteredAssetsForAssets:assetType:language:", v7, *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 40));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = (void *)*MEMORY[0x1E0D18F30];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F30], OS_LOG_TYPE_DEFAULT))
    {
      v9 = v8;
      v10 = objc_msgSend(v6, "count");
      v11 = *(_QWORD *)(a1 + 64);
      objc_msgSend(*(id *)(a1 + 32), "queryParams");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 136315906;
      v19 = "-[CSAssetController _installedAssetOfType:query:withLanguage:completion:]_block_invoke";
      v20 = 2050;
      v21 = v10;
      v22 = 2050;
      v23 = v11;
      v24 = 2114;
      v25 = (unint64_t)v12;
      _os_log_impl(&dword_1C2614000, v9, OS_LOG_TYPE_DEFAULT, "%s ::: found %{public}lu assets for assetType=%{public}lu, matching query: %{public}@", (uint8_t *)&v18, 0x2Au);

    }
    objc_msgSend(*(id *)(a1 + 48), "_findLatestInstalledAsset:", v6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = *(_QWORD *)(a1 + 56);
    if (v13)
    {
      if (v14)
        (*(void (**)(uint64_t, void *, _QWORD))(v14 + 16))(v14, v13, 0);
    }
    else if (v14)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18E80], 802, 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v14 + 16))(v14, 0, v15);

    }
    goto LABEL_14;
  }
  v4 = *MEMORY[0x1E0D18F30];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F30], OS_LOG_TYPE_ERROR))
  {
    v16 = *(_QWORD *)(a1 + 64);
    v17 = *(_QWORD *)(a1 + 32);
    v18 = 136315906;
    v19 = "-[CSAssetController _installedAssetOfType:query:withLanguage:completion:]_block_invoke";
    v20 = 2050;
    v21 = v16;
    v22 = 2114;
    v23 = v17;
    v24 = 2050;
    v25 = a2;
    _os_log_error_impl(&dword_1C2614000, v4, OS_LOG_TYPE_ERROR, "%s Error running asset-query for assetType:%{public}lu, query: %{public}@, error: %{public}lu", (uint8_t *)&v18, 0x2Au);
  }
  v5 = *(_QWORD *)(a1 + 56);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18E80], 803, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v5 + 16))(v5, 0, v6);
LABEL_14:

  }
}

void __66__CSAssetController_installedAssetOfType_withLanguage_completion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __66__CSAssetController_installedAssetOfType_withLanguage_completion___block_invoke_2;
  v7[3] = &unk_1E7C258A0;
  v4 = *(_QWORD *)(a1 + 56);
  v5 = *(id *)(a1 + 48);
  v6 = *(_QWORD *)(a1 + 56);
  v8 = v5;
  v9 = v6;
  objc_msgSend(v2, "_installedAssetOfType:withLanguage:completion:", v4, v3, v7);

}

void __66__CSAssetController_installedAssetOfType_withLanguage_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v3;
  uint64_t v5;
  id v6;
  id v7;

  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
  {
    v5 = *(_QWORD *)(a1 + 40);
    v6 = a3;
    objc_msgSend(a2, "getCSAssetOfType:", v5);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id, id))(v3 + 16))(v3, v7, v6);

  }
}

void __55__CSAssetController_installedAssetOfType_withLanguage___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_installedAssetOfType:withLanguage:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __74__CSAssetController_assetOfType_language_compatibilityVersion_completion___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  _QWORD v15[4];
  id v16;
  uint64_t v17;
  id v18;

  v2 = objc_alloc(MEMORY[0x1E0D4E050]);
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 56));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v2, "initWithType:", v5);

  if (*(_QWORD *)(a1 + 56) == 5)
  {
    v7 = *MEMORY[0x1E0D4DEE0];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu"), *(_QWORD *)(a1 + 64));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addKeyValuePair:with:", v7, v8);

  }
  else
  {
    v18 = v6;
    +[CSAssetController addKeyValuePairForQuery:assetType:](CSAssetController, "addKeyValuePairForQuery:assetType:", &v18);
    v9 = v18;

    v6 = v9;
  }
  v10 = *(void **)(a1 + 32);
  v11 = *(_QWORD *)(a1 + 40);
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __74__CSAssetController_assetOfType_language_compatibilityVersion_completion___block_invoke_2;
  v15[3] = &unk_1E7C258A0;
  v12 = *(_QWORD *)(a1 + 56);
  v13 = *(id *)(a1 + 48);
  v14 = *(_QWORD *)(a1 + 56);
  v16 = v13;
  v17 = v14;
  objc_msgSend(v10, "_installedAssetOfType:query:withLanguage:completion:", v12, v6, v11, v15);
  objc_msgSend(*(id *)(a1 + 32), "_fetchRemoteAssetOfType:withLanguage:query:completion:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40), v6, 0);

}

void __74__CSAssetController_assetOfType_language_compatibilityVersion_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v3;
  uint64_t v5;
  id v6;
  id v7;

  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
  {
    v5 = *(_QWORD *)(a1 + 40);
    v6 = a3;
    objc_msgSend(a2, "getCSAssetOfType:", v5);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id, id))(v3 + 16))(v3, v7, v6);

  }
}

uint64_t __53__CSAssetController_assetOfType_language_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchRemoteAssetOfType:withLanguage:completion:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40), 0);
}

void __55__CSAssetController_allInstalledAssetsOfType_language___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  if (objc_msgSend(v5, "state") == 2
    || objc_msgSend(v5, "state") == 3
    || objc_msgSend(v5, "state") == 5
    || objc_msgSend(v5, "state") == 6)
  {
    v3 = *(void **)(a1 + 32);
    objc_msgSend(v5, "getCSAssetOfType:", *(_QWORD *)(a1 + 40));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v4);

  }
}

uint64_t __55__CSAssetController_allInstalledAssetsOfType_language___block_invoke(uint64_t a1, void *a2)
{
  if (objc_msgSend(a2, "isLatestCompareTo:"))
    return -1;
  else
    return 1;
}

uint64_t __42__CSAssetController_assetOfType_language___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchRemoteAssetOfType:withLanguage:completion:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40), 0);
}

uint64_t __25__CSAssetController_init__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_cleanUpMobileAssetV1Directory");
}

+ (id)sharedController
{
  if (sharedController_onceToken_11161 != -1)
    dispatch_once(&sharedController_onceToken_11161, &__block_literal_global_11162);
  return (id)sharedController_sharedController_11163;
}

+ (id)getAssetTypeStringForType:(unint64_t)a3
{
  void *v3;

  v3 = 0;
  switch(a3)
  {
    case 0uLL:
      +[CSAssetController getVoiceTriggerAssetTypeString](CSAssetController, "getVoiceTriggerAssetTypeString");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      return v3;
    case 1uLL:
      +[CSAssetController getEndpointAssetTypeString](CSAssetController, "getEndpointAssetTypeString");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      return v3;
    case 2uLL:
      +[CSAssetController getLanguageDetectorAssetTypeString](CSAssetController, "getLanguageDetectorAssetTypeString");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      return v3;
    case 3uLL:
      +[CSAssetController getSpeakerRecognitionAssetTypeString](CSAssetController, "getSpeakerRecognitionAssetTypeString");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      return v3;
    case 4uLL:
      +[CSAssetController getAdBlockerAssetTypeString](CSAssetController, "getAdBlockerAssetTypeString");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      return v3;
    case 5uLL:
      return CFSTR("com.apple.MobileAsset.VoiceTriggerAssetsStudioDisplay");
    case 7uLL:
      return CFSTR("com.apple.MobileAsset.VoiceTriggerAssetsMac");
    default:
      return v3;
  }
}

void __37__CSAssetController_sharedController__block_invoke()
{
  CSAssetController *v0;
  void *v1;

  v0 = objc_alloc_init(CSAssetController);
  v1 = (void *)sharedController_sharedController_11163;
  sharedController_sharedController_11163 = (uint64_t)v0;

}

+ (id)filteredAssetsForFetchRemoteMetaDataForAssets:(id)a3 assetType:(unint64_t)a4
{
  return +[CSAssetController filteredAssetsForAssets:assetType:language:](CSAssetController, "filteredAssetsForAssets:assetType:language:", a3, a4, *MEMORY[0x1E0D192D0]);
}

+ (id)filteredAssetsForAssets:(id)a3 assetType:(unint64_t)a4 language:(id)a5
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  id v23;
  void *v24;
  void *v25;
  uint64_t v27;
  uint64_t v28;
  id v29;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a5;
  v30 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v32;
    v13 = *MEMORY[0x1E0D192C0];
    v28 = *MEMORY[0x1E0D192B8];
    v27 = *MEMORY[0x1E0D192C8];
    v29 = v8;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v32 != v12)
          objc_enumerationMutation(v9);
        v15 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
        objc_msgSend(v15, "attributes", v27);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "valueForKey:", v13);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = v17;
        if (!v8 || objc_msgSend(v17, "containsObject:", v8))
        {
          if (a4 <= 7
            && ((1 << a4) & 0xA1) != 0
            && (objc_msgSend(MEMORY[0x1E0D19260], "supportPremiumAssets") & 1) == 0)
          {
            v19 = v11;
            v20 = v13;
            v21 = a4;
            v22 = v12;
            v23 = v9;
            objc_msgSend(v16, "objectForKey:", v28);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v25 = v24;
            if (!v24 || (objc_msgSend(v24, "isEqualToString:", v27) & 1) == 0)
              objc_msgSend(v30, "addObject:", v15);

            v9 = v23;
            v12 = v22;
            a4 = v21;
            v13 = v20;
            v11 = v19;
            v8 = v29;
          }
          else
          {
            objc_msgSend(v30, "addObject:", v15);
          }
        }

      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    }
    while (v11);
  }

  return v30;
}

+ (void)addKeyValuePairForQuery:(id *)a3 assetType:(unint64_t)a4
{
  id v5;
  unint64_t v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  unint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = *a3;
  v6 = 15;
  switch(a4)
  {
    case 0uLL:
      v6 = +[CSAssetController getVoiceTriggerAssetCurrentCompatibilityVersion](CSAssetController, "getVoiceTriggerAssetCurrentCompatibilityVersion");
      break;
    case 1uLL:
      v6 = +[CSAssetController getEndpointAssetCurrentCompatibilityVersion](CSAssetController, "getEndpointAssetCurrentCompatibilityVersion");
      break;
    case 2uLL:
      v6 = +[CSAssetController getLanguageDetectorCurrentCompatibilityVersion](CSAssetController, "getLanguageDetectorCurrentCompatibilityVersion");
      break;
    case 3uLL:
      v6 = +[CSAssetController getSpeakerRecognitionCurrentCompatibilityVersion](CSAssetController, "getSpeakerRecognitionCurrentCompatibilityVersion");
      break;
    case 4uLL:
      v6 = +[CSAssetController getAdBlockerCurrentCompatibilityVersion](CSAssetController, "getAdBlockerCurrentCompatibilityVersion");
      break;
    case 5uLL:
      v6 = 14;
      break;
    case 7uLL:
      break;
    default:
      v7 = *MEMORY[0x1E0D18F30];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F30], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v11 = "+[CSAssetController(Utils) addKeyValuePairForQuery:assetType:]";
        v12 = 2050;
        v13 = a4;
        _os_log_impl(&dword_1C2614000, v7, OS_LOG_TYPE_DEFAULT, "%s ERR: Unknown AssetType: %{public}lu", buf, 0x16u);
      }
      v6 = 0;
      break;
  }
  v8 = *MEMORY[0x1E0D4DEE0];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu"), v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addKeyValuePair:with:", v8, v9);

}

+ (id)getVoiceTriggerAssetTypeString
{
  return (id)objc_msgSend(MEMORY[0x1E0D19168], "getVoiceTriggerAssetTypeString");
}

+ (unint64_t)getVoiceTriggerAssetCurrentCompatibilityVersion
{
  return objc_msgSend(MEMORY[0x1E0D19168], "getVoiceTriggerCurrentCompatibilityVersion");
}

+ (id)getEndpointAssetTypeString
{
  if ((CSIsWatch() & 1) != 0)
    return CFSTR("com.apple.MobileAsset.SpeechEndpointAssetsWatch");
  if ((CSIsTV() & 1) != 0)
    return CFSTR("com.apple.MobileAsset.SpeechEndpointAssetsTV");
  if ((CSIsHorseman() & 1) != 0)
    return CFSTR("com.apple.MobileAsset.SpeechEndpointMarshAssets");
  if (CSIsOSX())
    return CFSTR("com.apple.MobileAsset.SpeechEndpointMacOSAssets");
  return CFSTR("com.apple.MobileAsset.SpeechEndpointAssets");
}

+ (unint64_t)getEndpointAssetCurrentCompatibilityVersion
{
  if ((CSIsWatch() & 1) != 0)
    return 3;
  if ((CSIsTV() & 1) != 0)
    return 5;
  if ((CSIsHorseman() & 1) != 0)
    return 2;
  if (CSIsOSX())
    return 6;
  return 3;
}

+ (id)getLanguageDetectorAssetTypeString
{
  return CFSTR("com.apple.MobileAsset.LanguageDetectorAssets");
}

+ (unint64_t)getLanguageDetectorCurrentCompatibilityVersion
{
  return 4;
}

+ (id)getAdBlockerAssetTypeString
{
  return CFSTR("com.apple.MobileAsset.AdBlockerAssets");
}

+ (unint64_t)getAdBlockerCurrentCompatibilityVersion
{
  return 1;
}

+ (id)getSpeakerRecognitionAssetTypeString
{
  if (CSIsASMacWithAOP())
    return CFSTR("com.apple.MobileAsset.SpeakerRecognitionASMacAssets");
  else
    return CFSTR("com.apple.MobileAsset.SpeakerRecognitionAssets");
}

+ (unint64_t)getSpeakerRecognitionCurrentCompatibilityVersion
{
  return 1;
}

@end
