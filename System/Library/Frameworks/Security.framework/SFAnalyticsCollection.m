@implementation SFAnalyticsCollection

- (SFAnalyticsCollection)init
{
  DefaultCollectionActions *v3;
  SFAnalyticsCollection *v4;

  v3 = objc_alloc_init(DefaultCollectionActions);
  v4 = -[SFAnalyticsCollection initWithActionInterface:](self, "initWithActionInterface:", v3);

  return v4;
}

- (SFAnalyticsCollection)initWithActionInterface:(id)a3
{
  id v4;
  SFAnalyticsCollection *v5;
  NSObject *v6;
  dispatch_queue_t v7;
  SFAnalyticsCollection *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SFAnalyticsCollection;
  v5 = -[SFAnalyticsCollection init](&v10, sel_init);
  if (v5)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = dispatch_queue_create("SFAnalyticsCollection", v6);
    -[SFAnalyticsCollection setQueue:](v5, "setQueue:", v7);

    -[SFAnalyticsCollection setActions:](v5, "setActions:", v4);
    v8 = v5;
  }

  return v5;
}

- (void)dealloc
{
  objc_super v3;

  -[SFAnalyticsCollection onQueue_stopMetricCollection](self, "onQueue_stopMetricCollection");
  v3.receiver = self;
  v3.super_class = (Class)SFAnalyticsCollection;
  -[SFAnalyticsCollection dealloc](&v3, sel_dealloc);
}

- (id)parseCollection:(id)a3 logger:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  SECSFARules *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  SFAnalyticsMatchingRule *v20;
  id v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  id v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v28 = 0;
  objc_msgSend(a3, "decompressedDataUsingAlgorithm:error:", 0, &v28);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v28;
  v8 = v7;
  if (v6)
  {
    v22 = v7;
    v23 = v6;
    v9 = -[SECSFARules initWithData:]([SECSFARules alloc], "initWithData:", v6);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    -[SECSFARules rules](v9, "rules");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v25;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v25 != v14)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
          objc_msgSend(v16, "eventType");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "objectForKeyedSubscript:", v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v18)
          {
            objc_msgSend(MEMORY[0x1E0C99E20], "set");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "eventType");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "setObject:forKeyedSubscript:", v18, v19);

          }
          v20 = -[SFAnalyticsMatchingRule initWithSFARule:logger:]([SFAnalyticsMatchingRule alloc], "initWithSFARule:logger:", v16, v5);
          if (v20)
            objc_msgSend(v18, "addObject:", v20);

        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
      }
      while (v13);
    }

    v8 = v22;
    v6 = v23;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)setupMetricsHook:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[SFAnalyticsCollection queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __42__SFAnalyticsCollection_setupMetricsHook___block_invoke;
  v7[3] = &unk_1E1FCDAD8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)onQueue_stopMetricCollection
{
  uint64_t v3;
  void *v4;
  NSObject *v5;
  _QWORD block[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  void *(*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__3525;
  v11 = __Block_byref_object_dispose__3526;
  v12 = 0;
  -[SFAnalyticsCollection tearDownMetricsHook](self, "tearDownMetricsHook");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v8[5];
  v8[5] = v3;

  -[SFAnalyticsCollection setTearDownMetricsHook:](self, "setTearDownMetricsHook:", 0);
  if (v8[5])
  {
    dispatch_get_global_queue(17, 0);
    v5 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __53__SFAnalyticsCollection_onQueue_stopMetricCollection__block_invoke;
    block[3] = &unk_1E1FD8CF0;
    block[4] = &v7;
    dispatch_async(v5, block);

  }
  _Block_object_dispose(&v7, 8);

}

- (void)stopMetricCollection
{
  NSObject *v3;
  _QWORD block[5];

  -[SFAnalyticsCollection queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__SFAnalyticsCollection_stopMetricCollection__block_invoke;
  block[3] = &unk_1E1FDBE18;
  block[4] = self;
  dispatch_sync(v3, block);

}

- (void)loadCollection:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t);
  void *v13;
  SFAnalyticsCollection *v14;
  id v15;
  uint8_t buf[4];
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "dataPropertyForKey:", CFSTR("SFCollectionConfig"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFAnalyticsCollection parseCollection:logger:](self, "parseCollection:logger:", v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFAnalyticsCollection queue](self, "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __40__SFAnalyticsCollection_loadCollection___block_invoke;
  v13 = &unk_1E1FCDAD8;
  v14 = self;
  v8 = v6;
  v15 = v8;
  dispatch_sync(v7, &v10);

  getOSLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v17 = v8;
    _os_log_impl(&dword_18A900000, v9, OS_LOG_TYPE_DEFAULT, "Loading matching rules: %@", buf, 0xCu);
  }

  -[SFAnalyticsCollection setupMetricsHook:](self, "setupMetricsHook:", v4, v10, v11, v12, v13, v14);
}

- (void)storeCollection:(id)a3 logger:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  id v10;
  NSObject *v11;
  uint8_t v12[8];
  _QWORD block[4];
  id v14;
  SFAnalyticsCollection *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;

  v6 = a3;
  v7 = a4;
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = -86;
  -[SFAnalyticsCollection parseCollection:logger:](self, "parseCollection:logger:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFAnalyticsCollection queue](self, "queue");
  v9 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__SFAnalyticsCollection_storeCollection_logger___block_invoke;
  block[3] = &unk_1E1FCDB00;
  v16 = &v17;
  v10 = v8;
  v14 = v10;
  v15 = self;
  dispatch_sync(v9, block);

  if (v7 && *((_BYTE *)v18 + 24))
  {
    getOSLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_18A900000, v11, OS_LOG_TYPE_DEFAULT, "Setting up new rules", v12, 2u);
    }

    objc_msgSend(v7, "setDataProperty:forKey:", v6, CFSTR("SFCollectionConfig"));
    -[SFAnalyticsCollection setupMetricsHook:](self, "setupMetricsHook:", v7);
  }

  _Block_object_dispose(&v17, 8);
}

- (unsigned)match:(id)a3 eventClass:(int64_t)a4 attributes:(id)a5 bucket:(unsigned int)a6 logger:(id)a7
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  NSObject *v14;
  id v15;
  id v16;
  id v17;
  unsigned int v18;
  _QWORD block[5];
  id v21;
  id v22;
  id v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  int v28;
  uint8_t buf[4];
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a5;
  v12 = a7;
  v25 = 0;
  v26 = &v25;
  v27 = 0x2020000000;
  v28 = 0;
  getOSLog();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v30 = v10;
    _os_log_debug_impl(&dword_18A900000, v13, OS_LOG_TYPE_DEBUG, "matching rules %@", buf, 0xCu);
  }

  -[SFAnalyticsCollection queue](self, "queue");
  v14 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __67__SFAnalyticsCollection_match_eventClass_attributes_bucket_logger___block_invoke;
  block[3] = &unk_1E1FCDB28;
  block[4] = self;
  v21 = v10;
  v23 = v12;
  v24 = &v25;
  v22 = v11;
  v15 = v12;
  v16 = v11;
  v17 = v10;
  dispatch_sync(v14, block);

  v18 = *((_DWORD *)v26 + 6);
  _Block_object_dispose(&v25, 8);
  return v18;
}

- (NSMutableDictionary)matchingRules
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (void)setMatchingRules:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (id)tearDownMetricsHook
{
  return objc_getProperty(self, a2, 16, 1);
}

- (void)setTearDownMetricsHook:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (SFAnalyticsCollectionAction)actions
{
  return (SFAnalyticsCollectionAction *)objc_getProperty(self, a2, 24, 1);
}

- (void)setActions:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 32, 1);
}

- (void)setQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_actions, 0);
  objc_storeStrong(&self->_tearDownMetricsHook, 0);
  objc_storeStrong((id *)&self->_matchingRules, 0);
}

void __67__SFAnalyticsCollection_match_eventClass_attributes_bucket_logger___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint8_t v16[128];
  uint8_t buf[4];
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "matchingRules");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3 && objc_msgSend(v3, "count"))
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v4 = v3;
    v5 = -[NSObject countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v13;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v13 != v7)
            objc_enumerationMutation(v4);
          v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
          if (objc_msgSend(v9, "matchAttributes:", *(_QWORD *)(a1 + 48), (_QWORD)v12))
          {
            objc_msgSend(*(id *)(a1 + 32), "actions");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) |= objc_msgSend(v9, "doAction:attributes:logger:", v10, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

          }
        }
        v6 = -[NSObject countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v6);
    }
  }
  else
  {
    getOSLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      v11 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138412290;
      v18 = v11;
      _os_log_debug_impl(&dword_18A900000, v4, OS_LOG_TYPE_DEBUG, "no rules %@", buf, 0xCu);
    }
  }

}

uint64_t __48__SFAnalyticsCollection_storeCollection_logger___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "matchingRules");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v2 != v3;

  return objc_msgSend(*(id *)(a1 + 40), "setMatchingRules:", *(_QWORD *)(a1 + 32));
}

uint64_t __40__SFAnalyticsCollection_loadCollection___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setMatchingRules:", *(_QWORD *)(a1 + 40));
}

uint64_t __45__SFAnalyticsCollection_stopMetricCollection__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "onQueue_stopMetricCollection");
}

uint64_t __53__SFAnalyticsCollection_onQueue_stopMetricCollection__block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) + 16))();
}

void __42__SFAnalyticsCollection_setupMetricsHook___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t);
  void *v9;
  id v10;
  id v11;
  _QWORD aBlock[4];
  id v13;
  id v14;
  id from;
  id location;

  objc_msgSend(*(id *)(a1 + 32), "tearDownMetricsHook");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2)
  {
    location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, *(id *)(a1 + 40));
    from = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&from, *(id *)(a1 + 32));
    v3 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __42__SFAnalyticsCollection_setupMetricsHook___block_invoke_2;
    aBlock[3] = &unk_1E1FCDA88;
    objc_copyWeak(&v13, &location);
    objc_copyWeak(&v14, &from);
    v4 = _Block_copy(aBlock);
    v6 = v3;
    v7 = 3221225472;
    v8 = __42__SFAnalyticsCollection_setupMetricsHook___block_invoke_3;
    v9 = &unk_1E1FCDAB0;
    objc_copyWeak(&v11, &location);
    v5 = v4;
    v10 = v5;
    objc_msgSend(*(id *)(a1 + 32), "setTearDownMetricsHook:", &v6);
    if (v5)
      objc_msgSend(*(id *)(a1 + 40), "addMetricsHook:", v5, v6, v7, v8, v9);

    objc_destroyWeak(&v11);
    objc_destroyWeak(&v14);
    objc_destroyWeak(&v13);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);

  }
}

uint64_t __42__SFAnalyticsCollection_setupMetricsHook___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void *a4, uint64_t a5)
{
  id v9;
  id v10;
  id WeakRetained;
  id v12;
  uint64_t v13;

  v9 = a2;
  v10 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v12 = objc_loadWeakRetained((id *)(a1 + 40));
    v13 = objc_msgSend(v12, "match:eventClass:attributes:bucket:logger:", v9, a3, v10, a5, WeakRetained);

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

void __42__SFAnalyticsCollection_setupMetricsHook___block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "removeMetricsHook:", *(_QWORD *)(a1 + 32));

}

@end
