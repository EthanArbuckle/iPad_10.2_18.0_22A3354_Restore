@implementation _ATXDataStore

- (void)updateOrInsertCategoricalHistogramData:(id)a3 forHistogram:(int64_t)a4
{
  id v6;
  _PASSqliteDatabase *db;
  id v8;
  _QWORD v9[4];
  id v10;
  int64_t v11;

  v6 = a3;
  if (v6)
  {
    db = self->_db;
    v9[1] = 3221225472;
    v9[2] = __69___ATXDataStore_updateOrInsertCategoricalHistogramData_forHistogram___block_invoke;
    v9[3] = &unk_1E82DEA88;
    v11 = a4;
    v8 = v6;
    v9[0] = MEMORY[0x1E0C809B0];
    v10 = v6;
    -[_PASSqliteDatabase prepAndRunQuery:onPrep:onRow:onError:](db, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("INSERT INTO categoricalHistograms (histogramType, histogramData) VALUES (:histogram_type, :histogram_data) ON CONFLICT(histogramType) DO UPDATE SET histogramData=excluded.histogramData"), v9, 0, 0);

    v6 = v8;
  }

}

- (void)updateOrInsertHistogramData:(id)a3 forHistogram:(int64_t)a4
{
  id v6;
  _PASSqliteDatabase *db;
  id v8;
  _QWORD v9[4];
  id v10;
  int64_t v11;

  v6 = a3;
  if (v6)
  {
    db = self->_db;
    v9[1] = 3221225472;
    v9[2] = __58___ATXDataStore_updateOrInsertHistogramData_forHistogram___block_invoke;
    v9[3] = &unk_1E82DEA88;
    v11 = a4;
    v8 = v6;
    v9[0] = MEMORY[0x1E0C809B0];
    v10 = v6;
    -[_PASSqliteDatabase prepAndRunQuery:onPrep:onRow:onError:](db, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("INSERT INTO histograms (histogramType, histogramData) VALUES (:histogram_type, :histogram_data) ON CONFLICT(histogramType) DO UPDATE SET histogramData=excluded.histogramData"), v9, 0, 0);

    v6 = v8;
  }

}

- (void)addCategoricalHistogramData:(id)a3 forHistogramOfType:(int64_t)a4
{
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;
  int64_t v10;

  v6 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __64___ATXDataStore_addCategoricalHistogramData_forHistogramOfType___block_invoke;
  v8[3] = &unk_1E82DEAD0;
  v8[4] = self;
  v9 = v6;
  v10 = a4;
  v7 = v6;
  -[_ATXDataStore _doAsync:](self, "_doAsync:", v8);

}

- (void)_doAsync:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  NSObject *queue;
  id v8;
  _QWORD block[4];
  id v10;

  v4 = a3;
  pthread_mutex_lock(&_doAsync__txnLock);
  if (!_doAsync__txn)
  {
    v5 = os_transaction_create();
    v6 = (void *)_doAsync__txn;
    _doAsync__txn = v5;

  }
  ++_doAsync__txnCount;
  pthread_mutex_unlock(&_doAsync__txnLock);
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __26___ATXDataStore__doAsync___block_invoke;
  block[3] = &unk_1E82DA9F8;
  v10 = v4;
  v8 = v4;
  dispatch_async(queue, block);

}

- (void)addHistogramData:(id)a3 forHistogramOfType:(int64_t)a4
{
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;
  int64_t v10;

  v6 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __53___ATXDataStore_addHistogramData_forHistogramOfType___block_invoke;
  v8[3] = &unk_1E82DEAD0;
  v8[4] = self;
  v9 = v6;
  v10 = a4;
  v7 = v6;
  -[_ATXDataStore _doAsync:](self, "_doAsync:", v8);

}

- (id)_appInfoForBundleIdNoSync:(id)a3
{
  id v4;
  _PASSqliteDatabase *db;
  uint64_t v6;
  id v7;
  id v8;
  _QWORD v10[5];
  _QWORD v11[4];
  id v12;
  uint64_t *v13;
  _QWORD v14[4];
  id v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v4 = a3;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__48;
  v20 = __Block_byref_object_dispose__48;
  v21 = 0;
  db = self->_db;
  v6 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __43___ATXDataStore__appInfoForBundleIdNoSync___block_invoke;
  v14[3] = &unk_1E82DCBD8;
  v15 = v4;
  v11[0] = v6;
  v11[1] = 3221225472;
  v11[2] = __43___ATXDataStore__appInfoForBundleIdNoSync___block_invoke_2;
  v11[3] = &unk_1E82E2AF0;
  v7 = v15;
  v12 = v7;
  v13 = &v16;
  v10[0] = v6;
  v10[1] = 3221225472;
  v10[2] = __43___ATXDataStore__appInfoForBundleIdNoSync___block_invoke_182;
  v10[3] = &unk_1E82DCC28;
  v10[4] = self;
  -[_PASSqliteDatabase prepAndRunQuery:onPrep:onRow:onError:](db, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("SELECT installDate, lastLaunchDate, lastSpotlightLaunchDate, genreId, subGenreIds, isExtension, isEnterpriseApp, app2VecCluster, averageSecondsBetweenLaunches, medianSecondsBetweenLaunches FROM appInfo WHERE bundleId=?"), v14, v11, v10);
  v8 = (id)v17[5];

  _Block_object_dispose(&v16, 8);
  return v8;
}

- (id)appInfoForBundleId:(id)a3
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
  v15 = __Block_byref_object_copy__48;
  v16 = __Block_byref_object_dispose__48;
  v17 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __36___ATXDataStore_appInfoForBundleId___block_invoke;
  block[3] = &unk_1E82DF880;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(queue, block);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (id)lastLaunchedApp
{
  NSObject *queue;
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
  v9 = __Block_byref_object_copy__48;
  v10 = __Block_byref_object_dispose__48;
  v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __32___ATXDataStore_lastLaunchedApp__block_invoke;
  v5[3] = &unk_1E82DACD8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)lastLaunchDate
{
  return -[_ATXDataStore _lastAppLaunchDateOfType:](self, "_lastAppLaunchDateOfType:", 0);
}

- (id)_lastAppLaunchDateOfType:(int64_t)a3
{
  NSObject *queue;
  id v4;
  _QWORD block[7];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__48;
  v11 = __Block_byref_object_dispose__48;
  v12 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42___ATXDataStore__lastAppLaunchDateOfType___block_invoke;
  block[3] = &unk_1E82DCCA0;
  block[5] = &v7;
  block[6] = a3;
  block[4] = self;
  dispatch_sync(queue, block);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (void)writeValidParameterCombinationsWithSchema:(id)a3 cacheKey:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  BOOL v11;
  NSObject *v12;
  _QWORD v13[5];
  id v14;
  id v15;
  id v16;

  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1CAA48B6C]();
  v16 = 0;
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v6, 1, &v16);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v16;
  objc_autoreleasePoolPop(v8);
  if (v10)
    v11 = 1;
  else
    v11 = v9 == 0;
  if (v11)
  {
    __atxlog_handle_default();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[_ATXDataStore(IntentCache) writeValidParameterCombinationsWithSchema:cacheKey:].cold.1();

  }
  else
  {
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __81___ATXDataStore_IntentCache__writeValidParameterCombinationsWithSchema_cacheKey___block_invoke;
    v13[3] = &unk_1E82DB9D8;
    v13[4] = self;
    v14 = v7;
    v15 = v9;
    -[_ATXDataStore _doSync:](self, "_doSync:", v13);

  }
}

- (id)validParameterCombinationsWithSchemaForCacheKey:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  NSObject *v14;
  id v15;
  id v17;
  _QWORD v18[5];
  id v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v4 = a3;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__12;
  v25 = __Block_byref_object_dispose__12;
  v26 = 0;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __78___ATXDataStore_IntentCache__validParameterCombinationsWithSchemaForCacheKey___block_invoke;
  v18[3] = &unk_1E82DCC50;
  v18[4] = self;
  v5 = v4;
  v19 = v5;
  v20 = &v21;
  -[_ATXDataStore _doSync:](self, "_doSync:", v18);
  if (v22[5])
  {
    v6 = objc_alloc(MEMORY[0x1E0C99E60]);
    v7 = objc_opt_class();
    v8 = objc_opt_class();
    v9 = objc_opt_class();
    v10 = (void *)objc_msgSend(v6, "initWithObjects:", v7, v8, v9, objc_opt_class(), 0);
    v11 = v22[5];
    v17 = 0;
    objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClasses:fromData:error:", v10, v11, &v17);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v17;
    if (v13)
    {
      __atxlog_handle_default();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        -[_ATXDataStore(IntentCache) validParameterCombinationsWithSchemaForCacheKey:].cold.1((uint64_t)v13, v14);

      v15 = 0;
    }
    else
    {
      v15 = v12;
    }

  }
  else
  {
    v15 = 0;
  }

  _Block_object_dispose(&v21, 8);
  return v15;
}

- (void)writeSupportsBackgroundExecution:(BOOL)a3 cacheKey:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;
  BOOL v10;

  v6 = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __72___ATXDataStore_IntentCache__writeSupportsBackgroundExecution_cacheKey___block_invoke;
  v8[3] = &unk_1E82DCF98;
  v8[4] = self;
  v9 = v6;
  v10 = a3;
  v7 = v6;
  -[_ATXDataStore _doSync:](self, "_doSync:", v8);

}

- (id)supportsBackgroundExecutionForCacheKey:(id)a3
{
  id v4;
  id v5;
  id v6;
  _QWORD v8[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__12;
  v15 = __Block_byref_object_dispose__12;
  v16 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __69___ATXDataStore_IntentCache__supportsBackgroundExecutionForCacheKey___block_invoke;
  v8[3] = &unk_1E82DCC50;
  v8[4] = self;
  v5 = v4;
  v9 = v5;
  v10 = &v11;
  -[_ATXDataStore _doSync:](self, "_doSync:", v8);
  v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

- (void)writeTitle:(id)a3 cacheKey:(id)a4
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
  v10[2] = __50___ATXDataStore_IntentCache__writeTitle_cacheKey___block_invoke;
  v10[3] = &unk_1E82DB9D8;
  v10[4] = self;
  v11 = v7;
  v12 = v6;
  v8 = v6;
  v9 = v7;
  -[_ATXDataStore _doSync:](self, "_doSync:", v10);

}

- (id)titleForCacheKey:(id)a3
{
  id v4;
  id v5;
  id v6;
  _QWORD v8[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__12;
  v15 = __Block_byref_object_dispose__12;
  v16 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __47___ATXDataStore_IntentCache__titleForCacheKey___block_invoke;
  v8[3] = &unk_1E82DCC50;
  v8[4] = self;
  v5 = v4;
  v9 = v5;
  v10 = &v11;
  -[_ATXDataStore _doSync:](self, "_doSync:", v8);
  v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

- (void)writeSubtitle:(id)a3 cacheKey:(id)a4
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
  v10[2] = __53___ATXDataStore_IntentCache__writeSubtitle_cacheKey___block_invoke;
  v10[3] = &unk_1E82DB9D8;
  v10[4] = self;
  v11 = v7;
  v12 = v6;
  v8 = v6;
  v9 = v7;
  -[_ATXDataStore _doSync:](self, "_doSync:", v10);

}

- (id)subtitleForCacheKey:(id)a3
{
  id v4;
  id v5;
  id v6;
  _QWORD v8[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__12;
  v15 = __Block_byref_object_dispose__12;
  v16 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __50___ATXDataStore_IntentCache__subtitleForCacheKey___block_invoke;
  v8[3] = &unk_1E82DCC50;
  v8[4] = self;
  v5 = v4;
  v9 = v5;
  v10 = &v11;
  -[_ATXDataStore _doSync:](self, "_doSync:", v8);
  v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

- (void)writeEligibleForWidgets:(BOOL)a3 cacheKey:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;
  BOOL v10;

  v6 = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __63___ATXDataStore_IntentCache__writeEligibleForWidgets_cacheKey___block_invoke;
  v8[3] = &unk_1E82DCF98;
  v8[4] = self;
  v9 = v6;
  v10 = a3;
  v7 = v6;
  -[_ATXDataStore _doSync:](self, "_doSync:", v8);

}

- (id)isEligibleForWidgetsForCacheKey:(id)a3
{
  id v4;
  id v5;
  id v6;
  _QWORD v8[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__12;
  v15 = __Block_byref_object_dispose__12;
  v16 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __62___ATXDataStore_IntentCache__isEligibleForWidgetsForCacheKey___block_invoke;
  v8[3] = &unk_1E82DCC50;
  v8[4] = self;
  v5 = v4;
  v9 = v5;
  v10 = &v11;
  -[_ATXDataStore _doSync:](self, "_doSync:", v8);
  v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

- (void)removeCachedIntentsWithBundleId:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __62___ATXDataStore_IntentCache__removeCachedIntentsWithBundleId___block_invoke;
  v6[3] = &unk_1E82DACB0;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[_ATXDataStore _doSync:](self, "_doSync:", v6);

}

- (void)removeAllCachedIntents
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __52___ATXDataStore_IntentCache__removeAllCachedIntents__block_invoke;
  v2[3] = &unk_1E82DAC38;
  v2[4] = self;
  -[_ATXDataStore _doSync:](self, "_doSync:", v2);
}

- (id)webClipsForAppClipBundleId:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__20;
  v15 = __Block_byref_object_dispose__20;
  v16 = (id)objc_opt_new();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __53___ATXDataStore_WebClip__webClipsForAppClipBundleId___block_invoke;
  v8[3] = &unk_1E82DCC50;
  v8[4] = self;
  v5 = v4;
  v9 = v5;
  v10 = &v11;
  -[_ATXDataStore _doSync:](self, "_doSync:", v8);
  v6 = (void *)objc_msgSend((id)v12[5], "copy");

  _Block_object_dispose(&v11, 8);
  return v6;
}

- (void)writeWebClip:(id)a3 appClip:(id)a4
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
  v10[2] = __47___ATXDataStore_WebClip__writeWebClip_appClip___block_invoke;
  v10[3] = &unk_1E82DB9D8;
  v10[4] = self;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[_ATXDataStore _doSync:](self, "_doSync:", v10);

}

+ (_ATXDataStore)sharedInstance
{
  if (sharedInstance_onceToken_4 != -1)
    dispatch_once(&sharedInstance_onceToken_4, &__block_literal_global_103);
  return (_ATXDataStore *)(id)sharedInstance_instance;
}

- (_ATXDataStore)initWithInMemoryDataStore
{
  void *v3;
  _ATXDataStore *v4;

  +[_ATXDuetHelper sharedInstance](_ATXDuetHelper, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[_ATXDataStore initWithPath:andDuetHelper:](self, "initWithPath:andDuetHelper:", CFSTR(":memory:"), v3);

  return v4;
}

+ (id)defaultPath
{
  return (id)objc_msgSend(MEMORY[0x1E0CF94D8], "appPredictionDirectoryFile:", CFSTR("_ATXDataStore.db"));
}

- (_ATXDataStore)init
{
  void *v3;
  void *v4;
  _ATXDataStore *v5;

  +[_ATXDataStore defaultPath](_ATXDataStore, "defaultPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[_ATXDuetHelper sharedInstance](_ATXDuetHelper, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[_ATXDataStore initWithPath:andDuetHelper:](self, "initWithPath:andDuetHelper:", v3, v4);

  return v5;
}

- (_ATXDataStore)initWithPath:(id)a3 andDuetHelper:(id)a4
{
  __CFString *v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  _ATXDataStore *v15;
  _ATXDataStore *v16;
  NSObject *v17;
  dispatch_queue_t v18;
  OS_dispatch_queue *queue;
  uint64_t v20;
  void *v21;
  __CFString *v22;
  __CFString *v23;
  void *v24;
  uint64_t v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  PETScalarEventTracker *dbMigrationTracker;
  void *v33;
  void *v34;
  int v35;
  NSObject *v36;
  void *v37;
  NSObject *v38;
  NSObject *v39;
  _ATXDataStore *v40;
  void *v42;
  id v43;
  uint8_t buf[16];
  objc_super v45;
  _QWORD v46[4];

  v46[3] = *MEMORY[0x1E0C80C00];
  v7 = (__CFString *)a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_ATXDataStore.m"), 121, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("path"));

  }
  if (objc_msgSend(MEMORY[0x1E0D81590], "isClassCLocked"))
  {
    __atxlog_handle_default();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[_ATXDataStore initWithPath:andDuetHelper:].cold.2();

    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Cannot call _ATXDataStore init until class c unlocked"));
    objc_msgSend(MEMORY[0x1E0D81568], "simulateCrashWithDescription:", CFSTR("Cannot call _ATXDataStore init until class c unlocked"));
  }
  if ((objc_msgSend(MEMORY[0x1E0D81620], "isInMemoryPath:", v7) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "attributesOfFileSystemForPath:error:", v7, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2B00]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12 && objc_msgSend(v12, "longLongValue") < 0x8000)
    {
      __atxlog_handle_default();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
        -[_ATXDataStore initWithPath:andDuetHelper:].cold.1();

      v7 = CFSTR(":memory:");
    }

  }
  v45.receiver = self;
  v45.super_class = (Class)_ATXDataStore;
  v15 = -[_ATXDataStore init](&v45, sel_init);
  v16 = v15;
  if (v15)
  {
    v43 = v8;
    objc_storeStrong((id *)&v15->_path, v7);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = dispatch_queue_create("com.apple.duetexpertd._ATXDataStore", v17);
    queue = v16->_queue;
    v16->_queue = (OS_dispatch_queue *)v18;

    v16->_actionHistoryLengthPerAppAction = 200;
    objc_storeStrong((id *)&v16->_duetHelper, a4);
    objc_msgSend(MEMORY[0x1E0CF8C80], "featureIdentifier");
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = (void *)v20;
    v22 = CFSTR("DEC");
    if (v20)
      v22 = (__CFString *)v20;
    v23 = v22;

    +[_ATXDataStoreMigrations migrations](_ATXDataStoreMigrations, "migrations");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "count");

    v26 = objc_alloc(MEMORY[0x1E0D80F38]);
    objc_msgSend(MEMORY[0x1E0D80F20], "propertyWithName:range:", CFSTR("from_version"), 0, ++v25);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v46[0] = v27;
    objc_msgSend(MEMORY[0x1E0D80F20], "propertyWithName:range:", CFSTR("to_version"), 0, v25);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v46[1] = v28;
    objc_msgSend(MEMORY[0x1E0D80F20], "propertyWithName:possibleValues:autoSanitizeValues:", CFSTR("result"), &unk_1E83CFA10, 0);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v46[2] = v29;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v46, 3);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v26, "initWithFeatureId:event:registerProperties:", v23, CFSTR("db_migrate"), v30);

    dbMigrationTracker = v16->_dbMigrationTracker;
    v16->_dbMigrationTracker = (PETScalarEventTracker *)v31;

    objc_msgSend(MEMORY[0x1E0D81620], "corruptionMarkerPathForPath:", v16->_path);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(MEMORY[0x1E0D81620], "isInMemoryPath:", v16->_path) & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = objc_msgSend(v34, "fileExistsAtPath:", v33);

      if (v35)
      {
        __atxlog_handle_default();
        v36 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1C9A3B000, v36, OS_LOG_TYPE_DEFAULT, "Corruption marker detected; flushing data store.",
            buf,
            2u);
        }

        objc_msgSend(MEMORY[0x1E0D81620], "truncateDatabaseAtPath:", v16->_path);
        objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "removeItemAtPath:error:", v33, 0);

      }
    }
    __atxlog_handle_default();
    v38 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C9A3B000, v38, OS_LOG_TYPE_DEFAULT, "ATXDataStore: Initializing the data store.", buf, 2u);
    }

    v8 = v43;
    if (!-[_ATXDataStore _reset](v16, "_reset"))
    {

      v40 = 0;
      goto LABEL_30;
    }
    __atxlog_handle_default();
    v39 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C9A3B000, v39, OS_LOG_TYPE_DEFAULT, "ATXDataStore: Done initializing the data store.", buf, 2u);
    }

  }
  v40 = v16;
LABEL_30:

  return v40;
}

- (void)_disconnectFromDb
{
  _PASSqliteDatabase *db;
  _PASSqliteDatabase *v4;

  db = self->_db;
  if (db)
  {
    -[_PASSqliteDatabase closePermanently](db, "closePermanently");
    v4 = self->_db;
    self->_db = 0;

  }
}

- (BOOL)_reset
{
  NSString *path;
  _PASSqliteDatabase *v4;
  id v5;
  _PASSqliteDatabase *db;
  NSObject *v7;
  BOOL v8;
  id v10;

  if (self->_db)
    -[_ATXDataStore _disconnectFromDb](self, "_disconnectFromDb");
  path = self->_path;
  v10 = 0;
  objc_msgSend(MEMORY[0x1E0D81620], "sqliteDatabaseWithFilename:contentProtection:errorHandler:error:", path, 3, 0, &v10);
  v4 = (_PASSqliteDatabase *)objc_claimAutoreleasedReturnValue();
  v5 = v10;
  db = self->_db;
  self->_db = v4;

  if (self->_db)
  {
    -[_ATXDataStore configureDatabase](self, "configureDatabase");
    -[_ATXDataStore migrate](self, "migrate");
  }
  else
  {
    __atxlog_handle_default();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[_ATXDataStore _reset].cold.1(&self->_path);

    -[_ATXDataStore _disconnectFromDb](self, "_disconnectFromDb");
  }
  v8 = self->_db != 0;

  return v8;
}

- (void)_doSync:(id)a3
{
  dispatch_sync((dispatch_queue_t)self->_queue, a3);
}

- (void)removeFeedbackForBundleId:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __43___ATXDataStore_removeFeedbackForBundleId___block_invoke;
  v6[3] = &unk_1E82DACB0;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[_ATXDataStore _doAsync:](self, "_doAsync:", v6);

}

- (void)removeAllFeedback
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __34___ATXDataStore_removeAllFeedback__block_invoke;
  block[3] = &unk_1E82DAC38;
  block[4] = self;
  dispatch_sync(queue, block);
}

- (void)removeAllAppActionPredictionFeedbackCounts
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59___ATXDataStore_removeAllAppActionPredictionFeedbackCounts__block_invoke;
  block[3] = &unk_1E82DAC38;
  block[4] = self;
  dispatch_sync(queue, block);
}

- (void)pruneMessageRecipientsAddedBefore:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51___ATXDataStore_pruneMessageRecipientsAddedBefore___block_invoke;
  block[3] = &unk_1E82DACB0;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(queue, block);

}

- (void)_removeFeedbackForBundleId:(id)a3
{
  id v4;
  _PASSqliteDatabase *db;
  id v6;
  _QWORD v7[5];
  _QWORD v8[4];
  id v9;

  v4 = a3;
  db = self->_db;
  v7[4] = self;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __44___ATXDataStore__removeFeedbackForBundleId___block_invoke;
  v8[3] = &unk_1E82DCBD8;
  v9 = v4;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __44___ATXDataStore__removeFeedbackForBundleId___block_invoke_2;
  v7[3] = &unk_1E82DCC28;
  v6 = v4;
  -[_PASSqliteDatabase prepAndRunQuery:onPrep:onRow:onError:](db, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("DELETE FROM app WHERE bundleId=?"), v8, 0, v7);

}

- (void)enumerateStateForApps:(id)a3 withGlobalBlock:(id)a4 thenWithPerAppBlock:(id)a5 readOnly:(BOOL)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *queue;
  id v14;
  id v15;
  id v16;
  _QWORD block[4];
  id v18;
  _ATXDataStore *v19;
  id v20;
  id v21;
  BOOL v22;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __84___ATXDataStore_enumerateStateForApps_withGlobalBlock_thenWithPerAppBlock_readOnly___block_invoke;
  block[3] = &unk_1E82E2A78;
  v18 = v10;
  v19 = self;
  v22 = a6;
  v20 = v11;
  v21 = v12;
  v14 = v12;
  v15 = v11;
  v16 = v10;
  dispatch_sync(queue, block);

}

- (void)enumerateStateForApps:(id)a3 withGlobalBlock:(id)a4 thenWithPerAppBlock:(id)a5
{
  -[_ATXDataStore enumerateStateForApps:withGlobalBlock:thenWithPerAppBlock:readOnly:](self, "enumerateStateForApps:withGlobalBlock:thenWithPerAppBlock:readOnly:", a3, a4, a5, 0);
}

- (void)enumerateStateForAppsReadOnly:(id)a3 withGlobalBlock:(id)a4 thenWithPerAppBlock:(id)a5
{
  -[_ATXDataStore enumerateStateForApps:withGlobalBlock:thenWithPerAppBlock:readOnly:](self, "enumerateStateForApps:withGlobalBlock:thenWithPerAppBlock:readOnly:", a3, a4, a5, 1);
}

- (void)vacuumDatabaseWithActivity:(id)a3
{
  id v4;
  _PASSqliteDatabase *db;
  uint64_t v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  uint8_t buf[4];
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((-[_PASSqliteDatabase isInMemory](self->_db, "isInMemory") & 1) == 0)
  {
    db = self->_db;
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __44___ATXDataStore_vacuumDatabaseWithActivity___block_invoke;
    v12[3] = &unk_1E82E2AA0;
    v13 = v4;
    v11 = 0;
    v6 = -[_PASSqliteDatabase vacuumWithShouldContinueBlock:error:](db, "vacuumWithShouldContinueBlock:error:", v12, &v11);
    v7 = v11;
    if (v7)
    {
      __atxlog_handle_default();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        -[_ATXDataStore vacuumDatabaseWithActivity:].cold.1();

    }
    __atxlog_handle_default();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v6);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v15 = v10;
      _os_log_impl(&dword_1C9A3B000, v9, OS_LOG_TYPE_DEFAULT, "ATXDataStore: vacuum completed: %@", buf, 0xCu);

    }
  }

}

- (void)addAppInstallForBundleId:(id)a3 date:(id)a4 genreId:(id)a5 subGenreIds:(id)a6
{
  -[_ATXDataStore addAppInstallForBundleId:date:genreId:subGenreIds:app2VecCluster:](self, "addAppInstallForBundleId:date:genreId:subGenreIds:app2VecCluster:", a3, a4, a5, a6, &unk_1E83CC988);
}

- (void)addAppInstallForBundleId:(id)a3 date:(id)a4 genreId:(id)a5 subGenreIds:(id)a6 app2VecCluster:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  _ATXDataStore *v25;
  id v26;
  id v27;
  id v28;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __82___ATXDataStore_addAppInstallForBundleId_date_genreId_subGenreIds_app2VecCluster___block_invoke;
  v22[3] = &unk_1E82E2AC8;
  v23 = v12;
  v24 = v13;
  v25 = self;
  v26 = v14;
  v27 = v15;
  v28 = v16;
  v17 = v16;
  v18 = v15;
  v19 = v14;
  v20 = v13;
  v21 = v12;
  -[_ATXDataStore _doAsync:](self, "_doAsync:", v22);

}

- (void)addAppLaunchForBundleId:(id)a3 date:(id)a4 withLaunchType:(int64_t)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  int64_t v15;

  v8 = a3;
  v9 = a4;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __61___ATXDataStore_addAppLaunchForBundleId_date_withLaunchType___block_invoke;
  v12[3] = &unk_1E82DEC98;
  v12[4] = self;
  v13 = v9;
  v14 = v8;
  v15 = a5;
  v10 = v8;
  v11 = v9;
  -[_ATXDataStore _doAsync:](self, "_doAsync:", v12);

}

- (void)addAppActionLaunchForAppAction:(id)a3 date:(id)a4
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
  v10[2] = __53___ATXDataStore_addAppActionLaunchForAppAction_date___block_invoke;
  v10[3] = &unk_1E82DB9D8;
  v10[4] = self;
  v11 = v7;
  v12 = v6;
  v8 = v6;
  v9 = v7;
  -[_ATXDataStore _doAsync:](self, "_doAsync:", v10);

}

- (void)addExtensionLaunchForBundleId:(id)a3 date:(id)a4
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
  v10[2] = __52___ATXDataStore_addExtensionLaunchForBundleId_date___block_invoke;
  v10[3] = &unk_1E82DB9D8;
  v10[4] = self;
  v11 = v7;
  v12 = v6;
  v8 = v6;
  v9 = v7;
  -[_ATXDataStore _doAsync:](self, "_doAsync:", v10);

}

- (id)allAppsLaunchedOrInstalledWithin30Days
{
  NSObject *queue;
  id v4;
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
  v10 = __Block_byref_object_copy__48;
  v11 = __Block_byref_object_dispose__48;
  v12 = (id)objc_opt_new();
  queue = self->_queue;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __55___ATXDataStore_allAppsLaunchedOrInstalledWithin30Days__block_invoke;
  v6[3] = &unk_1E82DACD8;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(queue, v6);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (id)allApps
{
  return -[_ATXDataStore _allAppsRequireInstallDate:](self, "_allAppsRequireInstallDate:", 0);
}

- (id)allAppsWithInstallDate
{
  return -[_ATXDataStore _allAppsRequireInstallDate:](self, "_allAppsRequireInstallDate:", 1);
}

- (id)_allAppsRequireInstallDate:(BOOL)a3
{
  NSObject *queue;
  id v6;
  _QWORD block[6];
  BOOL v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__48;
  v14 = __Block_byref_object_dispose__48;
  v15 = (id)objc_opt_new();
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44___ATXDataStore__allAppsRequireInstallDate___block_invoke;
  block[3] = &unk_1E82E2B18;
  v9 = a3;
  block[4] = self;
  block[5] = &v10;
  dispatch_sync(queue, block);
  v6 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v6;
}

- (id)nthMostRecentAppLaunch:(int64_t)a3
{
  NSObject *queue;
  id v4;
  _QWORD block[7];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__48;
  v11 = __Block_byref_object_dispose__48;
  v12 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40___ATXDataStore_nthMostRecentAppLaunch___block_invoke;
  block[3] = &unk_1E82DCCA0;
  block[5] = &v7;
  block[6] = a3;
  block[4] = self;
  dispatch_sync(queue, block);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (id)lastSpotlightLaunchDate
{
  return -[_ATXDataStore _lastAppLaunchDateOfType:](self, "_lastAppLaunchDateOfType:", 1);
}

- (void)removeAppInfoForBundleIdsNotInSet:(id)a3
{
  id v4;
  NSObject *v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __51___ATXDataStore_removeAppInfoForBundleIdsNotInSet___block_invoke;
    v6[3] = &unk_1E82DACB0;
    v6[4] = self;
    v7 = v4;
    -[_ATXDataStore _doAsync:](self, "_doAsync:", v6);

  }
  else
  {
    __atxlog_handle_default();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[_ATXDataStore removeAppInfoForBundleIdsNotInSet:].cold.1();

  }
}

- (void)removeAppInfoForBundleId:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;
  uint8_t buf[4];
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  __atxlog_handle_deletions();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v10 = v4;
    _os_log_impl(&dword_1C9A3B000, v5, OS_LOG_TYPE_DEFAULT, "_ATXDataStore: Removing appInfo for bundleId: %@", buf, 0xCu);
  }

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __42___ATXDataStore_removeAppInfoForBundleId___block_invoke;
  v7[3] = &unk_1E82DACB0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[_ATXDataStore _doAsync:](self, "_doAsync:", v7);

}

- (void)removeAppLaunchesForBundleId:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __46___ATXDataStore_removeAppLaunchesForBundleId___block_invoke;
  v6[3] = &unk_1E82DACB0;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[_ATXDataStore _doAsync:](self, "_doAsync:", v6);

}

- (void)clearAppLaunchInfo
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35___ATXDataStore_clearAppLaunchInfo__block_invoke;
  block[3] = &unk_1E82DAC38;
  block[4] = self;
  dispatch_sync(queue, block);
}

- (void)clearAppInstallInfo
{
  NSObject *v3;
  NSObject *queue;
  _QWORD block[5];
  uint8_t buf[16];

  __atxlog_handle_app_install();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C9A3B000, v3, OS_LOG_TYPE_DEFAULT, "ATXDataStore: Clearing all app install dates", buf, 2u);
  }

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __36___ATXDataStore_clearAppInstallInfo__block_invoke;
  block[3] = &unk_1E82DAC38;
  block[4] = self;
  dispatch_sync(queue, block);
}

- (int64_t)launchedAppCount
{
  NSObject *queue;
  int64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __33___ATXDataStore_launchedAppCount__block_invoke;
  v5[3] = &unk_1E82DACD8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (id)loadAppInfo
{
  void *v3;
  NSObject *queue;
  id v5;
  void *v6;
  id v7;
  _QWORD v9[5];
  id v10;

  v3 = (void *)objc_opt_new();
  queue = self->_queue;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __28___ATXDataStore_loadAppInfo__block_invoke;
  v9[3] = &unk_1E82DACB0;
  v9[4] = self;
  v5 = v3;
  v10 = v5;
  dispatch_sync(queue, v9);
  v6 = v10;
  v7 = v5;

  return v7;
}

- (id)loadAppActionInfo
{
  NSObject *queue;
  id v3;
  void *v4;
  _QWORD block[7];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__48;
  v17 = __Block_byref_object_dispose__48;
  v18 = 0;
  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__48;
  v11 = __Block_byref_object_dispose__48;
  v12 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __34___ATXDataStore_loadAppActionInfo__block_invoke;
  block[3] = &unk_1E82DF2C0;
  block[4] = self;
  block[5] = &v13;
  block[6] = &v7;
  dispatch_sync(queue, block);
  v3 = objc_alloc(MEMORY[0x1E0D81638]);
  v4 = (void *)objc_msgSend(v3, "initWithFirst:second:", v14[5], v8[5]);
  _Block_object_dispose(&v7, 8);

  _Block_object_dispose(&v13, 8);
  return v4;
}

- (id)lastMessageToRecipient:(id)a3
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
  v15 = __Block_byref_object_copy__48;
  v16 = __Block_byref_object_dispose__48;
  v17 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40___ATXDataStore_lastMessageToRecipient___block_invoke;
  block[3] = &unk_1E82DCC50;
  block[4] = self;
  v10 = v4;
  v11 = &v12;
  v6 = v4;
  dispatch_sync(queue, block);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (id)loadTopNAppActionsByPredictions:(unint64_t)a3
{
  void *v5;
  NSObject *queue;
  id v7;
  void *v8;
  id v9;
  _QWORD block[5];
  id v12;
  unint64_t v13;

  v5 = (void *)objc_opt_new();
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49___ATXDataStore_loadTopNAppActionsByPredictions___block_invoke;
  block[3] = &unk_1E82DEAD0;
  block[4] = self;
  v13 = a3;
  v7 = v5;
  v12 = v7;
  dispatch_sync(queue, block);
  v8 = v12;
  v9 = v7;

  return v9;
}

- (void)writeLaunches:(id)a3 followingBundle:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[5];
  id v20;
  id v21;
  id v22;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_ATXDataStore.m"), 1017, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("launches"));

    if (v9)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_ATXDataStore.m"), 1018, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("bundleId"));

LABEL_3:
  v10 = (void *)MEMORY[0x1CAA48B6C]();
  v11 = (void *)MEMORY[0x1CAA48B6C]();
  v22 = 0;
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v7, 1, &v22);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v22;
  objc_autoreleasePoolPop(v11);
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_ATXDataStore.m"), 1022, CFSTR("Archiver error: %@"), v13);

  }
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __47___ATXDataStore_writeLaunches_followingBundle___block_invoke;
  v19[3] = &unk_1E82DB9D8;
  v19[4] = self;
  v20 = v12;
  v14 = v9;
  v21 = v14;
  v15 = v12;
  -[_ATXDataStore _doAsync:](self, "_doAsync:", v19);

  objc_autoreleasePoolPop(v10);
}

- (void)writeAppActionLaunches:(id)a3 followingAppAction:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[5];
  id v20;
  id v21;
  id v22;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_ATXDataStore.m"), 1031, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("appActionlaunches"));

    if (v9)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_ATXDataStore.m"), 1032, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("appAction"));

LABEL_3:
  v10 = (void *)MEMORY[0x1CAA48B6C]();
  v11 = (void *)MEMORY[0x1CAA48B6C]();
  v22 = 0;
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v7, 1, &v22);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v22;
  objc_autoreleasePoolPop(v11);
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_ATXDataStore.m"), 1036, CFSTR("Archiver error: %@"), v13);

  }
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __59___ATXDataStore_writeAppActionLaunches_followingAppAction___block_invoke;
  v19[3] = &unk_1E82DB9D8;
  v19[4] = self;
  v20 = v12;
  v14 = v9;
  v21 = v14;
  v15 = v12;
  -[_ATXDataStore _doAsync:](self, "_doAsync:", v19);

  objc_autoreleasePoolPop(v10);
}

- (void)writeAverageSecondsBetweenLaunches:(id)a3 forBundleId:(id)a4
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
  v10[2] = __64___ATXDataStore_writeAverageSecondsBetweenLaunches_forBundleId___block_invoke;
  v10[3] = &unk_1E82DB9D8;
  v10[4] = self;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[_ATXDataStore _doAsync:](self, "_doAsync:", v10);

}

- (void)writeMedianSecondsBetweenLaunches:(id)a3 forBundleId:(id)a4
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
  v10[2] = __63___ATXDataStore_writeMedianSecondsBetweenLaunches_forBundleId___block_invoke;
  v10[3] = &unk_1E82DB9D8;
  v10[4] = self;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[_ATXDataStore _doAsync:](self, "_doAsync:", v10);

}

- (void)writeAverageSecondsBetweenAppActions:(id)a3 forAppAction:(id)a4
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
  v10[2] = __67___ATXDataStore_writeAverageSecondsBetweenAppActions_forAppAction___block_invoke;
  v10[3] = &unk_1E82DB9D8;
  v10[4] = self;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[_ATXDataStore _doAsync:](self, "_doAsync:", v10);

}

- (void)writeMedianSecondsBetweenAppActions:(id)a3 forAppAction:(id)a4
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
  v10[2] = __66___ATXDataStore_writeMedianSecondsBetweenAppActions_forAppAction___block_invoke;
  v10[3] = &unk_1E82DB9D8;
  v10[4] = self;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[_ATXDataStore _doAsync:](self, "_doAsync:", v10);

}

- (void)writeGenreId:(id)a3 subGenreIds:(id)a4 forBundleId:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  id v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __54___ATXDataStore_writeGenreId_subGenreIds_forBundleId___block_invoke;
  v14[3] = &unk_1E82DBAB0;
  v14[4] = self;
  v15 = v8;
  v16 = v9;
  v17 = v10;
  v11 = v10;
  v12 = v9;
  v13 = v8;
  -[_ATXDataStore _doAsync:](self, "_doAsync:", v14);

}

- (void)writeApp2VecCluster:(id)a3 forBundleId:(id)a4
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
  v10[2] = __49___ATXDataStore_writeApp2VecCluster_forBundleId___block_invoke;
  v10[3] = &unk_1E82DB9D8;
  v10[4] = self;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[_ATXDataStore _doAsync:](self, "_doAsync:", v10);

}

- (id)loadLaunchesFollowingBundle:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  void *v7;
  id v8;
  void *v9;
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
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__48;
  v18 = __Block_byref_object_dispose__48;
  v19 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45___ATXDataStore_loadLaunchesFollowingBundle___block_invoke;
  block[3] = &unk_1E82DCC50;
  block[4] = self;
  v6 = v4;
  v12 = v6;
  v13 = &v14;
  dispatch_sync(queue, block);
  v7 = (void *)v15[5];
  if (v7)
    v8 = v7;
  else
    v8 = (id)objc_opt_new();
  v9 = v8;

  _Block_object_dispose(&v14, 8);
  return v9;
}

- (id)loadAppActionLaunchesFollowing:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD block[4];
  id v12;
  _ATXDataStore *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v4 = a3;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__48;
  v19 = __Block_byref_object_dispose__48;
  v20 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48___ATXDataStore_loadAppActionLaunchesFollowing___block_invoke;
  block[3] = &unk_1E82DCC50;
  v6 = v4;
  v12 = v6;
  v13 = self;
  v14 = &v15;
  dispatch_sync(queue, block);
  v7 = (void *)v16[5];
  if (v7)
    v8 = v7;
  else
    v8 = (id)objc_opt_new();
  v9 = v8;

  _Block_object_dispose(&v15, 8);
  return v9;
}

- (void)deleteLaunchesFollowingBundle:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __47___ATXDataStore_deleteLaunchesFollowingBundle___block_invoke;
  v6[3] = &unk_1E82DACB0;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[_ATXDataStore _doAsync:](self, "_doAsync:", v6);

}

- (void)deleteLaunchesFollowingAppAction:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  _ATXDataStore *v8;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __50___ATXDataStore_deleteLaunchesFollowingAppAction___block_invoke;
  v6[3] = &unk_1E82DACB0;
  v7 = v4;
  v8 = self;
  v5 = v4;
  -[_ATXDataStore _doAsync:](self, "_doAsync:", v6);

}

- (void)enumerateAppInfoBundlesExecutingBlock:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55___ATXDataStore_enumerateAppInfoBundlesExecutingBlock___block_invoke;
  block[3] = &unk_1E82DA8E8;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(queue, block);

}

- (void)enumerateAppInfoAppActionsExecutingBlock:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58___ATXDataStore_enumerateAppInfoAppActionsExecutingBlock___block_invoke;
  block[3] = &unk_1E82DA8E8;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(queue, block);

}

- (void)_enumerateAppInfoBundlesExecutingBlock:(id)a3
{
  id v4;
  _PASSqliteDatabase *db;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  db = self->_db;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __56___ATXDataStore__enumerateAppInfoBundlesExecutingBlock___block_invoke;
  v7[3] = &unk_1E82E2BA0;
  v8 = v4;
  v6 = v4;
  -[_PASSqliteDatabase prepAndRunQuery:onPrep:onRow:onError:](db, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("SELECT bundleId FROM appInfo"), 0, v7, &__block_literal_global_276_0);

}

- (void)_enumerateAppInfoAppActionsExecutingBlock:(id)a3
{
  id v4;
  _PASSqliteDatabase *db;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  db = self->_db;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __59___ATXDataStore__enumerateAppInfoAppActionsExecutingBlock___block_invoke;
  v7[3] = &unk_1E82E2BA0;
  v8 = v4;
  v6 = v4;
  -[_PASSqliteDatabase prepAndRunQuery:onPrep:onRow:onError:](db, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("SELECT appAction FROM appActionInfo"), 0, v7, &__block_literal_global_281);

}

- (id)loadAppActionsFromAppActionInfo
{
  void *v3;
  NSObject *queue;
  id v5;
  void *v6;
  id v7;
  _QWORD v9[5];
  id v10;

  v3 = (void *)objc_opt_new();
  queue = self->_queue;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __48___ATXDataStore_loadAppActionsFromAppActionInfo__block_invoke;
  v9[3] = &unk_1E82DACB0;
  v9[4] = self;
  v5 = v3;
  v10 = v5;
  dispatch_sync(queue, v9);
  v6 = v10;
  v7 = v5;

  return v7;
}

- (id)totalSlotsInDatastore
{
  NSObject *queue;
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
  v9 = __Block_byref_object_copy__48;
  v10 = __Block_byref_object_dispose__48;
  v11 = &unk_1E83CC988;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __38___ATXDataStore_totalSlotsInDatastore__block_invoke;
  v5[3] = &unk_1E82DACD8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)totalNumberOfActionTypesForBundleId:(id)a3
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
  v15 = __Block_byref_object_copy__48;
  v16 = __Block_byref_object_dispose__48;
  v17 = &unk_1E83CC988;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53___ATXDataStore_totalNumberOfActionTypesForBundleId___block_invoke;
  block[3] = &unk_1E82DCC50;
  block[4] = self;
  v10 = v4;
  v11 = &v12;
  v6 = v4;
  dispatch_sync(queue, block);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (BOOL)actionExistsForBundleId:(id)a3 actionType:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD v12[5];
  id v13;
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;

  v6 = a3;
  v7 = a4;
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  queue = self->_queue;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __52___ATXDataStore_actionExistsForBundleId_actionType___block_invoke;
  v12[3] = &unk_1E82E2C08;
  v12[4] = self;
  v13 = v6;
  v14 = v7;
  v15 = &v16;
  v9 = v7;
  v10 = v6;
  dispatch_sync(queue, v12);
  LOBYTE(queue) = *((_BYTE *)v17 + 24);

  _Block_object_dispose(&v16, 8);
  return (char)queue;
}

- (BOOL)containsActionType:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __36___ATXDataStore_containsActionType___block_invoke;
  block[3] = &unk_1E82DCC50;
  block[4] = self;
  v9 = v4;
  v10 = &v11;
  v6 = v4;
  dispatch_sync(queue, block);
  LOBYTE(queue) = *((_BYTE *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)queue;
}

- (id)lastAppActionLaunchDateForAppAction:(id)a3
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
  v15 = __Block_byref_object_copy__48;
  v16 = __Block_byref_object_dispose__48;
  v17 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53___ATXDataStore_lastAppActionLaunchDateForAppAction___block_invoke;
  block[3] = &unk_1E82DCC50;
  block[4] = self;
  v10 = v4;
  v11 = &v12;
  v6 = v4;
  dispatch_sync(queue, block);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (id)averageSecondsBetweenAppActionsForAppAction:(id)a3
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
  v15 = __Block_byref_object_copy__48;
  v16 = __Block_byref_object_dispose__48;
  v17 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __61___ATXDataStore_averageSecondsBetweenAppActionsForAppAction___block_invoke;
  block[3] = &unk_1E82DCC50;
  block[4] = self;
  v10 = v4;
  v11 = &v12;
  v6 = v4;
  dispatch_sync(queue, block);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (id)medianSecondsBetweenAppActionsForAppAction:(id)a3
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
  v15 = __Block_byref_object_copy__48;
  v16 = __Block_byref_object_dispose__48;
  v17 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60___ATXDataStore_medianSecondsBetweenAppActionsForAppAction___block_invoke;
  block[3] = &unk_1E82DCC50;
  block[4] = self;
  v10 = v4;
  v11 = &v12;
  v6 = v4;
  dispatch_sync(queue, block);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (id)filenamesAndDataForBackupWithTransport:(unint64_t)a3
{
  return -[_ATXDataStore filenamesAndDataForBackupShouldPareDown:transport:](self, "filenamesAndDataForBackupShouldPareDown:transport:", 1, a3);
}

- (id)filenamesAndDataForBackupShouldPareDown:(BOOL)a3 transport:(unint64_t)a4
{
  NSObject *queue;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  NSObject *v23;
  id v26;
  _BOOL4 v27;
  id obj;
  id v29;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  id v35;
  _QWORD block[7];
  char v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t (*v41)(uint64_t, uint64_t);
  void (*v42)(uint64_t);
  id v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t (*v47)(uint64_t, uint64_t);
  void (*v48)(uint64_t);
  id v49;
  uint8_t buf[4];
  void *v51;
  __int16 v52;
  id v53;
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v44 = 0;
  v45 = &v44;
  v46 = 0x3032000000;
  v47 = __Block_byref_object_copy__48;
  v48 = __Block_byref_object_dispose__48;
  v49 = 0;
  v38 = 0;
  v39 = &v38;
  v40 = 0x3032000000;
  v41 = __Block_byref_object_copy__48;
  v42 = __Block_byref_object_dispose__48;
  v43 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __67___ATXDataStore_filenamesAndDataForBackupShouldPareDown_transport___block_invoke;
  block[3] = &unk_1E82E2C30;
  block[4] = self;
  block[5] = &v44;
  v37 = 1;
  block[6] = &v38;
  dispatch_sync(queue, block);
  v26 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  if (v45[5] && v39[5])
    objc_msgSend(v26, "setObject:forKeyedSubscript:");
  if (a3)
    goto LABEL_34;
  objc_msgSend(MEMORY[0x1E0CF94D8], "modeCachesRootDirectory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = 0;
  objc_msgSend(v8, "contentsOfDirectoryAtPath:error:", v7, &v35);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  obj = v35;

  if (obj)
  {
    __atxlog_handle_default();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[_ATXDataStore filenamesAndDataForBackupShouldPareDown:transport:].cold.2();
    goto LABEL_32;
  }
  v27 = +[ATXCloudStorageSettingsListener isBackupForContactsEnabled](ATXCloudStorageSettingsListener, "isBackupForContactsEnabled");
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  obj = v9;
  v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v54, 16);
  if (!v11)
    goto LABEL_22;
  v12 = *(_QWORD *)v32;
  do
  {
    for (i = 0; i != v11; ++i)
    {
      if (*(_QWORD *)v32 != v12)
        objc_enumerationMutation(obj);
      v14 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
      objc_msgSend(v7, "stringByAppendingPathComponent:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_alloc(MEMORY[0x1E0C99D50]);
      v30 = 0;
      v17 = (void *)objc_msgSend(v16, "initWithContentsOfFile:options:error:", v15, 1, &v30);
      v18 = v30;
      if (v18)
      {
        __atxlog_handle_default();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          v51 = v14;
          v52 = 2112;
          v53 = v18;
          _os_log_error_impl(&dword_1C9A3B000, v19, OS_LOG_TYPE_ERROR, "Error while converting mode entity score file: %@ into NSData. Error: %@", buf, 0x16u);
        }
        v20 = v17;
      }
      else
      {
        objc_msgSend((id)objc_opt_class(), "removeSensitiveInformationFromModeEntityScoresFile:shouldBackupContacts:", v17, v27);
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v20)
          goto LABEL_20;
        objc_msgSend(CFSTR("mode_"), "stringByAppendingString:", v14);
        v19 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "setObject:forKeyedSubscript:", v20, v19);
      }

LABEL_20:
    }
    v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v54, 16);
  }
  while (v11);
LABEL_22:

  if (a4 == 1)
  {
    objc_msgSend(MEMORY[0x1E0CF94D8], "onboardingStackWidgetCacheFilePath");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    __atxlog_handle_backup();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v51 = v9;
      _os_log_impl(&dword_1C9A3B000, v21, OS_LOG_TYPE_DEFAULT, "onboarding stacks cache file being backed up: %@", buf, 0xCu);
    }

    v29 = 0;
    v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithContentsOfFile:options:error:", v9, 1, &v29);
    v10 = v29;
    if (v10)
    {
      __atxlog_handle_backup();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        -[_ATXDataStore filenamesAndDataForBackupShouldPareDown:transport:].cold.1();

    }
    else if (v22)
    {
      objc_msgSend(v26, "setObject:forKeyedSubscript:", v22, CFSTR("onboardingStacks"));
    }

LABEL_32:
  }

LABEL_34:
  _Block_object_dispose(&v38, 8);

  _Block_object_dispose(&v44, 8);
  return v26;
}

+ (id)removeSensitiveInformationFromModeEntityScoresFile:(id)a3 shouldBackupContacts:(BOOL)a4
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  char isKindOfClass;
  void *v23;
  uint64_t v24;
  void *v25;
  id v26;
  NSObject *v27;
  id v28;
  NSObject *v29;
  void *v30;
  void *v31;
  char v32;
  uint64_t v34;
  BOOL v35;
  void *v36;
  void *v37;
  void *context;
  id v39;
  _QWORD v40[5];
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t (*v44)(uint64_t, uint64_t);
  void (*v45)(uint64_t);
  id v46;
  id v47[2];

  v5 = a3;
  if (v5)
  {
    v35 = a4;
    v36 = (void *)MEMORY[0x1CAA48B6C]();
    v6 = MEMORY[0x1CAA48B6C]();
    v37 = (void *)MEMORY[0x1E0CB3710];
    context = (void *)v6;
    v7 = (void *)MEMORY[0x1CAA48B6C]();
    v8 = objc_alloc(MEMORY[0x1E0C99E60]);
    v9 = objc_opt_class();
    v10 = objc_opt_class();
    v11 = objc_opt_class();
    v12 = v5;
    v13 = objc_opt_class();
    v14 = objc_opt_class();
    v15 = objc_opt_class();
    v16 = objc_opt_class();
    v34 = v13;
    v5 = v12;
    v17 = (void *)objc_msgSend(v8, "initWithObjects:", v9, v10, v11, v34, v14, v15, v16, objc_opt_class(), 0);
    objc_autoreleasePoolPop(v7);
    v47[0] = 0;
    objc_msgSend(v37, "unarchivedObjectOfClasses:fromData:error:", v17, v12, v47);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v47[0];

    objc_autoreleasePoolPop(context);
    if (!v18)
    {
      __atxlog_handle_notification_management();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        +[_ATXDataStore removeSensitiveInformationFromModeEntityScoresFile:shouldBackupContacts:].cold.1();

      v28 = 0;
      goto LABEL_20;
    }
    v41 = 0;
    v42 = &v41;
    v43 = 0x3032000000;
    v44 = __Block_byref_object_copy__48;
    v45 = __Block_byref_object_dispose__48;
    v46 = (id)objc_opt_new();
    objc_msgSend(v18, "allValues");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "firstObject");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      if (v35)
      {
        v40[0] = MEMORY[0x1E0C809B0];
        v40[1] = 3221225472;
        v40[2] = __89___ATXDataStore_removeSensitiveInformationFromModeEntityScoresFile_shouldBackupContacts___block_invoke;
        v40[3] = &unk_1E82E2C58;
        v40[4] = &v41;
        v23 = (void *)MEMORY[0x1CAA48B6C](objc_msgSend(v18, "enumerateKeysAndObjectsUsingBlock:", v40));
        v24 = v42[5];
        v39 = 0;
        objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v24, 1, &v39);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = v39;
        objc_autoreleasePoolPop(v23);
        if (v25 || !v26)
        {
          v28 = v25;
        }
        else
        {
          __atxlog_handle_notification_management();
          v27 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT))
            +[_ATXDataStore removeSensitiveInformationFromModeEntityScoresFile:shouldBackupContacts:].cold.2();

          v28 = 0;
        }

        goto LABEL_19;
      }
    }
    else
    {
      objc_msgSend(v18, "allValues");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "firstObject");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v32 = objc_opt_isKindOfClass();

      if ((v32 & 1) == 0)
      {
        v28 = v5;
        goto LABEL_19;
      }
    }
    v28 = 0;
LABEL_19:
    _Block_object_dispose(&v41, 8);

LABEL_20:
    objc_autoreleasePoolPop(v36);
    goto LABEL_21;
  }
  v28 = 0;
LABEL_21:

  return v28;
}

+ (BOOL)pareDownForBackup:(sqlite3 *)a3
{
  unint64_t v4;
  BOOL v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  char *errmsg;

  v4 = 0;
  v5 = 0;
  while (1)
  {
    v6 = (void *)MEMORY[0x1CAA48B6C](a1, a2);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("DELETE FROM %s"), off_1E82E2C78[v4]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    errmsg = 0;
    v8 = objc_retainAutorelease(v7);
    if (sqlite3_exec(a3, (const char *)objc_msgSend(v8, "UTF8String"), 0, 0, &errmsg))
      break;

    objc_autoreleasePoolPop(v6);
    v5 = v4++ > 9;
    if (v4 == 11)
    {
      sqlite3_exec(a3, "VACUUM", 0, 0, 0);
      return 1;
    }
  }
  __atxlog_handle_default();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    +[_ATXDataStore pareDownForBackup:].cold.1();

  objc_autoreleasePoolPop(v6);
  return v5;
}

+ (BOOL)isSqliteData:(id)a3
{
  id v3;
  _QWORD *v4;
  BOOL v6;

  v3 = a3;
  if ((unint64_t)objc_msgSend(v3, "length") < 0x10)
  {
    v6 = 0;
  }
  else
  {
    v4 = (_QWORD *)objc_msgSend(objc_retainAutorelease(v3), "bytes");
    v6 = *v4 == 0x66206574694C5153 && v4[1] == 0x332074616D726FLL;
  }

  return v6;
}

- (BOOL)restoreFromBackup:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  id v7;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  id v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  char v22;
  id v23;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  void *v33;
  BOOL v34;
  __int128 v36;
  uint64_t v37;
  void *v38;
  id v39;
  id v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _QWORD block[4];
  id v46;
  _ATXDataStore *v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t *v50;
  uint64_t v51;
  char v52;
  uint8_t buf[4];
  void *v54;
  __int16 v55;
  id v56;
  _BYTE v57[128];
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v49 = 0;
  v50 = &v49;
  v51 = 0x2020000000;
  v52 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35___ATXDataStore_restoreFromBackup___block_invoke;
  block[3] = &unk_1E82E0520;
  v6 = v4;
  v47 = self;
  v48 = &v49;
  v46 = v6;
  dispatch_sync(queue, block);
  objc_msgSend(MEMORY[0x1E0CF94D8], "modeCachesRootDirectory");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = objc_msgSend(CFSTR("mode_"), "length");
  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v41, v57, 16);
  if (v8)
  {
    v10 = *(_QWORD *)v42;
    *(_QWORD *)&v9 = 138412546;
    v36 = v9;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v42 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
        if (objc_msgSend(v12, "hasPrefix:", CFSTR("mode_"), v36))
        {
          objc_msgSend(v12, "substringFromIndex:", v37);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "stringByAppendingPathComponent:", v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v7, "objectForKeyedSubscript:", v12);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v40 = 0;
          v16 = objc_msgSend(v15, "writeToFile:options:error:", v14, 1073741825, &v40);
          v17 = v40;
          if ((v16 & 1) == 0)
          {
            __atxlog_handle_backup();
            v18 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v36;
              v54 = v12;
              v55 = 2112;
              v56 = v17;
              _os_log_error_impl(&dword_1C9A3B000, v18, OS_LOG_TYPE_ERROR, "Error restoring to mode file %@: %@", buf, 0x16u);
            }

          }
        }
      }
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v41, v57, 16);
    }
    while (v8);
  }

  objc_msgSend(MEMORY[0x1E0CF94D8], "onboardingStackWidgetCacheFilePath");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("onboardingStacks"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v20;
  if (v20)
  {
    v39 = 0;
    v22 = objc_msgSend(v20, "writeToFile:options:error:", v19, 1073741825, &v39);
    v23 = v39;
    if ((v22 & 1) != 0)
    {
      __atxlog_handle_backup();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1C9A3B000, v24, OS_LOG_TYPE_DEFAULT, "Successfully restored onboarding stacks cache.", buf, 2u);
      }
    }
    else
    {
      __atxlog_handle_backup();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        -[_ATXDataStore restoreFromBackup:].cold.2((uint64_t)v19);
    }
  }
  else
  {
    __atxlog_handle_backup();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      -[_ATXDataStore restoreFromBackup:].cold.1(v24, v25, v26, v27, v28, v29, v30, v31);
    v23 = 0;
  }

  v32 = objc_alloc(MEMORY[0x1E0C99EA0]);
  v33 = (void *)objc_msgSend(v32, "initWithSuiteName:", *MEMORY[0x1E0D80ED8]);
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  objc_msgSend(v33, "setDouble:forKey:", *MEMORY[0x1E0D80EB0]);
  v34 = *((_BYTE *)v50 + 24) != 0;

  _Block_object_dispose(&v49, 8);
  return v34;
}

- (void)addAppLaunchForAppLaunchSequence:(id)a3 date:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55___ATXDataStore_addAppLaunchForAppLaunchSequence_date___block_invoke;
  block[3] = &unk_1E82DB9D8;
  block[4] = self;
  v12 = v7;
  v13 = v6;
  v9 = v6;
  v10 = v7;
  dispatch_sync(queue, block);

}

- (id)appLaunchSequence
{
  void *v3;
  NSObject *queue;
  id v5;
  void *v6;
  id v7;
  _QWORD v9[5];
  id v10;

  v3 = (void *)objc_opt_new();
  queue = self->_queue;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __34___ATXDataStore_appLaunchSequence__block_invoke;
  v9[3] = &unk_1E82DACB0;
  v9[4] = self;
  v5 = v3;
  v10 = v5;
  dispatch_sync(queue, v9);
  v6 = v10;
  v7 = v5;

  return v7;
}

- (id)histogramDataForHistogramType:(int64_t)a3
{
  NSObject *queue;
  id v4;
  _QWORD block[7];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__48;
  v11 = __Block_byref_object_dispose__48;
  v12 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47___ATXDataStore_histogramDataForHistogramType___block_invoke;
  block[3] = &unk_1E82DCCA0;
  block[5] = &v7;
  block[6] = a3;
  block[4] = self;
  dispatch_sync(queue, block);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (id)categoricalHistogramDataForHistogramType:(int64_t)a3
{
  NSObject *queue;
  id v4;
  _QWORD block[7];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__48;
  v11 = __Block_byref_object_dispose__48;
  v12 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58___ATXDataStore_categoricalHistogramDataForHistogramType___block_invoke;
  block[3] = &unk_1E82DCCA0;
  block[5] = &v7;
  block[6] = a3;
  block[4] = self;
  dispatch_sync(queue, block);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (id)blobOfType:(int64_t)a3
{
  NSObject *queue;
  id v4;
  _QWORD block[7];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__48;
  v11 = __Block_byref_object_dispose__48;
  v12 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __28___ATXDataStore_blobOfType___block_invoke;
  block[3] = &unk_1E82DCCA0;
  block[5] = &v7;
  block[6] = a3;
  block[4] = self;
  dispatch_sync(queue, block);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (void)writeBlob:(id)a3 type:(int64_t)a4 expirationDate:(id)a5
{
  id v8;
  id v9;
  NSObject *queue;
  id v11;
  id v12;
  _QWORD block[5];
  id v14;
  id v15;
  int64_t v16;

  v8 = a3;
  v9 = a5;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47___ATXDataStore_writeBlob_type_expirationDate___block_invoke;
  block[3] = &unk_1E82DEC98;
  block[4] = self;
  v14 = v8;
  v15 = v9;
  v16 = a4;
  v11 = v9;
  v12 = v8;
  dispatch_sync(queue, block);

}

- (BOOL)alogContainsActionUUID:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40___ATXDataStore_alogContainsActionUUID___block_invoke;
  block[3] = &unk_1E82DCC50;
  block[4] = self;
  v9 = v4;
  v10 = &v11;
  v6 = v4;
  dispatch_sync(queue, block);
  LOBYTE(queue) = *((_BYTE *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)queue;
}

- (void)writeActionType:(id)a3 bundleId:(id)a4 date:(id)a5 action:(id)a6 slotSets:(id)a7 timeZone:(id)a8 prevLocationUUID:(id)a9 locationUUID:(id)a10 weight:(double)a11 actionUUID:(id)a12 motionType:(int64_t)a13 appSessionStartDate:(id)a14 appSessionEndDate:(id)a15 geohash:(int64_t)a16 coarseGeohash:(int64_t)a17
{
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  uint64_t v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t i;
  void *v38;
  void *v39;
  void *v40;
  ATXMinimalSlotResolutionParameters *v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  ATXMinimalSlotResolutionParameters *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  NSObject *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  NSObject *queue;
  uint64_t v64;
  uint64_t v65;
  void *v67;
  id v68;
  id v69;
  void *v70;
  id v71;
  void *v72;
  void *v73;
  void *v74;
  id v75;
  id obja;
  void *v78;
  id v79;
  _QWORD block[5];
  id v81;
  id v82;
  id v83;
  id v84;
  id v85;
  id v86;
  id v87;
  id v88;
  id v89;
  id v90;
  uint64_t v91;
  uint64_t v92;
  double v93;
  int64_t v94;
  int64_t v95;
  int64_t v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  uint8_t v101[128];
  uint8_t buf[4];
  double v103;
  __int16 v104;
  id v105;
  __int16 v106;
  id v107;
  __int16 v108;
  id v109;
  uint64_t v110;

  v110 = *MEMORY[0x1E0C80C00];
  v23 = a3;
  v24 = a4;
  v25 = a5;
  v79 = a6;
  v26 = a7;
  v75 = a8;
  v27 = a9;
  v71 = a10;
  v28 = a12;
  v69 = a14;
  v68 = a15;
  if (v23)
  {
    if (v24)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_ATXDataStore.m"), 1984, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("actionType"));

    if (v24)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_ATXDataStore.m"), 1985, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("bundleId"));

LABEL_3:
  v29 = (uint64_t)v25;
  if (!v79)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_ATXDataStore.m"), 1986, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("action"));

  }
  if (!v26)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_ATXDataStore.m"), 1987, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("slotSets"));

  }
  if (a11 <= 0.0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_ATXDataStore.m"), 1988, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("0.0 < weight"));

  }
  if (a11 > 1.0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_ATXDataStore.m"), 1989, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("weight <= 1.0"));

    if (v28)
      goto LABEL_11;
  }
  else if (v28)
  {
    goto LABEL_11;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_ATXDataStore.m"), 1990, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("actionUUID"));

LABEL_11:
  __atxlog_handle_default();
  v30 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218754;
    v103 = a11;
    v104 = 2112;
    v105 = v23;
    v106 = 2112;
    v107 = v24;
    v108 = 2112;
    v109 = v79;
    _os_log_debug_impl(&dword_1C9A3B000, v30, OS_LOG_TYPE_DEBUG, "Recording action (* %0.2f) of type %@ for %@: %@", buf, 0x2Au);
  }
  v70 = v28;
  v73 = v24;
  v74 = v23;

  if (!v25)
    v29 = objc_opt_new();
  v72 = (void *)v29;
  +[_ATXActionUtils timeOfDayAndDayOfWeekForDate:timeZone:](_ATXActionUtils, "timeOfDayAndDayOfWeekForDate:timeZone:", v29, v75);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "first");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v65 = objc_msgSend(v32, "integerValue");

  v67 = v31;
  objc_msgSend(v31, "second");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v64 = objc_msgSend(v33, "integerValue");

  v78 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v26, "count"));
  v97 = 0u;
  v98 = 0u;
  v99 = 0u;
  v100 = 0u;
  obja = v26;
  v34 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v97, v101, 16);
  if (v34)
  {
    v35 = v34;
    v36 = *(_QWORD *)v98;
    do
    {
      for (i = 0; i != v35; ++i)
      {
        if (*(_QWORD *)v98 != v36)
          objc_enumerationMutation(obja);
        v38 = *(void **)(*((_QWORD *)&v97 + 1) + 8 * i);
        v39 = (void *)objc_opt_new();
        objc_msgSend(v38, "setUuid:", v39);
        v40 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF90E0]), "initWithAction:slots:", v79, v38);
        v41 = [ATXMinimalSlotResolutionParameters alloc];
        v42 = objc_msgSend(v40, "hash");
        v43 = objc_msgSend(v38, "hash");
        objc_msgSend(v38, "parameters");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = -[ATXMinimalSlotResolutionParameters initWithParameterHash:slotHash:uuid:paramCount:](v41, "initWithParameterHash:slotHash:uuid:paramCount:", v42, v43, v39, objc_msgSend(v44, "count"));
        objc_msgSend(v78, "setObject:forKeyedSubscript:", v45, v39);

      }
      v35 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v97, v101, 16);
    }
    while (v35);
  }

  ATXSlotSetsSerialize();
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  if (v46)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __191___ATXDataStore_writeActionType_bundleId_date_action_slotSets_timeZone_prevLocationUUID_locationUUID_weight_actionUUID_motionType_appSessionStartDate_appSessionEndDate_geohash_coarseGeohash___block_invoke;
    block[3] = &unk_1E82E2DB8;
    block[4] = self;
    v81 = v73;
    v47 = v74;
    v82 = v74;
    v83 = v46;
    v48 = v72;
    v84 = v72;
    v91 = v65;
    v92 = v64;
    v85 = v27;
    v49 = v71;
    v86 = v71;
    v93 = a11;
    v50 = v70;
    v87 = v70;
    v94 = a13;
    v51 = v73;
    v52 = v69;
    v88 = v69;
    v53 = v68;
    v89 = v68;
    v95 = a16;
    v96 = a17;
    v54 = v78;
    v90 = v78;
    dispatch_sync(queue, block);

  }
  else
  {
    __atxlog_handle_default();
    v55 = objc_claimAutoreleasedReturnValue();
    v47 = v74;
    v48 = v72;
    v49 = v71;
    if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
      -[_ATXDataStore writeActionType:bundleId:date:action:slotSets:timeZone:prevLocationUUID:locationUUID:weight:actionUUID:motionType:appSessionStartDate:appSessionEndDate:geohash:coarseGeohash:].cold.1((uint64_t)obja);

    v51 = v73;
    v52 = v69;
    v50 = v70;
    v53 = v68;
    v54 = v78;
  }

}

- (_PASDBIterAction_)_deserializeActionLogRowWithStmt:(id)a3 invokingBlock:(id)a4
{
  id v5;
  uint64_t (**v6)(id, void *, void *, void *, void *, uint64_t, uint64_t, void *, double, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  double v15;
  double v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  BOOL *v25;
  _PASDBIterAction_ v26;
  void *v27;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;

  v5 = a3;
  v6 = (uint64_t (**)(id, void *, void *, void *, void *, uint64_t, uint64_t, void *, double, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))a4;
  v7 = MEMORY[0x1CAA48B6C]();
  objc_msgSend(v5, "getNSStringForColumn:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "getNSDataForColumn:", 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSinceReferenceDate:", (double)objc_msgSend(v5, "getInt64ForColumn:", 2));
  v38 = objc_msgSend(v5, "getIntegerForColumn:", 3);
  v37 = objc_msgSend(v5, "getIntegerForColumn:", 4);
  objc_msgSend(v5, "getNSDataForColumn:", 5);
  v11 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "getNSDataForColumn:", 6);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = objc_msgSend(v5, "getIntegerForColumn:", 7);
  if ((objc_msgSend(v5, "isColumnNull:", 8) & 1) != 0)
    v39 = 0;
  else
    v39 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSinceReferenceDate:", (double)objc_msgSend(v5, "getInt64ForColumn:", 8));
  v40 = (void *)v7;
  v42 = (void *)v11;
  if ((objc_msgSend(v5, "isColumnNull:", 9) & 1) != 0)
    v12 = 0;
  else
    v12 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSinceReferenceDate:", (double)objc_msgSend(v5, "getInt64ForColumn:", 9));
  v13 = objc_msgSend(v5, "getInt64ForColumn:", 10);
  v14 = objc_msgSend(v5, "getInt64ForColumn:", 11);
  objc_msgSend(v5, "getDoubleForColumn:", 12);
  v16 = v15;
  objc_msgSend(v5, "getInt64ForColumn:", 13);
  if (v9 && (ATXSlotSetsDeserialize(), (v17 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    v33 = v13;
    v35 = v10;
    if (objc_msgSend(v42, "length") == 16)
      v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", objc_msgSend(objc_retainAutorelease(v42), "bytes"));
    else
      v31 = 0;
    v18 = v14;
    if (objc_msgSend(v41, "length") == 16)
      v19 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", objc_msgSend(objc_retainAutorelease(v41), "bytes"));
    else
      v19 = 0;
    v32 = (void *)v19;
    objc_msgSend(v17, "first");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "second");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v33;
    v30 = v18;
    v34 = v17;
    v22 = (void *)v12;
    v23 = (void *)v39;
    v24 = v6[2](v6, v8, v20, v21, v35, v38, v37, v31, v16, v19, v36, v39, v12, v29, v30);

    v25 = (BOOL *)MEMORY[0x1E0D81780];
    if (!v24)
      v25 = (BOOL *)MEMORY[0x1E0D81788];
    v26.var0 = *v25;

    v10 = v35;
    v27 = v40;
  }
  else
  {
    v26.var0 = *MEMORY[0x1E0D81780];
    v22 = (void *)v12;
    v23 = (void *)v39;
    v27 = v40;
  }

  objc_autoreleasePoolPop(v27);
  return v26;
}

- (void)enumerateActionOfType:(id)a3 bundleId:(id)a4 block:(id)a5
{
  id v9;
  id v10;
  id v11;
  NSObject *queue;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  _QWORD block[5];
  id v20;
  id v21;
  id v22;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (v9)
  {
    if (v10)
      goto LABEL_3;
LABEL_6:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_ATXDataStore.m"), 2234, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("bundleId"));

    if (v11)
      goto LABEL_4;
LABEL_7:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_ATXDataStore.m"), 2235, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("block"));

    goto LABEL_4;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_ATXDataStore.m"), 2233, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("actionType"));

  if (!v10)
    goto LABEL_6;
LABEL_3:
  if (!v11)
    goto LABEL_7;
LABEL_4:
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54___ATXDataStore_enumerateActionOfType_bundleId_block___block_invoke;
  block[3] = &unk_1E82DF830;
  block[4] = self;
  v20 = v10;
  v21 = v9;
  v22 = v11;
  v13 = v11;
  v14 = v9;
  v18 = v10;
  dispatch_sync(queue, block);

}

- (void)enumerateSlotUuidsOfType:(id)a3 bundleId:(id)a4 block:(id)a5
{
  id v9;
  id v10;
  id v11;
  NSObject *queue;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD block[5];
  id v20;
  id v21;
  id v22;
  _QWORD *v23;
  _QWORD *v24;
  _QWORD *v25;
  _QWORD *v26;
  _QWORD *v27;
  _QWORD *v28;
  _QWORD *v29;
  _QWORD *v30;
  _QWORD *v31;
  _QWORD *v32;
  _QWORD *v33;
  _QWORD *v34;
  _QWORD *v35;
  _QWORD v36[4];
  _QWORD v37[4];
  _QWORD v38[5];
  id v39;
  _QWORD v40[5];
  id v41;
  _QWORD v42[4];
  _QWORD v43[4];
  _QWORD v44[5];
  id v45;
  _QWORD v46[5];
  id v47;
  _QWORD v48[4];
  _QWORD v49[4];
  _QWORD v50[5];
  id v51;
  _QWORD v52[5];
  id v53;
  _QWORD v54[4];

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (v9)
  {
    if (v10)
      goto LABEL_3;
LABEL_6:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_ATXDataStore.m"), 2279, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("bundleId"));

    if (v11)
      goto LABEL_4;
LABEL_7:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_ATXDataStore.m"), 2280, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("block"));

    goto LABEL_4;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_ATXDataStore.m"), 2278, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("actionType"));

  if (!v10)
    goto LABEL_6;
LABEL_3:
  if (!v11)
    goto LABEL_7;
LABEL_4:
  v54[0] = 0;
  v54[1] = v54;
  v54[2] = 0x2020000000;
  v54[3] = -1;
  v52[0] = 0;
  v52[1] = v52;
  v52[2] = 0x3032000000;
  v52[3] = __Block_byref_object_copy__48;
  v52[4] = __Block_byref_object_dispose__48;
  v53 = 0;
  v50[0] = 0;
  v50[1] = v50;
  v50[2] = 0x3032000000;
  v50[3] = __Block_byref_object_copy__48;
  v50[4] = __Block_byref_object_dispose__48;
  v51 = 0;
  v49[0] = 0;
  v49[1] = v49;
  v49[2] = 0x2020000000;
  v49[3] = 0;
  v48[0] = 0;
  v48[1] = v48;
  v48[2] = 0x2020000000;
  v48[3] = 0;
  v46[0] = 0;
  v46[1] = v46;
  v46[2] = 0x3032000000;
  v46[3] = __Block_byref_object_copy__48;
  v46[4] = __Block_byref_object_dispose__48;
  v47 = 0;
  v44[0] = 0;
  v44[1] = v44;
  v44[2] = 0x3032000000;
  v44[3] = __Block_byref_object_copy__48;
  v44[4] = __Block_byref_object_dispose__48;
  v45 = 0;
  v43[0] = 0;
  v43[1] = v43;
  v43[2] = 0x2020000000;
  v43[3] = 0;
  v42[0] = 0;
  v42[1] = v42;
  v42[2] = 0x2020000000;
  v42[3] = 0;
  v40[0] = 0;
  v40[1] = v40;
  v40[2] = 0x3032000000;
  v40[3] = __Block_byref_object_copy__48;
  v40[4] = __Block_byref_object_dispose__48;
  v41 = 0;
  v38[0] = 0;
  v38[1] = v38;
  v38[2] = 0x3032000000;
  v38[3] = __Block_byref_object_copy__48;
  v38[4] = __Block_byref_object_dispose__48;
  v39 = 0;
  v37[0] = 0;
  v37[1] = v37;
  v37[2] = 0x2020000000;
  v37[3] = 0;
  v36[0] = 0;
  v36[1] = v36;
  v36[2] = 0x2020000000;
  v36[3] = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57___ATXDataStore_enumerateSlotUuidsOfType_bundleId_block___block_invoke;
  block[3] = &unk_1E82E2E58;
  block[4] = self;
  v20 = v10;
  v23 = v54;
  v24 = v52;
  v25 = v50;
  v26 = v49;
  v27 = v48;
  v28 = v46;
  v29 = v44;
  v30 = v43;
  v31 = v42;
  v32 = v40;
  v33 = v38;
  v34 = v37;
  v35 = v36;
  v21 = v9;
  v22 = v11;
  v13 = v11;
  v14 = v9;
  v15 = v10;
  dispatch_sync(queue, block);

  _Block_object_dispose(v36, 8);
  _Block_object_dispose(v37, 8);
  _Block_object_dispose(v38, 8);

  _Block_object_dispose(v40, 8);
  _Block_object_dispose(v42, 8);
  _Block_object_dispose(v43, 8);
  _Block_object_dispose(v44, 8);

  _Block_object_dispose(v46, 8);
  _Block_object_dispose(v48, 8);
  _Block_object_dispose(v49, 8);
  _Block_object_dispose(v50, 8);

  _Block_object_dispose(v52, 8);
  _Block_object_dispose(v54, 8);
}

- (void)enumerateActionsInUUIDSet:(id)a3 block:(id)a4
{
  id v7;
  void *v8;
  NSObject *queue;
  void *v10;
  void *v11;
  id v12;
  _QWORD block[4];
  id v14;
  _ATXDataStore *v15;
  id v16;

  v12 = a3;
  v7 = a4;
  v8 = v12;
  if (v12)
  {
    if (v7)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_ATXDataStore.m"), 2373, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("uuidSet"));

    v8 = 0;
    if (v7)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_ATXDataStore.m"), 2374, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("block"));

  v8 = v12;
LABEL_3:
  if (objc_msgSend(v8, "count"))
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __49___ATXDataStore_enumerateActionsInUUIDSet_block___block_invoke;
    block[3] = &unk_1E82DF8F8;
    v14 = v12;
    v15 = self;
    v16 = v7;
    dispatch_sync(queue, block);

  }
}

- (id)appIntentDuetEventsForActionsBetweenStartDate:(id)a3 endDate:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  NSObject *queue;
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  void *v18;
  void *v19;
  _QWORD block[5];
  id v21;
  id v22;
  id v23;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_ATXDataStore.m"), 2397, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("startDate"));

    if (v9)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_ATXDataStore.m"), 2398, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("endDate"));

    goto LABEL_3;
  }
  if (!v8)
    goto LABEL_5;
LABEL_3:
  v10 = (void *)objc_opt_new();
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __71___ATXDataStore_appIntentDuetEventsForActionsBetweenStartDate_endDate___block_invoke;
  block[3] = &unk_1E82DBAB0;
  block[4] = self;
  v21 = v7;
  v22 = v9;
  v12 = v10;
  v23 = v12;
  v13 = v9;
  v14 = v7;
  dispatch_sync(queue, block);
  v15 = v23;
  v16 = v12;

  return v16;
}

- (id)minimalActionParametersforActionsBetweenStartDate:(id)a3 endDate:(id)a4 limit:(unint64_t)a5
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  NSObject *queue;
  id v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  void *v20;
  void *v21;
  _QWORD block[5];
  id v23;
  id v24;
  id v25;
  unint64_t v26;

  v9 = a3;
  v10 = a4;
  v11 = v10;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_ATXDataStore.m"), 2452, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("startDate"));

    if (v11)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_ATXDataStore.m"), 2453, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("endDate"));

    goto LABEL_3;
  }
  if (!v10)
    goto LABEL_5;
LABEL_3:
  v12 = (void *)objc_opt_new();
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __81___ATXDataStore_minimalActionParametersforActionsBetweenStartDate_endDate_limit___block_invoke;
  block[3] = &unk_1E82DEA20;
  block[4] = self;
  v23 = v9;
  v24 = v11;
  v26 = a5;
  v14 = v12;
  v25 = v14;
  v15 = v11;
  v16 = v9;
  dispatch_sync(queue, block);
  v17 = v25;
  v18 = v14;

  return v18;
}

- (id)numActionKeyOccurrencesBetweenStartDate:(id)a3 endDate:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  NSObject *queue;
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  void *v18;
  void *v19;
  _QWORD block[5];
  id v21;
  id v22;
  id v23;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_ATXDataStore.m"), 2502, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("startDate"));

    if (v9)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_ATXDataStore.m"), 2503, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("endDate"));

    goto LABEL_3;
  }
  if (!v8)
    goto LABEL_5;
LABEL_3:
  v10 = (void *)objc_opt_new();
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65___ATXDataStore_numActionKeyOccurrencesBetweenStartDate_endDate___block_invoke;
  block[3] = &unk_1E82DBAB0;
  block[4] = self;
  v21 = v7;
  v22 = v9;
  v12 = v10;
  v23 = v12;
  v13 = v9;
  v14 = v7;
  dispatch_sync(queue, block);
  v15 = v23;
  v16 = v12;

  return v16;
}

- (unint64_t)numActionKeyOccurrencesForActionKey:(id)a3 startDate:(id)a4 endDate:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *queue;
  id v16;
  id v17;
  id v18;
  id v19;
  unint64_t v20;
  void *v22;
  void *v23;
  void *v24;
  _QWORD block[5];
  id v26;
  id v27;
  id v28;
  id v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t v34;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (v9)
  {
    if (v10)
      goto LABEL_3;
LABEL_6:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_ATXDataStore.m"), 2537, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("startDate"));

    if (v11)
      goto LABEL_4;
LABEL_7:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_ATXDataStore.m"), 2538, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("endDate"));

    goto LABEL_4;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_ATXDataStore.m"), 2536, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("actionKey"));

  if (!v10)
    goto LABEL_6;
LABEL_3:
  if (!v11)
    goto LABEL_7;
LABEL_4:
  +[_ATXActionUtils getBundleIdAndActionTypeFromActionKey:](_ATXActionUtils, "getBundleIdAndActionTypeFromActionKey:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "first");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "second");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = 0;
  v32 = &v31;
  v33 = 0x2020000000;
  v34 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __71___ATXDataStore_numActionKeyOccurrencesForActionKey_startDate_endDate___block_invoke;
  block[3] = &unk_1E82E2EA8;
  block[4] = self;
  v26 = v10;
  v27 = v11;
  v28 = v13;
  v29 = v14;
  v30 = &v31;
  v16 = v14;
  v17 = v13;
  v18 = v11;
  v19 = v10;
  dispatch_sync(queue, block);
  v20 = v32[3];

  _Block_object_dispose(&v31, 8);
  return v20;
}

- (unint64_t)numBundleIdOccurrencesForBundleId:(id)a3 startDate:(id)a4 endDate:(id)a5
{
  id v9;
  id v10;
  id v11;
  NSObject *queue;
  id v13;
  id v14;
  id v15;
  unint64_t v16;
  void *v18;
  void *v19;
  void *v20;
  _QWORD block[5];
  id v22;
  id v23;
  id v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (v9)
  {
    if (v10)
      goto LABEL_3;
LABEL_6:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_ATXDataStore.m"), 2571, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("startDate"));

    if (v11)
      goto LABEL_4;
LABEL_7:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_ATXDataStore.m"), 2572, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("endDate"));

    goto LABEL_4;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_ATXDataStore.m"), 2570, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("bundleId"));

  if (!v10)
    goto LABEL_6;
LABEL_3:
  if (!v11)
    goto LABEL_7;
LABEL_4:
  v26 = 0;
  v27 = &v26;
  v28 = 0x2020000000;
  v29 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __69___ATXDataStore_numBundleIdOccurrencesForBundleId_startDate_endDate___block_invoke;
  block[3] = &unk_1E82E2ED0;
  block[4] = self;
  v22 = v10;
  v23 = v11;
  v24 = v9;
  v25 = &v26;
  v13 = v9;
  v14 = v11;
  v15 = v10;
  dispatch_sync(queue, block);
  v16 = v27[3];

  _Block_object_dispose(&v26, 8);
  return v16;
}

- (unint64_t)numActionParameterHashOccurrencesForActionKey:(id)a3 parameterHash:(unint64_t)a4 startDate:(id)a5 endDate:(id)a6
{
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *queue;
  id v18;
  id v19;
  id v20;
  id v21;
  unint64_t v22;
  void *v24;
  void *v25;
  void *v26;
  _QWORD block[5];
  id v28;
  id v29;
  id v30;
  id v31;
  uint64_t *v32;
  unint64_t v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t v37;

  v11 = a3;
  v12 = a5;
  v13 = a6;
  if (v11)
  {
    if (v12)
      goto LABEL_3;
LABEL_6:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_ATXDataStore.m"), 2604, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("startDate"));

    if (v13)
      goto LABEL_4;
LABEL_7:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_ATXDataStore.m"), 2605, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("endDate"));

    goto LABEL_4;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_ATXDataStore.m"), 2603, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("actionKey"));

  if (!v12)
    goto LABEL_6;
LABEL_3:
  if (!v13)
    goto LABEL_7;
LABEL_4:
  v34 = 0;
  v35 = &v34;
  v36 = 0x2020000000;
  v37 = 0;
  +[_ATXActionUtils getBundleIdAndActionTypeFromActionKey:](_ATXActionUtils, "getBundleIdAndActionTypeFromActionKey:", v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "first");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "second");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __95___ATXDataStore_numActionParameterHashOccurrencesForActionKey_parameterHash_startDate_endDate___block_invoke;
  block[3] = &unk_1E82E2F20;
  block[4] = self;
  v28 = v12;
  v29 = v13;
  v30 = v15;
  v31 = v16;
  v32 = &v34;
  v33 = a4;
  v18 = v16;
  v19 = v15;
  v20 = v13;
  v21 = v12;
  dispatch_sync(queue, block);
  v22 = v35[3];

  _Block_object_dispose(&v34, 8);
  return v22;
}

- (id)actionForSlotUUID:(id)a3
{
  id v4;
  void *v5;
  _PASSqliteDatabase *db;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  id v14;
  uint64_t v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, void *);
  void *v19;
  id v20;
  _QWORD v21[7];
  _QWORD v22[4];
  id v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  id v41;
  uint64_t v42;
  _QWORD v43[2];

  v43[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v36 = 0;
    v37 = &v36;
    v38 = 0x3032000000;
    v39 = __Block_byref_object_copy__48;
    v40 = __Block_byref_object_dispose__48;
    v41 = 0;
    v30 = 0;
    v31 = &v30;
    v32 = 0x3032000000;
    v33 = __Block_byref_object_copy__48;
    v34 = __Block_byref_object_dispose__48;
    v35 = 0;
    v24 = 0;
    v25 = &v24;
    v26 = 0x3032000000;
    v27 = __Block_byref_object_copy__48;
    v28 = __Block_byref_object_dispose__48;
    v29 = 0;
    db = self->_db;
    v7 = MEMORY[0x1E0C809B0];
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __35___ATXDataStore_actionForSlotUUID___block_invoke;
    v22[3] = &unk_1E82DCBD8;
    v23 = v4;
    v21[0] = v7;
    v21[1] = 3221225472;
    v21[2] = __35___ATXDataStore_actionForSlotUUID___block_invoke_2;
    v21[3] = &unk_1E82DF498;
    v21[4] = &v30;
    v21[5] = &v36;
    v21[6] = &v24;
    v16 = v7;
    v17 = 3221225472;
    v18 = __35___ATXDataStore_actionForSlotUUID___block_invoke_3;
    v19 = &unk_1E82DCC28;
    v20 = v23;
    -[_PASSqliteDatabase prepAndRunQuery:onPrep:onRow:onError:](db, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("SELECT l.slots FROM alog AS l, slotSetKey AS s WHERE l.id = s.alogId AND s.uuid = ?"), v22, v21, &v16);
    v8 = (void *)v37[5];
    if (!v8)
    {
      if (!v31[5])
      {
        v9 = (void *)MEMORY[0x1E0CB35C8];
        v42 = *MEMORY[0x1E0CB2D50];
        v43[0] = CFSTR("Database has no action data for given slot UUID");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v43, &v42, 1, v16, v17, v18, v19);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "errorWithDomain:code:userInfo:", CFSTR("ATXSlotResolutionSerialization"), 0, v10);
        v11 = objc_claimAutoreleasedReturnValue();
        v12 = (void *)v25[5];
        v25[5] = v11;

      }
      __atxlog_handle_default();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
        -[_ATXDataStore actionForSlotUUID:].cold.1();

      v8 = (void *)v37[5];
    }
    v14 = v8;

    _Block_object_dispose(&v24, 8);
    _Block_object_dispose(&v30, 8);

    _Block_object_dispose(&v36, 8);
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (void)removeActionDataForActionUUIDs:(id)a3
{
  id v5;
  NSObject *v6;
  NSObject *queue;
  id v8;
  void *v9;
  _QWORD block[4];
  id v11;
  _ATXDataStore *v12;
  uint8_t buf[4];
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_ATXDataStore.m"), 2706, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("actionUUIDs"));

  }
  __atxlog_handle_deletions();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v14 = v5;
    _os_log_impl(&dword_1C9A3B000, v6, OS_LOG_TYPE_DEFAULT, "Deleting actions with actionUUIDs: %@", buf, 0xCu);
  }

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48___ATXDataStore_removeActionDataForActionUUIDs___block_invoke;
  block[3] = &unk_1E82DACB0;
  v11 = v5;
  v12 = self;
  v8 = v5;
  dispatch_sync(queue, block);

}

- (void)removeActionDataForActionUUID:(id)a3
{
  id v5;
  NSObject *v6;
  NSObject *queue;
  id v8;
  void *v9;
  _QWORD block[5];
  id v11;
  uint8_t buf[4];
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_ATXDataStore.m"), 2743, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("actionUUID"));

  }
  __atxlog_handle_deletions();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v13 = v5;
    _os_log_impl(&dword_1C9A3B000, v6, OS_LOG_TYPE_DEFAULT, "Deleting actions with actionUUID: %@", buf, 0xCu);
  }

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47___ATXDataStore_removeActionDataForActionUUID___block_invoke;
  block[3] = &unk_1E82DACB0;
  block[4] = self;
  v11 = v5;
  v8 = v5;
  dispatch_sync(queue, block);

}

- (BOOL)hasOrphanSlotSetKeys
{
  NSObject *queue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __37___ATXDataStore_hasOrphanSlotSetKeys__block_invoke;
  v5[3] = &unk_1E82DACD8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)removeActionDataForBundleId:(id)a3
{
  id v5;
  NSObject *v6;
  NSObject *queue;
  id v8;
  void *v9;
  _QWORD block[5];
  id v11;
  uint8_t buf[4];
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_ATXDataStore.m"), 2792, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("bundleId"));

  }
  __atxlog_handle_deletions();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v13 = v5;
    _os_log_impl(&dword_1C9A3B000, v6, OS_LOG_TYPE_DEFAULT, "Deleting actions with bundleId: %@", buf, 0xCu);
  }

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45___ATXDataStore_removeActionDataForBundleId___block_invoke;
  block[3] = &unk_1E82DACB0;
  block[4] = self;
  v11 = v5;
  v8 = v5;
  dispatch_sync(queue, block);

}

- (id)actionAndSlotsForRowId:(id)a3
{
  id v4;
  _PASSqliteDatabase *db;
  uint64_t v6;
  id v7;
  id v8;
  _QWORD v10[5];
  _QWORD v11[4];
  id v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v4 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__48;
  v17 = __Block_byref_object_dispose__48;
  v18 = 0;
  db = self->_db;
  v6 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __40___ATXDataStore_actionAndSlotsForRowId___block_invoke;
  v11[3] = &unk_1E82DCBD8;
  v7 = v4;
  v12 = v7;
  v10[0] = v6;
  v10[1] = 3221225472;
  v10[2] = __40___ATXDataStore_actionAndSlotsForRowId___block_invoke_2;
  v10[3] = &unk_1E82DCC00;
  v10[4] = &v13;
  -[_PASSqliteDatabase prepAndRunQuery:onPrep:onRow:onError:](db, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("SELECT slots FROM alog WHERE id=?"), v11, v10, &__block_literal_global_454_0);
  v8 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  return v8;
}

- (int64_t)_regenerateSlotSetKeyForBundleId:(id)a3
{
  id v4;
  _PASSqliteDatabase *db;
  uint64_t v6;
  _PASSqliteDatabase *v7;
  void *v8;
  _PASSqliteDatabase *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  ATXMinimalSlotResolutionParameters *v24;
  int v25;
  int64_t v26;
  NSObject *v27;
  _PASSqliteDatabase *v28;
  id v30;
  id obj;
  int64_t v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *context;
  uint64_t v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _QWORD v43[5];
  uint8_t buf[16];
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  int64_t v49;
  _QWORD v50[4];
  id v51;
  _QWORD v52[5];
  _QWORD v53[4];
  id v54;
  _QWORD v55[5];
  _QWORD v56[5];
  _QWORD v57[4];
  id v58;
  uint64_t v59;
  uint64_t *v60;
  uint64_t v61;
  uint64_t v62;
  _BYTE v63[128];
  _BYTE v64[128];
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v59 = 0;
  v60 = &v59;
  v61 = 0x2020000000;
  v62 = -1;
  db = self->_db;
  v6 = MEMORY[0x1E0C809B0];
  v57[0] = MEMORY[0x1E0C809B0];
  v57[1] = 3221225472;
  v57[2] = __50___ATXDataStore__regenerateSlotSetKeyForBundleId___block_invoke;
  v57[3] = &unk_1E82DCBD8;
  v30 = v4;
  v58 = v30;
  v56[0] = v6;
  v56[1] = 3221225472;
  v56[2] = __50___ATXDataStore__regenerateSlotSetKeyForBundleId___block_invoke_2;
  v56[3] = &unk_1E82DCC00;
  v56[4] = &v59;
  -[_PASSqliteDatabase prepAndRunQuery:onPrep:onRow:onError:](db, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("SELECT id FROM alogBundleId WHERE bundleId=?"), v57, v56, 0);
  if (v60[3] == -1)
  {
    v32 = 3;
  }
  else
  {
    v7 = self->_db;
    v55[0] = MEMORY[0x1E0C809B0];
    v55[1] = 3221225472;
    v55[2] = __50___ATXDataStore__regenerateSlotSetKeyForBundleId___block_invoke_3;
    v55[3] = &unk_1E82E2CD8;
    v55[4] = &v59;
    v53[0] = MEMORY[0x1E0C809B0];
    v53[1] = 3221225472;
    v53[2] = __50___ATXDataStore__regenerateSlotSetKeyForBundleId___block_invoke_4;
    v53[3] = &unk_1E82DCC28;
    v54 = v30;
    -[_PASSqliteDatabase prepAndRunQuery:onPrep:onRow:onError:](v7, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("DELETE FROM slotSetKey WHERE alogId in (SELECT id FROM alog WHERE bundleId=?)"), v55, 0, v53);
    v8 = (void *)objc_opt_new();
    v9 = self->_db;
    v52[0] = MEMORY[0x1E0C809B0];
    v52[1] = 3221225472;
    v52[2] = __50___ATXDataStore__regenerateSlotSetKeyForBundleId___block_invoke_459;
    v52[3] = &unk_1E82E2CD8;
    v52[4] = &v59;
    v50[0] = MEMORY[0x1E0C809B0];
    v50[1] = 3221225472;
    v50[2] = __50___ATXDataStore__regenerateSlotSetKeyForBundleId___block_invoke_2_460;
    v50[3] = &unk_1E82DEC70;
    v10 = v8;
    v51 = v10;
    -[_PASSqliteDatabase prepAndRunQuery:onPrep:onRow:onError:](v9, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("SELECT id FROM alog WHERE bundleId=?"), v52, v50, 0);
    v33 = (void *)objc_opt_new();
    v49 = 3;
    v45 = 0u;
    v46 = 0u;
    v47 = 0u;
    v48 = 0u;
    obj = v10;
    v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v64, 16);
    if (v11)
    {
      v34 = *(_QWORD *)v46;
LABEL_4:
      v12 = 0;
      v35 = v11;
      while (1)
      {
        if (*(_QWORD *)v46 != v34)
          objc_enumerationMutation(obj);
        v38 = v12;
        v13 = *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * v12);
        context = (void *)MEMORY[0x1CAA48B6C]();
        -[_ATXDataStore actionAndSlotsForRowId:](self, "actionAndSlotsForRowId:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "first");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = v14;
        if (!v15)
          goto LABEL_21;
        if (+[_ATXActionUtils shouldAcceptAudioOrVideoCallIntent:](_ATXActionUtils, "shouldAcceptAudioOrVideoCallIntent:", v15))
        {
          +[_ATXActionUtils slotSetsForAction:intentCache:](_ATXActionUtils, "slotSetsForAction:intentCache:", v15, 0);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D81638]), "initWithFirst:second:", v15, v16);
          objc_msgSend(v33, "setObject:forKeyedSubscript:", v17, v13);

          v41 = 0u;
          v42 = 0u;
          v39 = 0u;
          v40 = 0u;
          v18 = v16;
          v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v39, v63, 16);
          if (v19)
          {
            v20 = *(_QWORD *)v40;
            do
            {
              for (i = 0; i != v19; ++i)
              {
                if (*(_QWORD *)v40 != v20)
                  objc_enumerationMutation(v18);
                v22 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
                v23 = (void *)objc_opt_new();
                objc_msgSend(v22, "setUuid:", v23);
                v24 = -[ATXMinimalSlotResolutionParameters initWithAction:slots:]([ATXMinimalSlotResolutionParameters alloc], "initWithAction:slots:", v15, v22);
                -[_ATXDataStore writeSlotSetKeyParameters:rowId:slotSet:success:](self, "writeSlotSetKeyParameters:rowId:slotSet:success:", v24, v13, v22, &v49);

              }
              v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v39, v63, 16);
            }
            while (v19);
          }

          if (v49)
            v49 = -[_ATXDataStore updateAlog:slotsToMigrate:](self, "updateAlog:slotsToMigrate:", v13, v33);
          objc_msgSend(v33, "removeAllObjects");
          v25 = v49 != 3;
          v26 = v32;
          if (v49 != 3)
            v26 = v49;
          v32 = v26;

        }
        else
        {
LABEL_21:
          __atxlog_handle_deletions();
          v27 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1C9A3B000, v27, OS_LOG_TYPE_DEFAULT, "_ATXDataStore: Deleting INStartAudioCallIntent or INStartVideoCallIntent", buf, 2u);
          }

          v28 = self->_db;
          v43[0] = MEMORY[0x1E0C809B0];
          v43[1] = 3221225472;
          v43[2] = __50___ATXDataStore__regenerateSlotSetKeyForBundleId___block_invoke_461;
          v43[3] = &unk_1E82DCBD8;
          v43[4] = v13;
          -[_PASSqliteDatabase prepAndRunQuery:onPrep:onRow:onError:](v28, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("DELETE FROM alog WHERE id=?"), v43, &__block_literal_global_463, 0);
          v25 = 3;
        }

        objc_autoreleasePoolPop(context);
        if (v25 != 3)
        {
          if (v25)
            break;
        }
        v12 = v38 + 1;
        if (v38 + 1 == v35)
        {
          v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v64, 16);
          if (v11)
            goto LABEL_4;
          goto LABEL_28;
        }
      }
    }
    else
    {
LABEL_28:
      v32 = 3;
    }

  }
  _Block_object_dispose(&v59, 8);

  return v32;
}

- (void)regenerateSlotSetKeyForBundleId:(id)a3
{
  id v5;
  id v6;
  void *v7;
  _QWORD v8[5];
  id v9;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_ATXDataStore.m"), 2920, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("bundleId"));

  }
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __49___ATXDataStore_regenerateSlotSetKeyForBundleId___block_invoke;
  v8[3] = &unk_1E82DACB0;
  v8[4] = self;
  v9 = v5;
  v6 = v5;
  -[_ATXDataStore _doAsync:](self, "_doAsync:", v8);

}

- (void)trimActionHistoryWithAppWhitelist:(id)a3
{
  id v4;
  NSObject *v5;
  os_signpost_id_t v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *queue;
  id v10;
  NSObject *v11;
  NSObject *v12;
  _QWORD v13[5];
  id v14;
  uint8_t buf[16];

  v4 = a3;
  __atxlog_handle_default();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_signpost_id_generate(v5);

  __atxlog_handle_default();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C9A3B000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "trimActionHistoryWithAppWhitelist", " enableTelemetry=YES ", buf, 2u);
  }

  queue = self->_queue;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __51___ATXDataStore_trimActionHistoryWithAppWhitelist___block_invoke;
  v13[3] = &unk_1E82DACB0;
  v13[4] = self;
  v14 = v4;
  v10 = v4;
  dispatch_sync(queue, v13);
  __atxlog_handle_default();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C9A3B000, v12, OS_SIGNPOST_INTERVAL_END, v6, "trimActionHistoryWithAppWhitelist", " enableTelemetry=YES ", buf, 2u);
  }

}

- (id)actionLogKeys
{
  void *v3;
  _PASSqliteDatabase *db;
  id v5;
  _QWORD v7[4];
  id v8;

  v3 = (void *)objc_opt_new();
  db = self->_db;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __30___ATXDataStore_actionLogKeys__block_invoke;
  v7[3] = &unk_1E82DEC70;
  v5 = v3;
  v8 = v5;
  -[_PASSqliteDatabase prepAndRunQuery:onPrep:onRow:onError:](db, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("SELECT DISTINCT b.bundleId, i.actionType FROM alog AS l, alogBundleId AS b, alogAction AS i WHERE b.id = l.bundleId AND i.id = l.actionType"), 0, v7, 0);

  return v5;
}

- (void)recordConfirms:(double)a3 rejects:(double)a4 forFeedbackType:(unint64_t)a5 forActionType:(id)a6 bundleId:(id)a7 action:(id)a8 slotSet:(id)a9 actionUUID:(id)a10 date:(id)a11 consumerSubType:(unsigned __int8)a12 geohash:(int64_t)a13 coarseGeohash:(int64_t)a14
{
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  NSObject *queue;
  id v32;
  _QWORD block[5];
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  double v39;
  double v40;
  unint64_t v41;
  int64_t v42;
  int64_t v43;
  unsigned __int8 v44;

  v32 = a6;
  v22 = a7;
  v23 = a8;
  v24 = a9;
  v25 = a10;
  v26 = a11;
  if (!v24)
    v24 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CF90E8]), "initWithOpaqueParameters");
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v24);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  ATXSlotSetsSerialize();
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (v28)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __148___ATXDataStore_recordConfirms_rejects_forFeedbackType_forActionType_bundleId_action_slotSet_actionUUID_date_consumerSubType_geohash_coarseGeohash___block_invoke;
    block[3] = &unk_1E82E3028;
    block[4] = self;
    v34 = v22;
    v29 = v32;
    v35 = v32;
    v36 = v28;
    v39 = a3;
    v40 = a4;
    v37 = v25;
    v44 = a12;
    v38 = v26;
    v41 = a5;
    v42 = a13;
    v43 = a14;
    dispatch_sync(queue, block);

  }
  else
  {
    __atxlog_handle_default();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      -[_ATXDataStore recordConfirms:rejects:forFeedbackType:forActionType:bundleId:action:slotSet:actionUUID:date:consumerSubType:geohash:coarseGeohash:].cold.1((uint64_t)v24, (uint64_t)v23, v30);

    v29 = v32;
  }

}

- (void)enumerateFeedbackForActionOfType:(id)a3 bundleId:(id)a4 block:(id)a5
{
  id v9;
  id v10;
  id v11;
  NSObject *queue;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  _QWORD block[5];
  id v20;
  id v21;
  id v22;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (v9)
  {
    if (v10)
      goto LABEL_3;
LABEL_6:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_ATXDataStore.m"), 3170, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("bundleId"));

    if (v11)
      goto LABEL_4;
LABEL_7:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_ATXDataStore.m"), 3171, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("block"));

    goto LABEL_4;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_ATXDataStore.m"), 3169, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("actionType"));

  if (!v10)
    goto LABEL_6;
LABEL_3:
  if (!v11)
    goto LABEL_7;
LABEL_4:
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65___ATXDataStore_enumerateFeedbackForActionOfType_bundleId_block___block_invoke;
  block[3] = &unk_1E82DF830;
  block[4] = self;
  v20 = v10;
  v21 = v9;
  v22 = v11;
  v13 = v11;
  v14 = v9;
  v18 = v10;
  dispatch_sync(queue, block);

}

- (void)removeAllSlotsFromActionLog
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44___ATXDataStore_removeAllSlotsFromActionLog__block_invoke;
  block[3] = &unk_1E82DAC38;
  block[4] = self;
  dispatch_sync(queue, block);
}

- (void)removeAllSlotsFromActionFeedback
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49___ATXDataStore_removeAllSlotsFromActionFeedback__block_invoke;
  block[3] = &unk_1E82DAC38;
  block[4] = self;
  dispatch_sync(queue, block);
}

- (void)removeAllSlotsFromSlotSetKey
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45___ATXDataStore_removeAllSlotsFromSlotSetKey__block_invoke;
  block[3] = &unk_1E82DAC38;
  block[4] = self;
  dispatch_sync(queue, block);
}

- (id)actionFeedbackLogKeys
{
  void *v3;
  _PASSqliteDatabase *db;
  id v5;
  _QWORD v7[4];
  id v8;

  v3 = (void *)objc_opt_new();
  db = self->_db;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __38___ATXDataStore_actionFeedbackLogKeys__block_invoke;
  v7[3] = &unk_1E82DEC70;
  v5 = v3;
  v8 = v5;
  -[_PASSqliteDatabase prepAndRunQuery:onPrep:onRow:onError:](db, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("SELECT DISTINCT b.bundleId, i.actionType FROM afeedback AS l, alogBundleId AS b, alogAction AS i WHERE b.id = l.bundleId AND i.id = l.actionType"), 0, v7, 0);

  return v5;
}

- (void)removeActionsWithoutTitle
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42___ATXDataStore_removeActionsWithoutTitle__block_invoke;
  block[3] = &unk_1E82DAC38;
  block[4] = self;
  dispatch_sync(queue, block);
}

- (BOOL)_removeActionsWithoutTitle
{
  _PASSqliteDatabase *db;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 1;
  db = self->_db;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __43___ATXDataStore__removeActionsWithoutTitle__block_invoke;
  v5[3] = &unk_1E82DACD8;
  v5[4] = self;
  v5[5] = &v6;
  -[_PASSqliteDatabase writeTransaction:](db, "writeTransaction:", v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (int64_t)currentSchemaVersion
{
  _PASSqliteDatabase *db;
  int64_t v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  db = self->_db;
  if (!db)
    -[_ATXDataStore currentSchemaVersion].cold.1();
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __37___ATXDataStore_currentSchemaVersion__block_invoke;
  v5[3] = &unk_1E82DCC00;
  v5[4] = &v6;
  -[_PASSqliteDatabase prepAndRunQuery:onPrep:onRow:onError:](db, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("SELECT version FROM meta"), 0, v5, &__block_literal_global_525);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)migrate
{
  id v3;

  +[_ATXDataStoreMigrations migrations](_ATXDataStoreMigrations, "migrations");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[_ATXDataStore migrateWithMigrationPlan:](self, "migrateWithMigrationPlan:", v3);

}

- (void)migrateWithMigrationPlan:(id)a3
{
  NSObject *v4;
  unint64_t schemaVersion;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  _PASSqliteDatabase *db;
  NSObject *v12;
  int64_t v13;
  _BOOL4 v14;
  NSObject *v15;
  _BOOL4 v16;
  void *v17;
  NSObject *v18;
  PETScalarEventTracker *v19;
  void *v20;
  void *v21;
  void *v22;
  PETScalarEventTracker *v23;
  void *v24;
  void *v25;
  void *v26;
  PETScalarEventTracker *dbMigrationTracker;
  void *v28;
  void *v29;
  void *v30;
  unint64_t v31;
  unint64_t v32;
  id v33;
  _QWORD v34[5];
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _QWORD v39[3];
  _QWORD v40[3];
  _QWORD v41[3];
  uint8_t v42[128];
  uint8_t buf[4];
  unint64_t v44;
  __int16 v45;
  unint64_t v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v33 = a3;
  v31 = objc_msgSend(v33, "count");
  v32 = -[_ATXDataStore currentSchemaVersion](self, "currentSchemaVersion");
  self->_schemaVersion = v32;
  __atxlog_handle_default();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218240;
    v44 = v31;
    v45 = 2048;
    v46 = v32;
    _os_log_impl(&dword_1C9A3B000, v4, OS_LOG_TYPE_INFO, "ATXDataStore: Migrating with maxDBVersion in migration plan: %ld. Current schema version: %lu.", buf, 0x16u);
  }

  schemaVersion = self->_schemaVersion;
  if (schemaVersion - 35 <= 3)
  {
    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    v6 = objc_msgSend(&unk_1E83CFA58, "countByEnumeratingWithState:objects:count:", &v35, v42, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v36;
      v8 = MEMORY[0x1E0C809B0];
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v36 != v7)
            objc_enumerationMutation(&unk_1E83CFA58);
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("DELETE FROM %@ WHERE histogramType>5"), *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * v9));
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          db = self->_db;
          v34[0] = v8;
          v34[1] = 3221225472;
          v34[2] = __42___ATXDataStore_migrateWithMigrationPlan___block_invoke;
          v34[3] = &unk_1E82DCC28;
          v34[4] = self;
          -[_PASSqliteDatabase prepAndRunQuery:onPrep:onRow:onError:](db, "prepAndRunQuery:onPrep:onRow:onError:", v10, 0, 0, v34);

          ++v9;
        }
        while (v6 != v9);
        v6 = objc_msgSend(&unk_1E83CFA58, "countByEnumeratingWithState:objects:count:", &v35, v42, 16);
      }
      while (v6);
    }
    schemaVersion = self->_schemaVersion;
  }
  if (schemaVersion <= 2)
  {
    __atxlog_handle_default();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C9A3B000, v12, OS_LOG_TYPE_INFO, "Migrating _ATXDataStore schema. Since previous _schemaVersion is from before migrations started, reset to current schema", buf, 2u);
    }

    -[_ATXDataStore clearDatabase](self, "clearDatabase");
    v13 = -[_ATXDataStore skipFromZeroSchema](self, "skipFromZeroSchema");
LABEL_22:
    switch(v13)
    {
      case 2:
        dbMigrationTracker = self->_dbMigrationTracker;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v32);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v39[0] = v28;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_schemaVersion);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v39[1] = v29;
        v39[2] = CFSTR("unsupported");
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v39, 3);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        -[PETScalarEventTracker trackEventWithPropertyValues:](dbMigrationTracker, "trackEventWithPropertyValues:", v30);

        break;
      case 1:
        v23 = self->_dbMigrationTracker;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v32);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v40[0] = v24;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_schemaVersion);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v40[1] = v25;
        v40[2] = CFSTR("success");
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v40, 3);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        -[PETScalarEventTracker trackEventWithPropertyValues:](v23, "trackEventWithPropertyValues:", v26);

        break;
      case 0:
        __atxlog_handle_default();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1C9A3B000, v18, OS_LOG_TYPE_INFO, "_ATXDataStore migration failed!", buf, 2u);
        }

        v19 = self->_dbMigrationTracker;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v32);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v41[0] = v20;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_schemaVersion);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v41[1] = v21;
        v41[2] = CFSTR("failed");
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v41, 3);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[PETScalarEventTracker trackEventWithPropertyValues:](v19, "trackEventWithPropertyValues:", v22);

        -[_PASSqliteDatabase placeCorruptionMarker](self->_db, "placeCorruptionMarker");
        objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0D81778], CFSTR("_ATXDataStore migration failed. Marking as corrupt."));
        break;
    }
    goto LABEL_33;
  }
  v14 = schemaVersion < v31;
  __atxlog_handle_default();
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = os_log_type_enabled(v15, OS_LOG_TYPE_INFO);
  if (v14)
  {
    if (v16)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C9A3B000, v15, OS_LOG_TYPE_INFO, "ATXDataStore: Migrating _ATXDataStore schema since current schema version is smaller than maxDbVersion in migration plan.", buf, 2u);
    }

    v17 = (void *)os_transaction_create();
    do
      v13 = -[_ATXDataStore migrateToVersion:withMigrationPlan:](self, "migrateToVersion:withMigrationPlan:", self->_schemaVersion + 1, v33);
    while (v13 == 3);

    goto LABEL_22;
  }
  if (v16)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C9A3B000, v15, OS_LOG_TYPE_INFO, "ATXDataStore: Not migrating _ATXDataStore since the current schema version is greater than or equal to the maxDBVersion in the migration plan.", buf, 2u);
  }

LABEL_33:
}

- (int64_t)skipFromZeroSchema
{
  void *v3;
  int64_t v4;
  NSObject *v6;

  +[_ATXDataStoreMigrations skipFromZeroSchema:](_ATXDataStoreMigrations, "skipFromZeroSchema:", &self->_schemaVersion);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[_ATXDataStore runMigrationPlan:](self, "runMigrationPlan:", v3);

  if (v4 == 3)
    return 1;
  __atxlog_handle_default();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    -[_ATXDataStore skipFromZeroSchema].cold.1();

  return 0;
}

- (int64_t)configureDatabase
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _PASSqliteDatabase *db;
  int v9;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v3 = objc_msgSend(&unk_1E83CFA70, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v17;
    v5 = MEMORY[0x1E0C809B0];
    while (2)
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v17 != v4)
          objc_enumerationMutation(&unk_1E83CFA70);
        v7 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v6);
        v12 = 0;
        v13 = &v12;
        v14 = 0x2020000000;
        v15 = 0;
        db = self->_db;
        v11[0] = v5;
        v11[1] = 3221225472;
        v11[2] = __34___ATXDataStore_configureDatabase__block_invoke;
        v11[3] = &unk_1E82DEF28;
        v11[4] = &v12;
        -[_PASSqliteDatabase prepAndRunQuery:onPrep:onRow:onError:](db, "prepAndRunQuery:onPrep:onRow:onError:", v7, 0, 0, v11);
        v9 = *((unsigned __int8 *)v13 + 24);
        _Block_object_dispose(&v12, 8);
        if (v9)
          return 0;
        ++v6;
      }
      while (v3 != v6);
      v3 = objc_msgSend(&unk_1E83CFA70, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v3)
        continue;
      break;
    }
  }
  return 1;
}

- (int64_t)migrateToVersion:(unint64_t)a3 withMigrationPlan:(id)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  int64_t v9;
  NSObject *v10;
  NSObject *v11;
  int64_t v12;
  int v14;
  unint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (self->_schemaVersion == a3 - 1)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", v7);
    v8 = objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      ++self->_schemaVersion;
      v9 = -[_ATXDataStore runMigrationPlan:](self, "runMigrationPlan:", v8);
      __atxlog_handle_default();
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = v10;
      if (v9 == 3)
      {
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          v14 = 134217984;
          v15 = a3;
          _os_log_impl(&dword_1C9A3B000, v11, OS_LOG_TYPE_INFO, "ATXDataStore: Migration to version %lu completed.", (uint8_t *)&v14, 0xCu);
        }
        v12 = 3;
      }
      else
      {
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          -[_ATXDataStore migrateToVersion:withMigrationPlan:].cold.1();
        v12 = 0;
      }

    }
    else
    {
      v12 = 1;
    }
  }
  else
  {
    __atxlog_handle_default();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[_ATXDataStore migrateToVersion:withMigrationPlan:].cold.2();
    v12 = 2;
  }

  return v12;
}

- (int64_t)runMigrationPlan:(id)a3
{
  id v4;
  _PASSqliteDatabase *db;
  id v6;
  int64_t v7;
  _QWORD v9[4];
  id v10;
  _ATXDataStore *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;

  v4 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  db = self->_db;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __34___ATXDataStore_runMigrationPlan___block_invoke;
  v9[3] = &unk_1E82E30F8;
  v6 = v4;
  v10 = v6;
  v11 = self;
  v12 = &v13;
  -[_PASSqliteDatabase frailWriteTransaction:](db, "frailWriteTransaction:", v9);
  v7 = v14[3];

  _Block_object_dispose(&v13, 8);
  return v7;
}

- (void)updateSchemaVersionNumberTo:(int64_t)a3
{
  _PASSqliteDatabase *db;
  _QWORD v4[5];

  db = self->_db;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __45___ATXDataStore_updateSchemaVersionNumberTo___block_invoke;
  v4[3] = &__block_descriptor_40_e29_v16__0___PASSqliteStatement_8l;
  v4[4] = a3;
  -[_PASSqliteDatabase prepAndRunQuery:onPrep:onRow:onError:](db, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("UPDATE meta SET version=? WHERE id=1"), v4, 0, &__block_literal_global_549);
}

- (void)clearDatabase
{
  void *v3;
  _PASSqliteDatabase *db;
  uint64_t v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  _PASSqliteDatabase *v13;
  _QWORD v14[5];
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _QWORD v19[5];
  _QWORD v20[4];
  id v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  db = self->_db;
  v5 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __30___ATXDataStore_clearDatabase__block_invoke;
  v20[3] = &unk_1E82DEC70;
  v6 = v3;
  v21 = v6;
  v19[0] = v5;
  v19[1] = 3221225472;
  v19[2] = __30___ATXDataStore_clearDatabase__block_invoke_2;
  v19[3] = &unk_1E82DCC28;
  v19[4] = self;
  -[_PASSqliteDatabase prepAndRunQuery:onPrep:onRow:onError:](db, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("SELECT name FROM sqlite_master WHERE type='table' AND NOT name LIKE 'sqlite_%'"), 0, v20, v19);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v22, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v16;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("DROP TABLE IF EXISTS %@"), *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v11));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = self->_db;
        v14[0] = MEMORY[0x1E0C809B0];
        v14[1] = 3221225472;
        v14[2] = __30___ATXDataStore_clearDatabase__block_invoke_3;
        v14[3] = &unk_1E82DCC28;
        v14[4] = self;
        -[_PASSqliteDatabase prepAndRunQuery:onPrep:onRow:onError:](v13, "prepAndRunQuery:onPrep:onRow:onError:", v12, 0, 0, v14);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v22, 16);
    }
    while (v9);
  }

}

- (int64_t)migration_LaunchHistoriesToAppTable
{
  _PASSqliteDatabase *db;
  int64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 3;
  db = self->_db;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __52___ATXDataStore_migration_LaunchHistoriesToAppTable__block_invoke;
  v5[3] = &unk_1E82DACD8;
  v5[4] = self;
  v5[5] = &v6;
  -[_PASSqliteDatabase writeTransaction:](db, "writeTransaction:", v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (int64_t)migration_InstallDateToAppTable
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  NSObject *v21;
  double v22;
  NSObject *v23;
  NSObject *v24;
  void *v25;
  char v26;
  id v27;
  NSObject *v28;
  id v30;
  void *v31;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  id v37;
  id v38;
  uint8_t buf[4];
  void *v40;
  __int16 v41;
  id v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CF94D8], "appPredictionDirectoryFile:", CFSTR("_ATXAppInstallDate.plist"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = 0;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithContentsOfFile:options:error:", v3, 2, &v38);
  v5 = v38;
  if (v4)
  {
    v6 = (void *)MEMORY[0x1CAA48B6C]();
    v7 = (void *)MEMORY[0x1E0C99E60];
    v8 = objc_opt_class();
    v9 = objc_opt_class();
    objc_msgSend(v7, "setWithObjects:", v8, v9, objc_opt_class(), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = v5;
    objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClasses:fromData:error:", v10, v4, &v37);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v37;

    if (v11)
    {
      v30 = v12;
      v31 = v4;

      objc_autoreleasePoolPop(v6);
      __atxlog_handle_app_install();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1C9A3B000, v13, OS_LOG_TYPE_DEFAULT, "ATXDataStore: Converting install date plist to app table", buf, 2u);
      }

      v35 = 0u;
      v36 = 0u;
      v33 = 0u;
      v34 = 0u;
      v14 = v11;
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v33, v43, 16);
      if (v15)
      {
        v16 = v15;
        v17 = *(_QWORD *)v34;
        do
        {
          for (i = 0; i != v16; ++i)
          {
            if (*(_QWORD *)v34 != v17)
              objc_enumerationMutation(v14);
            v19 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
            objc_msgSend(v14, "objectForKeyedSubscript:", v19);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            __atxlog_handle_app_install();
            v21 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543618;
              v40 = v20;
              v41 = 2112;
              v42 = v19;
              _os_log_impl(&dword_1C9A3B000, v21, OS_LOG_TYPE_DEFAULT, "ATXDataStore: Setting date: %{public}@ for bundle id: %@", buf, 0x16u);
            }

            objc_msgSend(v20, "timeIntervalSinceReferenceDate");
            -[_ATXDataStore migrationUpdateOrInsertTimestamp:intoColumn:forBundleId:](self, "migrationUpdateOrInsertTimestamp:intoColumn:forBundleId:", (uint64_t)v22, CFSTR("installDate"), v19);

          }
          v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v33, v43, 16);
        }
        while (v16);
      }

      v4 = v31;
      v12 = v30;
    }
    else
    {
      __atxlog_handle_default();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        -[_ATXDataStore migration_InstallDateToAppTable].cold.2();

      objc_autoreleasePoolPop(v6);
    }
  }
  else
  {
    __atxlog_handle_default();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      -[_ATXDataStore migration_InstallDateToAppTable].cold.1();

    v12 = v5;
  }
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = v12;
  v26 = objc_msgSend(v25, "removeItemAtPath:error:", v3, &v32);
  v27 = v32;

  if ((v26 & 1) == 0)
  {
    __atxlog_handle_default();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v40 = v3;
      v41 = 2112;
      v42 = v27;
      _os_log_impl(&dword_1C9A3B000, v28, OS_LOG_TYPE_DEFAULT, "Unable to remove %@: %@", buf, 0x16u);
    }

  }
  return 3;
}

- (int64_t)migration_AppLaunchHistogramToTable
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  char v13;
  id v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  uint64_t j;
  void *v21;
  void *v22;
  char v23;
  id v24;
  NSObject *v25;
  _ATXAppLaunchHistogramWithPersistentBackup *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t k;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  int v43;
  void *v44;
  void *v45;
  void *v46;
  void *v48;
  void *v49;
  void *v50;
  void *context;
  uint64_t v52;
  _ATXAppLaunchHistogramWithPersistentBackup *v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  id v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  id v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  _BYTE v68[128];
  uint8_t v69[128];
  uint8_t buf[4];
  void *v71;
  __int16 v72;
  id v73;
  _BYTE v74[128];
  uint64_t v75;

  v75 = *MEMORY[0x1E0C80C00];
  context = (void *)MEMORY[0x1CAA48B6C](self, a2);
  objc_msgSend(MEMORY[0x1E0CF94D8], "appPredictionDirectoryFile:", CFSTR("_ATXAppLaunchHistogram.v2.dat"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[_ATXDataStore loadDataFromFile:](_ATXDataStore, "loadDataFromFile:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[_ATXDataStore updateOrInsertHistogramData:forHistogram:](self, "updateOrInsertHistogramData:forHistogram:", v4, 0);
  objc_msgSend(MEMORY[0x1E0CF94D8], "appPredictionDirectoryFile:", CFSTR("_ATXSpotlightAppLaunchHistogram.v2.dat"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[_ATXDataStore loadDataFromFile:](_ATXDataStore, "loadDataFromFile:", v5);
  v6 = objc_claimAutoreleasedReturnValue();

  v50 = (void *)v6;
  -[_ATXDataStore updateOrInsertHistogramData:forHistogram:](self, "updateOrInsertHistogramData:forHistogram:", v6, 1);
  v66 = 0u;
  v67 = 0u;
  v64 = 0u;
  v65 = 0u;
  v7 = objc_msgSend(&unk_1E83CFA88, "countByEnumeratingWithState:objects:count:", &v64, v74, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v65;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v65 != v9)
          objc_enumerationMutation(&unk_1E83CFA88);
        objc_msgSend(MEMORY[0x1E0CF94D8], "appPredictionDirectoryFile:", *(_QWORD *)(*((_QWORD *)&v64 + 1) + 8 * i));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v63 = 0;
        v13 = objc_msgSend(v12, "removeItemAtPath:error:", v11, &v63);
        v14 = v63;

        if ((v13 & 1) == 0)
        {
          __atxlog_handle_default();
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            v71 = v11;
            v72 = 2112;
            v73 = v14;
            _os_log_impl(&dword_1C9A3B000, v15, OS_LOG_TYPE_DEFAULT, "Unable to remove %@: %@", buf, 0x16u);
          }

        }
      }
      v8 = objc_msgSend(&unk_1E83CFA88, "countByEnumeratingWithState:objects:count:", &v64, v74, 16);
    }
    while (v8);
  }
  v61 = 0u;
  v62 = 0u;
  v59 = 0u;
  v60 = 0u;
  v16 = objc_msgSend(&unk_1E83CFAA0, "countByEnumeratingWithState:objects:count:", &v59, v69, 16);
  if (v16)
  {
    v17 = v16;
    v18 = 0;
    v19 = *(_QWORD *)v60;
    do
    {
      for (j = 0; j != v17; ++j)
      {
        if (*(_QWORD *)v60 != v19)
          objc_enumerationMutation(&unk_1E83CFAA0);
        objc_msgSend(MEMORY[0x1E0CF94D8], "appPredictionDirectoryFile:", *(_QWORD *)(*((_QWORD *)&v59 + 1) + 8 * j));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v58 = 0;
        v23 = objc_msgSend(v22, "removeItemAtPath:error:", v21, &v58);
        v24 = v58;

        if ((v23 & 1) != 0)
        {
          v18 = 1;
        }
        else
        {
          __atxlog_handle_default();
          v25 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            v71 = v21;
            v72 = 2112;
            v73 = v24;
            _os_log_impl(&dword_1C9A3B000, v25, OS_LOG_TYPE_DEFAULT, "Unable to remove %@: %@", buf, 0x16u);
          }

        }
      }
      v17 = objc_msgSend(&unk_1E83CFAA0, "countByEnumeratingWithState:objects:count:", &v59, v69, 16);
    }
    while (v17);
    if ((v18 & 1) != 0)
    {
      v26 = -[_ATXAppLaunchHistogramWithPersistentBackup initWithDataStore:histogramType:loadFromDataStore:saveOnBackgroundQueue:]([_ATXAppLaunchHistogramWithPersistentBackup alloc], "initWithDataStore:histogramType:loadFromDataStore:saveOnBackgroundQueue:", self, 0, 0, 0);
      v53 = -[_ATXAppLaunchHistogramWithPersistentBackup initWithDataStore:histogramType:loadFromDataStore:saveOnBackgroundQueue:]([_ATXAppLaunchHistogramWithPersistentBackup alloc], "initWithDataStore:histogramType:loadFromDataStore:saveOnBackgroundQueue:", self, 1, 0, 0);
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "dateByAddingTimeInterval:", -1209600.0);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = v27;
      -[_ATXDuetHelper getAppLaunchesBetweenStartDate:endDate:](self->_duetHelper, "getAppLaunchesBetweenStartDate:endDate:");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v54 = 0u;
      v55 = 0u;
      v56 = 0u;
      v57 = 0u;
      v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v54, v68, 16);
      if (!v29)
        goto LABEL_38;
      v30 = v29;
      v31 = *(_QWORD *)v55;
      v32 = *MEMORY[0x1E0DAB248];
      v52 = *MEMORY[0x1E0DAB258];
      while (1)
      {
        for (k = 0; k != v30; ++k)
        {
          if (*(_QWORD *)v55 != v31)
            objc_enumerationMutation(v28);
          v34 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * k);
          objc_msgSend(v34, "bundleId");
          v35 = objc_claimAutoreleasedReturnValue();
          if (v35)
          {
            v36 = (void *)v35;
            objc_msgSend(v34, "startDate");
            v37 = (void *)objc_claimAutoreleasedReturnValue();

            if (v37)
            {
              objc_msgSend(v34, "bundleId");
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v34, "startDate");
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v34, "timeZone");
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              -[_ATXAppLaunchHistogramWithPersistentBackup addLaunchWithBundleId:date:timeZone:](v26, "addLaunchWithBundleId:date:timeZone:", v38, v39, v40);

              objc_msgSend(v34, "reason");
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v41, "isEqualToString:", v32))
              {

              }
              else
              {
                objc_msgSend(v34, "reason");
                v42 = (void *)objc_claimAutoreleasedReturnValue();
                v43 = objc_msgSend(v42, "isEqualToString:", v52);

                if (!v43)
                  continue;
              }
              objc_msgSend(v34, "bundleId");
              v44 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v34, "startDate");
              v45 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v34, "timeZone");
              v46 = (void *)objc_claimAutoreleasedReturnValue();
              -[_ATXAppLaunchHistogramWithPersistentBackup addLaunchWithBundleId:date:timeZone:](v53, "addLaunchWithBundleId:date:timeZone:", v44, v45, v46);

            }
          }
        }
        v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v54, v68, 16);
        if (!v30)
        {
LABEL_38:
          -[_ATXAppLaunchHistogramWithPersistentBackup flush](v26, "flush");
          -[_ATXAppLaunchHistogramWithPersistentBackup flush](v53, "flush");

          break;
        }
      }
    }
  }

  objc_autoreleasePoolPop(context);
  return 3;
}

- (int64_t)migration_RemoveFeedbackForUninstalledApps
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  _PASSqliteDatabase *db;
  id v11;
  _QWORD v13[4];
  id v14;
  _ATXDataStore *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CA5870], "enumeratorWithOptions:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v17;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v17 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v8), "bundleIdentifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v6);
  }
  db = self->_db;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __59___ATXDataStore_migration_RemoveFeedbackForUninstalledApps__block_invoke;
  v13[3] = &unk_1E82DF040;
  v14 = v3;
  v15 = self;
  v11 = v3;
  -[_PASSqliteDatabase prepAndRunQuery:onPrep:onRow:onError:](db, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("SELECT bundleId FROM app"), 0, v13, &__block_literal_global_576);

  return 3;
}

- (int64_t)migration_RemoveAllSubsequentLaunches
{
  -[_PASSqliteDatabase prepAndRunQuery:onPrep:onRow:onError:](self->_db, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("UPDATE appInfo SET subsequentLaunchCounts = NULL"), 0, 0, &__block_literal_global_579);
  return 3;
}

- (int64_t)migration_RemoveRestoreUserDefault
{
  id v2;
  void *v3;

  v2 = objc_alloc(MEMORY[0x1E0C99EA0]);
  v3 = (void *)objc_msgSend(v2, "initWithSuiteName:", *MEMORY[0x1E0CF9510]);
  objc_msgSend(v3, "removeObjectForKey:", CFSTR("RecentRestoreDate"));

  return 3;
}

- (int64_t)migration_DelinkFromCoreLocationVisitMonitoring
{
  NSObject *v2;
  id v3;
  _QWORD block[4];
  NSObject *v6;

  v2 = MEMORY[0x1E0C80D38];
  v3 = MEMORY[0x1E0C80D38];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64___ATXDataStore_migration_DelinkFromCoreLocationVisitMonitoring__block_invoke;
  block[3] = &unk_1E82DAC38;
  v6 = v2;
  dispatch_async(v2, block);

  return 3;
}

- (int64_t)migration_AddExtensionInfo
{
  void *v3;
  id v4;
  _QWORD v6[4];
  id v7;

  v3 = (void *)objc_opt_new();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __43___ATXDataStore_migration_AddExtensionInfo__block_invoke;
  v6[3] = &unk_1E82E3180;
  v7 = v3;
  v4 = v3;
  -[_ATXDataStore _enumerateAppInfoBundlesExecutingBlock:](self, "_enumerateAppInfoBundlesExecutingBlock:", v6);
  -[_ATXDataStore _markBundleIdsAsExtension:](self, "_markBundleIdsAsExtension:", v4);

  return 3;
}

- (int64_t)migration_AddEnterpriseAppInfo
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __47___ATXDataStore_migration_AddEnterpriseAppInfo__block_invoke;
  v3[3] = &unk_1E82E3180;
  v3[4] = self;
  -[_ATXDataStore _enumerateAppInfoBundlesExecutingBlock:](self, "_enumerateAppInfoBundlesExecutingBlock:", v3);
  return 3;
}

- (int64_t)migration_DeprecateGenericAppIntentModels
{
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  id v8;

  objc_msgSend(MEMORY[0x1E0CF94D8], "appPredictionDirectoryFile:", CFSTR("_APRParzenModel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  objc_msgSend(v4, "removeItemAtPath:error:", v3, &v8);
  v5 = v8;

  if (v5)
  {
    __atxlog_handle_default();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[_ATXDataStore migration_DeprecateGenericAppIntentModels].cold.1();

  }
  -[_PASSqliteDatabase prepAndRunQuery:onPrep:onRow:onError:](self->_db, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("DELETE FROM categoricalHistograms WHERE histogramType = :histogram_type"), &__block_literal_global_599, 0, &__block_literal_global_600);

  return 3;
}

- (int64_t)migration_PrefillActionHistograms
{
  ATXTriggerActionHistogramPrefillJob();
  return 3;
}

- (int64_t)migration_failForTests
{
  return 0;
}

- (int64_t)migration_moveCacheFiles
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if ((-[_PASSqliteDatabase isInMemory](self->_db, "isInMemory") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CF94D8], "appPredictionDirectory");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "contentsOfDirectoryAtPath:error:", v2, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v5)
    {
      v6 = v5;
      v7 = 0;
      v8 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v15 != v8)
            objc_enumerationMutation(v4);
          v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
          if (objc_msgSend(v10, "hasPrefix:", CFSTR("ATXCacheFile-")))
          {
            objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v2, "stringByAppendingPathComponent:", v10);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "removeItemAtPath:error:", v12, 0);

            v7 = 1;
          }
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v6);

      if ((v7 & 1) != 0)
        ATXUpdatePredictions(18, 1.0);
    }
    else
    {

    }
  }
  return 3;
}

- (int64_t)migration_DeprecateIntentForAllAppsHistograms
{
  -[_PASSqliteDatabase prepAndRunQuery:onPrep:onRow:onError:](self->_db, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("DELETE FROM histograms WHERE histogramType IN (:h1, :h2, :h3, :h4, :h5)"), &__block_literal_global_605, 0, &__block_literal_global_611);
  -[_PASSqliteDatabase prepAndRunQuery:onPrep:onRow:onError:](self->_db, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("DELETE FROM categoricalHistograms WHERE histogramType = :h1"), &__block_literal_global_615, 0, &__block_literal_global_617);
  return 3;
}

- (int64_t)migration_RemoveActionsWithoutTitle
{
  -[_ATXDataStore _removeActionsWithoutTitle](self, "_removeActionsWithoutTitle");
  return 3;
}

- (id)allActionsAndSlots
{
  _PASSqliteDatabase *db;
  id v4;
  _QWORD v6[5];
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__48;
  v12 = __Block_byref_object_dispose__48;
  v13 = (id)objc_opt_new();
  db = self->_db;
  v6[4] = &v8;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __35___ATXDataStore_allActionsAndSlots__block_invoke;
  v7[3] = &unk_1E82DCC00;
  v7[4] = &v8;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __35___ATXDataStore_allActionsAndSlots__block_invoke_2;
  v6[3] = &unk_1E82DEF28;
  -[_PASSqliteDatabase prepAndRunQuery:onPrep:onRow:onError:](db, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("SELECT slots, id FROM alog"), 0, v7, v6);
  v4 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v4;
}

- (BOOL)writeSlotSetKeyParameters:(id)a3 rowId:(id)a4 slotSet:(id)a5 success:(int64_t *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  _PASSqliteDatabase *db;
  uint64_t v15;
  char v16;
  NSObject *v17;
  _QWORD v19[4];
  id v20;
  id v21;
  int64_t *v22;
  _QWORD v23[4];
  id v24;
  id v25;
  id v26;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  objc_msgSend(v12, "uuid");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    db = self->_db;
    v15 = MEMORY[0x1E0C809B0];
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __65___ATXDataStore_writeSlotSetKeyParameters_rowId_slotSet_success___block_invoke;
    v23[3] = &unk_1E82DF220;
    v24 = v11;
    v25 = v12;
    v26 = v10;
    v19[0] = v15;
    v19[1] = 3221225472;
    v19[2] = __65___ATXDataStore_writeSlotSetKeyParameters_rowId_slotSet_success___block_invoke_2;
    v19[3] = &unk_1E82E3268;
    v20 = v25;
    v21 = v24;
    v22 = a6;
    v16 = -[_PASSqliteDatabase prepAndRunQuery:onPrep:onRow:onError:](db, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("INSERT OR IGNORE INTO slotSetKey (alogId, uuid, paramHash, slotHash, paramCount) VALUES (?, ?, ?, ?, ?)"), v23, 0, v19);

  }
  else
  {
    __atxlog_handle_default();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      -[_ATXDataStore writeSlotSetKeyParameters:rowId:slotSet:success:].cold.1((uint64_t)v12);

    v16 = 0;
    *a6 = 0;
  }

  return v16;
}

- (int64_t)updateAlog:(id)a3 slotsToMigrate:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _PASSqliteDatabase *db;
  uint64_t v15;
  int64_t v16;
  NSObject *v17;
  _QWORD v19[4];
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "objectForKeyedSubscript:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "first");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "objectForKeyedSubscript:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "second");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  ATXSlotSetsSerialize();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
  {
    db = self->_db;
    v15 = MEMORY[0x1E0C809B0];
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __43___ATXDataStore_updateAlog_slotsToMigrate___block_invoke;
    v21[3] = &unk_1E82DCB88;
    v22 = v12;
    v23 = v6;
    v19[0] = v15;
    v19[1] = 3221225472;
    v19[2] = __43___ATXDataStore_updateAlog_slotsToMigrate___block_invoke_2;
    v19[3] = &unk_1E82DCC28;
    v20 = v23;
    if (-[_PASSqliteDatabase prepAndRunQuery:onPrep:onRow:onError:](db, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("UPDATE alog SET slots = ? WHERE id = ?"), v21, 0, v19))v16 = 3;
    else
      v16 = 0;

  }
  else
  {
    __atxlog_handle_default();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      -[_ATXDataStore updateAlog:slotsToMigrate:].cold.1((uint64_t)v11);

    v16 = 0;
  }

  return v16;
}

- (int64_t)migration_SlotSetKeyCreation
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  ATXMinimalSlotResolutionParameters *v17;
  int64_t v18;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  int64_t v32;
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  -[_ATXDataStore allActionsAndSlots](self, "allActionsAndSlots");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v32 = 3;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v22 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
    if (v22)
    {
      v20 = *(_QWORD *)v29;
      v21 = v4;
      do
      {
        v5 = 0;
        do
        {
          if (*(_QWORD *)v29 != v20)
            objc_enumerationMutation(v4);
          v23 = v5;
          v6 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * v5);
          objc_msgSend(v4, "objectForKeyedSubscript:", v6, v20);
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "first");
          v8 = (void *)objc_claimAutoreleasedReturnValue();

          v26 = 0u;
          v27 = 0u;
          v24 = 0u;
          v25 = 0u;
          objc_msgSend(v4, "objectForKeyedSubscript:", v6);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "second");
          v10 = (void *)objc_claimAutoreleasedReturnValue();

          v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v33, 16);
          if (v11)
          {
            v12 = v11;
            v13 = *(_QWORD *)v25;
            do
            {
              for (i = 0; i != v12; ++i)
              {
                if (*(_QWORD *)v25 != v13)
                  objc_enumerationMutation(v10);
                v15 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
                v16 = (void *)objc_opt_new();
                objc_msgSend(v15, "setUuid:", v16);
                v17 = -[ATXMinimalSlotResolutionParameters initWithAction:slots:]([ATXMinimalSlotResolutionParameters alloc], "initWithAction:slots:", v8, v15);
                -[_ATXDataStore writeSlotSetKeyParameters:rowId:slotSet:success:](self, "writeSlotSetKeyParameters:rowId:slotSet:success:", v17, v6, v15, &v32);

              }
              v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v33, 16);
            }
            while (v12);
          }

          v4 = v21;
          if (v32 == 3)
            v32 = -[_ATXDataStore updateAlog:slotsToMigrate:](self, "updateAlog:slotsToMigrate:", v6, v21);

          v5 = v23 + 1;
        }
        while (v23 + 1 != v22);
        v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
      }
      while (v22);
    }
    v18 = v32;
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (int64_t)_regenerateSlotSetKeys
{
  -[_PASSqliteDatabase prepAndRunNonDataQueries:onError:](self->_db, "prepAndRunNonDataQueries:onError:", &unk_1E83CFAB8, 0);
  return -[_ATXDataStore migration_SlotSetKeyCreation](self, "migration_SlotSetKeyCreation");
}

- (int64_t)migration_RemoveCachedConsumerDB
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CF94D8], "appPredictionDirectoryFile:", CFSTR("cachedDataStore"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeItemAtPath:error:", v2, 0);
  objc_msgSend(v2, "stringByAppendingString:", CFSTR("-shm"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeItemAtPath:error:", v4, 0);

  objc_msgSend(v2, "stringByAppendingString:", CFSTR("-wal"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeItemAtPath:error:", v5, 0);

  return 3;
}

- (int64_t)migration_AddFeedbackColumns
{
  _PASSqliteDatabase *db;
  uint64_t v4;
  int v5;
  int64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _PASSqliteDatabase *v11;
  _QWORD v13[5];
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD v22[5];
  _QWORD v23[5];
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  int v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v24 = 0;
  v25 = &v24;
  v26 = 0x2020000000;
  v27 = 0;
  db = self->_db;
  v4 = MEMORY[0x1E0C809B0];
  v22[4] = &v24;
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __45___ATXDataStore_migration_AddFeedbackColumns__block_invoke;
  v23[3] = &unk_1E82DCC00;
  v23[4] = &v24;
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __45___ATXDataStore_migration_AddFeedbackColumns__block_invoke_2;
  v22[3] = &unk_1E82DEF28;
  -[_PASSqliteDatabase prepAndRunQuery:onPrep:onRow:onError:](db, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("SELECT name FROM pragma_table_info('afeedback') WHERE name IN ('consumerSubType', 'feedbackType')"), 0, v23, v22);
  v5 = *((_DWORD *)v25 + 6);
  if (v5)
  {
    if (v5 == 2)
      v6 = 3;
    else
      v6 = 0;
  }
  else
  {
    v18 = 0;
    v19 = &v18;
    v20 = 0x2020000000;
    v21 = 3;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v7 = objc_msgSend(&unk_1E83CFAD0, "countByEnumeratingWithState:objects:count:", &v14, v28, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v15;
      while (2)
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v15 != v8)
            objc_enumerationMutation(&unk_1E83CFAD0);
          v10 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v9);
          v11 = self->_db;
          v13[0] = v4;
          v13[1] = 3221225472;
          v13[2] = __45___ATXDataStore_migration_AddFeedbackColumns__block_invoke_3;
          v13[3] = &unk_1E82DEF28;
          v13[4] = &v18;
          -[_PASSqliteDatabase prepAndRunQuery:onPrep:onRow:onError:](v11, "prepAndRunQuery:onPrep:onRow:onError:", v10, 0, 0, v13);
          if (!v19[3])
          {
            v6 = 0;
            goto LABEL_15;
          }
          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(&unk_1E83CFAD0, "countByEnumeratingWithState:objects:count:", &v14, v28, 16);
        if (v7)
          continue;
        break;
      }
    }
    v6 = v19[3];
LABEL_15:
    _Block_object_dispose(&v18, 8);
  }
  _Block_object_dispose(&v24, 8);
  return v6;
}

- (int64_t)migration_RecreatePredictionFeedbackInfo
{
  uint64_t v3;
  _PASSqliteDatabase *db;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  _PASSqliteDatabase *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t j;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _PASSqliteDatabase *v20;
  id v21;
  id v22;
  id v23;
  id v24;
  int64_t v25;
  id obj;
  _QWORD v28[5];
  _QWORD v29[4];
  id v30;
  id v31;
  id v32;
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _QWORD v38[5];
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t v46;
  _QWORD v47[5];
  uint64_t v48;
  uint64_t *v49;
  uint64_t v50;
  uint64_t (*v51)(uint64_t, uint64_t);
  void (*v52)(uint64_t);
  id v53;
  _BYTE v54[128];
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v48 = 0;
  v49 = &v48;
  v50 = 0x3032000000;
  v51 = __Block_byref_object_copy__48;
  v52 = __Block_byref_object_dispose__48;
  v53 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v3 = MEMORY[0x1E0C809B0];
  db = self->_db;
  v47[0] = MEMORY[0x1E0C809B0];
  v47[1] = 3221225472;
  v47[2] = __57___ATXDataStore_migration_RecreatePredictionFeedbackInfo__block_invoke;
  v47[3] = &unk_1E82DCC00;
  v47[4] = &v48;
  -[_PASSqliteDatabase prepAndRunQuery:onPrep:onRow:onError:](db, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("SELECT appAction, predictionsCount, feedbackCount, uiType FROM predictionFeedbackInfo WHERE uiType IS NOT NULL"), 0, v47, &__block_literal_global_636);
  v43 = 0;
  v44 = &v43;
  v45 = 0x2020000000;
  v46 = 3;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v5 = objc_msgSend(&unk_1E83CFAE8, "countByEnumeratingWithState:objects:count:", &v39, v55, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v40;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v40 != v6)
          objc_enumerationMutation(&unk_1E83CFAE8);
        v8 = *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * i);
        v9 = self->_db;
        v38[0] = v3;
        v38[1] = 3221225472;
        v38[2] = __57___ATXDataStore_migration_RecreatePredictionFeedbackInfo__block_invoke_3;
        v38[3] = &unk_1E82DEF28;
        v38[4] = &v43;
        -[_PASSqliteDatabase prepAndRunQuery:onPrep:onRow:onError:](v9, "prepAndRunQuery:onPrep:onRow:onError:", v8, 0, 0, v38);
        if (!v44[3])
        {
LABEL_19:
          v25 = 0;
          goto LABEL_20;
        }
      }
      v5 = objc_msgSend(&unk_1E83CFAE8, "countByEnumeratingWithState:objects:count:", &v39, v55, 16);
      if (v5)
        continue;
      break;
    }
  }
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  obj = (id)v49[5];
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v54, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v35;
    while (2)
    {
      for (j = 0; j != v10; ++j)
      {
        if (*(_QWORD *)v35 != v11)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * j);
        objc_msgSend(v13, "first");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "second");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)v49[5], "objectForKeyedSubscript:", v13);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "first");
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend((id)v49[5], "objectForKeyedSubscript:", v13);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "second");
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        v20 = self->_db;
        v29[0] = v3;
        v29[1] = 3221225472;
        v29[2] = __57___ATXDataStore_migration_RecreatePredictionFeedbackInfo__block_invoke_4;
        v29[3] = &unk_1E82E2E80;
        v21 = v14;
        v30 = v21;
        v22 = v17;
        v31 = v22;
        v23 = v19;
        v32 = v23;
        v24 = v15;
        v33 = v24;
        v28[0] = v3;
        v28[1] = 3221225472;
        v28[2] = __57___ATXDataStore_migration_RecreatePredictionFeedbackInfo__block_invoke_5;
        v28[3] = &unk_1E82DEF28;
        v28[4] = &v43;
        -[_PASSqliteDatabase prepAndRunQuery:onPrep:onRow:onError:](v20, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("INSERT INTO predictionFeedbackInfo (appAction, predictionsCount, feedbackCount, uiType) VALUES (:appAction, :predictionsCount, :feedbackCount, :uiType)"), v29, 0, v28);
        LOBYTE(v20) = v44[3] == 0;

        if ((v20 & 1) != 0)
        {

          goto LABEL_19;
        }
      }
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v54, 16);
      if (v10)
        continue;
      break;
    }
  }

  v25 = v44[3];
LABEL_20:
  _Block_object_dispose(&v43, 8);
  _Block_object_dispose(&v48, 8);

  return v25;
}

- (int64_t)migration_RemoveDeprecatedStartCallIntents
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int64_t v8;
  int64_t v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", CFSTR("com.apple.mobilephone"), CFSTR("com.apple.facetime"), 0);
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    while (2)
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        v8 = -[_ATXDataStore _regenerateSlotSetKeyForBundleId:](self, "_regenerateSlotSetKeyForBundleId:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v7));
        if (v8 != 3)
        {
          v9 = v8;
          goto LABEL_11;
        }
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v5)
        continue;
      break;
    }
  }
  v9 = 3;
LABEL_11:

  return v9;
}

- (int64_t)migration_removeBrokenBlendingStream
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  id v10;

  __atxlog_handle_default();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    -[_ATXDataStore migration_removeBrokenBlendingStream].cold.2();

  objc_msgSend(MEMORY[0x1E0CF94D8], "appPredictionDirectory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingPathComponent:", CFSTR("streams"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByAppendingPathComponent:", CFSTR("blending"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  objc_msgSend(v6, "removeItemAtPath:error:", v5, &v10);
  v7 = v10;

  if (v7)
  {
    __atxlog_handle_default();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[_ATXDataStore migration_removeBrokenBlendingStream].cold.1();

  }
  return 3;
}

- (void)updateOrInsertSubsequentLaunchCountData:(id)a3 forBundleId:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _PASSqliteDatabase *db;
  NSObject *v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v7)
  {
    db = self->_db;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __69___ATXDataStore_updateOrInsertSubsequentLaunchCountData_forBundleId___block_invoke;
    v11[3] = &unk_1E82DCB88;
    v12 = v7;
    v13 = v6;
    -[_PASSqliteDatabase prepAndRunQuery:onPrep:onRow:onError:](db, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("INSERT INTO appInfo (bundleId, subsequentLaunchCounts) VALUES (:bundle_id, :launch_count) ON CONFLICT(bundleId) DO UPDATE SET subsequentLaunchCounts=excluded.subsequentLaunchCounts"), v11, 0, 0);

  }
  else
  {
    __atxlog_handle_default();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      -[_ATXDataStore updateOrInsertSubsequentLaunchCountData:forBundleId:].cold.1();

  }
}

- (int64_t)migration_removeAnchorModelDirectory
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  id v9;
  uint8_t buf[16];

  __atxlog_handle_default();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C9A3B000, v2, OS_LOG_TYPE_DEFAULT, "Removing Anchor Model Directory", buf, 2u);
  }

  objc_msgSend(MEMORY[0x1E0CF94D8], "appPredictionDirectory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingPathComponent:", CFSTR("AnchorModel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  objc_msgSend(v5, "removeItemAtPath:error:", v4, &v9);
  v6 = v9;

  if (v6)
  {
    __atxlog_handle_default();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[_ATXDataStore migration_removeAnchorModelDirectory].cold.1();

  }
  return 3;
}

- (int64_t)migration_updateNewAzulSystemAppsInstallDate
{
  NSObject *v2;
  id v3;
  void *v4;
  uint8_t v6[16];

  __atxlog_handle_app_install();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1C9A3B000, v2, OS_LOG_TYPE_DEFAULT, "ATXDataStore: Setting Azul migration key", v6, 2u);
  }

  v3 = objc_alloc(MEMORY[0x1E0C99EA0]);
  v4 = (void *)objc_msgSend(v3, "initWithSuiteName:", *MEMORY[0x1E0CF9510]);
  objc_msgSend(v4, "setBool:forKey:", 1, CFSTR("azulMigration"));

  return 3;
}

- (int64_t)migration_forceUpdateNewAzulSystemAppsInstallDate
{
  NSObject *v3;
  _PASSqliteDatabase *db;
  int64_t v5;
  _QWORD v7[5];
  uint8_t buf[8];
  uint8_t *v9;
  uint64_t v10;
  uint64_t v11;

  __atxlog_handle_app_install();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C9A3B000, v3, OS_LOG_TYPE_DEFAULT, "ATXDataStore: Force updating install date of newly added system apps", buf, 2u);
  }

  *(_QWORD *)buf = 0;
  v9 = buf;
  v10 = 0x2020000000;
  v11 = 3;
  db = self->_db;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __66___ATXDataStore_migration_forceUpdateNewAzulSystemAppsInstallDate__block_invoke_2;
  v7[3] = &unk_1E82DEF28;
  v7[4] = buf;
  -[_PASSqliteDatabase prepAndRunQuery:onPrep:onRow:onError:](db, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("UPDATE appInfo SET installDate = :new_timestamp WHERE bundleId IN (:translate_app, :magnifier_app)"), &__block_literal_global_664, 0, v7);
  v5 = *((_QWORD *)v9 + 3);
  _Block_object_dispose(buf, 8);
  return v5;
}

- (int64_t)migration_updateNewCrystalSystemAppsInstallDate
{
  NSObject *v2;
  id v3;
  void *v4;
  uint8_t v6[16];

  __atxlog_handle_app_install();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1C9A3B000, v2, OS_LOG_TYPE_DEFAULT, "ATXDataStore: Setting Crystal migration key", v6, 2u);
  }

  v3 = objc_alloc(MEMORY[0x1E0C99EA0]);
  v4 = (void *)objc_msgSend(v3, "initWithSuiteName:", *MEMORY[0x1E0CF9510]);
  objc_msgSend(v4, "setBool:forKey:", 1, CFSTR("crystalMigration"));

  return 3;
}

- (int64_t)migration_forceUpdateNewCrystalSystemAppsInstallDate
{
  NSObject *v3;
  uint64_t v4;
  _PASSqliteDatabase *db;
  _PASSqliteDatabase *v6;
  int64_t v7;
  _QWORD v9[5];
  _QWORD v10[5];
  uint8_t buf[8];
  uint8_t *v12;
  uint64_t v13;
  uint64_t v14;

  __atxlog_handle_app_install();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C9A3B000, v3, OS_LOG_TYPE_DEFAULT, "ATXDataStore: Force updating install date of newly added system apps in Crystal", buf, 2u);
  }

  *(_QWORD *)buf = 0;
  v12 = buf;
  v13 = 0x2020000000;
  v14 = 3;
  v4 = MEMORY[0x1E0C809B0];
  db = self->_db;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __69___ATXDataStore_migration_forceUpdateNewCrystalSystemAppsInstallDate__block_invoke_2;
  v10[3] = &unk_1E82DEF28;
  v10[4] = buf;
  -[_PASSqliteDatabase prepAndRunQuery:onPrep:onRow:onError:](db, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("UPDATE appInfo SET installDate = :new_timestamp WHERE bundleId IN (:generativePlayground_app, :printCenter_app, :tvRemote_app, :passwords_app)"), &__block_literal_global_676, 0, v10);
  if (objc_msgSend(MEMORY[0x1E0D81588], "isiPad"))
  {
    v6 = self->_db;
    v9[0] = v4;
    v9[1] = 3221225472;
    v9[2] = __69___ATXDataStore_migration_forceUpdateNewCrystalSystemAppsInstallDate__block_invoke_2_694;
    v9[3] = &unk_1E82DEF28;
    v9[4] = buf;
    -[_PASSqliteDatabase prepAndRunQuery:onPrep:onRow:onError:](v6, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("UPDATE appInfo SET installDate = :new_timestamp WHERE bundleId IN (:calculator_app)"), &__block_literal_global_690, 0, v9);
  }
  v7 = *((_QWORD *)v12 + 3);
  _Block_object_dispose(buf, 8);
  return v7;
}

- (int64_t)migration_overrideNilInstallDateToDistantOldTime
{
  NSObject *v3;
  _PASSqliteDatabase *db;
  int64_t v5;
  _QWORD v7[5];
  uint8_t buf[8];
  uint8_t *v9;
  uint64_t v10;
  uint64_t v11;

  __atxlog_handle_app_install();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C9A3B000, v3, OS_LOG_TYPE_DEFAULT, "ATXDataStore: Overriding apps with nil install date with distant old install date", buf, 2u);
  }

  *(_QWORD *)buf = 0;
  v9 = buf;
  v10 = 0x2020000000;
  v11 = 3;
  db = self->_db;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __65___ATXDataStore_migration_overrideNilInstallDateToDistantOldTime__block_invoke_2;
  v7[3] = &unk_1E82DEF28;
  v7[4] = buf;
  -[_PASSqliteDatabase prepAndRunQuery:onPrep:onRow:onError:](db, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("UPDATE appInfo SET installDate = :new_timestamp WHERE installDate IS NULL"), &__block_literal_global_697, 0, v7);
  v5 = *((_QWORD *)v9 + 3);
  _Block_object_dispose(buf, 8);
  return v5;
}

- (int64_t)migration_removeOldStackStateTrackerFile
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  id v9;
  uint8_t buf[16];

  __atxlog_handle_default();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C9A3B000, v2, OS_LOG_TYPE_DEFAULT, "Removing old Stack State Tracker file", buf, 2u);
  }

  objc_msgSend(MEMORY[0x1E0CF94D8], "appPredictionCacheDirectory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingPathComponent:", CFSTR("ATXStackStates"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  objc_msgSend(v5, "removeItemAtPath:error:", v4, &v9);
  v6 = v9;

  if (v6)
  {
    __atxlog_handle_default();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[_ATXDataStore migration_removeOldStackStateTrackerFile].cold.1();

  }
  return 3;
}

- (int64_t)migration_removeHomeScreenWidgetBlacklistFile
{
  NSObject *v2;
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  id v8;
  uint8_t buf[16];

  __atxlog_handle_default();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C9A3B000, v2, OS_LOG_TYPE_DEFAULT, "Removing home screen widget blacklist file", buf, 2u);
  }

  objc_msgSend(MEMORY[0x1E0CF94D8], "appPredictionDirectoryFile:", CFSTR("ATXHomeScreenWidgetBlacklist"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  objc_msgSend(v4, "removeItemAtPath:error:", v3, &v8);
  v5 = v8;

  if (v5)
  {
    __atxlog_handle_default();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[_ATXDataStore migration_removeHomeScreenWidgetBlacklistFile].cold.1();

  }
  return 3;
}

- (int64_t)migration_populateModeCaches
{
  NSObject *v2;

  dispatch_get_global_queue(17, 0);
  v2 = objc_claimAutoreleasedReturnValue();
  dispatch_async(v2, &__block_literal_global_702);

  return 3;
}

- (int64_t)migration_deleteFocusSpaceCaches
{
  NSObject *v2;
  uint64_t v3;
  __int128 v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  NSObject *v26;
  NSObject *v27;
  char v28;
  uint64_t v29;
  NSObject *v30;
  __int128 v32;
  __int128 v33;
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  id v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint8_t v44[128];
  uint8_t buf[4];
  id v46;
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  __atxlog_handle_default();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C9A3B000, v2, OS_LOG_TYPE_DEFAULT, "Removing focus space layout cache files", buf, 2u);
  }

  v43 = 0u;
  v41 = 0u;
  v42 = 0u;
  v40 = 0u;
  v3 = objc_msgSend(&unk_1E83CFB00, "countByEnumeratingWithState:objects:count:", &v40, v47, 16);
  if (!v3)
  {
    v6 = 0;
    goto LABEL_19;
  }
  v5 = v3;
  v6 = 0;
  v7 = *(_QWORD *)v41;
  *(_QWORD *)&v4 = 138412290;
  v32 = v4;
  do
  {
    v8 = 0;
    v9 = v6;
    do
    {
      if (*(_QWORD *)v41 != v7)
        objc_enumerationMutation(&unk_1E83CFB00);
      v10 = *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * v8);
      objc_msgSend(MEMORY[0x1E0CF94D8], "uiCachesRootDirectory", v32);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "stringByAppendingPathComponent:", v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      __atxlog_handle_default();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = v32;
        v46 = v12;
        _os_log_debug_impl(&dword_1C9A3B000, v13, OS_LOG_TYPE_DEBUG, "Deleting deprecated UI cache file: %@", buf, 0xCu);
      }

      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v14 = objc_claimAutoreleasedReturnValue();
      v39 = v9;
      v15 = -[NSObject removeItemAtPath:error:](v14, "removeItemAtPath:error:", v12, &v39);
      v6 = v39;

      if ((v15 & 1) == 0)
      {
        v16 = objc_msgSend(v6, "code");

        if (v16 == 4)
          goto LABEL_15;
        __atxlog_handle_default();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = v32;
          v46 = v6;
          _os_log_error_impl(&dword_1C9A3B000, v14, OS_LOG_TYPE_ERROR, "Failed to delete deprecated UI cache file: %@", buf, 0xCu);
        }
      }

LABEL_15:
      ++v8;
      v9 = v6;
    }
    while (v5 != v8);
    v5 = objc_msgSend(&unk_1E83CFB00, "countByEnumeratingWithState:objects:count:", &v40, v47, 16);
  }
  while (v5);
LABEL_19:
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v17 = objc_msgSend(&unk_1E83CFB18, "countByEnumeratingWithState:objects:count:", &v35, v44, 16);
  if (!v17)
    goto LABEL_33;
  v19 = v17;
  v20 = *(_QWORD *)v36;
  *(_QWORD *)&v18 = 138412290;
  v33 = v18;
  while (2)
  {
    v21 = 0;
    v22 = v6;
    while (2)
    {
      if (*(_QWORD *)v36 != v20)
        objc_enumerationMutation(&unk_1E83CFB18);
      v23 = *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * v21);
      objc_msgSend(MEMORY[0x1E0CF94D8], "clientModelCachesRootDirectory", v33);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "stringByAppendingPathComponent:", v23);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      __atxlog_handle_default();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = v33;
        v46 = v25;
        _os_log_debug_impl(&dword_1C9A3B000, v26, OS_LOG_TYPE_DEBUG, "Deleting deprecated client model file: %@", buf, 0xCu);
      }

      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v27 = objc_claimAutoreleasedReturnValue();
      v34 = v22;
      v28 = -[NSObject removeItemAtPath:error:](v27, "removeItemAtPath:error:", v25, &v34);
      v6 = v34;

      if ((v28 & 1) != 0)
      {
LABEL_30:

      }
      else
      {
        v29 = objc_msgSend(v6, "code");

        if (v29 != 4)
        {
          __atxlog_handle_default();
          v27 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v33;
            v46 = v6;
            _os_log_error_impl(&dword_1C9A3B000, v27, OS_LOG_TYPE_ERROR, "Failed to delete deprecated client model file: %@", buf, 0xCu);
          }
          goto LABEL_30;
        }
      }

      ++v21;
      v22 = v6;
      if (v19 != v21)
        continue;
      break;
    }
    v19 = objc_msgSend(&unk_1E83CFB18, "countByEnumeratingWithState:objects:count:", &v35, v44, 16);
    if (v19)
      continue;
    break;
  }
LABEL_33:
  __atxlog_handle_default();
  v30 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C9A3B000, v30, OS_LOG_TYPE_DEFAULT, "Done removing focus space layout cache files", buf, 2u);
  }

  return 3;
}

- (int64_t)migration_deleteAllTrainedRelevanceModels
{
  NSObject *v3;
  NSObject *v4;
  uint8_t v6[16];
  uint8_t buf[16];

  __atxlog_handle_default();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C9A3B000, v3, OS_LOG_TYPE_DEFAULT, "Deleting all trained relevance models for migration", buf, 2u);
  }

  -[_PASSqliteDatabase prepAndRunNonDataQueries:onError:](self->_db, "prepAndRunNonDataQueries:onError:", &unk_1E83CFB30, 0);
  __atxlog_handle_default();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1C9A3B000, v4, OS_LOG_TYPE_DEFAULT, "Done deleting all trained relevance models for migration.", v6, 2u);
  }

  return 3;
}

- (int64_t)migration_purgeExpensiveCachesFromUserDefaults
{
  NSObject *v2;
  id v3;
  void *v4;
  uint8_t v6[16];

  __atxlog_handle_default();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1C9A3B000, v2, OS_LOG_TYPE_DEFAULT, "Purging expensive caches from user defaults", v6, 2u);
  }

  v3 = objc_alloc(MEMORY[0x1E0C99EA0]);
  v4 = (void *)objc_msgSend(v3, "initWithSuiteName:", *MEMORY[0x1E0CF9510]);
  objc_msgSend(v4, "removeObjectForKey:", CFSTR("cachedFamilyCircle"));
  objc_msgSend(v4, "removeObjectForKey:", CFSTR("com.apple.duetexpertd.AnchorModelScheduler.CurrentPredictions"));

  return 3;
}

- (void)updateOrInsertSubsequentAppActionLaunchCountData:(id)a3 forAppAction:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  const __CFString *v10;
  NSObject *v11;
  _PASSqliteDatabase *db;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v7)
  {
    if (objc_msgSend(v7, "hasSuffix:", CFSTR("#AppLaunched")))
    {
      objc_msgSend(v8, "substringWithRange:", 0, objc_msgSend(v8, "length") - objc_msgSend(CFSTR(":#AppLaunched"), "length"));
      v9 = (id)objc_claimAutoreleasedReturnValue();
      v10 = CFSTR("INSERT INTO appInfo (bundleId, subsequentAppActionLaunchCounts) VALUES (:key, :launch_count) ON CONFLICT(bundleId) DO UPDATE SET subsequentAppActionLaunchCounts=excluded.subsequentAppActionLaunchCounts");
    }
    else
    {
      v9 = v8;
      v10 = CFSTR("INSERT INTO appActionInfo (appAction, subsequentAppActionLaunchCounts) VALUES (:key, :launch_count) ON CONFLICT(appAction) DO UPDATE SET subsequentAppActionLaunchCounts=excluded.subsequentAppActionLaunchCounts");
    }
    db = self->_db;
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __79___ATXDataStore_updateOrInsertSubsequentAppActionLaunchCountData_forAppAction___block_invoke;
    v14[3] = &unk_1E82DCB88;
    v15 = v9;
    v16 = v6;
    v13 = v9;
    -[_PASSqliteDatabase prepAndRunQuery:onPrep:onRow:onError:](db, "prepAndRunQuery:onPrep:onRow:onError:", v10, v14, 0, 0);

  }
  else
  {
    __atxlog_handle_default();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      -[_ATXDataStore updateOrInsertSubsequentAppActionLaunchCountData:forAppAction:].cold.1();

  }
}

- (void)updateOrInsertPredictionsAndFeedbackForAppAction:(id)a3 feedbackReceived:(BOOL)a4 forUIType:(id)a5
{
  id v8;
  id v9;
  _PASSqliteDatabase *db;
  NSObject *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  BOOL v15;

  v8 = a3;
  v9 = a5;
  if (v8)
  {
    db = self->_db;
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __93___ATXDataStore_updateOrInsertPredictionsAndFeedbackForAppAction_feedbackReceived_forUIType___block_invoke;
    v12[3] = &unk_1E82E3350;
    v13 = v8;
    v14 = v9;
    v15 = a4;
    -[_PASSqliteDatabase prepAndRunQuery:onPrep:onRow:onError:](db, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("INSERT INTO predictionFeedbackInfo (appAction, predictionsCount, feedbackCount, uiType) VALUES (:app_action, 1, :feedback_count, :ui_type) ON CONFLICT(appAction, uiType) DO UPDATE SET predictionsCount = predictionsCount + 1, feedbackCount = feedbackCount + :feedback_count"), v12, 0, 0);

  }
  else
  {
    __atxlog_handle_default();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      -[_ATXDataStore updateOrInsertPredictionsAndFeedbackForAppAction:feedbackReceived:forUIType:].cold.1();

  }
}

- (void)updateOrInsertMessageRecipient:(id)a3 dateMessaged:(id)a4
{
  id v6;
  id v7;
  _PASSqliteDatabase *db;
  NSObject *v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  if (v6)
  {
    db = self->_db;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __61___ATXDataStore_updateOrInsertMessageRecipient_dateMessaged___block_invoke;
    v10[3] = &unk_1E82DCB88;
    v11 = v6;
    v12 = v7;
    -[_PASSqliteDatabase prepAndRunQuery:onPrep:onRow:onError:](db, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("INSERT INTO messageRecipients (recipientName, lastDateMessaged) VALUES (:recipient, :date_messaged) ON CONFLICT(recipientName) DO UPDATE SET lastDateMessaged=excluded.lastDateMessaged"), v10, 0, 0);

  }
  else
  {
    __atxlog_handle_default();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      -[_ATXDataStore updateOrInsertMessageRecipient:dateMessaged:].cold.1();

  }
}

- (void)updateOrInsertAverageSecondsBetweenLaunches:(id)a3 forBundleId:(id)a4
{
  id v6;
  void *v7;
  _PASSqliteDatabase *db;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v9 = a3;
  v6 = a4;
  v7 = v6;
  if (v6)
  {
    db = self->_db;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __73___ATXDataStore_updateOrInsertAverageSecondsBetweenLaunches_forBundleId___block_invoke;
    v10[3] = &unk_1E82DCB88;
    v11 = v6;
    v12 = v9;
    -[_PASSqliteDatabase prepAndRunQuery:onPrep:onRow:onError:](db, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("INSERT INTO appInfo (bundleId, averageSecondsBetweenLaunches) VALUES (:bundle_id, :average_seconds_between_launches) ON CONFLICT(bundleId) DO UPDATE SET averageSecondsBetweenLaunches=excluded.averageSecondsBetweenLaunches"), v10, 0, 0);

  }
}

- (void)updateOrInsertMedianSecondsBetweenLaunches:(id)a3 forBundleId:(id)a4
{
  id v6;
  void *v7;
  _PASSqliteDatabase *db;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v9 = a3;
  v6 = a4;
  v7 = v6;
  if (v6)
  {
    db = self->_db;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __72___ATXDataStore_updateOrInsertMedianSecondsBetweenLaunches_forBundleId___block_invoke;
    v10[3] = &unk_1E82DCB88;
    v11 = v6;
    v12 = v9;
    -[_PASSqliteDatabase prepAndRunQuery:onPrep:onRow:onError:](db, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("INSERT INTO appInfo (bundleId, medianSecondsBetweenLaunches) VALUES (:bundle_id, :median_seconds_between_launches) ON CONFLICT(bundleId) DO UPDATE SET medianSecondsBetweenLaunches=excluded.medianSecondsBetweenLaunches"), v10, 0, 0);

  }
}

- (void)updateOrInsertAverageSecondsBetweenAppActions:(id)a3 forAppAction:(id)a4
{
  id v6;
  void *v7;
  _PASSqliteDatabase *db;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v9 = a3;
  v6 = a4;
  v7 = v6;
  if (v6)
  {
    db = self->_db;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __76___ATXDataStore_updateOrInsertAverageSecondsBetweenAppActions_forAppAction___block_invoke;
    v10[3] = &unk_1E82DCB88;
    v11 = v6;
    v12 = v9;
    -[_PASSqliteDatabase prepAndRunQuery:onPrep:onRow:onError:](db, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("INSERT INTO appActionInfo (appAction, averageSecondsBetweenAppActions) VALUES (:app_action, :average_seconds_between_app_actions) ON CONFLICT(appAction) DO UPDATE SET averageSecondsBetweenAppActions=excluded.averageSecondsBetweenAppActions"), v10, 0, 0);

  }
}

- (void)updateOrInsertMedianSecondsBetweenAppActions:(id)a3 forAppAction:(id)a4
{
  id v6;
  void *v7;
  _PASSqliteDatabase *db;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v9 = a3;
  v6 = a4;
  v7 = v6;
  if (v6)
  {
    db = self->_db;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __75___ATXDataStore_updateOrInsertMedianSecondsBetweenAppActions_forAppAction___block_invoke;
    v10[3] = &unk_1E82DCB88;
    v11 = v6;
    v12 = v9;
    -[_PASSqliteDatabase prepAndRunQuery:onPrep:onRow:onError:](db, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("INSERT INTO appActionInfo (appAction, medianSecondsBetweenAppActions) VALUES (:app_action, :median_seconds_between_app_actions) ON CONFLICT(appAction) DO UPDATE SET medianSecondsBetweenAppActions=excluded.medianSecondsBetweenAppActions"), v10, 0, 0);

  }
}

- (void)updateOrInsertGenreId:(id)a3 subGenreIds:(id)a4 forBundleId:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  _PASSqliteDatabase *db;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  id v23;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (v11)
  {
    if (objc_msgSend(v10, "count"))
    {
      v12 = (void *)MEMORY[0x1CAA48B6C]();
      v23 = 0;
      objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v10, 1, &v23);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v23;
      objc_autoreleasePoolPop(v12);
      if (v14)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_ATXDataStore.m"), 4579, CFSTR("Archiver error: %@"), v14);

        v16 = v14;
LABEL_7:
        db = self->_db;
        v19[0] = MEMORY[0x1E0C809B0];
        v19[1] = 3221225472;
        v19[2] = __63___ATXDataStore_updateOrInsertGenreId_subGenreIds_forBundleId___block_invoke;
        v19[3] = &unk_1E82DF220;
        v20 = v11;
        v21 = v9;
        v22 = v13;
        v18 = v13;
        -[_PASSqliteDatabase prepAndRunQuery:onPrep:onRow:onError:](db, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("INSERT INTO appInfo (bundleId, genreId, subGenreIds) VALUES (:bundle_id, :genreId_data, :subGenreIdsData) ON CONFLICT(bundleId) DO UPDATE SET genreId=excluded.genreId, subGenreIds=excluded.subGenreIds"), v19, 0, 0);

        goto LABEL_8;
      }
    }
    else
    {
      v13 = 0;
    }
    v16 = 0;
    goto LABEL_7;
  }
LABEL_8:

}

- (void)updateOrInsertApp2VecCluster:(id)a3 forBundleId:(id)a4
{
  id v6;
  void *v7;
  _PASSqliteDatabase *db;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v9 = a3;
  v6 = a4;
  v7 = v6;
  if (v6)
  {
    db = self->_db;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __58___ATXDataStore_updateOrInsertApp2VecCluster_forBundleId___block_invoke;
    v10[3] = &unk_1E82DCB88;
    v11 = v6;
    v12 = v9;
    -[_PASSqliteDatabase prepAndRunQuery:onPrep:onRow:onError:](db, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("INSERT INTO appInfo (bundleId, app2VecCluster) VALUES (:bundle_id, :app2vec_cluster) ON CONFLICT(bundleId) DO UPDATE SET app2VecCluster=excluded.app2VecCluster"), v10, 0, 0);

  }
}

- (void)updateOrInsertTimestamp:(int64_t)a3 intoColumn:(id)a4 forBundleId:(id)a5 isExtension:(BOOL)a6
{
  id v10;
  void *v11;
  _PASSqliteDatabase *db;
  NSObject *v13;
  _QWORD v14[4];
  id v15;
  int64_t v16;
  BOOL v17;

  v10 = a5;
  if (v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("INSERT INTO appInfo (bundleId, %1$@, isExtension) VALUES (:bundle_id, :new_timestamp, :is_extension) ON CONFLICT(bundleId) DO UPDATE SET %1$@ = CASE WHEN %1$@<:new_timestamp OR %1$@ IS NULL THEN :new_timestamp ELSE %1$@ END, isExtension=:is_extension"), a4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    db = self->_db;
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __76___ATXDataStore_updateOrInsertTimestamp_intoColumn_forBundleId_isExtension___block_invoke;
    v14[3] = &unk_1E82E3378;
    v15 = v10;
    v16 = a3;
    v17 = a6;
    -[_PASSqliteDatabase prepAndRunQuery:onPrep:onRow:onError:](db, "prepAndRunQuery:onPrep:onRow:onError:", v11, v14, 0, 0);

  }
  else
  {
    __atxlog_handle_default();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
      -[_ATXDataStore updateOrInsertSubsequentLaunchCountData:forBundleId:].cold.1();

  }
}

- (void)updateOrInsertTimestamp:(int64_t)a3 forAppAction:(id)a4
{
  id v6;
  void *v7;
  _PASSqliteDatabase *db;
  NSObject *v9;
  _QWORD v10[4];
  id v11;
  int64_t v12;

  v6 = a4;
  v7 = v6;
  if (v6)
  {
    db = self->_db;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __54___ATXDataStore_updateOrInsertTimestamp_forAppAction___block_invoke;
    v10[3] = &unk_1E82DEA88;
    v11 = v6;
    v12 = a3;
    -[_PASSqliteDatabase prepAndRunQuery:onPrep:onRow:onError:](db, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("INSERT INTO appActionInfo (appAction, lastAppActionLaunchDate) VALUES (:app_action, :new_timestamp) ON CONFLICT(appAction) DO UPDATE SET lastAppActionLaunchDate=excluded.lastAppActionLaunchDate"), v10, 0, 0);

  }
  else
  {
    __atxlog_handle_default();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      -[_ATXDataStore updateOrInsertTimestamp:forAppAction:].cold.1();

  }
}

- (void)updateOrInsertInstallTimestamp:(int64_t)a3 genreId:(id)a4 subGenreIds:(id)a5 app2VecCluster:(id)a6 forBundleId:(id)a7 isExtension:(BOOL)a8 isEnterpriseApp:(BOOL)a9
{
  id v16;
  id v17;
  id v18;
  id v19;
  int64_t v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  _ATXDataStore *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  _PASSqliteDatabase *db;
  uint64_t v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  _ATXDataStore *v40;
  BOOL v41;
  _QWORD v42[4];
  id v43;
  _QWORD v44[4];
  id v45;
  id v46;
  id v47;
  id v48;
  int64_t v49;
  BOOL v50;
  BOOL v51;
  id v52;
  uint8_t buf[4];
  void *v54;
  __int16 v55;
  id v56;
  __int16 v57;
  id v58;
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  if (v19)
  {
    v41 = a8;
    if (objc_msgSend(v17, "count"))
    {
      v20 = a3;
      v21 = (void *)MEMORY[0x1CAA48B6C]();
      v52 = 0;
      objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v17, 1, &v52);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = v52;
      objc_autoreleasePoolPop(v21);
      if (v23)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_ATXDataStore.m"), 4671, CFSTR("Archiver error: %@"), v23);

        v24 = v23;
        a3 = v20;
      }
      else
      {
        a3 = v20;
        v24 = 0;
      }
    }
    else
    {
      v24 = 0;
      v22 = 0;
    }
    if (objc_msgSend(MEMORY[0x1E0D81588], "isInternalBuild"))
    {
      v25 = self;
      v26 = a3;
      v27 = (void *)MEMORY[0x1CAA48B6C]();
      v40 = v25;
      -[_ATXDataStore _appInfoForBundleIdNoSync:](v25, "_appInfoForBundleIdNoSync:", v19);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      __atxlog_handle_app_install();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        v39 = v24;
        v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSinceReferenceDate:", (double)v26);
        objc_msgSend(v28, "installDate");
        v38 = v27;
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v54 = v30;
        v55 = 2114;
        v56 = v31;
        v57 = 2112;
        v58 = v19;
        _os_log_impl(&dword_1C9A3B000, v29, OS_LOG_TYPE_DEFAULT, "ATXDataStore: Updating install date: %{public}@ from %{public}@ for bundle id: %@", buf, 0x20u);

        v27 = v38;
        v24 = v39;
      }

      objc_autoreleasePoolPop(v27);
      a3 = v26;
      self = v40;
    }
    else
    {
      __atxlog_handle_app_install();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        v33 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSinceReferenceDate:", (double)a3);
        *(_DWORD *)buf = 138543618;
        v54 = v33;
        v55 = 2112;
        v56 = v19;
        _os_log_impl(&dword_1C9A3B000, v32, OS_LOG_TYPE_DEFAULT, "ATXDataStore: Updating install date: %{public}@ for bundle id: %@", buf, 0x16u);

      }
    }
    db = self->_db;
    v35 = MEMORY[0x1E0C809B0];
    v44[0] = MEMORY[0x1E0C809B0];
    v44[1] = 3221225472;
    v44[2] = __123___ATXDataStore_updateOrInsertInstallTimestamp_genreId_subGenreIds_app2VecCluster_forBundleId_isExtension_isEnterpriseApp___block_invoke;
    v44[3] = &unk_1E82E33A0;
    v45 = v19;
    v49 = a3;
    v46 = v16;
    v47 = v22;
    v50 = v41;
    v51 = a9;
    v48 = v18;
    v42[0] = v35;
    v42[1] = 3221225472;
    v42[2] = __123___ATXDataStore_updateOrInsertInstallTimestamp_genreId_subGenreIds_app2VecCluster_forBundleId_isExtension_isEnterpriseApp___block_invoke_2;
    v42[3] = &unk_1E82DCC28;
    v43 = v45;
    v36 = v22;
    -[_PASSqliteDatabase prepAndRunQuery:onPrep:onRow:onError:](db, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("INSERT INTO appInfo (bundleId, installDate, genreId, subGenreIds, isExtension, isEnterpriseApp, app2VecCluster) VALUES (:bundle_id, :new_timestamp, :genreId_data, :subGenreIds_data, :is_extension, :is_enterprise_app, :app2vec_cluster) ON CONFLICT(bundleId) DO UPDATE SET installDate = CASE WHEN installDate IS NULL THEN :new_timestamp ELSE installDate END, genreId=:genreId_data, subGenreIds=:subGenreIds_data, isExtension=:is_extension, isEnterpriseApp=:is_enterprise_app, app2VecCluster=:app2vec_cluster"), v44, 0, v42);

  }
}

- (void)_markBundleIdsAsExtension:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        -[_ATXDataStore _markBundleIdAsExtension:](self, "_markBundleIdAsExtension:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void)_markBundleIdAsExtension:(id)a3
{
  id v4;
  _PASSqliteDatabase *db;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  db = self->_db;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __42___ATXDataStore__markBundleIdAsExtension___block_invoke;
  v7[3] = &unk_1E82DCBD8;
  v8 = v4;
  v6 = v4;
  -[_PASSqliteDatabase prepAndRunQuery:onPrep:onRow:onError:](db, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("UPDATE appInfo SET isExtension=1, lastSpotlightLaunchDate=0 WHERE bundleId=:bundle_id;"),
    v7,
    0,
    &__block_literal_global_779);

}

- (void)_markBundleId:(id)a3 asEnterpriseApp:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  NSObject *v7;
  _PASSqliteDatabase *db;
  id v9;
  _QWORD v10[4];
  id v11;
  BOOL v12;
  uint8_t buf[4];
  id v14;
  __int16 v15;
  _BOOL4 v16;
  uint64_t v17;

  v4 = a4;
  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  __atxlog_handle_default();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v14 = v6;
    v15 = 1024;
    v16 = v4;
    _os_log_impl(&dword_1C9A3B000, v7, OS_LOG_TYPE_DEFAULT, "Mark app: %@ as enterprise: %{BOOL}u", buf, 0x12u);
  }

  db = self->_db;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __47___ATXDataStore__markBundleId_asEnterpriseApp___block_invoke;
  v10[3] = &unk_1E82DCF50;
  v11 = v6;
  v12 = v4;
  v9 = v6;
  -[_PASSqliteDatabase prepAndRunQuery:onPrep:onRow:onError:](db, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("UPDATE appInfo SET isEnterpriseApp=:is_enterprise_app WHERE bundleId=:bundle_id;"),
    v10,
    0,
    &__block_literal_global_782);

}

+ (void)_simulateCrashForMigrationFailure:(id)a3
{
  void *v3;
  id v4;

  v3 = (void *)MEMORY[0x1E0D81568];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Error in migration: %@"), a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "simulateCrashWithDescription:", v4);

}

+ (id)loadDataFromFile:(id)a3
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  id v7;
  NSObject *v8;
  id v10;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "fileExistsAtPath:", v3);

  if (v5)
  {
    v10 = 0;
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithContentsOfFile:options:error:", v3, 1, &v10);
    v7 = v10;
    if (!v6)
    {
      __atxlog_handle_default();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        +[_ATXDataStore loadDataFromFile:].cold.1((uint64_t)v3);

    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)migrationUpdateOrInsertTimestamp:(int64_t)a3 intoColumn:(id)a4 forBundleId:(id)a5
{
  id v8;
  id v9;
  void *v10;
  _PASSqliteDatabase *db;
  uint64_t v12;
  BOOL v13;
  NSObject *v14;
  _QWORD v16[5];
  _QWORD v17[4];
  id v18;
  int64_t v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char v23;

  v8 = a4;
  v9 = a5;
  if (v9)
  {
    v20 = 0;
    v21 = &v20;
    v22 = 0x2020000000;
    v23 = 1;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("INSERT INTO appInfo (bundleId, %1$@) VALUES (:bundle_id, :new_timestamp) ON CONFLICT(bundleId) DO UPDATE SET %1$@ = CASE WHEN %1$@<:new_timestamp OR %1$@ IS NULL THEN :new_timestamp ELSE %1$@ END WHERE bundleId=:bundle_id"), v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    db = self->_db;
    v12 = MEMORY[0x1E0C809B0];
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __73___ATXDataStore_migrationUpdateOrInsertTimestamp_intoColumn_forBundleId___block_invoke;
    v17[3] = &unk_1E82DEA88;
    v18 = v9;
    v19 = a3;
    v16[0] = v12;
    v16[1] = 3221225472;
    v16[2] = __73___ATXDataStore_migrationUpdateOrInsertTimestamp_intoColumn_forBundleId___block_invoke_2;
    v16[3] = &unk_1E82DEF28;
    v16[4] = &v20;
    -[_PASSqliteDatabase prepAndRunQuery:onPrep:onRow:onError:](db, "prepAndRunQuery:onPrep:onRow:onError:", v10, v17, 0, v16);
    v13 = *((_BYTE *)v21 + 24) != 0;

    _Block_object_dispose(&v20, 8);
  }
  else
  {
    __atxlog_handle_default();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
      -[_ATXDataStore updateOrInsertSubsequentLaunchCountData:forBundleId:].cold.1();

    v13 = 0;
  }

  return v13;
}

- (void)migrationPre44WriteActionType:(id)a3 bundleId:(id)a4 date:(id)a5 action:(id)a6 slotSets:(id)a7 timeZone:(id)a8 prevLocationUUID:(id)a9 locationUUID:(id)a10 weight:(double)a11 actionUUID:(id)a12 motionType:(int64_t)a13
{
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  _ATXDataStore *v35;
  NSObject *queue;
  void *v37;
  void *v38;
  NSObject *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  id v48;
  void *v50;
  id v51;
  id v52;
  _QWORD block[5];
  id v54;
  id v55;
  id v56;
  id v57;
  id v58;
  id v59;
  id v60;
  uint64_t v61;
  uint64_t v62;
  double v63;
  int64_t v64;

  v20 = a3;
  v21 = a4;
  v22 = a5;
  v52 = a6;
  v48 = a7;
  v51 = a8;
  v23 = a9;
  v24 = a10;
  v25 = a12;
  if (v20)
  {
    if (v21)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_ATXDataStore.m"), 4806, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("actionType"));

    if (v21)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_ATXDataStore.m"), 4807, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("bundleId"));

LABEL_3:
  if (!v52)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_ATXDataStore.m"), 4808, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("action"));

  }
  if (a11 <= 0.0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_ATXDataStore.m"), 4809, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("0.0 < weight"));

  }
  if (a11 > 1.0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_ATXDataStore.m"), 4810, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("weight <= 1.0"));

    if (v25)
      goto LABEL_9;
  }
  else if (v25)
  {
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_ATXDataStore.m"), 4811, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("actionUUID"));

LABEL_9:
  v47 = v24;
  v50 = v23;
  v26 = v20;
  if (!v22)
    v22 = (id)objc_opt_new();
  +[_ATXActionUtils timeOfDayAndDayOfWeekForDate:timeZone:](_ATXActionUtils, "timeOfDayAndDayOfWeekForDate:timeZone:", v22, v51);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "first");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = objc_msgSend(v28, "integerValue");

  objc_msgSend(v27, "second");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v29, "integerValue");

  v31 = v48;
  if (!v48)
  {
    v32 = (void *)MEMORY[0x1E0C99E60];
    v33 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF90E8]), "initWithOpaqueParameters");
    objc_msgSend(v32, "setWithObject:", v33);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

  }
  ATXSlotSetsSerialize();
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  if (v34)
  {
    v35 = self;
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __145___ATXDataStore_migrationPre44WriteActionType_bundleId_date_action_slotSets_timeZone_prevLocationUUID_locationUUID_weight_actionUUID_motionType___block_invoke;
    block[3] = &unk_1E82E3430;
    block[4] = v35;
    v54 = v21;
    v55 = v26;
    v56 = v34;
    v57 = v22;
    v61 = v46;
    v62 = v30;
    v37 = v50;
    v58 = v50;
    v38 = v47;
    v59 = v47;
    v63 = a11;
    v60 = v25;
    v64 = a13;
    dispatch_sync(queue, block);

  }
  else
  {
    __atxlog_handle_default();
    v39 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
      -[_ATXDataStore migrationPre44WriteActionType:bundleId:date:action:slotSets:timeZone:prevLocationUUID:locationUUID:weight:actionUUID:motionType:].cold.1((uint64_t)v31);

    v37 = v50;
    v38 = v47;
  }

}

- (void)_testMigrate
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __29___ATXDataStore__testMigrate__block_invoke;
  block[3] = &unk_1E82DAC38;
  block[4] = self;
  dispatch_sync(queue, block);
}

- (void)_testMigrateToSchema:(unint64_t)a3
{
  NSObject *queue;
  _QWORD v4[6];

  queue = self->_queue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __38___ATXDataStore__testMigrateToSchema___block_invoke;
  v4[3] = &unk_1E82DC688;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(queue, v4);
}

- (id)_trimMigrationPlan:(id)a3 toSchema:(unint64_t)a4
{
  id v5;
  void *v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  void *v10;

  v5 = a3;
  v6 = (void *)objc_msgSend(v5, "mutableCopy");
  v7 = objc_msgSend(v5, "count");
  v8 = a4 + 1;
  if (v8 <= v7)
  {
    v9 = v7;
    do
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "removeObjectForKey:", v10);

      ++v8;
    }
    while (v8 <= v9);
  }

  return v6;
}

- (void)swapInDuetHelperStub:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __38___ATXDataStore_swapInDuetHelperStub___block_invoke;
  v6[3] = &unk_1E82DACB0;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[_ATXDataStore _doAsync:](self, "_doAsync:", v6);

}

- (id)_databaseSchema
{
  void *v3;
  NSObject *queue;
  id v5;
  void *v6;
  id v7;
  _QWORD v9[5];
  id v10;

  v3 = (void *)objc_opt_new();
  queue = self->_queue;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __32___ATXDataStore__databaseSchema__block_invoke;
  v9[3] = &unk_1E82DACB0;
  v9[4] = self;
  v5 = v3;
  v10 = v5;
  dispatch_sync(queue, v9);
  v6 = v10;
  v7 = v5;

  return v7;
}

- (void)integrityCheckOrAbort
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_3(&dword_1C9A3B000, v0, v1, "Sqlite integrity check failed! Aborting.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

+ (id)stringForHistogramType:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 0x62)
    return CFSTR("_ATXHistogramTypeAnyLaunch");
  else
    return off_1E82E3450[a3 - 1];
}

- (_PASSqliteDatabase)db
{
  return self->_db;
}

- (unint64_t)actionHistoryLengthPerAppAction
{
  return self->_actionHistoryLengthPerAppAction;
}

- (void)setActionHistoryLengthPerAppAction:(unint64_t)a3
{
  self->_actionHistoryLengthPerAppAction = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_db, 0);
  objc_storeStrong((id *)&self->_dbMigrationTracker, 0);
  objc_storeStrong((id *)&self->_duetHelper, 0);
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)enumerateActionTypesOlderThan:(id)a3 block:(id)a4
{
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v12[5];
  id v13;
  id v14;
  _QWORD *v15;
  _QWORD *v16;
  _QWORD *v17;
  _QWORD v18[5];
  id v19;
  _QWORD v20[5];
  id v21;
  _QWORD v22[4];

  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_ATXDataStore+ActionTypes.m"), 17, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("date"));

  }
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x2020000000;
  v22[3] = 0;
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x3032000000;
  v20[3] = __Block_byref_object_copy__72;
  v20[4] = __Block_byref_object_dispose__72;
  v21 = 0;
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x3032000000;
  v18[3] = __Block_byref_object_copy__72;
  v18[4] = __Block_byref_object_dispose__72;
  v19 = 0;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __66___ATXDataStore_ActionTypes__enumerateActionTypesOlderThan_block___block_invoke;
  v12[3] = &unk_1E82E6CA0;
  v12[4] = self;
  v9 = v7;
  v13 = v9;
  v15 = v22;
  v16 = v20;
  v17 = v18;
  v10 = v8;
  v14 = v10;
  -[_ATXDataStore _doSync:](self, "_doSync:", v12);

  _Block_object_dispose(v18, 8);
  _Block_object_dispose(v20, 8);

  _Block_object_dispose(v22, 8);
}

- (void)initWithPath:andDuetHelper:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_6(&dword_1C9A3B000, v0, v1, "Not enough space on volume. Opening in-memory datastore.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)initWithPath:andDuetHelper:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_3(&dword_1C9A3B000, v0, v1, "Cannot call _ATXDataStore init until class c unlocked", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)_reset
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = *a1;
  OUTLINED_FUNCTION_5_4();
  OUTLINED_FUNCTION_2_9(&dword_1C9A3B000, v1, v2, "Could not open sqlite database at %@: %@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_1_0();
}

- (void)vacuumDatabaseWithActivity:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, v0, v1, "ATXDataStore: unable to vacuum database: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)removeAppInfoForBundleIdsNotInSet:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_3(&dword_1C9A3B000, v0, v1, "Not removing any apps because the install set is empty", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)filenamesAndDataForBackupShouldPareDown:transport:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, v0, v1, "Error while serializing onboarding stack widget cache file into NSData: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)filenamesAndDataForBackupShouldPareDown:transport:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, v0, v1, "Error while reading mode entity files for backup. Error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

+ (void)removeSensitiveInformationFromModeEntityScoresFile:shouldBackupContacts:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, v0, v1, "Couldn't deserialize mode entity scores file data. Error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

+ (void)removeSensitiveInformationFromModeEntityScoresFile:shouldBackupContacts:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_5(&dword_1C9A3B000, v0, v1, "FAILURE: Unable to archive mode entity scores. Error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

+ (void)pareDownForBackup:.cold.1()
{
  __int16 v0;
  uint64_t v1;
  os_log_t v2;
  const char *v3;
  const char *v4;

  OUTLINED_FUNCTION_2();
  WORD2(v4) = 2080;
  HIWORD(v4) = v0;
  OUTLINED_FUNCTION_2_9(&dword_1C9A3B000, v1, v2, "Error deleting %s: %s", v3, v4);
  OUTLINED_FUNCTION_1_0();
}

- (void)restoreFromBackup:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, a1, a3, "Chunk for key %@ not found while restoring data.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)restoreFromBackup:(uint64_t)a1 .cold.2(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_5_4();
  OUTLINED_FUNCTION_2_9(&dword_1C9A3B000, v1, v2, "Error restoring onboarding stacks cache file to path %@: %@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_1_0();
}

- (void)writeActionType:(uint64_t)a1 bundleId:date:action:slotSets:timeZone:prevLocationUUID:locationUUID:weight:actionUUID:motionType:appSessionStartDate:appSessionEndDate:geohash:coarseGeohash:.cold.1(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_5_4();
  OUTLINED_FUNCTION_2_9(&dword_1C9A3B000, v1, v2, "Could not serialize slotSets: %@ and action: %@, not writing action type", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_1_0();
}

- (void)actionForSlotUUID:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_5(&dword_1C9A3B000, v0, v1, "Unable to get action for slot UUID (<rdar://problem/48254976>): %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)recordConfirms:(NSObject *)a3 rejects:forFeedbackType:forActionType:bundleId:action:slotSet:actionUUID:date:consumerSubType:geohash:coarseGeohash:.cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  uint64_t v6;
  int v7;
  void *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138412546;
  v8 = v5;
  v9 = 2112;
  v10 = a2;
  OUTLINED_FUNCTION_5_0(&dword_1C9A3B000, a3, v6, "Could not serialize slotSets: %@ and action: %@, not recording feedback", (uint8_t *)&v7);

}

- (void)currentSchemaVersion
{
  __assert_rtn("-[_ATXDataStore currentSchemaVersion]", "_ATXDataStore.m", 3362, "_db");
}

- (void)migrateWithMigrationPlan:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, v0, v1, "Exception getting schema version. Marking as corrupt: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)skipFromZeroSchema
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, v0, v1, "failed to migrate database from zero to %ld", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)migrateToVersion:withMigrationPlan:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, v0, v1, "ATXDataStore: failed to migrate entity db to %ld", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)migrateToVersion:withMigrationPlan:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_3(&dword_1C9A3B000, v0, v1, "ATXDataStore: attempt to skip or repeat a migration", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)migration_InstallDateToAppTable
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, v0, v1, "Error unarchiving install dates: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)migration_DeprecateGenericAppIntentModels
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, v0, v1, "Error deleting data associated with old generic app intent parzen model: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)writeSlotSetKeyParameters:(uint64_t)a1 rowId:slotSet:success:.cold.1(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_5_4();
  OUTLINED_FUNCTION_2_9(&dword_1C9A3B000, v1, v2, "Missing slotSet UUID for slotSet: %@ alog rowId: %@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_1_0();
}

- (void)updateAlog:(uint64_t)a1 slotsToMigrate:.cold.1(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_5_4();
  OUTLINED_FUNCTION_2_9(&dword_1C9A3B000, v1, v2, "Could not serialize slotSets: %@ and action: %@, not updating alog during migration", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_1_0();
}

- (void)migration_removeBrokenBlendingStream
{
  os_log_t v0;
  uint8_t v1[16];

  OUTLINED_FUNCTION_7();
  _os_log_debug_impl(&dword_1C9A3B000, v0, OS_LOG_TYPE_DEBUG, "Removing blending stream", v1, 2u);
  OUTLINED_FUNCTION_4();
}

- (void)updateOrInsertSubsequentLaunchCountData:forBundleId:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_6(&dword_1C9A3B000, v0, v1, "rdar://28434856 Caught appInfo entry with nil bundleId", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)migration_removeAnchorModelDirectory
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, v0, v1, "Cannot remove Anchor Model Directory. Error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)migration_removeOldStackStateTrackerFile
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, v0, v1, "Cannot remove old Stack State Tracker file. Error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)migration_removeHomeScreenWidgetBlacklistFile
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, v0, v1, "Cannot remove home screen widget blacklist file. Error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)updateOrInsertSubsequentAppActionLaunchCountData:forAppAction:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_6(&dword_1C9A3B000, v0, v1, "Caught appActionInfo entry with nil appAction", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)updateOrInsertPredictionsAndFeedbackForAppAction:feedbackReceived:forUIType:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_6(&dword_1C9A3B000, v0, v1, "Caught predictionFeedbackInfo entry with nil appAction", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)updateOrInsertMessageRecipient:dateMessaged:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_6(&dword_1C9A3B000, v0, v1, "Caught messageRecipients entry with nil recipient", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)updateOrInsertTimestamp:forAppAction:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_6(&dword_1C9A3B000, v0, v1, "rdar://28434856 Caught appActionInfo entry with nil appAction", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

+ (void)loadDataFromFile:(uint64_t)a1 .cold.1(uint64_t a1)
{
  os_log_t v1;
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412546;
  v3 = a1;
  OUTLINED_FUNCTION_5_4();
  _os_log_debug_impl(&dword_1C9A3B000, v1, OS_LOG_TYPE_DEBUG, "Unable to open %@: %@", (uint8_t *)&v2, 0x16u);
  OUTLINED_FUNCTION_1_0();
}

- (void)migrationPre44WriteActionType:(uint64_t)a1 bundleId:date:action:slotSets:timeZone:prevLocationUUID:locationUUID:weight:actionUUID:motionType:.cold.1(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_5_4();
  OUTLINED_FUNCTION_2_9(&dword_1C9A3B000, v1, v2, "Could not serialize slotSets: %@ and action: %@, not writing action type for migration", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_1_0();
}

@end
