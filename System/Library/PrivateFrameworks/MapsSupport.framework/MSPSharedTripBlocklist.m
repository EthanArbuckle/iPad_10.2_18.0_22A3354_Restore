@implementation MSPSharedTripBlocklist

+ (MSPSharedTripBlocklist)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__MSPSharedTripBlocklist_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1ED328338 != -1)
    dispatch_once(&qword_1ED328338, block);
  return (MSPSharedTripBlocklist *)(id)_MergedGlobals_35;
}

void __40__MSPSharedTripBlocklist_sharedInstance__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)_MergedGlobals_35;
  _MergedGlobals_35 = (uint64_t)v1;

}

- (MSPSharedTripBlocklist)init
{
  id v2;
  NSObject *v3;
  void *v4;
  id v5;
  void *v6;
  dispatch_queue_t v7;
  void *v8;
  dispatch_queue_t v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  NSObject *v22;
  _QWORD block[4];
  id v25;
  _QWORD v26[4];
  id v27;
  objc_super v28;
  uint64_t v29;
  uint8_t buf[4];
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v28.receiver = self;
  v28.super_class = (Class)MSPSharedTripBlocklist;
  v2 = -[MSPSharedTripBlocklist init](&v28, sel_init);
  if (v2)
  {
    MSPGetSharedTripLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = (void *)MEMORY[0x1E0CB3940];
      v5 = v2;
      objc_msgSend(v4, "stringWithFormat:", CFSTR("%@<%p>"), objc_opt_class(), v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      *(_DWORD *)buf = 138543362;
      v31 = v6;
      _os_log_impl(&dword_1B39C0000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] initializing...", buf, 0xCu);

    }
    v7 = dispatch_queue_create("com.apple.mapspushd.SharedTripBlocklist.store", 0);
    v8 = (void *)*((_QWORD *)v2 + 3);
    *((_QWORD *)v2 + 3) = v7;

    v9 = dispatch_queue_create("com.apple.mapspushd.SharedTripBlocklist", 0);
    v10 = (void *)*((_QWORD *)v2 + 2);
    *((_QWORD *)v2 + 2) = v9;

    dispatch_suspend(*((dispatch_object_t *)v2 + 2));
    v11 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v12 = (void *)*((_QWORD *)v2 + 1);
    *((_QWORD *)v2 + 1) = v11;

    *((_BYTE *)v2 + 48) = 1;
    objc_initWeak((id *)buf, v2);
    v13 = *((_QWORD *)v2 + 3);
    v14 = MEMORY[0x1E0C809B0];
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __30__MSPSharedTripBlocklist_init__block_invoke;
    v26[3] = &unk_1E6651E60;
    objc_copyWeak(&v27, (id *)buf);
    +[GCDTimer scheduledTimerWithTimeInterval:queue:block:](GCDTimer, "scheduledTimerWithTimeInterval:queue:block:", v13, v26, 5.0);
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = (void *)*((_QWORD *)v2 + 7);
    *((_QWORD *)v2 + 7) = v15;

    v17 = objc_alloc(MEMORY[0x1E0D473F8]);
    objc_msgSend(MEMORY[0x1E0D473E0], "defaultStoreConfig");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v29, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v17, "initWithConfig:notifyForChanges:callbackQueue:delegate:", v18, v19, *((_QWORD *)v2 + 3), v2);
    v21 = (void *)*((_QWORD *)v2 + 4);
    *((_QWORD *)v2 + 4) = v20;

    v22 = *((_QWORD *)v2 + 2);
    block[0] = v14;
    block[1] = 3221225472;
    block[2] = __30__MSPSharedTripBlocklist_init__block_invoke_2;
    block[3] = &unk_1E6651E88;
    v25 = v2;
    dispatch_async(v22, block);

    objc_destroyWeak(&v27);
    objc_destroyWeak((id *)buf);
  }
  return (MSPSharedTripBlocklist *)v2;
}

void __30__MSPSharedTripBlocklist_init__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_resumeIsolationQueueIfNeeded");

}

uint64_t __30__MSPSharedTripBlocklist_init__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_reloadBlockedIdentifiersFromSync");
}

- (id)description
{
  id v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  id v12;
  __CFString *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  __CFString *v18;
  void *v19;
  id v20;
  void *v21;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  -[NSMutableSet allObjects](self->_blockedIdentifiers, "allObjects");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    if (objc_msgSend(v2, "count"))
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v3, "count"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 0u;
      v25 = 0u;
      v26 = 0u;
      v27 = 0u;
      v23 = v3;
      v5 = v3;
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      if (v6)
      {
        v7 = v6;
        v8 = *(_QWORD *)v25;
        do
        {
          for (i = 0; i != v7; ++i)
          {
            if (*(_QWORD *)v25 != v8)
              objc_enumerationMutation(v5);
            v10 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
            if (v10)
            {
              v11 = (void *)MEMORY[0x1E0CB3940];
              v12 = v10;
              objc_msgSend(v11, "stringWithFormat:", CFSTR("%@<%p>"), objc_opt_class(), v12);
              v13 = (__CFString *)objc_claimAutoreleasedReturnValue();

            }
            else
            {
              v13 = CFSTR("<nil>");
            }
            objc_msgSend(v4, "addObject:", v13);

          }
          v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
        }
        while (v7);
      }

      objc_msgSend(v5, "componentsJoinedByString:", CFSTR(", "));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (void *)MEMORY[0x1E0CB3940];
      v16 = v5;
      objc_msgSend(v15, "stringWithFormat:", CFSTR("%@<%p>"), objc_opt_class(), v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v15, "stringWithFormat:", CFSTR("%@ [%@]"), v17, v14);
      v18 = (__CFString *)objc_claimAutoreleasedReturnValue();

      v3 = v23;
    }
    else
    {
      v19 = (void *)MEMORY[0x1E0CB3940];
      v20 = v3;
      objc_msgSend(v19, "stringWithFormat:", CFSTR("%@<%p>"), objc_opt_class(), v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v19, "stringWithFormat:", CFSTR("%@ (empty)"), v21);
      v18 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v18 = CFSTR("<nil>");
  }

  return v18;
}

- (BOOL)containsAnyIdentifiersInArray:(id)a3
{
  id v4;
  void *v5;
  NSObject *isolationQueue;
  id v7;
  NSObject *v8;
  MSPSharedTripBlocklist *v9;
  void *v10;
  __CFString *v11;
  __CFString *v12;
  BOOL v13;
  _QWORD block[5];
  id v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  id v25;
  __int16 v26;
  __CFString *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  isolationQueue = self->_isolationQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__MSPSharedTripBlocklist_containsAnyIdentifiersInArray___block_invoke;
  block[3] = &unk_1E6651EB0;
  v17 = &v18;
  block[4] = self;
  v7 = v5;
  v16 = v7;
  dispatch_sync(isolationQueue, block);
  MSPGetSharedTripLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = self;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@<%p>"), objc_opt_class(), v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (*((_BYTE *)v19 + 24))
      v11 = CFSTR("YES");
    else
      v11 = CFSTR("NO");
    v12 = v11;
    *(_DWORD *)buf = 138543874;
    v23 = v10;
    v24 = 2112;
    v25 = v4;
    v26 = 2112;
    v27 = v12;
    _os_log_impl(&dword_1B39C0000, v8, OS_LOG_TYPE_INFO, "[%{public}@] containsIdentifiers? %@ : %@", buf, 0x20u);

  }
  v13 = *((_BYTE *)v19 + 24) != 0;

  _Block_object_dispose(&v18, 8);
  return v13;
}

uint64_t __56__MSPSharedTripBlocklist_containsAnyIdentifiersInArray___block_invoke(_QWORD *a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1[4] + 8), "intersectsSet:", a1[5]);
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = result;
  return result;
}

- (BOOL)containsIdentifier:(id)a3
{
  id v4;
  NSObject *isolationQueue;
  id v6;
  NSObject *v7;
  MSPSharedTripBlocklist *v8;
  void *v9;
  __CFString *v10;
  __CFString *v11;
  BOOL v12;
  _QWORD block[5];
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  id v24;
  __int16 v25;
  __CFString *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  isolationQueue = self->_isolationQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__MSPSharedTripBlocklist_containsIdentifier___block_invoke;
  block[3] = &unk_1E6651EB0;
  v16 = &v17;
  block[4] = self;
  v6 = v4;
  v15 = v6;
  dispatch_sync(isolationQueue, block);
  MSPGetSharedTripLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = self;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@<%p>"), objc_opt_class(), v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (*((_BYTE *)v18 + 24))
      v10 = CFSTR("YES");
    else
      v10 = CFSTR("NO");
    v11 = v10;
    *(_DWORD *)buf = 138543874;
    v22 = v9;
    v23 = 2112;
    v24 = v6;
    v25 = 2112;
    v26 = v11;
    _os_log_impl(&dword_1B39C0000, v7, OS_LOG_TYPE_INFO, "[%{public}@] containsIdentifier? %@ : %@", buf, 0x20u);

  }
  v12 = *((_BYTE *)v18 + 24) != 0;

  _Block_object_dispose(&v17, 8);
  return v12;
}

uint64_t __45__MSPSharedTripBlocklist_containsIdentifier___block_invoke(_QWORD *a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1[4] + 8), "containsObject:", a1[5]);
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = result;
  return result;
}

- (void)blockIdentifier:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v7 = a3;
    v4 = (void *)MEMORY[0x1E0C99D20];
    v5 = a3;
    objc_msgSend(v4, "arrayWithObjects:count:", &v7, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[MSPSharedTripBlocklist blockIdentifiers:](self, "blockIdentifiers:", v6, v7, v8);
  }
}

- (void)blockIdentifiers:(id)a3
{
  id v4;
  void *v5;
  NSObject *isolationQueue;
  id v7;
  NSObject *v8;
  double v9;
  double v10;
  NSObject *v11;
  void *v12;
  MSPSharedTripBlocklist *v13;
  void *v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t v20;
  void *v21;
  MSPSharedTripBlocklist *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
  void *v31;
  _TtC8MapsSync13MapsSyncStore *store;
  id v33;
  NSObject *v34;
  NSObject *v35;
  void *v36;
  MSPSharedTripBlocklist *v37;
  void *v38;
  __CFString *v39;
  __CFString *v40;
  void *v41;
  MSPSharedTripBlocklist *v42;
  void *v43;
  id v44;
  id v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _QWORD block[4];
  id v51;
  MSPSharedTripBlocklist *v52;
  uint8_t v53[128];
  uint8_t buf[4];
  void *v55;
  __int16 v56;
  uint64_t v57;
  __int16 v58;
  uint64_t v59;
  __int16 v60;
  NSObject *v61;
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithArray:", v4);
    isolationQueue = self->_isolationQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __43__MSPSharedTripBlocklist_blockIdentifiers___block_invoke;
    block[3] = &unk_1E6651C08;
    v7 = v5;
    v51 = v7;
    v52 = self;
    dispatch_sync(isolationQueue, block);
    if (objc_msgSend(v7, "count"))
    {
      GEOConfigGetDouble();
      objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:");
      v8 = objc_claimAutoreleasedReturnValue();
      -[NSObject timeIntervalSinceReferenceDate](v8, "timeIntervalSinceReferenceDate");
      v10 = v9;
      MSPGetSharedTripLog();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v12 = (void *)MEMORY[0x1E0CB3940];
        v13 = self;
        objc_msgSend(v12, "stringWithFormat:", CFSTR("%@<%p>"), objc_opt_class(), v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        v15 = objc_msgSend(v7, "count");
        *(_DWORD *)buf = 138544130;
        v55 = v14;
        v56 = 2048;
        v57 = v15;
        v58 = 2112;
        v59 = (uint64_t)v7;
        v60 = 2112;
        v61 = v8;
        _os_log_impl(&dword_1B39C0000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] blockIdentifiers | blocking %lu identifiers %@ (expires at %@)", buf, 0x2Au);

      }
      v16 = objc_msgSend(v7, "count");
      if (v16 < objc_msgSend(v4, "count"))
      {
        v17 = objc_msgSend(v4, "count");
        v18 = objc_msgSend(v7, "count");
        MSPGetSharedTripLog();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          v20 = v17 - v18;
          v21 = (void *)MEMORY[0x1E0CB3940];
          v22 = self;
          objc_msgSend(v21, "stringWithFormat:", CFSTR("%@<%p>"), objc_opt_class(), v22);
          v23 = (void *)objc_claimAutoreleasedReturnValue();

          v24 = objc_msgSend(v4, "count");
          *(_DWORD *)buf = 138543874;
          v55 = v23;
          v56 = 2048;
          v57 = v20;
          v58 = 2048;
          v59 = v24;
          _os_log_impl(&dword_1B39C0000, v19, OS_LOG_TYPE_DEFAULT, "[%{public}@] blockIdentifiers | %lu/%lu identifiers were already blocked", buf, 0x20u);

        }
      }
      v44 = v4;
      v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v7, "count"));
      v46 = 0u;
      v47 = 0u;
      v48 = 0u;
      v49 = 0u;
      v26 = v7;
      v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v46, v53, 16);
      if (v27)
      {
        v28 = v27;
        v29 = *(_QWORD *)v47;
        do
        {
          for (i = 0; i != v28; ++i)
          {
            if (*(_QWORD *)v47 != v29)
              objc_enumerationMutation(v26);
            v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D473C0]), "initWithStore:expiryTime:sharedTripIdentifier:", self->_store, (uint64_t)v10, *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * i));
            if (v31)
              objc_msgSend(v25, "addObject:", v31);

          }
          v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v46, v53, 16);
        }
        while (v28);
      }

      store = self->_store;
      v45 = 0;
      -[_TtC8MapsSync13MapsSyncStore saveWithObjects:error:](store, "saveWithObjects:error:", v25, &v45);
      v33 = v45;
      v34 = v8;
      if (v33 || !self->_store)
      {
        MSPGetSharedTripLog();
        v35 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
        {
          v36 = (void *)MEMORY[0x1E0CB3940];
          v37 = self;
          objc_msgSend(v36, "stringWithFormat:", CFSTR("%@<%p>"), objc_opt_class(), v37);
          v38 = (void *)objc_claimAutoreleasedReturnValue();

          if (self->_store)
            v39 = CFSTR("YES");
          else
            v39 = CFSTR("NO");
          v40 = v39;
          *(_DWORD *)buf = 138544130;
          v55 = v38;
          v56 = 2112;
          v57 = (uint64_t)v26;
          v58 = 2112;
          v59 = (uint64_t)v33;
          v60 = 2112;
          v61 = v40;
          _os_log_impl(&dword_1B39C0000, v35, OS_LOG_TYPE_ERROR, "[%{public}@] block | failed to block identifiers %@: error: %@, has store: %@", buf, 0x2Au);

        }
      }

      v4 = v44;
    }
    else
    {
      MSPGetSharedTripLog();
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      {
        v41 = (void *)MEMORY[0x1E0CB3940];
        v42 = self;
        objc_msgSend(v41, "stringWithFormat:", CFSTR("%@<%p>"), objc_opt_class(), v42);
        v43 = (void *)objc_claimAutoreleasedReturnValue();

        *(_DWORD *)buf = 138543618;
        v55 = v43;
        v56 = 2112;
        v57 = (uint64_t)v4;
        _os_log_impl(&dword_1B39C0000, v34, OS_LOG_TYPE_ERROR, "[%{public}@] block | already blocked: %@", buf, 0x16u);

      }
    }

  }
}

uint64_t __43__MSPSharedTripBlocklist_blockIdentifiers___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "minusSet:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8));
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "unionSet:", *(_QWORD *)(a1 + 32));
}

- (void)unblockIdentifiers:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  MSPSharedTripBlocklist *v7;
  __CFString *v8;
  NSObject *isolationQueue;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  int v21;
  _TtC8MapsSync13MapsSyncStore *store;
  NSObject *v23;
  NSObject *v24;
  void *v25;
  MSPSharedTripBlocklist *v26;
  __CFString *v27;
  __CFString *v28;
  __CFString *v29;
  void *v30;
  MSPSharedTripBlocklist *v31;
  __CFString *v32;
  id v33;
  void *v34;
  id v35;
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _QWORD block[5];
  id v42;
  uint8_t buf[4];
  __CFString *v44;
  __int16 v45;
  id v46;
  __int16 v47;
  NSObject *v48;
  __int16 v49;
  __CFString *v50;
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  MSPGetSharedTripLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    if (self)
    {
      v6 = (void *)MEMORY[0x1E0CB3940];
      v7 = self;
      objc_msgSend(v6, "stringWithFormat:", CFSTR("%@<%p>"), objc_opt_class(), v7);
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v8 = CFSTR("<nil>");
    }
    *(_DWORD *)buf = 138543362;
    v44 = v8;
    _os_log_impl(&dword_1B39C0000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] unblockIdentifiers", buf, 0xCu);

  }
  if (v4)
  {
    isolationQueue = self->_isolationQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __45__MSPSharedTripBlocklist_unblockIdentifiers___block_invoke;
    block[3] = &unk_1E6651C08;
    block[4] = self;
    v10 = v4;
    v42 = v10;
    dispatch_sync(isolationQueue, block);
    -[MSPSharedTripBlocklist _fetchSyncedIdentifiers](self, "_fetchSyncedIdentifiers");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v11)
    {
LABEL_33:

      goto LABEL_34;
    }
    v35 = v4;
    v33 = v10;
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", v10);
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v11, "count"));
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v34 = v11;
    v14 = v11;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v37, v51, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v38;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v38 != v17)
            objc_enumerationMutation(v14);
          v19 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
          objc_msgSend(v19, "sharedTripIdentifier");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = objc_msgSend(v12, "containsObject:", v20);

          if (v21)
            objc_msgSend(v13, "addObject:", v19);
        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v37, v51, 16);
      }
      while (v16);
    }

    if (objc_msgSend(v13, "count"))
    {
      store = self->_store;
      v36 = 0;
      -[_TtC8MapsSync13MapsSyncStore deleteWithObjects:error:](store, "deleteWithObjects:error:", v13, &v36);
      v23 = v36;
      if (v23 || !self->_store)
      {
        MSPGetSharedTripLog();
        v24 = objc_claimAutoreleasedReturnValue();
        v4 = v35;
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          v25 = (void *)MEMORY[0x1E0CB3940];
          v26 = self;
          objc_msgSend(v25, "stringWithFormat:", CFSTR("%@<%p>"), objc_opt_class(), v26);
          v27 = (__CFString *)objc_claimAutoreleasedReturnValue();

          if (self->_store)
            v28 = CFSTR("YES");
          else
            v28 = CFSTR("NO");
          v29 = v28;
          *(_DWORD *)buf = 138544130;
          v44 = v27;
          v45 = 2112;
          v46 = v33;
          v47 = 2112;
          v48 = v23;
          v49 = 2112;
          v50 = v29;
          _os_log_impl(&dword_1B39C0000, v24, OS_LOG_TYPE_ERROR, "[%{public}@] unblock | failed to unblock identifiers %@: error: %@, has store: %@", buf, 0x2Au);

        }
        goto LABEL_31;
      }
      v23 = 0;
    }
    else
    {
      MSPGetSharedTripLog();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        v4 = v35;
        if (self)
        {
          v30 = (void *)MEMORY[0x1E0CB3940];
          v31 = self;
          objc_msgSend(v30, "stringWithFormat:", CFSTR("%@<%p>"), objc_opt_class(), v31);
          v32 = (__CFString *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v32 = CFSTR("<nil>");
        }
        *(_DWORD *)buf = 138543618;
        v44 = v32;
        v45 = 2112;
        v11 = v34;
        v46 = v33;
        _os_log_impl(&dword_1B39C0000, v23, OS_LOG_TYPE_ERROR, "[%{public}@] unblock | no matching synced items to delete for %@", buf, 0x16u);

        goto LABEL_32;
      }
    }
    v4 = v35;
LABEL_31:
    v11 = v34;
LABEL_32:

    goto LABEL_33;
  }
LABEL_34:

}

void __45__MSPSharedTripBlocklist_unblockIdentifiers___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", *(_QWORD *)(a1 + 40));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "minusSet:", v2);

}

- (void)clearBlockedIdentifiers
{
  NSObject *v3;
  void *v4;
  MSPSharedTripBlocklist *v5;
  __CFString *v6;
  NSObject *isolationQueue;
  void *v8;
  _TtC8MapsSync13MapsSyncStore *store;
  id v10;
  NSObject *v11;
  void *v12;
  MSPSharedTripBlocklist *v13;
  __CFString *v14;
  __CFString *v15;
  __CFString *v16;
  id v17;
  _QWORD block[5];
  uint8_t buf[4];
  __CFString *v20;
  __int16 v21;
  id v22;
  __int16 v23;
  __CFString *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  MSPGetSharedTripLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    if (self)
    {
      v4 = (void *)MEMORY[0x1E0CB3940];
      v5 = self;
      objc_msgSend(v4, "stringWithFormat:", CFSTR("%@<%p>"), objc_opt_class(), v5);
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v6 = CFSTR("<nil>");
    }
    *(_DWORD *)buf = 138543362;
    v20 = v6;
    _os_log_impl(&dword_1B39C0000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] clear | blocked identifiers", buf, 0xCu);

  }
  isolationQueue = self->_isolationQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__MSPSharedTripBlocklist_clearBlockedIdentifiers__block_invoke;
  block[3] = &unk_1E6651E88;
  block[4] = self;
  dispatch_sync(isolationQueue, block);
  -[MSPSharedTripBlocklist _fetchSyncedIdentifiers](self, "_fetchSyncedIdentifiers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    store = self->_store;
    v17 = 0;
    -[_TtC8MapsSync13MapsSyncStore deleteWithObjects:error:](store, "deleteWithObjects:error:", v8, &v17);
    v10 = v17;
    if (v10 || !self->_store)
    {
      MSPGetSharedTripLog();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        v12 = (void *)MEMORY[0x1E0CB3940];
        v13 = self;
        objc_msgSend(v12, "stringWithFormat:", CFSTR("%@<%p>"), objc_opt_class(), v13);
        v14 = (__CFString *)objc_claimAutoreleasedReturnValue();

        if (self->_store)
          v15 = CFSTR("YES");
        else
          v15 = CFSTR("NO");
        v16 = v15;
        *(_DWORD *)buf = 138543874;
        v20 = v14;
        v21 = 2112;
        v22 = v10;
        v23 = 2112;
        v24 = v16;
        _os_log_impl(&dword_1B39C0000, v11, OS_LOG_TYPE_ERROR, "[%{public}@] clear | failed to delete all identifiers with error: %@, has store: %@", buf, 0x20u);

      }
    }

  }
}

uint64_t __49__MSPSharedTripBlocklist_clearBlockedIdentifiers__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "removeAllObjects");
}

- (void)purgeExpiredIdentifiers
{
  NSObject *v3;
  void *v4;
  MSPSharedTripBlocklist *v5;
  __CFString *v6;
  void *v7;
  void *v8;
  NSObject *isolationQueue;
  _QWORD block[5];
  id v11;
  uint8_t buf[4];
  __CFString *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  MSPGetSharedTripLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    if (self)
    {
      v4 = (void *)MEMORY[0x1E0CB3940];
      v5 = self;
      objc_msgSend(v4, "stringWithFormat:", CFSTR("%@<%p>"), objc_opt_class(), v5);
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v6 = CFSTR("<nil>");
    }
    *(_DWORD *)buf = 138543362;
    v13 = v6;
    _os_log_impl(&dword_1B39C0000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] purge | requested", buf, 0xCu);

  }
  -[MSPSharedTripBlocklist _fetchSyncedIdentifiers](self, "_fetchSyncedIdentifiers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    isolationQueue = self->_isolationQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __49__MSPSharedTripBlocklist_purgeExpiredIdentifiers__block_invoke;
    block[3] = &unk_1E6651C08;
    block[4] = self;
    v11 = v7;
    dispatch_async(isolationQueue, block);

  }
}

uint64_t __49__MSPSharedTripBlocklist_purgeExpiredIdentifiers__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_purgeExpiredIdentifiersIn:", *(_QWORD *)(a1 + 40));
}

- (void)_purgeExpiredIdentifiersIn:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  double v11;
  double v12;
  NSObject *v13;
  void *v14;
  MSPSharedTripBlocklist *v15;
  __CFString *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  NSObject *v21;
  MSPSharedTripBlocklist *v22;
  void *v23;
  MSPSharedTripBlocklist *v24;
  __CFString *v25;
  void *v26;
  MSPSharedTripBlocklist *v27;
  __CFString *v28;
  __CFString *v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  void *v33;
  void *v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t j;
  void *v40;
  void *v41;
  id v42;
  __CFString *v43;
  void *v44;
  void *v45;
  id v46;
  void *v47;
  __CFString *v48;
  void *v49;
  id v50;
  _TtC8MapsSync13MapsSyncStore *store;
  NSObject *v52;
  MSPSharedTripBlocklist *v53;
  void *v54;
  MSPSharedTripBlocklist *v55;
  __CFString *v56;
  __CFString *v57;
  __CFString *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  __CFString *v63;
  NSObject *v64;
  void *v66;
  void *v67;
  id v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  uint8_t v77[128];
  uint8_t buf[4];
  __CFString *v79;
  __int16 v80;
  uint64_t v81;
  __int16 v82;
  double v83;
  __int16 v84;
  __CFString *v85;
  uint64_t v86;

  v86 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v67 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", objc_msgSend(v3, "count"));
  v66 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v3, "count"));
  v69 = 0u;
  v70 = 0u;
  v71 = 0u;
  v72 = 0u;
  v4 = v3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v69, v77, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v70;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v70 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v69 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", (double)objc_msgSend(v9, "expiryTime"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "timeIntervalSinceNow");
        if (v11 <= 0.0)
        {
          v12 = v11;
          MSPGetSharedTripLog();
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
          {
            if (self)
            {
              v14 = (void *)MEMORY[0x1E0CB3940];
              v15 = self;
              objc_msgSend(v14, "stringWithFormat:", CFSTR("%@<%p>"), objc_opt_class(), v15);
              v16 = (__CFString *)objc_claimAutoreleasedReturnValue();

            }
            else
            {
              v16 = CFSTR("<nil>");
            }
            objc_msgSend(v9, "sharedTripIdentifier");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v79 = v16;
            v80 = 2112;
            v81 = (uint64_t)v17;
            v82 = 2048;
            v83 = fabs(v12);
            _os_log_impl(&dword_1B39C0000, v13, OS_LOG_TYPE_DEBUG, "[%{public}@] purge | found %@ which expired %#.1lfs ago", buf, 0x20u);

          }
          objc_msgSend(v66, "addObject:", v9);
          objc_msgSend(v9, "sharedTripIdentifier");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v67, "addObject:", v18);

        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v69, v77, 16);
    }
    while (v6);
  }

  v19 = objc_msgSend(v67, "count");
  MSPGetSharedTripLog();
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = v20;
  if (v19)
  {
    v22 = self;
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      if (self)
      {
        v23 = (void *)MEMORY[0x1E0CB3940];
        v24 = self;
        objc_msgSend(v23, "stringWithFormat:", CFSTR("%@<%p>"), objc_opt_class(), v24);
        v25 = (__CFString *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v25 = CFSTR("<nil>");
      }
      v29 = v25;
      v30 = objc_msgSend(v67, "count");
      v31 = objc_msgSend(v4, "count");
      objc_msgSend(v67, "allObjects");
      v32 = (id)objc_claimAutoreleasedReturnValue();
      v33 = v32;
      if (v32)
      {
        if (objc_msgSend(v32, "count"))
        {
          v60 = v31;
          v61 = v30;
          v63 = v29;
          v64 = v21;
          objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v33, "count"));
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v73 = 0u;
          v74 = 0u;
          v75 = 0u;
          v76 = 0u;
          v62 = v33;
          v35 = v33;
          v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v73, buf, 16);
          if (v36)
          {
            v37 = v36;
            v38 = *(_QWORD *)v74;
            do
            {
              for (j = 0; j != v37; ++j)
              {
                if (*(_QWORD *)v74 != v38)
                  objc_enumerationMutation(v35);
                v40 = *(void **)(*((_QWORD *)&v73 + 1) + 8 * j);
                if (v40)
                {
                  v41 = (void *)MEMORY[0x1E0CB3940];
                  v42 = v40;
                  objc_msgSend(v41, "stringWithFormat:", CFSTR("%@<%p>"), objc_opt_class(), v42);
                  v43 = (__CFString *)objc_claimAutoreleasedReturnValue();

                }
                else
                {
                  v43 = CFSTR("<nil>");
                }
                objc_msgSend(v34, "addObject:", v43);

              }
              v37 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v73, buf, 16);
            }
            while (v37);
          }

          objc_msgSend(v35, "componentsJoinedByString:", CFSTR(", "));
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          v45 = (void *)MEMORY[0x1E0CB3940];
          v46 = v35;
          objc_msgSend(v45, "stringWithFormat:", CFSTR("%@<%p>"), objc_opt_class(), v46);
          v47 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v45, "stringWithFormat:", CFSTR("%@ [%@]"), v47, v44);
          v48 = (__CFString *)objc_claimAutoreleasedReturnValue();

          v29 = v63;
          v21 = v64;
          v30 = v61;
          v33 = v62;
          v31 = v60;
        }
        else
        {
          v49 = (void *)MEMORY[0x1E0CB3940];
          v50 = v33;
          objc_msgSend(v49, "stringWithFormat:", CFSTR("%@<%p>"), objc_opt_class(), v50);
          v34 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v49, "stringWithFormat:", CFSTR("%@ (empty)"), v34);
          v48 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }

      }
      else
      {
        v48 = CFSTR("<nil>");
      }
      v22 = self;

      *(_DWORD *)buf = 138544130;
      v79 = v29;
      v80 = 2048;
      v81 = v30;
      v82 = 2048;
      v83 = *(double *)&v31;
      v84 = 2112;
      v85 = v48;
      _os_log_impl(&dword_1B39C0000, v21, OS_LOG_TYPE_DEFAULT, "[%{public}@] purge | will purge %lu/%lu blocked identifiers: %@", buf, 0x2Au);

    }
    -[NSMutableSet minusSet:](v22->_blockedIdentifiers, "minusSet:", v67);
    store = v22->_store;
    v68 = 0;
    -[_TtC8MapsSync13MapsSyncStore deleteWithObjects:error:](store, "deleteWithObjects:error:", v66, &v68);
    v21 = v68;
    if (v21 || !v22->_store)
    {
      MSPGetSharedTripLog();
      v52 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
      {
        v53 = v22;
        v54 = (void *)MEMORY[0x1E0CB3940];
        v55 = v53;
        objc_msgSend(v54, "stringWithFormat:", CFSTR("%@<%p>"), objc_opt_class(), v55);
        v56 = (__CFString *)objc_claimAutoreleasedReturnValue();

        if (v53->_store)
          v57 = CFSTR("YES");
        else
          v57 = CFSTR("NO");
        v58 = v57;
        *(_DWORD *)buf = 138543874;
        v79 = v56;
        v80 = 2112;
        v81 = (uint64_t)v21;
        v82 = 2112;
        v83 = *(double *)&v58;
        _os_log_impl(&dword_1B39C0000, v52, OS_LOG_TYPE_ERROR, "[%{public}@] purge | failed to remove identifiers with error %@, has store: %@", buf, 0x20u);

      }
    }
    else
    {
      v21 = 0;
    }
  }
  else if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
  {
    if (self)
    {
      v26 = (void *)MEMORY[0x1E0CB3940];
      v27 = self;
      objc_msgSend(v26, "stringWithFormat:", CFSTR("%@<%p>"), objc_opt_class(), v27);
      v28 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v28 = CFSTR("<nil>");
    }
    v59 = objc_msgSend(v4, "count");
    *(_DWORD *)buf = 138543618;
    v79 = v28;
    v80 = 2048;
    v81 = v59;
    _os_log_impl(&dword_1B39C0000, v21, OS_LOG_TYPE_DEBUG, "[%{public}@] purge | found nothing to purge from %lu items", buf, 0x16u);

  }
}

- (void)_reloadBlockedIdentifiersFromSync
{
  NSObject *v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  MSPSharedTripBlocklist *v7;
  __CFString *v8;
  void *v9;
  MSPSharedTripBlocklist *v10;
  NSObject *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  MSPSharedTripBlocklist *v19;
  void *v20;
  __CFString *v21;
  __CFString *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t v27[128];
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  NSObject *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  -[MSPSharedTripBlocklist _fetchSyncedIdentifiers](self, "_fetchSyncedIdentifiers");
  v3 = objc_claimAutoreleasedReturnValue();
  MSPGetSharedTripLog();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      if (self)
      {
        v6 = (void *)MEMORY[0x1E0CB3940];
        v7 = self;
        objc_msgSend(v6, "stringWithFormat:", CFSTR("%@<%p>"), objc_opt_class(), v7);
        v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v8 = CFSTR("<nil>");
      }
      *(_DWORD *)buf = 138543618;
      v29 = v8;
      v30 = 2112;
      v31 = v3;
      _os_log_impl(&dword_1B39C0000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] reload | loaded identifiers from sync: %@", buf, 0x16u);

    }
    -[MSPSharedTripBlocklist _purgeExpiredIdentifiersIn:](self, "_purgeExpiredIdentifiersIn:", v3);
    v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", -[NSObject count](v3, "count"));
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v12 = v3;
    v13 = -[NSObject countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v24;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v24 != v15)
            objc_enumerationMutation(v12);
          objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * v16), "sharedTripIdentifier");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject addObject:](v5, "addObject:", v17);

          ++v16;
        }
        while (v14 != v16);
        v14 = -[NSObject countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      }
      while (v14);
    }

    objc_storeStrong((id *)&self->_blockedIdentifiers, v5);
    MSPGetSharedTripLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v18 = (void *)MEMORY[0x1E0CB3940];
      v19 = self;
      objc_msgSend(v18, "stringWithFormat:", CFSTR("%@<%p>"), objc_opt_class(), v19, (_QWORD)v23);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      *(_DWORD *)buf = 138543618;
      v29 = v20;
      v30 = 2112;
      v31 = v5;
      _os_log_impl(&dword_1B39C0000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] reload | set local copy of identifiers: %@", buf, 0x16u);

    }
    goto LABEL_24;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    if (self)
    {
      v9 = (void *)MEMORY[0x1E0CB3940];
      v10 = self;
      objc_msgSend(v9, "stringWithFormat:", CFSTR("%@<%p>"), objc_opt_class(), v10);
      v11 = objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v11 = CFSTR("<nil>");
    }
    if (self->_store)
      v21 = CFSTR("YES");
    else
      v21 = CFSTR("NO");
    v22 = v21;
    *(_DWORD *)buf = 138543618;
    v29 = v11;
    v30 = 2112;
    v31 = v22;
    _os_log_impl(&dword_1B39C0000, v5, OS_LOG_TYPE_ERROR, "[%{public}@] reload | could not load from sync (has store: %@)", buf, 0x16u);

LABEL_24:
  }

}

- (id)_fetchSyncedIdentifiers
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  NSObject *v8;
  void *v9;
  MSPSharedTripBlocklist *v10;
  void *v11;
  __CFString *v12;
  __CFString *v13;
  id v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  __CFString *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (!self->_store)
    return 0;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D473C8]), "initWithStore:", self->_store);
  v14 = 0;
  objc_msgSend(v3, "fetchSyncAndReturnError:", &v14);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v14;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    MSPGetSharedTripLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = (void *)MEMORY[0x1E0CB3940];
      v10 = self;
      objc_msgSend(v9, "stringWithFormat:", CFSTR("%@<%p>"), objc_opt_class(), v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (self->_store)
        v12 = CFSTR("YES");
      else
        v12 = CFSTR("NO");
      v13 = v12;
      *(_DWORD *)buf = 138543874;
      v16 = v11;
      v17 = 2112;
      v18 = v5;
      v19 = 2112;
      v20 = v13;
      _os_log_impl(&dword_1B39C0000, v8, OS_LOG_TYPE_ERROR, "[%{public}@] fetch | _fetchSyncedIdentifiers failed to fetch with error: %@, has store: %@", buf, 0x20u);

    }
  }

  return v4;
}

- (void)_resumeIsolationQueueIfNeeded
{
  NSObject *v3;
  void *v4;
  MSPSharedTripBlocklist *v5;
  void *v6;
  GCDTimer *storeLoadTimeoutTimer;
  NSObject *v8;
  void *v9;
  MSPSharedTripBlocklist *v10;
  void *v11;
  uint8_t buf[4];
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (self->_storeLoadTimeoutTimer)
  {
    MSPGetSharedTripLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = (void *)MEMORY[0x1E0CB3940];
      v5 = self;
      objc_msgSend(v4, "stringWithFormat:", CFSTR("%@<%p>"), objc_opt_class(), v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      *(_DWORD *)buf = 138543362;
      v13 = v6;
      _os_log_impl(&dword_1B39C0000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] timed out waiting to load store", buf, 0xCu);

    }
    -[GCDTimer invalidate](self->_storeLoadTimeoutTimer, "invalidate");
    storeLoadTimeoutTimer = self->_storeLoadTimeoutTimer;
    self->_storeLoadTimeoutTimer = 0;

  }
  if (self->_waitingForStoreToLoad)
  {
    self->_waitingForStoreToLoad = 0;
    dispatch_resume((dispatch_object_t)self->_isolationQueue);
  }
  else
  {
    MSPGetSharedTripLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = (void *)MEMORY[0x1E0CB3940];
      v10 = self;
      objc_msgSend(v9, "stringWithFormat:", CFSTR("%@<%p>"), objc_opt_class(), v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      *(_DWORD *)buf = 138543362;
      v13 = v11;
      _os_log_impl(&dword_1B39C0000, v8, OS_LOG_TYPE_ERROR, "[%{public}@] tried to resume isolation queue, but already resumed (store may have loaded late)", buf, 0xCu);

    }
  }
}

- (void)_cancelTimeoutTimer
{
  NSObject *v3;
  void *v4;
  MSPSharedTripBlocklist *v5;
  void *v6;
  GCDTimer *storeLoadTimeoutTimer;
  uint8_t buf[4];
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (self->_storeLoadTimeoutTimer)
  {
    MSPGetSharedTripLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = (void *)MEMORY[0x1E0CB3940];
      v5 = self;
      objc_msgSend(v4, "stringWithFormat:", CFSTR("%@<%p>"), objc_opt_class(), v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      *(_DWORD *)buf = 138543362;
      v9 = v6;
      _os_log_impl(&dword_1B39C0000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] store | cancelling timeout timer", buf, 0xCu);

    }
    -[GCDTimer invalidate](self->_storeLoadTimeoutTimer, "invalidate");
    storeLoadTimeoutTimer = self->_storeLoadTimeoutTimer;
    self->_storeLoadTimeoutTimer = 0;

  }
}

- (void)storeControllerWithDidLoad:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  MSPSharedTripBlocklist *v8;
  __CFString *v9;
  NSObject *v10;
  void *v11;
  MSPSharedTripBlocklist *v12;
  __CFString *v13;
  NSObject *isolationQueue;
  _QWORD block[5];
  uint8_t buf[4];
  __CFString *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  MSPGetSharedTripLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    if (self)
    {
      v7 = (void *)MEMORY[0x1E0CB3940];
      v8 = self;
      objc_msgSend(v7, "stringWithFormat:", CFSTR("%@<%p>"), objc_opt_class(), v8);
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v9 = CFSTR("<nil>");
    }
    *(_DWORD *)buf = 138543362;
    v17 = v9;
    _os_log_impl(&dword_1B39C0000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] store | loaded", buf, 0xCu);

  }
  -[MSPSharedTripBlocklist _cancelTimeoutTimer](self, "_cancelTimeoutTimer");
  objc_storeStrong((id *)&self->_store, a3);
  if (self->_waitingForStoreToLoad)
  {
    -[MSPSharedTripBlocklist _resumeIsolationQueueIfNeeded](self, "_resumeIsolationQueueIfNeeded");
  }
  else
  {
    MSPGetSharedTripLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = (void *)MEMORY[0x1E0CB3940];
      v12 = self;
      objc_msgSend(v11, "stringWithFormat:", CFSTR("%@<%p>"), objc_opt_class(), v12);
      v13 = (__CFString *)objc_claimAutoreleasedReturnValue();

      *(_DWORD *)buf = 138543362;
      v17 = v13;
      _os_log_impl(&dword_1B39C0000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@] store | loaded after we already resumed our queue, force reload blocked identifiers", buf, 0xCu);

    }
    isolationQueue = self->_isolationQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __53__MSPSharedTripBlocklist_storeControllerWithDidLoad___block_invoke;
    block[3] = &unk_1E6651E88;
    block[4] = self;
    dispatch_async(isolationQueue, block);
  }

}

uint64_t __53__MSPSharedTripBlocklist_storeControllerWithDidLoad___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_reloadBlockedIdentifiersFromSync");
}

- (void)storeControllerWithFailedToLoad:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  MSPSharedTripBlocklist *v7;
  __CFString *v8;
  _TtC8MapsSync13MapsSyncStore *store;
  uint8_t buf[4];
  __CFString *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  MSPGetSharedTripLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    if (self)
    {
      v6 = (void *)MEMORY[0x1E0CB3940];
      v7 = self;
      objc_msgSend(v6, "stringWithFormat:", CFSTR("%@<%p>"), objc_opt_class(), v7);
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v8 = CFSTR("<nil>");
    }
    *(_DWORD *)buf = 138543618;
    v11 = v8;
    v12 = 2112;
    v13 = v4;
    _os_log_impl(&dword_1B39C0000, v5, OS_LOG_TYPE_ERROR, "[%{public}@] store | failed to load: %@", buf, 0x16u);

  }
  -[MSPSharedTripBlocklist _cancelTimeoutTimer](self, "_cancelTimeoutTimer");
  store = self->_store;
  self->_store = 0;

  -[MSPSharedTripBlocklist _resumeIsolationQueueIfNeeded](self, "_resumeIsolationQueueIfNeeded");
}

- (void)storeControllerWithDataChanged:(id)a3
{
  NSObject *v4;
  void *v5;
  MSPSharedTripBlocklist *v6;
  __CFString *v7;
  NSObject *isolationQueue;
  _QWORD block[5];
  uint8_t buf[4];
  __CFString *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  MSPGetSharedTripLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    if (self)
    {
      v5 = (void *)MEMORY[0x1E0CB3940];
      v6 = self;
      objc_msgSend(v5, "stringWithFormat:", CFSTR("%@<%p>"), objc_opt_class(), v6);
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v7 = CFSTR("<nil>");
    }
    *(_DWORD *)buf = 138543362;
    v11 = v7;
    _os_log_impl(&dword_1B39C0000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] store | data changed, schedule reload of blocked identifiers", buf, 0xCu);

  }
  isolationQueue = self->_isolationQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__MSPSharedTripBlocklist_storeControllerWithDataChanged___block_invoke;
  block[3] = &unk_1E6651E88;
  block[4] = self;
  dispatch_async(isolationQueue, block);
}

uint64_t __57__MSPSharedTripBlocklist_storeControllerWithDataChanged___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_reloadBlockedIdentifiersFromSync");
}

+ (void)migrateFromiCloudKVSIfNeeded
{
  int BOOL;
  void *v4;
  NSObject *v5;
  void *v6;
  id v7;
  __CFString *v8;
  __CFString *v9;
  __CFString *v10;
  int v11;
  NSObject *v12;
  _QWORD block[5];
  uint8_t buf[4];
  __CFString *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  __CFString *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  BOOL = GEOConfigGetBOOL();
  +[MSPMapsDefaultsAccessor get:](MSPMapsDefaultsAccessor, "get:", CFSTR("ShareETABlocklistMigration2022"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  MSPGetSharedTripLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    if (a1)
    {
      v6 = (void *)MEMORY[0x1E0CB3940];
      v7 = a1;
      objc_msgSend(v6, "stringWithFormat:", CFSTR("%@<%p>"), objc_opt_class(), v7);
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v8 = CFSTR("<nil>");
    }
    v9 = CFSTR("NO");
    if (BOOL)
      v9 = CFSTR("YES");
    v10 = v9;
    *(_DWORD *)buf = 138543874;
    v15 = v8;
    v16 = 2114;
    v17 = v4;
    v18 = 2114;
    v19 = v10;
    _os_log_impl(&dword_1B39C0000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] migration | Last KVS blocklist migration performed: %{public}@, should always check: %{public}@", buf, 0x20u);

  }
  if (v4)
    v11 = BOOL;
  else
    v11 = 1;
  if (v11 == 1)
  {
    dispatch_get_global_queue(9, 0);
    v12 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __54__MSPSharedTripBlocklist_migrateFromiCloudKVSIfNeeded__block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0l;
    block[4] = a1;
    dispatch_async(v12, block);

  }
}

void __54__MSPSharedTripBlocklist_migrateFromiCloudKVSIfNeeded__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  id v7;
  __CFString *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  id v13;
  __CFString *v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  id v20;
  __CFString *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  id v25;
  __CFString *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  id v31;
  __CFString *v32;
  uint8_t buf[4];
  __CFString *v34;
  __int16 v35;
  uint64_t v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3A38], "defaultStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dictionaryForKey:", CFSTR("com.apple.mapspushd.MSPSharedTripBlacklist"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    MSPGetSharedTripLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(void **)(a1 + 32);
      if (v5)
      {
        v6 = (void *)MEMORY[0x1E0CB3940];
        v7 = v5;
        objc_msgSend(v6, "stringWithFormat:", CFSTR("%@<%p>"), objc_opt_class(), v7);
        v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v8 = CFSTR("<nil>");
      }
      *(_DWORD *)buf = 138543362;
      v34 = v8;
      _os_log_impl(&dword_1B39C0000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] migration | - Found blocklist data in iCloud KVS, will migrate in background", buf, 0xCu);

    }
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("tripIdentifiers"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "count"))
    {
      MSPGetSharedTripLog();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v11 = *(void **)(a1 + 32);
        if (v11)
        {
          v12 = (void *)MEMORY[0x1E0CB3940];
          v13 = v11;
          objc_msgSend(v12, "stringWithFormat:", CFSTR("%@<%p>"), objc_opt_class(), v13);
          v14 = (__CFString *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v14 = CFSTR("<nil>");
        }
        v15 = objc_msgSend(v9, "count");
        *(_DWORD *)buf = 138543618;
        v34 = v14;
        v35 = 2048;
        v36 = v15;
        _os_log_impl(&dword_1B39C0000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@] migration | - Migrating %lu blocked trip identifiers...", buf, 0x16u);

      }
      objc_msgSend(*(id *)(a1 + 32), "sharedInstance");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "blockIdentifiers:", v9);

    }
    if (GEOConfigGetBOOL())
    {
      MSPGetSharedTripLog();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        v18 = *(void **)(a1 + 32);
        if (v18)
        {
          v19 = (void *)MEMORY[0x1E0CB3940];
          v20 = v18;
          objc_msgSend(v19, "stringWithFormat:", CFSTR("%@<%p>"), objc_opt_class(), v20);
          v21 = (__CFString *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v21 = CFSTR("<nil>");
        }
        *(_DWORD *)buf = 138543362;
        v34 = v21;
        _os_log_impl(&dword_1B39C0000, v17, OS_LOG_TYPE_DEFAULT, "[%{public}@] migration | - Clearing KVS blocklist post-migration...", buf, 0xCu);

      }
      objc_msgSend(v2, "removeObjectForKey:", CFSTR("com.apple.mapspushd.MSPSharedTripBlacklist"));
      objc_msgSend(v2, "synchronize");
    }
    MSPGetSharedTripLog();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      v23 = *(void **)(a1 + 32);
      if (v23)
      {
        v24 = (void *)MEMORY[0x1E0CB3940];
        v25 = v23;
        objc_msgSend(v24, "stringWithFormat:", CFSTR("%@<%p>"), objc_opt_class(), v25);
        v26 = (__CFString *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v26 = CFSTR("<nil>");
      }
      *(_DWORD *)buf = 138543362;
      v34 = v26;
      _os_log_impl(&dword_1B39C0000, v22, OS_LOG_TYPE_DEFAULT, "[%{public}@] migration | - Finished migrating blocked trip identifiers", buf, 0xCu);

    }
  }
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  MSPGetSharedTripLog();
  v28 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    v29 = *(void **)(a1 + 32);
    if (v29)
    {
      v30 = (void *)MEMORY[0x1E0CB3940];
      v31 = v29;
      objc_msgSend(v30, "stringWithFormat:", CFSTR("%@<%p>"), objc_opt_class(), v31);
      v32 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v32 = CFSTR("<nil>");
    }
    *(_DWORD *)buf = 138543618;
    v34 = v32;
    v35 = 2114;
    v36 = (uint64_t)v27;
    _os_log_impl(&dword_1B39C0000, v28, OS_LOG_TYPE_DEFAULT, "[%{public}@] migration | Recording KVS migration check at: %{public}@", buf, 0x16u);

  }
  +[MSPMapsDefaultsAccessor set:value:](MSPMapsDefaultsAccessor, "set:value:", CFSTR("ShareETABlocklistMigration2022"), v27);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storeLoadTimeoutTimer, 0);
  objc_storeStrong((id *)&self->_store, 0);
  objc_storeStrong((id *)&self->_storeController, 0);
  objc_storeStrong((id *)&self->_storeQueue, 0);
  objc_storeStrong((id *)&self->_isolationQueue, 0);
  objc_storeStrong((id *)&self->_blockedIdentifiers, 0);
}

@end
