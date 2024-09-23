@implementation FPPendingSetEnumerator

- (FPPendingSetEnumerator)initWithManager:(id)a3
{
  id v5;
  FPPendingSetEnumerator *v6;
  FPPendingSetEnumerator *v7;
  NSFileProviderDomainVersion *domainVersion;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)FPPendingSetEnumerator;
  v6 = -[FPPendingSetEnumerator init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_manager, a3);
    domainVersion = v7->_domainVersion;
    v7->_domainVersion = 0;

    v7->_refreshInterval = 0.0;
    v7->_maximumSizeReached = 0;
  }

  return v7;
}

- (void)enumerateItemsForObserver:(id)a3 startingAtPage:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  NSFileProviderManager *manager;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  FPPendingSetEnumerator *v15;
  id v16;
  uint64_t v17;

  v6 = a3;
  v7 = a4;
  if ((objc_msgSend(v7, "isEqualToData:", &_NSFileProviderInitialPageSortedByName) & 1) != 0
    || objc_msgSend(v7, "isEqualToData:", &_NSFileProviderInitialPageSortedByDate))
  {
    v8 = objc_opt_new();

    v7 = (id)v8;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v9 = objc_msgSend(v6, "suggestedPageSize");
  else
    v9 = 200;
  manager = self->_manager;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __67__FPPendingSetEnumerator_enumerateItemsForObserver_startingAtPage___block_invoke;
  v13[3] = &unk_1E444F538;
  v14 = v7;
  v15 = self;
  v16 = v6;
  v17 = v9;
  v11 = v6;
  v12 = v7;
  -[NSFileProviderManager domainServicerWithCompletionHandler:](manager, "domainServicerWithCompletionHandler:", v13);

}

void __67__FPPendingSetEnumerator_enumerateItemsForObserver_startingAtPage___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[5];
  id v6;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __67__FPPendingSetEnumerator_enumerateItemsForObserver_startingAtPage___block_invoke_2;
  v5[3] = &unk_1E444F5C8;
  v3 = *(_QWORD *)(a1 + 32);
  v5[4] = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 56);
  v6 = *(id *)(a1 + 48);
  objc_msgSend(a2, "enumeratePendingSetFromSyncAnchor:suggestedBatchSize:completionHandler:", v3, v4, v5);

}

void __67__FPPendingSetEnumerator_enumerateItemsForObserver_startingAtPage___block_invoke_2(uint64_t a1, void *a2, double a3, uint64_t a4, int a5, char a6, void *a7, void *a8, void *a9)
{
  id v16;
  id v17;
  id v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;

  v16 = a2;
  v17 = a7;
  v18 = a9;
  if (v18)
  {
    fp_current_or_default_log();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      __67__FPPendingSetEnumerator_enumerateItemsForObserver_startingAtPage___block_invoke_2_cold_1();

    objc_msgSend(*(id *)(a1 + 40), "finishEnumeratingWithError:", v18);
  }
  else
  {
    objc_msgSend(a8, "domainVersion");
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = *(_QWORD *)(a1 + 32);
    v22 = *(void **)(v21 + 16);
    *(_QWORD *)(v21 + 16) = v20;

    *(double *)(*(_QWORD *)(a1 + 32) + 24) = a3;
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 32) = a6;
    if (objc_msgSend(v16, "count"))
    {
      v23 = *(void **)(a1 + 40);
      objc_msgSend(v16, "fp_map:", &__block_literal_global_387);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "didEnumerateItems:", v24);

    }
    if (a5)
      v25 = v17;
    else
      v25 = 0;
    objc_msgSend(*(id *)(a1 + 40), "finishEnumeratingUpToPage:", v25);
  }

}

id __67__FPPendingSetEnumerator_enumerateItemsForObserver_startingAtPage___block_invoke_386(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;

  v2 = a2;
  objc_msgSend(v2, "itemVersion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "versionRewritingBeforeFirstSync");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setItemVersion:", v4);

  return v2;
}

- (void)enumerateChangesForObserver:(id)a3 fromSyncAnchor:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  NSFileProviderManager *manager;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  FPPendingSetEnumerator *v14;
  id v15;
  uint64_t v16;

  v6 = a3;
  v7 = a4;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v8 = objc_msgSend(v6, "suggestedBatchSize");
  else
    v8 = 200;
  manager = self->_manager;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __69__FPPendingSetEnumerator_enumerateChangesForObserver_fromSyncAnchor___block_invoke;
  v12[3] = &unk_1E444F538;
  v13 = v7;
  v14 = self;
  v15 = v6;
  v16 = v8;
  v10 = v6;
  v11 = v7;
  -[NSFileProviderManager domainServicerWithCompletionHandler:](manager, "domainServicerWithCompletionHandler:", v12);

}

void __69__FPPendingSetEnumerator_enumerateChangesForObserver_fromSyncAnchor___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[5];
  id v6;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __69__FPPendingSetEnumerator_enumerateChangesForObserver_fromSyncAnchor___block_invoke_2;
  v5[3] = &unk_1E444F5C8;
  v3 = *(_QWORD *)(a1 + 32);
  v5[4] = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 56);
  v6 = *(id *)(a1 + 48);
  objc_msgSend(a2, "enumeratePendingSetFromSyncAnchor:suggestedBatchSize:completionHandler:", v3, v4, v5);

}

void __69__FPPendingSetEnumerator_enumerateChangesForObserver_fromSyncAnchor___block_invoke_2(uint64_t a1, void *a2, void *a3, uint64_t a4, char a5, void *a6, void *a7, void *a8, double a9)
{
  id v17;
  id v18;
  id v19;
  id v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;

  v17 = a2;
  v18 = a3;
  v19 = a6;
  v20 = a8;
  if (v20)
  {
    fp_current_or_default_log();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      __67__FPPendingSetEnumerator_enumerateItemsForObserver_startingAtPage___block_invoke_2_cold_1();

    objc_msgSend(*(id *)(a1 + 40), "finishEnumeratingWithError:", v20);
  }
  else
  {
    objc_msgSend(a7, "domainVersion");
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = *(_QWORD *)(a1 + 32);
    v24 = *(void **)(v23 + 16);
    *(_QWORD *)(v23 + 16) = v22;

    *(double *)(*(_QWORD *)(a1 + 32) + 24) = a9;
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 32) = a5;
    if (objc_msgSend(v18, "count"))
    {
      v25 = *(void **)(a1 + 40);
      objc_msgSend(v18, "fp_map:", &__block_literal_global_390_0);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "didDeleteItemsWithIdentifiers:", v26);

    }
    if (objc_msgSend(v17, "count"))
    {
      v27 = *(void **)(a1 + 40);
      objc_msgSend(v17, "fp_map:", &__block_literal_global_392_0);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "didUpdateItems:", v28);

    }
    objc_msgSend(*(id *)(a1 + 40), "finishEnumeratingChangesUpToSyncAnchor:moreComing:", v19, a4);
  }

}

uint64_t __69__FPPendingSetEnumerator_enumerateChangesForObserver_fromSyncAnchor___block_invoke_389(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "identifier");
}

id __69__FPPendingSetEnumerator_enumerateChangesForObserver_fromSyncAnchor___block_invoke_2_391(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;

  v2 = a2;
  objc_msgSend(v2, "itemVersion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "versionRewritingBeforeFirstSync");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setItemVersion:", v4);

  return v2;
}

- (void)currentSyncAnchorWithCompletionHandler:(id)a3
{
  id v4;
  NSFileProviderManager *manager;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  manager = self->_manager;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __65__FPPendingSetEnumerator_currentSyncAnchorWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E444F580;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[NSFileProviderManager domainServicerWithCompletionHandler:](manager, "domainServicerWithCompletionHandler:", v7);

}

void __65__FPPendingSetEnumerator_currentSyncAnchorWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  _QWORD v4[5];
  id v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __65__FPPendingSetEnumerator_currentSyncAnchorWithCompletionHandler___block_invoke_2;
  v4[3] = &unk_1E444F630;
  v3 = *(void **)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  objc_msgSend(a2, "currentPendingSetSyncAnchorWithCompletionHandler:", v4);

}

uint64_t __65__FPPendingSetEnumerator_currentSyncAnchorWithCompletionHandler___block_invoke_2(uint64_t a1, char a2, double a3)
{
  *(double *)(*(_QWORD *)(a1 + 32) + 24) = a3;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 32) = a2;
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (NSFileProviderDomainVersion)domainVersion
{
  return self->_domainVersion;
}

- (double)refreshInterval
{
  return self->_refreshInterval;
}

- (BOOL)isMaximumSizeReached
{
  return self->_maximumSizeReached;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_domainVersion, 0);
  objc_storeStrong((id *)&self->_manager, 0);
}

void __67__FPPendingSetEnumerator_enumerateItemsForObserver_startingAtPage___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_2(&dword_1A0A34000, v0, v1, "[ERROR] Pending enumeration failed: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

@end
