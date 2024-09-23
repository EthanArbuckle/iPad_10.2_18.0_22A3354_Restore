@implementation NTKFaceSnapshotCache

+ (id)snapshotCache
{
  if (snapshotCache_onceToken != -1)
    dispatch_once(&snapshotCache_onceToken, &__block_literal_global_7);
  return (id)snapshotCache_cache;
}

void __37__NTKFaceSnapshotCache_snapshotCache__block_invoke()
{
  NTKFaceSnapshotCache *v0;
  void *v1;

  v0 = objc_alloc_init(NTKFaceSnapshotCache);
  v1 = (void *)snapshotCache_cache;
  snapshotCache_cache = (uint64_t)v0;

}

- (NTKFaceSnapshotCache)init
{
  NTKFaceSnapshotCache *v2;
  uint64_t v3;
  NSMutableDictionary *snapshots;
  uint64_t v5;
  NSMutableDictionary *requestsBySnapshotKey;
  uint64_t v7;
  NSMapTable *callCountsByFace;
  uint64_t v9;
  NSMutableOrderedSet *highPriorityRequests;
  uint64_t v11;
  NSMutableOrderedSet *lowPriorityRequests;
  NSObject *v13;
  dispatch_queue_t v14;
  OS_dispatch_queue *snapshotQueue;
  void *v16;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)NTKFaceSnapshotCache;
  v2 = -[NTKFaceSnapshotCache init](&v18, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v3 = objc_claimAutoreleasedReturnValue();
    snapshots = v2->_snapshots;
    v2->_snapshots = (NSMutableDictionary *)v3;

    v5 = objc_opt_new();
    requestsBySnapshotKey = v2->_requestsBySnapshotKey;
    v2->_requestsBySnapshotKey = (NSMutableDictionary *)v5;

    objc_msgSend(MEMORY[0x1E0CB3748], "mapTableWithKeyOptions:valueOptions:", 0, 0);
    v7 = objc_claimAutoreleasedReturnValue();
    callCountsByFace = v2->_callCountsByFace;
    v2->_callCountsByFace = (NSMapTable *)v7;

    objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
    v9 = objc_claimAutoreleasedReturnValue();
    highPriorityRequests = v2->_highPriorityRequests;
    v2->_highPriorityRequests = (NSMutableOrderedSet *)v9;

    objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
    v11 = objc_claimAutoreleasedReturnValue();
    lowPriorityRequests = v2->_lowPriorityRequests;
    v2->_lowPriorityRequests = (NSMutableOrderedSet *)v11;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = dispatch_queue_create("com.apple.nanotimekit.snapshots.face", v13);
    snapshotQueue = v2->_snapshotQueue;
    v2->_snapshotQueue = (OS_dispatch_queue *)v14;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addObserver:selector:name:object:", v2, sel__snapshotProcessInterrupted_, CFSTR("NTKFaceSnapshotClientInterruptionName"), 0);

  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)NTKFaceSnapshotCache;
  -[NTKFaceSnapshotCache dealloc](&v4, sel_dealloc);
}

- (id)cachedSnapshotOfFace:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  _NTKFaceSnapshotCacheKeyForFace(a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[NTKFaceSnapshotCache snapshots](self, "snapshots");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)_snapshotProcessInterrupted:(id)a3
{
  NSObject *v4;
  _QWORD block[5];
  uint8_t buf[16];

  _NTKLoggingObjectForDomain(4, (uint64_t)"NTKLoggingDomainSnapshot");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B72A3000, v4, OS_LOG_TYPE_DEFAULT, "Face snapshot process interrupted!", buf, 2u);
  }

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__NTKFaceSnapshotCache__snapshotProcessInterrupted___block_invoke;
  block[3] = &unk_1E6BCD5F0;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

void __52__NTKFaceSnapshotCache__snapshotProcessInterrupted___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "servicingRequest");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = v2;
    objc_msgSend(*(id *)(a1 + 32), "_attemptSnapshotForRequest:", v2);
    v2 = v3;
  }

}

- (void)_invokeCallbacksMatchingRequest:(id)a3 withSnapshot:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  NSMutableDictionary *requestsBySnapshotKey;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  NSMutableDictionary *v21;
  void *v22;
  void *v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t v29[128];
  uint8_t buf[4];
  id v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  _NTKLoggingObjectForDomain(4, (uint64_t)"NTKLoggingDomainSnapshot");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "face");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "faceSnapshotKey");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v31 = v7;
    v32 = 2112;
    v33 = v9;
    v34 = 2112;
    v35 = v10;
    _os_log_impl(&dword_1B72A3000, v8, OS_LOG_TYPE_DEFAULT, "Invoking callbacks for snapshot %@ of face %@ with key %@", buf, 0x20u);

  }
  requestsBySnapshotKey = self->_requestsBySnapshotKey;
  objc_msgSend(v6, "faceSnapshotKey");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](requestsBySnapshotKey, "objectForKey:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v14 = v13;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v26;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v26 != v17)
          objc_enumerationMutation(v14);
        objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * v18), "completion", (_QWORD)v25);
        v19 = objc_claimAutoreleasedReturnValue();
        v20 = (void *)v19;
        if (v19)
          (*(void (**)(uint64_t, _QWORD, id))(v19 + 16))(v19, 0, v7);

        ++v18;
      }
      while (v16 != v18);
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v16);
  }

  v21 = self->_requestsBySnapshotKey;
  objc_msgSend(v6, "faceSnapshotKey");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary removeObjectForKey:](v21, "removeObjectForKey:", v22);

  -[NTKFaceSnapshotCache callCountsByFace](self, "callCountsByFace");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "face");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "removeObjectForKey:", v24);

}

- (void)cancelSnapshotRequest:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void (**v13)(_QWORD, _QWORD, _QWORD);
  NSObject *v14;
  void *v15;
  int v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _NTKLoggingObjectForDomain(4, (uint64_t)"NTKLoggingDomainSnapshot");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "face");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 138412290;
    v17 = v6;
    _os_log_impl(&dword_1B72A3000, v5, OS_LOG_TYPE_DEFAULT, "Cancel face request for %@", (uint8_t *)&v16, 0xCu);

  }
  -[NTKFaceSnapshotCache servicingRequest](self, "servicingRequest");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (v7 != v4)
  {
    -[NTKFaceSnapshotCache requestsBySnapshotKey](self, "requestsBySnapshotKey");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "faceSnapshotKey");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKey:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "removeObject:", v4);
    -[NTKFaceSnapshotCache highPriorityRequests](self, "highPriorityRequests");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "removeObject:", v4);
    -[NTKFaceSnapshotCache lowPriorityRequests](self, "lowPriorityRequests");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "removeObject:", v4);
    objc_msgSend(v4, "completion");
    v13 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      _NTKLoggingObjectForDomain(4, (uint64_t)"NTKLoggingDomainSnapshot");
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v4, "face");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = 138412290;
        v17 = v15;
        _os_log_impl(&dword_1B72A3000, v14, OS_LOG_TYPE_DEFAULT, "Cancelling face completion callback called for %@", (uint8_t *)&v16, 0xCu);

      }
      v13[2](v13, 1, 0);
    }

  }
}

- (void)fetchSnapshotWithRequest:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _NTKLoggingObjectForDomain(4, (uint64_t)"NTKLoggingDomainSnapshot");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "face");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 138412290;
    v17 = v6;
    _os_log_impl(&dword_1B72A3000, v5, OS_LOG_TYPE_DEFAULT, "Fetch request for %@", (uint8_t *)&v16, 0xCu);

  }
  objc_msgSend(v4, "options");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "priority");

  objc_msgSend(v4, "completion");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_msgSend(v4, "face");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      if (v8 == 3)
        -[NTKFaceSnapshotCache highPriorityRequests](self, "highPriorityRequests");
      else
        -[NTKFaceSnapshotCache lowPriorityRequests](self, "lowPriorityRequests");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addObject:", v4);

      -[NTKFaceSnapshotCache requestsBySnapshotKey](self, "requestsBySnapshotKey");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "faceSnapshotKey");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectForKey:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v14)
      {
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "faceSnapshotKey");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setObject:forKey:", v14, v15);

      }
      objc_msgSend(v14, "addObject:", v4);
      -[NTKFaceSnapshotCache _serviceRequestsIfIdle](self, "_serviceRequestsIfIdle");

    }
  }

}

- (void)_serviceRequestsIfIdle
{
  NSObject *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  int v16;
  uint64_t v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  _NTKLoggingObjectForDomain(4, (uint64_t)"NTKLoggingDomainSnapshot");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v16) = 0;
    _os_log_impl(&dword_1B72A3000, v3, OS_LOG_TYPE_DEFAULT, "Attempting to service face requests if idle…", (uint8_t *)&v16, 2u);
  }

  -[NTKFaceSnapshotCache servicingRequest](self, "servicingRequest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    -[NTKFaceSnapshotCache highPriorityRequests](self, "highPriorityRequests");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKFaceSnapshotCache lowPriorityRequests](self, "lowPriorityRequests");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "count");
    v10 = v7;
    if (v9 || (v11 = objc_msgSend(v8, "count"), v10 = v8, v11))
      v5 = v10;
    else
      v5 = 0;
    _NTKLoggingObjectForDomain(4, (uint64_t)"NTKLoggingDomainSnapshot");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = objc_msgSend(v7, "count");
      v14 = objc_msgSend(v8, "count");
      v16 = 134218240;
      v17 = v13;
      v18 = 2048;
      v19 = v14;
      _os_log_impl(&dword_1B72A3000, v12, OS_LOG_TYPE_DEFAULT, "High/Low Priority Requests: %lu/%lu", (uint8_t *)&v16, 0x16u);
    }

    if (v5)
    {
      -[NSObject firstObject](v5, "firstObject");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject removeObjectAtIndex:](v5, "removeObjectAtIndex:", 0);
      -[NTKFaceSnapshotCache setServicingRequest:](self, "setServicingRequest:", v15);
      -[NTKFaceSnapshotCache _attemptSnapshotForRequest:](self, "_attemptSnapshotForRequest:", v15);

    }
    goto LABEL_14;
  }
  _NTKLoggingObjectForDomain(4, (uint64_t)"NTKLoggingDomainSnapshot");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    -[NTKFaceSnapshotCache servicingRequest](self, "servicingRequest");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "face");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 138412290;
    v17 = (uint64_t)v7;
    _os_log_impl(&dword_1B72A3000, v5, OS_LOG_TYPE_DEFAULT, "Skipping service request because already servicing face %@", (uint8_t *)&v16, 0xCu);

LABEL_14:
  }

}

- (void)_attemptSnapshotForRequest:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  id v11;
  void *v12;
  unint64_t v13;
  int v14;
  dispatch_qos_class_t v15;
  void *v16;
  void *v17;
  void *v18;
  OS_dispatch_queue *v19;
  NSObject *v20;
  id v21;
  id v22;
  id v23;
  dispatch_block_t v24;
  int relative_priority;
  void *v26;
  _QWORD v27[4];
  id v28;
  id v29;
  id v30;
  OS_dispatch_queue *v31;
  id v32;
  id v33;
  _QWORD block[5];
  id v35;
  id location;
  uint8_t buf[4];
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "face");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  _NTKLoggingObjectForDomain(4, (uint64_t)"NTKLoggingDomainSnapshot");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v38 = v5;
    _os_log_impl(&dword_1B72A3000, v6, OS_LOG_TYPE_DEFAULT, "Attempting snapshot of face %@", buf, 0xCu);
  }

  objc_initWeak(&location, self);
  -[NTKFaceSnapshotCache callCountsByFace](self, "callCountsByFace");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "objectForKey:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v7)
    v7 = &unk_1E6C9D840;
  v9 = objc_msgSend(v7, "unsignedIntegerValue");

  if ((unint64_t)(v9 + 1) < 3)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setObject:forKey:", v12, v5);

    objc_msgSend(v4, "options");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v11, "priority") - 1;
    if (v13 >= 3)
    {
      v14 = 0;
      v15 = QOS_CLASS_UTILITY;
    }
    else
    {
      v14 = dword_1B755D4C8[v13];
      v15 = QOS_CLASS_USER_INITIATED;
    }
    objc_msgSend(v11, "ntk_asDictionaryOptions");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    relative_priority = v14;
    _NTKFaceSnapshotCacheKeyForFace(v5);
    v17 = v5;
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = self->_snapshotQueue;
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __51__NTKFaceSnapshotCache__attemptSnapshotForRequest___block_invoke_2;
    v27[3] = &unk_1E6BCE340;
    v28 = v18;
    v29 = v17;
    v30 = v16;
    v31 = v19;
    v20 = v19;
    v21 = v16;
    v22 = v18;
    objc_copyWeak(&v33, &location);
    v32 = v4;
    v23 = v4;
    v24 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, v15, relative_priority, v27);
    dispatch_async(v20, v24);

    v5 = v17;
    objc_destroyWeak(&v33);

  }
  else
  {
    _NTKLoggingObjectForDomain(4, (uint64_t)"NTKLoggingDomainSnapshot");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v38 = v5;
      _os_log_impl(&dword_1B72A3000, v10, OS_LOG_TYPE_DEFAULT, "Skipping face %@ - too many failures", buf, 0xCu);
    }

    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __51__NTKFaceSnapshotCache__attemptSnapshotForRequest___block_invoke;
    block[3] = &unk_1E6BCD778;
    block[4] = self;
    v35 = v4;
    v11 = v4;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
  objc_destroyWeak(&location);

}

uint64_t __51__NTKFaceSnapshotCache__attemptSnapshotForRequest___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_invokeCallbacksMatchingRequest:withSnapshot:", *(_QWORD *)(a1 + 40), 0);
  objc_msgSend(*(id *)(a1 + 32), "setServicingRequest:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "_serviceRequestsIfIdle");
}

void __51__NTKFaceSnapshotCache__attemptSnapshotForRequest___block_invoke_2(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  +[NTKFaceSnapshotClient sharedInstance](NTKFaceSnapshotClient, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  _NTKLoggingObjectForDomain(4, (uint64_t)"NTKLoggingDomainSnapshot");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138412546;
    v15 = v4;
    v16 = 2112;
    v17 = v5;
    _os_log_impl(&dword_1B72A3000, v3, OS_LOG_TYPE_DEFAULT, "Asking face client to snapshot %@ (%@)…", buf, 0x16u);
  }

  v6 = *(_QWORD *)(a1 + 40);
  v7 = *(_QWORD *)(a1 + 48);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __51__NTKFaceSnapshotCache__attemptSnapshotForRequest___block_invoke_34;
  v8[3] = &unk_1E6BCE318;
  v9 = *(id *)(a1 + 56);
  v10 = *(id *)(a1 + 32);
  objc_copyWeak(&v13, (id *)(a1 + 72));
  v11 = *(id *)(a1 + 64);
  v12 = *(id *)(a1 + 40);
  objc_msgSend(v2, "snapshotFace:options:completion:", v6, v7, v8);

  objc_destroyWeak(&v13);
}

void __51__NTKFaceSnapshotCache__attemptSnapshotForRequest___block_invoke_34(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  _QWORD block[4];
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;

  v3 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__NTKFaceSnapshotCache__attemptSnapshotForRequest___block_invoke_2_35;
  block[3] = &unk_1E6BCE2F0;
  v4 = *(NSObject **)(a1 + 32);
  v7 = *(id *)(a1 + 40);
  v8 = v3;
  v5 = v3;
  objc_copyWeak(&v11, (id *)(a1 + 64));
  v9 = *(id *)(a1 + 48);
  v10 = *(id *)(a1 + 56);
  dispatch_async(v4, block);

  objc_destroyWeak(&v11);
}

void __51__NTKFaceSnapshotCache__attemptSnapshotForRequest___block_invoke_2_35(id *a1)
{
  NSObject *v2;
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  uint8_t buf[4];
  id v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  _NTKLoggingObjectForDomain(4, (uint64_t)"NTKLoggingDomainSnapshot");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = a1[4];
    v4 = a1[5];
    *(_DWORD *)buf = 138412546;
    v16 = v3;
    v17 = 2112;
    v18 = v4;
    _os_log_impl(&dword_1B72A3000, v2, OS_LOG_TYPE_DEFAULT, "Client face snapshotted %@ - %@", buf, 0x16u);
  }

  objc_msgSend(a1[5], "imageWithRenderingMode:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (NTKInternalBuild(v5, v6) && _os_feature_enabled_impl())
  {
    _NTKFaceDebugAPLSnapshotWithBaseImage(v5);
    v7 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v7;
  }
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__NTKFaceSnapshotCache__attemptSnapshotForRequest___block_invoke_36;
  block[3] = &unk_1E6BCE2C8;
  objc_copyWeak(&v14, a1 + 8);
  v10 = a1[6];
  v11 = a1[4];
  v12 = v5;
  v13 = a1[7];
  v8 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v14);
}

void __51__NTKFaceSnapshotCache__attemptSnapshotForRequest___block_invoke_36(uint64_t a1)
{
  id *WeakRetained;
  void *v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  int v10;
  NSObject *v11;
  uint64_t v12;
  int v13;
  void *v14;
  NSObject *v15;
  _BOOL4 v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  _BYTE v23[24];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 64));
  objc_msgSend(WeakRetained, "servicingRequest");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 32);

  if (v3 == v4)
  {
    _NTKFaceSnapshotCacheKeyForFace(*(void **)(a1 + 56));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "faceSnapshotKey");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "isEqualToString:", v9);

    if ((v10 & 1) == 0)
    {
      _NTKLoggingObjectForDomain(4, (uint64_t)"NTKLoggingDomainSnapshot");
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        __51__NTKFaceSnapshotCache__attemptSnapshotForRequest___block_invoke_36_cold_1(v11);

    }
    v12 = *(_QWORD *)(a1 + 48);
    if (!v12)
      goto LABEL_21;
    v13 = *(_QWORD *)(a1 + 40) ? v10 : 0;
    if (v13 != 1)
      goto LABEL_21;
    objc_msgSend(WeakRetained[1], "objectForKeyedSubscript:");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    _NTKLoggingObjectForDomain(4, (uint64_t)"NTKLoggingDomainSnapshot");
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
    if (v14)
    {
      if (v16)
      {
        v17 = *(_QWORD *)(a1 + 40);
        v18 = *(_QWORD *)(a1 + 48);
        *(_DWORD *)v23 = 138412546;
        *(_QWORD *)&v23[4] = v17;
        *(_WORD *)&v23[12] = 2112;
        *(_QWORD *)&v23[14] = v18;
        v19 = "Overwriting cache %@ with %@";
LABEL_19:
        _os_log_impl(&dword_1B72A3000, v15, OS_LOG_TYPE_DEFAULT, v19, v23, 0x16u);
      }
    }
    else if (v16)
    {
      v20 = *(_QWORD *)(a1 + 40);
      v21 = *(_QWORD *)(a1 + 48);
      *(_DWORD *)v23 = 138412546;
      *(_QWORD *)&v23[4] = v20;
      *(_WORD *)&v23[12] = 2112;
      *(_QWORD *)&v23[14] = v21;
      v19 = "Stored to cache %@ with %@";
      goto LABEL_19;
    }

    objc_msgSend(WeakRetained, "snapshots");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setObject:forKey:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));

    v12 = *(_QWORD *)(a1 + 48);
LABEL_21:
    objc_msgSend(WeakRetained, "_invokeCallbacksMatchingRequest:withSnapshot:", *(_QWORD *)(a1 + 32), v12, *(_OWORD *)v23, *(_QWORD *)&v23[16], v24);
    objc_msgSend(WeakRetained, "setServicingRequest:", 0);
    goto LABEL_22;
  }
  _NTKLoggingObjectForDomain(4, (uint64_t)"NTKLoggingDomainSnapshot");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = *(_QWORD *)(a1 + 40);
    v7 = *(_QWORD *)(a1 + 48);
    *(_DWORD *)v23 = 138412546;
    *(_QWORD *)&v23[4] = v6;
    *(_WORD *)&v23[12] = 2112;
    *(_QWORD *)&v23[14] = v7;
    _os_log_impl(&dword_1B72A3000, v5, OS_LOG_TYPE_DEFAULT, "Aborting callbacks because it's not the servicing face request %@ - %@", v23, 0x16u);
  }

LABEL_22:
  objc_msgSend(WeakRetained, "_serviceRequestsIfIdle");

}

- (NSMutableDictionary)snapshots
{
  return self->_snapshots;
}

- (OS_dispatch_queue)snapshotQueue
{
  return self->_snapshotQueue;
}

- (NSMutableDictionary)requestsBySnapshotKey
{
  return self->_requestsBySnapshotKey;
}

- (NSMapTable)callCountsByFace
{
  return self->_callCountsByFace;
}

- (NTKFaceSnapshotCacheRequest)servicingRequest
{
  return self->_servicingRequest;
}

- (void)setServicingRequest:(id)a3
{
  objc_storeStrong((id *)&self->_servicingRequest, a3);
}

- (NSMutableOrderedSet)highPriorityRequests
{
  return self->_highPriorityRequests;
}

- (void)setHighPriorityRequests:(id)a3
{
  objc_storeStrong((id *)&self->_highPriorityRequests, a3);
}

- (NSMutableOrderedSet)lowPriorityRequests
{
  return self->_lowPriorityRequests;
}

- (void)setLowPriorityRequests:(id)a3
{
  objc_storeStrong((id *)&self->_lowPriorityRequests, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lowPriorityRequests, 0);
  objc_storeStrong((id *)&self->_highPriorityRequests, 0);
  objc_storeStrong((id *)&self->_servicingRequest, 0);
  objc_storeStrong((id *)&self->_callCountsByFace, 0);
  objc_storeStrong((id *)&self->_requestsBySnapshotKey, 0);
  objc_storeStrong((id *)&self->_snapshotQueue, 0);
  objc_storeStrong((id *)&self->_snapshots, 0);
}

void __51__NTKFaceSnapshotCache__attemptSnapshotForRequest___block_invoke_36_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1B72A3000, log, OS_LOG_TYPE_ERROR, "Snapshot key changed during request!", v1, 2u);
}

@end
