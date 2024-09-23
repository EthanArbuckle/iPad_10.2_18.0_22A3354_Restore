@implementation FPSpotlightFetchClientStateOperation

- (FPSpotlightFetchClientStateOperation)initWithIndexer:(id)a3 index:(id)a4 indexName:(id)a5 spotlightDomainIdentifier:(id)a6 reason:(id)a7 supportURL:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  FPSpotlightFetchClientStateOperation *v18;
  FPSpotlightFetchClientStateOperation *v19;
  id v21;
  id v22;
  objc_super v23;

  v14 = a3;
  v22 = a4;
  v21 = a5;
  v15 = a6;
  v16 = a7;
  v17 = a8;
  v23.receiver = self;
  v23.super_class = (Class)FPSpotlightFetchClientStateOperation;
  v18 = -[FPOperation init](&v23, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeWeak((id *)&v18->_indexer, v14);
    objc_storeStrong((id *)&v19->_index, a4);
    objc_storeStrong((id *)&v19->_indexName, a5);
    objc_storeStrong((id *)&v19->_spotlightDomainIdentifier, a6);
    objc_storeStrong((id *)&v19->_supportURL, a8);
    objc_storeStrong((id *)&v19->_reason, a7);
  }

  return v19;
}

- (id)operationDescription
{
  return self->_reason;
}

+ (id)_currentIndexerVersion
{
  return CFSTR("7");
}

- (id)_clientStateCurrentVersionIfNeedReset
{
  uint64_t v3;
  void *v4;
  NSObject *v5;
  _BOOL4 v6;
  NSString *indexName;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  NSString *v12;
  NSString *v13;
  int v15;
  const __CFString *v16;
  __int16 v17;
  NSString *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (self->_supportURL)
  {
    +[FPSpotlightIndexer indexerPropertyOfClass:forKey:supportURL:](FPSpotlightIndexer, "indexerPropertyOfClass:forKey:supportURL:", objc_opt_class(), CFSTR("com.apple.fileproviderd.spotlight-indexer-current-version"), self->_supportURL);
    v3 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = (uint64_t)CFPreferencesCopyAppValue(CFSTR("com.apple.fileproviderd.spotlight-indexer-current-version"), (CFStringRef)self->_indexName);
  }
  v4 = (void *)v3;
  fp_current_or_default_log();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_INFO);
  if (v4)
  {
    if (v6)
    {
      indexName = self->_indexName;
      objc_msgSend((id)objc_opt_class(), "_currentIndexerVersion");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138413058;
      v16 = CFSTR("com.apple.fileproviderd.spotlight-indexer-current-version");
      v17 = 2112;
      v18 = indexName;
      v19 = 2112;
      v20 = v4;
      v21 = 2112;
      v22 = v8;
      _os_log_impl(&dword_1A0A34000, v5, OS_LOG_TYPE_INFO, "[INFO] Fetched indexer version (%@ %@) %@ (current: %@)", (uint8_t *)&v15, 0x2Au);

    }
    objc_msgSend((id)objc_opt_class(), "_currentIndexerVersion");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v4, "isEqualToString:", v9);

    if ((v10 & 1) != 0)
    {
      v11 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v4, "integerValue"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    if (v6)
    {
      v12 = self->_indexName;
      objc_msgSend((id)objc_opt_class(), "_currentIndexerVersion");
      v13 = (NSString *)objc_claimAutoreleasedReturnValue();
      v15 = 138412546;
      v16 = (const __CFString *)v12;
      v17 = 2112;
      v18 = v13;
      _os_log_impl(&dword_1A0A34000, v5, OS_LOG_TYPE_INFO, "[INFO] Failed to fetch indexer version for index %@ (current: %@)", (uint8_t *)&v15, 0x16u);

    }
    v11 = &unk_1E448E950;
  }

  return v11;
}

- (void)_markClientStateResetDone
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  OUTLINED_FUNCTION_41(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_28();
  OUTLINED_FUNCTION_14(&dword_1A0A34000, v0, v1, "[ERROR] failed to synchronize user defaults for %@", v2);
  OUTLINED_FUNCTION_3();
}

- (void)_handleFetchedClientState:(id)a3 error:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  char v15;
  uint64_t v16;
  NSObject *v17;
  _BOOL4 v18;
  FPSpotlightFetchClientStateOperation *v19;
  id v20;
  void *v21;
  NSString *spotlightDomainIdentifier;
  CSSearchableIndex *index;
  id WeakRetained;
  void *v25;
  void *v26;
  _QWORD v27[4];
  id v28;
  FPSpotlightFetchClientStateOperation *v29;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (!v8)
  {
    v19 = self;
    v20 = v7;
    v21 = 0;
LABEL_10:
    -[FPOperation completedWithResult:error:](v19, "completedWithResult:error:", v20, v21);
    goto LABEL_14;
  }
  objc_msgSend(v8, "domain");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  getCSIndexErrorDomain();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v10, "isEqualToString:", v11);

  if ((v12 & 1) == 0)
  {
    objc_msgSend(v9, "domain");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    getCSIndexErrorDomain();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v13, "isEqualToString:", v14);

    if ((v15 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("FPSpotlightFetchClientStateOperation.m"), 127, CFSTR("unexpected error"));

    }
  }
  v16 = objc_msgSend(v9, "code");
  fp_current_or_default_log();
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = os_log_type_enabled(v17, OS_LOG_TYPE_ERROR);
  if (v16 == -1003)
  {
    if (v18)
      -[FPSpotlightFetchClientStateOperation _handleFetchedClientState:error:].cold.1(v9, v17);

    v19 = self;
    v20 = 0;
    v21 = v9;
    goto LABEL_10;
  }
  if (v18)
    -[FPSpotlightFetchClientStateOperation _handleFetchedClientState:error:].cold.2(v9, v17);

  spotlightDomainIdentifier = self->_spotlightDomainIdentifier;
  index = self->_index;
  WeakRetained = objc_loadWeakRetained((id *)&self->_indexer);
  objc_msgSend(WeakRetained, "dropIndexDelegate");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __72__FPSpotlightFetchClientStateOperation__handleFetchedClientState_error___block_invoke;
  v27[3] = &unk_1E444DE20;
  v28 = v9;
  v29 = self;
  +[FPSpotlightDropIndexOperation deleteSearchableItemsAndClearClientStateWithDomainIdentifier:index:dropReason:delegate:completionHandler:](FPSpotlightDropIndexOperation, "deleteSearchableItemsAndClearClientStateWithDomainIdentifier:index:dropReason:delegate:completionHandler:", spotlightDomainIdentifier, index, 7, v25, v27);

LABEL_14:
}

void __72__FPSpotlightFetchClientStateOperation__handleFetchedClientState_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  if (*(_QWORD *)(a1 + 32))
  {
    fp_current_or_default_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __72__FPSpotlightFetchClientStateOperation__handleFetchedClientState_error___block_invoke_cold_1((id *)(a1 + 32), v4);

  }
  objc_msgSend(*(id *)(a1 + 40), "completedWithResult:error:", 0, v3);

}

- (void)_fetchClientState
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6_6();
  OUTLINED_FUNCTION_0_5(&dword_1A0A34000, v0, v1, "[DEBUG] ┣%llx %@: fetching client state");
  OUTLINED_FUNCTION_3();
}

void __57__FPSpotlightFetchClientStateOperation__fetchClientState__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id WeakRetained;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  id v18;
  id v19;
  NSObject *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  NSObject *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  double v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  id v38;
  void *v39;
  id v40;
  id v41;
  uint8_t buf[4];
  id v43;
  __int16 v44;
  void *v45;
  __int16 v46;
  double v47;
  __int16 v48;
  void *v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v38 = a2;
  v36 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 304));
  objc_msgSend(WeakRetained, "log");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = fpfs_adopt_log(v6);

  objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "currentPersona");
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  v41 = 0;
  objc_msgSend(v37, "userPersonaUniqueString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 304));
  objc_msgSend(v10, "domain");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "personaIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9 == v12)
  {

LABEL_13:
    v24 = 0;
    goto LABEL_14;
  }
  v13 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 304));
  objc_msgSend(v13, "domain");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "personaIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v9, "isEqualToString:", v15);

  if ((v16 & 1) != 0 || !voucher_process_can_use_arbitrary_personas())
    goto LABEL_13;
  v40 = 0;
  v17 = (void *)objc_msgSend(v37, "copyCurrentPersonaContextWithError:", &v40);
  v18 = v40;
  v19 = v41;
  v41 = v17;

  if (v18)
  {
    fp_current_or_default_log();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      __57__FPSpotlightFetchClientStateOperation__fetchClientState__block_invoke_cold_1();

  }
  v21 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 304));
  objc_msgSend(v21, "domain");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "personaIdentifier");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "generateAndRestorePersonaContextWithPersonaUniqueString:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    fp_current_or_default_log();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      v33 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 304));
      objc_msgSend(v33, "domain");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "personaIdentifier");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v43 = v35;
      v44 = 2112;
      v45 = v24;
      _os_log_error_impl(&dword_1A0A34000, v25, OS_LOG_TYPE_ERROR, "[ERROR] Can't adopt persona %@: %@", buf, 0x16u);

    }
  }
LABEL_14:
  v39 = *(void **)(a1 + 48);
  fp_current_or_default_log();
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
  {
    v31 = *(void **)(a1 + 32);
    objc_msgSend(v36, "fp_prettyDescription");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218754;
    v43 = v39;
    v44 = 2112;
    v45 = v31;
    v46 = 2112;
    v47 = *(double *)&v38;
    v48 = 2112;
    v49 = v32;
    _os_log_debug_impl(&dword_1A0A34000, v26, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx %@: received spotlight client state %@, error: %@", buf, 0x2Au);

  }
  fp_current_or_default_log();
  v27 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    v28 = *(void **)(*(_QWORD *)(a1 + 32) + 336);
    objc_msgSend(*(id *)(a1 + 40), "timeIntervalSinceNow");
    v29 = *(void **)(*(_QWORD *)(a1 + 32) + 312);
    *(_DWORD *)buf = 138413058;
    v43 = v38;
    v44 = 2112;
    v45 = v28;
    v46 = 2048;
    v47 = -v30;
    v48 = 2112;
    v49 = v29;
    _os_log_impl(&dword_1A0A34000, v27, OS_LOG_TYPE_DEFAULT, "[NOTICE] [spotlight] fetched last stored state is:%@ (fetched because \"%@\") in %.3fs (in %@)", buf, 0x2Au);
  }

  objc_msgSend(*(id *)(a1 + 32), "_handleFetchedClientState:error:", v38, v36);
  __fp_leave_section_Debug((uint64_t)&v39);

  _FPRestorePersona(&v41);
}

- (void)main
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6_6();
  OUTLINED_FUNCTION_0_5(&dword_1A0A34000, v0, v1, "[DEBUG] ┣%llx %@: fetching client state if needed");
  OUTLINED_FUNCTION_3();
}

void __44__FPSpotlightFetchClientStateOperation_main__block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  id v16;
  id v17;
  NSObject *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  NSObject *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  _QWORD v36[5];
  id v37;
  uint64_t v38;
  uint64_t v39;
  id v40;
  id v41;
  uint8_t buf[4];
  void *v43;
  __int16 v44;
  void *v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v35 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 304));
  objc_msgSend(WeakRetained, "log");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = fpfs_adopt_log(v4);

  objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "currentPersona");
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  v41 = 0;
  objc_msgSend(v34, "userPersonaUniqueString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 304));
  objc_msgSend(v8, "domain");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "personaIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 == v10)
  {

LABEL_13:
    v22 = 0;
    goto LABEL_14;
  }
  v11 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 304));
  objc_msgSend(v11, "domain");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "personaIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v7, "isEqualToString:", v13);

  if ((v14 & 1) != 0 || !voucher_process_can_use_arbitrary_personas())
    goto LABEL_13;
  v40 = 0;
  v15 = (void *)objc_msgSend(v34, "copyCurrentPersonaContextWithError:", &v40);
  v16 = v40;
  v17 = v41;
  v41 = v15;

  if (v16)
  {
    fp_current_or_default_log();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      __57__FPSpotlightFetchClientStateOperation__fetchClientState__block_invoke_cold_1();

  }
  v19 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 304));
  objc_msgSend(v19, "domain");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "personaIdentifier");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "generateAndRestorePersonaContextWithPersonaUniqueString:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    fp_current_or_default_log();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      v31 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 304));
      objc_msgSend(v31, "domain");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "personaIdentifier");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v43 = v33;
      v44 = 2112;
      v45 = v22;
      _os_log_error_impl(&dword_1A0A34000, v23, OS_LOG_TYPE_ERROR, "[ERROR] Can't adopt persona %@: %@", buf, 0x16u);

    }
  }
LABEL_14:
  v39 = *(_QWORD *)(a1 + 40);
  fp_current_or_default_log();
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
    __44__FPSpotlightFetchClientStateOperation_main__block_invoke_cold_2();

  if (v35)
  {
    fp_current_or_default_log();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v35, "fp_prettyDescription");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      __44__FPSpotlightFetchClientStateOperation_main__block_invoke_cold_1(v26, (uint64_t)buf, v25);
    }

    objc_msgSend(*(id *)(a1 + 32), "completedWithResult:error:", 0, v35);
  }
  else
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 312), "beginIndexBatch");
    v27 = *(void **)(*(_QWORD *)(a1 + 32) + 312);
    objc_msgSend(MEMORY[0x1E0C99D50], "data");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v36[0] = MEMORY[0x1E0C809B0];
    v36[1] = 3221225472;
    v36[2] = __44__FPSpotlightFetchClientStateOperation_main__block_invoke_15;
    v36[3] = &unk_1E444DDF8;
    v29 = *(_QWORD *)(a1 + 32);
    v30 = *(_QWORD *)(a1 + 40);
    v37 = 0;
    v38 = v30;
    v36[4] = v29;
    objc_msgSend(v27, "endIndexBatchWithClientState:completionHandler:", v28, v36);

  }
  __fp_leave_section_Debug((uint64_t)&v39);

  _FPRestorePersona(&v41);
}

void __44__FPSpotlightFetchClientStateOperation_main__block_invoke_15(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  id v16;
  id v17;
  NSObject *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  NSObject *v24;
  NSObject *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  uint64_t v32;
  id v33;
  id v34;
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v30 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 304));
  objc_msgSend(WeakRetained, "log");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = fpfs_adopt_log(v4);

  objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "currentPersona");
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  v34 = 0;
  objc_msgSend(v31, "userPersonaUniqueString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 304));
  objc_msgSend(v8, "domain");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "personaIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 == v10)
  {

LABEL_13:
    v22 = 0;
    goto LABEL_14;
  }
  v11 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 304));
  objc_msgSend(v11, "domain");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "personaIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v7, "isEqualToString:", v13);

  if ((v14 & 1) != 0 || !voucher_process_can_use_arbitrary_personas())
    goto LABEL_13;
  v33 = 0;
  v15 = (void *)objc_msgSend(v31, "copyCurrentPersonaContextWithError:", &v33);
  v16 = v33;
  v17 = v34;
  v34 = v15;

  if (v16)
  {
    fp_current_or_default_log();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      __57__FPSpotlightFetchClientStateOperation__fetchClientState__block_invoke_cold_1();

  }
  v19 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 304));
  objc_msgSend(v19, "domain");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "personaIdentifier");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "generateAndRestorePersonaContextWithPersonaUniqueString:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    fp_current_or_default_log();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      v27 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 304));
      objc_msgSend(v27, "domain");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "personaIdentifier");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v36 = v29;
      v37 = 2112;
      v38 = v22;
      _os_log_error_impl(&dword_1A0A34000, v23, OS_LOG_TYPE_ERROR, "[ERROR] Can't adopt persona %@: %@", buf, 0x16u);

    }
  }
LABEL_14:
  v32 = *(_QWORD *)(a1 + 48);
  fp_current_or_default_log();
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
    __44__FPSpotlightFetchClientStateOperation_main__block_invoke_15_cold_2();

  if (v30)
  {
    fp_current_or_default_log();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 40), "fp_prettyDescription");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      __44__FPSpotlightFetchClientStateOperation_main__block_invoke_15_cold_1(v26, (uint64_t)buf, v25);
    }

    objc_msgSend(*(id *)(a1 + 32), "completedWithResult:error:", 0, *(_QWORD *)(a1 + 40));
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_markClientStateResetDone");
    objc_msgSend(*(id *)(a1 + 32), "_fetchClientState");
  }
  __fp_leave_section_Debug((uint64_t)&v32);

  _FPRestorePersona(&v34);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supportURL, 0);
  objc_storeStrong((id *)&self->_reason, 0);
  objc_storeStrong((id *)&self->_spotlightDomainIdentifier, 0);
  objc_storeStrong((id *)&self->_indexName, 0);
  objc_storeStrong((id *)&self->_index, 0);
  objc_destroyWeak((id *)&self->_indexer);
}

- (void)_handleFetchedClientState:(void *)a1 error:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "fp_prettyDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_14(&dword_1A0A34000, a2, v4, "[ERROR] failed fetching client state with xpc error (%@), retrying later.", v5);

  OUTLINED_FUNCTION_6_1();
}

- (void)_handleFetchedClientState:(void *)a1 error:(NSObject *)a2 .cold.2(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "fp_prettyDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_14(&dword_1A0A34000, a2, v4, "[ERROR] failed fetching client state, Starting index from scratch: %@", v5);

  OUTLINED_FUNCTION_6_1();
}

void __72__FPSpotlightFetchClientStateOperation__handleFetchedClientState_error___block_invoke_cold_1(id *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*a1, "fp_prettyDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_14(&dword_1A0A34000, a2, v4, "[ERROR] can't drop spotlight index: %@", v5);

  OUTLINED_FUNCTION_6_1();
}

void __57__FPSpotlightFetchClientStateOperation__fetchClientState__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_14(&dword_1A0A34000, v0, v1, "[ERROR] won't restore persona: %@", v2);
  OUTLINED_FUNCTION_3();
}

void __44__FPSpotlightFetchClientStateOperation_main__block_invoke_cold_1(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138412290;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_14(&dword_1A0A34000, a3, (uint64_t)a3, "[ERROR] failed to delete all fileproviderd searchable items: %@", (uint8_t *)a2);

}

void __44__FPSpotlightFetchClientStateOperation_main__block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_41(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_28();
  OUTLINED_FUNCTION_8(&dword_1A0A34000, v0, v1, "[DEBUG] ┳%llx done resetting index", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __44__FPSpotlightFetchClientStateOperation_main__block_invoke_15_cold_1(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138412290;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_14(&dword_1A0A34000, a3, (uint64_t)a3, "[ERROR] failed to reset client state: %@", (uint8_t *)a2);

}

void __44__FPSpotlightFetchClientStateOperation_main__block_invoke_15_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_41(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_28();
  OUTLINED_FUNCTION_8(&dword_1A0A34000, v0, v1, "[DEBUG] ┳%llx done resetting client state", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

@end
