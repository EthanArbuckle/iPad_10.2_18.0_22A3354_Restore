@implementation HDQueryManager

- (HDDaemon)daemon
{
  return (HDDaemon *)objc_loadWeakRetained((id *)&self->_daemon);
}

- (HDQueryManager)initWithDaemon:(id)a3
{
  id v4;
  HDQueryManager *v5;
  HDQueryManager *v6;
  NSMutableDictionary *v7;
  NSMutableDictionary *queryServersByUUID;
  NSMutableDictionary *v9;
  NSMutableDictionary *queryCollectionsByProcessBundleIdentifier;
  void *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HDQueryManager;
  v5 = -[HDQueryManager init](&v13, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_daemon, v4);
    v6->_lock._os_unfair_lock_opaque = 0;
    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    queryServersByUUID = v6->_queryServersByUUID;
    v6->_queryServersByUUID = v7;

    v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    queryCollectionsByProcessBundleIdentifier = v6->_queryCollectionsByProcessBundleIdentifier;
    v6->_queryCollectionsByProcessBundleIdentifier = v9;

    objc_msgSend(MEMORY[0x1E0D29830], "sharedDiagnosticManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObject:", v6);

  }
  return v6;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0D29830], "sharedDiagnosticManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObject:", self);

  v4.receiver = self;
  v4.super_class = (Class)HDQueryManager;
  -[HDQueryManager dealloc](&v4, sel_dealloc);
}

- (void)startQueryServer:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  os_unfair_lock_s *p_lock;
  id v12;
  os_log_t *v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  id v17;
  id v18;
  NSObject *v19;
  NSMutableDictionary *queryServersByUUID;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  const char *v26;
  HDQueryServerClientState *v27;
  void *v28;
  id v29;
  void *v30;
  char v31;
  objc_class *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  __CFString *v41;
  void *v42;
  void *v43;
  os_log_t v44;
  id v45;
  id v46;
  NSObject *v47;
  id v48;
  id v49;
  NSObject *v50;
  void *v51;
  id v52;
  void *v53;
  int v54;
  id *v55;
  void *v56;
  void *v57;
  id v58;
  id v59;
  id v60;
  void *v61;
  id v62;
  void *v63;
  _QWORD v64[4];
  id v65;
  id location;
  _QWORD aBlock[4];
  id v68;
  id v69;
  id v70;
  _BYTE buf[24];
  void *v72;
  id v73;
  id v74;
  id v75;
  _QWORD v76[4];

  v76[2] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  +[HKDaemonTransaction transactionWithOwner:activityName:](HDDaemonTransaction, "transactionWithOwner:activityName:", self, CFSTR("Start"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __46__HDQueryManager_startQueryServer_completion___block_invoke;
  aBlock[3] = &unk_1E6CECC08;
  v69 = v8;
  v60 = v9;
  v68 = v60;
  v63 = _Block_copy(aBlock);
  if (v7)
  {
    objc_initWeak(&location, self);
    v64[0] = MEMORY[0x1E0C809B0];
    v64[1] = 3221225472;
    v64[2] = __46__HDQueryManager_startQueryServer_completion___block_invoke_2;
    v64[3] = &unk_1E6CECC30;
    v55 = &v65;
    objc_copyWeak(&v65, &location);
    objc_msgSend(v7, "setQueryDidFinishHandler:", v64);
    -[HDQueryManager daemon](self, "daemon");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "unitTest_queryServerDidInit:", v7);

    p_lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    v59 = v7;
    v58 = v63;
    if (!self)
    {
LABEL_33:

      os_unfair_lock_unlock(p_lock);
      objc_destroyWeak(v55);
      objc_destroyWeak(&location);
      goto LABEL_34;
    }
    os_unfair_lock_assert_owner(&self->_lock);
    v70 = 0;
    v12 = v59;
    os_unfair_lock_assert_owner(&self->_lock);
    objc_msgSend(v12, "queryUUID", &v65);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](self->_queryServersByUUID, "objectForKey:", v61);
    v62 = (id)objc_claimAutoreleasedReturnValue();
    v13 = (os_log_t *)MEMORY[0x1E0CB5348];
    if (v62)
    {
      _HKInitializeLogging();
      v14 = *v13;
      v15 = *v13;
      if (v62 == v12)
      {
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          *(_QWORD *)&buf[4] = v12;
          _os_log_error_impl(&dword_1B7802000, v14, OS_LOG_TYPE_ERROR, "Ignoring duplicate attempt to start query server %{public}@", buf, 0xCu);
        }
        objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:description:", &v70, 3, CFSTR("Attempt to start a query with the same identifier."));
        v23 = 0;
        goto LABEL_29;
      }
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        *(_QWORD *)&buf[4] = v61;
        _os_log_impl(&dword_1B7802000, v14, OS_LOG_TYPE_DEFAULT, "Replacing existing query server %{public}@ with a new instance", buf, 0xCu);
      }
      -[HDQueryManager _lock_unregisterQueryServer:]((uint64_t)self, v62);
    }
    objc_msgSend(v12, "client");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "process");
    v57 = (void *)objc_claimAutoreleasedReturnValue();

    -[HDQueryManager _monitoringIdentifierForProcess:]((uint64_t)self, v57);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v56)
    {
      _HKInitializeLogging();
      v44 = *v13;
      if (os_log_type_enabled(*v13, OS_LOG_TYPE_ERROR))
      {
        v50 = v44;
        v51 = (void *)objc_opt_class();
        v52 = v51;
        objc_msgSend(v57, "name");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        v54 = objc_msgSend(v57, "processIdentifier");
        *(_DWORD *)buf = 138544130;
        *(_QWORD *)&buf[4] = v51;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v61;
        *(_WORD *)&buf[22] = 2112;
        v72 = v53;
        LOWORD(v73) = 1024;
        *(_DWORD *)((char *)&v73 + 2) = v54;
        _os_log_error_impl(&dword_1B7802000, v50, OS_LOG_TYPE_ERROR, "Ignoring attempt to start query server of class %{public}@ for UUID %{public}@: process %@ (%d) has no bundle identifier", buf, 0x26u);

      }
      objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:description:", &v70, 3, CFSTR("Missing process bundle identifier"));
      v23 = 0;
      goto LABEL_25;
    }
    v17 = v12;
    v18 = v56;
    os_unfair_lock_assert_owner(&self->_lock);
    _HKInitializeLogging();
    v19 = *v13;
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v17;
      _os_log_debug_impl(&dword_1B7802000, v19, OS_LOG_TYPE_DEBUG, "Registering query server %{public}@", buf, 0xCu);
    }
    queryServersByUUID = self->_queryServersByUUID;
    objc_msgSend(v17, "queryUUID");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](queryServersByUUID, "setObject:forKey:", v17, v21);

    -[HDQueryManager _lock_queryCollectionForBundleIdentifier:createIfNecessary:]((uint64_t)self, v18, 1);
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = v22;
    if (!v22 || !objc_msgSend(*(id *)(v22 + 8), "count"))
    {
      -[HDQueryManager daemon](self, "daemon");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "processStateManager");
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v25, "registerObserver:forBundleIdentifier:", self, v18);
      v27 = -[HDQueryServerClientState initWithApplicationState:]([HDQueryServerClientState alloc], "initWithApplicationState:", objc_msgSend(v25, "applicationStateForBundleIdentifier:", v18));
      if (!v23)
      {
LABEL_16:

        v29 = v17;
        objc_msgSend(v29, "clientState");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = objc_msgSend(v30, "isBackgroundRunning");

        if ((v31 & 1) == 0)
        {
          v76[0] = CFSTR("queryType");
          v32 = (objc_class *)objc_opt_class();
          NSStringFromClass(v32);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          *(_QWORD *)buf = v33;
          v76[1] = CFSTR("queryId");
          objc_msgSend(v29, "queryUUID");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "UUIDString");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          *(_QWORD *)&buf[8] = v35;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, v76, 2);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = (void *)objc_msgSend(v36, "mutableCopy");

          objc_msgSend(v29, "sampleType");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          v39 = v38;
          if (v38)
          {
            objc_msgSend(v38, "description");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v37, "setObject:forKeyedSubscript:", v40, CFSTR("dataType"));

          }
          v41 = kHDEventNameQuery;
          objc_msgSend(v29, "client");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          HDPowerLogForClient(v41, v42, v37);

        }
LABEL_25:

LABEL_29:
        v45 = v70;
        if (v23)
        {
          v46 = *(id *)(v23 + 40);
          v47 = *(NSObject **)(v23 + 24);
          *(_QWORD *)buf = MEMORY[0x1E0C809B0];
          *(_QWORD *)&buf[8] = 3221225472;
          *(_QWORD *)&buf[16] = __52__HDQueryManager__lock_startQueryServer_completion___block_invoke_2;
          v72 = &unk_1E6CECC58;
          v73 = v12;
          v48 = v58;
          v74 = v46;
          v75 = v48;
          v49 = v46;
          dispatch_async(v47, buf);

        }
        else
        {
          *(_QWORD *)buf = MEMORY[0x1E0C809B0];
          *(_QWORD *)&buf[8] = 3221225472;
          *(_QWORD *)&buf[16] = __52__HDQueryManager__lock_startQueryServer_completion___block_invoke;
          v72 = &unk_1E6CE8C48;
          v74 = v58;
          v73 = v45;
          HKDispatchAsyncOnGlobalConcurrentQueue();

          v49 = v74;
        }

        goto LABEL_33;
      }
      objc_setProperty_nonatomic_copy((id)v23, v26, v27, 40);

    }
    v28 = *(void **)(v23 + 8);
    v27 = (HDQueryServerClientState *)v17;
    -[HDQueryServerClientState queryUUID](v27, "queryUUID");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setObject:forKeyedSubscript:", v27, v25);
    goto LABEL_16;
  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "hk_errorForInvalidArgument:class:selector:format:", CFSTR("@\"\"), objc_opt_class(), a2, CFSTR("nil query server"));
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(void *, _QWORD, void *))v63 + 2))(v63, 0, v43);

LABEL_34:
}

uint64_t __46__HDQueryManager_startQueryServer_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "invalidate");
}

void __46__HDQueryManager_startQueryServer_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id v4;
  os_unfair_lock_s *WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained(v2);
  if (WeakRetained)
  {
    v4 = v3;
    os_unfair_lock_lock(WeakRetained + 2);
    -[HDQueryManager _lock_unregisterQueryServer:]((uint64_t)WeakRetained, v4);

    os_unfair_lock_unlock(WeakRetained + 2);
  }

}

uint64_t __52__HDQueryManager__lock_startQueryServer_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __52__HDQueryManager__lock_startQueryServer_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  int v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  v2 = *(void **)(a1 + 32);
  v8 = 0;
  v3 = objc_msgSend(v2, "prepareToActivateServerWithError:", &v8);
  v4 = v8;
  v5 = v4;
  v6 = *(_QWORD *)(a1 + 48);
  if (v3)
  {
    (*(void (**)(_QWORD, uint64_t, _QWORD))(v6 + 16))(*(_QWORD *)(a1 + 48), 1, 0);
  }
  else if (v4)
  {
    (*(void (**)(_QWORD, _QWORD, id))(v6 + 16))(*(_QWORD *)(a1 + 48), 0, v4);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:", 100, CFSTR("Failed to start query with unknown error"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v6 + 16))(v6, 0, v7);

  }
  objc_msgSend(*(id *)(a1 + 32), "activateServerWithClientState:error:", *(_QWORD *)(a1 + 40), v5);

}

- (void)scheduleDatabaseAccessForQueryServer:(id)a3 block:(id)a4
{
  os_unfair_lock_s *p_lock;
  id v7;
  id v8;
  _HDQueryDatabaseAccessBlock *v9;
  id v10;
  id v11;
  HDQueryManager *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  NSMutableDictionary *queryCollectionsByProcessBundleIdentifier;
  void *v20;
  NSMutableArray *pendingDatabaseAccessBlocks;
  NSMutableArray *v22;
  NSMutableArray *v23;
  int64_t unitTest_suspendCount;
  BOOL v25;
  int64_t v26;
  HDQueryManager *v27;
  objc_super v28;

  p_lock = &self->_lock;
  v7 = a4;
  v8 = a3;
  os_unfair_lock_lock(p_lock);
  v9 = [_HDQueryDatabaseAccessBlock alloc];
  v10 = v7;
  v11 = v8;
  if (v9
    && (v28.receiver = v9,
        v28.super_class = (Class)_HDQueryDatabaseAccessBlock,
        (v12 = -[HDQueryManager init](&v28, sel_init)) != 0))
  {
    v27 = v12;
    *(CFAbsoluteTime *)&v12->_executingDatabaseAccessBlocks = CFAbsoluteTimeGetCurrent();
    v13 = objc_msgSend(v10, "copy");
    v14 = *(void **)&v27->_lock._os_unfair_lock_opaque;
    *(_QWORD *)&v27->_lock._os_unfair_lock_opaque = v13;

    objc_storeWeak((id *)&v27->_queryServersByUUID, v11);
    objc_msgSend(v11, "client");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "process");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "bundleIdentifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "copy");
    queryCollectionsByProcessBundleIdentifier = v27->_queryCollectionsByProcessBundleIdentifier;
    v27->_queryCollectionsByProcessBundleIdentifier = (NSMutableDictionary *)v18;

    objc_msgSend(v11, "configuration");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v27->_pendingDatabaseAccessBlocks = (NSMutableArray *)objc_msgSend(v20, "qualityOfService");

  }
  else
  {
    v27 = 0;
  }

  pendingDatabaseAccessBlocks = self->_pendingDatabaseAccessBlocks;
  if (!pendingDatabaseAccessBlocks)
  {
    v22 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v23 = self->_pendingDatabaseAccessBlocks;
    self->_pendingDatabaseAccessBlocks = v22;

    pendingDatabaseAccessBlocks = self->_pendingDatabaseAccessBlocks;
  }
  -[NSMutableArray addObject:](pendingDatabaseAccessBlocks, "addObject:", v27);
  unitTest_suspendCount = self->_unitTest_suspendCount;
  v25 = unitTest_suspendCount < 1;
  v26 = unitTest_suspendCount - 1;
  if (!v25)
    self->_unitTest_suspendCount = v26;
  -[HDQueryManager _lock_executeDatabaseAccessBlocks]((const os_unfair_lock *)self);
  os_unfair_lock_unlock(p_lock);

}

- (void)_lock_executeDatabaseAccessBlocks
{
  os_unfair_lock *v1;
  const os_unfair_lock *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id WeakRetained;
  void *v12;
  _QWORD *v13;
  _QWORD *v14;
  unint64_t v15;
  BOOL v16;
  uint64_t v17;
  BOOL v18;
  os_unfair_lock *v19;
  _QWORD *v20;
  double *v21;
  id v22;
  int v23;
  uint64_t v24;
  int v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  unint64_t v29;
  _QWORD *v30;
  id v31;
  uint64_t v32;
  void *v33;
  _QWORD *v34;
  void *v35;
  id v36;
  void *v37;
  unint64_t v38;
  id v39;
  uint64_t v40;
  id v41;
  void *v42;
  id v43;
  const os_unfair_lock *v44;
  uint64_t v45;
  void *v46;
  double *v47;
  _QWORD v48[4];
  id v49;
  _QWORD *v50;
  id v51;
  os_unfair_lock *v52;
  _QWORD v53[5];
  id v54;

  if (!a1)
    return;
  v1 = (os_unfair_lock *)a1;
  v2 = a1 + 2;
  os_unfair_lock_assert_owner(a1 + 2);
  if (*(uint64_t *)&v1[14]._os_unfair_lock_opaque > 0
    || (unint64_t)objc_msgSend(*(id *)&v1[10]._os_unfair_lock_opaque, "count") > 2)
  {
    return;
  }
  v44 = v2;
  do
  {
    os_unfair_lock_assert_owner(v2);
    v3 = objc_msgSend(*(id *)&v1[8]._os_unfair_lock_opaque, "count");
    if (!v3)
      return;
    v4 = v3;
    os_unfair_lock_assert_owner(v2);
    objc_msgSend(*(id *)&v1[6]._os_unfair_lock_opaque, "allValues");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "hk_mapToSet:", &__block_literal_global_34);
    v46 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4 < 1)
    {
LABEL_67:

      return;
    }
    v6 = 0;
    v7 = v4 + 1;
    v8 = -1;
    do
    {
      objc_msgSend(*(id *)&v1[8]._os_unfair_lock_opaque, "objectAtIndexedSubscript:", v7 - 2);
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = (void *)v9;
      if (!v9)
      {
        v12 = 0;
LABEL_11:
        objc_msgSend(*(id *)&v1[8]._os_unfair_lock_opaque, "removeObjectAtIndex:", v7 - 2);
        v8 -= v6 != 0;
        goto LABEL_52;
      }
      WeakRetained = objc_loadWeakRetained((id *)(v9 + 16));
      v12 = WeakRetained;
      if (!WeakRetained || objc_msgSend(WeakRetained, "_shouldStopProcessingQuery"))
        goto LABEL_11;
      v13 = v10;
      v14 = v13;
      v15 = v13[4] + 1;
      v16 = v15 > 0x22;
      v17 = (1 << v15) & 0x404000001;
      v18 = v16 || v17 == 0;
      if (v18 && *(uint64_t *)&v1[12]._os_unfair_lock_opaque >= 1)
      {

        goto LABEL_52;
      }

      if (!v6)
        goto LABEL_50;
      v45 = v8;
      v19 = v1;
      v20 = v6;
      v21 = v14;
      v22 = v46;
      v23 = objc_msgSend(v22, "containsObject:", v20[3]);
      v47 = v21;
      v24 = *((_QWORD *)v21 + 3);
      v6 = v20;
      v1 = v19;
      v25 = objc_msgSend(v22, "containsObject:", v24);
      if ((v23 & 1) == 0 && v25)
      {
LABEL_49:

LABEL_50:
        v30 = v14;

        v6 = v30;
        v8 = v7 - 2;
        goto LABEL_52;
      }
      if ((v23 ^ 1 | v25) == 1)
      {
        v26 = *((_QWORD *)v6 + 4);
        if (v26 <= 16)
        {
          if (v26 == -1)
          {
            v27 = 3;
          }
          else
          {
            if (v26 != 9)
              goto LABEL_33;
            v27 = 1;
          }
        }
        else
        {
          switch(v26)
          {
            case 17:
              v27 = 2;
              break;
            case 33:
              v27 = 5;
              break;
            case 25:
              v27 = 4;
              break;
            default:
LABEL_33:
              v27 = 0;
              break;
          }
        }
        v28 = v14[4];
        if (v28 <= 16)
        {
          if (v28 == -1)
          {
            v29 = 3;
            goto LABEL_46;
          }
          if (v28 == 9)
          {
            v29 = 1;
            goto LABEL_46;
          }
        }
        else
        {
          switch(v28)
          {
            case 17:
              v29 = 2;
              goto LABEL_46;
            case 33:
              v29 = 5;
              goto LABEL_46;
            case 25:
              v29 = 4;
LABEL_46:
              if (v27 < v29 || v27 <= v29 && *((double *)v6 + 5) > v47[5])
                goto LABEL_49;
              goto LABEL_51;
          }
        }
        v29 = 0;
        goto LABEL_46;
      }
LABEL_51:

      v8 = v45;
LABEL_52:

      --v7;
    }
    while (v7 > 1);
    v2 = v44;
    if (!v6)
      goto LABEL_67;
    objc_msgSend(*(id *)&v1[8]._os_unfair_lock_opaque, "removeObjectAtIndex:", v8);

    v31 = objc_loadWeakRetained((id *)v6 + 2);
    objc_msgSend(v31, "profile");
    v32 = objc_claimAutoreleasedReturnValue();
    v33 = (void *)v32;
    if (v31 && v32 && (objc_msgSend(v31, "_shouldStopProcessingQuery") & 1) == 0)
    {
      v34 = v6;
      os_unfair_lock_assert_owner(v44);
      v35 = *(void **)&v1[10]._os_unfair_lock_opaque;
      if (!v35)
      {
        v36 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v37 = *(void **)&v1[10]._os_unfair_lock_opaque;
        *(_QWORD *)&v1[10]._os_unfair_lock_opaque = v36;

        v35 = *(void **)&v1[10]._os_unfair_lock_opaque;
      }
      objc_msgSend(v35, "addObject:", v34);
      v38 = v34[4] + 1;
      if (v38 > 0x22 || ((1 << v38) & 0x404000001) == 0)
        ++*(_QWORD *)&v1[12]._os_unfair_lock_opaque;
      v39 = objc_loadWeakRetained((id *)v6 + 2);
      v40 = MEMORY[0x1E0C809B0];
      v53[0] = MEMORY[0x1E0C809B0];
      v53[1] = 3221225472;
      v53[2] = __55__HDQueryManager__lock_willExecuteDatabaseAccessBlock___block_invoke;
      v53[3] = &unk_1E6CECCD0;
      v53[4] = v1;
      v54 = v39;
      v41 = v39;
      -[HDQueryManager _performAsyncWithUnitTestDelegate:](v1, v53);

      objc_msgSend(v33, "database");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v48[0] = v40;
      v48[1] = 3221225472;
      v48[2] = __51__HDQueryManager__lock_executeDatabaseAccessBlocks__block_invoke;
      v48[3] = &unk_1E6CECCA8;
      v49 = v31;
      v50 = v34;
      v51 = v42;
      v52 = v1;
      v43 = v42;
      objc_msgSend(v43, "performAsynchronously:", v48);

    }
  }
  while ((unint64_t)objc_msgSend(*(id *)&v1[10]._os_unfair_lock_opaque, "count") < 3);
}

void __51__HDQueryManager__lock_executeDatabaseAccessBlocks__block_invoke(uint64_t a1)
{
  os_log_t *v2;
  os_signpost_id_t v3;
  double Current;
  double v5;
  double v6;
  double v7;
  uint64_t v8;
  double v9;
  NSObject *v10;
  uint64_t v11;
  os_log_t v12;
  NSObject *v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  os_log_t v19;
  NSObject *v20;
  NSObject *v21;
  uint64_t v22;
  id v23;
  unint64_t v24;
  id WeakRetained;
  id v26;
  _QWORD v27[4];
  id v28;
  _BYTE buf[24];
  double v30;
  uint64_t v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v2 = (os_log_t *)MEMORY[0x1E0CB5348];
  v3 = _HKLogSignpostIDGenerate();
  Current = CFAbsoluteTimeGetCurrent();
  objc_msgSend(*(id *)(a1 + 32), "activationTime");
  v6 = v5;
  v7 = CFAbsoluteTimeGetCurrent();
  v8 = *(_QWORD *)(a1 + 40);
  if (v8)
    v9 = *(double *)(v8 + 40);
  else
    v9 = 0.0;
  _HKInitializeLogging();
  v10 = *v2;
  if (os_log_type_enabled(*v2, OS_LOG_TYPE_INFO))
  {
    v11 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543874;
    *(_QWORD *)&buf[4] = v11;
    *(_WORD *)&buf[12] = 2048;
    *(double *)&buf[14] = Current - v6;
    *(_WORD *)&buf[22] = 2048;
    v30 = v7 - v9;
    _os_log_impl(&dword_1B7802000, v10, OS_LOG_TYPE_INFO, "%{public}@: Total activation delay: %.3fs, database access delay: %.3fs", buf, 0x20u);
  }
  _HKInitializeLogging();
  v12 = *v2;
  if (os_signpost_enabled(*v2))
  {
    v13 = v12;
    v14 = v13;
    if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
    {
      v15 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v15;
      _os_signpost_emit_with_name_impl(&dword_1B7802000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v3, "query-run", "server=%{public}@", buf, 0xCu);
    }

  }
  v16 = *(void **)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "createDatabaseTransactionContext");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = MEMORY[0x1E0C809B0];
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __51__HDQueryManager__lock_executeDatabaseAccessBlocks__block_invoke_201;
  v27[3] = &unk_1E6CECC80;
  v28 = *(id *)(a1 + 40);
  objc_msgSend(v16, "performWithTransactionContext:error:block:", v17, 0, v27);

  _HKInitializeLogging();
  v19 = *v2;
  if (os_signpost_enabled(*v2))
  {
    v20 = v19;
    v21 = v20;
    if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1B7802000, v21, OS_SIGNPOST_INTERVAL_END, v3, "query-run", ", buf, 2u);
    }

  }
  v22 = *(_QWORD *)(a1 + 56);
  v23 = *(id *)(a1 + 40);
  if (v22)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(v22 + 8));
    objc_msgSend(*(id *)(v22 + 40), "removeObject:", v23);
    if (v23)
    {
      v24 = *((_QWORD *)v23 + 4) + 1;
      if (v24 > 0x22 || ((1 << v24) & 0x404000001) == 0)
        --*(_QWORD *)(v22 + 48);
      WeakRetained = objc_loadWeakRetained((id *)v23 + 2);
    }
    else
    {
      WeakRetained = 0;
    }
    *(_QWORD *)buf = v18;
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = __49__HDQueryManager__didExecuteDatabaseAccessBlock___block_invoke;
    v30 = COERCE_DOUBLE(&unk_1E6CECCD0);
    v31 = v22;
    v32 = WeakRetained;
    v26 = WeakRetained;
    -[HDQueryManager _performAsyncWithUnitTestDelegate:]((void *)v22, buf);
    -[HDQueryManager _lock_executeDatabaseAccessBlocks](v22);
    os_unfair_lock_unlock((os_unfair_lock_t)(v22 + 8));

  }
}

uint64_t __51__HDQueryManager__lock_executeDatabaseAccessBlocks__block_invoke_201(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
    v2 = *(_QWORD *)(v1 + 8);
  else
    v2 = 0;
  (*(void (**)(void))(v2 + 16))();
  return 1;
}

uint64_t __55__HDQueryManager__lock_willExecuteDatabaseAccessBlock___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "queryManager:willRunQueryServer:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (void)_performAsyncWithUnitTestDelegate:(void *)a1
{
  id v3;
  void *v4;
  NSObject *v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  objc_msgSend(a1, "unitTest_delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(a1, "unitTest_delegateQueue");
    v5 = objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __52__HDQueryManager__performAsyncWithUnitTestDelegate___block_invoke;
    v6[3] = &unk_1E6CE8C48;
    v8 = v3;
    v7 = v4;
    dispatch_async(v5, v6);

  }
}

uint64_t __49__HDQueryManager__didExecuteDatabaseAccessBlock___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "queryManager:didRunQueryServer:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (void)_lock_unregisterQueryServer:(uint64_t)a1
{
  id v3;
  os_log_t *v4;
  NSObject *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 8));
  _HKInitializeLogging();
  v4 = (os_log_t *)MEMORY[0x1E0CB5348];
  v5 = *MEMORY[0x1E0CB5348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5348], OS_LOG_TYPE_DEBUG))
  {
    v18 = 138543362;
    v19 = v3;
    _os_log_debug_impl(&dword_1B7802000, v5, OS_LOG_TYPE_DEBUG, "Unregistering query server %{public}@", (uint8_t *)&v18, 0xCu);
  }
  objc_msgSend(v3, "queryUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 16), "objectForKeyedSubscript:", v6);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7 == v3)
  {
    objc_msgSend(v3, "client");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "process");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDQueryManager _monitoringIdentifierForProcess:](a1, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      -[HDQueryManager _lock_queryCollectionForBundleIdentifier:createIfNecessary:](a1, v11, 0);
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = (id *)v12;
      if (!v12
        || (v14 = *(void **)(v12 + 8),
            objc_msgSend(v3, "queryUUID"),
            v15 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend(v14, "removeObjectForKey:", v15),
            v15,
            !objc_msgSend(v13[1], "count")))
      {
        objc_msgSend((id)a1, "daemon");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "processStateManager");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "unregisterObserver:forBundleIdentifier:", a1, v11);

        objc_msgSend(*(id *)(a1 + 24), "removeObjectForKey:", v11);
      }

    }
    objc_msgSend(*(id *)(a1 + 16), "removeObjectForKey:", v6);

  }
  else
  {
    _HKInitializeLogging();
    v8 = *v4;
    if (os_log_type_enabled(*v4, OS_LOG_TYPE_DEFAULT))
    {
      v18 = 138543362;
      v19 = v6;
      _os_log_impl(&dword_1B7802000, v8, OS_LOG_TYPE_DEFAULT, "Ignoring attempt to unregister untracked query server for %{public}@ ", (uint8_t *)&v18, 0xCu);
    }
  }

}

- (id)_monitoringIdentifierForProcess:(uint64_t)a1
{
  id v3;
  void *v4;
  id WeakRetained;
  void *v6;
  uint64_t v7;
  void *v8;
  char v9;

  v3 = a2;
  objc_msgSend(v3, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  objc_msgSend(WeakRetained, "behavior");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "isAppleWatch") & 1) == 0
    || (objc_msgSend(v3, "applicationIdentifier"), (v7 = objc_claimAutoreleasedReturnValue()) == 0))
  {

    goto LABEL_6;
  }
  v8 = (void *)v7;
  v9 = objc_msgSend(v3, "isWidgetKitExtension");

  if ((v9 & 1) == 0)
  {
    objc_msgSend(v3, "applicationIdentifier");
    WeakRetained = v4;
    v4 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_6:

  }
  return v4;
}

- (_HDProcessQueryCollection)_lock_queryCollectionForBundleIdentifier:(int)a3 createIfNecessary:
{
  id v5;
  _HDProcessQueryCollection *v6;
  BOOL v7;
  id v8;
  uint64_t v9;
  OS_dispatch_queue *queue;
  uint64_t v11;
  NSString *processBundleIdentifier;
  NSMutableDictionary *v13;
  NSMutableDictionary *queryServersByUUID;
  HDQueryServerClientState *v15;
  HDQueryServerClientState *clientState;
  objc_super v18;

  v5 = a2;
  if (a1)
  {
    os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 8));
    objc_msgSend(*(id *)(a1 + 24), "objectForKeyedSubscript:", v5);
    v6 = (_HDProcessQueryCollection *)objc_claimAutoreleasedReturnValue();
    if (v6)
      v7 = 1;
    else
      v7 = a3 == 0;
    if (!v7)
    {
      v6 = [_HDProcessQueryCollection alloc];
      v8 = v5;
      if (v6)
      {
        v18.receiver = v6;
        v18.super_class = (Class)_HDProcessQueryCollection;
        v6 = (_HDProcessQueryCollection *)objc_msgSendSuper2(&v18, sel_init);
        if (v6)
        {
          HKCreateSerialDispatchQueue();
          v9 = objc_claimAutoreleasedReturnValue();
          queue = v6->_queue;
          v6->_queue = (OS_dispatch_queue *)v9;

          v11 = objc_msgSend(v8, "copy");
          processBundleIdentifier = v6->_processBundleIdentifier;
          v6->_processBundleIdentifier = (NSString *)v11;

          v13 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
          queryServersByUUID = v6->_queryServersByUUID;
          v6->_queryServersByUUID = v13;

          v15 = -[HDQueryServerClientState initWithApplicationState:]([HDQueryServerClientState alloc], "initWithApplicationState:", 0);
          clientState = v6->_clientState;
          v6->_clientState = v15;

        }
      }

      objc_msgSend(*(id *)(a1 + 24), "setObject:forKeyedSubscript:", v6, v8);
    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

id __51__HDQueryManager__lock_foregroundBundleIdentifiers__block_invoke(uint64_t a1, void *a2)
{
  _QWORD *v2;
  _QWORD *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v2 = a2;
  v3 = v2;
  if (v2)
    v4 = (void *)v2[5];
  else
    v4 = 0;
  v5 = v4;
  if (objc_msgSend(v5, "isForeground"))
  {
    if (v3)
      v6 = (void *)v3[4];
    else
      v6 = 0;
    v7 = v6;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)processWithBundleIdentifier:(id)a3 didTransitionFromState:(unsigned int)a4 toState:(unsigned int)a5
{
  uint64_t v5;
  os_unfair_lock_s *p_lock;
  id *v8;
  id WeakRetained;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  int v14;
  HDQueryServerClientState *v15;
  SEL v16;
  id *v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  NSObject *v22;
  id v23;
  id v24;
  id v25;
  id v26;
  _QWORD block[4];
  id *v28;
  id v29;
  id v30;
  id v31;

  v5 = *(_QWORD *)&a5;
  v26 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[HDQueryManager _lock_queryCollectionForBundleIdentifier:createIfNecessary:]((uint64_t)self, v26, 0);
  v8 = (id *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_daemon);
    objc_msgSend(WeakRetained, "behavior");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isAppleWatch");
    if ((_DWORD)v5 == 4 && (v11 & 1) != 0)
    {
      -[HDQueryManager daemon](self, "daemon");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "processStateManager");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "isApplicationInExtendedRuntimeSessionForBundleIdentifier:", v26);

      v5 = v14 ? 8 : 4;
    }
    else
    {

    }
    if (objc_msgSend(v8[5], "applicationState") != (_DWORD)v5)
    {
      v15 = -[HDQueryServerClientState initWithApplicationState:]([HDQueryServerClientState alloc], "initWithApplicationState:", v5);
      objc_setProperty_nonatomic_copy(v8, v16, v15, 40);

      v17 = v8;
      if (self)
      {
        os_unfair_lock_assert_owner(&self->_lock);
        v18 = v17[4];
        -[_HDProcessQueryCollection queryServers](v17);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = (void *)objc_msgSend(v19, "copy");

        v21 = v8[5];
        v22 = v17[3];
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __67__HDQueryManager__lock_handleClientStateChangeWithQueryCollection___block_invoke;
        block[3] = &unk_1E6CECCA8;
        v28 = v17;
        v29 = v18;
        v30 = v20;
        v31 = v21;
        v23 = v21;
        v24 = v20;
        v25 = v18;
        dispatch_async(v22, block);

      }
    }
  }
  os_unfair_lock_unlock(p_lock);

}

void __67__HDQueryManager__lock_handleClientStateChangeWithQueryCollection___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  NSObject *v5;
  dispatch_source_t v6;
  void *v7;
  NSObject *v8;
  dispatch_time_t v9;
  NSObject *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _QWORD v29[4];
  id v30;
  id v31;
  _QWORD handler[4];
  _QWORD *v33;
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v2 = MEMORY[0x1E0C809B0];
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __67__HDQueryManager__lock_handleClientStateChangeWithQueryCollection___block_invoke_2;
  v29[3] = &unk_1E6CE8080;
  v3 = *(_QWORD *)(a1 + 32);
  v30 = *(id *)(a1 + 40);
  v31 = *(id *)(a1 + 48);
  v4 = v29;
  if (v3)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(v3 + 24));
    -[_HDProcessQueryCollection queue_cancelStateChangeTimer](v3);
    dispatch_get_global_queue(21, 0);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, v5);
    v7 = *(void **)(v3 + 16);
    *(_QWORD *)(v3 + 16) = v6;

    v8 = *(NSObject **)(v3 + 16);
    v9 = dispatch_time(0, 10000000000);
    dispatch_source_set_timer(v8, v9, 0xFFFFFFFFFFFFFFFFLL, 0);
    v10 = *(NSObject **)(v3 + 16);
    handler[0] = v2;
    handler[1] = 3221225472;
    handler[2] = __77___HDProcessQueryCollection_queue_startStateChangeTimerWithInterval_handler___block_invoke;
    handler[3] = &unk_1E6CE7DE0;
    v33 = v4;
    dispatch_source_set_event_handler(v10, handler);
    dispatch_resume(*(dispatch_object_t *)(v3 + 16));

  }
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v11 = *(id *)(a1 + 48);
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v25, v35, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v26;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v26 != v14)
          objc_enumerationMutation(v11);
        objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * v15++), "clientStateWillChange:", *(_QWORD *)(a1 + 56));
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v25, v35, 16);
    }
    while (v13);
  }

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v16 = *(id *)(a1 + 48);
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v21, v34, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v22;
    do
    {
      v20 = 0;
      do
      {
        if (*(_QWORD *)v22 != v19)
          objc_enumerationMutation(v16);
        objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * v20++), "clientStateDidChange:", *(_QWORD *)(a1 + 56), (_QWORD)v21);
      }
      while (v18 != v20);
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v21, v34, 16);
    }
    while (v18);
  }

  -[_HDProcessQueryCollection queue_cancelStateChangeTimer](*(_QWORD *)(a1 + 32));
}

void __67__HDQueryManager__lock_handleClientStateChangeWithQueryCollection___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  NSObject *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  _HKInitializeLogging();
  v2 = (void *)*MEMORY[0x1E0CB5348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5348], OS_LOG_TYPE_FAULT))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v3 = *(void **)(a1 + 40);
    v5 = v2;
    v6 = 138412546;
    v7 = v4;
    v8 = 2048;
    v9 = objc_msgSend(v3, "count");
    _os_log_fault_impl(&dword_1B7802000, v5, OS_LOG_TYPE_FAULT, "Failed to finish client state transition in time for process \"%@\" (%lu queries)", (uint8_t *)&v6, 0x16u);

  }
}

- (id)diagnosticDescription
{
  os_unfair_lock_s *p_lock;
  void *v4;
  void *v5;
  id v6;
  NSMutableDictionary *queryCollectionsByProcessBundleIdentifier;
  uint64_t v8;
  id v9;
  NSMutableDictionary *v10;
  void *v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  double *v16;
  id WeakRetained;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  unint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  id v41;
  void *v42;
  id v43;
  uint64_t v45;
  id v46;
  id v47;
  void *v48;
  void *v49;
  id obj;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  _QWORD v55[4];
  id v56;
  id v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  _QWORD v62[4];
  id v63;
  _QWORD v64[4];
  id v65;
  _BYTE v66[128];
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = (void *)-[NSMutableArray copy](self->_executingDatabaseAccessBlocks, "copy");
  v5 = (void *)-[NSMutableArray copy](self->_pendingDatabaseAccessBlocks, "copy");
  v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  queryCollectionsByProcessBundleIdentifier = self->_queryCollectionsByProcessBundleIdentifier;
  v8 = MEMORY[0x1E0C809B0];
  v64[0] = MEMORY[0x1E0C809B0];
  v64[1] = 3221225472;
  v64[2] = __39__HDQueryManager_diagnosticDescription__block_invoke;
  v64[3] = &unk_1E6CECD38;
  v47 = v6;
  v65 = v47;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](queryCollectionsByProcessBundleIdentifier, "enumerateKeysAndObjectsUsingBlock:", v64);
  v9 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v10 = self->_queryCollectionsByProcessBundleIdentifier;
  v62[0] = v8;
  v62[1] = 3221225472;
  v62[2] = __39__HDQueryManager_diagnosticDescription__block_invoke_2;
  v62[3] = &unk_1E6CECD38;
  v46 = v9;
  v63 = v46;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](v10, "enumerateKeysAndObjectsUsingBlock:", v62);
  os_unfair_lock_unlock(p_lock);
  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("%@ (%ld active queries)"), objc_opt_class(), -[NSMutableDictionary count](self->_queryServersByUUID, "count"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "appendFormat:", CFSTR("\nQuery blocks pending:%lu"), objc_msgSend(v5, "count"));
  v48 = v5;
  v49 = v4;
  v51 = v11;
  if (objc_msgSend(v5, "count"))
  {
    v12 = objc_msgSend(v5, "count");
    v13 = 5;
    if (v12 < 5)
      v13 = v12;
    if (v13)
    {
      v14 = 0;
      do
      {
        objc_msgSend(v5, "objectAtIndexedSubscript:", v14);
        v15 = objc_claimAutoreleasedReturnValue();
        v16 = (double *)v15;
        if (v15 && (WeakRetained = objc_loadWeakRetained((id *)(v15 + 16))) != 0)
        {
          v18 = WeakRetained;
          objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", v16[5]);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v53 = objc_opt_class();
          objc_msgSend(v18, "queryUUID");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "UUIDString");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "client");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "process");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "bundleIdentifier");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          HKDiagnosticStringFromDate();
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v51, "appendFormat:", CFSTR("\n%@ %@ %@ created %@"), v53, v21, v24, v25);

          v11 = v51;
          v5 = v48;
          v4 = v49;

        }
        else
        {
          objc_msgSend(v11, "appendString:", CFSTR("\n<invalidated query>"));
        }

        ++v14;
        v26 = objc_msgSend(v5, "count");
        v27 = 5;
        if (v26 < 5)
          v27 = v26;
      }
      while (v14 < v27);
    }
    if ((unint64_t)objc_msgSend(v5, "count") > 5)
      objc_msgSend(v11, "appendFormat:", CFSTR("\n%lu additional blocks not shown"), objc_msgSend(v5, "count") - 5);
  }
  if (objc_msgSend(v4, "count"))
  {
    objc_msgSend(v11, "appendFormat:", CFSTR("\nQuery blocks executing:"));
    v60 = 0u;
    v61 = 0u;
    v58 = 0u;
    v59 = 0u;
    obj = v4;
    v54 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v58, v66, 16);
    if (v54)
    {
      v52 = *(_QWORD *)v59;
      do
      {
        v28 = 0;
        do
        {
          if (*(_QWORD *)v59 != v52)
            objc_enumerationMutation(obj);
          v29 = *(_QWORD *)(*((_QWORD *)&v58 + 1) + 8 * v28);
          if (v29 && (v30 = objc_loadWeakRetained((id *)(v29 + 16))) != 0)
          {
            v31 = v30;
            objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", *(double *)(v29 + 40));
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            v33 = objc_opt_class();
            objc_msgSend(v31, "queryUUID");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v34, "UUIDString");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "client");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v36, "process");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v37, "bundleIdentifier");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            HKDiagnosticStringFromDate();
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            v45 = v33;
            v11 = v51;
            objc_msgSend(v51, "appendFormat:", CFSTR("\n%@ %@ %@ created %@"), v45, v35, v38, v39);

          }
          else
          {
            objc_msgSend(v11, "appendString:", CFSTR("\n<invalidated query>"));
          }
          ++v28;
        }
        while (v54 != v28);
        v54 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v58, v66, 16);
      }
      while (v54);
    }

    v5 = v48;
    v4 = v49;
  }
  else
  {
    objc_msgSend(v11, "appendFormat:", CFSTR("\nQuery blocks executing:%lu"), objc_msgSend(v4, "count"));
  }
  v55[0] = MEMORY[0x1E0C809B0];
  v55[1] = 3221225472;
  v55[2] = __39__HDQueryManager_diagnosticDescription__block_invoke_3;
  v55[3] = &unk_1E6CECDA0;
  v40 = v11;
  v56 = v40;
  v57 = v46;
  v41 = v46;
  objc_msgSend(v47, "enumerateKeysAndObjectsUsingBlock:", v55);
  v42 = v57;
  v43 = v40;

  return v43;
}

void __39__HDQueryManager_diagnosticDescription__block_invoke(uint64_t a1, void *a2, id *a3)
{
  id v5;
  id v6;

  v5 = a2;
  -[_HDProcessQueryCollection queryServers](a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v6, v5);

}

uint64_t __39__HDQueryManager_diagnosticDescription__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
    a3 = *(_QWORD *)(a3 + 40);
  return objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", a3, a2);
}

void __39__HDQueryManager_diagnosticDescription__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  const __CFString *v13;
  int v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR("\n\nProcess: %@"), v5);
  objc_msgSend(v6, "hk_mapToSet:", &__block_literal_global_238_0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count"))
  {
    v8 = *(void **)(a1 + 32);
    objc_msgSend(v7, "allObjects");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "componentsJoinedByString:", CFSTR(", "));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "appendFormat:", CFSTR(" (%@)"), v10);

  }
  objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v5;
  if (objc_msgSend(v11, "isSuspended"))
  {
    v12 = *(void **)(a1 + 32);
    v13 = CFSTR(" - suspended");
  }
  else
  {
    v14 = objc_msgSend(v11, "isForeground");
    v12 = *(void **)(a1 + 32);
    if (v14)
      v13 = CFSTR(" - foreground");
    else
      v13 = CFSTR(" - background");
  }
  objc_msgSend(v12, "appendFormat:", v13);
  objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR(" (%lu queries)"), objc_msgSend(v6, "count"));
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v15 = v6;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v24;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v24 != v18)
          objc_enumerationMutation(v15);
        v20 = *(void **)(a1 + 32);
        objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * v19), "diagnosticDescription");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "appendFormat:", CFSTR("\n%@"), v21, v22, (_QWORD)v23);

        ++v19;
      }
      while (v17 != v19);
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v17);
  }

}

id __39__HDQueryManager_diagnosticDescription__block_invoke_4(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(a2, "client");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "process");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "numberWithInt:", objc_msgSend(v4, "processIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)logDiagnostics
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  os_log_t *v7;
  uint64_t i;
  uint64_t v9;
  NSObject *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint8_t buf[4];
  uint64_t v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[HDQueryManager diagnosticDescription](self, "diagnosticDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "componentsSeparatedByString:", CFSTR("\n"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v17, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    v7 = (os_log_t *)MEMORY[0x1E0CB5348];
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        v9 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i);
        _HKInitializeLogging();
        v10 = *v7;
        if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v16 = v9;
          _os_log_impl(&dword_1B7802000, v10, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v17, 16);
    }
    while (v5);
  }

}

- (void)unitTest_suspendWithCount:(unint64_t)a3
{
  os_unfair_lock_s *p_lock;
  void *v7;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_unitTest_suspendCount)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDQueryManager.m"), 625, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_unitTest_suspendCount == 0"));

  }
  self->_unitTest_suspendCount = a3;
  os_unfair_lock_unlock(p_lock);
}

uint64_t __52__HDQueryManager__performAsyncWithUnitTestDelegate___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (OS_dispatch_queue)unitTest_delegateQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 72, 1);
}

- (void)setUnitTest_delegateQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (HDQueryManagerUnitTestDelegate)unitTest_delegate
{
  return (HDQueryManagerUnitTestDelegate *)objc_loadWeakRetained((id *)&self->_unitTest_delegate);
}

- (void)setUnitTest_delegate:(id)a3
{
  objc_storeWeak((id *)&self->_unitTest_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_unitTest_delegate);
  objc_storeStrong((id *)&self->_unitTest_delegateQueue, 0);
  objc_destroyWeak((id *)&self->_daemon);
  objc_storeStrong((id *)&self->_executingDatabaseAccessBlocks, 0);
  objc_storeStrong((id *)&self->_pendingDatabaseAccessBlocks, 0);
  objc_storeStrong((id *)&self->_queryCollectionsByProcessBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_queryServersByUUID, 0);
}

@end
