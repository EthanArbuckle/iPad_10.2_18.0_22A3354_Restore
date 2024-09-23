@implementation FCPersonalizationData

void __44__FCPersonalizationData_generateDerivedData__block_invoke(uint64_t a1, const char *a2)
{
  id Property;
  void *v4;
  double v5;
  double v6;
  FCDerivedPersonalizationData *v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  _QWORD *v12;

  Property = *(id *)(a1 + 32);
  if (Property)
    Property = objc_getProperty(Property, a2, 136, 1);
  objc_msgSend(Property, "defaultScoringConfig");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decayFactor");
  v6 = v5;

  v7 = [FCDerivedPersonalizationData alloc];
  v8 = *(_QWORD **)(a1 + 32);
  if (v8)
    v8 = (_QWORD *)v8[14];
  v12 = v8;
  v9 = -[FCDerivedPersonalizationData initWithAggregates:scoringType:decayRate:](v7, "initWithAggregates:scoringType:decayRate:", v12, 2, v6);
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v9;

}

- (id)generateDerivedData
{
  NSObject *accessQueue;
  id v4;
  void *v6;
  _QWORD v7[6];
  _BYTE buf[24];
  __int128 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread")
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("This operation must not be performed on the main thread."));
    *(_DWORD *)buf = 136315906;
    *(_QWORD *)&buf[4] = "-[FCPersonalizationData generateDerivedData]";
    *(_WORD *)&buf[12] = 2080;
    *(_QWORD *)&buf[14] = "FCPersonalizationData.m";
    *(_WORD *)&buf[22] = 1024;
    LODWORD(v9) = 243;
    WORD2(v9) = 2114;
    *(_QWORD *)((char *)&v9 + 6) = v6;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  *(_QWORD *)&v9 = __Block_byref_object_copy__77;
  *((_QWORD *)&v9 + 1) = __Block_byref_object_dispose__77;
  v10 = 0;
  if (self)
    accessQueue = self->_accessQueue;
  else
    accessQueue = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __44__FCPersonalizationData_generateDerivedData__block_invoke;
  v7[3] = &unk_1E463DF90;
  v7[4] = self;
  v7[5] = buf;
  dispatch_sync(accessQueue, v7);
  v4 = *(id *)(*(_QWORD *)&buf[8] + 40);
  _Block_object_dispose(buf, 8);

  return v4;
}

+ (BOOL)requiresHighPriorityFirstSync
{
  return 1;
}

+ (unint64_t)localStoreVersion
{
  return 3;
}

+ (id)localStoreFilename
{
  return CFSTR("personalization-data");
}

+ (void)configureKeyValueStoreForJSONHandling:(id)a3
{
  objc_msgSend(a3, "setJSONEncodingHandlersWithObjectHandler:arrayObjectHandler:dictionaryKeyHandler:dictionaryValueHandler:", 0, 0, 0, &__block_literal_global_78);
}

+ (id)commandStoreFileName
{
  return CFSTR("personalization-data-commands");
}

+ (int64_t)commandQueueUrgency
{
  return 0;
}

void __48__FCPersonalizationData__saveReadableAggregates__block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  id v22;
  NSObject *v23;
  NSObject *v24;
  void *v25;
  NSObject *v26;
  id v27;
  _QWORD v28[5];
  id v29;
  _QWORD v30[4];
  id v31;
  uint8_t buf[4];
  id v33;
  _QWORD v34[2];
  _QWORD v35[3];

  v35[2] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v3 = *(void **)(a1 + 32);
  v4 = MEMORY[0x1E0C809B0];
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __48__FCPersonalizationData__saveReadableAggregates__block_invoke_2;
  v30[3] = &unk_1E464A3F8;
  v5 = v2;
  v31 = v5;
  objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v30);
  v35[0] = v5;
  v34[0] = CFSTR("aggregates");
  v34[1] = CFSTR("lastUpdated");
  v6 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "timeIntervalSince1970");
  objc_msgSend(v6, "stringWithFormat:", CFSTR("%f"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v35[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v35, v34, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v29 = 0;
  objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v10, 1, &v29);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v29;
  v13 = v12;
  if (v11)
  {
    v14 = (void *)MEMORY[0x1E0C99E98];
    objc_msgSend(*(id *)(a1 + 40), "localStore");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "storeDirectory");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "fileURLWithPath:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "URLByAppendingPathComponent:", CFSTR("personalization-aggregates"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "URLByAppendingPathExtension:", CFSTR("json"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      objc_msgSend(v19, "path");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = v13;
      v21 = objc_msgSend(v11, "writeToFile:options:error:", v20, 1, &v27);
      v22 = v27;

      v23 = FCPersonalizationLog;
      if (v21)
      {
        if (os_log_type_enabled((os_log_t)FCPersonalizationLog, OS_LOG_TYPE_DEFAULT))
        {
          v24 = v23;
          objc_msgSend(v19, "path");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v33 = v25;
          _os_log_impl(&dword_1A1B90000, v24, OS_LOG_TYPE_DEFAULT, "Successfully saved readable aggregates at %@.", buf, 0xCu);

        }
      }
      else if (os_log_type_enabled((os_log_t)FCPersonalizationLog, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v33 = v22;
        _os_log_error_impl(&dword_1A1B90000, v23, OS_LOG_TYPE_ERROR, "Error when saving readable aggregates: %@", buf, 0xCu);
      }
      v13 = v22;
    }
    else
    {
      v26 = FCPersonalizationLog;
      if (os_log_type_enabled((os_log_t)FCPersonalizationLog, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1A1B90000, v26, OS_LOG_TYPE_ERROR, "Failed to construct file URL for saving readable aggregates", buf, 2u);
      }
    }

  }
  else
  {
    v28[0] = v4;
    v28[1] = 3221225472;
    v28[2] = __48__FCPersonalizationData__saveReadableAggregates__block_invoke_3;
    v28[3] = &unk_1E463AB18;
    v28[4] = v12;
    __48__FCPersonalizationData__saveReadableAggregates__block_invoke_3((uint64_t)v28);
  }

}

- (void)activityObservingApplicationWindowDidBecomeForeground
{
  objc_super v3;

  if (objc_msgSend((id)-[FCPersonalizationData superclass](self, "superclass"), "instancesRespondToSelector:", sel_activityObservingApplicationWindowDidBecomeForeground))
  {
    v3.receiver = self;
    v3.super_class = (Class)FCPersonalizationData;
    -[FCPrivateDataController activityObservingApplicationWindowDidBecomeForeground](&v3, sel_activityObservingApplicationWindowDidBecomeForeground);
  }
}

- (void)loadLocalCachesFromStore
{
  void *v3;
  NSData *v4;
  NSData *pbData;
  NSObject *accessQueue;
  uint64_t v7;
  void *v8;
  int v9;
  void *v10;
  _QWORD v11[5];
  _QWORD block[5];

  -[FCPrivateDataController localStore](self, "localStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("pb-data"));
  v4 = (NSData *)objc_claimAutoreleasedReturnValue();
  pbData = self->_pbData;
  self->_pbData = v4;

  accessQueue = self->_accessQueue;
  v7 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__FCPersonalizationData_loadLocalCachesFromStore__block_invoke;
  block[3] = &unk_1E463AB18;
  block[4] = self;
  dispatch_async(accessQueue, block);
  v11[0] = v7;
  v11[1] = 3221225472;
  v11[2] = __49__FCPersonalizationData_loadLocalCachesFromStore__block_invoke_41;
  v11[3] = &unk_1E463AB18;
  v11[4] = self;
  +[FCTaskScheduler scheduleLowPriorityBlockForMainThread:](FCTaskScheduler, "scheduleLowPriorityBlockForMainThread:", v11);
  if (NFInternalBuild())
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "BOOLForKey:", CFSTR("personalization_erase_all"));

    if (v9)
    {
      objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setBool:forKey:", 0, CFSTR("personalization_erase_all"));

      -[FCPersonalizationData clearPersonalizationData](self, "clearPersonalizationData");
    }
  }
}

- (void)_reloadTreatment
{
  void *v2;
  void *v3;
  int v4;
  const char *v5;
  __int16 v6;
  char *v7;
  __int16 v8;
  int v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v2 = (void *)FCPersonalizationDataAccessUnique;
    if (dispatch_get_specific((const void *)FCPersonalizationDataAccessUnique) != v2
      && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("accessing protected data from outside the queue"));
      v4 = 136315906;
      v5 = "-[FCPersonalizationData _reloadTreatment]";
      v6 = 2080;
      v7 = "FCPersonalizationData.m";
      v8 = 1024;
      v9 = 627;
      v10 = 2114;
      v11 = v3;
      _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v4, 0x26u);

    }
    -[FCPersonalizationData _unsafeReloadTreatment](a1);
  }
}

void __79__FCPersonalizationData_initWithContext_pushNotificationCenter_storeDirectory___block_invoke(uint64_t a1)
{
  -[FCPersonalizationData _reloadTreatment](*(void **)(a1 + 32));
}

- (FCPersonalizationData)initWithContext:(id)a3 pushNotificationCenter:(id)a4 storeDirectory:(id)a5
{
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  dispatch_queue_t v12;
  void *v13;
  FCTimedOperationThrottler *v14;
  void *v15;
  FCTimedOperationThrottler *v16;
  void *v17;
  NSObject *v18;
  _QWORD block[4];
  id v21;
  objc_super v22;

  v8 = a3;
  v22.receiver = self;
  v22.super_class = (Class)FCPersonalizationData;
  v9 = -[FCPrivateDataController initWithContext:pushNotificationCenter:storeDirectory:](&v22, sel_initWithContext_pushNotificationCenter_storeDirectory_, v8, a4, a5);
  if (v9)
  {
    objc_msgSend(v8, "configurationManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObserver:", v9);

    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = dispatch_queue_create("FCPersonalizationData.aggregatesAccessQueue", v11);
    v13 = (void *)*((_QWORD *)v9 + 16);
    *((_QWORD *)v9 + 16) = v12;

    dispatch_queue_set_specific(*((dispatch_queue_t *)v9 + 16), (const void *)FCPersonalizationDataAccessUnique, (void *)FCPersonalizationDataAccessUnique, 0);
    v14 = -[FCTimedOperationThrottler initWithDelegate:]([FCTimedOperationThrottler alloc], "initWithDelegate:", v9);
    -[FCTimedOperationThrottler setCooldownTime:](v14, "setCooldownTime:", 30.0);
    v15 = (void *)*((_QWORD *)v9 + 18);
    *((_QWORD *)v9 + 18) = v14;
    v16 = v14;

    objc_msgSend(v8, "appActivityMonitor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObserver:", v9);

    v18 = *((_QWORD *)v9 + 16);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __79__FCPersonalizationData_initWithContext_pushNotificationCenter_storeDirectory___block_invoke;
    block[3] = &unk_1E463AB18;
    v21 = v9;
    dispatch_async(v18, block);

  }
  return (FCPersonalizationData *)v9;
}

- (void)_updateWithRemoteRecord:(void *)a3 profile:
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  int v13;
  NSObject *v14;
  id v15;
  SEL v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  NSObject *v22;
  uint64_t v23;
  void *v24;
  int v25;
  const char *v26;
  __int16 v27;
  char *v28;
  __int16 v29;
  int v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a3;
  if (a1)
  {
    v8 = (void *)FCPersonalizationDataAccessUnique;
    if (dispatch_get_specific((const void *)FCPersonalizationDataAccessUnique) != v8
      && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("accessing protected data from outside the queue"));
      v25 = 136315906;
      v26 = "-[FCPersonalizationData _updateWithRemoteRecord:profile:]";
      v27 = 2080;
      v28 = "FCPersonalizationData.m";
      v29 = 1024;
      v30 = 466;
      v31 = 2114;
      v32 = v24;
      _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v25, 0x26u);

    }
    if (!v6)
      goto LABEL_8;
    v9 = a1[15];
    if (!v9)
      goto LABEL_8;
    v10 = v9;
    objc_msgSend(v10, "modificationDate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "modificationDate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = objc_msgSend(v11, "fc_isEarlierThan:", v12);
    if (v13)
    {
LABEL_8:
      v14 = FCPersonalizationLog;
      if (os_log_type_enabled((os_log_t)FCPersonalizationLog, OS_LOG_TYPE_INFO))
      {
        LOWORD(v25) = 0;
        _os_log_impl(&dword_1A1B90000, v14, OS_LOG_TYPE_INFO, "will update personalization data from a new remote record", (uint8_t *)&v25, 2u);
      }
      v15 = a1[14];
      objc_msgSend(objc_getProperty(a1, v16, 136, 1), "clicksToImpressionsRatioMaximum");
      +[FCModifyPersonalizationOperation applyAggregates:toProfile:maxRatio:](FCModifyPersonalizationOperation, "applyAggregates:toProfile:maxRatio:", v15, v7);

      objc_msgSend(v7, "aggregatesByFeatureKey");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = (void *)objc_msgSend(v17, "mutableCopy");
      v19 = v18;
      if (!v18)
      {
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_storeStrong(a1 + 14, v19);
      if (!v18)

      objc_storeStrong(a1 + 15, a2);
      v20 = (void *)FCPersonalizationLog;
      if (os_log_type_enabled((os_log_t)FCPersonalizationLog, OS_LOG_TYPE_DEFAULT))
      {
        v21 = a1[14];
        v22 = v20;
        v23 = objc_msgSend(v21, "count");
        v25 = 134217984;
        v26 = (const char *)v23;
        _os_log_impl(&dword_1A1B90000, v22, OS_LOG_TYPE_DEFAULT, "did update personalization data from a new remote record with %lu aggregates", (uint8_t *)&v25, 0xCu);

      }
    }
  }

}

void __49__FCPersonalizationData_loadLocalCachesFromStore__block_invoke(uint64_t a1)
{
  NSObject *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  _QWORD *v15;
  _QWORD *v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  void *v21;
  NSObject *v22;
  id v23;
  __int128 v24;
  void (*v25)(uint64_t);
  void *v26;
  id v27;
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v2 = FCPersonalizationLog;
  if (os_log_type_enabled((os_log_t)FCPersonalizationLog, OS_LOG_TYPE_INFO))
  {
    LOWORD(v24) = 0;
    _os_log_impl(&dword_1A1B90000, v2, OS_LOG_TYPE_INFO, "will load personalization data from disk", (uint8_t *)&v24, 2u);
  }
  v3 = objc_alloc(MEMORY[0x1E0D62778]);
  objc_msgSend(*(id *)(a1 + 32), "pbData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithData:", v4);

  objc_msgSend(v5, "aggregates");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fc_dictionaryWithKeyBlock:", &__block_literal_global_173);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "mutableCopy");
  -[FCPersonalizationData setAggregates:](*(_QWORD *)(a1 + 32), v8);

  objc_msgSend(v5, "remoteRecord");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("data"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v11)
    {
      v12 = FCPersonalizationLog;
      if (os_log_type_enabled((os_log_t)FCPersonalizationLog, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v24) = 0;
        _os_log_error_impl(&dword_1A1B90000, v12, OS_LOG_TYPE_ERROR, "ignoring locally-cached PersonalizationProfile record since it lost its data when decoding", (uint8_t *)&v24, 2u);
      }

      v10 = 0;
    }
  }
  +[FCModifyPersonalizationOperation personalizationProfileFromRecord:](FCModifyPersonalizationOperation, "personalizationProfileFromRecord:", v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCPersonalizationData _updateWithRemoteRecord:profile:](*(id **)(a1 + 32), v10, v13);
  v14 = (void *)FCPersonalizationLog;
  if (os_log_type_enabled((os_log_t)FCPersonalizationLog, OS_LOG_TYPE_DEFAULT))
  {
    v15 = *(_QWORD **)(a1 + 32);
    if (v15)
      v15 = (_QWORD *)v15[14];
    v16 = v15;
    v17 = v14;
    v18 = objc_msgSend(v16, "count");
    LODWORD(v24) = 134217984;
    *(_QWORD *)((char *)&v24 + 4) = v18;
    _os_log_impl(&dword_1A1B90000, v17, OS_LOG_TYPE_DEFAULT, "did load personalization data from disk with %lu aggregates", (uint8_t *)&v24, 0xCu);

  }
  v19 = *(_QWORD *)(a1 + 32);
  if (v19 && NFInternalBuild())
  {
    v20 = FCPersonalizationLog;
    if (os_log_type_enabled((os_log_t)FCPersonalizationLog, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v24) = 0;
      _os_log_impl(&dword_1A1B90000, v20, OS_LOG_TYPE_DEFAULT, "Will save readable aggregates.", (uint8_t *)&v24, 2u);
    }
    v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithDictionary:copyItems:", *(_QWORD *)(v19 + 112), 1);
    FCPersistenceQueue();
    v22 = objc_claimAutoreleasedReturnValue();
    *(_QWORD *)&v24 = MEMORY[0x1E0C809B0];
    *((_QWORD *)&v24 + 1) = 3221225472;
    v25 = __48__FCPersonalizationData__saveReadableAggregates__block_invoke;
    v26 = &unk_1E463AD10;
    v27 = v21;
    v28 = v19;
    v23 = v21;
    dispatch_async(v22, &v24);

  }
}

- (void)setAggregates:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 112), a2);
}

- (NSData)pbData
{
  return self->_pbData;
}

- (id)localStoreMigrator
{
  FCPersonalizationDataMigrator *v3;
  _QWORD v5[5];

  v3 = [FCPersonalizationDataMigrator alloc];
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __43__FCPersonalizationData_localStoreMigrator__block_invoke;
  v5[3] = &unk_1E463B350;
  v5[4] = self;
  return -[FCPersonalizationDataMigrator initWithTreatmentProvider:](v3, "initWithTreatmentProvider:", v5);
}

- (FCPersonalizationData)init
{
  void *v3;
  FCPersonalizationData *v4;

  v3 = (void *)objc_opt_new();
  v4 = -[FCPersonalizationData initWithAggregates:](self, "initWithAggregates:", v3);

  return v4;
}

- (FCPersonalizationData)initWithAggregates:(id)a3
{
  id v4;
  FCPersonalizationData *v5;
  NSObject *v6;
  NSObject *v7;
  dispatch_queue_t v8;
  OS_dispatch_queue *accessQueue;
  NSObject *v10;
  _QWORD v12[4];
  FCPersonalizationData *v13;
  id v14;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)FCPersonalizationData;
  v5 = -[FCPrivateDataController init](&v15, sel_init);
  if (v5)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v6 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v6, QOS_CLASS_BACKGROUND, 0);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = dispatch_queue_create("FCPersonalizationData.aggregatesAccessQueue", v7);
    accessQueue = v5->_accessQueue;
    v5->_accessQueue = (OS_dispatch_queue *)v8;

    v10 = v5->_accessQueue;
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __44__FCPersonalizationData_initWithAggregates___block_invoke;
    v12[3] = &unk_1E463AD10;
    v13 = v5;
    v14 = v4;
    dispatch_async(v10, v12);

  }
  return v5;
}

void __44__FCPersonalizationData_initWithAggregates___block_invoke(uint64_t a1)
{
  -[FCPersonalizationData setAggregates:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40));
}

- (void)modifyLocalAggregatesForFeatureKeys:(id)a3 withAction:(unint64_t)a4 actionCount:(unint64_t)a5 defaultClicks:(double)a6 defaultImpressions:(double)a7 impressionBias:(double)a8 groupBias:(double)a9
{
  char *v16;
  void *v17;
  NSObject *v18;
  char *v19;
  id v20;
  void *v21;
  NSObject *accessQueue;
  char *v23;
  id v24;
  FCOperationThrottler *saveThrottler;
  void *v26;
  _QWORD block[5];
  char *v28;
  id v29;
  uint8_t buf[4];
  const char *v31;
  __int16 v32;
  char *v33;
  __int16 v34;
  int v35;
  __int16 v36;
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v16 = (char *)a3;
  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread")
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("This operation must not be performed on the main thread."));
    *(_DWORD *)buf = 136315906;
    v31 = "-[FCPersonalizationData modifyLocalAggregatesForFeatureKeys:withAction:actionCount:defaultClicks:defaultImpres"
          "sions:impressionBias:groupBias:]";
    v32 = 2080;
    v33 = "FCPersonalizationData.m";
    v34 = 1024;
    v35 = 169;
    v36 = 2114;
    v37 = v26;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v17 = (void *)FCPersonalizationLog;
  if (os_log_type_enabled((os_log_t)FCPersonalizationLog, OS_LOG_TYPE_DEFAULT))
  {
    v18 = v17;
    NSStringFromFCPersonalizationAction(a4);
    v19 = (char *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v31 = v19;
    v32 = 2112;
    v33 = v16;
    _os_log_impl(&dword_1A1B90000, v18, OS_LOG_TYPE_DEFAULT, "Processing action %@ for features %@", buf, 0x16u);

  }
  v20 = objc_alloc_init(MEMORY[0x1E0D62768]);
  objc_msgSend(v20, "setDefaultClicks:", a6);
  objc_msgSend(v20, "setDefaultImpressions:", a7);
  objc_msgSend(v20, "setImpressionBias:", a8);
  objc_msgSend(v20, "setGroupBias:", a9);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setTimestamp:", objc_msgSend(v21, "fc_millisecondTimeIntervalSince1970"));

  objc_msgSend(v20, "addAction:count:", a4, a5);
  if (self)
    accessQueue = self->_accessQueue;
  else
    accessQueue = 0;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __142__FCPersonalizationData_modifyLocalAggregatesForFeatureKeys_withAction_actionCount_defaultClicks_defaultImpressions_impressionBias_groupBias___block_invoke;
  block[3] = &unk_1E463B228;
  block[4] = self;
  v23 = v16;
  v28 = v23;
  v24 = v20;
  v29 = v24;
  dispatch_sync(accessQueue, block);
  if (self)
    saveThrottler = self->_saveThrottler;
  else
    saveThrottler = 0;
  -[FCOperationThrottler tickle](saveThrottler, "tickle");

}

void __142__FCPersonalizationData_modifyLocalAggregatesForFeatureKeys_withAction_actionCount_defaultClicks_defaultImpressions_impressionBias_groupBias___block_invoke(uint64_t a1, const char *a2)
{
  id Property;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  Property = *(id *)(a1 + 32);
  if (Property)
    Property = objc_getProperty(Property, a2, 136, 1);
  v4 = Property;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v5 = *(id *)(a1 + 40);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v20;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v20 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v9);
        v11 = *(_QWORD *)(a1 + 32);
        if (v11)
          v12 = *(void **)(v11 + 112);
        else
          v12 = 0;
        objc_msgSend(v12, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v9), (_QWORD)v19);
        v13 = (id)objc_claimAutoreleasedReturnValue();
        if (!v13)
        {
          v13 = objc_alloc_init(MEMORY[0x1E0D62760]);
          objc_msgSend(v13, "setFeatureKey:", v10);
          v14 = *(_QWORD *)(a1 + 32);
          if (v14)
            v15 = *(void **)(v14 + 112);
          else
            v15 = 0;
          objc_msgSend(v15, "setObject:forKeyedSubscript:", v13, v10);
        }
        if ((objc_msgSend(*(id *)(a1 + 48), "applyToAggregate:withTreatment:", v13, v4) & 1) == 0
          && !objc_msgSend(v13, "eventCount")
          && (objc_msgSend(v10, "isEqualToString:", CFSTR("f0")) & 1) == 0)
        {
          v16 = *(_QWORD *)(a1 + 32);
          if (v16)
            v17 = *(void **)(v16 + 112);
          else
            v17 = 0;
          objc_msgSend(v17, "removeObjectForKey:", v10);
        }

        ++v9;
      }
      while (v7 != v9);
      v18 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      v7 = v18;
    }
    while (v18);
  }

}

- (void)clearPersonalizationData
{
  FCRemoveRecordsCommand *v3;
  void *v4;
  FCRemoveRecordsCommand *v5;
  NSObject *accessQueue;
  _QWORD block[5];

  objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
  v3 = [FCRemoveRecordsCommand alloc];
  objc_msgSend((id)objc_opt_class(), "backingRecordIDs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[FCRemoveRecordsCommand initWithRecordIDs:](v3, "initWithRecordIDs:", v4);

  -[FCPrivateDataController addCommandToCommandQueue:](self, "addCommandToCommandQueue:", v5);
  if (self)
    accessQueue = self->_accessQueue;
  else
    accessQueue = 0;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__FCPersonalizationData_clearPersonalizationData__block_invoke;
  block[3] = &unk_1E463AB18;
  block[4] = self;
  dispatch_async(accessQueue, block);

}

void __49__FCPersonalizationData_clearPersonalizationData__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    v3 = *(void **)(v2 + 112);
  else
    v3 = 0;
  objc_msgSend(v3, "removeAllObjects");
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
    objc_storeStrong((id *)(v4 + 120), 0);
}

- (id)d_allGlobalAggregates
{
  FCPersonalizationData *v2;
  void *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v2 = self;
  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__77;
  v10 = __Block_byref_object_dispose__77;
  v11 = 0;
  if (self)
    self = (FCPersonalizationData *)self->_accessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __46__FCPersonalizationData_d_allGlobalAggregates__block_invoke;
  v5[3] = &unk_1E463AD80;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(&self->super.super, v5);
  -[FCPersonalizationData aggregatesForFeatureKeys:](v2, "aggregatesForFeatureKeys:", v7[5]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __46__FCPersonalizationData_d_allGlobalAggregates__block_invoke(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  _QWORD *v6;

  v2 = *(_QWORD **)(a1 + 32);
  if (v2)
    v2 = (_QWORD *)v2[14];
  v6 = v2;
  objc_msgSend(v6, "allKeys");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (id)aggregateStore
{
  return -[FCReadonlyPersonalizationAggregateStore initWithGenerator:]([FCReadonlyPersonalizationAggregateStore alloc], "initWithGenerator:", self);
}

- (void)syncWithCompletion:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  objc_super v7;
  _QWORD v8[4];
  id v9;
  uint64_t v10;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  v8[1] = 3221225472;
  v8[2] = __44__FCPersonalizationData_syncWithCompletion___block_invoke;
  v8[3] = &unk_1E464A360;
  v10 = v5;
  v9 = v4;
  v7.receiver = self;
  v7.super_class = (Class)FCPersonalizationData;
  v8[0] = MEMORY[0x1E0C809B0];
  v6 = v4;
  -[FCPrivateDataController syncWithCompletion:](&v7, sel_syncWithCompletion_, v8);

}

void __44__FCPersonalizationData_syncWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  double v6;
  double v7;
  NSObject *v8;
  uint64_t v9;
  double v10;
  int v11;
  double v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  v7 = v6;
  v8 = FCPersonalizationLog;
  if (os_log_type_enabled((os_log_t)FCPersonalizationLog, OS_LOG_TYPE_DEBUG))
  {
    v10 = v7 - *(double *)(a1 + 40);
    v11 = 134217984;
    v12 = v10;
    _os_log_debug_impl(&dword_1A1B90000, v8, OS_LOG_TYPE_DEBUG, "took %.3fs to sync personalization data", (uint8_t *)&v11, 0xCu);
  }
  v9 = *(_QWORD *)(a1 + 32);
  if (v9)
    (*(void (**)(uint64_t, uint64_t, id))(v9 + 16))(v9, a2, v5);

}

+ (BOOL)requiresPushNotificationSupport
{
  return 0;
}

+ (BOOL)requiresBatchedSync
{
  return 0;
}

+ (id)backingRecordZoneIDs
{
  return (id)MEMORY[0x1E0C9AA60];
}

+ (id)backingRecordIDs
{
  void *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C95070]), "initWithRecordName:", CFSTR("SharedPersonalizationProfile"));
  v5[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)commandsToMergeLocalDataToCloud:(id)a3 privateDataDirectory:(id)a4
{
  return 0;
}

+ (id)desiredKeys
{
  _QWORD v3[3];

  v3[2] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("data");
  v3[1] = CFSTR("version");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t __49__FCPersonalizationData_loadLocalCachesFromStore__block_invoke_37(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "featureKey");
}

void __49__FCPersonalizationData_loadLocalCachesFromStore__block_invoke_41(uint64_t a1)
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "localStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("last-successful-download-date"));
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (!v6
    || (objc_msgSend(MEMORY[0x1E0C99D68], "date"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v3, "timeIntervalSinceDate:", v6),
        v5 = v4,
        v3,
        v5 > 86400.0))
  {
    objc_msgSend(*(id *)(a1 + 32), "markAsDirty");
  }

}

- (void)handleSyncWithChangedRecords:(id)a3 deletedRecordNames:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  NSObject *accessQueue;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  NSObject *v22;
  void *v23;
  void *v24;
  id v25;
  _QWORD v26[5];
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _QWORD block[6];
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v25 = a4;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v33;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v33 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
        objc_msgSend(v12, "recordID", v25);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "recordName");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "isEqualToString:", CFSTR("SharedPersonalizationProfile"));

        if (v15)
        {
          if (self)
            accessQueue = self->_accessQueue;
          else
            accessQueue = 0;
          block[0] = MEMORY[0x1E0C809B0];
          block[1] = 3221225472;
          block[2] = __73__FCPersonalizationData_handleSyncWithChangedRecords_deletedRecordNames___block_invoke;
          block[3] = &unk_1E463AD10;
          block[4] = v12;
          block[5] = self;
          dispatch_async(accessQueue, block);
          goto LABEL_13;
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
      if (v9)
        continue;
      break;
    }
  }
LABEL_13:

  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v17 = v25;
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v27, v36, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v28;
    while (2)
    {
      for (j = 0; j != v19; ++j)
      {
        if (*(_QWORD *)v28 != v20)
          objc_enumerationMutation(v17);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * j), "isEqualToString:", CFSTR("SharedPersonalizationProfile"), v25))
        {
          if (self)
            v22 = self->_accessQueue;
          else
            v22 = 0;
          v26[0] = MEMORY[0x1E0C809B0];
          v26[1] = 3221225472;
          v26[2] = __73__FCPersonalizationData_handleSyncWithChangedRecords_deletedRecordNames___block_invoke_2;
          v26[3] = &unk_1E463AB18;
          v26[4] = self;
          dispatch_async(v22, v26);
          goto LABEL_25;
        }
      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v27, v36, 16);
      if (v19)
        continue;
      break;
    }
  }
LABEL_25:

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCPrivateDataController localStore](self, "localStore");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setObject:forKeyedSubscript:", v23, CFSTR("last-successful-download-date"));

}

void __73__FCPersonalizationData_handleSyncWithChangedRecords_deletedRecordNames___block_invoke(uint64_t a1)
{
  id v2;

  +[FCModifyPersonalizationOperation personalizationProfileFromRecord:](FCModifyPersonalizationOperation, "personalizationProfileFromRecord:", *(_QWORD *)(a1 + 32));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  -[FCPersonalizationData _updateWithRemoteRecord:profile:](*(id **)(a1 + 40), *(void **)(a1 + 32), v2);

}

void __73__FCPersonalizationData_handleSyncWithChangedRecords_deletedRecordNames___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  id v3;

  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
  {
    if (*(_QWORD *)(v1 + 120))
    {
      +[FCModifyPersonalizationOperation personalizationProfileFromRecord:](FCModifyPersonalizationOperation, "personalizationProfileFromRecord:", 0);
      v3 = (id)objc_claimAutoreleasedReturnValue();
      -[FCPersonalizationData _updateWithRemoteRecord:profile:](*(id **)(a1 + 32), 0, v3);

    }
  }
}

id __43__FCPersonalizationData_localStoreMigrator__block_invoke(uint64_t a1, const char *a2)
{
  _QWORD *v3;
  const char *v4;
  void *v5;
  id Property;
  void *v8;
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD **)(a1 + 32);
  if (!v3)
    goto LABEL_11;
  if (!v3[16])
    goto LABEL_14;
  if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    goto LABEL_14;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("expected nil value for '%s'"), "self.accessQueue");
  *(_DWORD *)buf = 136315906;
  v10 = "-[FCPersonalizationData localStoreMigrator]_block_invoke";
  v11 = 2080;
  v12 = "FCPersonalizationData.m";
  v13 = 1024;
  v14 = 427;
  v15 = 2114;
  v16 = v8;
  _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  v3 = *(_QWORD **)(a1 + 32);
  if (v3)
  {
LABEL_14:
    if (objc_getProperty(v3, a2, 136, 1))
      goto LABEL_7;
    v5 = *(void **)(a1 + 32);
  }
  else
  {
LABEL_11:
    v5 = 0;
  }
  -[FCPersonalizationData _unsafeReloadTreatment](v5);
LABEL_7:
  Property = *(id *)(a1 + 32);
  if (Property)
    Property = objc_getProperty(Property, v4, 136, 1);
  return Property;
}

- (void)_unsafeReloadTreatment
{
  void *v2;
  void *v3;
  void *v4;
  SEL v5;
  id v6;

  if (a1)
  {
    objc_msgSend(a1, "context");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "configurationManager");
    v6 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "configuration");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "personalizationTreatment");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_setProperty_atomic(a1, v5, v4, 136);

  }
}

- (BOOL)canHelpRestoreZoneName:(id)a3
{
  return objc_msgSend(a3, "isEqualToString:", *MEMORY[0x1E0C94A30]);
}

- (id)recordsForRestoringZoneName:(id)a3
{
  id v4;
  NSObject *accessQueue;
  void *v6;
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__77;
  v13 = __Block_byref_object_dispose__77;
  v14 = 0;
  if (self)
    accessQueue = self->_accessQueue;
  else
    accessQueue = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __53__FCPersonalizationData_recordsForRestoringZoneName___block_invoke;
  v8[3] = &unk_1E463AD80;
  v8[4] = self;
  v8[5] = &v9;
  dispatch_sync(accessQueue, v8);
  if (v10[5])
  {
    v15[0] = v10[5];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = (void *)MEMORY[0x1E0C9AA60];
  }
  _Block_object_dispose(&v9, 8);

  return v6;
}

void __53__FCPersonalizationData_recordsForRestoringZoneName___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
    v2 = *(void **)(v1 + 120);
  else
    v2 = 0;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v2);
}

- (void)_writeToLocalStoreWithCompletionHandler:(uint64_t)a1
{
  id v3;
  void *v4;
  NSObject *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  uint64_t v14;
  id v15;
  void *v16;
  _QWORD v17[5];
  id v18;
  id v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  char *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1)
  {
    v4 = (void *)FCPersonalizationDataAccessUnique;
    if (dispatch_get_specific((const void *)FCPersonalizationDataAccessUnique) != v4
      && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("accessing protected data from outside the queue"));
      *(_DWORD *)buf = 136315906;
      v21 = "-[FCPersonalizationData _writeToLocalStoreWithCompletionHandler:]";
      v22 = 2080;
      v23 = "FCPersonalizationData.m";
      v24 = 1024;
      v25 = 489;
      v26 = 2114;
      v27 = v16;
      _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    }
    v5 = FCPersonalizationLog;
    if (os_log_type_enabled((os_log_t)FCPersonalizationLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A1B90000, v5, OS_LOG_TYPE_DEFAULT, "will generate personalization data for disk", buf, 2u);
    }
    v6 = objc_alloc_init(MEMORY[0x1E0D62778]);
    objc_msgSend(*(id *)(a1 + 112), "allValues");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "mutableCopy");
    objc_msgSend(v6, "setAggregates:", v8);

    objc_msgSend(v6, "setRemoteRecord:", *(_QWORD *)(a1 + 120));
    FCDeviceIdentifierForVendor();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setCurrentInstanceIdentifier:", v9);

    objc_msgSend(v6, "data");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)FCPersonalizationLog;
    if (os_log_type_enabled((os_log_t)FCPersonalizationLog, OS_LOG_TYPE_DEFAULT))
    {
      v12 = *(id *)(a1 + 112);
      v13 = v11;
      v14 = objc_msgSend(v12, "count");
      *(_DWORD *)buf = 134217984;
      v21 = (const char *)v14;
      _os_log_impl(&dword_1A1B90000, v13, OS_LOG_TYPE_DEFAULT, "did generate personalization data for disk with %lu aggregates", buf, 0xCu);

    }
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __65__FCPersonalizationData__writeToLocalStoreWithCompletionHandler___block_invoke;
    v17[3] = &unk_1E463CCB8;
    v17[4] = a1;
    v18 = v10;
    v19 = v3;
    v15 = v10;
    FCPerformBlockOnMainThread(v17);

  }
}

uint64_t __65__FCPersonalizationData__writeToLocalStoreWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  v2 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "localStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v2, CFSTR("pb-data"));

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (void)_applicationDidEnterBackground
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  int v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  char v16;
  char v17;
  void *v18;
  void *v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  id v23;
  void *v24;
  NSObject *v25;
  id v26;
  _QWORD block[5];
  id v28;
  char v29;
  _QWORD aBlock[4];
  id v31;
  uint64_t v32;
  uint64_t *v33;
  char v34;
  _QWORD v35[4];
  id v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t v41;

  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
    objc_msgSend((id)a1, "localStore");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("last-successful-download-date"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend((id)a1, "context");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "networkReachability");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "isNetworkReachable")
      && objc_msgSend((id)a1, "isSyncingEnabled")
      && v3)
    {
      v6 = *(_BYTE *)(a1 + 96);

      if ((v6 & 1) != 0)
        goto LABEL_15;
      objc_msgSend((id)a1, "localStore");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("last-successful-upload-date"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "BOOLForKey:", CFSTR("upload_personalization_data_often"));

      if (!v4
        || (!v9 ? (v10 = 3600.0) : (v10 = 0.0),
            objc_msgSend(MEMORY[0x1E0C99D68], "date"),
            v11 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend(v11, "timeIntervalSinceDate:", v4),
            v13 = v12,
            v11,
            v13 >= v10))
      {
        objc_msgSend((id)a1, "localStore");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("below-minimum-version"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "BOOLValue");

        if ((v16 & 1) == 0)
        {
          v17 = 1;
          *(_BYTE *)(a1 + 96) = 1;
LABEL_16:
          objc_msgSend((id)a1, "context");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "backgroundTaskable");
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          v38 = 0;
          v39 = &v38;
          v40 = 0x2020000000;
          v41 = 0;
          v20 = MEMORY[0x1E0C809B0];
          v35[0] = MEMORY[0x1E0C809B0];
          v35[1] = 3221225472;
          v35[2] = __55__FCPersonalizationData__applicationDidEnterBackground__block_invoke;
          v35[3] = &unk_1E463DF90;
          v21 = v19;
          v36 = v21;
          v37 = &v38;
          v22 = objc_msgSend(v21, "fc_beginBackgroundTaskWithName:expirationHandler:", CFSTR("Personalization Upload"), v35);
          v39[3] = v22;
          aBlock[0] = v20;
          aBlock[1] = 3221225472;
          aBlock[2] = __55__FCPersonalizationData__applicationDidEnterBackground__block_invoke_2;
          aBlock[3] = &unk_1E464A3A8;
          v32 = a1;
          v33 = &v38;
          v34 = v17;
          v31 = v21;
          v23 = v21;
          v24 = _Block_copy(aBlock);
          v25 = *(NSObject **)(a1 + 128);
          block[0] = v20;
          block[1] = 3221225472;
          block[2] = __55__FCPersonalizationData__applicationDidEnterBackground__block_invoke_4;
          block[3] = &unk_1E463E708;
          v29 = v17;
          block[4] = a1;
          v28 = v24;
          v26 = v24;
          dispatch_async(v25, block);

          _Block_object_dispose(&v38, 8);
          return;
        }
LABEL_15:
        v17 = 0;
        goto LABEL_16;
      }
    }
    else
    {

    }
    goto LABEL_15;
  }
}

uint64_t __55__FCPersonalizationData__applicationDidEnterBackground__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "fc_endBackgroundTask:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
}

void __55__FCPersonalizationData__applicationDidEnterBackground__block_invoke_2(uint64_t a1)
{
  _QWORD v2[4];
  id v3;
  __int128 v4;
  char v5;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __55__FCPersonalizationData__applicationDidEnterBackground__block_invoke_3;
  v2[3] = &unk_1E464A3A8;
  v3 = *(id *)(a1 + 32);
  v5 = *(_BYTE *)(a1 + 56);
  v4 = *(_OWORD *)(a1 + 40);
  dispatch_async(MEMORY[0x1E0C80D38], v2);

}

uint64_t __55__FCPersonalizationData__applicationDidEnterBackground__block_invoke_3(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;

  result = objc_msgSend(*(id *)(a1 + 32), "fc_endBackgroundTask:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24));
  if (*(_BYTE *)(a1 + 56))
  {
    v3 = *(_QWORD *)(a1 + 40);
    if (v3)
      *(_BYTE *)(v3 + 96) = 0;
  }
  return result;
}

void __55__FCPersonalizationData__applicationDidEnterBackground__block_invoke_4(uint64_t a1, const char *a2)
{
  id Property;
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  uint64_t v8;
  id v9;
  id v10;
  char v11;

  Property = *(id *)(a1 + 32);
  if (Property)
    Property = objc_getProperty(Property, a2, 136, 1);
  v4 = Property;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __55__FCPersonalizationData__applicationDidEnterBackground__block_invoke_5;
  v7[3] = &unk_1E4647000;
  v11 = *(_BYTE *)(a1 + 48);
  v5 = *(void **)(a1 + 40);
  v8 = *(_QWORD *)(a1 + 32);
  v9 = v4;
  v10 = v5;
  v6 = v4;
  -[FCPersonalizationData _writeToLocalStoreWithCompletionHandler:](v8, v7);

}

void __55__FCPersonalizationData__applicationDidEnterBackground__block_invoke_5(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[5];
  id v5;
  id v6;
  char v7;

  objc_msgSend(*(id *)(a1 + 32), "localStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[2] = __55__FCPersonalizationData__applicationDidEnterBackground__block_invoke_6;
  v4[3] = &unk_1E4647000;
  v7 = *(_BYTE *)(a1 + 56);
  v3 = *(void **)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  v4[1] = 3221225472;
  v5 = v3;
  v6 = *(id *)(a1 + 48);
  objc_msgSend(v2, "saveWithCompletionHandler:", v4);

}

void __55__FCPersonalizationData__applicationDidEnterBackground__block_invoke_6(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  _QWORD block[5];
  id v5;
  id v6;

  if (*(_BYTE *)(a1 + 56))
  {
    v2 = *(_QWORD *)(a1 + 32);
    if (v2)
      v3 = *(NSObject **)(v2 + 128);
    else
      v3 = 0;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __55__FCPersonalizationData__applicationDidEnterBackground__block_invoke_7;
    block[3] = &unk_1E463CCB8;
    block[4] = v2;
    v5 = *(id *)(a1 + 40);
    v6 = *(id *)(a1 + 48);
    dispatch_async(v3, block);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
}

void __55__FCPersonalizationData__applicationDidEnterBackground__block_invoke_7(uint64_t a1)
{
  FCModifyPersonalizationOperation *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, void *, void *, void *);
  void *v14;
  uint64_t v15;
  id v16;

  v2 = objc_alloc_init(FCModifyPersonalizationOperation);
  objc_msgSend(*(id *)(a1 + 32), "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "internalPrivateDataContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "privateDatabase");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCModifyPersonalizationOperation setDatabase:](v2, "setDatabase:", v5);

  v6 = *(_QWORD *)(a1 + 32);
  if (v6)
    v7 = *(_QWORD *)(v6 + 112);
  else
    v7 = 0;
  -[FCModifyPersonalizationOperation setAggregates:](v2, "setAggregates:", v7);
  -[FCModifyPersonalizationOperation setTreatment:](v2, "setTreatment:", *(_QWORD *)(a1 + 40));
  v8 = *(_QWORD *)(a1 + 32);
  if (v8)
    v9 = *(_QWORD *)(v8 + 120);
  else
    v9 = 0;
  -[FCModifyPersonalizationOperation setRemoteRecord:](v2, "setRemoteRecord:", v9);
  v11 = MEMORY[0x1E0C809B0];
  v12 = 3221225472;
  v13 = __55__FCPersonalizationData__applicationDidEnterBackground__block_invoke_8;
  v14 = &unk_1E464A3D0;
  v15 = *(_QWORD *)(a1 + 32);
  v16 = *(id *)(a1 + 48);
  -[FCModifyPersonalizationOperation setSaveCompletionHandler:](v2, "setSaveCompletionHandler:", &v11);
  objc_msgSend(MEMORY[0x1E0CB3828], "fc_sharedConcurrentQueue", v11, v12, v13, v14, v15);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addOperation:", v2);

}

void __55__FCPersonalizationData__applicationDidEnterBackground__block_invoke_8(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  _QWORD v13[5];
  _QWORD v14[5];
  id v15;
  id v16;
  id v17;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (!v7 || !v8)
  {
    objc_msgSend(v9, "domain");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "isEqualToString:", CFSTR("FCErrorDomain")))
    {
      v12 = objc_msgSend(v10, "code");

      if (v12 == 6)
      {
        v13[0] = MEMORY[0x1E0C809B0];
        v13[1] = 3221225472;
        v13[2] = __55__FCPersonalizationData__applicationDidEnterBackground__block_invoke_12;
        v13[3] = &unk_1E463AB18;
        v13[4] = *(_QWORD *)(a1 + 32);
        FCPerformBlockOnMainThread(v13);
        goto LABEL_9;
      }
    }
    else
    {

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    goto LABEL_9;
  }
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __55__FCPersonalizationData__applicationDidEnterBackground__block_invoke_9;
  v14[3] = &unk_1E4646E50;
  v14[4] = *(_QWORD *)(a1 + 32);
  v15 = v8;
  v16 = v7;
  v17 = *(id *)(a1 + 40);
  FCPerformBlockOnMainThread(v14);

LABEL_9:
}

void __55__FCPersonalizationData__applicationDidEnterBackground__block_invoke_9(id *a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  _QWORD v7[5];
  id v8;
  id v9;
  id v10;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[4], "localStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v2, CFSTR("last-successful-download-date"));

  objc_msgSend(a1[4], "localStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v2, CFSTR("last-successful-upload-date"));

  v5 = a1[4];
  if (v5)
    v6 = *((_QWORD *)v5 + 16);
  else
    v6 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __55__FCPersonalizationData__applicationDidEnterBackground__block_invoke_10;
  v7[3] = &unk_1E4646E50;
  v7[4] = v5;
  v8 = a1[5];
  v9 = a1[6];
  v10 = a1[7];
  dispatch_async(v6, v7);

}

void __55__FCPersonalizationData__applicationDidEnterBackground__block_invoke_10(uint64_t a1)
{
  uint64_t v2;
  _QWORD v3[5];
  id v4;

  -[FCPersonalizationData _updateWithRemoteRecord:profile:](*(id **)(a1 + 32), *(void **)(a1 + 40), *(void **)(a1 + 48));
  v2 = *(_QWORD *)(a1 + 32);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __55__FCPersonalizationData__applicationDidEnterBackground__block_invoke_11;
  v3[3] = &unk_1E463B790;
  v3[4] = v2;
  v4 = *(id *)(a1 + 56);
  -[FCPersonalizationData _writeToLocalStoreWithCompletionHandler:](v2, v3);

}

void __55__FCPersonalizationData__applicationDidEnterBackground__block_invoke_11(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "localStore");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "saveWithCompletionHandler:", *(_QWORD *)(a1 + 40));

}

void __55__FCPersonalizationData__applicationDidEnterBackground__block_invoke_12(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "localStore");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("below-minimum-version"));

}

void __48__FCPersonalizationData__saveReadableAggregates__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v5 = a2;
  objc_msgSend(a3, "dictionaryRepresentation");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v6, v5);

}

void __48__FCPersonalizationData__saveReadableAggregates__block_invoke_3(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = FCPersonalizationLog;
  if (os_log_type_enabled((os_log_t)FCPersonalizationLog, OS_LOG_TYPE_ERROR))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = 138412290;
    v5 = v3;
    _os_log_error_impl(&dword_1A1B90000, v2, OS_LOG_TYPE_ERROR, "Error when saving readable aggregates: %@", (uint8_t *)&v4, 0xCu);
  }
}

- (void)activityObservingApplicationWindowDidBecomeBackground
{
  objc_super v3;

  -[FCPersonalizationData _applicationDidEnterBackground]((uint64_t)self);
  if (objc_msgSend((id)-[FCPersonalizationData superclass](self, "superclass"), "instancesRespondToSelector:", sel_activityObservingApplicationWindowDidBecomeBackground))
  {
    v3.receiver = self;
    v3.super_class = (Class)FCPersonalizationData;
    -[FCPersonalizationData activityObservingApplicationWindowDidBecomeBackground](&v3, sel_activityObservingApplicationWindowDidBecomeBackground);
  }
}

- (void)activityObservingApplicationWillTerminate
{
  objc_super v3;

  -[FCPersonalizationData _applicationDidEnterBackground]((uint64_t)self);
  if (objc_msgSend((id)-[FCPersonalizationData superclass](self, "superclass"), "instancesRespondToSelector:", sel_activityObservingApplicationWillTerminate))
  {
    v3.receiver = self;
    v3.super_class = (Class)FCPersonalizationData;
    -[FCPersonalizationData activityObservingApplicationWillTerminate](&v3, sel_activityObservingApplicationWillTerminate);
  }
}

- (id)aggregatesForFeatureKeys:(id)a3
{
  id v4;
  NSObject *accessQueue;
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
  v15 = __Block_byref_object_copy__77;
  v16 = __Block_byref_object_dispose__77;
  v17 = 0;
  if (self)
    accessQueue = self->_accessQueue;
  else
    accessQueue = 0;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__FCPersonalizationData_aggregatesForFeatureKeys___block_invoke;
  block[3] = &unk_1E463AD58;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(accessQueue, block);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __50__FCPersonalizationData_aggregatesForFeatureKeys___block_invoke(_QWORD *a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  _QWORD *v7;

  v2 = (_QWORD *)a1[4];
  if (v2)
    v2 = (_QWORD *)v2[14];
  v3 = a1[5];
  v7 = v2;
  objc_msgSend(v7, "fc_subdictionaryWithCopiesForKeys:", v3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1[6] + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

- (void)enumerateAggregatesUsingBlock:(id)a3
{
  id v4;
  NSObject *accessQueue;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  _QWORD block[6];
  _BYTE buf[24];
  __int128 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread")
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("This operation must not be performed on the main thread."));
    *(_DWORD *)buf = 136315906;
    *(_QWORD *)&buf[4] = "-[FCPersonalizationData enumerateAggregatesUsingBlock:]";
    *(_WORD *)&buf[12] = 2080;
    *(_QWORD *)&buf[14] = "FCPersonalizationData.m";
    *(_WORD *)&buf[22] = 1024;
    LODWORD(v14) = 728;
    WORD2(v14) = 2114;
    *(_QWORD *)((char *)&v14 + 6) = v9;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  *(_QWORD *)&v14 = __Block_byref_object_copy__77;
  *((_QWORD *)&v14 + 1) = __Block_byref_object_dispose__77;
  v15 = 0;
  if (self)
    accessQueue = self->_accessQueue;
  else
    accessQueue = 0;
  v6 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__FCPersonalizationData_enumerateAggregatesUsingBlock___block_invoke;
  block[3] = &unk_1E463AD80;
  block[4] = self;
  block[5] = buf;
  dispatch_sync(accessQueue, block);
  v7 = *(void **)(*(_QWORD *)&buf[8] + 40);
  v10[0] = v6;
  v10[1] = 3221225472;
  v10[2] = __55__FCPersonalizationData_enumerateAggregatesUsingBlock___block_invoke_2;
  v10[3] = &unk_1E464A420;
  v8 = v4;
  v11 = v8;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v10);

  _Block_object_dispose(buf, 8);
}

void __55__FCPersonalizationData_enumerateAggregatesUsingBlock___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  v2 = *(_QWORD **)(a1 + 32);
  if (v2)
    v2 = (_QWORD *)v2[14];
  v3 = v2;
  objc_msgSend(v3, "allValues");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v7, "copy");
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

uint64_t __55__FCPersonalizationData_enumerateAggregatesUsingBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)aggregateForFeatureKey:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v4 = (void *)MEMORY[0x1E0C99D20];
  v5 = a3;
  objc_msgSend(v4, "arrayWithObjects:count:", &v11, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[FCPersonalizationData aggregatesForFeatureKeys:](self, "aggregatesForFeatureKeys:", v6, v11, v12);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "allValues");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)configurationManager:(id)a3 configurationDidChange:(id)a4
{
  NSObject *accessQueue;
  _QWORD block[5];

  if (self)
    accessQueue = self->_accessQueue;
  else
    accessQueue = 0;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __69__FCPersonalizationData_configurationManager_configurationDidChange___block_invoke;
  block[3] = &unk_1E463AB18;
  block[4] = self;
  dispatch_async(accessQueue, block);
}

void __69__FCPersonalizationData_configurationManager_configurationDidChange___block_invoke(uint64_t a1)
{
  -[FCPersonalizationData _reloadTreatment](*(void **)(a1 + 32));
}

- (void)operationThrottler:(id)a3 performAsyncOperationWithCompletion:(id)a4
{
  id v5;
  NSObject *accessQueue;
  id v7;
  void *v8;
  _QWORD v9[5];
  id v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread")
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("This operation must not be performed on the main thread."));
    *(_DWORD *)buf = 136315906;
    v12 = "-[FCPersonalizationData operationThrottler:performAsyncOperationWithCompletion:]";
    v13 = 2080;
    v14 = "FCPersonalizationData.m";
    v15 = 1024;
    v16 = 761;
    v17 = 2114;
    v18 = v8;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (self)
      goto LABEL_4;
LABEL_7:
    accessQueue = 0;
    goto LABEL_5;
  }
  if (!self)
    goto LABEL_7;
LABEL_4:
  accessQueue = self->_accessQueue;
LABEL_5:
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __80__FCPersonalizationData_operationThrottler_performAsyncOperationWithCompletion___block_invoke;
  v9[3] = &unk_1E463B790;
  v9[4] = self;
  v10 = v5;
  v7 = v5;
  dispatch_sync(accessQueue, v9);

}

void __80__FCPersonalizationData_operationThrottler_performAsyncOperationWithCompletion___block_invoke(uint64_t a1)
{
  -[FCPersonalizationData _writeToLocalStoreWithCompletionHandler:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40));
}

id __63__FCPersonalizationData_configureKeyValueStoreForJSONHandling___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  id v7;
  int v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  int v13;
  void *v14;
  void *v15;
  void *v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  char *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v5 = a3;
  objc_opt_class();
  if (v4)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v4;
    else
      v6 = 0;
  }
  else
  {
    v6 = 0;
  }
  v7 = v6;
  v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("pb-data"));

  if (v8)
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D62778]), "initWithData:", v5);
    if (!v9 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("invalid nil value for '%s'"), "localPersonalizationData");
      *(_DWORD *)buf = 136315906;
      v19 = "+[FCPersonalizationData configureKeyValueStoreForJSONHandling:]_block_invoke";
      v20 = 2080;
      v21 = "FCPersonalizationData.m";
      v22 = 1024;
      v23 = 780;
      v24 = 2114;
      v25 = v17;
      _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    }
    objc_msgSend(v9, "dictionaryRepresentation");
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_opt_class();
    if (v4)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v11 = v4;
      else
        v11 = 0;
    }
    else
    {
      v11 = 0;
    }
    v12 = v11;
    v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("remote_record_data"));

    if (!v13)
    {
      v10 = v5;
      goto LABEL_20;
    }
    objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v5, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("data"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D62780]), "initWithData:", v14);
    objc_msgSend(v15, "dictionaryRepresentation");
    v10 = (id)objc_claimAutoreleasedReturnValue();

  }
LABEL_20:

  return v10;
}

- (void)updateAggregatesWith:(id)a3 creationBlock:(id)a4 updateBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *accessQueue;
  id v12;
  id v13;
  id v14;
  _QWORD block[4];
  id v16;
  FCPersonalizationData *v17;
  id v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (self)
    accessQueue = self->_accessQueue;
  else
    accessQueue = 0;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __72__FCPersonalizationData_updateAggregatesWith_creationBlock_updateBlock___block_invoke;
  block[3] = &unk_1E464A470;
  v16 = v8;
  v17 = self;
  v18 = v9;
  v19 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_sync(accessQueue, block);

}

void __72__FCPersonalizationData_updateAggregatesWith_creationBlock_updateBlock___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[5];
  id v4;
  id v5;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __72__FCPersonalizationData_updateAggregatesWith_creationBlock_updateBlock___block_invoke_2;
  v3[3] = &unk_1E464A448;
  v2 = *(void **)(a1 + 32);
  v3[4] = *(_QWORD *)(a1 + 40);
  v4 = *(id *)(a1 + 48);
  v5 = *(id *)(a1 + 56);
  objc_msgSend(v2, "enumerateObjectsUsingBlock:", v3);

}

void __72__FCPersonalizationData_updateAggregatesWith_creationBlock_updateBlock___block_invoke_2(_QWORD *a1, void *a2)
{
  id v3;
  _QWORD *v4;
  _QWORD *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  _QWORD v15[5];
  uint8_t buf[4];
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (_QWORD *)a1[4];
  if (v4)
    v4 = (_QWORD *)v4[14];
  v5 = v4;
  objc_msgSend(v5, "objectForKeyedSubscript:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 || (v8 = a1[5]) == 0)
  {
    v7 = v6;
  }
  else
  {
    (*(void (**)(uint64_t, id))(v8 + 16))(v8, v3);
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = v7;

  if (v9)
  {
    v10 = v9;
    v11 = FCPersonalizationLog;
    if (os_log_type_enabled((os_log_t)FCPersonalizationLog, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v17 = v10;
      _os_log_debug_impl(&dword_1A1B90000, v11, OS_LOG_TYPE_DEBUG, "Updating aggregate %@", buf, 0xCu);
    }
    (*(void (**)(void))(a1[6] + 16))();
    v12 = FCPersonalizationLog;
    if (os_log_type_enabled((os_log_t)FCPersonalizationLog, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v17 = v10;
      _os_log_debug_impl(&dword_1A1B90000, v12, OS_LOG_TYPE_DEBUG, "Updated aggregate %@", buf, 0xCu);
    }
    v13 = a1[4];
    if (v13)
      v14 = *(void **)(v13 + 112);
    else
      v14 = 0;
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v10, v3);

  }
  else
  {
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __72__FCPersonalizationData_updateAggregatesWith_creationBlock_updateBlock___block_invoke_3;
    v15[3] = &unk_1E463AB18;
    v15[4] = v3;
    __72__FCPersonalizationData_updateAggregatesWith_creationBlock_updateBlock___block_invoke_3((uint64_t)v15);
  }

}

void __72__FCPersonalizationData_updateAggregatesWith_creationBlock_updateBlock___block_invoke_3(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = FCPersonalizationLog;
  if (os_log_type_enabled((os_log_t)FCPersonalizationLog, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = 138412290;
    v5 = v3;
    _os_log_impl(&dword_1A1B90000, v2, OS_LOG_TYPE_DEFAULT, "Ignoring update for aggregate %@ because it doesn't exist already and this update didn't specify the option to create the aggregate", (uint8_t *)&v4, 0xCu);
  }
}

- (id)lookupAggregatesWith:(id)a3 creationBlock:(id)a4
{
  id v6;
  id v7;
  NSObject *accessQueue;
  id v9;
  id v10;
  id v11;
  _QWORD v13[4];
  id v14;
  FCPersonalizationData *v15;
  id v16;
  uint64_t *v17;
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
  v21 = __Block_byref_object_copy__77;
  v22 = __Block_byref_object_dispose__77;
  v23 = 0;
  if (self)
    accessQueue = self->_accessQueue;
  else
    accessQueue = 0;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __60__FCPersonalizationData_lookupAggregatesWith_creationBlock___block_invoke;
  v13[3] = &unk_1E464A4C0;
  v14 = v6;
  v15 = self;
  v16 = v7;
  v17 = &v18;
  v9 = v7;
  v10 = v6;
  dispatch_sync(accessQueue, v13);
  v11 = (id)v19[5];

  _Block_object_dispose(&v18, 8);
  return v11;
}

void __60__FCPersonalizationData_lookupAggregatesWith_creationBlock___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  uint64_t v11;
  id v12;

  v2 = (void *)MEMORY[0x1E0C99D80];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __60__FCPersonalizationData_lookupAggregatesWith_creationBlock___block_invoke_2;
  v9[3] = &unk_1E4648058;
  v3 = *(id *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5 = *(void **)(a1 + 48);
  v10 = v3;
  v11 = v4;
  v12 = v5;
  objc_msgSend(v2, "fc_dictionary:", v9);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

}

void __60__FCPersonalizationData_lookupAggregatesWith_creationBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;
  id v10;

  v3 = a2;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __60__FCPersonalizationData_lookupAggregatesWith_creationBlock___block_invoke_3;
  v7[3] = &unk_1E464A498;
  v5 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v8 = v3;
  v9 = v4;
  v10 = *(id *)(a1 + 48);
  v6 = v3;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v7);

}

void __60__FCPersonalizationData_lookupAggregatesWith_creationBlock___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  _QWORD *v4;
  _QWORD *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  v3 = a2;
  v4 = *(_QWORD **)(a1 + 40);
  v9 = v3;
  if (v4)
    v4 = (_QWORD *)v4[14];
  v5 = v4;
  objc_msgSend(v5, "objectForKeyedSubscript:", v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 || (v7 = *(_QWORD *)(a1 + 48)) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v6, v9);
  }
  else
  {
    (*(void (**)(uint64_t, id))(v7 + 16))(v7, v9);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v8, v9);

  }
}

- (id)createAggregateWith:(id)a3 clicks:(double)a4 impressions:(double)a5
{
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = (void *)objc_opt_new();
  objc_msgSend(v8, "setFeatureKey:", v7);

  objc_msgSend(v8, "setClicks:", a4);
  objc_msgSend(v8, "setImpressions:", a5);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTimestamp:", objc_msgSend(v9, "fc_millisecondTimeIntervalSince1970"));

  v10 = FCPersonalizationLog;
  if (os_log_type_enabled((os_log_t)FCPersonalizationLog, OS_LOG_TYPE_DEBUG))
  {
    v12 = 138412290;
    v13 = v8;
    _os_log_debug_impl(&dword_1A1B90000, v10, OS_LOG_TYPE_DEBUG, "Created personalization aggregate %@", (uint8_t *)&v12, 0xCu);
  }
  return v8;
}

- (NSDictionary)allAggregates
{
  NSObject *accessQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__77;
  v10 = __Block_byref_object_dispose__77;
  v11 = 0;
  if (self)
    accessQueue = self->_accessQueue;
  else
    accessQueue = 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __38__FCPersonalizationData_allAggregates__block_invoke;
  v5[3] = &unk_1E463AD80;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSDictionary *)v3;
}

void __38__FCPersonalizationData_allAggregates__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[5];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __38__FCPersonalizationData_allAggregates__block_invoke_2;
  v5[3] = &unk_1E463AA78;
  v5[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0C99D80], "fc_dictionary:", v5);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __38__FCPersonalizationData_allAggregates__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
    v5 = *(void **)(v4 + 112);
  else
    v5 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __38__FCPersonalizationData_allAggregates__block_invoke_3;
  v7[3] = &unk_1E463B520;
  v8 = v3;
  v6 = v3;
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v7);

}

void __38__FCPersonalizationData_allAggregates__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v5 = a2;
  v6 = (id)objc_msgSend(a3, "copy");
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v6, v5);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_saveThrottler, 0);
  objc_storeStrong((id *)&self->_treatment, 0);
  objc_storeStrong((id *)&self->_accessQueue, 0);
  objc_storeStrong((id *)&self->_remoteRecord, 0);
  objc_storeStrong((id *)&self->_aggregates, 0);
  objc_storeStrong((id *)&self->_pbData, 0);
}

- (id)baselineAggregateWithConfigurableValues:(id)a3
{
  return FCPersonalizationAggregateBaselineAggregateWithConfigurableValues(self, a3);
}

- (id)aggregatesForFeatures:(id)a3
{
  return FCPersonalizationAggregateAggregatesForFeatures(self, a3);
}

- (void)updateFeatures:(id)a3 withAction:(unint64_t)a4 displayRank:(int64_t)a5 groupRank:(int64_t)a6 groupType:(int64_t)a7 individually:(BOOL)a8 configurableValues:(id)a9
{
  id v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  double v30;
  double v31;
  uint64_t v32;
  double v33;
  void *v34;
  void *v35;
  void *v36;
  double v37;
  double v38;
  double v39;
  _BOOL4 v43;
  id v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  void *v51;
  uint8_t buf[4];
  const char *v53;
  __int16 v54;
  char *v55;
  __int16 v56;
  int v57;
  __int16 v58;
  void *v59;
  _BYTE v60[128];
  uint64_t v61;

  v43 = a8;
  v61 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v46 = a9;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v12 = v9;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v47, v60, 16);
  if (v13)
  {
    v14 = v13;
    v15 = MEMORY[0x1E0C81028];
    v16 = *(_QWORD *)v48;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v48 != v16)
          objc_enumerationMutation(v12);
        v18 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * v17);
        objc_msgSend(v18, "personalizationIdentifier");
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        if (v19)
        {
          objc_msgSend(v10, "addObject:", v18);
          objc_msgSend(v18, "personalizationIdentifier");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "addObject:", v20);
LABEL_8:

          goto LABEL_10;
        }
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Found a personalization feature without a personalization identifier"));
          *(_DWORD *)buf = 136315906;
          v53 = "-[FCPersonalizationData(FCPersonalizationAggregate) updateFeatures:withAction:displayRank:groupRank:grou"
                "pType:individually:configurableValues:]";
          v54 = 2080;
          v55 = "FCPersonalizationAggregate.m";
          v56 = 1024;
          v57 = 347;
          v58 = 2114;
          v59 = v20;
          _os_log_error_impl(&dword_1A1B90000, v15, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
          goto LABEL_8;
        }
LABEL_10:
        ++v17;
      }
      while (v14 != v17);
      v21 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v47, v60, 16);
      v14 = v21;
    }
    while (v21);
  }

  +[FCBaselineFeature baselineFeature](FCBaselineFeature, "baselineFeature");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "personalizationIdentifier");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCPersonalizationData aggregateForFeatureKey:](self, "aggregateForFeatureKey:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v24)
  {
    FCPersonalizationAggregateDefaultBaselineAggregateWithConfigurableValues(v46);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v25 = FCPersonalizationAggregateImpressionBiasForAction(a4, a5, a6, v46);
  v26 = FCPersonalizationAggregateGroupBiasForGroupType(a7, v46);
  objc_msgSend(v46, "featureImpressionPrior");
  v28 = v27;
  objc_msgSend(v46, "defaultScoringConfig");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "decayFactor");
  objc_msgSend(v24, "personalizationValueWithBaseline:decayRate:", 0);
  v31 = v28 * v30;
  objc_msgSend(v46, "featureImpressionPrior");
  v32 = 1;
  -[FCPersonalizationData modifyLocalAggregatesForFeatureKeys:withAction:actionCount:defaultClicks:defaultImpressions:impressionBias:groupBias:](self, "modifyLocalAggregatesForFeatureKeys:withAction:actionCount:defaultClicks:defaultImpressions:impressionBias:groupBias:", v11, a4, 1, v31, v33, v25, v26);

  +[FCBaselineFeature baselineFeature](FCBaselineFeature, "baselineFeature");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "personalizationIdentifier");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = v35;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v51, 1);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  if (v43)
    v32 = objc_msgSend(v11, "count");
  objc_msgSend(v24, "clicks");
  v38 = v37;
  objc_msgSend(v24, "impressions");
  -[FCPersonalizationData modifyLocalAggregatesForFeatureKeys:withAction:actionCount:defaultClicks:defaultImpressions:impressionBias:groupBias:](self, "modifyLocalAggregatesForFeatureKeys:withAction:actionCount:defaultClicks:defaultImpressions:impressionBias:groupBias:", v36, a4, v32, v38, v39, v25, v26);

}

- (void)prepareAggregatesForUseWithCompletionHandler:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __98__FCPersonalizationData_FCPersonalizationAggregate__prepareAggregatesForUseWithCompletionHandler___block_invoke;
  v6[3] = &unk_1E463F9C8;
  v7 = v4;
  v5 = v4;
  -[FCPrivateDataController performFirstSyncWithCallbackQueue:completion:](self, "performFirstSyncWithCallbackQueue:completion:", MEMORY[0x1E0C80D38], v6);

}

uint64_t __98__FCPersonalizationData_FCPersonalizationAggregate__prepareAggregatesForUseWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)d_allResults:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __77__FCPersonalizationData_FCPersonalizationAggregate__d_allResults_completion___block_invoke;
  v10[3] = &unk_1E464ABC8;
  v10[4] = self;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[FCPrivateDataController forceSyncWithCompletion:](self, "forceSyncWithCompletion:", v10);

}

void __77__FCPersonalizationData_FCPersonalizationAggregate__d_allResults_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  id v3;
  _QWORD block[5];
  id v5;
  id v6;

  dispatch_get_global_queue(9, 0);
  v2 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __77__FCPersonalizationData_FCPersonalizationAggregate__d_allResults_completion___block_invoke_2;
  block[3] = &unk_1E464ABA0;
  v3 = *(id *)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  v6 = *(id *)(a1 + 48);
  dispatch_async(v2, block);

}

void __77__FCPersonalizationData_FCPersonalizationAggregate__d_allResults_completion___block_invoke_2(id *a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  void (**v7)(_QWORD);
  id v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  _QWORD aBlock[4];
  id v15;
  id v16;
  uint64_t v17;

  v2 = (void *)objc_opt_new();
  v3 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __77__FCPersonalizationData_FCPersonalizationAggregate__d_allResults_completion___block_invoke_3;
  aBlock[3] = &unk_1E463FA10;
  v4 = v2;
  v15 = v4;
  v17 = 10;
  v16 = a1[5];
  v5 = _Block_copy(aBlock);
  objc_msgSend(a1[4], "d_allGlobalAggregates");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v3;
  v11[1] = 3221225472;
  v11[2] = __77__FCPersonalizationData_FCPersonalizationAggregate__d_allResults_completion___block_invoke_5;
  v11[3] = &unk_1E464AB78;
  v12 = v4;
  v13 = v5;
  v7 = v5;
  v8 = v4;
  objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v11);

  v7[2](v7);
  v9[0] = v3;
  v9[1] = 3221225472;
  v9[2] = __77__FCPersonalizationData_FCPersonalizationAggregate__d_allResults_completion___block_invoke_6;
  v9[3] = &unk_1E463B598;
  v10 = a1[6];
  FCPerformBlockOnMainThread(v9);

}

void __77__FCPersonalizationData_FCPersonalizationAggregate__d_allResults_completion___block_invoke_3(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;

  if ((unint64_t)objc_msgSend(*(id *)(a1 + 32), "count") >= *(_QWORD *)(a1 + 48))
  {
    v2 = (void *)objc_msgSend(*(id *)(a1 + 32), "copy");
    objc_msgSend(*(id *)(a1 + 32), "removeAllObjects");
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __77__FCPersonalizationData_FCPersonalizationAggregate__d_allResults_completion___block_invoke_4;
    v5[3] = &unk_1E463B2D0;
    v3 = *(id *)(a1 + 40);
    v6 = v2;
    v7 = v3;
    v4 = v2;
    FCPerformBlockOnMainThread(v5);

  }
}

uint64_t __77__FCPersonalizationData_FCPersonalizationAggregate__d_allResults_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __77__FCPersonalizationData_FCPersonalizationAggregate__d_allResults_completion___block_invoke_5(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;

  v6 = a3;
  +[FCPersonalizationFeature featureForIdentifier:](FCPersonalizationFeature, "featureForIdentifier:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v6, v5);
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

uint64_t __77__FCPersonalizationData_FCPersonalizationAggregate__d_allResults_completion___block_invoke_6(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

@end
