@implementation FPMaterializedSetEnumerator

- (FPMaterializedSetEnumerator)initWithManager:(id)a3
{
  id v5;
  FPMaterializedSetEnumerator *v6;
  FPMaterializedSetEnumerator *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FPMaterializedSetEnumerator;
  v6 = -[FPMaterializedSetEnumerator init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_manager, a3);

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
  FPMaterializedSetEnumerator *v15;
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
  v13[2] = __72__FPMaterializedSetEnumerator_enumerateItemsForObserver_startingAtPage___block_invoke;
  v13[3] = &unk_1E444F538;
  v14 = v7;
  v15 = self;
  v16 = v6;
  v17 = v9;
  v11 = v6;
  v12 = v7;
  -[NSFileProviderManager domainServicerWithCompletionHandler:](manager, "domainServicerWithCompletionHandler:", v13);

}

void __72__FPMaterializedSetEnumerator_enumerateItemsForObserver_startingAtPage___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[5];
  id v6;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __72__FPMaterializedSetEnumerator_enumerateItemsForObserver_startingAtPage___block_invoke_2;
  v5[3] = &unk_1E444F510;
  v3 = *(_QWORD *)(a1 + 32);
  v5[4] = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 56);
  v6 = *(id *)(a1 + 48);
  objc_msgSend(a2, "enumerateMaterializedSetFromSyncAnchor:suggestedBatchSize:completionHandler:", v3, v4, v5);

}

void __72__FPMaterializedSetEnumerator_enumerateItemsForObserver_startingAtPage___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, int a4, void *a5, uint64_t a6, uint64_t a7)
{
  id v11;
  void *v12;
  void *v13;
  id v14;
  id v15;

  v15 = a2;
  v11 = a5;
  if (a7)
  {
    objc_msgSend(*(id *)(a1 + 40), "finishEnumeratingWithError:", a7);
  }
  else
  {
    if (objc_msgSend(v15, "count"))
    {
      v12 = *(void **)(a1 + 40);
      objc_msgSend(v15, "fp_map:", &__block_literal_global_364);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "didEnumerateItems:", v13);

    }
    if (a4)
      v14 = v11;
    else
      v14 = 0;
    objc_msgSend(*(id *)(a1 + 40), "finishEnumeratingUpToPage:", v14);
  }

}

id __72__FPMaterializedSetEnumerator_enumerateItemsForObserver_startingAtPage___block_invoke_3(uint64_t a1, void *a2)
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
  FPMaterializedSetEnumerator *v14;
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
  v12[2] = __74__FPMaterializedSetEnumerator_enumerateChangesForObserver_fromSyncAnchor___block_invoke;
  v12[3] = &unk_1E444F538;
  v13 = v7;
  v14 = self;
  v15 = v6;
  v16 = v8;
  v10 = v6;
  v11 = v7;
  -[NSFileProviderManager domainServicerWithCompletionHandler:](manager, "domainServicerWithCompletionHandler:", v12);

}

void __74__FPMaterializedSetEnumerator_enumerateChangesForObserver_fromSyncAnchor___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[5];
  id v6;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __74__FPMaterializedSetEnumerator_enumerateChangesForObserver_fromSyncAnchor___block_invoke_2;
  v5[3] = &unk_1E444F510;
  v3 = *(_QWORD *)(a1 + 32);
  v5[4] = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 56);
  v6 = *(id *)(a1 + 48);
  objc_msgSend(a2, "enumerateMaterializedSetFromSyncAnchor:suggestedBatchSize:completionHandler:", v3, v4, v5);

}

void __74__FPMaterializedSetEnumerator_enumerateChangesForObserver_fromSyncAnchor___block_invoke_2(uint64_t a1, void *a2, void *a3, uint64_t a4, void *a5, uint64_t a6, uint64_t a7)
{
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v18 = a2;
  v12 = a3;
  v13 = a5;
  if (a7)
  {
    objc_msgSend(*(id *)(a1 + 40), "finishEnumeratingWithError:", a7);
  }
  else
  {
    if (objc_msgSend(v12, "count"))
    {
      v14 = *(void **)(a1 + 40);
      objc_msgSend(v12, "fp_map:", &__block_literal_global_369);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "didDeleteItemsWithIdentifiers:", v15);

    }
    if (objc_msgSend(v18, "count"))
    {
      v16 = *(void **)(a1 + 40);
      objc_msgSend(v18, "fp_map:", &__block_literal_global_370);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "didUpdateItems:", v17);

    }
    objc_msgSend(*(id *)(a1 + 40), "finishEnumeratingChangesUpToSyncAnchor:moreComing:", v13, a4);
  }

}

uint64_t __74__FPMaterializedSetEnumerator_enumerateChangesForObserver_fromSyncAnchor___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "identifier");
}

id __74__FPMaterializedSetEnumerator_enumerateChangesForObserver_fromSyncAnchor___block_invoke_4(uint64_t a1, void *a2)
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
  v7[2] = __70__FPMaterializedSetEnumerator_currentSyncAnchorWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E444F580;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[NSFileProviderManager domainServicerWithCompletionHandler:](manager, "domainServicerWithCompletionHandler:", v7);

}

uint64_t __70__FPMaterializedSetEnumerator_currentSyncAnchorWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "currentMaterializedSetSyncAnchorWithCompletionHandler:", *(_QWORD *)(a1 + 40));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_manager, 0);
}

@end
