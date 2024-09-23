@implementation FPSpotlightFetchOneBatchFromWorkingSetOperation

- (FPSpotlightFetchOneBatchFromWorkingSetOperation)initWithIndexer:(id)a3 queue:(id)a4
{
  id v6;
  id v7;
  FPSpotlightFetchOneBatchFromWorkingSetOperation *v8;
  FPSpotlightFetchOneBatchFromWorkingSetOperation *v9;
  void *v10;
  id WeakRetained;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)FPSpotlightFetchOneBatchFromWorkingSetOperation;
  v8 = -[FPOperation init](&v13, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_indexer, v6);
    objc_msgSend(v6, "domainContext");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)&v9->_domainContext, v10);

    WeakRetained = objc_loadWeakRetained((id *)&v9->_domainContext);
    if (!WeakRetained)
      -[FPSpotlightFetchOneBatchFromWorkingSetOperation initWithIndexer:queue:].cold.1();

    -[FPOperation setCallbackQueue:](v9, "setCallbackQueue:", v7);
  }

  return v9;
}

- (id)observerItemID
{
  FPItemID *v3;
  id WeakRetained;
  void *v5;
  void *v6;
  FPItemID *v7;

  v3 = [FPItemID alloc];
  WeakRetained = objc_loadWeakRetained((id *)&self->_indexer);
  objc_msgSend(WeakRetained, "providerDomain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[FPItemID initWithProviderDomainID:itemIdentifier:](v3, "initWithProviderDomainID:itemIdentifier:", v6, CFSTR("NSFileProviderWorkingSetContainerItemIdentifier"));

  return v7;
}

- (void)handleInsertedItems:(id)a3 deletedItems:(id)a4 needsMoreWork:(BOOL)a5 state:(id)a6 error:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id WeakRetained;
  NSObject *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  _QWORD v22[5];
  id v23;
  id v24;
  id v25;
  id v26;
  BOOL v27;

  v12 = a3;
  v13 = a4;
  v14 = a6;
  v15 = a7;
  WeakRetained = objc_loadWeakRetained((id *)&self->_indexer);
  objc_msgSend(WeakRetained, "workloop");
  v17 = objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __110__FPSpotlightFetchOneBatchFromWorkingSetOperation_handleInsertedItems_deletedItems_needsMoreWork_state_error___block_invoke;
  v22[3] = &unk_1E444DF18;
  v22[4] = self;
  v23 = v12;
  v24 = v13;
  v25 = v14;
  v27 = a5;
  v26 = v15;
  v18 = v15;
  v19 = v14;
  v20 = v13;
  v21 = v12;
  dispatch_async(v17, v22);

}

uint64_t __110__FPSpotlightFetchOneBatchFromWorkingSetOperation_handleInsertedItems_deletedItems_needsMoreWork_state_error___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 336), *(id *)(a1 + 40));
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 344), *(id *)(a1 + 48));
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 352), *(id *)(a1 + 56));
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 328) = *(_BYTE *)(a1 + 72);
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 360), *(id *)(a1 + 64));
  return objc_msgSend(*(id *)(a1 + 32), "completedWithResult:error:", 0, *(_QWORD *)(a1 + 64));
}

- (void)_indexOnePageFromPage:(id)a3
{
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
  id v22;
  void *v23;
  id v24;
  id v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  _QWORD v30[5];
  id v31;
  id v32;
  id v33;
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v28 = a3;
  objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentPersona");
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  v33 = 0;
  objc_msgSend(v29, "userPersonaUniqueString");
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
  v32 = 0;
  v13 = (void *)objc_msgSend(v29, "copyCurrentPersonaContextWithError:", &v32);
  v14 = v32;
  v15 = v33;
  v33 = v13;

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
  objc_msgSend(v29, "generateAndRestorePersonaContextWithPersonaUniqueString:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    fp_current_or_default_log();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      v25 = objc_loadWeakRetained((id *)&self->_domainContext);
      objc_msgSend(v25, "domain");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "personaIdentifier");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v35 = v27;
      v36 = 2112;
      v37 = v20;
      _os_log_error_impl(&dword_1A0A34000, v21, OS_LOG_TYPE_ERROR, "[ERROR] Can't adopt persona %@: %@", buf, 0x16u);

    }
  }
LABEL_14:
  v22 = objc_loadWeakRetained((id *)&self->_indexer);
  objc_msgSend(v22, "vendorEnumerator");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __73__FPSpotlightFetchOneBatchFromWorkingSetOperation__indexOnePageFromPage___block_invoke;
  v30[3] = &unk_1E444DF68;
  v30[4] = self;
  v24 = v28;
  v31 = v24;
  objc_msgSend(v23, "currentSyncAnchorWithCompletionHandler:", v30);

  _FPRestorePersona(&v33);
}

void __73__FPSpotlightFetchOneBatchFromWorkingSetOperation__indexOnePageFromPage___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  NSObject *v6;
  FPXItemsObserver *v7;
  void *v8;
  id WeakRetained;
  FPXItemsObserver *v10;
  id v11;
  uint64_t v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  uint64_t v19;
  id v20;
  uint8_t buf[4];
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = objc_msgSend(v3, "length");
  fp_current_or_default_log();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      __73__FPSpotlightFetchOneBatchFromWorkingSetOperation__indexOnePageFromPage___block_invoke_cold_1(a1, (uint64_t)v3);

    v7 = [FPXItemsObserver alloc];
    objc_msgSend(*(id *)(a1 + 32), "observerItemID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 312));
    v10 = -[FPXItemsObserver initWithObservedItemID:domainContext:nsFileProviderRequest:](v7, "initWithObservedItemID:domainContext:nsFileProviderRequest:", v8, WeakRetained, 0);

    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __73__FPSpotlightFetchOneBatchFromWorkingSetOperation__indexOnePageFromPage___block_invoke_7;
    v17[3] = &unk_1E444DF40;
    v11 = *(id *)(a1 + 40);
    v12 = *(_QWORD *)(a1 + 32);
    v18 = v11;
    v19 = v12;
    v20 = v3;
    -[FPXItemsObserver setFinishedBlock:](v10, "setFinishedBlock:", v17);
    v13 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 304));
    objc_msgSend(v13, "vendorEnumerator");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "enumerateItemsForObserver:startingAtPage:", v10, *(_QWORD *)(a1 + 40));

  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v15 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 304));
      *(_DWORD *)buf = 138412290;
      v22 = v15;
      _os_log_impl(&dword_1A0A34000, v6, OS_LOG_TYPE_DEFAULT, "[WARNING] %@: didn't return a change token during working set indexing. Recents and search results will be disabled.", buf, 0xCu);

    }
    v16 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 3328, MEMORY[0x1E0C9AA70]);
    v10 = (FPXItemsObserver *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleInsertedItems:deletedItems:needsMoreWork:state:error:", MEMORY[0x1E0C9AA60], MEMORY[0x1E0C9AA60], 0, 0, v10);
  }

}

void __73__FPSpotlightFetchOneBatchFromWorkingSetOperation__indexOnePageFromPage___block_invoke_7(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  NSObject *v17;
  FPSpotlightIndexState *v18;
  void *v19;
  void *v20;
  void *v21;
  id WeakRetained;
  void *v23;
  int v24;
  uint8_t buf[4];
  id v26;
  __int16 v27;
  int v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  int v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v11 = a2;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  if (v12)
    v16 = 1;
  else
    v16 = objc_msgSend(*(id *)(a1 + 32), "isEqual:", 0) ^ 1;
  fp_current_or_default_log();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 304));
    v24 = objc_msgSend(v11, "count");
    objc_msgSend(MEMORY[0x1E0CB3940], "fp_hashForToken:", v12);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413314;
    v26 = WeakRetained;
    v27 = 1024;
    v28 = v24;
    v29 = 2112;
    v30 = v23;
    v31 = 1024;
    v32 = v16;
    v33 = 2112;
    v34 = v15;
    _os_log_debug_impl(&dword_1A0A34000, v17, OS_LOG_TYPE_DEBUG, "[DEBUG] %@: finished enumerating provider %d items, nextPage=%@ hasMore=%{BOOL}d, error=%@", buf, 0x2Cu);

  }
  v18 = -[FPSpotlightIndexState initWithPage:changeToken:]([FPSpotlightIndexState alloc], "initWithPage:changeToken:", v12, *(_QWORD *)(a1 + 48));
  v19 = *(void **)(a1 + 40);
  v20 = (void *)objc_msgSend(v11, "copy");
  -[FPSpotlightIndexState dataRepresentation](v18, "dataRepresentation");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "handleInsertedItems:deletedItems:needsMoreWork:state:error:", v20, MEMORY[0x1E0C9AA60], v16, v21, v15);

}

- (void)_indexOneChangesBatchFromChangeToken:(id)a3
{
  NSObject *v4;
  void *v5;
  void *v6;
  NSObject *WeakRetained;
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
  id v22;
  void *v23;
  void *v24;
  FPXChangesObserver *v25;
  void *v26;
  id v27;
  FPXChangesObserver *v28;
  id v29;
  void *v30;
  void *v31;
  id v32;
  _QWORD v33[5];
  id v34;
  id v35;
  uint8_t buf[4];
  void *v37;
  __int16 v38;
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v32 = a3;
  fp_current_or_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    -[FPSpotlightFetchOneBatchFromWorkingSetOperation _indexOneChangesBatchFromChangeToken:].cold.2((uint64_t)self, (uint64_t)v32);

  objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "currentPersona");
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  v35 = 0;
  objc_msgSend(v31, "userPersonaUniqueString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_domainContext);
  -[NSObject domain](WeakRetained, "domain");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "personaIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 == v9)
  {

    v21 = 0;
LABEL_15:

    goto LABEL_16;
  }
  v10 = objc_loadWeakRetained((id *)&self->_domainContext);
  objc_msgSend(v10, "domain");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "personaIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v6, "isEqualToString:", v12);

  if ((v13 & 1) != 0 || !voucher_process_can_use_arbitrary_personas())
  {
    v21 = 0;
  }
  else
  {
    v34 = 0;
    v14 = (void *)objc_msgSend(v31, "copyCurrentPersonaContextWithError:", &v34);
    v15 = v34;
    v16 = v35;
    v35 = v14;

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
    objc_msgSend(v31, "generateAndRestorePersonaContextWithPersonaUniqueString:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21)
    {
      fp_current_or_default_log();
      WeakRetained = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_ERROR))
      {
        v22 = objc_loadWeakRetained((id *)&self->_domainContext);
        objc_msgSend(v22, "domain");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "personaIdentifier");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v37 = v24;
        v38 = 2112;
        v39 = v21;
        _os_log_error_impl(&dword_1A0A34000, WeakRetained, OS_LOG_TYPE_ERROR, "[ERROR] Can't adopt persona %@: %@", buf, 0x16u);

      }
      goto LABEL_15;
    }
  }
LABEL_16:
  v25 = [FPXChangesObserver alloc];
  -[FPSpotlightFetchOneBatchFromWorkingSetOperation observerItemID](self, "observerItemID");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_loadWeakRetained((id *)&self->_domainContext);
  v28 = -[FPXChangesObserver initWithObservedItemID:domainContext:previousChangeToken:nsFileProviderRequest:](v25, "initWithObservedItemID:domainContext:previousChangeToken:nsFileProviderRequest:", v26, v27, v32, 0);

  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v33[2] = __88__FPSpotlightFetchOneBatchFromWorkingSetOperation__indexOneChangesBatchFromChangeToken___block_invoke;
  v33[3] = &unk_1E444DF90;
  v33[4] = self;
  -[FPXChangesObserver setFinishedBlock:](v28, "setFinishedBlock:", v33);
  v29 = objc_loadWeakRetained((id *)&self->_indexer);
  objc_msgSend(v29, "vendorEnumerator");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "enumerateChangesForObserver:fromSyncAnchor:", v28, v32);

  _FPRestorePersona(&v35);
}

void __88__FPSpotlightFetchOneBatchFromWorkingSetOperation__indexOneChangesBatchFromChangeToken___block_invoke(uint64_t a1, void *a2, void *a3, unsigned int a4, void *a5, void *a6, void *a7)
{
  id WeakRetained;
  void *v13;
  id v14;
  FPSpotlightIndexState *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  char v22;
  void *v23;
  id v24;
  id v25;
  NSObject *v26;
  id v27;
  void *v28;
  void *v29;
  NSObject *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  void *v34;
  BOOL v35;
  int v36;
  void *v37;
  id v38;
  int v39;
  int v40;
  id v41;
  id v42;
  void *v43;
  id v44;
  id v46;
  id v47;
  void *v48;
  id v49;
  id v50;
  id v51;
  id v52;
  uint8_t buf[4];
  id v54;
  __int16 v55;
  _BYTE v56[10];
  __int16 v57;
  id v58;
  __int16 v59;
  unsigned int v60;
  __int16 v61;
  FPSpotlightIndexState *v62;
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v47 = a2;
  v46 = a3;
  v49 = a5;
  v44 = a6;
  v50 = a7;
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 312));
  objc_msgSend(WeakRetained, "log");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = fpfs_adopt_log(v13);

  objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
  v15 = (FPSpotlightIndexState *)objc_claimAutoreleasedReturnValue();
  -[FPSpotlightIndexState currentPersona](v15, "currentPersona");
  v48 = (void *)objc_claimAutoreleasedReturnValue();

  v52 = 0;
  objc_msgSend(v48, "userPersonaUniqueString");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 312));
  objc_msgSend(v17, "domain");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "personaIdentifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16 == v19)
  {

LABEL_13:
    v29 = 0;
    goto LABEL_14;
  }
  v15 = (FPSpotlightIndexState *)objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 312));
  -[FPSpotlightIndexState domain](v15, "domain");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "personaIdentifier");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v16, "isEqualToString:", v21);

  if ((v22 & 1) != 0 || !voucher_process_can_use_arbitrary_personas())
    goto LABEL_13;
  v51 = 0;
  v23 = (void *)objc_msgSend(v48, "copyCurrentPersonaContextWithError:", &v51);
  v24 = v51;
  v25 = v52;
  v52 = v23;

  if (v24)
  {
    fp_current_or_default_log();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      -[FPSpotlightIndexer _fetchClientStateIfNeeded].cold.1();

  }
  v27 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 312));
  objc_msgSend(v27, "domain");
  v15 = (FPSpotlightIndexState *)objc_claimAutoreleasedReturnValue();
  -[FPSpotlightIndexState personaIdentifier](v15, "personaIdentifier");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "generateAndRestorePersonaContextWithPersonaUniqueString:", v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  if (v29)
  {
    fp_current_or_default_log();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      v42 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 312));
      objc_msgSend(v42, "domain");
      v15 = (FPSpotlightIndexState *)objc_claimAutoreleasedReturnValue();
      -[FPSpotlightIndexState personaIdentifier](v15, "personaIdentifier");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v54 = v43;
      v55 = 2112;
      *(_QWORD *)v56 = v29;
      _os_log_error_impl(&dword_1A0A34000, v30, OS_LOG_TYPE_ERROR, "[ERROR] Can't adopt persona %@: %@", buf, 0x16u);

    }
  }
LABEL_14:
  fp_current_or_default_log();
  v31 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
  {
    v38 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 304));
    v39 = objc_msgSend(v47, "count");
    v40 = objc_msgSend(v46, "count");
    objc_msgSend(MEMORY[0x1E0CB3940], "fp_hashForToken:", v49);
    v41 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "fp_prettyDescription");
    v15 = (FPSpotlightIndexState *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413570;
    v54 = v38;
    v55 = 1024;
    *(_DWORD *)v56 = v39;
    *(_WORD *)&v56[4] = 1024;
    *(_DWORD *)&v56[6] = v40;
    v57 = 2112;
    v58 = v41;
    v59 = 1024;
    v60 = a4;
    v61 = 2112;
    v62 = v15;
    _os_log_debug_impl(&dword_1A0A34000, v31, OS_LOG_TYPE_DEBUG, "[DEBUG] %@: finished enumerating changes %d updates, %d deletions, nextAnchor=%@ hasMore=%{BOOL}d, error=%@", buf, 0x32u);

  }
  v32 = *(void **)(a1 + 32);
  v33 = (void *)objc_msgSend(v47, "copy");
  v34 = (void *)objc_msgSend(v46, "copy");
  if (v49)
    v35 = v50 == 0;
  else
    v35 = 0;
  v36 = v35;
  if (v35)
  {
    v15 = -[FPSpotlightIndexState initWithChangeToken:]([FPSpotlightIndexState alloc], "initWithChangeToken:", v49);
    -[FPSpotlightIndexState dataRepresentation](v15, "dataRepresentation");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v37 = 0;
  }
  objc_msgSend(v32, "handleInsertedItems:deletedItems:needsMoreWork:state:error:", v33, v34, a4, v37, v50);
  if (v36)
  {

  }
  _FPRestorePersona(&v52);

}

- (void)main
{
  id WeakRetained;
  void *v2;
  os_log_t v3;
  os_log_type_t v4;
  const char *v5;
  uint8_t *v6;

  WeakRetained = objc_loadWeakRetained(a1);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_4_7();
  _os_log_debug_impl(v2, v3, v4, v5, v6, 0xCu);

}

void __55__FPSpotlightFetchOneBatchFromWorkingSetOperation_main__block_invoke(uint64_t a1, void *a2)
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
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  id v31;
  id v32;
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v29 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 304));
  objc_msgSend(WeakRetained, "log");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = fpfs_adopt_log(v4);

  objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "currentPersona");
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  v32 = 0;
  objc_msgSend(v30, "userPersonaUniqueString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 312));
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
  v11 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 312));
  objc_msgSend(v11, "domain");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "personaIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v7, "isEqualToString:", v13);

  if ((v14 & 1) != 0 || !voucher_process_can_use_arbitrary_personas())
    goto LABEL_13;
  v31 = 0;
  v15 = (void *)objc_msgSend(v30, "copyCurrentPersonaContextWithError:", &v31);
  v16 = v31;
  v17 = v32;
  v32 = v15;

  if (v16)
  {
    fp_current_or_default_log();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      -[FPSpotlightIndexer _fetchClientStateIfNeeded].cold.1();

  }
  v19 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 312));
  objc_msgSend(v19, "domain");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "personaIdentifier");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "generateAndRestorePersonaContextWithPersonaUniqueString:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    fp_current_or_default_log();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      v26 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 312));
      objc_msgSend(v26, "domain");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "personaIdentifier");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v34 = v28;
      v35 = 2112;
      v36 = v22;
      _os_log_error_impl(&dword_1A0A34000, v23, OS_LOG_TYPE_ERROR, "[ERROR] Can't adopt persona %@: %@", buf, 0x16u);

    }
  }
LABEL_14:
  v24 = *(void **)(a1 + 32);
  if (v29)
  {
    objc_msgSend(v24, "handleInsertedItems:deletedItems:needsMoreWork:state:error:", MEMORY[0x1E0C9AA60], MEMORY[0x1E0C9AA60], 0, 0);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "fp_invalidArgumentError:", CFSTR("invalid index state"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleInsertedItems:deletedItems:needsMoreWork:state:error:", MEMORY[0x1E0C9AA60], MEMORY[0x1E0C9AA60], 1, 0, v25);

  }
  _FPRestorePersona(&v32);

}

- (NSArray)updatedItems
{
  return self->_updatedItems;
}

- (void)setUpdatedItems:(id)a3
{
  objc_storeStrong((id *)&self->_updatedItems, a3);
}

- (NSArray)deletedItemIDs
{
  return self->_deletedItemIDs;
}

- (void)setDeletedItemIDs:(id)a3
{
  objc_storeStrong((id *)&self->_deletedItemIDs, a3);
}

- (NSData)nextAnchor
{
  return self->_nextAnchor;
}

- (void)setNextAnchor:(id)a3
{
  objc_storeStrong((id *)&self->_nextAnchor, a3);
}

- (BOOL)hasMore
{
  return self->_hasMore;
}

- (void)setHasMore:(BOOL)a3
{
  self->_hasMore = a3;
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_nextAnchor, 0);
  objc_storeStrong((id *)&self->_deletedItemIDs, 0);
  objc_storeStrong((id *)&self->_updatedItems, 0);
  objc_storeStrong((id *)&self->_indexState, 0);
  objc_destroyWeak((id *)&self->_domainContext);
  objc_destroyWeak((id *)&self->_indexer);
}

- (void)initWithIndexer:queue:.cold.1()
{
  __assert_rtn("-[FPSpotlightFetchOneBatchFromWorkingSetOperation initWithIndexer:queue:]", "FPSpotlightIndexOneBatchOperation.m", 42, "_domainContext");
}

void __73__FPSpotlightFetchOneBatchFromWorkingSetOperation__indexOnePageFromPage___block_invoke_cold_1(uint64_t a1, uint64_t a2)
{
  id WeakRetained;
  void *v5;
  void *v6;
  os_log_t v7;
  os_log_type_t v8;
  const char *v9;
  uint8_t *v10;
  void *v11;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 304));
  objc_msgSend(MEMORY[0x1E0CB3940], "fp_hashForToken:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "fp_hashForToken:", *(_QWORD *)(a1 + 40));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_7();
  _os_log_debug_impl(v6, v7, v8, v9, v10, 0x20u);

}

- (void)_indexOneChangesBatchFromChangeToken:(uint64_t)a1 .cold.2(uint64_t a1, uint64_t a2)
{
  id WeakRetained;
  void *v4;
  os_log_t v5;
  os_log_type_t v6;
  const char *v7;
  uint8_t *v8;
  void *v9;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 304));
  objc_msgSend(MEMORY[0x1E0CB3940], "fp_hashForToken:", a2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_7();
  _os_log_debug_impl(v4, v5, v6, v7, v8, 0x16u);

}

@end
