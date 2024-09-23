@implementation SFEntitledAssetManager

- (SFEntitledAssetManager)init
{
  return -[SFEntitledAssetManager initWithAssetSetDict:cleanupDuration:](self, "initWithAssetSetDict:cleanupDuration:", 0, 0);
}

- (SFEntitledAssetManager)initWithAssetSetDict:(id)a3 cleanupDuration:(unint64_t)a4
{
  id v6;
  SFEntitledAssetManager *v7;
  dispatch_queue_t v8;
  OS_dispatch_queue *queue;
  dispatch_queue_t v10;
  OS_dispatch_queue *subscriptionQueue;
  unint64_t v12;
  NSMutableDictionary *v13;
  NSMutableDictionary *assetSetDict;
  uint64_t v15;
  NSMutableDictionary *observers;
  uint64_t v17;
  NSMutableDictionary *delegates;
  NSObject *v19;
  _QWORD block[4];
  SFEntitledAssetManager *v22;
  objc_super v23;

  v6 = a3;
  v23.receiver = self;
  v23.super_class = (Class)SFEntitledAssetManager;
  v7 = -[SFEntitledAssetManager init](&v23, sel_init);
  if (v7)
  {
    v8 = dispatch_queue_create("SFEntitledAssetManager Queue", 0);
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v8;

    v10 = dispatch_queue_create("SFEntitledAssetManager Subscription Queue", 0);
    subscriptionQueue = v7->_subscriptionQueue;
    v7->_subscriptionQueue = (OS_dispatch_queue *)v10;

    v12 = 18000;
    if (a4)
      v12 = a4;
    v7->_cleanupDuration = v12;
    if (v6)
    {
      v13 = (NSMutableDictionary *)v6;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v13 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    }
    assetSetDict = v7->_assetSetDict;
    v7->_assetSetDict = v13;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v15 = objc_claimAutoreleasedReturnValue();
    observers = v7->_observers;
    v7->_observers = (NSMutableDictionary *)v15;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v17 = objc_claimAutoreleasedReturnValue();
    delegates = v7->_delegates;
    v7->_delegates = (NSMutableDictionary *)v17;

    v19 = v7->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __63__SFEntitledAssetManager_initWithAssetSetDict_cleanupDuration___block_invoke;
    block[3] = &unk_1E6486328;
    v22 = v7;
    dispatch_sync(v19, block);

  }
  return v7;
}

- (void)dealloc
{
  NSObject *queue;
  objc_super v4;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __33__SFEntitledAssetManager_dealloc__block_invoke;
  block[3] = &unk_1E6486328;
  block[4] = self;
  dispatch_sync(queue, block);
  v4.receiver = self;
  v4.super_class = (Class)SFEntitledAssetManager;
  -[SFEntitledAssetManager dealloc](&v4, sel_dealloc);
}

- (id)assetSetDict
{
  return self->_assetSetDict;
}

- (void)wait
{
  dispatch_sync((dispatch_queue_t)self->_queue, &__block_literal_global_281);
  dispatch_sync((dispatch_queue_t)self->_subscriptionQueue, &__block_literal_global_282);
}

- (void)releaseAssetSets
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__SFEntitledAssetManager_releaseAssetSets__block_invoke;
  block[3] = &unk_1E6486328;
  block[4] = self;
  dispatch_sync(queue, block);
}

- (void)releaseAssetSetsWithAssetType:(unint64_t)a3
{
  NSObject *queue;
  _QWORD v4[6];

  queue = self->_queue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __56__SFEntitledAssetManager_releaseAssetSetsWithAssetType___block_invoke;
  v4[3] = &unk_1E6485C68;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(queue, v4);
}

- (void)registerAssetDelegate:(id)a3 assetType:(unint64_t)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  NSObject *queue;
  id v14;
  void (**v15)(_QWORD);
  NSObject *v16;
  _QWORD v17[5];
  _QWORD block[5];
  id v19;
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24[2];
  id location;
  _QWORD aBlock[4];
  id v27;
  uint8_t buf[4];
  const char *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = SFLogFramework;
  if (os_log_type_enabled((os_log_t)SFLogFramework, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v29 = "-[SFEntitledAssetManager registerAssetDelegate:assetType:]";
    _os_log_impl(&dword_1B2494000, v7, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  +[SFEntitledAssetManager assetSetNameForAssetType:](SFEntitledAssetManager, "assetSetNameForAssetType:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "length"))
  {
    objc_initWeak((id *)buf, v6);
    v9 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __58__SFEntitledAssetManager_registerAssetDelegate_assetType___block_invoke;
    aBlock[3] = &unk_1E6485C90;
    objc_copyWeak(&v27, (id *)buf);
    v10 = _Block_copy(aBlock);
    objc_initWeak(&location, self);
    v22[0] = v9;
    v22[1] = 3221225472;
    v22[2] = __58__SFEntitledAssetManager_registerAssetDelegate_assetType___block_invoke_2;
    v22[3] = &unk_1E6485D08;
    objc_copyWeak(v24, &location);
    v11 = v8;
    v23 = v11;
    v24[1] = (id)a4;
    v12 = _Block_copy(v22);
    queue = self->_queue;
    block[0] = v9;
    block[1] = 3221225472;
    block[2] = __58__SFEntitledAssetManager_registerAssetDelegate_assetType___block_invoke_329;
    block[3] = &unk_1E6485D30;
    block[4] = self;
    v19 = v11;
    v14 = v10;
    v20 = v14;
    v15 = v12;
    v21 = v15;
    dispatch_sync(queue, block);
    v15[2](v15);
    v16 = self->_queue;
    v17[0] = v9;
    v17[1] = 3221225472;
    v17[2] = __58__SFEntitledAssetManager_registerAssetDelegate_assetType___block_invoke_330;
    v17[3] = &unk_1E6486328;
    v17[4] = self;
    dispatch_sync(v16, v17);

    objc_destroyWeak(v24);
    objc_destroyWeak(&location);

    objc_destroyWeak(&v27);
    objc_destroyWeak((id *)buf);
  }

}

- (void)refreshAssetSetWithConfig:(id)a3 regionId:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *queue;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  __CFString *v14;
  __CFString *v15;
  void *v16;
  _QWORD block[5];
  id v18;
  id v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  __CFString *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  +[SFEntitledAssetManager assetSetUsageForConfig:regionId:](SFEntitledAssetManager, "assetSetUsageForConfig:regionId:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    +[SFEntitledAssetManager assetSetNameForAssetType:](SFEntitledAssetManager, "assetSetNameForAssetType:", objc_msgSend(v6, "assetType"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __61__SFEntitledAssetManager_refreshAssetSetWithConfig_regionId___block_invoke;
    block[3] = &unk_1E6485CE0;
    block[4] = self;
    v18 = v9;
    v19 = v8;
    v11 = v9;
    dispatch_sync(queue, block);

  }
  else
  {
    v12 = (void *)SFLogFramework;
    if (!os_log_type_enabled((os_log_t)SFLogFramework, OS_LOG_TYPE_ERROR))
      goto LABEL_5;
    v11 = v12;
    v13 = objc_msgSend(v6, "assetType");
    if ((unint64_t)(v13 - 1) > 6)
      v14 = CFSTR("Unknown");
    else
      v14 = off_1E6485350[v13 - 1];
    v15 = v14;
    objc_msgSend(v6, "language");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315906;
    v21 = "-[SFEntitledAssetManager refreshAssetSetWithConfig:regionId:]";
    v22 = 2112;
    v23 = v15;
    v24 = 2112;
    v25 = v16;
    v26 = 2112;
    v27 = v7;
    _os_log_error_impl(&dword_1B2494000, v11, OS_LOG_TYPE_ERROR, "%s No valid usage resolved from asset type: %@, language: %@, regionId: %@", buf, 0x2Au);

  }
LABEL_5:

}

- (void)_refreshAssetSetsWithName:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  SFEntitledAssetManager *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v14 = self;
  -[NSMutableDictionary objectForKey:](self->_assetSetDict, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v10);
        objc_msgSend(MEMORY[0x1E0DC5DE0], "sharedManager");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "retrieveAssetSet:usages:", v4, v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v5, "setObject:forKey:", v13, v11);
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

  -[NSMutableDictionary setObject:forKey:](v14->_assetSetDict, "setObject:forKey:", v5, v4);
}

- (void)switchToNewAssetsForAssetType:(unint64_t)a3
{
  NSObject *queue;
  _QWORD v4[6];

  queue = self->_queue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __56__SFEntitledAssetManager_switchToNewAssetsForAssetType___block_invoke;
  v4[3] = &unk_1E6485C68;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(queue, v4);
}

- (id)assetStatusForConfig:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  NSObject *queue;
  _QWORD block[5];
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v4 = a3;
  +[SFEntitledAssetManager _overridePathForConfig:](SFEntitledAssetManager, "_overridePathForConfig:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5
    && (+[SFEntitledAssetManager _overrideStatusForConfig:](SFEntitledAssetManager, "_overrideStatusForConfig:", v4), (v6 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v7 = (void *)v6;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ ModelInfo=%@: AssetId=OVERRIDE:"), v6, v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v14 = 0;
    v15 = &v14;
    v16 = 0x3032000000;
    v17 = __Block_byref_object_copy__1549;
    v18 = __Block_byref_object_dispose__1550;
    v19 = 0;
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __47__SFEntitledAssetManager_assetStatusForConfig___block_invoke;
    block[3] = &unk_1E6485DF8;
    v13 = &v14;
    block[4] = self;
    v12 = v4;
    dispatch_sync(queue, block);
    if (v15[5])
    {
      +[SFEntitledAssetManager statusForAsset:](SFEntitledAssetManager, "statusForAsset:");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = 0;
    }

    _Block_object_dispose(&v14, 8);
  }

  return v8;
}

- (id)modelQualityTypeStatusStringWithConfig:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  __CFString *v7;
  NSObject *queue;
  void *v9;
  int v10;
  __CFString *v11;
  _QWORD block[5];
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v4 = a3;
  +[SFEntitledAssetManager _overrideModelQualityForConfig:](SFEntitledAssetManager, "_overrideModelQualityForConfig:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    v16 = 0;
    v17 = &v16;
    v18 = 0x3032000000;
    v19 = __Block_byref_object_copy__1549;
    v20 = __Block_byref_object_dispose__1550;
    v21 = 0;
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __65__SFEntitledAssetManager_modelQualityTypeStatusStringWithConfig___block_invoke;
    block[3] = &unk_1E6485DF8;
    v15 = &v16;
    block[4] = self;
    v14 = v4;
    dispatch_sync(queue, block);
    v9 = (void *)v17[5];
    if (v9)
    {
      v10 = objc_msgSend(v9, "_preferOverServer");
      v11 = CFSTR("LQ");
      if (v10)
        v11 = CFSTR("HQ");
      v7 = v11;
    }
    else
    {
      v7 = 0;
    }

    _Block_object_dispose(&v16, 8);
  }

  return v7;
}

- (id)installedLanguagesForAssetType:(unint64_t)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  _BOOL4 v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  SFEntitledAssetConfig *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v24;
  unint64_t v25;
  id obj;
  void *v27;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  void *v33;
  uint64_t v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  +[SFEntitledAssetManager assetNameForAssetType:](SFEntitledAssetManager, "assetNameForAssetType:");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  +[SFEntitledAssetManager assetSetNameForAssetType:](SFEntitledAssetManager, "assetSetNameForAssetType:", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  +[SFEntitledAssetManager assetUsageTypeForAssetType:](SFEntitledAssetManager, "assetUsageTypeForAssetType:", a3);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  +[SFEntitledAssetManager assetSetUsagesForAssetType:](SFEntitledAssetManager, "assetSetUsagesForAssetType:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC5DE0], "sharedManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (void *)v4;
  objc_msgSend(v6, "retrieveAssetSet:usages:", v4, MEMORY[0x1E0C9AA70]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = a3;
  v8 = +[SFEntitledAssetManager isOverrideSupportedForAssetType:](SFEntitledAssetManager, "isOverrideSupportedForAssetType:", a3);
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  obj = v5;
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v30 != v12)
          objc_enumerationMutation(obj);
        v14 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * i);
        +[SFUtilities stringByReplacingUnderscoresWithHyphens:](SFUtilities, "stringByReplacingUnderscoresWithHyphens:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (v8)
        {
          v16 = -[SFEntitledAssetConfig initWithLanguage:assetType:]([SFEntitledAssetConfig alloc], "initWithLanguage:assetType:", v15, v25);
          +[SFEntitledAssetManager _overridePathForConfig:](SFEntitledAssetManager, "_overridePathForConfig:", v16);
          v17 = objc_claimAutoreleasedReturnValue();
          if (v17)
          {
            v18 = (void *)v17;
            objc_msgSend(v9, "addObject:", v15);

            goto LABEL_12;
          }

        }
        v33 = v27;
        v34 = v14;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v34, &v33, 1);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "assetNamed:withUsage:", v28, v19);
        v16 = (SFEntitledAssetConfig *)objc_claimAutoreleasedReturnValue();

        -[SFEntitledAssetConfig location](v16, "location");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "path");
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        if (v21)
          objc_msgSend(v9, "addObject:", v15);
LABEL_12:

      }
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
    }
    while (v11);
  }

  v22 = (void *)objc_msgSend(v9, "copy");
  return v22;
}

- (id)installationStatusForLanguagesWithAssetType:(unint64_t)a3
{
  return -[SFEntitledAssetManager _installationStatusForLanguagesWithAssetType:includeDetailedStatus:subscriberId:](self, "_installationStatusForLanguagesWithAssetType:includeDetailedStatus:subscriberId:", a3, 0, 0);
}

- (id)detailedInstallationStatusForLanguagesWithAssetType:(unint64_t)a3 subscriberId:(id)a4
{
  return -[SFEntitledAssetManager _installationStatusForLanguagesWithAssetType:includeDetailedStatus:subscriberId:](self, "_installationStatusForLanguagesWithAssetType:includeDetailedStatus:subscriberId:", a3, 1, a4);
}

- (id)_installationStatusForLanguagesWithAssetType:(unint64_t)a3 includeDetailedStatus:(BOOL)a4 subscriberId:(id)a5
{
  _BOOL4 v5;
  void *v7;
  void *v8;
  void *v9;
  _BOOL4 v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  SFEntitledAssetConfig *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  __CFString *v25;
  __CFString *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  uint64_t v35;
  void *v36;
  id v37;
  _BOOL4 v38;
  void *v39;
  void *v40;
  unint64_t v41;
  void *v42;
  id obj;
  id v44;
  uint64_t v45;
  uint64_t v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  const __CFString *v51;
  __CFString *v52;
  void *v53;
  uint64_t v54;
  _BYTE v55[128];
  uint64_t v56;

  v5 = a4;
  v56 = *MEMORY[0x1E0C80C00];
  v37 = a5;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v44 = (id)objc_claimAutoreleasedReturnValue();
  +[SFEntitledAssetManager assetNameForAssetType:](SFEntitledAssetManager, "assetNameForAssetType:", a3);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  +[SFEntitledAssetManager assetSetNameForAssetType:](SFEntitledAssetManager, "assetSetNameForAssetType:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[SFEntitledAssetManager assetUsageTypeForAssetType:](SFEntitledAssetManager, "assetUsageTypeForAssetType:", a3);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  +[SFEntitledAssetManager assetSetUsagesForAssetType:](SFEntitledAssetManager, "assetSetUsagesForAssetType:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC5DE0], "sharedManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "retrieveAssetSet:usages:", v7, MEMORY[0x1E0C9AA70]);
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  obj = v8;
  v46 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v55, 16);
  if (v46)
  {
    if (v37)
      v10 = v5;
    else
      v10 = 0;
    v38 = v10;
    v45 = *(_QWORD *)v48;
    v11 = 0x1E0CB3000uLL;
    v41 = a3;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v48 != v45)
          objc_enumerationMutation(obj);
        v13 = *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * v12);
        v14 = (void *)MEMORY[0x1B5E25BAC]();
        +[SFUtilities stringByReplacingUnderscoresWithHyphens:](SFUtilities, "stringByReplacingUnderscoresWithHyphens:", v13);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = -[SFEntitledAssetConfig initWithLanguage:assetType:]([SFEntitledAssetConfig alloc], "initWithLanguage:assetType:", v15, a3);
        +[SFEntitledAssetManager _overridePathForConfig:](SFEntitledAssetManager, "_overridePathForConfig:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (v17)
        {
          +[SFEntitledAssetManager _overrideStatusForConfig:](SFEntitledAssetManager, "_overrideStatusForConfig:", v16);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = v18;
          if (v18)
          {
            v20 = v18;
          }
          else
          {
            objc_msgSend(*(id *)(v11 + 2368), "stringWithFormat:", CFSTR("%@:"), CFSTR("Version"));
            v20 = (id)objc_claimAutoreleasedReturnValue();
          }
          v22 = v20;

          objc_msgSend(*(id *)(v11 + 2368), "stringWithFormat:", CFSTR("%@ ModelInfo=%@: AssetId=OVERRIDE:"), v22, v17);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_22:
          objc_msgSend(v44, "setObject:forKey:", v29, v15);

          goto LABEL_23;
        }
        v53 = v40;
        v54 = v13;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v54, &v53, 1);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "assetNamed:withUsage:", v42, v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v22)
        {
          +[SFEntitledAssetManager onDeviceDictationLocales](SFEntitledAssetManager, "onDeviceDictationLocales");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = objc_msgSend(v23, "containsObject:", v13);
          v25 = CFSTR("0");
          if (v24)
            v25 = CFSTR("1");
          v26 = v25;

          v27 = objc_alloc(MEMORY[0x1E0DC5DD8]);
          v51 = CFSTR("PreferOverServer");
          v52 = v26;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v52, &v51, 1);
          v28 = (void *)objc_claimAutoreleasedReturnValue();

          v22 = (void *)objc_msgSend(v27, "initWithName:location:metadata:", v42, 0, v28);
        }
        if (objc_msgSend(v22, "_assetMetadataAvailable"))
        {
          +[SFEntitledAssetManager statusForAsset:](SFEntitledAssetManager, "statusForAsset:", v22);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          a3 = v41;
          if ((v38 & (SFEntitledAssetStatusIsInstalled(v29) ^ 1)) == 1
            && +[SFEntitledAssetManager isSubscribedToAssetWithConfig:regionId:subscriberId:](SFEntitledAssetManager, "isSubscribedToAssetWithConfig:regionId:subscriberId:", v16, 0, v37))
          {
            +[SFEntitledAssetManager subscriptionNameForConfig:regionId:](SFEntitledAssetManager, "subscriptionNameForConfig:regionId:", v16, 0);
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0DC5DE0], "sharedManager");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            v31 = objc_msgSend(v30, "downloadStatusForSubscriber:subscriptionName:", v37, v36);

            +[SFEntitledAssetManager installationStateForDownloadStatus:](SFEntitledAssetManager, "installationStateForDownloadStatus:", v31);
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "stringByReplacingOccurrencesOfString:withString:", CFSTR("Not Installing"), v32);
            v35 = objc_claimAutoreleasedReturnValue();

            a3 = v41;
            v29 = (void *)v35;
          }
          goto LABEL_22;
        }
        a3 = v41;
LABEL_23:

        objc_autoreleasePoolPop(v14);
        ++v12;
        v11 = 0x1E0CB3000;
      }
      while (v46 != v12);
      v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v55, 16);
      v46 = v33;
    }
    while (v33);
  }

  return v44;
}

- (void)downloadStatusWithConfig:(id)a3 regionId:(id)a4 subscriberId:(id)a5 progressHandler:(id)a6 completionHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void (**v16)(id, _QWORD, uint64_t);
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  __CFString *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  NSObject *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  void *v34;
  __CFString *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  NSObject *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  _QWORD v48[5];
  id v49;
  id v50;
  id v51;
  void (**v52)(id, _QWORD, uint64_t);
  uint64_t *v53;
  uint64_t *v54;
  uint64_t *v55;
  _QWORD v56[4];
  id v57;
  uint64_t v58;
  uint64_t *v59;
  uint64_t v60;
  uint64_t (*v61)(uint64_t, uint64_t);
  void (*v62)(uint64_t);
  id v63;
  uint64_t v64;
  uint64_t *v65;
  uint64_t v66;
  uint64_t (*v67)(uint64_t, uint64_t);
  void (*v68)(uint64_t);
  id v69;
  uint64_t v70;
  uint64_t *v71;
  uint64_t v72;
  uint64_t (*v73)(uint64_t, uint64_t);
  void (*v74)(uint64_t);
  id v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint8_t buf[4];
  const char *v81;
  __int16 v82;
  uint64_t v83;
  uint64_t v84;

  v84 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = (void (**)(id, _QWORD, uint64_t))a7;
  v70 = 0;
  v71 = &v70;
  v72 = 0x3032000000;
  v73 = __Block_byref_object_copy__1549;
  v74 = __Block_byref_object_dispose__1550;
  -[SFEntitledAssetManager installedAssetWithConfig:regionId:](self, "installedAssetWithConfig:regionId:", v12, v13);
  v75 = (id)objc_claimAutoreleasedReturnValue();
  if (!v71[5])
  {
    v64 = 0;
    v65 = &v64;
    v66 = 0x3032000000;
    v67 = __Block_byref_object_copy__1549;
    v68 = __Block_byref_object_dispose__1550;
    v69 = 0;
    v58 = 0;
    v59 = &v58;
    v60 = 0x3032000000;
    v61 = __Block_byref_object_copy__1549;
    v62 = __Block_byref_object_dispose__1550;
    v63 = 0;
    +[SFEntitledAssetManager subscriptionNameForConfig:regionId:](SFEntitledAssetManager, "subscriptionNameForConfig:regionId:", v12, v13);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v47, "length"))
    {
      v19 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("No valid subscription name resolved from asset type: %@, language: %@, regionId: %@"), &stru_1E6486C88, CFSTR("Localizable"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v12, "assetType");
      if ((unint64_t)(v22 - 1) > 6)
        v23 = CFSTR("Unknown");
      else
        v23 = off_1E6485350[v22 - 1];
      v35 = v23;
      objc_msgSend(v12, "language");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "localizedStringWithFormat:", v21, v35, v36, v13);
      v37 = objc_claimAutoreleasedReturnValue();
      v38 = (void *)v65[5];
      v65[5] = v37;

      v39 = SFLogFramework;
      if (os_log_type_enabled((os_log_t)SFLogFramework, OS_LOG_TYPE_ERROR))
      {
        v45 = v65[5];
        *(_DWORD *)buf = 136315394;
        v81 = "-[SFEntitledAssetManager downloadStatusWithConfig:regionId:subscriberId:progressHandler:completionHandler:]";
        v82 = 2112;
        v83 = v45;
        _os_log_error_impl(&dword_1B2494000, v39, OS_LOG_TYPE_ERROR, "%s %@", buf, 0x16u);
        if (!v16)
          goto LABEL_16;
      }
      else if (!v16)
      {
        goto LABEL_16;
      }
      v40 = (void *)MEMORY[0x1E0CB35C8];
      v41 = v65[5];
      v78 = *MEMORY[0x1E0CB2D50];
      v79 = v41;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v79, &v78, 1);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "errorWithDomain:code:userInfo:", CFSTR("SFSpeechErrorDomain"), 1, v42);
      v43 = objc_claimAutoreleasedReturnValue();
      v44 = (void *)v59[5];
      v59[5] = v43;

      v16[2](v16, 0, v59[5]);
      goto LABEL_16;
    }
    if (+[SFEntitledAssetManager isSubscribedToAssetWithConfig:regionId:subscriberId:](SFEntitledAssetManager, "isSubscribedToAssetWithConfig:regionId:subscriberId:", v12, v13, v14))
    {
      objc_msgSend(MEMORY[0x1E0DC5DE0], "sharedManager");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = MEMORY[0x1E0C809B0];
      v56[0] = MEMORY[0x1E0C809B0];
      v56[1] = 3221225472;
      v56[2] = __107__SFEntitledAssetManager_downloadStatusWithConfig_regionId_subscriberId_progressHandler_completionHandler___block_invoke;
      v56[3] = &unk_1E6485D58;
      v57 = v15;
      v48[0] = v18;
      v48[1] = 3221225472;
      v48[2] = __107__SFEntitledAssetManager_downloadStatusWithConfig_regionId_subscriberId_progressHandler_completionHandler___block_invoke_2;
      v48[3] = &unk_1E6485D80;
      v52 = v16;
      v48[4] = self;
      v49 = v12;
      v50 = v13;
      v53 = &v70;
      v54 = &v64;
      v51 = v47;
      v55 = &v58;
      objc_msgSend(v17, "updateAssetsForSubscriber:subscriptionName:policies:queue:progress:completion:", v14, v51, 0, 0, v56, v48);

LABEL_16:
      _Block_object_dispose(&v58, 8);

      _Block_object_dispose(&v64, 8);
      goto LABEL_17;
    }
    v24 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "localizedStringForKey:value:table:", CFSTR("Cannot check the download status, %@ is not subscribed to %@"), &stru_1E6486C88, CFSTR("Localizable"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "localizedStringWithFormat:", v26, v14, v47);
    v27 = objc_claimAutoreleasedReturnValue();
    v28 = (void *)v65[5];
    v65[5] = v27;

    v29 = SFLogFramework;
    if (os_log_type_enabled((os_log_t)SFLogFramework, OS_LOG_TYPE_ERROR))
    {
      v46 = v65[5];
      *(_DWORD *)buf = 136315394;
      v81 = "-[SFEntitledAssetManager downloadStatusWithConfig:regionId:subscriberId:progressHandler:completionHandler:]";
      v82 = 2112;
      v83 = v46;
      _os_log_error_impl(&dword_1B2494000, v29, OS_LOG_TYPE_ERROR, "%s %@", buf, 0x16u);
      if (!v16)
        goto LABEL_16;
    }
    else if (!v16)
    {
      goto LABEL_16;
    }
    v30 = (void *)MEMORY[0x1E0CB35C8];
    v31 = v65[5];
    v76 = *MEMORY[0x1E0CB2D50];
    v77 = v31;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v77, &v76, 1);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "errorWithDomain:code:userInfo:", CFSTR("SFSpeechErrorDomain"), 1, v32);
    v33 = objc_claimAutoreleasedReturnValue();
    v34 = (void *)v59[5];
    v59[5] = v33;

    v16[2](v16, 0, v59[5]);
    goto LABEL_16;
  }
  if (v16)
    ((void (*)(void (**)(id, _QWORD, uint64_t)))v16[2])(v16);
LABEL_17:
  _Block_object_dispose(&v70, 8);

}

- (id)installedAssetWithConfig:(id)a3
{
  return -[SFEntitledAssetManager installedAssetWithConfig:regionId:](self, "installedAssetWithConfig:regionId:", a3, 0);
}

- (id)installedAssetWithConfig:(id)a3 regionId:(id)a4
{
  return -[SFEntitledAssetManager installedAssetWithConfig:regionId:shouldSubscribe:subscriberId:expiration:](self, "installedAssetWithConfig:regionId:shouldSubscribe:subscriberId:expiration:", a3, 0, 0, 0, 0);
}

- (id)_installedAssetWithConfig:(id)a3 regionId:(id)a4 shouldSubscribe:(BOOL)a5 subscriberId:(id)a6 expiration:(id)a7
{
  _BOOL4 v9;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  __CFString *v20;
  void *v21;
  uint64_t v22;
  NSObject *subscriptionQueue;
  uint64_t v24;
  NSObject *queue;
  void *v26;
  NSObject *v27;
  uint64_t v28;
  id v29;
  __CFString *v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  NSObject *v33;
  _QWORD v34[5];
  id v35;
  id v36;
  _BYTE *v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t (*v42)(uint64_t, uint64_t);
  void (*v43)(uint64_t);
  id v44;
  _QWORD block[4];
  id v46;
  id v47;
  id v48;
  id v49;
  uint8_t buf[4];
  const char *v51;
  __int16 v52;
  uint64_t v53;
  __int16 v54;
  void *v55;
  _BYTE v56[24];
  uint64_t (*v57)(uint64_t, uint64_t);
  __int128 v58;
  uint64_t v59;

  v9 = a5;
  v59 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a6;
  v15 = a7;
  +[SFEntitledAssetManager _overridePathForConfig:](SFEntitledAssetManager, "_overridePathForConfig:", v12);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    v17 = (void *)SFLogFramework;
    if (os_log_type_enabled((os_log_t)SFLogFramework, OS_LOG_TYPE_INFO))
    {
      v18 = v17;
      v19 = objc_msgSend(v12, "assetType");
      if ((unint64_t)(v19 - 1) > 6)
        v20 = CFSTR("Unknown");
      else
        v20 = off_1E6485350[v19 - 1];
      v30 = v20;
      objc_msgSend(v12, "language");
      v31 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v56 = 136315906;
      *(_QWORD *)&v56[4] = "-[SFEntitledAssetManager _installedAssetWithConfig:regionId:shouldSubscribe:subscriberId:expiration:]";
      *(_WORD *)&v56[12] = 2112;
      *(_QWORD *)&v56[14] = v30;
      *(_WORD *)&v56[22] = 2112;
      v57 = v31;
      LOWORD(v58) = 2112;
      *(_QWORD *)((char *)&v58 + 2) = v16;
      _os_log_impl(&dword_1B2494000, v18, OS_LOG_TYPE_INFO, "%s Using override path for asset type: %@, language: %@, at path: %@", v56, 0x2Au);

    }
    v29 = v16;
  }
  else
  {
    objc_msgSend(v12, "language");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21)
    {
      v22 = MEMORY[0x1E0C809B0];
      if (v14 && v9)
      {
        subscriptionQueue = self->_subscriptionQueue;
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __101__SFEntitledAssetManager__installedAssetWithConfig_regionId_shouldSubscribe_subscriberId_expiration___block_invoke;
        block[3] = &unk_1E6485DA8;
        v24 = MEMORY[0x1E0C809B0];
        v46 = v12;
        v47 = v13;
        v48 = v14;
        v49 = v15;
        dispatch_async(subscriptionQueue, block);

        v22 = v24;
      }
      *(_QWORD *)v56 = 0;
      *(_QWORD *)&v56[8] = v56;
      *(_QWORD *)&v56[16] = 0x3032000000;
      v57 = __Block_byref_object_copy__1549;
      *(_QWORD *)&v58 = __Block_byref_object_dispose__1550;
      *((_QWORD *)&v58 + 1) = 0;
      v39 = 0;
      v40 = &v39;
      v41 = 0x3032000000;
      v42 = __Block_byref_object_copy__1549;
      v43 = __Block_byref_object_dispose__1550;
      v44 = 0;
      queue = self->_queue;
      v34[0] = v22;
      v34[1] = 3221225472;
      v34[2] = __101__SFEntitledAssetManager__installedAssetWithConfig_regionId_shouldSubscribe_subscriberId_expiration___block_invoke_2;
      v34[3] = &unk_1E6485DD0;
      v34[4] = self;
      v35 = v12;
      v36 = v13;
      v37 = v56;
      v38 = &v39;
      dispatch_sync(queue, v34);
      v26 = *(void **)(*(_QWORD *)&v56[8] + 40);
      if (v26)
      {
        v27 = SFLogFramework;
        if (os_log_type_enabled((os_log_t)SFLogFramework, OS_LOG_TYPE_INFO))
        {
          v28 = v40[5];
          *(_DWORD *)buf = 136315650;
          v51 = "-[SFEntitledAssetManager _installedAssetWithConfig:regionId:shouldSubscribe:subscriberId:expiration:]";
          v52 = 2112;
          v53 = v28;
          v54 = 2112;
          v55 = v26;
          _os_log_impl(&dword_1B2494000, v27, OS_LOG_TYPE_INFO, "%s Found asset: %@, at path: %@", buf, 0x20u);
          v26 = *(void **)(*(_QWORD *)&v56[8] + 40);
        }
      }
      v29 = v26;

      _Block_object_dispose(&v39, 8);
      _Block_object_dispose(v56, 8);

    }
    else
    {
      v33 = SFLogFramework;
      if (os_log_type_enabled((os_log_t)SFLogFramework, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v56 = 136315138;
        *(_QWORD *)&v56[4] = "-[SFEntitledAssetManager _installedAssetWithConfig:regionId:shouldSubscribe:subscriberId:expiration:]";
        _os_log_error_impl(&dword_1B2494000, v33, OS_LOG_TYPE_ERROR, "%s Language cannot be nil.", v56, 0xCu);
      }
      v29 = 0;
    }
  }

  return v29;
}

- (id)installedAudioSamplingConfigWithAssetName:(id)a3
{
  id v4;
  NSObject *queue;
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
  v15 = __Block_byref_object_copy__1549;
  v16 = __Block_byref_object_dispose__1550;
  v17 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __68__SFEntitledAssetManager_installedAudioSamplingConfigWithAssetName___block_invoke;
  block[3] = &unk_1E6485DF8;
  block[4] = self;
  v10 = v4;
  v11 = &v12;
  v6 = v4;
  dispatch_sync(queue, block);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (id)_assetWithAssetConfig:(id)a3 regionId:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  __CFString *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  NSObject *v16;
  uint64_t v17;
  __CFString *v18;
  __CFString *v19;
  void *v20;
  int v21;
  const char *v22;
  __int16 v23;
  __CFString *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  +[SFEntitledAssetManager assetSetUsageForConfig:regionId:](SFEntitledAssetManager, "assetSetUsageForConfig:regionId:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    +[SFEntitledAssetManager assetSetNameForAssetType:](SFEntitledAssetManager, "assetSetNameForAssetType:", objc_msgSend(v6, "assetType"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[SFEntitledAssetManager assetNameForAssetType:](SFEntitledAssetManager, "assetNameForAssetType:", objc_msgSend(v6, "assetType"));
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    -[SFEntitledAssetManager _assetSetWithName:usage:](self, "_assetSetWithName:usage:", v9, v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "assetNamed:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v12)
    {
      v13 = SFLogFramework;
      if (os_log_type_enabled((os_log_t)SFLogFramework, OS_LOG_TYPE_ERROR))
      {
        v21 = 136315906;
        v22 = "-[SFEntitledAssetManager _assetWithAssetConfig:regionId:]";
        v23 = 2112;
        v24 = v10;
        v25 = 2112;
        v26 = v9;
        v27 = 2112;
        v28 = v8;
        _os_log_error_impl(&dword_1B2494000, v13, OS_LOG_TYPE_ERROR, "%s No asset found with name: %@, asset set: %@, usage: %@", (uint8_t *)&v21, 0x2Au);
      }
    }

  }
  else
  {
    v14 = (void *)SFLogFramework;
    if (os_log_type_enabled((os_log_t)SFLogFramework, OS_LOG_TYPE_ERROR))
    {
      v16 = v14;
      v17 = objc_msgSend(v6, "assetType");
      if ((unint64_t)(v17 - 1) > 6)
        v18 = CFSTR("Unknown");
      else
        v18 = off_1E6485350[v17 - 1];
      v19 = v18;
      objc_msgSend(v6, "language");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 136315906;
      v22 = "-[SFEntitledAssetManager _assetWithAssetConfig:regionId:]";
      v23 = 2112;
      v24 = v19;
      v25 = 2112;
      v26 = v20;
      v27 = 2112;
      v28 = v7;
      _os_log_error_impl(&dword_1B2494000, v16, OS_LOG_TYPE_ERROR, "%s No valid usage resolved from asset type: %@, language: %@, regionId: %@", (uint8_t *)&v21, 0x2Au);

    }
    v12 = 0;
  }

  return v12;
}

- (id)_assetSetWithName:(id)a3 usage:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  id v27;
  __int16 v28;
  id v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (objc_msgSend(v6, "length"))
  {
    -[NSMutableDictionary objectForKey:](self->_assetSetDict, "objectForKey:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKey:](self->_assetSetDict, "setObject:forKey:", v8, v6);
    }
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    objc_msgSend(v8, "allKeys", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v30, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v21;
LABEL_6:
      v13 = 0;
      while (1)
      {
        if (*(_QWORD *)v21 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v13);
        if ((objc_msgSend(v14, "isEqualToDictionary:", v7) & 1) != 0)
          break;
        if (v11 == ++v13)
        {
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v30, 16);
          if (v11)
            goto LABEL_6;
          goto LABEL_12;
        }
      }
      objc_msgSend(v8, "objectForKey:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v15)
        goto LABEL_22;
    }
    else
    {
LABEL_12:

    }
    objc_msgSend(MEMORY[0x1E0DC5DE0], "sharedManager");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "retrieveAssetSet:usages:", v6, v7);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      objc_msgSend(v8, "setObject:forKey:", v15, v7);
      -[SFEntitledAssetManager _scheduleCleanupTimer](self, "_scheduleCleanupTimer");
    }
    else
    {
      v18 = SFLogFramework;
      if (os_log_type_enabled((os_log_t)SFLogFramework, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        v25 = "-[SFEntitledAssetManager _assetSetWithName:usage:]";
        v26 = 2112;
        v27 = v6;
        v28 = 2112;
        v29 = v7;
        _os_log_error_impl(&dword_1B2494000, v18, OS_LOG_TYPE_ERROR, "%s No valid asset set resolved from name %@, usage %@, returning nil.", buf, 0x20u);
      }
      v15 = 0;
    }
LABEL_22:

  }
  else
  {
    v17 = SFLogFramework;
    if (os_log_type_enabled((os_log_t)SFLogFramework, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v25 = "-[SFEntitledAssetManager _assetSetWithName:usage:]";
      _os_log_error_impl(&dword_1B2494000, v17, OS_LOG_TYPE_ERROR, "%s Empty asset name.", buf, 0xCu);
    }
    v15 = 0;
  }

  return v15;
}

- (id)_assetsWithAssetType:(unint64_t)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFEntitledAssetManager _assetSetsWithAssetType:](self, "_assetSetsWithAssetType:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v10), "assets");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "allValues");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObjectsFromArray:", v12);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  return v5;
}

- (id)_assetSetsWithAssetType:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  +[SFEntitledAssetManager assetSetNameForAssetType:](SFEntitledAssetManager, "assetSetNameForAssetType:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](self->_assetSetDict, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allValues");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)_scheduleCleanupTimer
{
  OS_dispatch_source *v3;
  OS_dispatch_source *cleanupTimer;
  NSObject *v5;
  NSObject *v6;
  dispatch_time_t v7;
  _QWORD v8[4];
  id v9;
  id location;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[SFEntitledAssetManager _cancelCleanupTimer](self, "_cancelCleanupTimer");
  if (!self->_cleanupTimer)
  {
    v3 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, (dispatch_queue_t)sCleanupQueue);
    cleanupTimer = self->_cleanupTimer;
    self->_cleanupTimer = v3;

    objc_initWeak(&location, self);
    v5 = self->_cleanupTimer;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __47__SFEntitledAssetManager__scheduleCleanupTimer__block_invoke;
    v8[3] = &unk_1E6485E20;
    objc_copyWeak(&v9, &location);
    dispatch_source_set_event_handler(v5, v8);
    v6 = self->_cleanupTimer;
    v7 = dispatch_time(0, 1000000000 * self->_cleanupDuration);
    dispatch_source_set_timer(v6, v7, 0xFFFFFFFFFFFFFFFFLL, 0);
    dispatch_resume((dispatch_object_t)self->_cleanupTimer);
    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
}

- (void)_cancelCleanupTimer
{
  NSObject *cleanupTimer;
  OS_dispatch_source *v4;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  cleanupTimer = self->_cleanupTimer;
  if (cleanupTimer)
  {
    dispatch_source_cancel(cleanupTimer);
    v4 = self->_cleanupTimer;
    self->_cleanupTimer = 0;

  }
}

- (void)_cleanupTimerFired
{
  NSObject *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = SFLogFramework;
  if (self->_cleanupDuration == 18000)
  {
    if (os_log_type_enabled((os_log_t)SFLogFramework, OS_LOG_TYPE_ERROR))
    {
      v4 = 136315138;
      v5 = "-[SFEntitledAssetManager _cleanupTimerFired]";
    }
  }
  else if (os_log_type_enabled((os_log_t)SFLogFramework, OS_LOG_TYPE_INFO))
  {
    v4 = 136315138;
    v5 = "-[SFEntitledAssetManager _cleanupTimerFired]";
    _os_log_impl(&dword_1B2494000, v3, OS_LOG_TYPE_INFO, "%s Cleanup timer fired.", (uint8_t *)&v4, 0xCu);
  }
  -[SFEntitledAssetManager releaseAssetSets](self, "releaseAssetSets");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegates, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_assetSetDict, 0);
  objc_storeStrong((id *)&self->_cleanupTimer, 0);
  objc_storeStrong((id *)&self->_subscriptionQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __47__SFEntitledAssetManager__scheduleCleanupTimer__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_cleanupTimerFired");

}

void __68__SFEntitledAssetManager_installedAudioSamplingConfigWithAssetName___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  +[SFEntitledAssetManager assetSetNameForAssetType:](SFEntitledAssetManager, "assetSetNameForAssetType:", 3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_assetSetWithName:usage:", v8, MEMORY[0x1E0C9AA70]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "assetNamed:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "location");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "path");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

uint64_t __101__SFEntitledAssetManager__installedAssetWithConfig_regionId_shouldSubscribe_subscriberId_expiration___block_invoke(_QWORD *a1)
{
  return +[SFEntitledAssetManager subscribeToAssetWithConfig:regionId:subscriberId:expiration:](SFEntitledAssetManager, "subscribeToAssetWithConfig:regionId:subscriberId:expiration:", a1[4], a1[5], a1[6], a1[7]);
}

void __101__SFEntitledAssetManager__installedAssetWithConfig_regionId_shouldSubscribe_subscriberId_expiration___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "_assetWithAssetConfig:regionId:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "location");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "path");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  objc_msgSend(v9, "_assetId");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

}

uint64_t __107__SFEntitledAssetManager_downloadStatusWithConfig_regionId_subscriberId_progressHandler_completionHandler___block_invoke(uint64_t a1, uint64_t a2, double a3)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, unint64_t, BOOL))(result + 16))(result, (unint64_t)a3, a2 == 3);
  return result;
}

uint64_t __107__SFEntitledAssetManager_downloadStatusWithConfig_regionId_subscriberId_progressHandler_completionHandler___block_invoke_2(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(result + 64))
  {
    v1 = result;
    objc_msgSend(*(id *)(result + 32), "refreshAssetSetWithConfig:regionId:", *(_QWORD *)(v1 + 40), *(_QWORD *)(v1 + 48));
    objc_msgSend(*(id *)(v1 + 32), "installedAssetWithConfig:regionId:", *(_QWORD *)(v1 + 40), *(_QWORD *)(v1 + 48));
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = *(_QWORD *)(*(_QWORD *)(v1 + 72) + 8);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = v2;

    if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v1 + 72) + 8) + 40))
    {
      v5 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("%@ asset not found after attempted download."), &stru_1E6486C88, CFSTR("Localizable"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "localizedStringWithFormat:", v7, *(_QWORD *)(v1 + 56));
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = *(_QWORD *)(*(_QWORD *)(v1 + 80) + 8);
      v10 = *(void **)(v9 + 40);
      *(_QWORD *)(v9 + 40) = v8;

      v11 = SFLogFramework;
      if (os_log_type_enabled((os_log_t)SFLogFramework, OS_LOG_TYPE_ERROR))
      {
        v18 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v1 + 80) + 8) + 40);
        *(_DWORD *)buf = 136315394;
        v22 = "-[SFEntitledAssetManager downloadStatusWithConfig:regionId:subscriberId:progressHandler:completionHandler:"
              "]_block_invoke_2";
        v23 = 2112;
        v24 = v18;
        _os_log_error_impl(&dword_1B2494000, v11, OS_LOG_TYPE_ERROR, "%s %@", buf, 0x16u);
      }
      v12 = (void *)MEMORY[0x1E0CB35C8];
      v13 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v1 + 80) + 8) + 40);
      v19 = *MEMORY[0x1E0CB2D50];
      v20 = v13;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "errorWithDomain:code:userInfo:", CFSTR("SFSpeechErrorDomain"), 1, v14);
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = *(_QWORD *)(*(_QWORD *)(v1 + 88) + 8);
      v17 = *(void **)(v16 + 40);
      *(_QWORD *)(v16 + 40) = v15;

    }
    return (*(uint64_t (**)(void))(*(_QWORD *)(v1 + 64) + 16))();
  }
  return result;
}

void __65__SFEntitledAssetManager_modelQualityTypeStatusStringWithConfig___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_assetWithAssetConfig:regionId:", *(_QWORD *)(a1 + 40), 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __47__SFEntitledAssetManager_assetStatusForConfig___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_assetWithAssetConfig:regionId:", *(_QWORD *)(a1 + 40), 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __56__SFEntitledAssetManager_switchToNewAssetsForAssetType___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  NSObject *v4;
  __CFString *v5;
  __CFString *v6;
  void *v7;
  int v8;
  const char *v9;
  __int16 v10;
  __CFString *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = (void *)SFLogFramework;
  if (os_log_type_enabled((os_log_t)SFLogFramework, OS_LOG_TYPE_INFO))
  {
    v3 = *(_QWORD *)(a1 + 40);
    v4 = v2;
    if ((unint64_t)(v3 - 1) > 6)
      v5 = CFSTR("Unknown");
    else
      v5 = off_1E6485350[v3 - 1];
    v6 = v5;
    v8 = 136315394;
    v9 = "-[SFEntitledAssetManager switchToNewAssetsForAssetType:]_block_invoke";
    v10 = 2112;
    v11 = v6;
    _os_log_impl(&dword_1B2494000, v4, OS_LOG_TYPE_INFO, "%s Switching to new %@ assets.", (uint8_t *)&v8, 0x16u);

  }
  +[SFEntitledAssetManager assetSetNameForAssetType:](SFEntitledAssetManager, "assetSetNameForAssetType:", *(_QWORD *)(a1 + 40));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_refreshAssetSetsWithName:", v7);
  objc_msgSend(*(id *)(a1 + 32), "_scheduleCleanupTimer");

}

void __61__SFEntitledAssetManager_refreshAssetSetWithConfig_regionId___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "objectForKey:", *(_QWORD *)(a1 + 40));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", *(_QWORD *)(a1 + 48));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0DC5DE0], "sharedManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "retrieveAssetSet:usages:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "setObject:forKey:", v4, *(_QWORD *)(a1 + 48));
    objc_msgSend(*(id *)(a1 + 32), "_scheduleCleanupTimer");

  }
}

BOOL __58__SFEntitledAssetManager_registerAssetDelegate_assetType___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained, "assetStatus:", v3);

  return v5 != 0;
}

void __58__SFEntitledAssetManager_registerAssetDelegate_assetType___block_invoke_2(uint64_t a1)
{
  _QWORD *WeakRetained;
  uint64_t v3;
  NSObject *v4;
  _QWORD *v5;
  void *v6;
  NSObject *v7;
  id v8;
  _QWORD *v9;
  _QWORD v10[4];
  _QWORD *v11;
  id v12;
  id v13;
  _QWORD block[4];
  id v15;
  id v16;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = MEMORY[0x1E0C809B0];
    v4 = WeakRetained[1];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __58__SFEntitledAssetManager_registerAssetDelegate_assetType___block_invoke_3;
    block[3] = &unk_1E6486378;
    v9 = WeakRetained;
    v15 = *(id *)(a1 + 32);
    v5 = v9;
    v16 = v5;
    dispatch_sync(v4, block);
    objc_msgSend(v5, "installationStatusForLanguagesWithAssetType:", *(_QWORD *)(a1 + 48));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v9[1];
    v10[0] = v3;
    v10[1] = 3221225472;
    v10[2] = __58__SFEntitledAssetManager_registerAssetDelegate_assetType___block_invoke_326;
    v10[3] = &unk_1E6485CE0;
    v11 = v5;
    v12 = *(id *)(a1 + 32);
    v13 = v6;
    v8 = v6;
    dispatch_sync(v7, v10);

    WeakRetained = v9;
  }

}

void __58__SFEntitledAssetManager_registerAssetDelegate_assetType___block_invoke_329(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  int v11;
  const char *v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "objectForKey:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2)
  {
    v3 = *(void **)(*(_QWORD *)(a1 + 32) + 56);
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v4, *(_QWORD *)(a1 + 40));

  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "objectForKey:", *(_QWORD *)(a1 + 40));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = _Block_copy(*(const void **)(a1 + 48));
  objc_msgSend(v5, "addObject:", v6);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "objectForKey:", *(_QWORD *)(a1 + 40));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0DC5DE0], "sharedManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "observeAssetSet:queue:handler:", *(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 56));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "setObject:forKey:", v7, *(_QWORD *)(a1 + 40));
    }
    else
    {
      v9 = SFLogFramework;
      if (os_log_type_enabled((os_log_t)SFLogFramework, OS_LOG_TYPE_FAULT))
      {
        v10 = *(_QWORD *)(a1 + 40);
        v11 = 136315394;
        v12 = "-[SFEntitledAssetManager registerAssetDelegate:assetType:]_block_invoke";
        v13 = 2112;
        v14 = v10;
        _os_log_fault_impl(&dword_1B2494000, v9, OS_LOG_TYPE_FAULT, "%s Failed to initialize %@ asset set observer.", (uint8_t *)&v11, 0x16u);
      }
      v7 = 0;
    }
  }

}

uint64_t __58__SFEntitledAssetManager_registerAssetDelegate_assetType___block_invoke_330(uint64_t a1)
{
  NSObject *v2;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = SFLogFramework;
  if (os_log_type_enabled((os_log_t)SFLogFramework, OS_LOG_TYPE_INFO))
  {
    v4 = 136315138;
    v5 = "-[SFEntitledAssetManager registerAssetDelegate:assetType:]_block_invoke";
    _os_log_impl(&dword_1B2494000, v2, OS_LOG_TYPE_INFO, "%s Cancelling the cleanup timer after registering an asset delegate.", (uint8_t *)&v4, 0xCu);
  }
  return objc_msgSend(*(id *)(a1 + 32), "_cancelCleanupTimer");
}

uint64_t __58__SFEntitledAssetManager_registerAssetDelegate_assetType___block_invoke_3(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v5;
  const char *v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = SFLogFramework;
  if (os_log_type_enabled((os_log_t)SFLogFramework, OS_LOG_TYPE_INFO))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v5 = 136315394;
    v6 = "-[SFEntitledAssetManager registerAssetDelegate:assetType:]_block_invoke_3";
    v7 = 2112;
    v8 = v3;
    _os_log_impl(&dword_1B2494000, v2, OS_LOG_TYPE_INFO, "%s New UAF update for %@ assets.", (uint8_t *)&v5, 0x16u);
  }
  return objc_msgSend(*(id *)(a1 + 40), "_refreshAssetSetsWithName:", *(_QWORD *)(a1 + 32));
}

void __58__SFEntitledAssetManager_registerAssetDelegate_assetType___block_invoke_326(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, void *);
  void *v12;
  id v13;
  id v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "objectForKey:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v10 = 3221225472;
  v11 = __58__SFEntitledAssetManager_registerAssetDelegate_assetType___block_invoke_2_327;
  v12 = &unk_1E6485CB8;
  v13 = *(id *)(a1 + 48);
  v4 = v3;
  v14 = v4;
  objc_msgSend(v2, "enumerateObjectsUsingBlock:", &v9);
  objc_msgSend(v2, "removeObjectsInArray:", v4, v9, v10, v11, v12);
  if (!objc_msgSend(v2, "count"))
  {
    v5 = SFLogFramework;
    if (os_log_type_enabled((os_log_t)SFLogFramework, OS_LOG_TYPE_INFO))
    {
      v6 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 136315394;
      v16 = "-[SFEntitledAssetManager registerAssetDelegate:assetType:]_block_invoke";
      v17 = 2112;
      v18 = v6;
      _os_log_impl(&dword_1B2494000, v5, OS_LOG_TYPE_INFO, "%s Removed update handler for %@ assets.", buf, 0x16u);
    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "objectForKey:", *(_QWORD *)(a1 + 40));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC5DE0], "sharedManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeObserver:", v7);

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "removeObjectForKey:", *(_QWORD *)(a1 + 40));
  }

}

void __58__SFEntitledAssetManager_registerAssetDelegate_assetType___block_invoke_2_327(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id aBlock;

  aBlock = a2;
  if (((*((uint64_t (**)(id, _QWORD))aBlock + 2))(aBlock, *(_QWORD *)(a1 + 32)) & 1) == 0)
  {
    v3 = *(void **)(a1 + 40);
    v4 = _Block_copy(aBlock);
    objc_msgSend(v3, "addObject:", v4);

  }
}

void __56__SFEntitledAssetManager_releaseAssetSetsWithAssetType___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  NSObject *v4;
  __CFString *v5;
  __CFString *v6;
  void *v7;
  int v8;
  const char *v9;
  __int16 v10;
  __CFString *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = (void *)SFLogFramework;
  if (os_log_type_enabled((os_log_t)SFLogFramework, OS_LOG_TYPE_INFO))
  {
    v3 = *(_QWORD *)(a1 + 40);
    v4 = v2;
    if ((unint64_t)(v3 - 1) > 6)
      v5 = CFSTR("Unknown");
    else
      v5 = off_1E6485350[v3 - 1];
    v6 = v5;
    v8 = 136315394;
    v9 = "-[SFEntitledAssetManager releaseAssetSetsWithAssetType:]_block_invoke";
    v10 = 2112;
    v11 = v6;
    _os_log_impl(&dword_1B2494000, v4, OS_LOG_TYPE_INFO, "%s Releasing %@ assets sets.", (uint8_t *)&v8, 0x16u);

  }
  +[SFEntitledAssetManager assetNameForAssetType:](SFEntitledAssetManager, "assetNameForAssetType:", *(_QWORD *)(a1 + 40));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "removeObjectForKey:", v7);

}

uint64_t __42__SFEntitledAssetManager_releaseAssetSets__block_invoke(uint64_t a1)
{
  NSObject *v2;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = SFLogFramework;
  if (os_log_type_enabled((os_log_t)SFLogFramework, OS_LOG_TYPE_INFO))
  {
    v4 = 136315138;
    v5 = "-[SFEntitledAssetManager releaseAssetSets]_block_invoke";
    _os_log_impl(&dword_1B2494000, v2, OS_LOG_TYPE_INFO, "%s Releasing all asset sets.", (uint8_t *)&v4, 0xCu);
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "removeAllObjects");
  return objc_msgSend(*(id *)(a1 + 32), "_cancelCleanupTimer");
}

uint64_t __33__SFEntitledAssetManager_dealloc__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_cancelCleanupTimer");
}

uint64_t __63__SFEntitledAssetManager_initWithAssetSetDict_cleanupDuration___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_scheduleCleanupTimer");
}

+ (void)initialize
{
  uint64_t v2;
  void *v3;

  if ((id)objc_opt_class() == a1)
  {
    dispatch_get_global_queue(9, 0);
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = (void *)sCleanupQueue;
    sCleanupQueue = v2;

  }
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_1599 != -1)
    dispatch_once(&sharedInstance_onceToken_1599, &__block_literal_global_1600);
  return (id)sharedInstance_sharedManager_1601;
}

+ (id)systemSubscriberId
{
  return CFSTR("com.apple.siri.embeddedspeech");
}

+ (id)installationStateForDownloadStatus:(unint64_t)a3
{
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  unint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (a3 - 1 < 5)
    return off_1E6485E40[a3 - 1];
  v5 = SFLogFramework;
  if (os_log_type_enabled((os_log_t)SFLogFramework, OS_LOG_TYPE_ERROR))
  {
    v6 = 136315394;
    v7 = "+[SFEntitledAssetManager installationStateForDownloadStatus:]";
    v8 = 2048;
    v9 = a3;
    _os_log_error_impl(&dword_1B2494000, v5, OS_LOG_TYPE_ERROR, "%s Unsupported download status: %lu", (uint8_t *)&v6, 0x16u);
  }
  return CFSTR("Unknown");
}

+ (id)subscriptionNameForConfig:(id)a3 regionId:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  __CFString *v17;
  __CFString *v18;
  NSObject *v19;
  int v21;
  const char *v22;
  __int16 v23;
  __CFString *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  +[SFEntitledAssetManager subscriptionNamePrefixForAssetType:](SFEntitledAssetManager, "subscriptionNamePrefixForAssetType:", objc_msgSend(v5, "assetType"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v7, "length"))
    goto LABEL_18;
  v8 = objc_msgSend(v5, "assetType");
  if (v8 == 5)
  {
    if (v6)
    {
      objc_msgSend(v5, "language");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      +[SFUtilities stringByReplacingHyphensWithUnderscores:](SFUtilities, "stringByReplacingHyphensWithUnderscores:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v7, "stringByAppendingString:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "stringByAppendingString:", CFSTR("."));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "stringByAppendingString:", v6);
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue();

LABEL_11:
      goto LABEL_19;
    }
    v16 = objc_msgSend(v5, "assetType");
    if ((unint64_t)(v16 - 1) > 6)
      v17 = CFSTR("Unknown");
    else
      v17 = off_1E6485350[v16 - 1];
    v18 = v17;
    v19 = SFLogFramework;
    if (os_log_type_enabled((os_log_t)SFLogFramework, OS_LOG_TYPE_ERROR))
    {
      v21 = 136315394;
      v22 = "+[SFEntitledAssetManager subscriptionNameForConfig:regionId:]";
      v23 = 2112;
      v24 = v18;
      _os_log_error_impl(&dword_1B2494000, v19, OS_LOG_TYPE_ERROR, "%s regionId cannot be nil for asset type: %@", (uint8_t *)&v21, 0x16u);
    }

LABEL_18:
    v9 = &stru_1E6486C88;
    goto LABEL_19;
  }
  if (v8 == 7)
  {
    objc_msgSend(v5, "language");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[SFUtilities languageCodeForLocaleIdentifier:](SFUtilities, "languageCodeForLocaleIdentifier:", v14);
    v15 = objc_claimAutoreleasedReturnValue();
LABEL_10:
    v11 = (void *)v15;

    objc_msgSend(v7, "stringByAppendingString:", v11);
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }
  if (v8 != 6)
  {
    objc_msgSend(v5, "language");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[SFUtilities stringByReplacingHyphensWithUnderscores:](SFUtilities, "stringByReplacingHyphensWithUnderscores:", v14);
    v15 = objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
  v9 = v7;
LABEL_19:

  return v9;
}

+ (id)subscriptionNamePrefixForAssetType:(unint64_t)a3
{
  unint64_t v3;
  void *v4;
  NSObject *v6;
  __CFString *v7;
  __CFString *v8;
  int v9;
  const char *v10;
  __int16 v11;
  __CFString *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a3 - 1;
  if (a3 - 1 < 7 && ((0x7Du >> v3) & 1) != 0)
    return off_1E6485E68[v3];
  v4 = (void *)SFLogFramework;
  if (os_log_type_enabled((os_log_t)SFLogFramework, OS_LOG_TYPE_ERROR))
  {
    v6 = v4;
    if (v3 > 6)
      v7 = CFSTR("Unknown");
    else
      v7 = off_1E6485350[v3];
    v8 = v7;
    v9 = 136315394;
    v10 = "+[SFEntitledAssetManager subscriptionNamePrefixForAssetType:]";
    v11 = 2112;
    v12 = v8;
    _os_log_error_impl(&dword_1B2494000, v6, OS_LOG_TYPE_ERROR, "%s Unsupported asset type: %@", (uint8_t *)&v9, 0x16u);

  }
  return &stru_1E6486C88;
}

+ (id)assetNameForAssetType:(unint64_t)a3
{
  unint64_t v3;
  void *v4;
  NSObject *v6;
  __CFString *v7;
  __CFString *v8;
  int v9;
  const char *v10;
  __int16 v11;
  __CFString *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a3 - 1;
  if (a3 - 1 < 7 && ((0x7Du >> v3) & 1) != 0)
    return off_1E6485EA0[v3];
  v4 = (void *)SFLogFramework;
  if (os_log_type_enabled((os_log_t)SFLogFramework, OS_LOG_TYPE_ERROR))
  {
    v6 = v4;
    if (v3 > 6)
      v7 = CFSTR("Unknown");
    else
      v7 = off_1E6485350[v3];
    v8 = v7;
    v9 = 136315394;
    v10 = "+[SFEntitledAssetManager assetNameForAssetType:]";
    v11 = 2112;
    v12 = v8;
    _os_log_error_impl(&dword_1B2494000, v6, OS_LOG_TYPE_ERROR, "%s Unsupported asset type: %@", (uint8_t *)&v9, 0x16u);

  }
  return &stru_1E6486C88;
}

+ (id)assetSetUsageForConfig:(id)a3 regionId:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  const __CFString **v12;
  void **v13;
  NSObject *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  __CFString *v19;
  void *v20;
  void *v21;
  void *v22;
  __CFString *v24;
  const char *v25;
  uint64_t v26;
  __CFString *v27;
  uint64_t v28;
  void *v29;
  uint8_t buf[4];
  const char *v31;
  __int16 v32;
  __CFString *v33;
  void *v34;
  void *v35;
  void *v36;
  const __CFString *v37;
  void *v38;
  _QWORD v39[2];

  v39[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "language");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    +[SFEntitledAssetManager assetUsageTypeForAssetType:](SFEntitledAssetManager, "assetUsageTypeForAssetType:", objc_msgSend(v5, "assetType"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "length"))
    {
      objc_msgSend(v5, "language");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      +[SFUtilities stringByReplacingHyphensWithUnderscores:](SFUtilities, "stringByReplacingHyphensWithUnderscores:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      switch(objc_msgSend(v5, "assetType"))
      {
        case 1:
        case 3:
        case 4:
          v38 = v8;
          v39[0] = v10;
          v11 = (void *)MEMORY[0x1E0C99D80];
          v12 = (const __CFString **)v39;
          v13 = &v38;
          goto LABEL_15;
        case 5:
          if (v6)
          {
            objc_msgSend(v10, "stringByAppendingString:", CFSTR("."), v8);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "stringByAppendingString:", v6);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v29 = v21;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v29, &v28, 1);
            v15 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_17:
          }
          else
          {
            v22 = (void *)SFLogFramework;
            if (os_log_type_enabled((os_log_t)SFLogFramework, OS_LOG_TYPE_ERROR))
            {
              v17 = v22;
              v26 = objc_msgSend(v5, "assetType");
              if ((unint64_t)(v26 - 1) > 6)
                v27 = CFSTR("Unknown");
              else
                v27 = off_1E6485350[v26 - 1];
              v24 = v27;
              *(_DWORD *)buf = 136315394;
              v31 = "+[SFEntitledAssetManager assetSetUsageForConfig:regionId:]";
              v32 = 2112;
              v33 = v24;
              v25 = "%s regionId cannot be nil for asset type: %@";
LABEL_29:
              _os_log_error_impl(&dword_1B2494000, v17, OS_LOG_TYPE_ERROR, v25, buf, 0x16u);

            }
LABEL_19:
            v15 = 0;
          }
LABEL_20:

          break;
        case 6:
          v36 = v8;
          v37 = CFSTR("1");
          v11 = (void *)MEMORY[0x1E0C99D80];
          v12 = &v37;
          v13 = &v36;
LABEL_15:
          objc_msgSend(v11, "dictionaryWithObjects:forKeys:count:", v12, v13, 1);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_20;
        case 7:
          v34 = v8;
          +[SFUtilities languageCodeForLocaleIdentifier:](SFUtilities, "languageCodeForLocaleIdentifier:", v10);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = v20;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v35, &v34, 1);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_17;
        default:
          v16 = (void *)SFLogFramework;
          if (!os_log_type_enabled((os_log_t)SFLogFramework, OS_LOG_TYPE_ERROR))
            goto LABEL_19;
          v17 = v16;
          v18 = objc_msgSend(v5, "assetType");
          if ((unint64_t)(v18 - 1) > 6)
            v19 = CFSTR("Unknown");
          else
            v19 = off_1E6485350[v18 - 1];
          v24 = v19;
          *(_DWORD *)buf = 136315394;
          v31 = "+[SFEntitledAssetManager assetSetUsageForConfig:regionId:]";
          v32 = 2112;
          v33 = v24;
          v25 = "%s Unsupported asset type: %@";
          goto LABEL_29;
      }
    }
    else
    {
      v15 = 0;
    }

  }
  else
  {
    v14 = SFLogFramework;
    if (os_log_type_enabled((os_log_t)SFLogFramework, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v31 = "+[SFEntitledAssetManager assetSetUsageForConfig:regionId:]";
      _os_log_error_impl(&dword_1B2494000, v14, OS_LOG_TYPE_ERROR, "%s Language cannot be nil.", buf, 0xCu);
    }
    v15 = 0;
  }

  return v15;
}

+ (id)assetUsageTypeForAssetType:(unint64_t)a3
{
  unint64_t v3;
  void *v4;
  NSObject *v6;
  __CFString *v7;
  __CFString *v8;
  int v9;
  const char *v10;
  __int16 v11;
  __CFString *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a3 - 1;
  if (a3 - 1 < 7 && ((0x7Du >> v3) & 1) != 0)
    return off_1E6485ED8[v3];
  v4 = (void *)SFLogFramework;
  if (os_log_type_enabled((os_log_t)SFLogFramework, OS_LOG_TYPE_ERROR))
  {
    v6 = v4;
    if (v3 > 6)
      v7 = CFSTR("Unknown");
    else
      v7 = off_1E6485350[v3];
    v8 = v7;
    v9 = 136315394;
    v10 = "+[SFEntitledAssetManager assetUsageTypeForAssetType:]";
    v11 = 2112;
    v12 = v8;
    _os_log_error_impl(&dword_1B2494000, v6, OS_LOG_TYPE_ERROR, "%s Unsupported asset type: %@", (uint8_t *)&v9, 0x16u);

  }
  return &stru_1E6486C88;
}

+ (id)assetSetNameForAssetType:(unint64_t)a3
{
  unint64_t v3;
  void *v4;
  NSObject *v6;
  __CFString *v7;
  __CFString *v8;
  int v9;
  const char *v10;
  __int16 v11;
  __CFString *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a3 - 1;
  if (a3 - 1 < 7 && ((0x7Du >> v3) & 1) != 0)
    return off_1E6485F10[v3];
  v4 = (void *)SFLogFramework;
  if (os_log_type_enabled((os_log_t)SFLogFramework, OS_LOG_TYPE_ERROR))
  {
    v6 = v4;
    if (v3 > 6)
      v7 = CFSTR("Unknown");
    else
      v7 = off_1E6485350[v3];
    v8 = v7;
    v9 = 136315394;
    v10 = "+[SFEntitledAssetManager assetSetNameForAssetType:]";
    v11 = 2112;
    v12 = v8;
    _os_log_error_impl(&dword_1B2494000, v6, OS_LOG_TYPE_ERROR, "%s Unsupported asset type: %@", (uint8_t *)&v9, 0x16u);

  }
  return &stru_1E6486C88;
}

+ (id)jsonFilenameForAssetType:(unint64_t)a3
{
  unint64_t v3;
  void *v4;
  NSObject *v6;
  __CFString *v7;
  __CFString *v8;
  int v9;
  const char *v10;
  __int16 v11;
  __CFString *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a3 - 1;
  if (a3 - 1 < 7 && ((0x5Du >> v3) & 1) != 0)
    return off_1E6485F48[v3];
  v4 = (void *)SFLogFramework;
  if (os_log_type_enabled((os_log_t)SFLogFramework, OS_LOG_TYPE_ERROR))
  {
    v6 = v4;
    if (v3 > 6)
      v7 = CFSTR("Unknown");
    else
      v7 = off_1E6485350[v3];
    v8 = v7;
    v9 = 136315394;
    v10 = "+[SFEntitledAssetManager jsonFilenameForAssetType:]";
    v11 = 2112;
    v12 = v8;
    _os_log_error_impl(&dword_1B2494000, v6, OS_LOG_TYPE_ERROR, "%s Unsupported asset type: %@", (uint8_t *)&v9, 0x16u);

  }
  return &stru_1E6486C88;
}

+ (id)modelAttributesForAsset:(id)a3
{
  id v3;
  __CFString *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v3 = a3;
  if (objc_msgSend(v3, "_preferOverServer"))
  {
    if (objc_msgSend(v3, "_supportsContinuousListening"))
    {
      objc_msgSend(CFSTR("HQ"), "stringByAppendingFormat:", CFSTR(": %@"), CFSTR("CL"));
      v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v4 = CFSTR("HQ");
    }
    if (objc_msgSend(v3, "_supportsOnDeviceSearch"))
    {
      -[__CFString stringByAppendingFormat:](v4, "stringByAppendingFormat:", CFSTR(": %@"), CFSTR("DS"));
      v5 = objc_claimAutoreleasedReturnValue();

      v4 = (__CFString *)v5;
    }
    if (objc_msgSend(v3, "_supportsAutoPunctuation"))
    {
      -[__CFString stringByAppendingFormat:](v4, "stringByAppendingFormat:", CFSTR(": %@"), CFSTR("AP"));
      v6 = objc_claimAutoreleasedReturnValue();

      v4 = (__CFString *)v6;
    }
    if (objc_msgSend(v3, "_supportsEmojiRecognition"))
    {
      -[__CFString stringByAppendingFormat:](v4, "stringByAppendingFormat:", CFSTR(": %@"), CFSTR("ER"));
      v7 = objc_claimAutoreleasedReturnValue();

      v4 = (__CFString *)v7;
    }
    if (objc_msgSend(v3, "_supportsVoiceCommands"))
    {
      -[__CFString stringByAppendingFormat:](v4, "stringByAppendingFormat:", CFSTR(": %@"), CFSTR("VC"));
      v8 = objc_claimAutoreleasedReturnValue();

      v4 = (__CFString *)v8;
    }
  }
  else
  {
    v4 = CFSTR("LQ");
  }

  return v4;
}

+ (id)offlineDictationLocales
{
  if (offlineDictationLocales_onceToken != -1)
    dispatch_once(&offlineDictationLocales_onceToken, &__block_literal_global_297);
  return (id)offlineDictationLocales_offlineDictationLocales;
}

+ (id)onDeviceDictationLocales
{
  if (onDeviceDictationLocales_onceToken != -1)
    dispatch_once(&onDeviceDictationLocales_onceToken, &__block_literal_global_299);
  return (id)onDeviceDictationLocales_onDeviceDictationLocales;
}

+ (id)assetSetUsagesForAssetType:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  int v19;
  const char *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3 == 3)
  {
    _AFPreferencesLanguageCode();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[SFUtilities stringByReplacingHyphensWithUnderscores:](SFUtilities, "stringByReplacingHyphensWithUnderscores:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
      objc_msgSend(v4, "addObject:", v6);
    +[SFEntitledAssetManager offlineDictationLocales](SFEntitledAssetManager, "offlineDictationLocales");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObjectsFromArray:", v7);

    +[SFEntitledAssetManager onDeviceDictationLocales](SFEntitledAssetManager, "onDeviceDictationLocales");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObjectsFromArray:", v8);

  }
  else
  {
    v9 = +[SFUtilities isGeneralASRSupportedOnDevice](SFUtilities, "isGeneralASRSupportedOnDevice");
    if (a3 != 7 || v9)
    {
      +[SFEntitledAssetManager assetSetNameForAssetType:](SFEntitledAssetManager, "assetSetNameForAssetType:", a3);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      +[SFEntitledAssetManager assetUsageTypeForAssetType:](SFEntitledAssetManager, "assetUsageTypeForAssetType:", a3);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC5DE0], "sharedManager");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "knownUsagesForAssetSet:usageType:", v11, v12);
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = (void *)v14;
      if (v14)
        v16 = v14;
      else
        v16 = MEMORY[0x1E0C9AA60];
      objc_msgSend(v4, "addObjectsFromArray:", v16);

    }
    else
    {
      v10 = SFLogConnection;
      if (os_log_type_enabled((os_log_t)SFLogConnection, OS_LOG_TYPE_INFO))
      {
        v19 = 136315138;
        v20 = "+[SFEntitledAssetManager assetSetUsagesForAssetType:]";
        _os_log_impl(&dword_1B2494000, v10, OS_LOG_TYPE_INFO, "%s GeneralASR is not supported on this device", (uint8_t *)&v19, 0xCu);
      }
    }
  }
  objc_msgSend(v4, "allObjects");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

+ (id)subscriptionsForSubscriberId:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  unint64_t v12;
  unint64_t v13;
  SFEntitledAssetConfig *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v21;
  id obj;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v23 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC5DE0], "sharedManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v3;
  objc_msgSend(v4, "subscriptionsForSubscriber:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  obj = v5;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v25 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        objc_msgSend(v10, "name");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = +[SFEntitledAssetManager _assetTypeForSubscriptionName:](SFEntitledAssetManager, "_assetTypeForSubscriptionName:", v11);
        if (v12)
        {
          v13 = v12;
          if (v12 == 6)
          {
            v14 = -[SFEntitledAssetConfig initWithLanguage:assetType:]([SFEntitledAssetConfig alloc], "initWithLanguage:assetType:", CFSTR("none"), 6);
            objc_msgSend(v23, "addObject:", v14);
          }
          else
          {
            +[SFEntitledAssetManager assetSetNameForAssetType:](SFEntitledAssetManager, "assetSetNameForAssetType:", v12);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "assetSets");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "objectForKey:", v15);
            v17 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v17, "objectForKey:", CFSTR("asr.language"));
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "objectForKey:", CFSTR("asr.geo"));
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v14 = -[SFEntitledAssetConfig initWithAssetType:language:regionId:]([SFEntitledAssetConfig alloc], "initWithAssetType:language:regionId:", v13, v18, v19);
            objc_msgSend(v23, "addObject:", v14);

          }
        }

      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v7);
  }

  return v23;
}

+ (unint64_t)_assetTypeForSubscriptionName:(id)a3
{
  id v3;
  void *v4;
  id v5;
  unint64_t v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD v15[6];
  _QWORD v16[7];

  v16[6] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v15[0] = CFSTR("hammer.");
  v15[1] = CFSTR("assistant.");
  v16[0] = &unk_1E6498708;
  v16[1] = &unk_1E6498720;
  v15[2] = CFSTR("geolmregion.");
  v15[3] = CFSTR("geolm.");
  v16[2] = &unk_1E6498738;
  v16[3] = &unk_1E6498750;
  v15[4] = CFSTR("language.identification");
  v15[5] = CFSTR("transcription.");
  v16[4] = &unk_1E6498768;
  v16[5] = &unk_1E6498780;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __56__SFEntitledAssetManager__assetTypeForSubscriptionName___block_invoke;
  v8[3] = &unk_1E6485C18;
  v5 = v3;
  v9 = v5;
  v10 = &v11;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v8);
  v6 = v12[3];

  _Block_object_dispose(&v11, 8);
  return v6;
}

+ (void)subscribeToAssetWithConfig:(id)a3 regionId:(id)a4 subscriberId:(id)a5 expiration:(id)a6
{
  +[SFEntitledAssetManager subscribeToAssetWithConfig:regionId:subscriberId:expiration:completionHandler:](SFEntitledAssetManager, "subscribeToAssetWithConfig:regionId:subscriberId:expiration:completionHandler:", a3, a4, a5, a6, 0);
}

+ (void)subscribeToAssetWithConfig:(id)a3 regionId:(id)a4 subscriberId:(id)a5 expiration:(id)a6 completionHandler:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  SFEntitledAssetConfig *v23;
  void *v24;
  SFEntitledAssetConfig *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  __CFString *v34;
  __CFString *v35;
  void *v36;
  NSObject *v37;
  void *v38;
  void *v39;
  _QWORD v40[4];
  id v41;
  id v42;
  id v43;
  uint64_t v44;
  id v45;
  uint8_t buf[4];
  const char *v47;
  __int16 v48;
  id v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  if (!+[SFEntitledAssetManager isSubscribedToAssetWithConfig:regionId:subscriberId:](SFEntitledAssetManager, "isSubscribedToAssetWithConfig:regionId:subscriberId:", v11, v12, v13))
  {
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v13);

    if (v16)
    {
      v17 = SFLogFramework;
      if (os_log_type_enabled((os_log_t)SFLogFramework, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v47 = "+[SFEntitledAssetManager subscribeToAssetWithConfig:regionId:subscriberId:expiration:completionHandler:]";
        v48 = 2112;
        v49 = v13;
        _os_log_error_impl(&dword_1B2494000, v17, OS_LOG_TYPE_ERROR, "%s Subscriber identifier (%@) unexpectedly matches the profile of a UUID, forcing the prospective subscription to expire in 24 hours.", buf, 0x16u);
      }
      objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "dateByAddingUnit:value:toDate:options:", 16, 1, v19, 0);
      v20 = objc_claimAutoreleasedReturnValue();

      v14 = (id)v20;
    }
    +[SFEntitledAssetManager _assetSetSubscriptionWithConfig:regionId:expiration:](SFEntitledAssetManager, "_assetSetSubscriptionWithConfig:regionId:expiration:", v11, v12, v14);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (v21)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v11, "assetType") == 3)
      {
        v23 = [SFEntitledAssetConfig alloc];
        objc_msgSend(v11, "language");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = -[SFEntitledAssetConfig initWithLanguage:assetType:](v23, "initWithLanguage:assetType:", v24, 1);

        +[SFEntitledAssetManager _assetSetSubscriptionWithConfig:regionId:expiration:](SFEntitledAssetManager, "_assetSetSubscriptionWithConfig:regionId:expiration:", v25, 0, v14);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "addObject:", v26);

      }
      objc_msgSend(MEMORY[0x1E0DC5DE0], "sharedManager");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v40[0] = MEMORY[0x1E0C809B0];
      v40[1] = 3221225472;
      v40[2] = __104__SFEntitledAssetManager_subscribeToAssetWithConfig_regionId_subscriberId_expiration_completionHandler___block_invoke;
      v40[3] = &unk_1E6485C40;
      v41 = v13;
      v42 = v22;
      v43 = v15;
      v28 = v22;
      objc_msgSend(v27, "subscribe:subscriptions:queue:completion:", v41, v28, 0, v40);

      v29 = v41;
    }
    else
    {
      v30 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "localizedStringForKey:value:table:", CFSTR("No valid subscription resolved from asset type: %@, language: %@, regionId: %@"), &stru_1E6486C88, CFSTR("Localizable"));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = objc_msgSend(v11, "assetType");
      if ((unint64_t)(v33 - 1) > 6)
        v34 = CFSTR("Unknown");
      else
        v34 = off_1E6485350[v33 - 1];
      v35 = v34;
      objc_msgSend(v11, "language");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "localizedStringWithFormat:", v32, v35, v36, v12);
      v28 = (id)objc_claimAutoreleasedReturnValue();

      v37 = SFLogFramework;
      if (os_log_type_enabled((os_log_t)SFLogFramework, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v47 = "+[SFEntitledAssetManager subscribeToAssetWithConfig:regionId:subscriberId:expiration:completionHandler:]";
        v48 = 2112;
        v49 = v28;
        _os_log_error_impl(&dword_1B2494000, v37, OS_LOG_TYPE_ERROR, "%s %@", buf, 0x16u);
      }
      v21 = 0;
      if (!v15)
        goto LABEL_20;
      v38 = (void *)MEMORY[0x1E0CB35C8];
      v44 = *MEMORY[0x1E0CB2D50];
      v45 = v28;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v45, &v44, 1);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "errorWithDomain:code:userInfo:", CFSTR("SFSpeechErrorDomain"), 1, v39);
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      (*((void (**)(id, void *))v15 + 2))(v15, v29);
    }

LABEL_20:
    goto LABEL_21;
  }
  if (v15)
    (*((void (**)(id, _QWORD))v15 + 2))(v15, 0);
LABEL_21:

}

+ (id)unsubscribeFromAssetsWithAssetType:(unint64_t)a3 exceptLanguages:(id)a4 subscriberId:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, void *);
  void *v19;
  id v20;
  id v21;

  v7 = a5;
  +[SFEntitledAssetManager _assetSetSubscriptionsWithAssetType:exceptLanguages:subscriberId:](SFEntitledAssetManager, "_assetSetSubscriptionsWithAssetType:exceptLanguages:subscriberId:", a3, a4, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "allKeys");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sortedArrayUsingSelector:", sel_compare_);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v10, "count"))
  {
    objc_msgSend(MEMORY[0x1E0DC5DE0], "sharedManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = MEMORY[0x1E0C809B0];
    v17 = 3221225472;
    v18 = __90__SFEntitledAssetManager_unsubscribeFromAssetsWithAssetType_exceptLanguages_subscriberId___block_invoke;
    v19 = &unk_1E6486350;
    v20 = v7;
    v21 = v10;
    objc_msgSend(v11, "unsubscribe:subscriptionNames:queue:completion:", v20, v21, 0, &v16);

  }
  v12 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(v8, "allValues", v16, v17, v18, v19);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setWithArray:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (void)unsubscribeFromAssetWithConfig:(id)a3 regionId:(id)a4 subscriberId:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  SFEntitledAssetConfig *v12;
  void *v13;
  SFEntitledAssetConfig *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  __CFString *v20;
  __CFString *v21;
  void *v22;
  _QWORD v23[4];
  id v24;
  id v25;
  uint8_t buf[4];
  const char *v27;
  __int16 v28;
  __CFString *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (+[SFEntitledAssetManager isSubscribedToAssetWithConfig:regionId:subscriberId:](SFEntitledAssetManager, "isSubscribedToAssetWithConfig:regionId:subscriberId:", v7, v8, v9))
  {
    +[SFEntitledAssetManager subscriptionNameForConfig:regionId:](SFEntitledAssetManager, "subscriptionNameForConfig:regionId:", v7, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "length"))
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v7, "assetType") == 3)
      {
        v12 = [SFEntitledAssetConfig alloc];
        objc_msgSend(v7, "language");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = -[SFEntitledAssetConfig initWithLanguage:assetType:](v12, "initWithLanguage:assetType:", v13, 1);

        +[SFEntitledAssetManager subscriptionNameForConfig:regionId:](SFEntitledAssetManager, "subscriptionNameForConfig:regionId:", v14, 0);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "addObject:", v15);

      }
      objc_msgSend(MEMORY[0x1E0DC5DE0], "sharedManager");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = __79__SFEntitledAssetManager_unsubscribeFromAssetWithConfig_regionId_subscriberId___block_invoke;
      v23[3] = &unk_1E6486350;
      v24 = v9;
      v25 = v11;
      v17 = v11;
      objc_msgSend(v16, "unsubscribe:subscriptionNames:queue:completion:", v24, v17, 0, v23);

    }
    else
    {
      v18 = (void *)SFLogFramework;
      if (!os_log_type_enabled((os_log_t)SFLogFramework, OS_LOG_TYPE_ERROR))
        goto LABEL_8;
      v17 = v18;
      v19 = objc_msgSend(v7, "assetType");
      if ((unint64_t)(v19 - 1) > 6)
        v20 = CFSTR("Unknown");
      else
        v20 = off_1E6485350[v19 - 1];
      v21 = v20;
      objc_msgSend(v7, "language");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315906;
      v27 = "+[SFEntitledAssetManager unsubscribeFromAssetWithConfig:regionId:subscriberId:]";
      v28 = 2112;
      v29 = v21;
      v30 = 2112;
      v31 = v22;
      v32 = 2112;
      v33 = v8;
      _os_log_error_impl(&dword_1B2494000, v17, OS_LOG_TYPE_ERROR, "%s No valid subscription name resolved from asset type: %@, language: %@, regionId: %@", buf, 0x2Au);

    }
LABEL_8:

  }
}

+ (BOOL)isSubscribedToAssetWithConfig:(id)a3 regionId:(id)a4 subscriberId:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  int v21;
  uint64_t v22;
  void *v23;
  void *v24;
  NSObject *v26;
  uint64_t v27;
  __CFString *v28;
  __CFString *v29;
  void *v30;
  id v31;
  id v32;
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint8_t v38[128];
  uint8_t buf[4];
  const char *v40;
  __int16 v41;
  __CFString *v42;
  __int16 v43;
  void *v44;
  __int16 v45;
  id v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  +[SFEntitledAssetManager subscriptionNameForConfig:regionId:](SFEntitledAssetManager, "subscriptionNameForConfig:regionId:", v7, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "length"))
  {
    +[SFEntitledAssetManager assetSetNameForAssetType:](SFEntitledAssetManager, "assetSetNameForAssetType:", objc_msgSend(v7, "assetType"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[SFEntitledAssetManager assetSetUsageForConfig:regionId:](SFEntitledAssetManager, "assetSetUsageForConfig:regionId:", v7, v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC5DE0], "sharedManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "subscriptionsForSubscriber:", v9);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    v15 = v14;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
    if (v16)
    {
      v31 = v9;
      v32 = v8;
      v33 = v7;
      v17 = *(_QWORD *)v35;
      while (2)
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v35 != v17)
            objc_enumerationMutation(v15);
          v19 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
          objc_msgSend(v19, "name");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = objc_msgSend(v20, "isEqualToString:", v10);

          if (v21)
          {
            objc_msgSend(v19, "assetSets");
            v22 = objc_claimAutoreleasedReturnValue();
            objc_msgSend((id)v22, "objectForKey:", v11);
            v23 = (void *)objc_claimAutoreleasedReturnValue();

            LOBYTE(v22) = objc_msgSend(v23, "isEqualToDictionary:", v12);
            if ((v22 & 1) != 0)
            {
              LOBYTE(v16) = 1;
              goto LABEL_15;
            }
          }
        }
        v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
        if (v16)
          continue;
        break;
      }
LABEL_15:
      v8 = v32;
      v7 = v33;
      v9 = v31;
    }

  }
  else
  {
    v24 = (void *)SFLogFramework;
    if (os_log_type_enabled((os_log_t)SFLogFramework, OS_LOG_TYPE_ERROR))
    {
      v26 = v24;
      v27 = objc_msgSend(v7, "assetType");
      if ((unint64_t)(v27 - 1) > 6)
        v28 = CFSTR("Unknown");
      else
        v28 = off_1E6485350[v27 - 1];
      v29 = v28;
      objc_msgSend(v7, "language");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315906;
      v40 = "+[SFEntitledAssetManager isSubscribedToAssetWithConfig:regionId:subscriberId:]";
      v41 = 2112;
      v42 = v29;
      v43 = 2112;
      v44 = v30;
      v45 = 2112;
      v46 = v8;
      _os_log_error_impl(&dword_1B2494000, v26, OS_LOG_TYPE_ERROR, "%s No valid subscription name resolved from asset type: %@, language: %@, regionId: %@", buf, 0x2Au);

    }
    LOBYTE(v16) = 0;
  }

  return v16;
}

+ (id)modelTasksForLocaleWithInstallationStatus:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id obj;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  objc_msgSend(v3, "allKeys");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(obj);
        v9 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v3, "objectForKey:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        +[SFEntitledAssetManager _assetPathWithStatus:](SFEntitledAssetManager, "_assetPathWithStatus:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
          +[SFModelTaskSet taskSetWithAssetPath:](SFModelTaskSet, "taskSetWithAssetPath:", v11);
        else
          +[SFModelTaskSet set](SFModelTaskSet, "set");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setObject:forKey:", v12, v9);

      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v6);
  }

  return v4;
}

+ (id)supportedLanguagesForAssetType:(unint64_t)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[SFEntitledAssetManager assetSetUsagesForAssetType:](SFEntitledAssetManager, "assetSetUsagesForAssetType:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        +[SFUtilities stringByReplacingUnderscoresWithHyphens:](SFUtilities, "stringByReplacingUnderscoresWithHyphens:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  return v4;
}

+ (id)statusForAsset:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  __CFString *v6;
  __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __CFString *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v3 = a3;
  objc_msgSend(v3, "location");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = CFSTR("Version");
  if (!v5)
    v6 = CFSTR("Not Installing");
  v7 = v6;

  +[SFEntitledAssetManager modelAttributesForAsset:](SFEntitledAssetManager, "modelAttributesForAsset:", v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "location");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "path");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v3, "location");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "path");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringWithFormat:", CFSTR("ModelInfo=%@: "), v13);
    v14 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v14 = &stru_1E6486C88;
  }

  v15 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v3, "_assetId");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "stringWithFormat:", CFSTR("AssetId=%@"), v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %@: %@%@:"), v7, v8, v14, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

+ (void)setPurgeabilityForAssetWithConfig:(id)a3 purgeable:(BOOL)a4 completionHandler:(id)a5
{
  _BOOL4 v5;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[2];

  v5 = a4;
  v17[1] = *MEMORY[0x1E0C80C00];
  v7 = a5;
  v8 = a3;
  +[SFEntitledAssetManager assetNameForAssetType:](SFEntitledAssetManager, "assetNameForAssetType:", objc_msgSend(v8, "assetType"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[SFEntitledAssetManager assetSetNameForAssetType:](SFEntitledAssetManager, "assetSetNameForAssetType:", objc_msgSend(v8, "assetType"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[SFEntitledAssetManager assetUsageTypeForAssetType:](SFEntitledAssetManager, "assetUsageTypeForAssetType:", objc_msgSend(v8, "assetType"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "language");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  +[SFUtilities stringByReplacingHyphensWithUnderscores:](SFUtilities, "stringByReplacingHyphensWithUnderscores:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC5DE0], "sharedManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v11;
  v17[0] = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "disableCacheDelete:forAssetNamed:assetSet:usages:queue:completion:", !v5, v9, v10, v15, 0, v7);

}

+ (id)_assetPathWithStatus:(id)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  objc_msgSend(a3, "componentsSeparatedByString:", CFSTR(":"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        if ((objc_msgSend(v8, "hasPrefix:", CFSTR(" ModelInfo=")) & 1) != 0)
        {
          objc_msgSend(v8, "stringByReplacingOccurrencesOfString:withString:", CFSTR(" ModelInfo="), &stru_1E6486C88);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_11;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v5)
        continue;
      break;
    }
  }
  v9 = 0;
LABEL_11:

  return v9;
}

+ (id)_assetSetSubscriptionsWithAssetType:(unint64_t)a3 exceptLanguages:(id)a4 subscriberId:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t i;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  uint64_t v24;
  void *v25;
  id v27;
  id v28;
  id obj;
  id v30;
  uint64_t v31;
  unint64_t v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v30 = a4;
  v7 = a5;
  v32 = a3;
  +[SFEntitledAssetManager subscriptionNamePrefixForAssetType:](SFEntitledAssetManager, "subscriptionNamePrefixForAssetType:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "length"))
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v28 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC5DE0], "sharedManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v7;
    objc_msgSend(v9, "subscriptionsForSubscriber:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    obj = v10;
    v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    if (!v11)
    {
      v13 = 0;
      goto LABEL_22;
    }
    v12 = v11;
    v13 = 0;
    v31 = *(_QWORD *)v34;
    while (1)
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v34 != v31)
          objc_enumerationMutation(obj);
        v15 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
        objc_msgSend(v15, "name");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "hasPrefix:", v8);

        if (!v17)
        {
          if (v32 != 3)
            continue;
          objc_msgSend(v15, "name");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = objc_msgSend(v22, "hasPrefix:", CFSTR("hammer."));

          if (!v23)
            continue;
          objc_msgSend(v15, "name");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "substringFromIndex:", objc_msgSend(CFSTR("hammer."), "length"));
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          +[SFUtilities stringByReplacingUnderscoresWithHyphens:](SFUtilities, "stringByReplacingUnderscoresWithHyphens:", v20);
          v24 = objc_claimAutoreleasedReturnValue();

          v13 = (void *)v24;
          goto LABEL_13;
        }
        objc_msgSend(v15, "name");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "substringFromIndex:", objc_msgSend(v8, "length"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        +[SFUtilities stringByReplacingUnderscoresWithHyphens:](SFUtilities, "stringByReplacingUnderscoresWithHyphens:", v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        if (v32 == 5)
        {
          objc_msgSend(v20, "componentsSeparatedByString:", CFSTR("."));
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "firstObject");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_13:

          goto LABEL_15;
        }
        v13 = v20;
LABEL_15:
        if ((objc_msgSend(v30, "containsObject:", v13) & 1) == 0)
        {
          objc_msgSend(v15, "name");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "setObject:forKey:", v13, v25);

        }
      }
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
      if (!v12)
      {
LABEL_22:

        v7 = v27;
        goto LABEL_23;
      }
    }
  }
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionary");
  v28 = (id)objc_claimAutoreleasedReturnValue();
LABEL_23:

  return v28;
}

+ (id)_assetSetSubscriptionWithConfig:(id)a3 regionId:(id)a4 expiration:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v18;
  uint64_t v19;
  __CFString *v20;
  __CFString *v21;
  void *v22;
  void *v23;
  void *v24;
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  __CFString *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  +[SFEntitledAssetManager subscriptionNameForConfig:regionId:](SFEntitledAssetManager, "subscriptionNameForConfig:regionId:", v7, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "length"))
  {
    +[SFEntitledAssetManager assetSetNameForAssetType:](SFEntitledAssetManager, "assetSetNameForAssetType:", objc_msgSend(v7, "assetType"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[SFEntitledAssetManager assetSetUsageForConfig:regionId:](SFEntitledAssetManager, "assetSetUsageForConfig:regionId:", v7, v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_alloc(MEMORY[0x1E0DC5DF8]);
    v23 = v11;
    v24 = v12;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v13, "initWithName:assetSets:usageAliases:expires:", v10, v14, 0, v9);

  }
  else
  {
    v16 = (void *)SFLogFramework;
    if (os_log_type_enabled((os_log_t)SFLogFramework, OS_LOG_TYPE_ERROR))
    {
      v18 = v16;
      v19 = objc_msgSend(v7, "assetType");
      if ((unint64_t)(v19 - 1) > 6)
        v20 = CFSTR("Unknown");
      else
        v20 = off_1E6485350[v19 - 1];
      v21 = v20;
      objc_msgSend(v7, "language");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315906;
      v26 = "+[SFEntitledAssetManager _assetSetSubscriptionWithConfig:regionId:expiration:]";
      v27 = 2112;
      v28 = v21;
      v29 = 2112;
      v30 = v22;
      v31 = 2112;
      v32 = v8;
      _os_log_error_impl(&dword_1B2494000, v18, OS_LOG_TYPE_ERROR, "%s No valid subscription name resolved from asset type: %@, language: %@, regionId: %@", buf, 0x2Au);

    }
    v15 = 0;
  }

  return v15;
}

+ (BOOL)isOverrideSupportedForAssetType:(unint64_t)a3
{
  if (SFIsInternalInstall_onceToken != -1)
    dispatch_once(&SFIsInternalInstall_onceToken, &__block_literal_global_1717);
  return ((a3 - 3) & 0xFFFFFFFFFFFFFFFBLL) == 0 && SFIsInternalInstall_isInternal != 0;
}

+ (id)_overridePathForConfig:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  __CFString *v6;
  id v7;
  __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;

  v3 = a3;
  if (+[SFEntitledAssetManager isOverrideSupportedForAssetType:](SFEntitledAssetManager, "isOverrideSupportedForAssetType:", objc_msgSend(v3, "assetType")))
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v3, "assetType");
    if ((unint64_t)(v5 - 1) > 6)
      v6 = CFSTR("Unknown");
    else
      v6 = off_1E6485350[v5 - 1];
    v8 = v6;
    v9 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v3, "language");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringWithFormat:", CFSTR("%@/%@/%@"), CFSTR("overrideAssetPath"), v8, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "objectForKey:", v11);
    v12 = objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      v13 = (void *)v12;
      v14 = v11;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@/%@"), CFSTR("overrideAssetPath"), v8);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v4, "objectForKey:", v14);
      v15 = objc_claimAutoreleasedReturnValue();
      if (!v15)
      {
        v7 = 0;
LABEL_14:

        goto LABEL_15;
      }
      v13 = (void *)v15;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v16 = v13;
    else
      v16 = 0;
    v7 = v16;

    goto LABEL_14;
  }
  v7 = 0;
LABEL_15:

  return v7;
}

+ (id)_overrideStatusForConfig:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  __CFString *v6;
  void *v7;
  __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  uint64_t v22;
  void *v24;
  __CFString *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (+[SFEntitledAssetManager isOverrideSupportedForAssetType:](SFEntitledAssetManager, "isOverrideSupportedForAssetType:", objc_msgSend(v3, "assetType")))
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v3, "assetType");
    if ((unint64_t)(v5 - 1) > 6)
      v6 = CFSTR("Unknown");
    else
      v6 = off_1E6485350[v5 - 1];
    v8 = v6;
    v9 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v3, "language");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringWithFormat:", CFSTR("%@/%@/%@"), CFSTR("overrideAssetStatus"), v8, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "objectForKey:", v11);
    v12 = objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      v13 = (void *)v12;
      v14 = v11;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@/%@"), CFSTR("overrideAssetStatus"), v8);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v4, "objectForKey:", v14);
      v15 = objc_claimAutoreleasedReturnValue();
      if (!v15)
      {
        v7 = 0;
LABEL_24:

        goto LABEL_25;
      }
      v13 = (void *)v15;
    }
    objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("%@:"), CFSTR("Version"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v16, "appendFormat:", CFSTR(" %@:"), v13);
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v24 = v14;
        v25 = v8;
        v28 = 0u;
        v29 = 0u;
        v26 = 0u;
        v27 = 0u;
        v17 = v13;
        v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
        if (v18)
        {
          v19 = v18;
          v20 = *(_QWORD *)v27;
          do
          {
            for (i = 0; i != v19; ++i)
            {
              if (*(_QWORD *)v27 != v20)
                objc_enumerationMutation(v17);
              v22 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * i);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
                objc_msgSend(v16, "appendFormat:", CFSTR(" %@:"), v22);
            }
            v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
          }
          while (v19);
        }

        v8 = v25;
        v14 = v24;
      }
    }
    v7 = (void *)objc_msgSend(v16, "copy");

    goto LABEL_24;
  }
  v7 = 0;
LABEL_25:

  return v7;
}

+ (id)_overrideModelQualityForConfig:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  __CFString *v7;
  __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;

  v3 = (void *)MEMORY[0x1E0C99EA0];
  v4 = a3;
  objc_msgSend(v3, "standardUserDefaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "assetType");
  if ((unint64_t)(v6 - 1) > 6)
    v7 = CFSTR("Unknown");
  else
    v7 = off_1E6485350[v6 - 1];
  v8 = v7;
  v9 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v4, "language");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "stringWithFormat:", CFSTR("%@/%@/%@"), CFSTR("overrideAssetStatus"), v8, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "objectForKey:", v11);
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    v14 = v11;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@/%@"), CFSTR("overrideAssetStatus"), v8);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "objectForKey:", v14);
    v15 = objc_claimAutoreleasedReturnValue();
    if (!v15)
    {
      v16 = 0;
      goto LABEL_18;
    }
    v13 = (void *)v15;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v16 = v13;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v13, "firstObject");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v13, "firstObject");
        v16 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v16 = 0;
      }

    }
    else
    {
      v16 = 0;
    }
  }

LABEL_18:
  return v16;
}

void __79__SFEntitledAssetManager_unsubscribeFromAssetWithConfig_regionId_subscriberId___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  const char *v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = SFLogFramework;
  if (v3)
  {
    if (os_log_type_enabled((os_log_t)SFLogFramework, OS_LOG_TYPE_ERROR))
    {
      v5 = *(_QWORD *)(a1 + 32);
      v6 = *(_QWORD *)(a1 + 40);
      v9 = 136315906;
      v10 = "+[SFEntitledAssetManager unsubscribeFromAssetWithConfig:regionId:subscriberId:]_block_invoke";
      v11 = 2112;
      v12 = v5;
      v13 = 2112;
      v14 = v6;
      v15 = 2112;
      v16 = v3;
      _os_log_error_impl(&dword_1B2494000, v4, OS_LOG_TYPE_ERROR, "%s Failed to unsubscribe %@ from %@, error: %@", (uint8_t *)&v9, 0x2Au);
    }
  }
  else if (os_log_type_enabled((os_log_t)SFLogFramework, OS_LOG_TYPE_INFO))
  {
    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(_QWORD *)(a1 + 40);
    v9 = 136315650;
    v10 = "+[SFEntitledAssetManager unsubscribeFromAssetWithConfig:regionId:subscriberId:]_block_invoke";
    v11 = 2112;
    v12 = v7;
    v13 = 2112;
    v14 = v8;
    _os_log_impl(&dword_1B2494000, v4, OS_LOG_TYPE_INFO, "%s Unsubscribed %@ from %@", (uint8_t *)&v9, 0x20u);
  }

}

void __90__SFEntitledAssetManager_unsubscribeFromAssetsWithAssetType_exceptLanguages_subscriberId___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  const char *v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = SFLogFramework;
  if (v3)
  {
    if (os_log_type_enabled((os_log_t)SFLogFramework, OS_LOG_TYPE_ERROR))
    {
      v5 = *(_QWORD *)(a1 + 32);
      v6 = *(_QWORD *)(a1 + 40);
      v9 = 136315906;
      v10 = "+[SFEntitledAssetManager unsubscribeFromAssetsWithAssetType:exceptLanguages:subscriberId:]_block_invoke";
      v11 = 2112;
      v12 = v5;
      v13 = 2112;
      v14 = v6;
      v15 = 2112;
      v16 = v3;
      _os_log_error_impl(&dword_1B2494000, v4, OS_LOG_TYPE_ERROR, "%s Failed to unsubscribe %@ from %@, error: %@", (uint8_t *)&v9, 0x2Au);
    }
  }
  else if (os_log_type_enabled((os_log_t)SFLogFramework, OS_LOG_TYPE_INFO))
  {
    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(_QWORD *)(a1 + 40);
    v9 = 136315650;
    v10 = "+[SFEntitledAssetManager unsubscribeFromAssetsWithAssetType:exceptLanguages:subscriberId:]_block_invoke";
    v11 = 2112;
    v12 = v7;
    v13 = 2112;
    v14 = v8;
    _os_log_impl(&dword_1B2494000, v4, OS_LOG_TYPE_INFO, "%s Unsubscribed %@ from %@", (uint8_t *)&v9, 0x20u);
  }

}

void __104__SFEntitledAssetManager_subscribeToAssetWithConfig_regionId_subscriberId_expiration_completionHandler___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  const char *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = SFLogFramework;
  if (v3)
  {
    if (os_log_type_enabled((os_log_t)SFLogFramework, OS_LOG_TYPE_ERROR))
    {
      v5 = a1[4];
      v6 = a1[5];
      v10 = 136315906;
      v11 = "+[SFEntitledAssetManager subscribeToAssetWithConfig:regionId:subscriberId:expiration:completionHandler:]_block_invoke";
      v12 = 2112;
      v13 = v5;
      v14 = 2112;
      v15 = v6;
      v16 = 2112;
      v17 = v3;
      _os_log_error_impl(&dword_1B2494000, v4, OS_LOG_TYPE_ERROR, "%s Failed to subscribe %@ to %@, error: %@", (uint8_t *)&v10, 0x2Au);
    }
  }
  else if (os_log_type_enabled((os_log_t)SFLogFramework, OS_LOG_TYPE_INFO))
  {
    v7 = a1[4];
    v8 = a1[5];
    v10 = 136315650;
    v11 = "+[SFEntitledAssetManager subscribeToAssetWithConfig:regionId:subscriberId:expiration:completionHandler:]_block_invoke";
    v12 = 2112;
    v13 = v7;
    v14 = 2112;
    v15 = v8;
    _os_log_impl(&dword_1B2494000, v4, OS_LOG_TYPE_INFO, "%s Subscribed %@ to %@", (uint8_t *)&v10, 0x20u);
  }
  v9 = a1[6];
  if (v9)
    (*(void (**)(uint64_t, id))(v9 + 16))(v9, v3);

}

void __56__SFEntitledAssetManager__assetTypeForSubscriptionName___block_invoke(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  id v7;

  v7 = a3;
  if (objc_msgSend(*(id *)(a1 + 32), "hasPrefix:", a2))
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v7, "unsignedIntegerValue");
    *a4 = 1;
  }

}

void __50__SFEntitledAssetManager_onDeviceDictationLocales__block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0DC5E08], "sharedManager");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "queryAllSupportedKeys:", CFSTR("com.apple.dictation.ondevice"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)v0;
  if (v0)
    v2 = (void *)v0;
  else
    v2 = (void *)MEMORY[0x1E0C9AA60];
  objc_storeStrong((id *)&onDeviceDictationLocales_onDeviceDictationLocales, v2);

}

void __49__SFEntitledAssetManager_offlineDictationLocales__block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0DC5E08], "sharedManager");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "queryAllSupportedKeys:", CFSTR("com.apple.dictation.offline"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)v0;
  if (v0)
    v2 = (void *)v0;
  else
    v2 = (void *)MEMORY[0x1E0C9AA60];
  objc_storeStrong((id *)&offlineDictationLocales_offlineDictationLocales, v2);

}

void __40__SFEntitledAssetManager_sharedInstance__block_invoke()
{
  SFEntitledAssetManager *v0;
  void *v1;

  v0 = objc_alloc_init(SFEntitledAssetManager);
  v1 = (void *)sharedInstance_sharedManager_1601;
  sharedInstance_sharedManager_1601 = (uint64_t)v0;

}

@end
