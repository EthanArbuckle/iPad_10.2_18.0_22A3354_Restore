@implementation FPSpotlightIndexer

- (FPSpotlightIndexer)initWithDomain:(id)a3 providerDomain:(id)a4 indexName:(id)a5 log:(id)a6 supportURL:(id)a7 dropIndexDelegate:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  FPSpotlightIndexer *v19;
  FPSpotlightIndexer *v20;
  uint64_t v21;
  void *v22;
  __CFString *v23;
  dispatch_workloop_t v24;
  OS_dispatch_workloop *workloop;
  uint64_t v26;
  NSOperationQueue *operationQueue;
  id v28;
  NSString *indexName;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  CSSearchableIndex *index;
  dispatch_semaphore_t v34;
  OS_dispatch_semaphore *clientStateSemaphore;
  FPSpotlightIndexer *v36;
  objc_super v38;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a7;
  v18 = a8;
  if (objc_msgSend(getCSSearchableIndexClass(), "isIndexingAvailable"))
  {
    v38.receiver = self;
    v38.super_class = (Class)FPSpotlightIndexer;
    v19 = -[FPSpotlightIndexer init](&v38, sel_init);
    v20 = v19;
    if (v19)
    {
      objc_storeStrong((id *)&v19->_domain, a3);
      objc_storeStrong((id *)&v20->_providerDomain, a4);
      objc_storeStrong((id *)&v20->_indexName, a5);
      objc_storeStrong((id *)&v20->_supportURL, a7);
      objc_msgSend(v14, "identifier");
      v21 = objc_claimAutoreleasedReturnValue();
      v22 = (void *)v21;
      if (v21)
        v23 = (__CFString *)v21;
      else
        v23 = CFSTR("NSFileProviderDomainDefaultIdentifier");
      objc_storeStrong((id *)&v20->_domainID, v23);

      v24 = dispatch_workloop_create("spotlight-indexer");
      workloop = v20->_workloop;
      v20->_workloop = (OS_dispatch_workloop *)v24;

      v26 = objc_opt_new();
      operationQueue = v20->_operationQueue;
      v20->_operationQueue = (NSOperationQueue *)v26;

      -[NSOperationQueue setMaxConcurrentOperationCount:](v20->_operationQueue, "setMaxConcurrentOperationCount:", 1);
      objc_storeWeak((id *)&v20->_dropIndexDelegate, v18);
      v28 = objc_alloc((Class)getCSSearchableIndexClass());
      indexName = v20->_indexName;
      v30 = *MEMORY[0x1E0CB2AC0];
      objc_msgSend(v15, "topLevelBundleIdentifier");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend(v28, "initWithName:protectionClass:bundleIdentifier:", indexName, v30, v31);
      index = v20->_index;
      v20->_index = (CSSearchableIndex *)v32;

      v20->_clientState = 1;
      v34 = dispatch_semaphore_create(0);
      clientStateSemaphore = v20->_clientStateSemaphore;
      v20->_clientStateSemaphore = (OS_dispatch_semaphore *)v34;

    }
    self = v20;
    v36 = self;
  }
  else
  {
    v36 = 0;
  }

  return v36;
}

- (FPSpotlightIndexer)initWithDomain:(id)a3 providerDomain:(id)a4 log:(id)a5 supportURL:(id)a6 dropIndexDelegate:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  FPSpotlightIndexer *v22;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v17 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v13, "providerID");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "stringWithFormat:", CFSTR("com.apple.FileProvider/%@"), v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(v12, "spotlightDomainIdentifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "stringByAppendingPathComponent:", v20);
    v21 = objc_claimAutoreleasedReturnValue();

    v19 = (void *)v21;
  }
  v22 = -[FPSpotlightIndexer initWithDomain:providerDomain:indexName:log:supportURL:dropIndexDelegate:](self, "initWithDomain:providerDomain:indexName:log:supportURL:dropIndexDelegate:", v12, v13, v19, v14, v15, v16);

  return v22;
}

- (void)dealloc
{
  void *v4;
  objc_super v5;

  if (self->_vendorEnumerator)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("FPSpotlightIndexer.m"), 190, CFSTR("should call -invalidate"));

  }
  v5.receiver = self;
  v5.super_class = (Class)FPSpotlightIndexer;
  -[FPSpotlightIndexer dealloc](&v5, sel_dealloc);
}

- (id)description
{
  const __CFString *v3;
  const __CFString *v4;

  if (self->_clientState == 3)
    v3 = &stru_1E4450B40;
  else
    v3 = CFSTR(" not-ready");
  if (-[NSOperationQueue isSuspended](self->_operationQueue, "isSuspended"))
    v4 = CFSTR(" suspended");
  else
    v4 = &stru_1E4450B40;
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@:%@ %p %@%@ [%lu ops]>"), objc_opt_class(), self->_indexName, self, v3, v4, -[NSOperationQueue operationCount](self->_operationQueue, "operationCount"));
}

- (void)clearIndexState
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8(&dword_1A0A34000, v0, v1, "[DEBUG] %@: Forgetting change token", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)learnNewIndexState:(id)a3
{
  NSData *v4;
  NSObject *v5;
  NSData *lastIndexState;

  v4 = (NSData *)a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workloop);
  fp_current_or_default_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[FPSpotlightIndexer learnNewIndexState:].cold.1();

  lastIndexState = self->_lastIndexState;
  self->_lastIndexState = v4;
  self->_clientState = 3;

}

- (id)_fetchClientStateIfNeeded
{
  id v3;
  void *v4;
  void *v5;
  id WeakRetained;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  id v14;
  id v15;
  NSObject *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  FPSpotlightFetchClientStateOperation *v22;
  CSSearchableIndex *index;
  NSString *indexName;
  void *v25;
  FPSpotlightFetchClientStateOperation *v26;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  _QWORD v32[5];
  id v33;
  id v34;
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v3 = fpfs_adopt_log(self->_log);
  objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentPersona");
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  v34 = 0;
  objc_msgSend(v31, "userPersonaUniqueString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_domainContext);
  objc_msgSend(WeakRetained, "domain");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "personaIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 == v8)
  {

LABEL_13:
    v20 = 0;
    goto LABEL_14;
  }
  v9 = objc_loadWeakRetained((id *)&self->_domainContext);
  objc_msgSend(v9, "domain");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "personaIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v5, "isEqualToString:", v11);

  if ((v12 & 1) != 0 || !voucher_process_can_use_arbitrary_personas())
    goto LABEL_13;
  v33 = 0;
  v13 = (void *)objc_msgSend(v31, "copyCurrentPersonaContextWithError:", &v33);
  v14 = v33;
  v15 = v34;
  v34 = v13;

  if (v14)
  {
    fp_current_or_default_log();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[FPSpotlightIndexer _fetchClientStateIfNeeded].cold.1();

  }
  v17 = objc_loadWeakRetained((id *)&self->_domainContext);
  objc_msgSend(v17, "domain");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "personaIdentifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "generateAndRestorePersonaContextWithPersonaUniqueString:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    fp_current_or_default_log();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      v28 = objc_loadWeakRetained((id *)&self->_domainContext);
      objc_msgSend(v28, "domain");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "personaIdentifier");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v36 = v30;
      v37 = 2112;
      v38 = v20;
      _os_log_error_impl(&dword_1A0A34000, v21, OS_LOG_TYPE_ERROR, "[ERROR] Can't adopt persona %@: %@", buf, 0x16u);

    }
  }
LABEL_14:
  if (self->_clientState == 1)
  {
    self->_clientState = 2;
    v22 = [FPSpotlightFetchClientStateOperation alloc];
    index = self->_index;
    indexName = self->_indexName;
    -[NSFileProviderDomain spotlightDomainIdentifier](self->_domain, "spotlightDomainIdentifier");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = -[FPSpotlightFetchClientStateOperation initWithIndexer:index:indexName:spotlightDomainIdentifier:reason:supportURL:](v22, "initWithIndexer:index:indexName:spotlightDomainIdentifier:reason:supportURL:", self, index, indexName, v25, CFSTR("indexing one batch"), self->_supportURL);

    -[FPOperation setCallbackQueue:](v26, "setCallbackQueue:", self->_workloop);
    v32[0] = MEMORY[0x1E0C809B0];
    v32[1] = 3221225472;
    v32[2] = __47__FPSpotlightIndexer__fetchClientStateIfNeeded__block_invoke;
    v32[3] = &unk_1E444AF80;
    v32[4] = self;
    -[FPOperation setFinishedBlock:](v26, "setFinishedBlock:", v32);
    -[FPSpotlightFetchClientStateOperation setQualityOfService:](v26, "setQualityOfService:", 17);
    objc_storeStrong((id *)&self->_fetchStateOperation, v26);
  }
  else
  {
    v26 = 0;
  }

  _FPRestorePersona(&v34);
  return v26;
}

void __47__FPSpotlightIndexer__fetchClientStateIfNeeded__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(v5 + 80);
  *(_QWORD *)(v5 + 80) = 0;

  v7 = *(void **)(a1 + 32);
  if (a3)
    objc_msgSend(v7, "clearIndexState");
  else
    objc_msgSend(v7, "learnNewIndexState:", v8);
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(a1 + 32) + 104));

}

- (void)_indexOneBatchWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id WeakRetained;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  id v15;
  id v16;
  NSObject *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  NSFileProviderEnumerator *v27;
  id v28;
  NSFileProviderEnumerator *vendorEnumerator;
  FPSpotlightFetchOneBatchFromWorkingSetOperation *v30;
  FPSpotlightIndexOneBatchOperation *v31;
  uint64_t v32;
  FPSpotlightIndexOneBatchOperation *v33;
  NSObject *v34;
  NSObject *v35;
  NSOperationQueue **p_operationQueue;
  NSOperationQueue *operationQueue;
  NSObject *v38;
  NSObject *v39;
  void *v40;
  NSObject *v41;
  void *v42;
  id v43;
  void *v44;
  void *v45;
  id v46;
  void *v47;
  _QWORD v48[4];
  FPSpotlightIndexOneBatchOperation *v49;
  _QWORD *v50;
  _BYTE *v51;
  id v52;
  id from;
  _QWORD v54[4];
  id v55;
  _BYTE *v56;
  _QWORD *v57;
  id v58;
  id location;
  _QWORD v60[3];
  char v61;
  _QWORD v62[4];
  id v63;
  id v64;
  id v65;
  id v66;
  id v67;
  _BYTE buf[24];
  uint64_t (*v69)(uint64_t, uint64_t);
  void (*v70)(uint64_t);
  id v71;
  uint64_t v72;

  v72 = *MEMORY[0x1E0C80C00];
  v46 = a3;
  v4 = fpfs_adopt_log(self->_log);
  objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "currentPersona");
  v47 = (void *)objc_claimAutoreleasedReturnValue();

  v67 = 0;
  objc_msgSend(v47, "userPersonaUniqueString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_domainContext);
  objc_msgSend(WeakRetained, "domain");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "personaIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 == v9)
  {

LABEL_13:
    v21 = 0;
    goto LABEL_14;
  }
  v10 = objc_loadWeakRetained((id *)&self->_domainContext);
  objc_msgSend(v10, "domain");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "personaIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v6, "isEqualToString:", v12);

  if ((v13 & 1) != 0 || !voucher_process_can_use_arbitrary_personas())
    goto LABEL_13;
  v66 = 0;
  v14 = (void *)objc_msgSend(v47, "copyCurrentPersonaContextWithError:", &v66);
  v15 = v66;
  v16 = v67;
  v67 = v14;

  if (v15)
  {
    fp_current_or_default_log();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      -[FPSpotlightIndexer _fetchClientStateIfNeeded].cold.1();

  }
  v18 = objc_loadWeakRetained((id *)&self->_domainContext);
  objc_msgSend(v18, "domain");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "personaIdentifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "generateAndRestorePersonaContextWithPersonaUniqueString:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    fp_current_or_default_log();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      v43 = objc_loadWeakRetained((id *)&self->_domainContext);
      objc_msgSend(v43, "domain");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "personaIdentifier");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v45;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v21;
      _os_log_error_impl(&dword_1A0A34000, v22, OS_LOG_TYPE_ERROR, "[ERROR] Can't adopt persona %@: %@", buf, 0x16u);

    }
  }
LABEL_14:
  if (self->_vendorEnumerator || -[FPProviderDomain isUsingFPFS](self->_providerDomain, "isUsingFPFS"))
    goto LABEL_19;
  v23 = objc_loadWeakRetained((id *)&self->_domainContext);
  if (!v23)
    __assert_rtn("-[FPSpotlightIndexer _indexOneBatchWithCompletionHandler:]", "FPSpotlightIndexer.m", 261, "self->_domainContext");

  -[FPSpotlightIndexer domainContext](self, "domainContext");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "vendorInstance");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSFileProviderRequest requestFromTheSystem](NSFileProviderRequest, "requestFromTheSystem");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v65 = 0;
  objc_msgSend(v25, "enumeratorForContainerItemIdentifier:request:error:", CFSTR("NSFileProviderWorkingSetContainerItemIdentifier"), v26, &v65);
  v27 = (NSFileProviderEnumerator *)objc_claimAutoreleasedReturnValue();
  v28 = v65;
  vendorEnumerator = self->_vendorEnumerator;
  self->_vendorEnumerator = v27;

  if (self->_vendorEnumerator)
  {

LABEL_19:
    -[FPSpotlightIndexer _fetchClientStateIfNeeded](self, "_fetchClientStateIfNeeded");
    v28 = (id)objc_claimAutoreleasedReturnValue();
    v60[0] = 0;
    v60[1] = v60;
    v60[2] = 0x2020000000;
    v61 = 0;
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v69 = __Block_byref_object_copy__2;
    v70 = __Block_byref_object_dispose__2;
    v71 = 0;
    v30 = -[FPSpotlightFetchOneBatchFromWorkingSetOperation initWithIndexer:queue:]([FPSpotlightFetchOneBatchFromWorkingSetOperation alloc], "initWithIndexer:queue:", self, self->_workloop);
    -[FPSpotlightFetchOneBatchFromWorkingSetOperation setQualityOfService:](v30, "setQualityOfService:", 17);
    if (self->_fetchStateOperation)
      -[FPSpotlightFetchOneBatchFromWorkingSetOperation addDependency:](v30, "addDependency:");
    v31 = -[FPSpotlightIndexOneBatchOperation initWithIndexer:isInitialIndexing:isOutOfBandIndexing:queue:]([FPSpotlightIndexOneBatchOperation alloc], "initWithIndexer:isInitialIndexing:isOutOfBandIndexing:queue:", self, 0, 0, self->_workloop);
    -[FPSpotlightIndexOneBatchOperation setIndexReason:](v31, "setIndexReason:", 1);
    location = 0;
    objc_initWeak(&location, self);
    v32 = MEMORY[0x1E0C809B0];
    v54[0] = MEMORY[0x1E0C809B0];
    v54[1] = 3221225472;
    v54[2] = __58__FPSpotlightIndexer__indexOneBatchWithCompletionHandler___block_invoke_59;
    v54[3] = &unk_1E444AFD0;
    objc_copyWeak(&v58, &location);
    v56 = buf;
    v57 = v60;
    v55 = v46;
    -[FPOperation setFinishedBlock:](v31, "setFinishedBlock:", v54);
    -[FPSpotlightIndexOneBatchOperation setQualityOfService:](v31, "setQualityOfService:", 17);
    if (self->_fetchStateOperation)
      -[FPSpotlightIndexOneBatchOperation addDependency:](v31, "addDependency:");
    from = 0;
    objc_initWeak(&from, v30);
    v48[0] = v32;
    v48[1] = 3221225472;
    v48[2] = __58__FPSpotlightIndexer__indexOneBatchWithCompletionHandler___block_invoke_3;
    v48[3] = &unk_1E444AFF8;
    objc_copyWeak(&v52, &from);
    v33 = v31;
    v49 = v33;
    v50 = v60;
    v51 = buf;
    -[FPOperation setFinishedBlock:](v30, "setFinishedBlock:", v48);
    if (v28)
    {
      fp_current_or_default_log();
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
        -[FPSpotlightIndexer _indexOneBatchWithCompletionHandler:].cold.2();

      -[NSOperationQueue addOperation:](self->_operationQueue, "addOperation:", v28);
    }
    fp_current_or_default_log();
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
      -[FPSpotlightIndexer _indexOneBatchWithCompletionHandler:].cold.2();

    operationQueue = self->_operationQueue;
    p_operationQueue = &self->_operationQueue;
    -[NSOperationQueue addOperation:](operationQueue, "addOperation:", v30);
    fp_current_or_default_log();
    v38 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
      -[FPSpotlightIndexer _indexOneBatchWithCompletionHandler:].cold.1();

    -[NSOperationQueue addOperation:](*p_operationQueue, "addOperation:", v33);
    objc_destroyWeak(&v52);
    objc_destroyWeak(&from);

    objc_destroyWeak(&v58);
    objc_destroyWeak(&location);

    _Block_object_dispose(buf, 8);
    _Block_object_dispose(v60, 8);
    goto LABEL_32;
  }
  if (objc_msgSend(v28, "fp_isFileProviderError:", -1000))
  {
    fp_current_or_default_log();
    v39 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v28, "fp_prettyDescription");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v40;
      _os_log_impl(&dword_1A0A34000, v39, OS_LOG_TYPE_DEFAULT, "[WARNING] can't create vendor enumerator: %@", buf, 0xCu);

    }
    v62[0] = MEMORY[0x1E0C809B0];
    v62[1] = 3221225472;
    v62[2] = __58__FPSpotlightIndexer__indexOneBatchWithCompletionHandler___block_invoke;
    v62[3] = &unk_1E444A188;
    v64 = v46;
    v28 = v28;
    v63 = v28;
    -[FPSpotlightIndexer dropIndexWithDropReason:completionHandler:](self, "dropIndexWithDropReason:completionHandler:", 12, v62);

  }
  else
  {
    fp_current_or_default_log();
    v41 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v28, "fp_prettyDescription");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      -[FPSpotlightIndexer _indexOneBatchWithCompletionHandler:].cold.4(v42, buf, v41);
    }

    (*((void (**)(id, _QWORD, id))v46 + 2))(v46, 0, v28);
  }
LABEL_32:

  _FPRestorePersona(&v67);
}

uint64_t __58__FPSpotlightIndexer__indexOneBatchWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __58__FPSpotlightIndexer__indexOneBatchWithCompletionHandler___block_invoke_59(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  id WeakRetained;
  int v6;
  int v7;
  int v8;
  char v9;
  uint64_t v10;
  _QWORD v11[4];
  id v12;
  id v13;
  char v14;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (!WeakRetained)
    goto LABEL_19;
  v6 = objc_msgSend(v4, "fp_isFileProviderError:", -1000);
  if ((objc_msgSend(v4, "fp_isFileProviderError:", -1002) & 1) != 0)
  {
    v7 = 1;
    if (v4)
      goto LABEL_7;
  }
  else
  {
    v7 = objc_msgSend(v4, "fp_isFileProviderError:", -1002);
    if (v4)
      goto LABEL_7;
  }
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
LABEL_7:
    v8 = v6 | v7;
    if ((v6 & 1) != 0)
      goto LABEL_8;
    goto LABEL_11;
  }
  v8 = 1;
  if ((v6 & 1) != 0)
  {
LABEL_8:
    v9 = 0;
    if (!v8)
    {
LABEL_9:
      (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
      goto LABEL_19;
    }
    goto LABEL_15;
  }
LABEL_11:
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
    v9 = 1;
  else
    v9 = v7;
  if (!v8)
    goto LABEL_9;
LABEL_15:
  if (v6)
    v10 = 12;
  else
    v10 = 8;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __58__FPSpotlightIndexer__indexOneBatchWithCompletionHandler___block_invoke_2;
  v11[3] = &unk_1E444AFA8;
  v13 = *(id *)(a1 + 32);
  v14 = v9;
  v12 = v4;
  objc_msgSend(WeakRetained, "dropIndexWithDropReason:completionHandler:", v10, v11);

LABEL_19:
}

uint64_t __58__FPSpotlightIndexer__indexOneBatchWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

void __58__FPSpotlightIndexer__indexOneBatchWithCompletionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;

  v14 = a2;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (!WeakRetained)
    __58__FPSpotlightIndexer__indexOneBatchWithCompletionHandler___block_invoke_3_cold_1();
  v7 = WeakRetained;
  objc_msgSend(WeakRetained, "updatedItems");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setUpdatedItems:", v8);

  objc_msgSend(v7, "deletedItemIDs");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setDeletedItemIDs:", v9);

  objc_msgSend(*(id *)(a1 + 32), "setPassExpectedState:", 1);
  objc_msgSend(v7, "nextAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setNextAnchor:", v10);

  objc_msgSend(*(id *)(a1 + 32), "setFetchError:", v5);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v7, "hasMore");
  objc_msgSend(v7, "nextAnchor");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v13 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = v11;

}

- (void)indexOneBatchWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  NSObject *workloop;
  id v7;
  id v8;
  _QWORD block[4];
  id v10;
  FPSpotlightIndexer *v11;
  id v12;

  v4 = a3;
  -[FPSpotlightIndexer domainContext](self, "domainContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  workloop = self->_workloop;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__FPSpotlightIndexer_indexOneBatchWithCompletionHandler___block_invoke;
  block[3] = &unk_1E4449B98;
  v10 = v5;
  v11 = self;
  v12 = v4;
  v7 = v4;
  v8 = v5;
  dispatch_async(workloop, block);

}

uint64_t __57__FPSpotlightIndexer_indexOneBatchWithCompletionHandler___block_invoke(uint64_t a1)
{
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 136), "isUsingFPFS"))
    __57__FPSpotlightIndexer_indexOneBatchWithCompletionHandler___block_invoke_cold_1();
  return objc_msgSend(*(id *)(a1 + 40), "_indexOneBatchWithCompletionHandler:", *(_QWORD *)(a1 + 48));
}

- (void)_indexOneBatchFromAnchor:(id)a3 toAnchor:(id)a4 updatedItems:(id)a5 deletedItems:(id)a6 completionHandler:(id)a7
{
  id v12;
  void *v13;
  void *v14;
  id WeakRetained;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  char v21;
  void *v22;
  id v23;
  id v24;
  NSObject *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  void *v31;
  FPSpotlightIndexOneBatchOperation *v32;
  FPSpotlightIndexState *v33;
  void *v34;
  uint64_t v35;
  id v36;
  id v37;
  NSObject *v38;
  NSObject *v39;
  id v40;
  void *v41;
  void *v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  void *v48;
  _QWORD v49[4];
  id v50;
  id v51;
  _QWORD v52[4];
  id v53;
  id v54;
  id v55;
  _BYTE location[12];
  __int16 v57;
  void *v58;
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v47 = a3;
  v44 = a4;
  v46 = a5;
  v45 = a6;
  v43 = a7;
  v12 = fpfs_adopt_log(self->_log);
  objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "currentPersona");
  v48 = (void *)objc_claimAutoreleasedReturnValue();

  v55 = 0;
  objc_msgSend(v48, "userPersonaUniqueString");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_domainContext);
  objc_msgSend(WeakRetained, "domain");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "personaIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14 == v17)
  {

LABEL_13:
    v29 = 0;
    goto LABEL_14;
  }
  v18 = objc_loadWeakRetained((id *)&self->_domainContext);
  objc_msgSend(v18, "domain");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "personaIdentifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v14, "isEqualToString:", v20);

  if ((v21 & 1) != 0 || !voucher_process_can_use_arbitrary_personas())
    goto LABEL_13;
  v54 = 0;
  v22 = (void *)objc_msgSend(v48, "copyCurrentPersonaContextWithError:", &v54);
  v23 = v54;
  v24 = v55;
  v55 = v22;

  if (v23)
  {
    fp_current_or_default_log();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      -[FPSpotlightIndexer _fetchClientStateIfNeeded].cold.1();

  }
  v26 = objc_loadWeakRetained((id *)&self->_domainContext);
  objc_msgSend(v26, "domain");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "personaIdentifier");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "generateAndRestorePersonaContextWithPersonaUniqueString:", v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  if (v29)
  {
    fp_current_or_default_log();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      v40 = objc_loadWeakRetained((id *)&self->_domainContext);
      objc_msgSend(v40, "domain");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "personaIdentifier");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)location = 138412546;
      *(_QWORD *)&location[4] = v42;
      v57 = 2112;
      v58 = v29;
      _os_log_error_impl(&dword_1A0A34000, v30, OS_LOG_TYPE_ERROR, "[ERROR] Can't adopt persona %@: %@", location, 0x16u);

    }
  }
LABEL_14:
  -[FPSpotlightIndexer _fetchClientStateIfNeeded](self, "_fetchClientStateIfNeeded");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = -[FPSpotlightIndexOneBatchOperation initWithIndexer:isInitialIndexing:isOutOfBandIndexing:queue:]([FPSpotlightIndexOneBatchOperation alloc], "initWithIndexer:isInitialIndexing:isOutOfBandIndexing:queue:", self, 0, 0, self->_workloop);
  -[FPSpotlightIndexOneBatchOperation setUpdatedItems:](v32, "setUpdatedItems:", v46);
  -[FPSpotlightIndexOneBatchOperation setDeletedItemIDs:](v32, "setDeletedItemIDs:", v45);
  -[FPSpotlightIndexOneBatchOperation setFetchError:](v32, "setFetchError:", 0);
  -[FPSpotlightIndexOneBatchOperation setIndexReason:](v32, "setIndexReason:", 0);
  -[FPSpotlightIndexOneBatchOperation setPassExpectedState:](v32, "setPassExpectedState:", 1);
  v33 = -[FPSpotlightIndexState initWithPage:changeToken:]([FPSpotlightIndexState alloc], "initWithPage:changeToken:", v44, v47);
  -[FPSpotlightIndexState dataRepresentation](v33, "dataRepresentation");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[FPSpotlightIndexOneBatchOperation setNextAnchor:](v32, "setNextAnchor:", v34);

  v35 = MEMORY[0x1E0C809B0];
  v52[0] = MEMORY[0x1E0C809B0];
  v52[1] = 3221225472;
  v52[2] = __100__FPSpotlightIndexer__indexOneBatchFromAnchor_toAnchor_updatedItems_deletedItems_completionHandler___block_invoke;
  v52[3] = &unk_1E444B020;
  v36 = v47;
  v53 = v36;
  -[FPSpotlightIndexOneBatchOperation setCanIndexFromCurrentState:](v32, "setCanIndexFromCurrentState:", v52);
  *(_QWORD *)location = 0;
  objc_initWeak((id *)location, self);
  v49[0] = v35;
  v49[1] = 3221225472;
  v49[2] = __100__FPSpotlightIndexer__indexOneBatchFromAnchor_toAnchor_updatedItems_deletedItems_completionHandler___block_invoke_65;
  v49[3] = &unk_1E444B048;
  objc_copyWeak(&v51, (id *)location);
  v37 = v43;
  v50 = v37;
  -[FPOperation setFinishedBlock:](v32, "setFinishedBlock:", v49);
  -[FPSpotlightIndexOneBatchOperation setQualityOfService:](v32, "setQualityOfService:", 17);
  if (self->_fetchStateOperation)
    -[FPSpotlightIndexOneBatchOperation addDependency:](v32, "addDependency:");
  if (v31)
  {
    fp_current_or_default_log();
    v38 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
      -[FPSpotlightIndexer _indexOneBatchWithCompletionHandler:].cold.2();

    -[NSOperationQueue addOperation:](self->_operationQueue, "addOperation:", v31);
  }
  fp_current_or_default_log();
  v39 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
    -[FPSpotlightIndexer _indexOneBatchWithCompletionHandler:].cold.2();

  -[NSOperationQueue addOperation:](self->_operationQueue, "addOperation:", v32);
  objc_destroyWeak(&v51);
  objc_destroyWeak((id *)location);

  _FPRestorePersona(&v55);
}

uint64_t __100__FPSpotlightIndexer__indexOneBatchFromAnchor_toAnchor_updatedItems_deletedItems_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  char v9;
  uint64_t v10;
  NSObject *v11;
  void *v13;
  NSObject *v14;
  void *v15;
  int v16;
  NSObject *v17;

  v3 = a2;
  v4 = v3;
  if (v3 && objc_msgSend(v3, "length"))
  {
    +[FPSpotlightIndexState stateWithData:](FPSpotlightIndexState, "stateWithData:", v4);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5
      && (-[NSObject lastPage](v5, "lastPage"), v7 = (void *)objc_claimAutoreleasedReturnValue(), v7, v7))
    {
      if (*(_QWORD *)(a1 + 32))
      {
        -[NSObject lastPage](v6, "lastPage");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = tokensAreEqual(v8, *(void **)(a1 + 32));

        if ((v9 & 1) != 0)
        {
          v10 = 1;
          goto LABEL_16;
        }
        -[NSObject lastChangeToken](v6, "lastChangeToken");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = tokensAreEqual(v15, *(void **)(a1 + 32));

        fp_current_or_default_log();
        v17 = objc_claimAutoreleasedReturnValue();
        v11 = v17;
        if (v16)
        {
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
            goto LABEL_28;
          goto LABEL_29;
        }
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          __100__FPSpotlightIndexer__indexOneBatchFromAnchor_toAnchor_updatedItems_deletedItems_completionHandler___block_invoke_cold_6();
      }
      else
      {
        -[NSObject lastChangeToken](v6, "lastChangeToken");
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        fp_current_or_default_log();
        v14 = objc_claimAutoreleasedReturnValue();
        v11 = v14;
        if (!v13)
        {
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
LABEL_28:
            __100__FPSpotlightIndexer__indexOneBatchFromAnchor_toAnchor_updatedItems_deletedItems_completionHandler___block_invoke_cold_3();
LABEL_29:
          v10 = 1;
          goto LABEL_15;
        }
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          __100__FPSpotlightIndexer__indexOneBatchFromAnchor_toAnchor_updatedItems_deletedItems_completionHandler___block_invoke_cold_4();
      }
    }
    else
    {
      fp_current_or_default_log();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        __100__FPSpotlightIndexer__indexOneBatchFromAnchor_toAnchor_updatedItems_deletedItems_completionHandler___block_invoke_cold_2();
    }
    v10 = 0;
LABEL_15:

    goto LABEL_16;
  }
  if (!*(_QWORD *)(a1 + 32))
  {
    v10 = 1;
    goto LABEL_18;
  }
  fp_current_or_default_log();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    __100__FPSpotlightIndexer__indexOneBatchFromAnchor_toAnchor_updatedItems_deletedItems_completionHandler___block_invoke_cold_1();
  v10 = 0;
LABEL_16:

LABEL_18:
  return v10;
}

void __100__FPSpotlightIndexer__indexOneBatchFromAnchor_toAnchor_updatedItems_deletedItems_completionHandler___block_invoke_65(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  id WeakRetained;
  int v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v6 = objc_msgSend(v4, "fp_isFileProviderError:", -1000);
    if ((objc_msgSend(v4, "fp_isFileProviderError:", -1002) & 1) != 0
      || (v6 | objc_msgSend(v4, "fp_isFileProviderError:", -1002)) == 1)
    {
      if (v6)
        v7 = 12;
      else
        v7 = 8;
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __100__FPSpotlightIndexer__indexOneBatchFromAnchor_toAnchor_updatedItems_deletedItems_completionHandler___block_invoke_2;
      v8[3] = &unk_1E444A188;
      v10 = *(id *)(a1 + 32);
      v9 = v4;
      objc_msgSend(WeakRetained, "dropIndexWithDropReason:completionHandler:", v7, v8);

    }
    else
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    }
  }

}

uint64_t __100__FPSpotlightIndexer__indexOneBatchFromAnchor_toAnchor_updatedItems_deletedItems_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)indexOneBatchFromAnchor:(id)a3 toAnchor:(id)a4 updatedItems:(id)a5 deletedItems:(id)a6 completionHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  NSObject *workloop;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  _QWORD v23[5];
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  workloop = self->_workloop;
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __99__FPSpotlightIndexer_indexOneBatchFromAnchor_toAnchor_updatedItems_deletedItems_completionHandler___block_invoke;
  v23[3] = &unk_1E444B070;
  v23[4] = self;
  v24 = v12;
  v25 = v13;
  v26 = v14;
  v27 = v15;
  v28 = v16;
  v18 = v16;
  v19 = v15;
  v20 = v14;
  v21 = v13;
  v22 = v12;
  dispatch_async(workloop, v23);

}

uint64_t __99__FPSpotlightIndexer_indexOneBatchFromAnchor_toAnchor_updatedItems_deletedItems_completionHandler___block_invoke(uint64_t a1)
{
  if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 136), "isUsingFPFS") & 1) == 0)
    __99__FPSpotlightIndexer_indexOneBatchFromAnchor_toAnchor_updatedItems_deletedItems_completionHandler___block_invoke_cold_1();
  return objc_msgSend(*(id *)(a1 + 32), "_indexOneBatchFromAnchor:toAnchor:updatedItems:deletedItems:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72));
}

- (void)_indexOutOfBandUpdatedItems:(id)a3 deletedItems:(id)a4 indexReason:(int64_t)a5 completionHandler:(id)a6
{
  id v9;
  void *v10;
  void *v11;
  id WeakRetained;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  id v20;
  id v21;
  NSObject *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  FPSpotlightIndexOneBatchOperation *v29;
  id v30;
  id v31;
  id v32;
  NSObject *v33;
  NSObject *v34;
  id v35;
  void *v36;
  void *v37;
  id v38;
  id v39;
  id v41;
  id v42;
  void *v43;
  _QWORD v44[4];
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  uint8_t buf[4];
  void *v51;
  __int16 v52;
  void *v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v42 = a3;
  v41 = a4;
  v38 = a6;
  v9 = fpfs_adopt_log(self->_log);
  objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "currentPersona");
  v43 = (void *)objc_claimAutoreleasedReturnValue();

  v49 = 0;
  objc_msgSend(v43, "userPersonaUniqueString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_domainContext);
  objc_msgSend(WeakRetained, "domain");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "personaIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11 == v14)
  {

LABEL_13:
    v26 = 0;
    goto LABEL_14;
  }
  v15 = objc_loadWeakRetained((id *)&self->_domainContext);
  objc_msgSend(v15, "domain", v38);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "personaIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v11, "isEqualToString:", v17);

  if ((v18 & 1) != 0 || !voucher_process_can_use_arbitrary_personas())
    goto LABEL_13;
  v48 = 0;
  v19 = (void *)objc_msgSend(v43, "copyCurrentPersonaContextWithError:", &v48);
  v20 = v48;
  v21 = v49;
  v49 = v19;

  if (v20)
  {
    fp_current_or_default_log();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      -[FPSpotlightIndexer _fetchClientStateIfNeeded].cold.1();

  }
  v23 = objc_loadWeakRetained((id *)&self->_domainContext);
  objc_msgSend(v23, "domain");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "personaIdentifier");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "generateAndRestorePersonaContextWithPersonaUniqueString:", v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (v26)
  {
    fp_current_or_default_log();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      v35 = objc_loadWeakRetained((id *)&self->_domainContext);
      objc_msgSend(v35, "domain");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "personaIdentifier");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v51 = v37;
      v52 = 2112;
      v53 = v26;
      _os_log_error_impl(&dword_1A0A34000, v27, OS_LOG_TYPE_ERROR, "[ERROR] Can't adopt persona %@: %@", buf, 0x16u);

    }
  }
LABEL_14:
  -[FPSpotlightIndexer _fetchClientStateIfNeeded](self, "_fetchClientStateIfNeeded", v38);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setQualityOfService:", qos_class_self());
  v29 = -[FPSpotlightIndexOneBatchOperation initWithIndexer:isInitialIndexing:isOutOfBandIndexing:queue:]([FPSpotlightIndexOneBatchOperation alloc], "initWithIndexer:isInitialIndexing:isOutOfBandIndexing:queue:", self, 0, 1, self->_workloop);
  -[FPSpotlightIndexOneBatchOperation setUpdatedItems:](v29, "setUpdatedItems:", v42);
  -[FPSpotlightIndexOneBatchOperation setDeletedItemIDs:](v29, "setDeletedItemIDs:", v41);
  -[FPSpotlightIndexOneBatchOperation setFetchError:](v29, "setFetchError:", 0);
  -[FPSpotlightIndexOneBatchOperation setNextAnchor:](v29, "setNextAnchor:", 0);
  -[FPSpotlightIndexOneBatchOperation setIndexReason:](v29, "setIndexReason:", a5);
  -[FPSpotlightIndexOneBatchOperation setQualityOfService:](v29, "setQualityOfService:", qos_class_self());
  v44[0] = MEMORY[0x1E0C809B0];
  v44[1] = 3221225472;
  v44[2] = __93__FPSpotlightIndexer__indexOutOfBandUpdatedItems_deletedItems_indexReason_completionHandler___block_invoke;
  v44[3] = &unk_1E444B098;
  v30 = v42;
  v45 = v30;
  v31 = v41;
  v46 = v31;
  v32 = v39;
  v47 = v32;
  -[FPOperation setFinishedBlock:](v29, "setFinishedBlock:", v44);
  if (v28)
  {
    fp_current_or_default_log();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
      -[FPSpotlightIndexer _indexOneBatchWithCompletionHandler:].cold.2();

    -[NSOperationQueue addOperation:](self->_operationQueue, "addOperation:", v28);
  }
  fp_current_or_default_log();
  v34 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
    -[FPSpotlightIndexer _indexOneBatchWithCompletionHandler:].cold.2();

  -[NSOperationQueue addOperation:](self->_operationQueue, "addOperation:", v29);
  _FPRestorePersona(&v49);

}

void __93__FPSpotlightIndexer__indexOutOfBandUpdatedItems_deletedItems_indexReason_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;

  v4 = a3;
  fp_current_or_default_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    __93__FPSpotlightIndexer__indexOutOfBandUpdatedItems_deletedItems_indexReason_completionHandler___block_invoke_cold_1(a1, (uint64_t)v4, v5);

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (void)indexOutOfBandUpdatedItems:(id)a3 deletedItems:(id)a4 indexReason:(int64_t)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  NSObject *workloop;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  FPSpotlightIndexer *v21;
  id v22;
  id v23;
  id v24;
  int64_t v25;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  -[FPSpotlightIndexer domainContext](self, "domainContext");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  workloop = self->_workloop;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __92__FPSpotlightIndexer_indexOutOfBandUpdatedItems_deletedItems_indexReason_completionHandler___block_invoke;
  v19[3] = &unk_1E444B0C0;
  v20 = v13;
  v21 = self;
  v22 = v10;
  v23 = v11;
  v24 = v12;
  v25 = a5;
  v15 = v12;
  v16 = v11;
  v17 = v10;
  v18 = v13;
  dispatch_async(workloop, v19);

}

uint64_t __92__FPSpotlightIndexer_indexOutOfBandUpdatedItems_deletedItems_indexReason_completionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 40), "_indexOutOfBandUpdatedItems:deletedItems:indexReason:completionHandler:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 64));
}

- (void)_fetchCurrentIndexingAnchorWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id WeakRetained;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  id v15;
  id v16;
  NSObject *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  NSObject *v27;
  NSObject *v28;
  id v29;
  void *v30;
  void *v31;
  id v32;
  id v33;
  void *v34;
  _QWORD v35[4];
  id v36;
  id v37;
  id v38;
  id v39;
  _BYTE location[12];
  __int16 v41;
  void *v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v32 = a3;
  v4 = fpfs_adopt_log(self->_log);
  objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "currentPersona");
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  v39 = 0;
  objc_msgSend(v34, "userPersonaUniqueString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_domainContext);
  objc_msgSend(WeakRetained, "domain");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "personaIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 == v9)
  {

LABEL_13:
    v21 = 0;
    goto LABEL_14;
  }
  v10 = objc_loadWeakRetained((id *)&self->_domainContext);
  objc_msgSend(v10, "domain", v32);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "personaIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v6, "isEqualToString:", v12);

  if ((v13 & 1) != 0 || !voucher_process_can_use_arbitrary_personas())
    goto LABEL_13;
  v38 = 0;
  v14 = (void *)objc_msgSend(v34, "copyCurrentPersonaContextWithError:", &v38);
  v15 = v38;
  v16 = v39;
  v39 = v14;

  if (v15)
  {
    fp_current_or_default_log();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      -[FPSpotlightIndexer _fetchClientStateIfNeeded].cold.1();

  }
  v18 = objc_loadWeakRetained((id *)&self->_domainContext);
  objc_msgSend(v18, "domain");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "personaIdentifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "generateAndRestorePersonaContextWithPersonaUniqueString:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    fp_current_or_default_log();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      v29 = objc_loadWeakRetained((id *)&self->_domainContext);
      objc_msgSend(v29, "domain");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "personaIdentifier");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)location = 138412546;
      *(_QWORD *)&location[4] = v31;
      v41 = 2112;
      v42 = v21;
      _os_log_error_impl(&dword_1A0A34000, v22, OS_LOG_TYPE_ERROR, "[ERROR] Can't adopt persona %@: %@", location, 0x16u);

    }
  }
LABEL_14:
  -[FPSpotlightIndexer _fetchClientStateIfNeeded](self, "_fetchClientStateIfNeeded", v32);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)location = 0;
  objc_initWeak((id *)location, self);
  v24 = (void *)MEMORY[0x1E0CB34C8];
  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v35[2] = __71__FPSpotlightIndexer__fetchCurrentIndexingAnchorWithCompletionHandler___block_invoke;
  v35[3] = &unk_1E444B0E8;
  objc_copyWeak(&v37, (id *)location);
  v25 = v33;
  v36 = v25;
  objc_msgSend(v24, "blockOperationWithBlock:", v35);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setQualityOfService:", 17);
  objc_msgSend(v26, "setName:", CFSTR("ReturnCurrentAnchor"));
  if (self->_fetchStateOperation)
    objc_msgSend(v26, "addDependency:");
  if (v23)
  {
    fp_current_or_default_log();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
      -[FPSpotlightIndexer _indexOneBatchWithCompletionHandler:].cold.2();

    -[NSOperationQueue addOperation:](self->_operationQueue, "addOperation:", v23);
  }
  fp_current_or_default_log();
  v28 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
    -[FPSpotlightIndexer _indexOneBatchWithCompletionHandler:].cold.2();

  -[NSOperationQueue addOperation:](self->_operationQueue, "addOperation:", v26);
  objc_destroyWeak(&v37);
  objc_destroyWeak((id *)location);

  _FPRestorePersona(&v39);
}

void __71__FPSpotlightIndexer__fetchCurrentIndexingAnchorWithCompletionHandler___block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void (*v8)(void);
  _QWORD *v9;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v9 = WeakRetained;
    v3 = (void *)WeakRetained[8];
    if (v3)
    {
      if (objc_msgSend(v3, "length"))
      {
        +[FPSpotlightIndexState stateWithData:](FPSpotlightIndexState, "stateWithData:", v9[8]);
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        if (v4)
        {
          v5 = v4;
          v6 = *(_QWORD *)(a1 + 32);
          objc_msgSend(v4, "lastPage");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          (*(void (**)(uint64_t, void *, _QWORD))(v6 + 16))(v6, v7, 0);

LABEL_9:
          WeakRetained = v9;
          goto LABEL_10;
        }
      }
      v8 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
    }
    else
    {
      v8 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
    }
    v8();
    goto LABEL_9;
  }
LABEL_10:

}

- (void)fetchCurrentIndexingAnchorWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *workloop;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  workloop = self->_workloop;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __70__FPSpotlightIndexer_fetchCurrentIndexingAnchorWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E4449AB0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(workloop, v7);

}

uint64_t __70__FPSpotlightIndexer_fetchCurrentIndexingAnchorWithCompletionHandler___block_invoke(uint64_t a1)
{
  if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 136), "isUsingFPFS") & 1) == 0)
    __70__FPSpotlightIndexer_fetchCurrentIndexingAnchorWithCompletionHandler___block_invoke_cold_1();
  return objc_msgSend(*(id *)(a1 + 32), "_fetchCurrentIndexingAnchorWithCompletionHandler:", *(_QWORD *)(a1 + 40));
}

- (void)_invalidate
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8(&dword_1A0A34000, v0, v1, "[DEBUG] %@: invalidating", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)invalidate
{
  NSObject *workloop;
  _QWORD block[5];

  workloop = self->_workloop;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __32__FPSpotlightIndexer_invalidate__block_invoke;
  block[3] = &unk_1E444A308;
  block[4] = self;
  dispatch_async_and_wait(workloop, block);
}

uint64_t __32__FPSpotlightIndexer_invalidate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidate");
}

- (void)invalidateAsync
{
  NSObject *workloop;
  _QWORD block[5];

  workloop = self->_workloop;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37__FPSpotlightIndexer_invalidateAsync__block_invoke;
  block[3] = &unk_1E444A308;
  block[4] = self;
  dispatch_async(workloop, block);
}

uint64_t __37__FPSpotlightIndexer_invalidateAsync__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidate");
}

- (void)deleteSearchableItemsWithSpotlightDomainIdentifiers:(id)a3 indexReason:(int64_t)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  CSSearchableIndex *index;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a5;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  index = self->_index;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __104__FPSpotlightIndexer_deleteSearchableItemsWithSpotlightDomainIdentifiers_indexReason_completionHandler___block_invoke;
  v15[3] = &unk_1E444A610;
  v15[4] = self;
  v16 = v8;
  v17 = v10;
  v18 = v9;
  v12 = v9;
  v13 = v10;
  v14 = v8;
  -[CSSearchableIndex deleteSearchableItemsWithDomainIdentifiers:reason:completionHandler:](index, "deleteSearchableItemsWithDomainIdentifiers:reason:completionHandler:", v14, a4, v15);

}

void __104__FPSpotlightIndexer_deleteSearchableItemsWithSpotlightDomainIdentifiers_indexReason_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  id v7;
  _QWORD block[4];
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;

  v3 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[2] = __104__FPSpotlightIndexer_deleteSearchableItemsWithSpotlightDomainIdentifiers_indexReason_completionHandler___block_invoke_2;
  block[3] = &unk_1E444B110;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  v6 = *(NSObject **)(v4 + 40);
  block[1] = 3221225472;
  v9 = v3;
  v10 = v4;
  v11 = v5;
  v12 = *(id *)(a1 + 48);
  v13 = *(id *)(a1 + 56);
  v7 = v3;
  dispatch_async(v6, block);

}

uint64_t __104__FPSpotlightIndexer_deleteSearchableItemsWithSpotlightDomainIdentifiers_indexReason_completionHandler___block_invoke_2(uint64_t a1)
{
  id *v2;
  uint64_t v3;
  NSObject *v4;
  NSObject *v5;

  v2 = (id *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 32);
  fp_current_or_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __104__FPSpotlightIndexer_deleteSearchableItemsWithSpotlightDomainIdentifiers_indexReason_completionHandler___block_invoke_2_cold_2(a1, v2, v5);
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    __104__FPSpotlightIndexer_deleteSearchableItemsWithSpotlightDomainIdentifiers_indexReason_completionHandler___block_invoke_2_cold_1(a1, v5);
  }

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
}

- (void)dropIndexInQueue:(id)a3 dropReason:(unint64_t)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  OS_dispatch_workloop *workloop;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  unint64_t v16;

  v8 = a3;
  v9 = a5;
  workloop = self->_workloop;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __68__FPSpotlightIndexer_dropIndexInQueue_dropReason_completionHandler___block_invoke;
  v13[3] = &unk_1E444A9A8;
  v15 = v9;
  v16 = a4;
  v13[4] = self;
  v14 = v8;
  v11 = v8;
  v12 = v9;
  fp_dispatch_async_with_logs(workloop, v13);

}

void __68__FPSpotlightIndexer_dropIndexInQueue_dropReason_completionHandler___block_invoke(uint64_t a1)
{
  FPSpotlightDropIndexOperation *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  id WeakRetained;
  FPSpotlightDropIndexOperation *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, uint64_t, void *);
  void *v13;
  uint64_t v14;
  id v15;

  v2 = [FPSpotlightDropIndexOperation alloc];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(v3 + 32);
  objc_msgSend(*(id *)(v3 + 128), "spotlightDomainIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1 + 56);
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 160));
  v8 = -[FPSpotlightDropIndexOperation initWithIndexer:index:spotlightDomainIdentifier:dropReason:delegate:](v2, "initWithIndexer:index:spotlightDomainIdentifier:dropReason:delegate:", v3, v4, v5, v6, WeakRetained);

  -[FPOperation setCallbackQueue:](v8, "setCallbackQueue:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40));
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __68__FPSpotlightIndexer_dropIndexInQueue_dropReason_completionHandler___block_invoke_2;
  v13 = &unk_1E444B138;
  v14 = *(_QWORD *)(a1 + 32);
  v15 = *(id *)(a1 + 48);
  -[FPOperation setFinishedBlock:](v8, "setFinishedBlock:", &v10);
  v9 = *(void **)(a1 + 40);
  if (v9)
    objc_msgSend(v9, "addOperation:", v8, v10, v11, v12, v13, v14);
  else
    -[FPOperation start](v8, "start", v10, v11, v12, v13, v14);

}

void __68__FPSpotlightIndexer_dropIndexInQueue_dropReason_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;

  v4 = a3;
  if (v4)
  {
    fp_current_or_default_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __68__FPSpotlightIndexer_dropIndexInQueue_dropReason_completionHandler___block_invoke_2_cold_1();

  }
  objc_msgSend(*(id *)(a1 + 32), "clearIndexState");
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)dropIndexWithDropReason:(unint64_t)a3 completionHandler:(id)a4
{
  -[FPSpotlightIndexer dropIndexInQueue:dropReason:completionHandler:](self, "dropIndexInQueue:dropReason:completionHandler:", self->_operationQueue, a3, a4);
}

- (void)dropIndexAndInvalidateWithDropReason:(unint64_t)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v6 = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __77__FPSpotlightIndexer_dropIndexAndInvalidateWithDropReason_completionHandler___block_invoke;
  v8[3] = &unk_1E4449AF8;
  v8[4] = self;
  v9 = v6;
  v7 = v6;
  -[FPSpotlightIndexer dropIndexWithDropReason:completionHandler:](self, "dropIndexWithDropReason:completionHandler:", a3, v8);

}

void __77__FPSpotlightIndexer_dropIndexAndInvalidateWithDropReason_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "_invalidate");
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)dumpStateTo:(id)a3
{
  id v4;
  NSObject *clientStateSemaphore;
  dispatch_time_t v6;
  intptr_t v7;
  dispatch_semaphore_t v8;
  NSObject *workloop;
  uint64_t v10;
  NSObject *v11;
  dispatch_time_t v12;
  intptr_t v13;
  NSObject *v14;
  id v15;
  _QWORD v16[4];
  id v17;
  FPSpotlightIndexer *v18;
  _QWORD *v19;
  intptr_t v20;
  _QWORD block[5];
  dispatch_semaphore_t v22;
  _QWORD *v23;
  _QWORD v24[5];
  id v25;

  v4 = a3;
  if (self->_clientState == 2)
  {
    clientStateSemaphore = self->_clientStateSemaphore;
    v6 = dispatch_time(0, 5000000000);
    v7 = dispatch_semaphore_wait(clientStateSemaphore, v6);
  }
  else
  {
    v7 = 0;
  }
  v8 = dispatch_semaphore_create(0);
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x3032000000;
  v24[3] = __Block_byref_object_copy__2;
  v24[4] = __Block_byref_object_dispose__2;
  v25 = 0;
  workloop = self->_workloop;
  v10 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __34__FPSpotlightIndexer_dumpStateTo___block_invoke;
  block[3] = &unk_1E4449B20;
  v22 = v8;
  v23 = v24;
  block[4] = self;
  v11 = v8;
  dispatch_async(workloop, block);
  v12 = dispatch_time(0, 5000000000);
  v13 = dispatch_semaphore_wait(v11, v12);
  v14 = self->_workloop;
  v16[0] = v10;
  v16[1] = 3221225472;
  v16[2] = __34__FPSpotlightIndexer_dumpStateTo___block_invoke_3;
  v16[3] = &unk_1E444ABE8;
  v19 = v24;
  v20 = v13 | v7;
  v17 = v4;
  v18 = self;
  v15 = v4;
  dispatch_async_and_wait(v14, v16);

  _Block_object_dispose(v24, 8);
}

void __34__FPSpotlightIndexer_dumpStateTo___block_invoke(uint64_t a1)
{
  uint64_t v2;
  FPSpotlightFetchClientStateOperation *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  FPSpotlightFetchClientStateOperation *v8;
  id v9;
  __int128 v10;
  _QWORD v11[4];
  __int128 v12;

  v2 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v2 + 72) == 3)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), *(id *)(v2 + 64));
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
  }
  else
  {
    v3 = [FPSpotlightFetchClientStateOperation alloc];
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(_QWORD *)(v4 + 32);
    v6 = *(_QWORD *)(v4 + 8);
    objc_msgSend(*(id *)(v4 + 128), "spotlightDomainIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[FPSpotlightFetchClientStateOperation initWithIndexer:index:indexName:spotlightDomainIdentifier:reason:supportURL:](v3, "initWithIndexer:index:indexName:spotlightDomainIdentifier:reason:supportURL:", v4, v5, v6, v7, CFSTR("dumping state"), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 112));

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "addOperation:", v8);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __34__FPSpotlightIndexer_dumpStateTo___block_invoke_2;
    v11[3] = &unk_1E444B160;
    v10 = *(_OWORD *)(a1 + 40);
    v9 = (id)v10;
    v12 = v10;
    -[FPOperation setFinishedBlock:](v8, "setFinishedBlock:", v11);

  }
}

void __34__FPSpotlightIndexer_dumpStateTo___block_invoke_2(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

void __34__FPSpotlightIndexer_dumpStateTo___block_invoke_3(_QWORD *a1)
{
  __CFString *v2;
  void *v3;
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  id v9;

  if (*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40))
  {
    v2 = 0;
  }
  else if (a1[7])
  {
    v2 = CFSTR("timed out while fetching token");
  }
  else
  {
    v2 = CFSTR("none");
  }
  v3 = (void *)a1[4];
  -[__CFString description](v2, "description");
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v5 = objc_msgSend(v4, "UTF8String");
  if (v5)
  {
    objc_msgSend(v3, "write:", CFSTR("    change token: %s\n"), v5);
  }
  else
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "description");
    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v3, "write:", CFSTR("    change token: %s\n"), objc_msgSend(v6, "UTF8String"));

  }
  v7 = (void *)a1[4];
  objc_msgSend(*(id *)(a1[5] + 48), "operations");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "description");
  v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v7, "write:", CFSTR("    operation: %s\n"), objc_msgSend(v8, "UTF8String"));

}

+ (void)setIndexerProperty:(id)a3 forKey:(id)a4 supportURL:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  char v20;
  id v21;
  NSObject *v22;
  void *v23;
  id v24;
  uint8_t buf[4];
  id v26;
  __int16 v27;
  id v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("FPSpotlightIndexer.m"), 764, CFSTR("nil key"));

  }
  objc_msgSend(v11, "URLByAppendingPathComponent:isDirectory:", CFSTR("Indexer.plist"), 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = a1;
  objc_sync_enter(v13);
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfURL:", v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKey:", v10);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v9, "isEqual:", v15) & 1) == 0)
  {
    v16 = (void *)objc_msgSend(v14, "mutableCopy");
    v17 = v16;
    if (v16)
      v18 = v16;
    else
      v18 = (id)objc_opt_new();
    v19 = v18;

    objc_msgSend(v19, "setValue:forKey:", v9, v10);
    v24 = 0;
    v20 = objc_msgSend(v19, "writeToURL:error:", v12, &v24);
    v21 = v24;
    if ((v20 & 1) == 0)
    {
      fp_current_or_default_log();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412802;
        v26 = v10;
        v27 = 2112;
        v28 = v9;
        v29 = 2112;
        v30 = v21;
        _os_log_impl(&dword_1A0A34000, v22, OS_LOG_TYPE_DEFAULT, "[WARNING] Failed to store indexer value (%@) %@: %@", buf, 0x20u);
      }

    }
  }

  objc_sync_exit(v13);
}

+ (id)indexerPropertyOfClass:(Class)a3 forKey:(id)a4 supportURL:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v7 = a4;
  v8 = a5;
  v9 = a1;
  objc_sync_enter(v9);
  v10 = (void *)MEMORY[0x1E0C99D80];
  objc_msgSend(v8, "URLByAppendingPathComponent:isDirectory:", CFSTR("Indexer.plist"), 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "dictionaryWithContentsOfURL:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v9);
  objc_msgSend(v12, "objectForKey:", v7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v14 = v13;
  else
    v14 = 0;

  return v14;
}

- (NSFileProviderEnumerator)vendorEnumerator
{
  return (NSFileProviderEnumerator *)objc_getProperty(self, a2, 96, 1);
}

- (NSFileProviderDomain)domain
{
  return self->_domain;
}

- (void)setDomain:(id)a3
{
  objc_storeStrong((id *)&self->_domain, a3);
}

- (FPProviderDomain)providerDomain
{
  return self->_providerDomain;
}

- (void)setProviderDomain:(id)a3
{
  objc_storeStrong((id *)&self->_providerDomain, a3);
}

- (OS_os_log)log
{
  return self->_log;
}

- (FPXDomainContext)domainContext
{
  return (FPXDomainContext *)objc_loadWeakRetained((id *)&self->_domainContext);
}

- (void)setDomainContext:(id)a3
{
  objc_storeWeak((id *)&self->_domainContext, a3);
}

- (FPSpotlightDropIndexDelegate)dropIndexDelegate
{
  return (FPSpotlightDropIndexDelegate *)objc_loadWeakRetained((id *)&self->_dropIndexDelegate);
}

- (OS_dispatch_workloop)workloop
{
  return self->_workloop;
}

- (CSSearchableIndex)index
{
  return self->_index;
}

- (NSData)lastIndexState
{
  return self->_lastIndexState;
}

- (BOOL)isIndexing
{
  return self->_indexing;
}

- (void)setIndexing:(BOOL)a3
{
  self->_indexing = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_dropIndexDelegate);
  objc_destroyWeak((id *)&self->_domainContext);
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_providerDomain, 0);
  objc_storeStrong((id *)&self->_domain, 0);
  objc_storeStrong((id *)&self->_supportURL, 0);
  objc_storeStrong((id *)&self->_clientStateSemaphore, 0);
  objc_storeStrong((id *)&self->_vendorEnumerator, 0);
  objc_storeStrong((id *)&self->_fetchStateOperation, 0);
  objc_storeStrong((id *)&self->_lastIndexState, 0);
  objc_storeStrong((id *)&self->_currentOperation, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_workloop, 0);
  objc_storeStrong((id *)&self->_index, 0);
  objc_storeStrong((id *)&self->_providerIdentifier, 0);
  objc_storeStrong((id *)&self->_domainID, 0);
  objc_storeStrong((id *)&self->_indexName, 0);
}

- (void)learnNewIndexState:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_5(&dword_1A0A34000, v0, v1, "[DEBUG] %@: Learning change token %@");
  OUTLINED_FUNCTION_3();
}

- (void)_fetchClientStateIfNeeded
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_2(&dword_1A0A34000, v0, v1, "[ERROR] won't restore persona: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)_indexOneBatchWithCompletionHandler:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_39();
  OUTLINED_FUNCTION_0_5(&dword_1A0A34000, v0, v1, "[DEBUG] scheduling %@ on %@");
  OUTLINED_FUNCTION_3();
}

- (void)_indexOneBatchWithCompletionHandler:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6_2(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_39();
  OUTLINED_FUNCTION_0_5(&dword_1A0A34000, v0, v1, "[DEBUG] scheduling %@ on %@");
  OUTLINED_FUNCTION_3();
}

- (void)_indexOneBatchWithCompletionHandler:(os_log_t)log .cold.4(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412290;
  *(_QWORD *)(buf + 4) = a1;
  _os_log_error_impl(&dword_1A0A34000, log, OS_LOG_TYPE_ERROR, "[ERROR] can't create vendor enumerator: %@", buf, 0xCu);

}

void __58__FPSpotlightIndexer__indexOneBatchWithCompletionHandler___block_invoke_3_cold_1()
{
  __assert_rtn("-[FPSpotlightIndexer _indexOneBatchWithCompletionHandler:]_block_invoke_3", "FPSpotlightIndexer.m", 339, "strongFetchOperation");
}

void __57__FPSpotlightIndexer_indexOneBatchWithCompletionHandler___block_invoke_cold_1()
{
  __assert_rtn("-[FPSpotlightIndexer indexOneBatchWithCompletionHandler:]_block_invoke", "FPSpotlightIndexer.m", 368, "!self->_providerDomain.useFPFS");
}

void __100__FPSpotlightIndexer__indexOneBatchFromAnchor_toAnchor_updatedItems_deletedItems_completionHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_31();
  OUTLINED_FUNCTION_37(&dword_1A0A34000, v0, v1, "[ERROR] [spotlight] CS lost the indexation state, forcing a new indexing from scratch", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_30();
}

void __100__FPSpotlightIndexer__indexOneBatchFromAnchor_toAnchor_updatedItems_deletedItems_completionHandler___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_31();
  OUTLINED_FUNCTION_37(&dword_1A0A34000, v0, v1, "[ERROR] [spotlight] CS indexing state is invalid, forcing a new indexing from scratch", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_30();
}

void __100__FPSpotlightIndexer__indexOneBatchFromAnchor_toAnchor_updatedItems_deletedItems_completionHandler___block_invoke_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_31();
  OUTLINED_FUNCTION_0(&dword_1A0A34000, v0, v1, "[DEBUG] [spotlight] CS state seems to be more advanced than FPFS", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_30();
}

void __100__FPSpotlightIndexer__indexOneBatchFromAnchor_toAnchor_updatedItems_deletedItems_completionHandler___block_invoke_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_31();
  OUTLINED_FUNCTION_37(&dword_1A0A34000, v0, v1, "[ERROR] [spotlight] CS indexing don't match FPFS state, forcing a new indexing from scratch", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_30();
}

void __100__FPSpotlightIndexer__indexOneBatchFromAnchor_toAnchor_updatedItems_deletedItems_completionHandler___block_invoke_cold_6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_31();
  OUTLINED_FUNCTION_37(&dword_1A0A34000, v0, v1, "[ERROR] [spotlight] CS indexing state does not match FPFS state", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_30();
}

void __99__FPSpotlightIndexer_indexOneBatchFromAnchor_toAnchor_updatedItems_deletedItems_completionHandler___block_invoke_cold_1()
{
  __assert_rtn("-[FPSpotlightIndexer indexOneBatchFromAnchor:toAnchor:updatedItems:deletedItems:completionHandler:]_block_invoke", "FPSpotlightIndexer.m", 514, "self->_providerDomain.useFPFS");
}

void __93__FPSpotlightIndexer__indexOutOfBandUpdatedItems_deletedItems_indexReason_completionHandler___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  int v6;
  int v7;
  _DWORD v8[2];
  __int16 v9;
  int v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v6 = objc_msgSend(*(id *)(a1 + 32), "count");
  v7 = objc_msgSend(*(id *)(a1 + 40), "count");
  v8[0] = 67109634;
  v8[1] = v6;
  v9 = 1024;
  v10 = v7;
  v11 = 2112;
  v12 = a2;
  _os_log_debug_impl(&dword_1A0A34000, a3, OS_LOG_TYPE_DEBUG, "[DEBUG] out-of-band indexing of (%u updates, %u deletions, completed with error %@", (uint8_t *)v8, 0x18u);
}

void __70__FPSpotlightIndexer_fetchCurrentIndexingAnchorWithCompletionHandler___block_invoke_cold_1()
{
  __assert_rtn("-[FPSpotlightIndexer fetchCurrentIndexingAnchorWithCompletionHandler:]_block_invoke", "FPSpotlightIndexer.m", 624, "self->_providerDomain.useFPFS");
}

void __104__FPSpotlightIndexer_deleteSearchableItemsWithSpotlightDomainIdentifiers_indexReason_completionHandler___block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v3;
  uint64_t v4;
  double v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  __int16 v10;
  double v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 56), "timeIntervalSinceNow");
  v6 = 138412802;
  v7 = v3;
  v8 = 2112;
  v9 = v4;
  v10 = 2048;
  v11 = -v5;
  _os_log_debug_impl(&dword_1A0A34000, a2, OS_LOG_TYPE_DEBUG, "[DEBUG] [spotlight] %@: deleted searchable items with domain identifiers %@ in %.3fs", (uint8_t *)&v6, 0x20u);
}

void __104__FPSpotlightIndexer_deleteSearchableItemsWithSpotlightDomainIdentifiers_indexReason_completionHandler___block_invoke_2_cold_2(uint64_t a1, id *a2, NSObject *a3)
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  double v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  double v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = *(_QWORD *)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*a2, "fp_prettyDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 56), "timeIntervalSinceNow");
  v9 = 138413058;
  v10 = v5;
  v11 = 2112;
  v12 = v6;
  v13 = 2112;
  v14 = v7;
  v15 = 2048;
  v16 = -v8;
  _os_log_error_impl(&dword_1A0A34000, a3, OS_LOG_TYPE_ERROR, "[ERROR] [spotlight] %@: failed deleting searchable items with domain identifiers %@: %@ in %.3fs", (uint8_t *)&v9, 0x2Au);

}

void __68__FPSpotlightIndexer_dropIndexInQueue_dropReason_completionHandler___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_2(&dword_1A0A34000, v0, v1, "[ERROR] can't drop spotlight index: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

@end
