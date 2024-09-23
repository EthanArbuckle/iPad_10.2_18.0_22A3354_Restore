@implementation ATXMagicalMomentsUpdateMonitor

- (ATXMagicalMomentsUpdateMonitor)init
{
  void *v3;
  int v4;

  +[_ATXGlobals sharedInstance](_ATXGlobals, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "maxMagicalMomentsPredictions");

  return -[ATXMagicalMomentsUpdateMonitor initWithLimit:](self, "initWithLimit:", v4);
}

- (ATXMagicalMomentsUpdateMonitor)initWithLimit:(unint64_t)a3
{
  ATXMagicalMomentsUpdateMonitor *v4;
  NSObject *v5;
  dispatch_queue_t v6;
  OS_dispatch_queue *queue;
  id v8;
  uint64_t v9;
  NSUserDefaults *defaults;
  void *v11;
  void *v12;
  NSDate *v13;
  NSDate *expiration;
  NSObject *v15;
  NSDate *v16;
  unint64_t mmPredictionCount;
  NSObject *v18;
  _QWORD block[4];
  ATXMagicalMomentsUpdateMonitor *v21;
  objc_super v22;
  uint8_t buf[4];
  NSDate *v24;
  __int16 v25;
  unint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v22.receiver = self;
  v22.super_class = (Class)ATXMagicalMomentsUpdateMonitor;
  v4 = -[ATXMagicalMomentsUpdateMonitor init](&v22, sel_init);
  if (v4)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = dispatch_queue_create("ATXMagicalMomentsUpdateMonitor.queue", v5);
    queue = v4->_queue;
    v4->_queue = (OS_dispatch_queue *)v6;

    v4->_limit = a3;
    v8 = objc_alloc(MEMORY[0x1E0C99EA0]);
    v9 = objc_msgSend(v8, "initWithSuiteName:", *MEMORY[0x1E0CF9510]);
    defaults = v4->_defaults;
    v4->_defaults = (NSUserDefaults *)v9;

    -[NSUserDefaults objectForKey:](v4->_defaults, "objectForKey:", CFSTR("com.apple.duetexpertd.MMUpdateMonitor.ExpirationDate"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11)
    {
      v13 = v11;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", -1.0);
      v13 = (NSDate *)objc_claimAutoreleasedReturnValue();
    }
    expiration = v4->_expiration;
    v4->_expiration = v13;

    v4->_mmPredictionCount = -[NSUserDefaults integerForKey:](v4->_defaults, "integerForKey:", CFSTR("com.apple.duetexpertd.MMUpdateMonitor.PredictionCount"));
    __atxlog_handle_default();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = v4->_expiration;
      mmPredictionCount = v4->_mmPredictionCount;
      *(_DWORD *)buf = 138412546;
      v24 = v16;
      v25 = 2048;
      v26 = mmPredictionCount;
      _os_log_impl(&dword_1C9A3B000, v15, OS_LOG_TYPE_DEFAULT, "ATXMM: Recovered expiration date of predictions: %@. MM prediction count: %ld", buf, 0x16u);
    }

    -[ATXMagicalMomentsUpdateMonitor setupUpdateListener](v4, "setupUpdateListener");
    v18 = v4->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __48__ATXMagicalMomentsUpdateMonitor_initWithLimit___block_invoke;
    block[3] = &unk_1E82DAC38;
    v21 = v4;
    dispatch_async(v18, block);

  }
  return v4;
}

uint64_t __48__ATXMagicalMomentsUpdateMonitor_initWithLimit___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dropCacheIfExpired");
}

- (void)dropCacheIfExpired
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  NSDictionary *predictionMap;
  void *v8;
  void *v9;
  NSObject *v10;
  uint8_t v11[16];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_expiration)
  {
    if (self->_mmPredictionCount)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "earlierDate:", self->_expiration);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v4, "isEqualToDate:", self->_expiration);

      if (v5)
      {
        v6 = (void *)objc_opt_new();
        +[ATXMagicalMomentsBlendingUpdater updateBlendingLayerWithMagicalMomentsMap:](ATXMagicalMomentsBlendingUpdater, "updateBlendingLayerWithMagicalMomentsMap:", v6);

        predictionMap = self->_predictionMap;
        self->_predictionMap = 0;

        self->_mmPredictionCount = 0;
        v8 = (void *)objc_opt_new();
        v9 = (void *)objc_opt_new();
        -[ATXMagicalMomentsUpdateMonitor _setPredictions:expiration:totalPredictionCount:](self, "_setPredictions:expiration:totalPredictionCount:", v8, v9, 0);

        __atxlog_handle_default();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v11 = 0;
          _os_log_impl(&dword_1C9A3B000, v10, OS_LOG_TYPE_DEFAULT, "ATXMM: Dropped the cache because the predictions have expired.", v11, 2u);
        }

      }
    }
  }
}

- (id)predictionsForBundleId:(id)a3
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
  v15 = __Block_byref_object_copy__88;
  v16 = __Block_byref_object_dispose__88;
  v17 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__ATXMagicalMomentsUpdateMonitor_predictionsForBundleId___block_invoke;
  block[3] = &unk_1E82E0520;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(queue, block);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __57__ATXMagicalMomentsUpdateMonitor_predictionsForBundleId___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "dropCacheIfExpired");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (unint64_t)mmPredictionCount
{
  NSObject *queue;
  unint64_t v3;
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
  v5[2] = __51__ATXMagicalMomentsUpdateMonitor_mmPredictionCount__block_invoke;
  v5[3] = &unk_1E82DACD8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __51__ATXMagicalMomentsUpdateMonitor_mmPredictionCount__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "dropCacheIfExpired");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24);
  return result;
}

- (void)setupUpdateListener
{
  id v3;
  PMMPredictionNotification *v4;
  PMMPredictionNotification *mmUpdateListener;
  _QWORD v6[4];
  id v7;
  id location;

  objc_initWeak(&location, self);
  v3 = objc_alloc(MEMORY[0x1E0D810B0]);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __53__ATXMagicalMomentsUpdateMonitor_setupUpdateListener__block_invoke;
  v6[3] = &unk_1E82E7D20;
  objc_copyWeak(&v7, &location);
  v4 = (PMMPredictionNotification *)objc_msgSend(v3, "initWithPredictionUpdateListener:", v6);
  mmUpdateListener = self->_mmUpdateListener;
  self->_mmUpdateListener = v4;

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __53__ATXMagicalMomentsUpdateMonitor_setupUpdateListener__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id *v4;
  id v5;
  id WeakRetained;

  v4 = (id *)(a1 + 32);
  v5 = a2;
  WeakRetained = objc_loadWeakRetained(v4);
  objc_msgSend(WeakRetained, "updatePredictionsWith:consumer:", v5, a3);

}

- (void)updatePredictionsWith:(id)a3 consumer:(unint64_t)a4
{
  id v6;
  NSObject *queue;
  id v8;
  _QWORD block[4];
  id v10;
  ATXMagicalMomentsUpdateMonitor *v11;
  unint64_t v12;

  v6 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65__ATXMagicalMomentsUpdateMonitor_updatePredictionsWith_consumer___block_invoke;
  block[3] = &unk_1E82DEAD0;
  v11 = self;
  v12 = a4;
  v10 = v6;
  v8 = v6;
  dispatch_async(queue, block);

}

void __65__ATXMagicalMomentsUpdateMonitor_updatePredictionsWith_consumer___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  ATXMagicalMomentsSignals *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  double v12;
  ATXMagicalMomentsSignals *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id obj;
  uint64_t v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 48) == 1)
  {
    v1 = a1;
    v20 = (void *)objc_opt_new();
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    objc_msgSend(*(id *)(v1 + 32), "predictedItems");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v2)
    {
      v3 = v2;
      v4 = 0;
      v19 = *(_QWORD *)v22;
LABEL_4:
      v5 = 0;
      while (1)
      {
        if (*(_QWORD *)v22 != v19)
          objc_enumerationMutation(obj);
        if ((unint64_t)(v4 + v5) >= *(_QWORD *)(*(_QWORD *)(v1 + 40) + 56))
          break;
        v6 = v1;
        v7 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v5);
        v8 = [ATXMagicalMomentsSignals alloc];
        v9 = objc_msgSend(v7, "predictionSource");
        v10 = objc_msgSend(v7, "reason");
        objc_msgSend(v7, "reasonMetadata");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "confidence");
        v13 = -[ATXMagicalMomentsSignals initWithPredictionSource:pmmReason:reasonMetadata:confidence:anchorType:index:](v8, "initWithPredictionSource:pmmReason:reasonMetadata:confidence:anchorType:index:", v9, v10, v11, objc_msgSend(v7, "anchorType"), v4 + v5, v12);
        objc_msgSend(v7, "bundleId");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "setObject:forKeyedSubscript:", v13, v14);

        v1 = v6;
        if (v3 == ++v5)
        {
          v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
          v4 += v5;
          if (v3)
            goto LABEL_4;
          break;
        }
      }
    }

    +[ATXMagicalMomentsBlendingUpdater updateBlendingLayerWithMagicalMomentsMap:](ATXMagicalMomentsBlendingUpdater, "updateBlendingLayerWithMagicalMomentsMap:", v20);
    v15 = *(void **)(v1 + 40);
    objc_msgSend(*(id *)(v1 + 32), "expirationDate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(v1 + 32), "predictedItems");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "_setPredictions:expiration:totalPredictionCount:", v20, v16, objc_msgSend(v17, "count"));

  }
}

- (void)_setPredictions:(id)a3 expiration:(id)a4 totalPredictionCount:(unint64_t)a5
{
  id v9;
  id v10;
  NSObject *v11;
  NSDate *expiration;
  unint64_t mmPredictionCount;
  int v14;
  NSDate *v15;
  __int16 v16;
  unint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  objc_storeStrong((id *)&self->_predictionMap, a3);
  objc_storeStrong((id *)&self->_expiration, a4);
  self->_mmPredictionCount = a5;
  -[NSUserDefaults setObject:forKey:](self->_defaults, "setObject:forKey:", self->_expiration, CFSTR("com.apple.duetexpertd.MMUpdateMonitor.ExpirationDate"));
  -[NSUserDefaults setInteger:forKey:](self->_defaults, "setInteger:forKey:", self->_mmPredictionCount, CFSTR("com.apple.duetexpertd.MMUpdateMonitor.PredictionCount"));
  __atxlog_handle_default();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    expiration = self->_expiration;
    mmPredictionCount = self->_mmPredictionCount;
    v14 = 138412546;
    v15 = expiration;
    v16 = 2048;
    v17 = mmPredictionCount;
    _os_log_impl(&dword_1C9A3B000, v11, OS_LOG_TYPE_DEFAULT, "ATXMM: Persisted expiration date of predictions: %@. MM prediction count: %ld to NSUserDefaults", (uint8_t *)&v14, 0x16u);
  }

}

- (unint64_t)limit
{
  return self->_limit;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mmUpdateListener, 0);
  objc_storeStrong((id *)&self->_defaults, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_expiration, 0);
  objc_storeStrong((id *)&self->_predictionMap, 0);
}

@end
