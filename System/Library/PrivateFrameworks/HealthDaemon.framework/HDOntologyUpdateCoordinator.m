@implementation HDOntologyUpdateCoordinator

- (HDOntologyUpdateCoordinator)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The -%@ method is not available on %@"), v5, objc_opt_class());

  return 0;
}

- (HDOntologyUpdateCoordinator)initWithDaemon:(id)a3
{
  id v4;
  HDOntologyUpdateCoordinator *v5;
  HDOntologyUpdateCoordinator *v6;
  void *v7;
  objc_class *v8;
  void *v9;
  uint64_t v10;
  NSString *threadLocalKeyIsRunningTransaction;
  NSOperationQueue *v12;
  void *v13;
  NSOperationQueue *updateOperationQueue;
  HDOntologyFeatureCoordinator *v15;
  HDOntologyFeatureCoordinator *featureCoordinator;
  HDOntologyManifestUpdater *v17;
  HDOntologyManifestUpdater *manifestUpdater;
  HDOntologyShardDownloader *v19;
  HDOntologyShardDownloader *downloader;
  HDOntologyShardImporter *v21;
  HDOntologyShardImporter *importer;
  HDOntologyShardRegistry *v23;
  HDOntologyShardRegistry *shardRegistry;
  HDOntologyShardPruner *v25;
  HDOntologyShardPruner *pruner;
  id WeakRetained;
  void *v28;
  objc_super v30;

  v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)HDOntologyUpdateCoordinator;
  v5 = -[HDOntologyUpdateCoordinator init](&v30, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_daemon, v4);
    v6->_lock._os_unfair_lock_opaque = 0;
    v6->_contentionReductionLock._os_unfair_lock_opaque = 0;
    v7 = (void *)MEMORY[0x1E0CB3940];
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithFormat:", CFSTR("%@.%p.isRunningTransaction"), v9, v6);
    v10 = objc_claimAutoreleasedReturnValue();
    threadLocalKeyIsRunningTransaction = v6->_threadLocalKeyIsRunningTransaction;
    v6->_threadLocalKeyIsRunningTransaction = (NSString *)v10;

    v12 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E0CB3828]);
    HKCreateSerialDispatchQueue();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSOperationQueue setUnderlyingQueue:](v12, "setUnderlyingQueue:", v13);

    -[NSOperationQueue setMaxConcurrentOperationCount:](v12, "setMaxConcurrentOperationCount:", 1);
    -[NSOperationQueue setQualityOfService:](v12, "setQualityOfService:", -1);
    updateOperationQueue = v6->_updateOperationQueue;
    v6->_updateOperationQueue = v12;

    v15 = -[HDOntologyFeatureCoordinator initWithOntologyUpdateCoordinator:]([HDOntologyFeatureCoordinator alloc], "initWithOntologyUpdateCoordinator:", v6);
    featureCoordinator = v6->_featureCoordinator;
    v6->_featureCoordinator = v15;

    v17 = -[HDOntologyManifestUpdater initWithOntologyUpdateCoordinator:]([HDOntologyManifestUpdater alloc], "initWithOntologyUpdateCoordinator:", v6);
    manifestUpdater = v6->_manifestUpdater;
    v6->_manifestUpdater = v17;

    v19 = -[HDOntologyShardDownloader initWithOntologyUpdateCoordinator:]([HDOntologyShardDownloader alloc], "initWithOntologyUpdateCoordinator:", v6);
    downloader = v6->_downloader;
    v6->_downloader = v19;

    v21 = -[HDOntologyShardImporter initWithOntologyUpdateCoordinator:]([HDOntologyShardImporter alloc], "initWithOntologyUpdateCoordinator:", v6);
    importer = v6->_importer;
    v6->_importer = v21;

    v23 = -[HDOntologyShardRegistry initWithOntologyUpdateCoordinator:]([HDOntologyShardRegistry alloc], "initWithOntologyUpdateCoordinator:", v6);
    shardRegistry = v6->_shardRegistry;
    v6->_shardRegistry = v23;

    v25 = -[HDOntologyShardPruner initWithOntologyUpdateCoordinator:]([HDOntologyShardPruner alloc], "initWithOntologyUpdateCoordinator:", v6);
    pruner = v6->_pruner;
    v6->_pruner = v25;

    WeakRetained = objc_loadWeakRetained((id *)&v6->_daemon);
    objc_msgSend(WeakRetained, "primaryProfile");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "registerProfileReadyObserver:queue:", v6, 0);

  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  -[HDOntologyUpdateCoordinator _invalidatePreparedAssertions]((uint64_t)self);
  v3.receiver = self;
  v3.super_class = (Class)HDOntologyUpdateCoordinator;
  -[HDOntologyUpdateCoordinator dealloc](&v3, sel_dealloc);
}

- (void)_invalidatePreparedAssertions
{
  os_unfair_lock_s *v2;
  void *v3;
  void *v4;

  if (a1)
  {
    v2 = (os_unfair_lock_s *)(a1 + 48);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    objc_msgSend(*(id *)(a1 + 32), "invalidate");
    v3 = *(void **)(a1 + 32);
    *(_QWORD *)(a1 + 32) = 0;

    objc_msgSend(*(id *)(a1 + 40), "invalidate");
    v4 = *(void **)(a1 + 40);
    *(_QWORD *)(a1 + 40) = 0;

    os_unfair_lock_unlock(v2);
  }
}

- (HDPrimaryProfile)profile
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_daemon);
  objc_msgSend(WeakRetained, "primaryProfile");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (HDPrimaryProfile *)v3;
}

- (BOOL)performOntologyTransactionForWrite:(BOOL)a3 databaseTransaction:(id)a4 error:(id *)a5 transactionHandler:(id)a6
{
  _BOOL8 v8;
  id v10;
  id v11;
  HDDaemon **p_daemon;
  id WeakRetained;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  _BOOL8 v18;
  void *v19;
  id v20;
  HDDaemon **v21;
  char v22;
  _BOOL4 v24;
  void *v25;
  void *v26;
  HDMutableDatabaseTransactionContext *v27;
  HDAssertion *v28;
  id v29;
  _QWORD v30[5];
  id v31;
  id v32;
  BOOL v33;

  v8 = a3;
  v10 = a4;
  v11 = a6;
  if (v10)
  {
    p_daemon = &self->_daemon;
    WeakRetained = objc_loadWeakRetained((id *)p_daemon);
    objc_msgSend(WeakRetained, "ontologyBackingStore");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_loadWeakRetained((id *)p_daemon);
    objc_msgSend(v15, "primaryProfile");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v14;
    v18 = v8;
    v19 = v16;
    v20 = v10;
LABEL_5:
    v22 = objc_msgSend(v17, "performOntologyTransactionForWrite:profile:databaseTransaction:error:transactionHandler:", v18, v19, v20, a5, v11);

    goto LABEL_6;
  }
  if ((-[HDOntologyUpdateCoordinator _setIsRunningTransaction:]((uint64_t)self, 1) & 1) != 0)
  {
    v21 = &self->_daemon;
    WeakRetained = objc_loadWeakRetained((id *)v21);
    objc_msgSend(WeakRetained, "ontologyBackingStore");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_loadWeakRetained((id *)v21);
    objc_msgSend(v15, "primaryProfile");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v14;
    v18 = v8;
    v19 = v16;
    v20 = 0;
    goto LABEL_5;
  }
  if (self)
    v24 = v8;
  else
    v24 = 0;
  if (v24)
    os_unfair_lock_lock(&self->_contentionReductionLock);
  v29 = objc_loadWeakRetained((id *)&self->_daemon);
  objc_msgSend(v29, "primaryProfile");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "database");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (self)
  {
    v27 = objc_alloc_init(HDMutableDatabaseTransactionContext);
    -[HDMutableDatabaseTransactionContext setCacheScope:](v27, "setCacheScope:", 1);
    os_unfair_lock_lock(&self->_lock);
    v28 = self->_lock_preparedDatabaseAccessibilityAssertion;
    os_unfair_lock_unlock(&self->_lock);
    if (v28)
      -[HDMutableDatabaseTransactionContext addAccessibilityAssertion:](v27, "addAccessibilityAssertion:", v28);

  }
  else
  {
    v27 = 0;
  }
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __111__HDOntologyUpdateCoordinator_performOntologyTransactionForWrite_databaseTransaction_error_transactionHandler___block_invoke;
  v30[3] = &unk_1E6D0C5A0;
  v33 = v8;
  v30[4] = self;
  v31 = 0;
  v32 = v11;
  v22 = objc_msgSend(v26, "performWithTransactionContext:error:block:", v27, a5, v30);

  -[HDOntologyUpdateCoordinator _setIsRunningTransaction:]((uint64_t)self, 0);
  if (v24)
    os_unfair_lock_unlock(&self->_contentionReductionLock);

LABEL_6:
  return v22;
}

- (uint64_t)_setIsRunningTransaction:(uint64_t)a1
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;

  if (!a1)
    return 0;
  objc_msgSend(MEMORY[0x1E0CB3978], "currentThread");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "threadDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 56));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "BOOLValue");

  if (a2)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, *(_QWORD *)(a1 + 56));

  }
  else
  {
    objc_msgSend(v5, "removeObjectForKey:", *(_QWORD *)(a1 + 56));
  }

  return v7;
}

uint64_t __111__HDOntologyUpdateCoordinator_performOntologyTransactionForWrite_databaseTransaction_error_transactionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  uint64_t v9;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 80));
  objc_msgSend(WeakRetained, "ontologyBackingStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(unsigned __int8 *)(a1 + 56);
  v7 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 80));
  objc_msgSend(v7, "primaryProfile");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v5, "performOntologyTransactionForWrite:profile:databaseTransaction:error:transactionHandler:", v6, v8, *(_QWORD *)(a1 + 40), a2, *(_QWORD *)(a1 + 48));

  return v9;
}

- (void)lockUpdateLock
{
  os_unfair_lock_lock(&self->_contentionReductionLock);
}

- (void)unlockUpdateLock
{
  os_unfair_lock_unlock(&self->_contentionReductionLock);
}

- (id)ontologyServerURL
{
  return +[HDOntologyUpdateCoordinator _ontologyServerURL]();
}

+ (id)_ontologyServerURL
{
  void *v0;
  void *v1;
  void *v2;
  id v3;
  void *v4;
  void *v5;

  objc_opt_self();
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringForKey:", *MEMORY[0x1E0CB56E0]);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (v1)
  {
    v3 = v1;
  }
  else
  {
    HKDefaultOntologyServerBaseURL();
    v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  v4 = v3;

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initWithString:", v4);
  return v5;
}

- (void)setOntologyServerURL:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  id v6;

  v3 = (void *)MEMORY[0x1E0C99EA0];
  v4 = a3;
  objc_msgSend(v3, "standardUserDefaults");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "absoluteString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setObject:forKey:", v5, *MEMORY[0x1E0CB56E0]);
}

- (void)updateShardRegistryWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v4 = a3;
  -[HDOntologyUpdateCoordinator _sessionForOntologyUpdateReason:](self, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDOntologyUpdateCoordinator manifestUpdater](self, "manifestUpdater");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDOntologyUpdateCoordinator _manifestURL](self);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __65__HDOntologyUpdateCoordinator_updateShardRegistryWithCompletion___block_invoke;
  v10[3] = &unk_1E6CED3F8;
  v11 = v5;
  v12 = v4;
  v8 = v4;
  v9 = v5;
  objc_msgSend(v6, "updateManifestWithURL:session:completion:", v7, v9, v10);

}

- (id)_sessionForOntologyUpdateReason:(id)a1
{
  id v2;
  void *v4;
  void *v5;

  v2 = a1;
  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0C92CA0], "ephemeralSessionConfiguration");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if ((a2 & 0xFFFFFFFFFFFFFFFBLL) == 0)
    {
      objc_msgSend(v4, "setWaitsForConnectivity:", 1);
      objc_msgSend(v5, "setTimeoutIntervalForResource:", 300.0);
    }
    objc_msgSend(v5, "set_sourceApplicationBundleIdentifier:", *MEMORY[0x1E0CB7630]);
    objc_msgSend(MEMORY[0x1E0C92C98], "sessionWithConfiguration:delegate:delegateQueue:", v5, v2, 0);
    v2 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v2;
}

- (id)_manifestURL
{
  void *v1;
  void *v2;

  if (a1)
  {
    objc_msgSend(a1, "ontologyServerURL");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    +[HDOntologyManifestUpdater manifestURLWithBaseURL:](HDOntologyManifestUpdater, "manifestURLWithBaseURL:", v1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v2 = 0;
  }
  return v2;
}

void __65__HDOntologyUpdateCoordinator_updateShardRegistryWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  id v5;

  v4 = *(void **)(a1 + 32);
  v5 = a3;
  objc_msgSend(v4, "invalidateAndCancel");
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)downloadRequiredShardsWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v4 = a3;
  -[HDOntologyUpdateCoordinator _sessionForOntologyUpdateReason:](self, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDOntologyUpdateCoordinator downloader](self, "downloader");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __68__HDOntologyUpdateCoordinator_downloadRequiredShardsWithCompletion___block_invoke;
  v9[3] = &unk_1E6CED3F8;
  v10 = v5;
  v11 = v4;
  v7 = v4;
  v8 = v5;
  objc_msgSend(v6, "downloadRequiredShardFilesWithSession:completion:", v8, v9);

}

void __68__HDOntologyUpdateCoordinator_downloadRequiredShardsWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  id v5;

  v4 = *(void **)(a1 + 32);
  v5 = a3;
  objc_msgSend(v4, "invalidateAndCancel");
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)updateOntologyWithReason:(int64_t)a3 completion:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  _QWORD v17[5];
  id v18;
  id v19;
  int64_t v20;
  uint8_t buf[4];
  HDOntologyUpdateCoordinator *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "hk_shortRepresentation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x1E0CB3940];
  HKStringFromOntologyUpdateReason();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringWithFormat:", CFSTR("%@ %@"), v10, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  _HKInitializeLogging();
  HKLogHealthOntology();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v22 = self;
    v23 = 2114;
    v24 = v11;
    _os_log_impl(&dword_1B7802000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: Enqueue ontology update for %{public}@", buf, 0x16u);
  }

  v13 = objc_alloc(MEMORY[0x1E0CB62C8]);
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __67__HDOntologyUpdateCoordinator_updateOntologyWithReason_completion___block_invoke;
  v17[3] = &unk_1E6D0C5C8;
  v17[4] = self;
  v18 = v8;
  v19 = v6;
  v20 = a3;
  v14 = v6;
  v15 = v8;
  v16 = (void *)objc_msgSend(v13, "initWithName:operationBlock:", v11, v17);
  -[NSOperationQueue addOperation:](self->_updateOperationQueue, "addOperation:", v16);

}

void __67__HDOntologyUpdateCoordinator_updateOntologyWithReason_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  id v8;
  _QWORD *v9;
  CFAbsoluteTime Current;
  NSObject *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  char v23;
  id v24;
  NSObject *v25;
  _BOOL4 v26;
  NSObject *v27;
  void *v28;
  id v29;
  id v30;
  _BYTE *v31;
  void *v32;
  _BYTE *v33;
  id v34;
  _QWORD *v35;
  void *v36;
  void *v37;
  _QWORD *v38;
  id v39;
  id v40;
  _QWORD v41[4];
  id v42;
  id v43;
  _QWORD v44[4];
  id v45;
  id v46;
  id v47[5];
  id v48;
  id v49;
  _BYTE buf[24];
  void *v51;
  uint64_t v52;
  id v53;
  id v54;
  _QWORD *v55;
  uint64_t v56;
  CFAbsoluteTime v57;
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v5 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(a1 + 40);
  v41[0] = MEMORY[0x1E0C809B0];
  v41[1] = 3221225472;
  v41[2] = __67__HDOntologyUpdateCoordinator_updateOntologyWithReason_completion___block_invoke_2;
  v41[3] = &unk_1E6CF28A8;
  v6 = *(_QWORD *)(a1 + 56);
  v42 = *(id *)(a1 + 48);
  v43 = v3;
  v7 = v3;
  v8 = v4;
  v9 = v41;
  if (v5)
  {
    Current = CFAbsoluteTimeGetCurrent();
    _HKInitializeLogging();
    HKLogHealthOntology();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      HKStringFromOntologyUpdateReason();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      *(_QWORD *)&buf[4] = v5;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v12;
      *(_WORD *)&buf[22] = 2114;
      v51 = v8;
      _os_log_impl(&dword_1B7802000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: Start updating ontology for %{public}@ %{public}@", buf, 0x20u);

    }
    os_unfair_lock_lock((os_unfair_lock_t)(v5 + 48));
    v13 = *(id *)(v5 + 32);
    v14 = *(void **)(v5 + 32);
    *(_QWORD *)(v5 + 32) = 0;

    v15 = *(id *)(v5 + 40);
    v16 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = 0;

    os_unfair_lock_unlock((os_unfair_lock_t)(v5 + 48));
    v17 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    if (!v13)
    {
      -[HDOntologyUpdateCoordinator _takeAccessibilityAssertion](v5);
      v13 = (id)objc_claimAutoreleasedReturnValue();
    }
    v40 = v7;
    objc_msgSend(v17, "hk_addNonNilObject:", v13);
    if (!v15)
    {
      -[HDOntologyUpdateCoordinator _takeRegistryAssertion]((void *)v5);
      v15 = (id)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v17, "hk_addNonNilObject:", v15);

    v18 = objc_alloc(MEMORY[0x1E0CB3940]);
    HKStringFromOntologyUpdateReason();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_msgSend(v18, "initWithFormat:", CFSTR("updateStartDate %@"), v19);

    -[HDOntologyUpdateCoordinator _keyValueDomain](v5);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v47[0] = 0;
    v23 = objc_msgSend(v21, "setDate:forKey:error:", v22, v20, v47);
    v24 = v47[0];

    if ((v23 & 1) == 0)
    {
      _HKInitializeLogging();
      HKLogHealthOntology();
      v25 = objc_claimAutoreleasedReturnValue();
      v26 = os_log_type_enabled(v25, OS_LOG_TYPE_INFO);

      if (v26)
      {
        HKLogHealthOntology();
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138543874;
          *(_QWORD *)&buf[4] = v5;
          *(_WORD *)&buf[12] = 2114;
          *(_QWORD *)&buf[14] = v20;
          *(_WORD *)&buf[22] = 2114;
          v51 = v24;
          _os_log_impl(&dword_1B7802000, v27, OS_LOG_TYPE_INFO, "%{public}@: Unable to persist %{public}@: %{public}@", buf, 0x20u);
        }

      }
    }

    v28 = (void *)MEMORY[0x1E0C809B0];
    *(_QWORD *)buf = MEMORY[0x1E0C809B0];
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = __77__HDOntologyUpdateCoordinator__updateOntologyWithReason_updateID_completion___block_invoke;
    v51 = &unk_1E6D0C640;
    v52 = v5;
    v56 = v6;
    v29 = v8;
    v57 = Current;
    v53 = v29;
    v54 = v17;
    v55 = v9;
    v30 = v17;
    v31 = buf;
    -[HDOntologyUpdateCoordinator _sessionForOntologyUpdateReason:]((id)v5, v6);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v44[0] = v28;
    v44[1] = 3221225472;
    v44[2] = __71__HDOntologyUpdateCoordinator__runOntologyUpdateWithReason_completion___block_invoke;
    v44[3] = &unk_1E6CED3F8;
    v45 = v32;
    v33 = v31;
    v46 = v33;
    v34 = v32;
    v35 = v44;
    objc_msgSend((id)v5, "manifestUpdater");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDOntologyUpdateCoordinator _manifestURL]((void *)v5);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v47[0] = v28;
    v47[1] = (id)3221225472;
    v47[2] = __79__HDOntologyUpdateCoordinator__runOntologyUpdateWithReason_session_completion___block_invoke;
    v47[3] = &unk_1E6D0C668;
    v38 = v35;
    v49 = v38;
    v47[4] = (id)v5;
    v39 = v34;
    v48 = v39;
    objc_msgSend(v36, "updateManifestWithURL:session:completion:", v37, v39, v47);

    v7 = v40;
  }

}

uint64_t __67__HDOntologyUpdateCoordinator_updateOntologyWithReason_completion___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)triggerGatedUpdateWithMaximumDelay:(double)a3 completion:(id)a4
{
  id v6;
  uint64_t v7;
  id v8;
  uint64_t *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  HDXPCGatedActivity *gatedActivity;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, char, void *);
  void *v18;
  HDOntologyUpdateCoordinator *v19;
  id v20;
  _BYTE buf[24];
  void *v22;
  HDOntologyUpdateCoordinator *v23;
  uint64_t *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = MEMORY[0x1E0C809B0];
  v15 = MEMORY[0x1E0C809B0];
  v16 = 3221225472;
  v17 = __77__HDOntologyUpdateCoordinator_triggerGatedUpdateWithMaximumDelay_completion___block_invoke;
  v18 = &unk_1E6CED3F8;
  v19 = self;
  v20 = v6;
  v8 = v6;
  v9 = &v15;
  if (self)
  {
    v10 = _Block_copy(self->_unitTesting_willTriggerGatedActivity);
    v11 = v10;
    if (v10)
      (*((void (**)(void *, HDOntologyUpdateCoordinator *, HDXPCGatedActivity *, double))v10 + 2))(v10, self, self->_gatedActivity, a3);

    if ((-[HDOntologyUpdateCoordinator _permittedToAutomaticallyUpdateOntology]((uint64_t)self) & 1) != 0)
    {
      _HKInitializeLogging();
      HKLogHealthOntology();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = self;
        *(_WORD *)&buf[12] = 2048;
        *(double *)&buf[14] = a3;
        _os_log_impl(&dword_1B7802000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: Trigger gated update with maximum delay %0.3fs", buf, 0x16u);
      }

      *(_QWORD *)buf = v7;
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = __78__HDOntologyUpdateCoordinator__triggerGatedUpdateWithMaximumDelay_completion___block_invoke;
      v22 = &unk_1E6D0C690;
      v23 = self;
      v24 = v9;
      v13 = _Block_copy(buf);
      gatedActivity = self->_gatedActivity;
      if (a3 <= 0.0)
        -[HDXPCGatedActivity runUngatedWithCompletion:](gatedActivity, "runUngatedWithCompletion:", v13, v15, v16);
      else
        -[HDXPCGatedActivity requestRunWithMaximumDelay:completion:](gatedActivity, "requestRunWithMaximumDelay:completion:", v13, a3, v15, v16);

    }
    else
    {
      v17((uint64_t)v9, 1, 0);
    }
  }

}

void __77__HDOntologyUpdateCoordinator_triggerGatedUpdateWithMaximumDelay_completion___block_invoke(uint64_t a1, char a2, void *a3)
{
  uint64_t v5;
  NSObject *v6;
  void *v7;
  id v8;
  __int128 buf;
  void (*v10)(uint64_t, uint64_t, void *);
  void *v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  if ((a2 & 1) == 0)
  {
    v5 = *(_QWORD *)(a1 + 32);
    if (v5)
    {
      _HKInitializeLogging();
      HKLogHealthOntology();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf) = 138543362;
        *(_QWORD *)((char *)&buf + 4) = v5;
        _os_log_impl(&dword_1B7802000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: Request fallback update", (uint8_t *)&buf, 0xCu);
      }

      v7 = *(void **)(v5 + 24);
      *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
      *((_QWORD *)&buf + 1) = 3221225472;
      v10 = __54__HDOntologyUpdateCoordinator__scheduleFallbackUpdate__block_invoke;
      v11 = &unk_1E6D0C6B8;
      v12 = v5;
      objc_msgSend(v7, "requestRunWithMaximumDelay:completion:", &buf, 10.0);
    }
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (BOOL)updateOntologyWithShardIdentifier:(id)a3 schemaType:(id)a4 schemaVersion:(int64_t)a5 localShardURL:(id)a6 shardVersion:(int64_t)a7 error:(id *)a8
{
  id v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  uint64_t v20;
  id v21;
  HDOntologyUpdateCoordinator *v22;
  int64_t v23;
  uint64_t v24;
  uint64_t v25;
  int64_t v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  HDOntologyUpdateCoordinator *v31;
  BOOL v32;
  void *v34;
  id *v35;
  _QWORD v36[5];
  id v37;

  v15 = a3;
  v16 = a4;
  v17 = a6;
  if ((objc_msgSend(v17, "isFileURL") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDOntologyUpdateCoordinator.m"), 226, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("localShardURL.isFileURL"));

  }
  objc_msgSend(v17, "hk_fileSizeWithError:", a8);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    v19 = objc_alloc(MEMORY[0x1E0CB69B0]);
    v20 = *MEMORY[0x1E0CB4AC8];
    v35 = a8;
    v21 = v16;
    v22 = self;
    v23 = a7;
    v24 = objc_msgSend(v18, "integerValue");
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v25 = objc_claimAutoreleasedReturnValue();
    v26 = a5;
    v27 = (void *)v25;
    v28 = (void *)objc_msgSend(v19, "initWithIdentifier:schemaType:schemaVersion:availableVersion:availableRegion:availableLocale:availableURL:availableChecksum:availableSize:date:", v15, v21, v26, v23, v20, 0, v17, 0, v24, v25);
    v29 = (void *)objc_msgSend(v28, "copyWithDesiredState:", 3);

    v36[0] = MEMORY[0x1E0C809B0];
    v36[1] = 3221225472;
    v36[2] = __123__HDOntologyUpdateCoordinator_updateOntologyWithShardIdentifier_schemaType_schemaVersion_localShardURL_shardVersion_error___block_invoke;
    v36[3] = &unk_1E6CE9D30;
    v36[4] = v22;
    v37 = v29;
    v30 = v29;
    v31 = v22;
    v16 = v21;
    v32 = -[HDOntologyUpdateCoordinator performOntologyTransactionForWrite:databaseTransaction:error:transactionHandler:](v31, "performOntologyTransactionForWrite:databaseTransaction:error:transactionHandler:", 1, 0, v35, v36);

  }
  else
  {
    v32 = a8 != 0;
  }

  return v32;
}

uint64_t __123__HDOntologyUpdateCoordinator_updateOntologyWithShardIdentifier_schemaType_schemaVersion_localShardURL_shardVersion_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  void *v19;
  void *v20;
  _QWORD v22[5];
  id v23;
  id v24;
  id v25;

  v5 = *(void **)(a1 + 32);
  v6 = *(id *)(a1 + 40);
  v7 = a2;
  if (v5
    && +[HDOntologyShardRegistry insertEntry:transaction:error:](HDOntologyShardRegistry, "insertEntry:transaction:error:", v6, v7, a3)&& (objc_msgSend(v5, "shardRegistry"), v8 = (void *)objc_claimAutoreleasedReturnValue(), objc_msgSend(v6, "availableURL"), v9 = (void *)objc_claimAutoreleasedReturnValue(), v10 = objc_msgSend(v8, "copyToStagingDirectoryFileWithLocalURL:entry:error:", v9, v6, a3), v9, v8, v10))
  {
    v11 = (void *)objc_msgSend(v6, "copyWithAvailableState:", 2);

    if (+[HDOntologyShardRegistry insertEntry:transaction:error:](HDOntologyShardRegistry, "insertEntry:transaction:error:", v11, v7, a3)&& (objc_msgSend(v5, "importer"), v12 = (void *)objc_claimAutoreleasedReturnValue(), v13 = objc_msgSend(v12, "importStagedShardFilesWithError:", a3), v12, v13))
    {
      objc_msgSend(v5, "shardRegistry");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "identifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "schemaType");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 0;
      v17 = objc_msgSend(v14, "entryWithIdentifier:schemaType:schemaVersion:entryOut:transaction:error:", v15, v16, objc_msgSend(v11, "schemaVersion"), &v25, v7, a3);
      v18 = v25;

      if ((_DWORD)v17)
      {
        objc_msgSend(v7, "graphDatabase");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "underlyingDatabase");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v22[0] = MEMORY[0x1E0C809B0];
        v22[1] = 3221225472;
        v22[2] = __84__HDOntologyUpdateCoordinator__updateOntologyWithLocalShardEntry_transaction_error___block_invoke;
        v22[3] = &unk_1E6CE7FB8;
        v22[4] = v5;
        v23 = v18;
        v24 = v11;
        objc_msgSend(v20, "onCommit:orRollback:", v22, 0);

      }
    }
    else
    {
      v17 = 0;
    }
  }
  else
  {
    v17 = 0;
    v11 = v6;
  }

  return v17;
}

- (void)updateOntologyWithShardIdentifier:(id)a3 schemaType:(id)a4 schemaVersion:(int64_t)a5 shardURL:(id)a6 shardVersion:(int64_t)a7 shouldPruneOldShard:(BOOL)a8 reason:(int64_t)a9 completion:(id)a10
{
  _BOOL4 v10;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  int64_t v21;
  id v22;
  id v23;
  id v24;
  id v25;
  _BOOL4 v26;
  uint64_t v27;
  id v28;
  id v29;
  id v30;
  id v31;
  int64_t v32;
  id v33;
  id v34;
  objc_class *v35;
  id v36;
  id v37;
  id v38;
  id v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void (**v46)(id, uint64_t, _QWORD);
  void (**v47)(id, uint64_t, _QWORD);
  int64_t v48;
  void (**v49)(id, uint64_t, _QWORD);
  id v50;
  id v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  void *v55;
  HDOntologyUpdateCoordinator *v56;
  id v57;
  id v58;
  void **v59;
  int64_t v60;
  void *v61;
  void **v62;
  uint64_t v63;
  uint64_t (*v64)(uint64_t, uint64_t);
  void (*v65)(uint64_t);
  id v66;
  uint64_t v67;

  v10 = a8;
  v67 = *MEMORY[0x1E0C80C00];
  v16 = a3;
  v17 = a4;
  v18 = a6;
  v49 = (void (**)(id, uint64_t, _QWORD))a10;
  v51 = 0;
  v19 = v16;
  v20 = v17;
  v50 = v18;
  if (self)
  {
    v48 = a5;
    if (v10)
    {
      v21 = a7;
      v22 = v19;
      v23 = v20;
      v52 = MEMORY[0x1E0C809B0];
      v53 = 3221225472;
      v54 = __91__HDOntologyUpdateCoordinator__pruneOldShardWithIdentifier_schemaType_schemaVersion_error___block_invoke;
      v55 = &unk_1E6CFD208;
      v56 = self;
      v24 = v22;
      v57 = v24;
      v25 = v23;
      v58 = v25;
      v59 = (void **)a5;
      v26 = -[HDOntologyUpdateCoordinator performOntologyTransactionForWrite:databaseTransaction:error:transactionHandler:](self, "performOntologyTransactionForWrite:databaseTransaction:error:transactionHandler:", 1, 0, &v51, &v52);
      if (v26)
        -[HDOntologyUpdateCoordinator _runOntologyPruner](self);

      v27 = v26;
    }
    else
    {
      v28 = v19;
      v29 = v20;
      v61 = 0;
      v62 = &v61;
      v63 = 0x3032000000;
      v64 = __Block_byref_object_copy__175;
      v65 = __Block_byref_object_dispose__175;
      v66 = 0;
      v52 = MEMORY[0x1E0C809B0];
      v53 = 3221225472;
      v54 = __128__HDOntologyUpdateCoordinator__shouldProceedToDownloadAndImportShardWithIdentifier_schemaType_schemaVersion_shardVersion_error___block_invoke;
      v55 = &unk_1E6D0C6E0;
      v56 = self;
      v30 = v28;
      v57 = v30;
      v31 = v29;
      v32 = a5;
      v33 = v31;
      v59 = &v61;
      v60 = v32;
      v58 = v31;
      if (-[HDOntologyUpdateCoordinator performOntologyTransactionForWrite:databaseTransaction:error:transactionHandler:](self, "performOntologyTransactionForWrite:databaseTransaction:error:transactionHandler:", 0, 0, &v51, &v52))
      {
        if (objc_msgSend(v62[5], "availableVersion") >= a7 && objc_msgSend(v62[5], "availableState") == 3)
        {
          v21 = a7;
          v27 = 2;
        }
        else
        {
          v21 = a7;
          v27 = 1;
        }
      }
      else
      {
        v21 = a7;
        v27 = 0;
      }

      _Block_object_dispose(&v61, 8);
    }

    v34 = v51;
    if (v27 == 2)
    {
      v49[2](v49, 1, 0);
      goto LABEL_18;
    }
    if (v27)
    {
      v47 = v49;
      v35 = (objc_class *)MEMORY[0x1E0CB69B0];
      v36 = v50;
      v37 = v20;
      v38 = v19;
      v39 = [v35 alloc];
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = (void *)objc_msgSend(v39, "initWithIdentifier:schemaType:schemaVersion:availableVersion:availableRegion:availableLocale:availableURL:availableChecksum:availableSize:date:", v38, v37, v48, v21, *MEMORY[0x1E0CB4AC8], 0, v36, 0, *MEMORY[0x1E0CB5728], v40);

      v42 = (void *)objc_msgSend(v41, "copyWithDesiredState:", 3);
      -[HDOntologyUpdateCoordinator _sessionForOntologyUpdateReason:](self, a9);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      -[HDOntologyUpdateCoordinator downloader](self, "downloader");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v61 = v42;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v61, 1);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = MEMORY[0x1E0C809B0];
      v53 = 3221225472;
      v54 = __148__HDOntologyUpdateCoordinator__downloadStageAndImportEntryWithIdentifier_schemaType_schemaVersion_shardVersion_shardURL_fileSize_reason_completion___block_invoke;
      v55 = &unk_1E6CECC08;
      v46 = v47;
      v56 = self;
      v57 = v46;
      objc_msgSend(v44, "downloadRequiredShardFilesWithSession:requiredEntries:completion:", v43, v45, &v52);

      goto LABEL_18;
    }
  }
  else
  {

    v34 = 0;
  }
  ((void (**)(id, uint64_t, id))v49)[2](v49, 0, v34);
LABEL_18:

}

- (void)periodicActivity:(id)a3 configureXPCActivityCriteria:(id)a4
{
  const char *v4;
  const char *v5;
  void *v6;
  xpc_object_t xdict;

  v4 = (const char *)*MEMORY[0x1E0C80738];
  xdict = a4;
  xpc_dictionary_set_BOOL(xdict, v4, 1);
  xpc_dictionary_set_string(xdict, (const char *)*MEMORY[0x1E0C80878], (const char *)*MEMORY[0x1E0C80888]);
  xpc_dictionary_set_BOOL(xdict, (const char *)*MEMORY[0x1E0C808D0], 1);
  v5 = (const char *)*MEMORY[0x1E0C80840];
  +[HDOntologyUpdateCoordinator _endpointDictionary]();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  xpc_dictionary_set_value(xdict, v5, v6);

  xpc_dictionary_set_int64(xdict, (const char *)*MEMORY[0x1E0C80818], 52428800);
  xpc_dictionary_set_BOOL(xdict, (const char *)*MEMORY[0x1E0C808A0], 1);
  xpc_dictionary_set_BOOL(xdict, (const char *)*MEMORY[0x1E0C808B0], 1);

}

+ (id)_endpointDictionary
{
  void *v0;
  id v1;
  const char *v2;
  id v3;
  nw_endpoint_t host;
  void *v5;

  objc_opt_self();
  +[HDOntologyUpdateCoordinator _ontologyServerURL]();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "host");
  v1 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v2 = (const char *)objc_msgSend(v1, "UTF8String");
  objc_msgSend(v0, "scheme");
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  host = nw_endpoint_create_host(v2, (const char *)objc_msgSend(v3, "UTF8String"));

  v5 = (void *)MEMORY[0x1BCCACA70](host);
  return v5;
}

- (void)performPeriodicActivity:(id)a3 completion:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  void *v13;
  id WeakRetained;
  void *v15;
  _QWORD v16[5];
  id v17;
  id v18;
  uint8_t buf[4];
  HDOntologyUpdateCoordinator *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  if ((-[HDOntologyUpdateCoordinator _permittedToAutomaticallyUpdateOntology]((uint64_t)self) & 1) != 0)
  {
    +[HKDaemonTransaction transactionWithOwner:activityName:](HDDaemonTransaction, "transactionWithOwner:activityName:", self, CFSTR("com.apple.healthd.ontology.update"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (self)
    {
      -[HDOntologyUpdateCoordinator _takeAccessibilityAssertion]((uint64_t)self);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[HDOntologyUpdateCoordinator _takeRegistryAssertion](self);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v7;
      v10 = v8;
      os_unfair_lock_lock(&self->_lock);
      if (v9)
      {
        -[HDAssertion invalidate](self->_lock_preparedDatabaseAccessibilityAssertion, "invalidate");
        objc_storeStrong((id *)&self->_lock_preparedDatabaseAccessibilityAssertion, v7);
      }
      if (v10)
      {
        -[HDAssertion invalidate](self->_lock_preparedRegistryAssertion, "invalidate");
        objc_storeStrong((id *)&self->_lock_preparedRegistryAssertion, v8);
      }
      os_unfair_lock_unlock(&self->_lock);

    }
    _HKInitializeLogging();
    HKLogHealthOntology();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v20 = self;
      _os_log_impl(&dword_1B7802000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: maintenance operation enqueued", buf, 0xCu);
    }

    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __66__HDOntologyUpdateCoordinator_performPeriodicActivity_completion___block_invoke;
    v16[3] = &unk_1E6D0C618;
    v16[4] = self;
    v17 = v6;
    v18 = v5;
    v12 = v6;
    +[HDMaintenanceOperation maintenanceOperationWithName:asynchronousBlock:](HDMaintenanceOperation, "maintenanceOperationWithName:asynchronousBlock:", CFSTR("com.apple.healthd.ontology.update"), v16);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    WeakRetained = objc_loadWeakRetained((id *)&self->_daemon);
    objc_msgSend(WeakRetained, "maintenanceWorkCoordinator");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "enqueueMaintenanceOperation:", v13);

  }
  else
  {
    (*((void (**)(id, _QWORD, _QWORD, double))v5 + 2))(v5, 0, 0, 0.0);
  }

}

- (uint64_t)_permittedToAutomaticallyUpdateOntology
{
  uint64_t v1;
  id *v2;
  id WeakRetained;
  void *v4;
  void *v5;
  char v6;
  id v7;
  void *v8;
  char v9;
  id v10;
  void *v11;
  int v12;
  NSObject *v13;
  const char *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  int v19;
  int v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v1 = result;
    v2 = (id *)(result + 80);
    WeakRetained = objc_loadWeakRetained((id *)(result + 80));
    objc_msgSend(WeakRetained, "behavior");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "features");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "shardedOntology");

    if ((v6 & 1) != 0)
    {
      v7 = objc_loadWeakRetained(v2);
      objc_msgSend(v7, "behavior");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "supportsOntologyDatabaseUpdates");

      if ((v9 & 1) != 0)
      {
        v10 = objc_loadWeakRetained(v2);
        objc_msgSend(v10, "behavior");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "healthAppNotInstalled");

        if (!v12)
        {
          v15 = objc_loadWeakRetained(v2);
          objc_msgSend(v15, "behavior");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v16, "isRunningStoreDemoMode"))
          {

          }
          else
          {
            v17 = objc_loadWeakRetained(v2);
            objc_msgSend(v17, "behavior");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = objc_msgSend(v18, "runningInStoreDemoModeF201");

            if (!v19)
              return 1;
          }
          _HKInitializeLogging();
          HKLogHealthOntology();
          v13 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
            goto LABEL_17;
          v20 = 138543362;
          v21 = v1;
          v14 = "%{public}@: Unable to run ontology update, because device in store demo mode";
          goto LABEL_16;
        }
        _HKInitializeLogging();
        HKLogHealthOntology();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          v20 = 138543362;
          v21 = v1;
          v14 = "%{public}@: Unable to run ontology update, because Health app is not installed";
LABEL_16:
          _os_log_impl(&dword_1B7802000, v13, OS_LOG_TYPE_DEFAULT, v14, (uint8_t *)&v20, 0xCu);
        }
      }
      else
      {
        _HKInitializeLogging();
        HKLogHealthOntology();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          v20 = 138543362;
          v21 = v1;
          v14 = "%{public}@: Unable to run ontology update, because behavior is not enabled";
          goto LABEL_16;
        }
      }
    }
    else
    {
      _HKInitializeLogging();
      HKLogHealthOntology();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        v20 = 138543362;
        v21 = v1;
        v14 = "%{public}@: Unable to run ontology update, because feature is not enabled";
        goto LABEL_16;
      }
    }
LABEL_17:

    return 0;
  }
  return result;
}

void __66__HDOntologyUpdateCoordinator_performPeriodicActivity_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  id v10;
  id v11;
  uint8_t buf[4];
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _HKInitializeLogging();
  HKLogHealthOntology();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    v13 = v5;
    _os_log_impl(&dword_1B7802000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: maintenance operation running", buf, 0xCu);
  }

  v6 = *(void **)(a1 + 32);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __66__HDOntologyUpdateCoordinator_performPeriodicActivity_completion___block_invoke_223;
  v8[3] = &unk_1E6D0C5F0;
  v10 = v3;
  v8[4] = v6;
  v11 = *(id *)(a1 + 48);
  v9 = *(id *)(a1 + 40);
  v7 = v3;
  objc_msgSend(v6, "updateOntologyWithReason:completion:", 0, v8);

}

void __66__HDOntologyUpdateCoordinator_performPeriodicActivity_completion___block_invoke_223(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  -[HDOntologyUpdateCoordinator _invalidatePreparedAssertions](*(_QWORD *)(a1 + 32));
  _HKInitializeLogging();
  HKLogHealthOntology();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = *(_QWORD *)(a1 + 32);
    v8 = 138543362;
    v9 = v7;
    _os_log_impl(&dword_1B7802000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: maintenance operation finished", (uint8_t *)&v8, 0xCu);
  }

  if ((a2 & 1) == 0)
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "shouldDefer");
  (*(void (**)(double))(*(_QWORD *)(a1 + 56) + 16))(0.0);
  objc_msgSend(*(id *)(a1 + 40), "invalidate");

}

- (void)profileDidBecomeReady:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  HDPeriodicActivity *v7;
  id v8;
  void *v9;
  double v10;
  void *v11;
  HDPeriodicActivity *v12;
  HDPeriodicActivity *periodicActivity;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  HDXPCGatedActivity *v18;
  HDXPCGatedActivity *gatedActivity;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  HDXPCGatedActivity *v24;
  HDXPCGatedActivity *fallbackActivity;
  _QWORD v26[4];
  id v27;
  _QWORD v28[4];
  id v29;
  id location;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_daemon);
  objc_msgSend(WeakRetained, "cacheDeleteCoordinator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "registerCacheDeleteProvider:", self->_pruner);

  v7 = [HDPeriodicActivity alloc];
  v8 = objc_loadWeakRetained((id *)&self->_daemon);
  objc_msgSend(v8, "primaryProfile");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (double)(uint64_t)*MEMORY[0x1E0C807F0];
  HKLogHealthOntology();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[HDPeriodicActivity initWithProfile:name:interval:delegate:loggingCategory:](v7, "initWithProfile:name:interval:delegate:loggingCategory:", v9, CFSTR("com.apple.healthd.ontology.update"), self, v11, v10);
  periodicActivity = self->_periodicActivity;
  self->_periodicActivity = v12;

  objc_initWeak(&location, self);
  v14 = objc_alloc(MEMORY[0x1E0D298F8]);
  +[HDOntologyUpdateCoordinator _gatedActivityCriteria]();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  HKLogHealthOntology();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = MEMORY[0x1E0C809B0];
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __53__HDOntologyUpdateCoordinator_profileDidBecomeReady___block_invoke;
  v28[3] = &unk_1E6CEFA88;
  objc_copyWeak(&v29, &location);
  v18 = (HDXPCGatedActivity *)objc_msgSend(v14, "initWithName:criteria:loggingCategory:handler:", CFSTR("com.apple.healthd.ontology.gated"), v15, v16, v28);
  gatedActivity = self->_gatedActivity;
  self->_gatedActivity = v18;

  -[HDXPCGatedActivity setRescheduleWhileInProgress:](self->_gatedActivity, "setRescheduleWhileInProgress:", 1);
  v20 = objc_alloc(MEMORY[0x1E0D298F8]);
  objc_opt_self();
  +[HDOntologyUpdateCoordinator _gatedActivityCriteria]();
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDOntologyUpdateCoordinator _endpointDictionary]();
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  xpc_dictionary_set_value(v21, (const char *)*MEMORY[0x1E0C80840], v22);

  HKLogHealthOntology();
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v17;
  v26[1] = 3221225472;
  v26[2] = __53__HDOntologyUpdateCoordinator_profileDidBecomeReady___block_invoke_2;
  v26[3] = &unk_1E6CEFA88;
  objc_copyWeak(&v27, &location);
  v24 = (HDXPCGatedActivity *)objc_msgSend(v20, "initWithName:criteria:loggingCategory:handler:", CFSTR("com.apple.healthd.ontology.fallback"), v21, v23, v26);
  fallbackActivity = self->_fallbackActivity;
  self->_fallbackActivity = v24;

  -[HDXPCGatedActivity setRescheduleWhileInProgress:](self->_fallbackActivity, "setRescheduleWhileInProgress:", 1);
  objc_destroyWeak(&v27);
  objc_destroyWeak(&v29);
  objc_destroyWeak(&location);

}

+ (id)_gatedActivityCriteria
{
  xpc_object_t empty;

  objc_opt_self();
  empty = xpc_dictionary_create_empty();
  xpc_dictionary_set_BOOL(empty, (const char *)*MEMORY[0x1E0C80738], 1);
  xpc_dictionary_set_string(empty, (const char *)*MEMORY[0x1E0C80878], (const char *)*MEMORY[0x1E0C80888]);
  xpc_dictionary_set_BOOL(empty, (const char *)*MEMORY[0x1E0C808D0], 1);
  xpc_dictionary_set_BOOL(empty, (const char *)*MEMORY[0x1E0C808A8], 1);
  return empty;
}

void __53__HDOntologyUpdateCoordinator_profileDidBecomeReady___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id *v5;
  id v6;
  id v7;
  id WeakRetained;

  v5 = (id *)(a1 + 32);
  v6 = a4;
  v7 = a2;
  WeakRetained = objc_loadWeakRetained(v5);
  -[HDOntologyUpdateCoordinator _triggerOntologyUpdateForGatedActivity:ontologyUpdateReason:completion:](WeakRetained, v7, 3, v6);

}

- (void)_triggerOntologyUpdateForGatedActivity:(uint64_t)a3 ontologyUpdateReason:(void *)a4 completion:
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;

  v7 = a2;
  v8 = a4;
  if (a1)
  {
    objc_msgSend(v7, "name");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[HKDaemonTransaction transactionWithOwner:activityName:](HDDaemonTransaction, "transactionWithOwner:activityName:", a1, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __102__HDOntologyUpdateCoordinator__triggerOntologyUpdateForGatedActivity_ontologyUpdateReason_completion___block_invoke;
    v12[3] = &unk_1E6CF1D98;
    v13 = v7;
    v14 = v10;
    v15 = v8;
    v11 = v10;
    objc_msgSend(a1, "updateOntologyWithReason:completion:", a3, v12);

  }
}

void __53__HDOntologyUpdateCoordinator_profileDidBecomeReady___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id *v5;
  id v6;
  id v7;
  id WeakRetained;

  v5 = (id *)(a1 + 32);
  v6 = a4;
  v7 = a2;
  WeakRetained = objc_loadWeakRetained(v5);
  -[HDOntologyUpdateCoordinator _triggerOntologyUpdateForGatedActivity:ontologyUpdateReason:completion:](WeakRetained, v7, 4, v6);

}

- (void)URLSession:(id)a3 taskIsWaitingForConnectivity:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  HDOntologyUpdateCoordinator *v9;
  __int16 v10;
  id v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  _HKInitializeLogging();
  HKLogHealthOntology();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v5, "currentRequest");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543874;
    v9 = self;
    v10 = 2114;
    v11 = v5;
    v12 = 2114;
    v13 = v7;
    _os_log_impl(&dword_1B7802000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: waiting for connectivity for task %{public}@ %{public}@", (uint8_t *)&v8, 0x20u);

  }
}

- (HDKeyValueDomain)_keyValueDomain
{
  HDKeyValueDomain *v2;
  id WeakRetained;
  void *v4;
  HDKeyValueDomain *v5;

  v2 = [HDKeyValueDomain alloc];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
  objc_msgSend(WeakRetained, "primaryProfile");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[HDKeyValueDomain initWithCategory:domainName:profile:](v2, "initWithCategory:domainName:profile:", 0, CFSTR("HDOntologyUpdateCoordinator"), v4);

  return v5;
}

- (id)_takeAccessibilityAssertion
{
  id WeakRetained;
  void *v3;
  void *v4;
  objc_class *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  id v11;
  uint8_t buf[4];
  uint64_t v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
  objc_msgSend(WeakRetained, "primaryProfile");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "database");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  objc_msgSend(v4, "takeAccessibilityAssertionWithOwnerIdentifier:timeout:error:", v6, &v11, 300.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v11;

  if (!v7)
  {
    _HKInitializeLogging();
    HKLogHealthOntology();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v13 = a1;
      v14 = 2114;
      v15 = v8;
      _os_log_error_impl(&dword_1B7802000, v9, OS_LOG_TYPE_ERROR, "%{public}@ Unable to prepare accessibilityAssertion: %{public}@", buf, 0x16u);
    }

  }
  return v7;
}

- (id)_takeRegistryAssertion
{
  void *v2;
  objc_class *v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  id v9;
  uint8_t buf[4];
  void *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "shardRegistry");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  objc_msgSend(v2, "takeFileHandleAssertionForOwnerIdentifier:error:", v4, &v9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v9;

  if (!v5)
  {
    _HKInitializeLogging();
    HKLogHealthOntology();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v11 = a1;
      v12 = 2114;
      v13 = v6;
      _os_log_error_impl(&dword_1B7802000, v7, OS_LOG_TYPE_ERROR, "%{public}@: Unable to take registry file handle assertion: %{public}@", buf, 0x16u);
    }

  }
  return v5;
}

void __77__HDOntologyUpdateCoordinator__updateOntologyWithReason_updateID_completion___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  __CFString *v6;
  NSObject *v7;
  uint64_t v8;
  const __CFString *v9;
  void *v10;
  uint64_t v11;
  CFAbsoluteTime v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  void *v18;
  const __CFString *v19;
  void *v20;
  void *v21;
  void *v22;
  __CFString *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  char v29;
  id v30;
  NSObject *v31;
  _BOOL4 v32;
  NSObject *v33;
  uint64_t v34;
  id v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  __CFString *v41;
  id v42;
  void *v43;
  uint8_t buf[4];
  uint64_t v45;
  __int16 v46;
  const __CFString *v47;
  __int16 v48;
  id v49;
  __int16 v50;
  uint64_t v51;
  __int16 v52;
  CFAbsoluteTime v53;
  __int16 v54;
  __CFString *v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((a2 & 1) != 0)
  {
    v6 = &stru_1E6D11BB8;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(", Error: %@"), v5);
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  _HKInitializeLogging();
  HKLogHealthOntology();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = *(_QWORD *)(a1 + 32);
    if (a2)
      v9 = CFSTR("Success");
    else
      v9 = CFSTR("Failure");
    HKStringFromOntologyUpdateReason();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(a1 + 40);
    v12 = CFAbsoluteTimeGetCurrent() - *(double *)(a1 + 72);
    *(_DWORD *)buf = 138544642;
    v45 = v8;
    v46 = 2114;
    v47 = v9;
    v48 = 2114;
    v49 = v10;
    v50 = 2114;
    v51 = v11;
    v52 = 2048;
    v53 = v12;
    v54 = 2114;
    v55 = v6;
    _os_log_impl(&dword_1B7802000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@ updating ontology for %{public}@ %{public}@ in %0.4fs%{public}@", buf, 0x3Eu);

  }
  v13 = *(_QWORD *)(a1 + 32);
  v14 = v5;
  if (v13)
  {
    v41 = v6;
    v15 = objc_alloc(MEMORY[0x1E0C99E08]);
    v16 = objc_alloc(MEMORY[0x1E0CB3940]);
    HKStringFromOntologyUpdateReason();
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = (void *)v17;
    v19 = CFSTR("FAILURE");
    if (a2)
      v19 = CFSTR("SUCCESS");
    v20 = (void *)objc_msgSend(v16, "initWithFormat:", CFSTR("updateEndDate %@ %@"), v17, v19);
    v43 = v20;
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)&v56 = v21;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v56, &v43, 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (__CFString *)objc_msgSend(v15, "initWithDictionary:", v22);

    if ((a2 & 1) == 0)
    {
      objc_msgSend(v14, "description");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_alloc(MEMORY[0x1E0CB3940]);
      HKStringFromOntologyUpdateReason();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = (void *)objc_msgSend(v25, "initWithFormat:", CFSTR("updateError %@"), v26);
      -[__CFString setObject:forKeyedSubscript:](v23, "setObject:forKeyedSubscript:", v24, v27);

    }
    -[HDOntologyUpdateCoordinator _keyValueDomain](v13);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = 0;
    v29 = objc_msgSend(v28, "setValuesWithDictionary:error:", v23, &v42);
    v30 = v42;
    v6 = v41;
    if ((v29 & 1) == 0)
    {
      _HKInitializeLogging();
      HKLogHealthOntology();
      v31 = objc_claimAutoreleasedReturnValue();
      v32 = os_log_type_enabled(v31, OS_LOG_TYPE_INFO);

      if (v32)
      {
        HKLogHealthOntology();
        v33 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138543874;
          v45 = v13;
          v46 = 2114;
          v47 = v23;
          v48 = 2114;
          v49 = v30;
          _os_log_impl(&dword_1B7802000, v33, OS_LOG_TYPE_INFO, "%{public}@: Unable to persist %{public}@: %{public}@", buf, 0x20u);
        }

      }
    }

  }
  v34 = *(_QWORD *)(a1 + 32);
  v35 = *(id *)(a1 + 48);
  v36 = v35;
  if (v34)
  {
    v58 = 0u;
    v59 = 0u;
    v56 = 0u;
    v57 = 0u;
    v37 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v56, buf, 16);
    if (v37)
    {
      v38 = v37;
      v39 = *(_QWORD *)v57;
      do
      {
        v40 = 0;
        do
        {
          if (*(_QWORD *)v57 != v39)
            objc_enumerationMutation(v36);
          objc_msgSend(*(id *)(*((_QWORD *)&v56 + 1) + 8 * v40++), "invalidate");
        }
        while (v38 != v40);
        v38 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v56, buf, 16);
      }
      while (v38);
    }
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

void __71__HDOntologyUpdateCoordinator__runOntologyUpdateWithReason_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  id v5;

  v4 = *(void **)(a1 + 32);
  v5 = a3;
  objc_msgSend(v4, "invalidateAndCancel");
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __79__HDOntologyUpdateCoordinator__runOntologyUpdateWithReason_session_completion___block_invoke(uint64_t a1, char a2)
{
  void *v3;
  uint64_t v4;
  id v5;
  _QWORD v6[5];
  id v7;

  if ((a2 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "downloader");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __79__HDOntologyUpdateCoordinator__runOntologyUpdateWithReason_session_completion___block_invoke_2;
    v6[3] = &unk_1E6CECC08;
    v4 = *(_QWORD *)(a1 + 40);
    v5 = *(id *)(a1 + 48);
    v6[4] = *(_QWORD *)(a1 + 32);
    v7 = v5;
    objc_msgSend(v3, "downloadRequiredShardFilesWithSession:completion:", v4, v6);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
}

void __79__HDOntologyUpdateCoordinator__runOntologyUpdateWithReason_session_completion___block_invoke_2(uint64_t a1, char a2)
{
  void *v3;
  id v4;
  id v5;

  if ((a2 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "importer");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 0;
    objc_msgSend(v3, "importStagedShardFilesWithError:", &v5);
    v4 = v5;

    -[HDOntologyUpdateCoordinator _runOntologyPruner](*(void **)(a1 + 32));
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
}

- (void)_runOntologyPruner
{
  void *v2;
  char v3;
  id v4;
  NSObject *v5;
  id v6;
  uint8_t buf[4];
  void *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    objc_msgSend(a1, "pruner");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 0;
    v3 = objc_msgSend(v2, "pruneOntologyWithOptions:error:", 0, &v6);
    v4 = v6;

    if ((v3 & 1) == 0)
    {
      _HKInitializeLogging();
      HKLogHealthOntology();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        v8 = a1;
        v9 = 2114;
        v10 = v4;
        _os_log_error_impl(&dword_1B7802000, v5, OS_LOG_TYPE_ERROR, "%{public}@: Error pruning ontology: %{public}@", buf, 0x16u);
      }

    }
  }
}

void __102__HDOntologyUpdateCoordinator__triggerOntologyUpdateForGatedActivity_ontologyUpdateReason_completion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;

  v5 = a3;
  if ((a2 & 1) == 0)
    objc_msgSend(*(id *)(a1 + 32), "shouldDefer");
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  objc_msgSend(*(id *)(a1 + 40), "invalidate");

}

void __78__HDOntologyUpdateCoordinator__triggerGatedUpdateWithMaximumDelay_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  uint8_t buf[4];
  uint64_t v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = v5;
  if (a2 == 2 && !v5)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:format:", 708, CFSTR("Activity \"%@\" Deferred"), CFSTR("com.apple.healthd.ontology.gated"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  _HKInitializeLogging();
  HKLogHealthOntology();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = *(_QWORD *)(a1 + 32);
    HDStringFromGatedActivityResult();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v11 = v8;
    v12 = 2114;
    v13 = v9;
    v14 = 2114;
    v15 = v6;
    _os_log_impl(&dword_1B7802000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: Gated update result: %{public}@, error: %{public}@", buf, 0x20u);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __54__HDOntologyUpdateCoordinator__scheduleFallbackUpdate__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _HKInitializeLogging();
  HKLogHealthOntology();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = *(_QWORD *)(a1 + 32);
    HDStringFromGatedActivityResult();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543874;
    v9 = v6;
    v10 = 2114;
    v11 = v7;
    v12 = 2114;
    v13 = v4;
    _os_log_impl(&dword_1B7802000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: Fallback update result: %{public}@, error: %{public}@", (uint8_t *)&v8, 0x20u);

  }
}

void __84__HDOntologyUpdateCoordinator__updateOntologyWithLocalShardEntry_transaction_error___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  _HKInitializeLogging();
  HKLogHealthOntology();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 48), "availableURL");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138543874;
    v7 = v3;
    v8 = 2114;
    v9 = v4;
    v10 = 2114;
    v11 = v5;
    _os_log_impl(&dword_1B7802000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@: Imported local shard %{public}@ from %{public}@", (uint8_t *)&v6, 0x20u);

  }
}

uint64_t __91__HDOntologyUpdateCoordinator__pruneOldShardWithIdentifier_schemaType_schemaVersion_error___block_invoke(_QWORD *a1, void *a2, uint64_t a3)
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  id v16;

  v4 = (void *)a1[4];
  v5 = (void *)a1[5];
  v7 = (void *)a1[6];
  v6 = a1[7];
  v8 = a2;
  if (v4)
  {
    v9 = v7;
    v10 = v5;
    objc_msgSend(v4, "shardRegistry");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0;
    v12 = objc_msgSend(v11, "entryWithIdentifier:schemaType:schemaVersion:entryOut:transaction:error:", v10, v9, v6, &v16, v8, a3);

    v13 = v16;
    if ((_DWORD)v12 && v13)
    {
      v14 = objc_msgSend(v13, "copyWithDesiredState:", 0);

      +[HDOntologyShardRegistry insertEntry:transaction:error:](HDOntologyShardRegistry, "insertEntry:transaction:error:", v14, v8, a3);
      v13 = (id)v14;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

uint64_t __128__HDOntologyUpdateCoordinator__shouldProceedToDownloadAndImportShardWithIdentifier_schemaType_schemaVersion_shardVersion_error___block_invoke(_QWORD *a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id obj;

  v5 = (void *)a1[4];
  v6 = a2;
  objc_msgSend(v5, "shardRegistry");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = a1[5];
  v9 = a1[6];
  v10 = a1[8];
  v11 = *(_QWORD *)(a1[7] + 8);
  obj = *(id *)(v11 + 40);
  v12 = objc_msgSend(v7, "entryWithIdentifier:schemaType:schemaVersion:entryOut:transaction:error:", v8, v9, v10, &obj, v6, a3);

  objc_storeStrong((id *)(v11 + 40), obj);
  return v12;
}

void __148__HDOntologyUpdateCoordinator__downloadStageAndImportEntryWithIdentifier_schemaType_schemaVersion_shardVersion_shardURL_fileSize_reason_completion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  id v8;

  v5 = a3;
  if ((a2 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "importer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v5;
    objc_msgSend(v6, "importStagedShardFilesWithError:", &v8);
    v7 = v8;

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    v5 = v7;
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

- (HDDaemon)daemon
{
  return (HDDaemon *)objc_loadWeakRetained((id *)&self->_daemon);
}

- (HDOntologyFeatureCoordinator)featureCoordinator
{
  return self->_featureCoordinator;
}

- (HDOntologyManifestUpdater)manifestUpdater
{
  return self->_manifestUpdater;
}

- (HDOntologyShardDownloader)downloader
{
  return self->_downloader;
}

- (HDOntologyShardImporter)importer
{
  return self->_importer;
}

- (HDOntologyShardRegistry)shardRegistry
{
  return self->_shardRegistry;
}

- (HDOntologyShardPruner)pruner
{
  return self->_pruner;
}

- (id)unitTesting_willTriggerGatedActivity
{
  return self->_unitTesting_willTriggerGatedActivity;
}

- (void)setUnitTesting_willTriggerGatedActivity:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_unitTesting_willTriggerGatedActivity, 0);
  objc_storeStrong((id *)&self->_pruner, 0);
  objc_storeStrong((id *)&self->_shardRegistry, 0);
  objc_storeStrong((id *)&self->_importer, 0);
  objc_storeStrong((id *)&self->_downloader, 0);
  objc_storeStrong((id *)&self->_manifestUpdater, 0);
  objc_storeStrong((id *)&self->_featureCoordinator, 0);
  objc_destroyWeak((id *)&self->_daemon);
  objc_storeStrong((id *)&self->_updateOperationQueue, 0);
  objc_storeStrong((id *)&self->_threadLocalKeyIsRunningTransaction, 0);
  objc_storeStrong((id *)&self->_lock_preparedRegistryAssertion, 0);
  objc_storeStrong((id *)&self->_lock_preparedDatabaseAccessibilityAssertion, 0);
  objc_storeStrong((id *)&self->_fallbackActivity, 0);
  objc_storeStrong((id *)&self->_gatedActivity, 0);
  objc_storeStrong((id *)&self->_periodicActivity, 0);
}

@end
