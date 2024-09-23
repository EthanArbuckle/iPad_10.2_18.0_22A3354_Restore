@implementation CDPurgeableResultCache

uint64_t __43__CDPurgeableResultCache_absorbRecentInfo___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setRecentPurgeableResults:", *(_QWORD *)(a1 + 40));
}

- (id)recentInfoForVolume:(id)a3 atUrgency:(int)a4 validateResults:(BOOL)a5
{
  id v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD v13[5];
  id v14;
  uint64_t *v15;
  int v16;
  BOOL v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v8 = a3;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__1;
  v22 = __Block_byref_object_dispose__1;
  v23 = 0;
  -[CDPurgeableResultCache queue](self, "queue");
  v9 = objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __72__CDPurgeableResultCache_recentInfoForVolume_atUrgency_validateResults___block_invoke;
  v13[3] = &unk_1E4A32BE0;
  v14 = v8;
  v15 = &v18;
  v13[4] = self;
  v16 = a4;
  v17 = a5;
  v10 = v8;
  dispatch_sync(v9, v13);

  v11 = (id)v19[5];
  _Block_object_dispose(&v18, 8);

  return v11;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (BOOL)isInvalidForVolume:(id)a3
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
  char v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  -[CDPurgeableResultCache queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__CDPurgeableResultCache_isInvalidForVolume___block_invoke;
  block[3] = &unk_1E4A32C80;
  block[4] = self;
  v9 = v4;
  v10 = &v11;
  v6 = v4;
  dispatch_sync(v5, block);

  LOBYTE(v4) = *((_BYTE *)v12 + 24);
  _Block_object_dispose(&v11, 8);
  return (char)v4;
}

- (BOOL)hasSnapshotForVolume:(id)a3
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
  char v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  -[CDPurgeableResultCache queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__CDPurgeableResultCache_hasSnapshotForVolume___block_invoke;
  block[3] = &unk_1E4A32C80;
  v9 = v4;
  v10 = &v11;
  block[4] = self;
  v6 = v4;
  dispatch_sync(v5, block);

  LOBYTE(v4) = *((_BYTE *)v12 + 24);
  _Block_object_dispose(&v11, 8);
  return (char)v4;
}

- (id)servicesForVolume:(id)a3
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
  v15 = __Block_byref_object_copy__1;
  v16 = __Block_byref_object_dispose__1;
  v17 = 0;
  -[CDPurgeableResultCache queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__CDPurgeableResultCache_servicesForVolume___block_invoke;
  block[3] = &unk_1E4A32C80;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(v5, block);

  v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

- (BOOL)isStaleForVolume:(id)a3
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
  char v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  -[CDPurgeableResultCache queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__CDPurgeableResultCache_isStaleForVolume___block_invoke;
  block[3] = &unk_1E4A32C80;
  v9 = v4;
  v10 = &v11;
  block[4] = self;
  v6 = v4;
  dispatch_sync(v5, block);

  LOBYTE(v4) = *((_BYTE *)v12 + 24);
  _Block_object_dispose(&v11, 8);
  return (char)v4;
}

- (id)recentInfoForVolume:(id)a3 atUrgency:(int)a4
{
  return -[CDPurgeableResultCache recentInfoForVolume:atUrgency:validateResults:](self, "recentInfoForVolume:atUrgency:validateResults:", a3, *(_QWORD *)&a4, 1);
}

void __46__CDPurgeableResultCache_thresholdsForVolume___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "recentPurgeableResults");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "mountPoint");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "thresholdsForVolume:", v2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __43__CDPurgeableResultCache_isStaleForVolume___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "recentPurgeableResults");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v2, "isStaleForVolume:", *(_QWORD *)(a1 + 40));

}

void __44__CDPurgeableResultCache_servicesForVolume___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "recentPurgeableResults");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "servicesForVolume:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __47__CDPurgeableResultCache_hasSnapshotForVolume___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "recentPurgeableResults");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v2, "hasSnapshotForVolume:", *(_QWORD *)(a1 + 40));

}

void __45__CDPurgeableResultCache_isInvalidForVolume___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;

  objc_msgSend(*(id *)(a1 + 32), "recentPurgeableResults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isInvalidForVolume:", *(_QWORD *)(a1 + 40));

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v3;
}

void __72__CDPurgeableResultCache_recentInfoForVolume_atUrgency_validateResults___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "recentPurgeableResults");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_recentInfoForVolume:atUrgency:validateResults:", *(_QWORD *)(a1 + 40), *(unsigned int *)(a1 + 56), *(unsigned __int8 *)(a1 + 60));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (CDRecentInfo)recentPurgeableResults
{
  return self->_recentPurgeableResults;
}

void __53__CDPurgeableResultCache_sharedPurgeableResultsCache__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[CDPurgeableResultCache initEmpty]([CDPurgeableResultCache alloc], "initEmpty");
  v1 = (void *)_MergedGlobals_3;
  _MergedGlobals_3 = (uint64_t)v0;

}

- (id)initEmpty
{
  CDPurgeableResultCache *v2;
  void *v3;
  objc_class *v4;
  id v5;
  dispatch_queue_t v6;
  CDPurgeableResultCache *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CDPurgeableResultCache;
  v2 = -[CDPurgeableResultCache init](&v9, sel_init);
  if (v2)
  {
    +[CDRecentInfo recentInfoForVolumes:](CDRecentInfo, "recentInfoForVolumes:", MEMORY[0x1E0C9AA70]);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[CDPurgeableResultCache setRecentPurgeableResults:](v2, "setRecentPurgeableResults:", v3);

    v4 = (objc_class *)objc_opt_class();
    NSStringFromClass(v4);
    v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v6 = dispatch_queue_create((const char *)objc_msgSend(v5, "UTF8String"), 0);
    -[CDPurgeableResultCache setQueue:](v2, "setQueue:", v6);

    v7 = v2;
  }

  return v2;
}

- (void)setRecentPurgeableResults:(id)a3
{
  objc_storeStrong((id *)&self->_recentPurgeableResults, a3);
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (id)recentInfoForVolumes:(id)a3 atUrgency:(int)a4 validateResults:(BOOL)a5 targetVolume:(id)a6
{
  _BOOL8 v7;
  uint64_t v8;
  id v10;
  id v11;
  id v12;
  __int128 v13;
  uint64_t i;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  _BOOL8 v22;
  void *v23;
  id v24;
  int v25;
  const __CFString *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  __int128 v33;
  CDPurgeableResultCache *v34;
  id obj;
  uint64_t v36;
  uint64_t v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint8_t buf[4];
  void *v43;
  _BYTE v44[128];
  uint64_t v45;

  v7 = a5;
  v8 = *(_QWORD *)&a4;
  v45 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a6;
  v12 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  obj = v10;
  v37 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v44, 16);
  if (v37)
  {
    v36 = *(_QWORD *)v39;
    *(_QWORD *)&v13 = 138412290;
    v33 = v13;
    v34 = self;
    do
    {
      for (i = 0; i != v37; ++i)
      {
        if (*(_QWORD *)v39 != v36)
          objc_enumerationMutation(obj);
        v15 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
        -[CDPurgeableResultCache recentInfoForVolume:atUrgency:validateResults:](self, "recentInfoForVolume:atUrgency:validateResults:", v15, v8, v7, v33);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (v16)
        {
          CDGetLogHandle((uint64_t)"client");
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v15, "mountPoint");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v33;
            v43 = v18;
            _os_log_impl(&dword_1A3662000, v17, OS_LOG_TYPE_DEFAULT, "got volinfo for %@ ", buf, 0xCu);

          }
          objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("CACHE_DELETE_TOTAL_AVAILABLE"));
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          evaluateNumberProperty(v19);
          v20 = (void *)objc_claimAutoreleasedReturnValue();

          if (v11)
          {
            v21 = v8;
            v22 = v7;
            objc_msgSend(v15, "mountPoint");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = v11;
            v25 = objc_msgSend(v23, "isEqualToString:", v11);

            v26 = CFSTR("CACHE_DELETE_SHARED_PURGEABLE");
            if (v25)
            {
              objc_msgSend(v12, "addEntriesFromDictionary:", v16);
              v26 = CFSTR("CACHE_DELETE_TOTAL_AVAILABLE");
            }
            objc_msgSend(v16, "objectForKeyedSubscript:", v26);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            evaluateNumberProperty(v27);
            v28 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v28, "unsignedLongLongValue") + objc_msgSend(v20, "unsignedLongLongValue"));
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "setObject:forKeyedSubscript:", v29, CFSTR("CACHE_DELETE_TOTAL_AVAILABLE"));

            v11 = v24;
            v7 = v22;
            v8 = v21;
            self = v34;
          }
          else
          {
            -[CDPurgeableResultCache dictionaryByMerging:with:](self, "dictionaryByMerging:with:", v12, v16);
            v28 = v12;
            v12 = (id)objc_claimAutoreleasedReturnValue();
          }

        }
      }
      v37 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v44, 16);
    }
    while (v37);
  }

  if (objc_msgSend(v12, "count"))
  {
    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("com.apple.deleted_helper"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v30, CFSTR("CACHE_DELETE_TOTAL_FSPURGEABLE"));

    objc_msgSend(v12, "removeObjectForKey:", CFSTR("com.apple.deleted_helper"));
    v31 = v12;
  }
  else
  {
    v31 = 0;
  }

  return v31;
}

+ (id)sharedPurgeableResultsCache
{
  if (qword_1ECE24230 != -1)
    dispatch_once(&qword_1ECE24230, &__block_literal_global_3);
  return (id)_MergedGlobals_3;
}

- (void)absorbRecentInfo:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  -[CDPurgeableResultCache queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__CDPurgeableResultCache_absorbRecentInfo___block_invoke;
  block[3] = &unk_1E4A32CA8;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(v5, block);

}

- (id)thresholdsForVolume:(id)a3
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
  v15 = __Block_byref_object_copy__1;
  v16 = __Block_byref_object_dispose__1;
  v17 = 0;
  -[CDPurgeableResultCache queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__CDPurgeableResultCache_thresholdsForVolume___block_invoke;
  block[3] = &unk_1E4A32C80;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(v5, block);

  v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

+ (id)fetchVolumeWithPath:(id)a3
{
  return +[CacheDeleteVolume volumeWithPath:](CacheDeleteVolume, "volumeWithPath:", a3);
}

- (id)_recentPurgeableTotals:(int)a3 validateResults:(BOOL)a4
{
  _BOOL8 v4;
  void *v7;
  int v8;
  id v9;
  uint64_t v10;
  __int128 v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  BOOL v18;
  NSObject *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  BOOL v27;
  void *v28;
  void **v29;
  const __CFString **v30;
  uint64_t v31;
  void *v32;
  NSObject *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  NSObject *v37;
  __int128 v39;
  uint64_t v40;
  int v41;
  uint64_t v42;
  id obj;
  void *v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  uint8_t buf[4];
  _BYTE v50[14];
  __int16 v51;
  int v52;
  __int16 v53;
  uint64_t v54;
  const __CFString *v55;
  void *v56;
  _QWORD v57[2];
  _QWORD v58[2];
  _BYTE v59[128];
  uint64_t v60;

  v4 = a4;
  v60 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3)
    v8 = a3;
  else
    v8 = 3;
  v41 = v8;
  if (!-[CDPurgeableResultCache isStale](self, "isStale"))
  {
    v44 = v7;
    v47 = 0u;
    v48 = 0u;
    v45 = 0u;
    v46 = 0u;
    getLocalVolumes();
    obj = (id)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v59, 16);
    if (!v10)
      goto LABEL_34;
    v12 = v10;
    v13 = *(_QWORD *)v46;
    *(_QWORD *)&v11 = 67109378;
    v39 = v11;
    v40 = *(_QWORD *)v46;
    while (1)
    {
      v14 = 0;
      v42 = v12;
      do
      {
        if (*(_QWORD *)v46 != v13)
          objc_enumerationMutation(obj);
        v15 = *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * v14);
        objc_msgSend((id)objc_opt_class(), "fetchVolumeWithPath:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "mountPoint");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = -[CDPurgeableResultCache isInvalidForVolume:](self, "isInvalidForVolume:", v17);

        if (v18)
        {
          CDGetLogHandle((uint64_t)"client");
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)v50 = v15;
            _os_log_debug_impl(&dword_1A3662000, v19, OS_LOG_TYPE_DEBUG, "_recentPurgeableTotals - Ignoring invalid volume: %@", buf, 0xCu);
          }

          goto LABEL_32;
        }
        v20 = v41;
        if (v41 < 1)
          goto LABEL_28;
        while (1)
        {
          -[CDPurgeableResultCache recentInfoForVolume:atUrgency:validateResults:](self, "recentInfoForVolume:atUrgency:validateResults:", v16, v20, v4, v39);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = v21;
          if (v21)
            break;
LABEL_19:

          v27 = __OFSUB__((_DWORD)v20, 1);
          v20 = (v20 - 1);
          if (((int)v20 < 0) ^ v27 | ((_DWORD)v20 == 0))
            goto LABEL_28;
        }
        objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("CACHE_DELETE_TOTAL_AVAILABLE"));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        evaluateNumberProperty(v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("CACHE_DELETE_SHARED_PURGEABLE"));
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        evaluateNumberProperty(v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v24)
        {

          goto LABEL_19;
        }
        if (v26)
        {
          v57[0] = CFSTR("CACHE_DELETE_SHARED_PURGEABLE");
          v57[1] = CFSTR("CACHE_DELETE_AMOUNT");
          v58[0] = v26;
          v58[1] = v24;
          v28 = (void *)MEMORY[0x1E0C99D80];
          v29 = (void **)v58;
          v30 = (const __CFString **)v57;
          v31 = 2;
        }
        else
        {
          v55 = CFSTR("CACHE_DELETE_AMOUNT");
          v56 = v24;
          v28 = (void *)MEMORY[0x1E0C99D80];
          v29 = &v56;
          v30 = &v55;
          v31 = 1;
        }
        objc_msgSend(v28, "dictionaryWithObjects:forKeys:count:", v29, v30, v31);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "setObject:forKeyedSubscript:", v32, v15);

        CDGetLogHandle((uint64_t)"client");
        v33 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v44, "objectForKeyedSubscript:", v15);
          v34 = objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 67109890;
          *(_DWORD *)v50 = 108;
          *(_WORD *)&v50[4] = 2112;
          *(_QWORD *)&v50[6] = v15;
          v51 = 1024;
          v52 = v20;
          v53 = 2112;
          v54 = v34;
          v35 = (void *)v34;
          _os_log_impl(&dword_1A3662000, v33, OS_LOG_TYPE_DEFAULT, "%d CDPurgeableResultCache _recentPurgeableTotals volume: %@, urgency: %d, result: %@", buf, 0x22u);

        }
LABEL_28:
        objc_msgSend(v44, "objectForKeyedSubscript:", v15, v39);
        v36 = (void *)objc_claimAutoreleasedReturnValue();

        v12 = v42;
        v13 = v40;
        if (!v36)
        {
          CDGetLogHandle((uint64_t)"client");
          v37 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v39;
            *(_DWORD *)v50 = 114;
            *(_WORD *)&v50[4] = 2112;
            *(_QWORD *)&v50[6] = v15;
            _os_log_error_impl(&dword_1A3662000, v37, OS_LOG_TYPE_ERROR, "%d CDPurgeableResultCache _recentPurgeableTotals no result for %@, setting to zero", buf, 0x12u);
          }

          objc_msgSend(v44, "setObject:forKeyedSubscript:", &unk_1E4A38F00, v15);
        }
LABEL_32:

        ++v14;
      }
      while (v14 != v12);
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v59, 16);
      if (!v12)
      {
LABEL_34:

        v7 = v44;
        v9 = v44;
        goto LABEL_35;
      }
    }
  }
  v9 = 0;
LABEL_35:

  return v9;
}

- (id)recentPurgeableTotals:(int)a3
{
  return -[CDPurgeableResultCache _recentPurgeableTotals:validateResults:](self, "_recentPurgeableTotals:validateResults:", *(_QWORD *)&a3, 1);
}

- (id)dictionaryByMerging:(id)a3 with:(id)a4
{
  id v6;
  objc_class *v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  _QWORD v14[4];
  id v15;
  id v16;
  CDPurgeableResultCache *v17;

  v6 = a3;
  v7 = (objc_class *)MEMORY[0x1E0C99E08];
  v8 = a4;
  v9 = (void *)objc_msgSend([v7 alloc], "initWithDictionary:", v6);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __51__CDPurgeableResultCache_dictionaryByMerging_with___block_invoke;
  v14[3] = &unk_1E4A32C08;
  v10 = v9;
  v15 = v10;
  v16 = v6;
  v17 = self;
  v11 = v6;
  objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v14);

  v12 = v10;
  return v12;
}

void __51__CDPurgeableResultCache_dictionaryByMerging_with___block_invoke(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  id v18;
  NSObject *v19;
  void *v20;
  _BYTE v21[24];
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (!objc_msgSend(v5, "isEqual:", CFSTR("CACHE_DELETE_NAME_MAP")))
  {
    objc_msgSend(a1[5], "objectForKey:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(a1[5], "objectForKey:", v5);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          CDGetLogHandle((uint64_t)"client");
          v9 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(a1[5], "objectForKey:", v5);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)v21 = 138412802;
            *(_QWORD *)&v21[4] = v6;
            *(_WORD *)&v21[12] = 2112;
            *(_QWORD *)&v21[14] = v20;
            *(_WORD *)&v21[22] = 2112;
            v22 = v5;
            _os_log_debug_impl(&dword_1A3662000, v9, OS_LOG_TYPE_DEBUG, "invoking again %@ and %@ %@", v21, 0x20u);

          }
          objc_msgSend(a1[6], "dictionaryByMerging:with:", v8, v6);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v10, "count"))
            v11 = v10;
          else
            v11 = v8;
          v12 = a1[4];
          goto LABEL_26;
        }
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          CDGetLogHandle((uint64_t)"client");
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)v21 = 138412802;
            *(_QWORD *)&v21[4] = v6;
            *(_WORD *)&v21[12] = 2112;
            *(_QWORD *)&v21[14] = v8;
            *(_WORD *)&v21[22] = 2112;
            v22 = v5;
            _os_log_debug_impl(&dword_1A3662000, v13, OS_LOG_TYPE_DEBUG, "adding %@ and %@ %@", v21, 0x20u);
          }

          evaluateNumberProperty(v6);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "unsignedLongLongValue");
          evaluateNumberProperty(v8);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v16, "unsignedLongLongValue") + v15;

          v18 = a1[4];
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v17);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = v18;
          goto LABEL_25;
        }
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithDictionary:", v8);
        objc_msgSend(v10, "setObject:forKey:", v6, v5);
        CDGetLogHandle((uint64_t)"client");
        v19 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
        {
LABEL_24:

          v12 = a1[4];
LABEL_25:
          v11 = v10;
LABEL_26:
          objc_msgSend(v12, "setObject:forKey:", v11, v5, *(_OWORD *)v21, *(_QWORD *)&v21[16]);

LABEL_27:
          goto LABEL_28;
        }
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          goto LABEL_27;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          goto LABEL_27;
        v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithDictionary:", v6);
        objc_msgSend(v10, "setObject:forKey:", v8, v5);
        CDGetLogHandle((uint64_t)"client");
        v19 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
          goto LABEL_24;
      }
      *(_DWORD *)v21 = 138412546;
      *(_QWORD *)&v21[4] = v10;
      *(_WORD *)&v21[12] = 2112;
      *(_QWORD *)&v21[14] = v5;
      _os_log_debug_impl(&dword_1A3662000, v19, OS_LOG_TYPE_DEBUG, "setting %@ for %@", v21, 0x16u);
      goto LABEL_24;
    }
  }
  objc_msgSend(a1[4], "setObject:forKey:", v6, v5);
LABEL_28:

}

- (id)recentInfoForVolumes:(id)a3 atUrgency:(int)a4
{
  return -[CDPurgeableResultCache recentInfoForVolumes:atUrgency:validateResults:targetVolume:](self, "recentInfoForVolumes:atUrgency:validateResults:targetVolume:", a3, *(_QWORD *)&a4, 1, 0);
}

- (int64_t)recentStateForVolume:(id)a3
{
  id v4;
  NSObject *v5;
  int64_t v6;
  _QWORD block[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  if (v4)
  {
    -[CDPurgeableResultCache queue](self, "queue");
    v5 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __47__CDPurgeableResultCache_recentStateForVolume___block_invoke;
    block[3] = &unk_1E4A32C80;
    v10 = &v11;
    block[4] = self;
    v9 = v4;
    dispatch_sync(v5, block);

    v6 = v12[3];
  }
  else
  {
    v6 = 0;
  }
  _Block_object_dispose(&v11, 8);

  return v6;
}

void __47__CDPurgeableResultCache_recentStateForVolume___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "recentPurgeableResults");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "mountPoint");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v3, "recentStateForVolume:", v2);

}

- (void)updateRecentVolumeInfo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[CDPurgeableResultCache recentPurgeableResults](self, "recentPurgeableResults");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "volumes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "volume");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, v6);

}

- (void)invalidateAllForgettingPushers:(BOOL)a3
{
  NSObject *v5;
  _QWORD v6[5];
  BOOL v7;

  -[CDPurgeableResultCache queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __57__CDPurgeableResultCache_invalidateAllForgettingPushers___block_invoke;
  v6[3] = &unk_1E4A32C30;
  v6[4] = self;
  v7 = a3;
  dispatch_async(v5, v6);

}

void __57__CDPurgeableResultCache_invalidateAllForgettingPushers___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  uint64_t v17;
  void *v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "recentPurgeableResults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "volumes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v25 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i);
        objc_msgSend(*(id *)(a1 + 32), "recentPurgeableResults");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "invalidateForVolume:", v9);

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    }
    while (v6);
  }

  if (*(_BYTE *)(a1 + 40))
  {
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    objc_msgSend(*(id *)(a1 + 32), "recentPurgeableResults", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v11, "copyPushingServices");

    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v21;
      do
      {
        for (j = 0; j != v14; ++j)
        {
          if (*(_QWORD *)v21 != v15)
            objc_enumerationMutation(v12);
          v17 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * j);
          objc_msgSend(*(id *)(a1 + 32), "recentPurgeableResults");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "pushingServices");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "removeObject:", v17);

        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
      }
      while (v14);
    }

  }
}

- (BOOL)isEmpty
{
  CDPurgeableResultCache *v2;
  NSObject *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v2 = self;
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  -[CDPurgeableResultCache queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __33__CDPurgeableResultCache_isEmpty__block_invoke;
  v5[3] = &unk_1E4A32C58;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

void __33__CDPurgeableResultCache_isEmpty__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "recentPurgeableResults");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v2, "isEmpty");

}

- (BOOL)isStale
{
  CDPurgeableResultCache *v2;
  NSObject *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v2 = self;
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  -[CDPurgeableResultCache queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __33__CDPurgeableResultCache_isStale__block_invoke;
  v5[3] = &unk_1E4A32C58;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

void __33__CDPurgeableResultCache_isStale__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "recentPurgeableResults");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v2, "isStale");

}

- (BOOL)hasInvalids
{
  CDPurgeableResultCache *v2;
  NSObject *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v2 = self;
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  -[CDPurgeableResultCache queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __37__CDPurgeableResultCache_hasInvalids__block_invoke;
  v5[3] = &unk_1E4A32C58;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

void __37__CDPurgeableResultCache_hasInvalids__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "recentPurgeableResults");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v2, "hasInvalids");

}

- (id)bsdDiskForVolume:(id)a3
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
  v15 = __Block_byref_object_copy__1;
  v16 = __Block_byref_object_dispose__1;
  v17 = 0;
  -[CDPurgeableResultCache queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__CDPurgeableResultCache_bsdDiskForVolume___block_invoke;
  block[3] = &unk_1E4A32C80;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(v5, block);

  v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __43__CDPurgeableResultCache_bsdDiskForVolume___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "recentPurgeableResults");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bsdDiskForVolume:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)log
{
  NSObject *v3;
  _QWORD block[5];

  -[CDPurgeableResultCache queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __29__CDPurgeableResultCache_log__block_invoke;
  block[3] = &unk_1E4A32CD0;
  block[4] = self;
  dispatch_async(v3, block);

}

void __29__CDPurgeableResultCache_log__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "recentPurgeableResults");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "log");

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_recentPurgeableResults, 0);
}

@end
