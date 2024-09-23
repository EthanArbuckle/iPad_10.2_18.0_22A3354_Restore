@implementation FPActionOperation

- (FPActionOperation)initWithProvider:(id)a3 action:(id)a4
{
  id v7;
  id v8;
  FPActionOperation *v9;
  FPActionOperation *v10;
  uint64_t v11;
  FPItemManager *itemManager;
  uint64_t section;
  NSObject *v14;
  uint64_t v15;
  NSProgress *progress;
  _QWORD v18[4];
  id v19;
  id location;
  objc_super v21;

  v7 = a3;
  v8 = a4;
  v21.receiver = self;
  v21.super_class = (Class)FPActionOperation;
  v9 = -[FPOperation init](&v21, sel_init);
  v10 = v9;
  if (v9)
  {
    v9->_setupRemoteOperationService = 0;
    v9->_haveErrorRecovery = 1;
    v9->_haveStitching = 1;
    v9->_havePreflight = 1;
    v9->_skipPreflight = 0;
    objc_storeStrong((id *)&v9->_action, a4);
    objc_storeStrong((id *)&v10->_providerIdentifier, a3);
    +[FPItemManager defaultManager](FPItemManager, "defaultManager");
    v11 = objc_claimAutoreleasedReturnValue();
    itemManager = v10->_itemManager;
    v10->_itemManager = (FPItemManager *)v11;

    section = __fp_create_section();
    fp_current_or_default_log();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      -[FPActionOperation initWithProvider:action:].cold.1((uint64_t)v10, section);

    v10->_logSection = section;
    v15 = objc_opt_new();
    progress = v10->_progress;
    v10->_progress = (NSProgress *)v15;

    -[NSProgress setCancellable:](v10->_progress, "setCancellable:", 1);
    location = 0;
    objc_initWeak(&location, v10);
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __45__FPActionOperation_initWithProvider_action___block_invoke;
    v18[3] = &unk_1E44499C0;
    objc_copyWeak(&v19, &location);
    -[NSProgress setCancellationHandler:](v10->_progress, "setCancellationHandler:", v18);
    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }

  return v10;
}

void __45__FPActionOperation_initWithProvider_action___block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  fp_current_or_default_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __45__FPActionOperation_initWithProvider_action___block_invoke_cold_1();

  objc_msgSend(WeakRetained, "cancel");
}

- (FPActionOperation)initWithItemsOfDifferentProviders:(id)a3 action:(id)a4
{
  id v7;
  id v8;
  FPActionOperation *v9;
  FPActionOperation *v10;
  NSDictionary *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  NSDictionary *itemsByDomainID;
  void *v22;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (!objc_msgSend(v7, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("FPActionOperation.m"), 108, CFSTR("Operation %@ initialized with empty item set."), objc_opt_class());

  }
  v9 = -[FPActionOperation initWithProvider:action:](self, "initWithProvider:action:", 0, v8);
  v10 = v9;
  if (v9)
  {
    v9->_multiProviders = 1;
    -[FPActionOperation setSourceItemsToPreflight:](v9, "setSourceItemsToPreflight:", v7);
    v11 = (NSDictionary *)objc_opt_new();
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v23 = v7;
    v12 = v7;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v25;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v25 != v15)
            objc_enumerationMutation(v12);
          v17 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
          objc_msgSend(v17, "providerDomainID");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSDictionary objectForKeyedSubscript:](v11, "objectForKeyedSubscript:", v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v19)
          {
            v19 = (void *)objc_opt_new();
            -[NSDictionary setObject:forKeyedSubscript:](v11, "setObject:forKeyedSubscript:", v19, v18);
          }
          objc_msgSend(v19, "addObject:", v17);

        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      }
      while (v14);
    }

    itemsByDomainID = v10->_itemsByDomainID;
    v10->_itemsByDomainID = v11;

    v7 = v23;
  }

  return v10;
}

- (FPStitchingSession)stitcher
{
  FPStitchingSession *v3;
  FPStitchingSession *stitcher;
  FPStitchingSession *v5;
  FPStitchingSession *v6;

  if (self->_haveStitching && !self->_finishAfterPreflight)
  {
    stitcher = self->_stitcher;
    if (!stitcher)
    {
      v5 = (FPStitchingSession *)objc_opt_new();
      v6 = self->_stitcher;
      self->_stitcher = v5;

      -[FPStitchingSession setPlaceholdersCreationBlock:](self->_stitcher, "setPlaceholdersCreationBlock:", self->_placeholdersCreationBlock);
      stitcher = self->_stitcher;
    }
    v3 = stitcher;
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (void)resetStitcher
{
  FPStitchingSession *stitcher;

  -[FPStitchingSession finish](self->_stitcher, "finish");
  stitcher = self->_stitcher;
  self->_stitcher = 0;

}

- (id)replicateForItems:(id)a3
{
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("FPActionOperation.m"), 163, CFSTR("UNREACHABLE: this should be overridden by the concrete operation"));

  return 0;
}

- (void)_dispatchToSubOperations
{
  NSObject *v3;
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  _BOOL8 v10;
  NSObject *v11;
  NSObject *v12;
  __int128 v13;
  NSDictionary *obj;
  void *v15;
  _QWORD block[6];
  _QWORD v17[5];
  NSObject *v18;
  _QWORD *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _QWORD v24[5];
  id v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  FPActionOperation *v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v15 = (void *)objc_opt_new();
  v3 = dispatch_group_create();
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x3032000000;
  v24[3] = __Block_byref_object_copy__26;
  v24[4] = __Block_byref_object_dispose__26;
  v25 = 0;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  obj = self->_itemsByDomainID;
  v4 = -[NSDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v20, v30, 16);
  if (v4)
  {
    v6 = *(_QWORD *)v21;
    *(_QWORD *)&v5 = 138412546;
    v13 = v5;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v21 != v6)
          objc_enumerationMutation(obj);
        -[NSDictionary objectForKeyedSubscript:](self->_itemsByDomainID, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v7), v13);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[FPActionOperation replicateForItems:](self, "replicateForItems:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setHaveStitching:", 0);
        v10 = self->_havePreflight && !self->_skipPreflight;
        objc_msgSend(v9, "setHavePreflight:", v10);
        objc_msgSend(v9, "setFinishAfterPreflight:", self->_finishAfterPreflight);
        objc_msgSend(v9, "setHaveErrorRecovery:", self->_haveErrorRecovery);
        objc_msgSend(v9, "setErrorRecoveryHandler:", self->_errorRecoveryHandler);
        objc_msgSend(v9, "setSkipPreflight:", self->_skipPreflight);
        dispatch_group_enter(v3);
        v17[0] = MEMORY[0x1E0C809B0];
        v17[1] = 3221225472;
        v17[2] = __45__FPActionOperation__dispatchToSubOperations__block_invoke;
        v17[3] = &unk_1E4449B48;
        v17[4] = self;
        v19 = v24;
        v18 = v3;
        objc_msgSend(v9, "setActionCompletionBlock:", v17);
        fp_current_or_default_log();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = v13;
          v27 = v9;
          v28 = 2112;
          v29 = self;
          _os_log_debug_impl(&dword_1A0A34000, v11, OS_LOG_TYPE_DEBUG, "[DEBUG] created suboperation %@ for %@", buf, 0x16u);
        }

        objc_msgSend(v15, "addOperation:", v9);
        ++v7;
      }
      while (v4 != v7);
      v4 = -[NSDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v20, v30, 16);
    }
    while (v4);
  }

  -[FPOperation callbackQueue](self, "callbackQueue");
  v12 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__FPActionOperation__dispatchToSubOperations__block_invoke_19;
  block[3] = &unk_1E444B900;
  block[4] = self;
  block[5] = v24;
  dispatch_group_notify(v3, v12, block);

  _Block_object_dispose(v24, 8);
}

void __45__FPActionOperation__dispatchToSubOperations__block_invoke(uint64_t a1, void *a2)
{
  id v4;
  uint64_t v5;
  id *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = *(id *)(a1 + 32);
  v10 = a2;
  objc_sync_enter(v4);
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v8 = *(void **)(v5 + 40);
  v6 = (id *)(v5 + 40);
  v7 = v8;
  v9 = v10;
  if (v8)
    v9 = v7;
  objc_storeStrong(v6, v9);
  objc_sync_exit(v4);

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __45__FPActionOperation__dispatchToSubOperations__block_invoke_19(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  _BYTE v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 328);
  fp_current_or_default_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "fp_prettyDescription");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    __45__FPActionOperation__dispatchToSubOperations__block_invoke_19_cold_1(v3, (uint64_t)v5, v4);
  }

  objc_msgSend(*(id *)(a1 + 32), "completedWithResult:error:", 0, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
  __fp_leave_section_Debug((uint64_t)&v4);
}

- (id)operationDescription
{
  const __CFString *providerIdentifier;

  if (self->_multiProviders)
    providerIdentifier = CFSTR("multiple providers");
  else
    providerIdentifier = (const __CFString *)self->_providerIdentifier;
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" %@ "), providerIdentifier);
}

- (void)runUserInteractionsPreflight:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  BOOL v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  NSString *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[4];
  id v20;

  v4 = a3;
  -[FPActionOperation action](self, "action");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
    v7 = -[FPActionOperation setupRemoteOperationService](self, "setupRemoteOperationService");

    if (v7)
    {
      -[FPActionOperation sourceItemsToPreflight](self, "sourceItemsToPreflight");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "firstObject");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v9, "isExcludedFromSync"))
      {

      }
      else
      {
        -[FPActionOperation destinationItemToPreflight](self, "destinationItemToPreflight");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isExcludedFromSync");

        if (!v11)
        {
          v12 = self->_providerIdentifier;
          -[FPActionOperation remoteServiceProxy](self, "remoteServiceProxy");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[FPActionOperation action](self, "action");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          -[FPActionOperation sourceItemsToPreflight](self, "sourceItemsToPreflight");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[FPActionOperation destinationItemToPreflight](self, "destinationItemToPreflight");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          -[FPActionOperation sourceItemKeysAllowList](self, "sourceItemKeysAllowList");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          -[FPActionOperation destinationItemKeysAllowList](self, "destinationItemKeysAllowList");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19[0] = MEMORY[0x1E0C809B0];
          v19[1] = 3221225472;
          v19[2] = __50__FPActionOperation_runUserInteractionsPreflight___block_invoke;
          v19[3] = &unk_1E444D6E8;
          v20 = v4;
          objc_msgSend(v13, "userInteractionErrorsForPerformingAction:sourceItems:destinationItem:fpProviderDomainId:sourceItemKeysAllowList:destinationItemKeysAllowList:completionHandler:", v14, v15, v16, v12, v17, v18, v19);

          goto LABEL_7;
        }
      }
    }
  }
  (*((void (**)(id, _QWORD))v4 + 2))(v4, 0);
LABEL_7:

}

void __50__FPActionOperation_runUserInteractionsPreflight___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (v3)
  {
    if (objc_msgSend(v3, "count"))
    {
      objc_msgSend(v4, "objectAtIndex:", 0);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v7[0] = v5;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
      v6 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v6 = v4;
    }
  }
  else
  {
    v6 = 0;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)_runUserInteractionsPreflight:(id)a3
{
  id v5;
  id v6;
  _QWORD v7[5];
  id v8;
  SEL v9;

  v5 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __51__FPActionOperation__runUserInteractionsPreflight___block_invoke;
  v7[3] = &unk_1E444ECA0;
  v7[4] = self;
  v8 = v5;
  v9 = a2;
  v6 = v5;
  -[FPActionOperation runUserInteractionsPreflight:](self, "runUserInteractionsPreflight:", v7);

}

void __51__FPActionOperation__runUserInteractionsPreflight___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  id v7;
  uint64_t v8;
  id v9;
  _QWORD v10[4];
  id v11;
  uint64_t v12;
  id v13;
  uint64_t v14;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "callbackQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __51__FPActionOperation__runUserInteractionsPreflight___block_invoke_2;
  v10[3] = &unk_1E444C7C8;
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(a1 + 40);
  v11 = v3;
  v12 = v5;
  v7 = v6;
  v8 = *(_QWORD *)(a1 + 48);
  v13 = v7;
  v14 = v8;
  v9 = v3;
  dispatch_async(v4, v10);

}

void __51__FPActionOperation__runUserInteractionsPreflight___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  _BOOL4 v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  uint64_t v10;

  v2 = objc_msgSend(*(id *)(a1 + 32), "count");
  fp_current_or_default_log();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG);
  if (v2)
  {
    if (v4)
      __51__FPActionOperation__runUserInteractionsPreflight___block_invoke_2_cold_2();

    objc_msgSend(*(id *)(a1 + 32), "fp_map:", &__block_literal_global_48);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __51__FPActionOperation__runUserInteractionsPreflight___block_invoke_29;
    v8[3] = &unk_1E444D7B0;
    v6 = *(_QWORD *)(a1 + 48);
    v7 = *(_QWORD *)(a1 + 56);
    v9 = *(id *)(a1 + 40);
    v10 = v7;
    objc_msgSend(v9, "tryRecoveringFromPreflightErrors:recoveryHandler:completion:", v5, v8, v6);

  }
  else
  {
    if (v4)
      __51__FPActionOperation__runUserInteractionsPreflight___block_invoke_2_cold_1(a1, v3);

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
}

id __51__FPActionOperation__runUserInteractionsPreflight___block_invoke_27(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  void *v4;

  v2 = a2;
  fp_current_or_default_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    __51__FPActionOperation__runUserInteractionsPreflight___block_invoke_27_cold_1();

  objc_msgSend(v2, "fp_asWarning");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t __51__FPActionOperation__runUserInteractionsPreflight___block_invoke_29(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  uint64_t v6;
  void *v7;

  v5 = a2;
  if (!a3)
    goto LABEL_5;
  if (a3 != 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), CFSTR("FPActionOperation.m"), 268, CFSTR("UNREACHABLE: invalid index for error: %@"), v5);

LABEL_5:
    v6 = 0;
    goto LABEL_6;
  }
  v6 = 1;
LABEL_6:

  return v6;
}

- (void)preflightWithCompletion:(id)a3
{
  id v4;
  void (**v5)(_QWORD, _QWORD, _QWORD);
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD v14[5];
  id v15;

  v4 = a3;
  v5 = (void (**)(_QWORD, _QWORD, _QWORD))v4;
  if (self->_skipPreflight)
  {
    fp_current_or_default_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      -[FPActionOperation preflightWithCompletion:].cold.1(v6, v7, v8, v9, v10, v11, v12, v13);

    v5[2](v5, 1, 0);
  }
  else
  {
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __45__FPActionOperation_preflightWithCompletion___block_invoke;
    v14[3] = &unk_1E444ECC8;
    v14[4] = self;
    v15 = v4;
    -[FPActionOperation _runUserInteractionsPreflight:](self, "_runUserInteractionsPreflight:", v14);

  }
}

uint64_t __45__FPActionOperation_preflightWithCompletion___block_invoke(uint64_t a1, char a2)
{
  if ((a2 & 1) != 0)
    return objc_msgSend(*(id *)(a1 + 32), "subclassPreflightWithCompletion:", *(_QWORD *)(a1 + 40));
  else
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)_preflightAndRun
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8(&dword_1A0A34000, v0, v1, "[DEBUG] %@: no preflight, finishing after preflight", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __37__FPActionOperation__preflightAndRun__block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  id v8;
  _QWORD block[4];
  id v10;
  uint64_t v11;
  char v12;

  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "callbackQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37__FPActionOperation__preflightAndRun__block_invoke_2;
  block[3] = &unk_1E444ECF0;
  v12 = a2;
  v7 = *(_QWORD *)(a1 + 32);
  v10 = v5;
  v11 = v7;
  v8 = v5;
  dispatch_async(v6, block);

}

void __37__FPActionOperation__preflightAndRun__block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  _BYTE v7[24];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (!*(_BYTE *)(a1 + 48)
    || *(_QWORD *)(a1 + 32)
    || objc_msgSend(*(id *)(a1 + 40), "finishAfterPreflight"))
  {
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 328);
    fp_current_or_default_log();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(*(id *)(a1 + 32), "fp_prettyDescription");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      __37__FPActionOperation__preflightAndRun__block_invoke_2_cold_1(v3, (uint64_t)v7, v6);
    }

    v4 = *(id *)(a1 + 32);
    v5 = v4;
    if (!*(_BYTE *)(a1 + 48) && !v4)
    {
      FPUserCancelledError();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(*(id *)(a1 + 40), "completedWithResult:error:", 0, v5);

    __fp_leave_section_Debug((uint64_t)&v6);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "actionMain");
  }
}

- (void)main
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_9_3();
  OUTLINED_FUNCTION_11(&dword_1A0A34000, v0, (uint64_t)v0, "[DEBUG] ┳%llx starting action %@", v1);
  OUTLINED_FUNCTION_3();
}

uint64_t __25__FPActionOperation_main__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_preflightAndRun");
}

void __25__FPActionOperation_main__block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  _QWORD v8[5];
  id v9;

  v5 = a2;
  v6 = *(void **)(a1 + 32);
  if (a3)
  {
    objc_msgSend(v6, "completedWithResult:error:", 0, a3);
  }
  else
  {
    objc_msgSend(v6, "callbackQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __25__FPActionOperation_main__block_invoke_3;
    v8[3] = &unk_1E4449A40;
    v8[4] = *(_QWORD *)(a1 + 32);
    v9 = v5;
    dispatch_async(v7, v8);

  }
}

uint64_t __25__FPActionOperation_main__block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setRemoteService:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "_preflightAndRun");
}

- (FPXOperationService)remoteService
{
  void *v4;

  if (!self->_setupRemoteOperationService)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("FPActionOperation.m"), 371, CFSTR("setupRemoteOperationService is not set"));

  }
  return self->_remoteService;
}

- (FPXOperationService)remoteServiceProxy
{
  void *v2;
  void *v3;

  -[FPActionOperation remoteService](self, "remoteService");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "remoteObjectProxy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (FPXOperationService *)v3;
}

- (void)subclassPreflightWithCompletion:(id)a3
{
  (*((void (**)(id, uint64_t, _QWORD))a3 + 2))(a3, 1, 0);
}

- (void)finishWithResult:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  FPXOperationService *remoteService;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  char isKindOfClass;
  void *v13;
  void *v14;
  objc_super v15;
  unint64_t logSection;
  uint8_t buf[4];
  unint64_t v18;
  __int16 v19;
  FPActionOperation *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[FPActionOperation resetStitcher](self, "resetStitcher");
  -[FPXOperationService invalidate](self->_remoteService, "invalidate");
  remoteService = self->_remoteService;
  self->_remoteService = 0;

  -[FPActionOperation actionCompletionBlock](self, "actionCompletionBlock");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (v9)
  {
    (*(void (**)(uint64_t, id))(v9 + 16))(v9, v7);
    -[FPActionOperation setActionCompletionBlock:](self, "setActionCompletionBlock:", 0);
  }

  logSection = self->_logSection;
  fp_current_or_default_log();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    v13 = v6;
    if ((isKindOfClass & 1) != 0)
    {
      FPAbbreviatedArrayDescription(v6);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v7, "fp_prettyDescription");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218754;
    v18 = logSection;
    v19 = 2112;
    v20 = self;
    v21 = 2112;
    v22 = v13;
    v23 = 2112;
    v24 = v14;
    _os_log_debug_impl(&dword_1A0A34000, v11, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx action finished %@ with (result=%@, error=%@)", buf, 0x2Au);

    if ((isKindOfClass & 1) != 0)
  }

  v15.receiver = self;
  v15.super_class = (Class)FPActionOperation;
  -[FPOperation finishWithResult:error:](&v15, sel_finishWithResult_error_, v6, v7);
  __fp_leave_section_Debug((uint64_t)&logSection);

}

- (void)tryRecoveringFromError:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  BOOL v9;
  void *v10;
  BOOL v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  NSObject *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  _QWORD v36[5];
  id v37;
  id v38;
  id v39;
  uint8_t buf[4];
  FPActionOperation *v41;
  __int16 v42;
  void *v43;
  __int16 v44;
  void *v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = -[FPActionOperation haveErrorRecovery](self, "haveErrorRecovery");
  -[FPActionOperation errorRecoveryHandler](self, "errorRecoveryHandler");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
    v11 = v9;
  else
    v11 = 0;

  objc_msgSend(v7, "localizedRecoveryOptions");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v12, "count"))
    v11 = 0;

  objc_msgSend(v7, "recoveryAttempter");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13
    || (objc_msgSend(v7, "recoveryAttempter"), v14 = (void *)objc_claimAutoreleasedReturnValue(),
                                               v14,
                                               !v14))
  {
    if (v11)
      goto LABEL_9;
LABEL_21:
    fp_current_or_default_log();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      -[FPActionOperation tryRecoveringFromError:completion:].cold.2();
    goto LABEL_23;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("FPActionOperation.m"), 418, CFSTR("already has an attempter"));

  if (!v11)
    goto LABEL_21;
LABEL_9:
  objc_msgSend(v7, "userInfo");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectForKey:", CFSTR("FPCanBeSuppressed"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "BOOLValue");

  objc_msgSend(v7, "userInfo");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "objectForKey:", CFSTR("FPIsSuppressed"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "BOOLValue");

  fp_current_or_default_log();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v17);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v20);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v41 = self;
    v42 = 2112;
    v43 = v33;
    v44 = 2112;
    v45 = v34;
    _os_log_debug_impl(&dword_1A0A34000, v21, OS_LOG_TYPE_DEBUG, "[DEBUG] %@: Checking suppression: suppressionIsEnabledForPredicate = %@, suppressionIsCheckedForPredicate = %@", buf, 0x20u);

  }
  if ((v17 & v20) != 0)
  {
    fp_current_or_default_log();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      -[FPActionOperation tryRecoveringFromError:completion:].cold.1();
LABEL_23:

    (*((void (**)(id, _QWORD, _QWORD))v8 + 2))(v8, 0, 0);
    goto LABEL_24;
  }
  if (((v17 ^ 1 | v20) & 1) == 0)
  {
    objc_msgSend(v7, "userInfo");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (void *)objc_msgSend(v23, "mutableCopy");

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setValue:forKey:", v25, CFSTR("FPErrorShowSuppressionCheckbox"));

    v26 = (void *)MEMORY[0x1E0CB35C8];
    objc_msgSend(v7, "domain");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "errorWithDomain:code:userInfo:", v27, objc_msgSend(v7, "code"), v24);
    v28 = objc_claimAutoreleasedReturnValue();

    v7 = (id)v28;
  }
  objc_msgSend(v7, "userInfo");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "objectForKey:", CFSTR("DomainIdentifier"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  if (v30)
  {
    -[FPActionOperation itemManager](self, "itemManager");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v36[0] = MEMORY[0x1E0C809B0];
    v36[1] = 3221225472;
    v36[2] = __55__FPActionOperation_tryRecoveringFromError_completion___block_invoke;
    v36[3] = &unk_1E444ED40;
    v36[4] = self;
    v37 = v30;
    v39 = v8;
    v38 = v7;
    objc_msgSend(v31, "fetchOperationServiceForProviderDomainID:handler:", v37, v36);

  }
  else
  {
    -[FPActionOperation remoteServiceProxy](self, "remoteServiceProxy");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[FPActionOperation invokeErrorRecoveryHandlerWithService:fpProviderDomainId:error:completion:](self, "invokeErrorRecoveryHandlerWithService:fpProviderDomainId:error:completion:", v32, CFSTR("n/a"), v7, v8);

  }
LABEL_24:

}

void __55__FPActionOperation_tryRecoveringFromError_completion___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;

  v5 = a3;
  if (v5)
  {
    fp_current_or_default_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __55__FPActionOperation_tryRecoveringFromError_completion___block_invoke_cold_1((uint64_t)a1, (uint64_t)v5, v6);

    (*(void (**)(void))(a1[7] + 16))();
  }
  else
  {
    v7 = (void *)a1[4];
    objc_msgSend(a2, "remoteObjectProxy");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "invokeErrorRecoveryHandlerWithService:fpProviderDomainId:error:completion:", v8, a1[5], a1[6], a1[7]);

  }
}

- (void)invokeErrorRecoveryHandlerWithService:(id)a3 fpProviderDomainId:(id)a4 error:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  void *v12;
  void (**v13)(_QWORD, _QWORD);
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, uint64_t);
  void *v17;
  FPActionOperation *v18;
  id v19;

  v10 = a6;
  v14 = MEMORY[0x1E0C809B0];
  v15 = 3221225472;
  v16 = __95__FPActionOperation_invokeErrorRecoveryHandlerWithService_fpProviderDomainId_error_completion___block_invoke;
  v17 = &unk_1E444ED90;
  v18 = self;
  v19 = v10;
  v11 = v10;
  objc_msgSend(a5, "fp_recoverableErrorWithBlock:fpProviderDomainId:operationService:", &v14, a4, a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[FPActionOperation errorRecoveryHandler](self, "errorRecoveryHandler", v14, v15, v16, v17, v18);
  v13 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, void *))v13)[2](v13, v12);

}

void __95__FPActionOperation_invokeErrorRecoveryHandlerWithService_fpProviderDomainId_error_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  _QWORD v5[4];
  id v6;
  uint64_t v7;

  objc_msgSend(*(id *)(a1 + 32), "callbackQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __95__FPActionOperation_invokeErrorRecoveryHandlerWithService_fpProviderDomainId_error_completion___block_invoke_2;
  v5[3] = &unk_1E444ED68;
  v6 = *(id *)(a1 + 40);
  v7 = a2;
  dispatch_async(v4, v5);

}

uint64_t __95__FPActionOperation_invokeErrorRecoveryHandlerWithService_fpProviderDomainId_error_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, uint64_t, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), 1, *(_QWORD *)(a1 + 40));
}

- (void)tryRecoveringFromPreflightErrors:(id)a3 recoveryHandler:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, _QWORD, void *);
  void *v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;
  id v20;
  void (**v21)(id, _QWORD, void *);

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, _QWORD, void *))a5;
  if (objc_msgSend(v8, "count"))
  {
    objc_msgSend(v8, "fp_filter:", &__block_literal_global_53);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "count"))
    {
      fp_current_or_default_log();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        -[FPActionOperation tryRecoveringFromPreflightErrors:recoveryHandler:completion:].cold.2((uint64_t)self, (uint64_t)v8, v12);

      objc_msgSend(v11, "firstObject");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v10[2](v10, 0, v13);
    }
    else
    {
      objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "fp_genericPreflightError");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __81__FPActionOperation_tryRecoveringFromPreflightErrors_recoveryHandler_completion___block_invoke_54;
      v17[3] = &unk_1E444EE20;
      v17[4] = self;
      v20 = v9;
      v18 = v15;
      v21 = v10;
      v19 = v8;
      v16 = v15;
      -[FPActionOperation tryRecoveringFromError:completion:](self, "tryRecoveringFromError:completion:", v16, v17);

    }
  }
  else
  {
    fp_current_or_default_log();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      -[FPActionOperation tryRecoveringFromPreflightErrors:recoveryHandler:completion:].cold.1();

    v10[2](v10, 1, 0);
  }

}

uint64_t __81__FPActionOperation_tryRecoveringFromPreflightErrors_recoveryHandler_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "fp_isWarning") ^ 1;
}

void __81__FPActionOperation_tryRecoveringFromPreflightErrors_recoveryHandler_completion___block_invoke_54(id *a1, char a2, uint64_t a3)
{
  NSObject *v6;
  id v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  char v16;

  objc_msgSend(a1[4], "callbackQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __81__FPActionOperation_tryRecoveringFromPreflightErrors_recoveryHandler_completion___block_invoke_2;
  block[3] = &unk_1E444EDF8;
  v16 = a2;
  v13 = a1[7];
  v10 = a1[5];
  v15 = a3;
  v14 = a1[8];
  v7 = a1[6];
  v8 = a1[4];
  v11 = v7;
  v12 = v8;
  dispatch_async(v6, block);

}

void __81__FPActionOperation_tryRecoveringFromPreflightErrors_recoveryHandler_completion___block_invoke_2(uint64_t a1)
{
  void (*v2)(void);
  id v3;

  if (!*(_BYTE *)(a1 + 80))
  {
    if ((objc_msgSend(*(id *)(a1 + 32), "fp_isWarning") & 1) == 0)
    {
      v2 = *(void (**)(void))(*(_QWORD *)(a1 + 64) + 16);
      goto LABEL_7;
    }
LABEL_5:
    v3 = +[FPActionOperation newArrayRemovingFirstElement:](FPActionOperation, "newArrayRemovingFirstElement:", *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 48), "tryRecoveringFromPreflightErrors:recoveryHandler:completion:", v3, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));

    return;
  }
  if (((*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))() & 1) != 0)
    goto LABEL_5;
  v2 = *(void (**)(void))(*(_QWORD *)(a1 + 64) + 16);
LABEL_7:
  v2();
}

+ (id)newArrayRemovingFirstElement:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  objc_msgSend(v3, "subarrayWithRange:", 1, objc_msgSend(v3, "count") - 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)finishAfterPreflight
{
  return self->_finishAfterPreflight;
}

- (void)setFinishAfterPreflight:(BOOL)a3
{
  self->_finishAfterPreflight = a3;
}

- (BOOL)skipPreflight
{
  return self->_skipPreflight;
}

- (void)setSkipPreflight:(BOOL)a3
{
  self->_skipPreflight = a3;
}

- (id)placeholdersCreationBlock
{
  return self->_placeholdersCreationBlock;
}

- (void)setPlaceholdersCreationBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 360);
}

- (id)actionCompletionBlock
{
  return self->_actionCompletionBlock;
}

- (void)setActionCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 368);
}

- (NSProgress)progress
{
  return self->_progress;
}

- (void)setProgress:(id)a3
{
  objc_storeStrong((id *)&self->_progress, a3);
}

- (id)errorRecoveryHandler
{
  return self->_errorRecoveryHandler;
}

- (void)setErrorRecoveryHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 384);
}

- (FPItemManager)itemManager
{
  return self->_itemManager;
}

- (void)setItemManager:(id)a3
{
  objc_storeStrong((id *)&self->_itemManager, a3);
}

- (void)setRemoteService:(id)a3
{
  objc_storeStrong((id *)&self->_remoteService, a3);
}

- (BOOL)setupRemoteOperationService
{
  return self->_setupRemoteOperationService;
}

- (void)setSetupRemoteOperationService:(BOOL)a3
{
  self->_setupRemoteOperationService = a3;
}

- (BOOL)haveErrorRecovery
{
  return self->_haveErrorRecovery;
}

- (void)setHaveErrorRecovery:(BOOL)a3
{
  self->_haveErrorRecovery = a3;
}

- (BOOL)havePreflight
{
  return self->_havePreflight;
}

- (void)setHavePreflight:(BOOL)a3
{
  self->_havePreflight = a3;
}

- (BOOL)haveStitching
{
  return self->_haveStitching;
}

- (void)setHaveStitching:(BOOL)a3
{
  self->_haveStitching = a3;
}

- (NSString)action
{
  return self->_action;
}

- (void)setAction:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 408);
}

- (NSArray)sourceItemsToPreflight
{
  return self->_sourceItemsToPreflight;
}

- (void)setSourceItemsToPreflight:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 416);
}

- (NSSet)sourceItemKeysAllowList
{
  return self->_sourceItemKeysAllowList;
}

- (void)setSourceItemKeysAllowList:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 424);
}

- (NSSet)destinationItemKeysAllowList
{
  return self->_destinationItemKeysAllowList;
}

- (void)setDestinationItemKeysAllowList:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 432);
}

- (FPItem)destinationItemToPreflight
{
  return self->_destinationItemToPreflight;
}

- (void)setDestinationItemToPreflight:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 440);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_destinationItemToPreflight, 0);
  objc_storeStrong((id *)&self->_destinationItemKeysAllowList, 0);
  objc_storeStrong((id *)&self->_sourceItemKeysAllowList, 0);
  objc_storeStrong((id *)&self->_sourceItemsToPreflight, 0);
  objc_storeStrong((id *)&self->_action, 0);
  objc_storeStrong((id *)&self->_remoteService, 0);
  objc_storeStrong((id *)&self->_itemManager, 0);
  objc_storeStrong(&self->_errorRecoveryHandler, 0);
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong(&self->_actionCompletionBlock, 0);
  objc_storeStrong(&self->_placeholdersCreationBlock, 0);
  objc_storeStrong((id *)&self->_stitcher, 0);
  objc_storeStrong((id *)&self->_providerIdentifier, 0);
  objc_storeStrong((id *)&self->_itemsByDomainID, 0);
}

- (void)initWithProvider:(uint64_t)a1 action:(uint64_t)a2 .cold.1(uint64_t a1, uint64_t a2)
{
  NSObject *v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 134218242;
  v4 = a2;
  OUTLINED_FUNCTION_21();
  OUTLINED_FUNCTION_11(&dword_1A0A34000, v2, (uint64_t)v2, "[DEBUG] ┣%llx created operation: %@", (uint8_t *)&v3);
  OUTLINED_FUNCTION_3();
}

void __45__FPActionOperation_initWithProvider_action___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8(&dword_1A0A34000, v0, v1, "[DEBUG] cancelling operation via its progress: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __45__FPActionOperation__dispatchToSubOperations__block_invoke_19_cold_1(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint8_t *v5;
  NSObject *v6;

  OUTLINED_FUNCTION_2_2((uint64_t)a1, a2, a3, 3.8521e-34);
  OUTLINED_FUNCTION_11(&dword_1A0A34000, v6, v4, "[DEBUG] ┳%llx all suboperations have finished (error:%@)", v5);

}

void __51__FPActionOperation__runUserInteractionsPreflight___block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 40), "action");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_10(&dword_1A0A34000, a2, v4, "[DEBUG] FPActionOperation, No warnings found for action %@", v5);

  OUTLINED_FUNCTION_6_1();
}

void __51__FPActionOperation__runUserInteractionsPreflight___block_invoke_2_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  id *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  OUTLINED_FUNCTION_27_0();
  v10 = *MEMORY[0x1E0C80C00];
  v3 = objc_msgSend(*v2, "count");
  objc_msgSend(*(id *)(v1 + 40), "action");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 134218242;
  v7 = v3;
  v8 = 2114;
  v9 = v4;
  OUTLINED_FUNCTION_11(&dword_1A0A34000, v0, v5, "[DEBUG] FPActionOperation, received %lu warnings for action %{public}@", (uint8_t *)&v6);

  OUTLINED_FUNCTION_7();
}

void __51__FPActionOperation__runUserInteractionsPreflight___block_invoke_27_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8(&dword_1A0A34000, v0, v1, "[DEBUG] FPActionOperation, received warning: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)preflightWithCompletion:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1A0A34000, a1, a3, "[DEBUG] operation skipping preflight.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_30();
}

void __37__FPActionOperation__preflightAndRun__block_invoke_2_cold_1(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint8_t *v5;
  NSObject *v6;

  OUTLINED_FUNCTION_2_2((uint64_t)a1, a2, a3, 3.8521e-34);
  OUTLINED_FUNCTION_11(&dword_1A0A34000, v6, v4, "[DEBUG] ┳%llx finishing action after preflight; %@", v5);

}

- (void)tryRecoveringFromError:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8(&dword_1A0A34000, v0, v1, "[DEBUG] %@: suppression box check, not running pre-flight check.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)tryRecoveringFromError:completion:.cold.2()
{
  NSObject *v0;
  void *v1;
  void *v2;
  void *v3;
  int v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  _BOOL4 v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  OUTLINED_FUNCTION_27_0();
  v3 = v2;
  v15 = *MEMORY[0x1E0C80C00];
  v4 = objc_msgSend(v2, "haveErrorRecovery");
  objc_msgSend(v3, "errorRecoveryHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "localizedRecoveryOptions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138413058;
  v8 = v3;
  v9 = 1024;
  v10 = v4;
  v11 = 1024;
  v12 = v5 != 0;
  v13 = 2112;
  v14 = v6;
  _os_log_debug_impl(&dword_1A0A34000, v0, OS_LOG_TYPE_DEBUG, "[DEBUG] %@: No handler, no recovery. haveErrorRecovery=%{BOOL}d, errorRecoveryHandler=%{BOOL}d, error.localizedRecoveryOptions=%@", (uint8_t *)&v7, 0x22u);

}

void __55__FPActionOperation_tryRecoveringFromError_completion___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5 = 138412802;
  v6 = v3;
  v7 = 2112;
  v8 = v4;
  v9 = 2112;
  v10 = a2;
  OUTLINED_FUNCTION_14_3(&dword_1A0A34000, a3, (uint64_t)a3, "[ERROR] %@: Error retrieving operation service for provider domain: %@, error: %@", (uint8_t *)&v5);
}

- (void)tryRecoveringFromPreflightErrors:recoveryHandler:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8(&dword_1A0A34000, v0, v1, "[DEBUG] %@: no errors, early return from tryRecoveringFromPreflightErrors", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)tryRecoveringFromPreflightErrors:(uint64_t)a1 recoveryHandler:(uint64_t)a2 completion:(NSObject *)a3 .cold.2(uint64_t a1, uint64_t a2, NSObject *a3)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  OUTLINED_FUNCTION_11(&dword_1A0A34000, a3, (uint64_t)a3, "[DEBUG] %@: no hard errors, early return from tryRecoveringFromPreflightErrors. errs=%@", (uint8_t *)&v3);
  OUTLINED_FUNCTION_3();
}

@end
