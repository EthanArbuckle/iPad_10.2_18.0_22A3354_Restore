@implementation MSPSharedTripCapabilityLevelFetcher

+ (id)sharedFetcher
{
  id v2;

  if (MSPSharedTripSharingAvailable())
  {
    if (qword_1ED328450 != -1)
      dispatch_once(&qword_1ED328450, &__block_literal_global_12);
    v2 = (id)_MergedGlobals_44;
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

void __52__MSPSharedTripCapabilityLevelFetcher_sharedFetcher__block_invoke()
{
  MSPSharedTripCapabilityLevelFetcher *v0;
  void *v1;

  v0 = objc_alloc_init(MSPSharedTripCapabilityLevelFetcher);
  v1 = (void *)_MergedGlobals_44;
  _MergedGlobals_44 = (uint64_t)v0;

}

- (MSPSharedTripCapabilityLevelFetcher)init
{
  MSPSharedTripCapabilityLevelFetcher *v2;
  id v3;
  uint64_t v4;
  GEOObserverHashTable *observers;
  uint64_t v6;
  NSMutableDictionary *identifierToMapsStatus;
  uint64_t v8;
  NSMutableDictionary *identifierToMessagesStatus;
  uint64_t v10;
  NSMutableSet *mapsStatusFetchQueue;
  uint64_t v12;
  NSMutableSet *messagesStatusFetchQueue;
  NSObject *v14;
  dispatch_queue_t v15;
  OS_dispatch_queue *workQueue;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)MSPSharedTripCapabilityLevelFetcher;
  v2 = -[MSPSharedTripCapabilityLevelFetcher init](&v18, sel_init);
  if (v2)
  {
    v3 = objc_alloc(MEMORY[0x1E0D272B8]);
    v4 = objc_msgSend(v3, "initWithProtocol:queue:", &unk_1EF0854D0, MEMORY[0x1E0C80D38]);
    observers = v2->_observers;
    v2->_observers = (GEOObserverHashTable *)v4;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v6 = objc_claimAutoreleasedReturnValue();
    identifierToMapsStatus = v2->_identifierToMapsStatus;
    v2->_identifierToMapsStatus = (NSMutableDictionary *)v6;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v8 = objc_claimAutoreleasedReturnValue();
    identifierToMessagesStatus = v2->_identifierToMessagesStatus;
    v2->_identifierToMessagesStatus = (NSMutableDictionary *)v8;

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v10 = objc_claimAutoreleasedReturnValue();
    mapsStatusFetchQueue = v2->_mapsStatusFetchQueue;
    v2->_mapsStatusFetchQueue = (NSMutableSet *)v10;

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v12 = objc_claimAutoreleasedReturnValue();
    messagesStatusFetchQueue = v2->_messagesStatusFetchQueue;
    v2->_messagesStatusFetchQueue = (NSMutableSet *)v12;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = dispatch_queue_create("com.apple.Maps.MSPSharedTripCapabilityFetcher", v14);
    workQueue = v2->_workQueue;
    v2->_workQueue = (OS_dispatch_queue *)v15;

  }
  return v2;
}

- (void)registerObserver:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  MSPGetSharedTripCapabilityFetcherLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_1B39C0000, v5, OS_LOG_TYPE_DEBUG, "MSPSharedTripCapabilityLevelFetcher registerObserver %@", (uint8_t *)&v6, 0xCu);
  }

  -[GEOObserverHashTable registerObserver:](self->_observers, "registerObserver:", v4);
}

- (void)unregisterObserver:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  MSPGetSharedTripCapabilityFetcherLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_1B39C0000, v5, OS_LOG_TYPE_DEBUG, "MSPSharedTripCapabilityLevelFetcher unregisterObserver %@", (uint8_t *)&v6, 0xCu);
  }

  -[GEOObserverHashTable unregisterObserver:](self->_observers, "unregisterObserver:", v4);
}

- (void)notifyObservers:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  MSPGetSharedTripCapabilityFetcherLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v6 = 134218243;
    v7 = objc_msgSend(v4, "count");
    v8 = 2113;
    v9 = v4;
    _os_log_impl(&dword_1B39C0000, v5, OS_LOG_TYPE_DEBUG, "MSPSharedTripCapabilityLevelFetcher notifyObservers for %lu updated handles: %{private}@", (uint8_t *)&v6, 0x16u);
  }

  -[GEOObserverHashTable capabilityLevelFetcher:didUpdateCapabilityLevelsForHandles:](self->_observers, "capabilityLevelFetcher:didUpdateCapabilityLevelsForHandles:", self, v4);
  -[GEOObserverHashTable capabilityLevelsDidUpdate](self->_observers, "capabilityLevelsDidUpdate");

}

- (unint64_t)capabilityLevelForContact:(id)a3
{
  id v4;
  void *v5;
  OS_dispatch_queue *workQueue;
  id v7;
  NSObject *v8;
  uint64_t *v9;
  const char *label;
  const char *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  int IsValid;
  unint64_t CapabilityType;
  NSObject *v17;
  const __CFString *v18;
  void *v19;
  void *v20;
  const __CFString *v21;
  uint64_t v22;
  void *v24;
  NSObject *v25;
  void *v26;
  const __CFString *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  int v31;
  _BOOL4 v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  void (*v37)(uint64_t *);
  void *v38;
  MSPSharedTripCapabilityLevelFetcher *v39;
  id v40;
  uint64_t *v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t (*v46)(uint64_t, uint64_t);
  void (*v47)(uint64_t);
  id v48;
  uint64_t v49;
  uint64_t *v50;
  uint64_t v51;
  uint64_t (*v52)(uint64_t, uint64_t);
  void (*v53)(uint64_t);
  id v54;
  uint8_t buf[4];
  id v56;
  __int16 v57;
  const __CFString *v58;
  __int16 v59;
  uint64_t v60;
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "handleForIDS");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = 0;
  v50 = &v49;
  v51 = 0x3032000000;
  v52 = __Block_byref_object_copy__3;
  v53 = __Block_byref_object_dispose__3;
  v54 = 0;
  v43 = 0;
  v44 = &v43;
  v45 = 0x3032000000;
  v46 = __Block_byref_object_copy__3;
  v47 = __Block_byref_object_dispose__3;
  v48 = 0;
  workQueue = self->_workQueue;
  v35 = MEMORY[0x1E0C809B0];
  v36 = 3221225472;
  v37 = __65__MSPSharedTripCapabilityLevelFetcher_capabilityLevelForContact___block_invoke;
  v38 = &unk_1E6653A90;
  v41 = &v49;
  v39 = self;
  v7 = v5;
  v40 = v7;
  v42 = &v43;
  v8 = workQueue;
  v9 = &v35;
  label = dispatch_queue_get_label(v8);
  v11 = dispatch_queue_get_label(0);
  if (label == v11 || label && v11 && (v11 = (const char *)strcmp(label, v11), !(_DWORD)v11))
  {
    v13 = (void *)MEMORY[0x1B5E2B350](v11, v12);
    v37(v9);
    objc_autoreleasePoolPop(v13);
  }
  else
  {
    dispatch_sync(v8, v9);
  }

  objc_msgSend(MEMORY[0x1E0D27368], "sharedPlatform", v35, v36);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v14, "isInternalInstall"))
  {
    IsValid = MSPSharedTripVirtualReceiverIsValid(v7);

    if (IsValid)
    {
      CapabilityType = MSPSharedTripVirtualReceiverHandleGetCapabilityType(v7);
      MSPGetSharedTripCapabilityFetcherLog();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        if (CapabilityType > 4)
          v18 = CFSTR("Unknown");
        else
          v18 = *(&off_1E6653BF8 + CapabilityType);
        *(_DWORD *)buf = 138543618;
        v56 = v7;
        v57 = 2114;
        v58 = v18;
        _os_log_impl(&dword_1B39C0000, v17, OS_LOG_TYPE_INFO, "capabilityLevelForContact virtual receiver %{public}@ supports %{public}@", buf, 0x16u);
      }
      goto LABEL_20;
    }
  }
  else
  {

  }
  v19 = (void *)v50[5];
  if (!v19
    || !v44[5]
    || (objc_msgSend(v19, "isExpired") & 1) != 0
    || objc_msgSend((id)v44[5], "isExpired"))
  {
    MSPGetSharedTripCapabilityFetcherLog();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v4, "stringValue");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = (const __CFString *)v50[5];
      v22 = v44[5];
      *(_DWORD *)buf = 138412802;
      v56 = v20;
      v57 = 2114;
      v58 = v21;
      v59 = 2114;
      v60 = v22;
      _os_log_impl(&dword_1B39C0000, v17, OS_LOG_TYPE_INFO, "capabilityLevelForContact cache miss for handle %@ (Maps: %{public}@, iMessage: %{public}@)", buf, 0x20u);

    }
    CapabilityType = 0;
    goto LABEL_20;
  }
  if ((objc_msgSend((id)v50[5], "isBlocked") & 1) != 0 || objc_msgSend((id)v44[5], "isBlocked"))
  {
    MSPGetSharedTripCapabilityFetcherLog();
    v17 = objc_claimAutoreleasedReturnValue();
    CapabilityType = 1;
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      goto LABEL_20;
    objc_msgSend(v4, "stringValue");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v56 = v24;
    _os_log_impl(&dword_1B39C0000, v17, OS_LOG_TYPE_INFO, "capabilityLevelForContact returning invalid for blocked handle %@", buf, 0xCu);

LABEL_25:
    CapabilityType = 1;
    goto LABEL_20;
  }
  MSPGetSharedTripCapabilityFetcherLog();
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v4, "stringValue");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = (const __CFString *)v50[5];
    v28 = v44[5];
    *(_DWORD *)buf = 138412802;
    v56 = v26;
    v57 = 2114;
    v58 = v27;
    v59 = 2114;
    v60 = v28;
    _os_log_impl(&dword_1B39C0000, v25, OS_LOG_TYPE_INFO, "capabilityLevelForContact cache hit for handle %@ (Maps: %{public}@, iMessage: %{public}@)", buf, 0x20u);

  }
  if (objc_msgSend((id)v50[5], "status") == 1)
  {
    MSPGetSharedTripCapabilityFetcherLog();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v4, "stringValue");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v56 = v29;
      _os_log_impl(&dword_1B39C0000, v17, OS_LOG_TYPE_INFO, "capabilityLevelForContact returning cached Maps capability type for %@", buf, 0xCu);

    }
    CapabilityType = 4;
  }
  else if (objc_msgSend((id)v44[5], "status") == 1)
  {
    MSPGetSharedTripCapabilityFetcherLog();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v4, "stringValue");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v56 = v30;
      _os_log_impl(&dword_1B39C0000, v17, OS_LOG_TYPE_INFO, "capabilityLevelForContact returning cached iMessage capability type for %@", buf, 0xCu);

    }
    CapabilityType = 3;
  }
  else
  {
    v31 = objc_msgSend(v4, "isPhoneNumber");
    MSPGetSharedTripCapabilityFetcherLog();
    v17 = objc_claimAutoreleasedReturnValue();
    v32 = os_log_type_enabled(v17, OS_LOG_TYPE_INFO);
    if (!v31)
    {
      if (v32)
      {
        objc_msgSend(v4, "stringValue");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v56 = v34;
        _os_log_impl(&dword_1B39C0000, v17, OS_LOG_TYPE_INFO, "capabilityLevelForContact returning cached invalid capability type for %@", buf, 0xCu);

      }
      goto LABEL_25;
    }
    if (v32)
    {
      objc_msgSend(v4, "stringValue");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v56 = v33;
      _os_log_impl(&dword_1B39C0000, v17, OS_LOG_TYPE_INFO, "capabilityLevelForContact returning cached SMS capability type for %@", buf, 0xCu);

    }
    CapabilityType = 2;
  }
LABEL_20:

  _Block_object_dispose(&v43, 8);
  _Block_object_dispose(&v49, 8);

  return CapabilityType;
}

void __65__MSPSharedTripCapabilityLevelFetcher_capabilityLevelForContact___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  objc_msgSend(*(id *)(a1[4] + 16), "objectForKeyedSubscript:", a1[5]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  objc_msgSend(*(id *)(a1[4] + 24), "objectForKeyedSubscript:", a1[5]);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1[7] + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

- (id)processMapsDictionary:(id)a3
{
  return -[MSPSharedTripCapabilityLevelFetcher _processResult:forContainer:fetchQueue:](self, "_processResult:forContainer:fetchQueue:", a3, self->_identifierToMapsStatus, self->_mapsStatusFetchQueue);
}

- (id)processMessagesDictionary:(id)a3
{
  return -[MSPSharedTripCapabilityLevelFetcher _processResult:forContainer:fetchQueue:](self, "_processResult:forContainer:fetchQueue:", a3, self->_identifierToMessagesStatus, self->_messagesStatusFetchQueue);
}

- (id)_processResult:(id)a3 forContainer:(id)a4 fetchQueue:(id)a5
{
  id v8;
  id v9;
  NSObject *workQueue;
  id v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;

  v8 = a4;
  v9 = a5;
  workQueue = self->_workQueue;
  v11 = a3;
  dispatch_assert_queue_V2(workQueue);
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", objc_msgSend(v11, "count"));
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __78__MSPSharedTripCapabilityLevelFetcher__processResult_forContainer_fetchQueue___block_invoke;
  v18[3] = &unk_1E6653AB8;
  v19 = v8;
  v20 = v12;
  v21 = v9;
  v13 = v9;
  v14 = v12;
  v15 = v8;
  objc_msgSend(v11, "enumerateKeysAndObjectsUsingBlock:", v18);

  v16 = (void *)objc_msgSend(v14, "copy");
  return v16;
}

void __78__MSPSharedTripCapabilityLevelFetcher__processResult_forContainer_fetchQueue___block_invoke(uint64_t a1, void *a2, void *a3)
{
  MSPSharedTripFetchedStatus *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  v5 = -[MSPSharedTripFetchedStatus initWithStatus:]([MSPSharedTripFetchedStatus alloc], "initWithStatus:", objc_msgSend(a3, "integerValue"));
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[MSPSharedTripFetchedStatus isEffectivelyEqualToStatus:](v5, "isEffectivelyEqualToStatus:", v6))
  {
    v7 = *(void **)(a1 + 40);
    v8 = (void *)IDSCopyRawAddressForDestination();
    objc_msgSend(v7, "addObject:", v8);

  }
  if (objc_msgSend(*(id *)(a1 + 48), "containsObject:", v9))
    objc_msgSend(*(id *)(a1 + 48), "removeObject:", v9);
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v5, v9);

}

- (void)_fetchQueuesDidUpdate
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  NSObject *v10;
  id v11;
  id v12;
  void (**v13)(_QWORD, _QWORD);
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  uint64_t v19;
  NSObject *v20;
  _BOOL4 v21;
  uint64_t v22;
  MSPSharedTripCapabilityLevelFetcher *v23;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  IDSBatchIDQueryController *mapsBatchController;
  NSObject *v29;
  uint64_t v30;
  IDSBatchIDQueryController *v31;
  void *v32;
  NSObject *v33;
  uint64_t v34;
  IDSBatchIDQueryController *messagesBatchController;
  NSObject *v36;
  uint64_t v37;
  IDSBatchIDQueryController *v38;
  void *v39;
  NSObject *v40;
  NSObject *v41;
  void *v42;
  id v43;
  uint64_t v44;
  MSPSharedTripCapabilityLevelFetcher *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t j;
  uint64_t v49;
  MSPSharedTripFetchedStatus *v50;
  void *v51;
  void *v52;
  NSObject *v53;
  void *v54;
  uint64_t v55;
  NSObject *v56;
  _BOOL4 v57;
  id v58;
  void *v59;
  NSObject *v60;
  MSPSharedTripCapabilityLevelFetcher *v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  _QWORD v70[4];
  id v71;
  id v72;
  uint8_t v73[128];
  uint8_t buf[4];
  uint64_t v75;
  __int16 v76;
  uint64_t v77;
  _BYTE v78[128];
  uint64_t v79;

  v79 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  if (self->_retryAfterBackoffTimer)
  {
    MSPGetSharedTripCapabilityFetcherLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      -[GCDTimer fireDate](self->_retryAfterBackoffTimer, "fireDate");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "timeIntervalSinceNow");
      *(_DWORD *)buf = 134217984;
      v75 = v5;
      _os_log_impl(&dword_1B39C0000, v3, OS_LOG_TYPE_INFO, "fetch queue updated but still backing off, %#.1lfs to go", buf, 0xCu);

    }
    goto LABEL_71;
  }
  v3 = -[NSMutableSet copy](self->_mapsStatusFetchQueue, "copy");
  v6 = (void *)-[NSMutableSet copy](self->_messagesStatusFetchQueue, "copy");
  v61 = self;
  if (-[NSObject count](v3, "count") || objc_msgSend(v6, "count"))
  {
    v7 = (void *)-[NSMutableDictionary copy](self->_identifierToMapsStatus, "copy");
    v8 = -[NSObject mutableCopy](v3, "mutableCopy");
    objc_msgSend(v8, "unionSet:", v6);
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", objc_msgSend(v8, "count"));
    MSPGetSharedTripCapabilityFetcherLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B39C0000, v10, OS_LOG_TYPE_INFO, "checking for blocked handles...", buf, 2u);
    }

    v70[0] = MEMORY[0x1E0C809B0];
    v70[1] = 3221225472;
    v70[2] = __60__MSPSharedTripCapabilityLevelFetcher__fetchQueuesDidUpdate__block_invoke;
    v70[3] = &unk_1E6653AE0;
    v11 = v7;
    v71 = v11;
    v12 = v9;
    v72 = v12;
    v13 = (void (**)(_QWORD, _QWORD))MEMORY[0x1B5E2B4E8](v70);
    v66 = 0u;
    v67 = 0u;
    v68 = 0u;
    v69 = 0u;
    v14 = v8;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v66, v78, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v67;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v67 != v17)
            objc_enumerationMutation(v14);
          v13[2](v13, *(_QWORD *)(*((_QWORD *)&v66 + 1) + 8 * i));
        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v66, v78, 16);
      }
      while (v16);
    }

  }
  else
  {
    v12 = 0;
  }
  v19 = objc_msgSend(v12, "count");
  MSPGetSharedTripCapabilityFetcherLog();
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = os_log_type_enabled(v20, OS_LOG_TYPE_INFO);
  if (v19)
  {
    if (v21)
    {
      v22 = objc_msgSend(v12, "count");
      *(_DWORD *)buf = 134217984;
      v75 = v22;
      _os_log_impl(&dword_1B39C0000, v20, OS_LOG_TYPE_INFO, "removing %lu blocked handles from fetch queues", buf, 0xCu);
    }

    v23 = v61;
    -[NSMutableSet minusSet:](v61->_mapsStatusFetchQueue, "minusSet:", v12);
    -[NSMutableSet minusSet:](v61->_messagesStatusFetchQueue, "minusSet:", v12);
  }
  else
  {
    if (v21)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B39C0000, v20, OS_LOG_TYPE_INFO, "no blocked handles in fetch queues", buf, 2u);
    }

    v23 = v61;
  }
  MSPGetSharedTripCapabilityFetcherLog();
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
  {
    v25 = -[NSMutableSet count](v23->_mapsStatusFetchQueue, "count");
    v26 = -[NSMutableSet count](v61->_messagesStatusFetchQueue, "count");
    *(_DWORD *)buf = 134218240;
    v75 = v25;
    v23 = v61;
    v76 = 2048;
    v77 = v26;
    _os_log_impl(&dword_1B39C0000, v24, OS_LOG_TYPE_INFO, "requesting %lu Maps and %lu iMessage handles from IDS", buf, 0x16u);
  }

  v27 = -[NSObject count](v3, "count");
  mapsBatchController = v23->_mapsBatchController;
  if (v27)
  {
    if (!mapsBatchController)
    {
      MSPGetSharedTripCapabilityFetcherLog();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B39C0000, v29, OS_LOG_TYPE_DEBUG, "Creating Maps batch ID query controller", buf, 2u);
      }

      v30 = objc_msgSend(objc_alloc(MEMORY[0x1E0D342B0]), "initWithService:delegate:queue:", CFSTR("com.apple.private.alloy.maps.eta"), v61, v61->_workQueue);
      v31 = v61->_mapsBatchController;
      v61->_mapsBatchController = (IDSBatchIDQueryController *)v30;

      mapsBatchController = v61->_mapsBatchController;
    }
    -[NSObject allObjects](v3, "allObjects");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[IDSBatchIDQueryController setDestinations:](mapsBatchController, "setDestinations:", v32);
  }
  else
  {
    if (!mapsBatchController)
      goto LABEL_36;
    MSPGetSharedTripCapabilityFetcherLog();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B39C0000, v33, OS_LOG_TYPE_DEBUG, "Releasing Maps batch ID query controller", buf, 2u);
    }

    -[IDSBatchIDQueryController setDestinations:](v61->_mapsBatchController, "setDestinations:", MEMORY[0x1E0C9AA60]);
    -[IDSBatchIDQueryController invalidate](v61->_mapsBatchController, "invalidate");
    v32 = v61->_mapsBatchController;
    v61->_mapsBatchController = 0;
  }

LABEL_36:
  v34 = objc_msgSend(v6, "count");
  messagesBatchController = v61->_messagesBatchController;
  if (v34)
  {
    if (!messagesBatchController)
    {
      MSPGetSharedTripCapabilityFetcherLog();
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B39C0000, v36, OS_LOG_TYPE_DEBUG, "Creating Messages batch ID query controller", buf, 2u);
      }

      v37 = objc_msgSend(objc_alloc(MEMORY[0x1E0D342B0]), "initWithService:delegate:queue:", CFSTR("com.apple.madrid"), v61, v61->_workQueue);
      v38 = v61->_messagesBatchController;
      v61->_messagesBatchController = (IDSBatchIDQueryController *)v37;

      messagesBatchController = v61->_messagesBatchController;
    }
    objc_msgSend(v6, "allObjects");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[IDSBatchIDQueryController setDestinations:](messagesBatchController, "setDestinations:", v39);
LABEL_46:

    goto LABEL_47;
  }
  if (messagesBatchController)
  {
    MSPGetSharedTripCapabilityFetcherLog();
    v40 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B39C0000, v40, OS_LOG_TYPE_DEBUG, "Releasing iMessage batch ID query controller", buf, 2u);
    }

    -[IDSBatchIDQueryController setDestinations:](v61->_messagesBatchController, "setDestinations:", MEMORY[0x1E0C9AA60]);
    -[IDSBatchIDQueryController invalidate](v61->_messagesBatchController, "invalidate");
    v39 = v61->_messagesBatchController;
    v61->_messagesBatchController = 0;
    goto LABEL_46;
  }
LABEL_47:
  if (objc_msgSend(v12, "count"))
  {
    v59 = v6;
    v60 = v3;
    MSPGetSharedTripCapabilityFetcherLog();
    v41 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B39C0000, v41, OS_LOG_TYPE_INFO, "processing blocked handles...", buf, 2u);
    }

    v42 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", objc_msgSend(v12, "count"));
    v62 = 0u;
    v63 = 0u;
    v64 = 0u;
    v65 = 0u;
    v58 = v12;
    v43 = v12;
    v44 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v62, v73, 16);
    v45 = v61;
    if (v44)
    {
      v46 = v44;
      v47 = *(_QWORD *)v63;
      do
      {
        for (j = 0; j != v46; ++j)
        {
          if (*(_QWORD *)v63 != v47)
            objc_enumerationMutation(v43);
          v49 = *(_QWORD *)(*((_QWORD *)&v62 + 1) + 8 * j);
          v50 = -[MSPSharedTripFetchedStatus initWithStatus:]([MSPSharedTripFetchedStatus alloc], "initWithStatus:", -2);
          -[NSMutableDictionary objectForKeyedSubscript:](v45->_identifierToMapsStatus, "objectForKeyedSubscript:", v49);
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          v52 = v51;
          if (!v51 || (objc_msgSend(v51, "isEqual:", v50) & 1) == 0)
          {
            MSPGetSharedTripCapabilityFetcherLog();
            v53 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v53, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138477827;
              v75 = v49;
              _os_log_impl(&dword_1B39C0000, v53, OS_LOG_TYPE_INFO, "recording %{private}@ as blocked", buf, 0xCu);
            }

            v45 = v61;
            -[NSMutableDictionary setObject:forKeyedSubscript:](v61->_identifierToMapsStatus, "setObject:forKeyedSubscript:", v50, v49);
            -[NSMutableDictionary setObject:forKeyedSubscript:](v61->_identifierToMessagesStatus, "setObject:forKeyedSubscript:", v50, v49);
            v54 = (void *)IDSCopyRawAddressForDestination();
            objc_msgSend(v42, "addObject:", v54);

          }
        }
        v46 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v62, v73, 16);
      }
      while (v46);
    }

    v55 = objc_msgSend(v42, "count");
    MSPGetSharedTripCapabilityFetcherLog();
    v56 = objc_claimAutoreleasedReturnValue();
    v57 = os_log_type_enabled(v56, OS_LOG_TYPE_INFO);
    if (v55)
    {
      v6 = v59;
      v3 = v60;
      v12 = v58;
      if (v57)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B39C0000, v56, OS_LOG_TYPE_INFO, "updated blocked statuses, notifying observers", buf, 2u);
      }

      -[MSPSharedTripCapabilityLevelFetcher notifyObservers:](v61, "notifyObservers:", v42);
    }
    else
    {
      v6 = v59;
      v3 = v60;
      v12 = v58;
      if (v57)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B39C0000, v56, OS_LOG_TYPE_INFO, "no updates after processing blocked handles", buf, 2u);
      }

    }
  }

LABEL_71:
}

void __60__MSPSharedTripCapabilityLevelFetcher__fetchQueuesDidUpdate__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  const char *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    if (objc_msgSend(v4, "isBlocked") && (objc_msgSend(v5, "isExpired") & 1) == 0)
    {
      MSPGetSharedTripCapabilityFetcherLog();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        v8 = 138477827;
        v9 = v3;
        v7 = "- %{private}@ recorded as blocked, not expired";
        goto LABEL_13;
      }
      goto LABEL_14;
    }
    if (+[MSPSharedTripContact isHandleBlocked:](MSPSharedTripContact, "isHandleBlocked:", v3))
    {
      if (objc_msgSend(v5, "isBlocked"))
      {
        MSPGetSharedTripCapabilityFetcherLog();
        v6 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
        {
          v8 = 138477827;
          v9 = v3;
          v7 = "- %{private}@ recorded as blocked+expired, but handle still blocked";
LABEL_13:
          _os_log_impl(&dword_1B39C0000, v6, OS_LOG_TYPE_INFO, v7, (uint8_t *)&v8, 0xCu);
          goto LABEL_14;
        }
        goto LABEL_14;
      }
LABEL_9:
      MSPGetSharedTripCapabilityFetcherLog();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        v8 = 138477827;
        v9 = v3;
        v7 = "- %{private}@ is blocked";
        goto LABEL_13;
      }
LABEL_14:

      objc_msgSend(*(id *)(a1 + 40), "addObject:", v3);
    }
  }
  else if (+[MSPSharedTripContact isHandleBlocked:](MSPSharedTripContact, "isHandleBlocked:", v3))
  {
    goto LABEL_9;
  }

}

- (void)batchQueryController:(id)a3 updatedDestinationsStatus:(id)a4 onService:(id)a5 error:(id)a6
{
  double v9;
  __CFString *v10;
  id v11;
  NSObject *v12;
  uint64_t v13;
  double v14;
  double v15;
  GCDTimer *retryAfterBackoffTimer;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  uint64_t v29;
  void *v30;
  NSObject *v32;
  void *v33;
  NSObject *v34;
  void *v35;
  NSObject *v36;
  OS_dispatch_queue *workQueue;
  GCDTimer *v38;
  GCDTimer *v39;
  __CFString *v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _QWORD v45[5];
  uint8_t v46[128];
  uint8_t buf[4];
  double v48;
  __int16 v49;
  id v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v9 = COERCE_DOUBLE(a4);
  *(double *)&v10 = COERCE_DOUBLE(a5);
  v11 = a6;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  if (v11)
  {
    MSPGetSharedTripCapabilityFetcherLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v48 = *(double *)&v10;
      v49 = 2112;
      v50 = v11;
      _os_log_impl(&dword_1B39C0000, v12, OS_LOG_TYPE_ERROR, "(%@) updatedDestinationsStatus error %@", buf, 0x16u);
    }

    v13 = objc_msgSend(v11, "code");
    if (v13 == -2000 || v13 == -3000)
    {
      if (v9 == 0.0)
      {
        v40 = v10;
        objc_msgSend(v11, "userInfo");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("destinations"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v22, "count"));
        v41 = 0u;
        v42 = 0u;
        v43 = 0u;
        v44 = 0u;
        v24 = v22;
        v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
        if (v25)
        {
          v26 = v25;
          v27 = *(_QWORD *)v42;
          do
          {
            for (i = 0; i != v26; ++i)
            {
              if (*(_QWORD *)v42 != v27)
                objc_enumerationMutation(v24);
              v29 = *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * i);
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -1);
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v23, "setObject:forKeyedSubscript:", v30, v29);

            }
            v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
          }
          while (v26);
        }

        v9 = COERCE_DOUBLE(objc_msgSend(v23, "copy"));
        v10 = v40;
      }
    }
    else if (v13 == -4000)
    {
      GEOConfigGetDouble();
      v15 = v14;
      retryAfterBackoffTimer = self->_retryAfterBackoffTimer;
      MSPGetSharedTripCapabilityFetcherLog();
      v17 = objc_claimAutoreleasedReturnValue();
      v18 = v17;
      if (retryAfterBackoffTimer)
      {
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          -[GCDTimer fireDate](self->_retryAfterBackoffTimer, "fireDate");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "timeIntervalSinceNow");
          *(_DWORD *)buf = 134217984;
          v48 = v20;
          _os_log_impl(&dword_1B39C0000, v18, OS_LOG_TYPE_INFO, "another back-off error, but still backing off, %#.1lfs to go", buf, 0xCu);

        }
      }
      else
      {
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134217984;
          v48 = v15;
          _os_log_impl(&dword_1B39C0000, v18, OS_LOG_TYPE_ERROR, "need to back off, will retry in %#.1lfs", buf, 0xCu);
        }

        workQueue = self->_workQueue;
        v45[0] = MEMORY[0x1E0C809B0];
        v45[1] = 3221225472;
        v45[2] = __102__MSPSharedTripCapabilityLevelFetcher_batchQueryController_updatedDestinationsStatus_onService_error___block_invoke;
        v45[3] = &unk_1E6653B08;
        v45[4] = self;
        +[GCDTimer scheduledTimerWithTimeInterval:queue:repeating:block:](GCDTimer, "scheduledTimerWithTimeInterval:queue:repeating:block:", workQueue, 0, v45, v15);
        v38 = (GCDTimer *)objc_claimAutoreleasedReturnValue();
        v39 = self->_retryAfterBackoffTimer;
        self->_retryAfterBackoffTimer = v38;

      }
      goto LABEL_40;
    }
  }
  if (CFSTR("com.apple.private.alloy.maps.eta") == v10 && *(_QWORD *)&v9 != 0)
  {
    MSPGetSharedTripCapabilityFetcherLog();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v48 = v9;
      _os_log_impl(&dword_1B39C0000, v32, OS_LOG_TYPE_DEFAULT, "idStatusUpdatedForDestinations Maps service: %@", buf, 0xCu);
    }

    -[MSPSharedTripCapabilityLevelFetcher processMapsDictionary:](self, "processMapsDictionary:", *(_QWORD *)&v9);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v33, "count"))
      -[MSPSharedTripCapabilityLevelFetcher notifyObservers:](self, "notifyObservers:", v33);

  }
  if (v10 == CFSTR("com.apple.madrid") && v9 != 0.0)
  {
    MSPGetSharedTripCapabilityFetcherLog();
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v48 = v9;
      _os_log_impl(&dword_1B39C0000, v34, OS_LOG_TYPE_DEFAULT, "idStatusUpdatedForDestinations iMessage service: %@", buf, 0xCu);
    }

    -[MSPSharedTripCapabilityLevelFetcher processMessagesDictionary:](self, "processMessagesDictionary:", *(_QWORD *)&v9);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v35, "count"))
      -[MSPSharedTripCapabilityLevelFetcher notifyObservers:](self, "notifyObservers:", v35);

  }
  -[MSPSharedTripCapabilityLevelFetcher _fetchQueuesDidUpdate](self, "_fetchQueuesDidUpdate");
  if (self->_retryAfterBackoffTimer)
  {
    MSPGetSharedTripCapabilityFetcherLog();
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B39C0000, v36, OS_LOG_TYPE_INFO, "Got a callback while backing off, fire immediately to trigger updates for both services", buf, 2u);
    }

    -[GCDTimer invalidate](self->_retryAfterBackoffTimer, "invalidate");
    -[MSPSharedTripCapabilityLevelFetcher _retryAfterBackoff](self, "_retryAfterBackoff");
  }
LABEL_40:

}

uint64_t __102__MSPSharedTripCapabilityLevelFetcher_batchQueryController_updatedDestinationsStatus_onService_error___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_retryAfterBackoff");
}

- (void)_retryAfterBackoff
{
  NSObject *v3;
  GCDTimer *retryAfterBackoffTimer;
  uint8_t v5[16];

  MSPGetSharedTripCapabilityFetcherLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1B39C0000, v3, OS_LOG_TYPE_INFO, "retrying fetch in response to IDSBatchQueryController back-off", v5, 2u);
  }

  retryAfterBackoffTimer = self->_retryAfterBackoffTimer;
  self->_retryAfterBackoffTimer = 0;

  -[MSPSharedTripCapabilityLevelFetcher _fetchQueuesDidUpdate](self, "_fetchQueuesDidUpdate");
}

- (void)requestCapabilityLevelsForContacts:(id)a3
{
  id v4;
  void *v5;
  OS_dispatch_queue *workQueue;
  id v7;
  NSObject *v8;
  _QWORD *v9;
  const char *label;
  const char *v11;
  uint64_t v12;
  void *v13;
  _QWORD v14[2];
  uint64_t (*v15)(uint64_t);
  void *v16;
  id v17;
  MSPSharedTripCapabilityLevelFetcher *v18;

  v4 = a3;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_workQueue);
  MapsMap(v4, &__block_literal_global_95);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  workQueue = self->_workQueue;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v15 = __74__MSPSharedTripCapabilityLevelFetcher_requestCapabilityLevelsForContacts___block_invoke_2;
  v16 = &unk_1E6651C08;
  v7 = v5;
  v17 = v7;
  v18 = self;
  v8 = workQueue;
  v9 = v14;
  label = dispatch_queue_get_label(v8);
  v11 = dispatch_queue_get_label(0);
  if (label == v11 || label && v11 && (v11 = (const char *)strcmp(label, v11), !(_DWORD)v11))
  {
    v13 = (void *)MEMORY[0x1B5E2B350](v11, v12);
    v15((uint64_t)v9);
    objc_autoreleasePoolPop(v13);
  }
  else
  {
    dispatch_async(v8, v9);
  }

}

uint64_t __74__MSPSharedTripCapabilityLevelFetcher_requestCapabilityLevelsForContacts___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "handleForIDS");
}

uint64_t __74__MSPSharedTripCapabilityLevelFetcher_requestCapabilityLevelsForContacts___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  MSPGetSharedTripCapabilityFetcherLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_1B39C0000, v2, OS_LOG_TYPE_DEBUG, "fetchCapabilityLevelForContacts enqueing destinations %@", (uint8_t *)&v5, 0xCu);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 48), "addObjectsFromArray:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 56), "addObjectsFromArray:", *(_QWORD *)(a1 + 32));
  return objc_msgSend(*(id *)(a1 + 40), "_fetchQueuesDidUpdate");
}

- (void)cancelCapabilityLevelRequestForContacts:(id)a3
{
  id v4;
  NSObject *workQueue;
  id v6;
  _QWORD v7[4];
  id v8;
  MSPSharedTripCapabilityLevelFetcher *v9;

  v4 = a3;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_workQueue);
  workQueue = self->_workQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __79__MSPSharedTripCapabilityLevelFetcher_cancelCapabilityLevelRequestForContacts___block_invoke;
  v7[3] = &unk_1E6651C08;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(workQueue, v7);

}

void __79__MSPSharedTripCapabilityLevelFetcher_cancelCapabilityLevelRequestForContacts___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;
  int v5;
  char v6;
  NSObject *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  MapsMap(*(void **)(a1 + 32), &__block_literal_global_96_0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", v2);
  v4 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 48), "intersectsSet:", v3);
  v5 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 56), "intersectsSet:", v3);
  v6 = v5;
  if (v4)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 48), "minusSet:", v3);
    if ((v6 & 1) == 0)
      goto LABEL_6;
  }
  else if (!v5)
  {
    goto LABEL_9;
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 56), "minusSet:", v3);
LABEL_6:
  MSPGetSharedTripCapabilityFetcherLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = 138412290;
    v9 = v3;
    _os_log_impl(&dword_1B39C0000, v7, OS_LOG_TYPE_DEBUG, "capabilityLevelNoLongerNeededForContact did remove %@ across Maps/Messages queues", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 40), "_fetchQueuesDidUpdate");
LABEL_9:

}

uint64_t __79__MSPSharedTripCapabilityLevelFetcher_cancelCapabilityLevelRequestForContacts___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "handleForIDS");
}

- (void)cancelCapabilityLevelRequestForContact:(id)a3
{
  NSObject *workQueue;
  id v5;
  void *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  workQueue = self->_workQueue;
  v5 = a3;
  dispatch_assert_queue_not_V2(workQueue);
  v7[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[MSPSharedTripCapabilityLevelFetcher cancelCapabilityLevelRequestForContacts:](self, "cancelCapabilityLevelRequestForContacts:", v6);
}

- (void)fetchCapabilityLevelForContact:(id)a3 timeout:(double)a4 queue:(id)a5 completion:(id)a6
{
  NSObject *workQueue;
  id v10;
  id v11;
  id v12;
  _MSPSharedTripSingleCapabilityLevelFetcher *v13;

  workQueue = self->_workQueue;
  v10 = a6;
  v11 = a5;
  v12 = a3;
  dispatch_assert_queue_not_V2(workQueue);
  v13 = -[_MSPSharedTripSingleCapabilityLevelFetcher initWithContact:timeout:queue:completion:]([_MSPSharedTripSingleCapabilityLevelFetcher alloc], "initWithContact:timeout:queue:completion:", v12, v11, v10, a4);

  -[_MSPSharedTripSingleCapabilityLevelFetcher start](v13, "start");
}

- (void)verifyBlockedStatuses
{
  NSObject *v3;
  uint8_t v4[16];

  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_workQueue);
  MSPGetSharedTripCapabilityFetcherLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1B39C0000, v3, OS_LOG_TYPE_INFO, "Will verify existing blocked handles are still blocked", v4, 2u);
  }

  __60__MSPSharedTripCapabilityLevelFetcher_verifyBlockedStatuses__block_invoke(self->_identifierToMapsStatus, CFSTR("Maps"));
  __60__MSPSharedTripCapabilityLevelFetcher_verifyBlockedStatuses__block_invoke(self->_identifierToMessagesStatus, CFSTR("iMessage"));
}

void __60__MSPSharedTripCapabilityLevelFetcher_verifyBlockedStatuses__block_invoke(void *a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10;
  uint8_t buf[4];
  uint64_t v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = a2;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __60__MSPSharedTripCapabilityLevelFetcher_verifyBlockedStatuses__block_invoke_2;
  v9[3] = &unk_1E6653B90;
  v6 = v5;
  v10 = v6;
  objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v9);
  if (v6)
  {
    MSPGetSharedTripCapabilityFetcherLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = objc_msgSend(v6, "count");
      *(_DWORD *)buf = 134218242;
      v12 = v8;
      v13 = 2114;
      v14 = v4;
      _os_log_impl(&dword_1B39C0000, v7, OS_LOG_TYPE_INFO, "- removing %lu blocked handles from %{public}@ statuses", buf, 0x16u);
    }

  }
  objc_msgSend(v3, "removeObjectsForKeys:", v6);

}

void __60__MSPSharedTripCapabilityLevelFetcher_verifyBlockedStatuses__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  NSObject *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (objc_msgSend(a3, "isBlocked")
    && !+[MSPSharedTripContact isHandleBlocked:](MSPSharedTripContact, "isHandleBlocked:", v5))
  {
    MSPGetSharedTripCapabilityFetcherLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = 138477827;
      v8 = v5;
      _os_log_impl(&dword_1B39C0000, v6, OS_LOG_TYPE_INFO, "- %{private}@ is no longer blocked", (uint8_t *)&v7, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_retryAfterBackoffTimer, 0);
  objc_storeStrong((id *)&self->_messagesStatusFetchQueue, 0);
  objc_storeStrong((id *)&self->_mapsStatusFetchQueue, 0);
  objc_storeStrong((id *)&self->_messagesBatchController, 0);
  objc_storeStrong((id *)&self->_mapsBatchController, 0);
  objc_storeStrong((id *)&self->_identifierToMessagesStatus, 0);
  objc_storeStrong((id *)&self->_identifierToMapsStatus, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

@end
