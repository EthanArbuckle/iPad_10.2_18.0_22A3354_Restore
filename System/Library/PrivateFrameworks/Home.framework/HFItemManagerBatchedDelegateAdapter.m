@implementation HFItemManagerBatchedDelegateAdapter

uint64_t __84__HFItemManagerBatchedDelegateAdapter__itemProvidersToReloadForInvalidationReasons___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "invalidationReasons");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "intersectsSet:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (id)requestUpdateForItems:(id)a3 itemProviderInvalidationReasons:(id)a4 modifiedHome:(id)a5 senderSelector:(SEL)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  NSObject *v23;
  HFItemManagerBatchedDelegateAdapter *v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  HFItemManagerBatchedDelegateAdapter *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  int v36;
  HFItemManagerBatchedDelegateAdapter *v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  void *v43;
  __int16 v44;
  id v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (!objc_msgSend(v10, "count") && !objc_msgSend(v11, "count"))
  {
LABEL_16:
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_17;
  }
  -[HFItemManagerBatchedDelegateAdapter itemManager](self, "itemManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "home");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
  {
    HFLogForCategory(0x29uLL);
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a6);
      v30 = (HFItemManagerBatchedDelegateAdapter *)objc_claimAutoreleasedReturnValue();
      v36 = 138412290;
      v37 = v30;
      _os_log_error_impl(&dword_1DD34E000, v28, OS_LOG_TYPE_ERROR, "Request to update for %@, but no home set", (uint8_t *)&v36, 0xCu);

    }
    goto LABEL_16;
  }
  if (v12)
  {
    -[HFItemManagerBatchedDelegateAdapter itemManager](self, "itemManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "home");
    v16 = (id)objc_claimAutoreleasedReturnValue();

    if (v16 != v12)
    {
      HFLogForCategory(0x29uLL);
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a6);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "hf_prettyDescription");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        -[HFItemManagerBatchedDelegateAdapter itemManager](self, "itemManager");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "home");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "hf_prettyDescription");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = 138413314;
        v37 = self;
        v38 = 2112;
        v39 = v31;
        v40 = 2112;
        v41 = v32;
        v42 = 2112;
        v43 = v35;
        v44 = 2112;
        v45 = v10;
        _os_log_error_impl(&dword_1DD34E000, v17, OS_LOG_TYPE_ERROR, "Request %@ to update for %@, but home does not match. modifiedHome: %@ itemManager.home: %@. itemsToUpdate: %@", (uint8_t *)&v36, 0x34u);

      }
      goto LABEL_16;
    }
  }
  -[HFItemManagerBatchedDelegateAdapter batchedItemsToUpdate](self, "batchedItemsToUpdate");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "unionSet:", v10);

  -[HFItemManagerBatchedDelegateAdapter batchedItemProviderInvalidationReasons](self, "batchedItemProviderInvalidationReasons");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "addObjectsFromArray:", v11);

  -[HFItemManagerBatchedDelegateAdapter setBatchedSenderSelector:](self, "setBatchedSenderSelector:", a6);
  -[HFItemManagerBatchedDelegateAdapter finishExecutingBatchFuture](self, "finishExecutingBatchFuture");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFItemManagerBatchedDelegateAdapter uncommittedBatchingReasons](self, "uncommittedBatchingReasons");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "count");

  if (v22)
  {
    HFLogForCategory(0x29uLL);
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(a6);
      v24 = (HFItemManagerBatchedDelegateAdapter *)objc_claimAutoreleasedReturnValue();
      -[HFItemManagerBatchedDelegateAdapter uncommittedBatchingReasons](self, "uncommittedBatchingReasons");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "allObjects");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "componentsJoinedByString:", CFSTR(","));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = 138412546;
      v37 = v24;
      v38 = 2112;
      v39 = v27;
      _os_log_impl(&dword_1DD34E000, v23, OS_LOG_TYPE_DEFAULT, "Deferring update for: %@ because there are uncommitted delegate batching reasons: %@", (uint8_t *)&v36, 0x16u);

    }
  }
  else
  {
    -[HFItemManagerBatchedDelegateAdapter _executeBatch](self, "_executeBatch");
  }
LABEL_17:

  return v20;
}

- (void)_executeBatch
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  const char *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  _QWORD v20[2];
  _QWORD v21[3];

  v21[2] = *MEMORY[0x1E0C80C00];
  -[HFItemManagerBatchedDelegateAdapter startExecutingBatchFuture](self, "startExecutingBatchFuture");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  NAEmptyResult();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "finishWithResult:", v4);

  -[HFItemManagerBatchedDelegateAdapter batchedItemsToUpdate](self, "batchedItemsToUpdate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");

  -[HFItemManagerBatchedDelegateAdapter batchedItemProviderInvalidationReasons](self, "batchedItemProviderInvalidationReasons");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");

  v9 = -[HFItemManagerBatchedDelegateAdapter batchedSenderSelector](self, "batchedSenderSelector");
  -[HFItemManagerBatchedDelegateAdapter finishExecutingBatchFuture](self, "finishExecutingBatchFuture");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFItemManagerBatchedDelegateAdapter _reset](self, "_reset");
  -[HFItemManagerBatchedDelegateAdapter _itemProvidersToReloadForInvalidationReasons:](self, "_itemProvidersToReloadForInvalidationReasons:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "count"))
  {
    -[HFItemManagerBatchedDelegateAdapter itemManager](self, "itemManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFItemManagerBatchedDelegateAdapter readPolicy](self, "readPolicy");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "_reloadItemProviders:updateItems:shouldUpdateExistingItems:senderSelector:readPolicy:", v11, v6, 0, v9, v13);
    v14 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!objc_msgSend(v6, "count"))
    {
      objc_msgSend(v10, "finishWithNoResult");
      goto LABEL_6;
    }
    v12 = (void *)objc_opt_new();
    objc_msgSend(v12, "setSenderSelector:", v9);
    -[HFItemManagerBatchedDelegateAdapter readPolicy](self, "readPolicy");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setReadPolicy:", v15);

    v20[0] = HFItemUpdateOptionFullUpdateIndicated;
    v20[1] = HFItemUpdateOptionDelegateDispatched;
    v21[0] = MEMORY[0x1E0C9AAB0];
    v21[1] = MEMORY[0x1E0C9AAB0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setUpdateOptions:", v16);

    -[HFItemManagerBatchedDelegateAdapter itemManager](self, "itemManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "_updateResultsForItems:context:", v6, v12);
    v14 = objc_claimAutoreleasedReturnValue();
  }
  v17 = (void *)v14;
  objc_msgSend(v10, "completionHandlerAdapter");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (id)objc_msgSend(v17, "addCompletionBlock:", v18);

LABEL_6:
}

- (NAFuture)finishExecutingBatchFuture
{
  return self->_finishExecutingBatchFuture;
}

- (NAFuture)startExecutingBatchFuture
{
  return self->_startExecutingBatchFuture;
}

- (SEL)batchedSenderSelector
{
  return self->_batchedSenderSelector;
}

- (void)_reset
{
  void *v3;
  void *v4;
  id v5;
  id v6;

  -[HFItemManagerBatchedDelegateAdapter batchedItemsToUpdate](self, "batchedItemsToUpdate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAllObjects");

  -[HFItemManagerBatchedDelegateAdapter batchedItemProviderInvalidationReasons](self, "batchedItemProviderInvalidationReasons");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeAllObjects");

  -[HFItemManagerBatchedDelegateAdapter setBatchedSenderSelector:](self, "setBatchedSenderSelector:", 0);
  v5 = objc_alloc_init(MEMORY[0x1E0D519C0]);
  -[HFItemManagerBatchedDelegateAdapter setStartExecutingBatchFuture:](self, "setStartExecutingBatchFuture:", v5);

  v6 = objc_alloc_init(MEMORY[0x1E0D519C0]);
  -[HFItemManagerBatchedDelegateAdapter setFinishExecutingBatchFuture:](self, "setFinishExecutingBatchFuture:", v6);

}

- (NSMutableSet)batchedItemsToUpdate
{
  return self->_batchedItemsToUpdate;
}

- (NSMutableSet)batchedItemProviderInvalidationReasons
{
  return self->_batchedItemProviderInvalidationReasons;
}

- (void)setBatchedSenderSelector:(SEL)a3
{
  self->_batchedSenderSelector = a3;
}

- (void)setStartExecutingBatchFuture:(id)a3
{
  objc_storeStrong((id *)&self->_startExecutingBatchFuture, a3);
}

- (void)setFinishExecutingBatchFuture:(id)a3
{
  objc_storeStrong((id *)&self->_finishExecutingBatchFuture, a3);
}

- (id)_itemProvidersToReloadForInvalidationReasons:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  -[HFItemManagerBatchedDelegateAdapter itemManager](self, "itemManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "itemProviders");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __84__HFItemManagerBatchedDelegateAdapter__itemProvidersToReloadForInvalidationReasons___block_invoke;
  v10[3] = &unk_1EA72C350;
  v11 = v4;
  v7 = v4;
  objc_msgSend(v6, "na_filter:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (HFItemManager)itemManager
{
  return (HFItemManager *)objc_loadWeakRetained((id *)&self->_itemManager);
}

- (void)beginBatchWithReason:(id)a3
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t);
  void *v16;
  id v17;
  id v18[2];
  id location;

  v5 = a3;
  -[HFItemManagerBatchedDelegateAdapter uncommittedBatchingReasons](self, "uncommittedBatchingReasons");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (!v7)
  {
    -[HFItemManagerBatchedDelegateAdapter startExecutingBatchFuture](self, "startExecutingBatchFuture");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak(&location, self);
    objc_msgSend(MEMORY[0x1E0D519E8], "mainThreadScheduler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = MEMORY[0x1E0C809B0];
    v14 = 3221225472;
    v15 = __60__HFItemManagerBatchedDelegateAdapter_beginBatchWithReason___block_invoke;
    v16 = &unk_1EA727A98;
    objc_copyWeak(v18, &location);
    v10 = v8;
    v17 = v10;
    v18[1] = (id)a2;
    v11 = (id)objc_msgSend(v9, "afterDelay:performBlock:", &v13, 15.0);

    objc_destroyWeak(v18);
    objc_destroyWeak(&location);

  }
  -[HFItemManagerBatchedDelegateAdapter uncommittedBatchingReasons](self, "uncommittedBatchingReasons", v13, v14, v15, v16);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addObject:", v5);

}

- (id)commitBatchWithReason:(id)a3 senderSelector:(SEL)a4
{
  id v6;
  void *v7;
  char v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  int v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[HFItemManagerBatchedDelegateAdapter uncommittedBatchingReasons](self, "uncommittedBatchingReasons");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "containsObject:", v6);

  if ((v8 & 1) == 0)
  {
    HFLogForCategory(0x24uLL);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v15 = 138412290;
      v16 = v6;
      _os_log_error_impl(&dword_1DD34E000, v9, OS_LOG_TYPE_ERROR, "Requested to commit a HFItemManagerBatchedDelegateAdapter batch with a reason that wasn't in flight: %@", (uint8_t *)&v15, 0xCu);
    }

  }
  -[HFItemManagerBatchedDelegateAdapter uncommittedBatchingReasons](self, "uncommittedBatchingReasons");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "removeObject:", v6);

  -[HFItemManagerBatchedDelegateAdapter finishExecutingBatchFuture](self, "finishExecutingBatchFuture");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFItemManagerBatchedDelegateAdapter uncommittedBatchingReasons](self, "uncommittedBatchingReasons");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "count");

  if (!v13)
  {
    -[HFItemManagerBatchedDelegateAdapter setBatchedSenderSelector:](self, "setBatchedSenderSelector:", a4);
    -[HFItemManagerBatchedDelegateAdapter _executeBatch](self, "_executeBatch");
  }

  return v11;
}

- (NSMutableSet)uncommittedBatchingReasons
{
  return self->_uncommittedBatchingReasons;
}

- (HFCharacteristicReadPolicy)readPolicy
{
  return self->_readPolicy;
}

- (HFItemManagerBatchedDelegateAdapter)initWithItemManager:(id)a3 readPolicy:(id)a4
{
  id v6;
  id v7;
  HFItemManagerBatchedDelegateAdapter *v8;
  HFItemManagerBatchedDelegateAdapter *v9;
  uint64_t v10;
  NSMutableSet *uncommittedBatchingReasons;
  uint64_t v12;
  NSMutableSet *batchedItemsToUpdate;
  uint64_t v14;
  NSMutableSet *batchedItemProviderInvalidationReasons;
  NAFuture *v16;
  NAFuture *startExecutingBatchFuture;
  NAFuture *v18;
  NAFuture *finishExecutingBatchFuture;
  objc_super v21;

  v6 = a3;
  v7 = a4;
  v21.receiver = self;
  v21.super_class = (Class)HFItemManagerBatchedDelegateAdapter;
  v8 = -[HFItemManagerBatchedDelegateAdapter init](&v21, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_itemManager, v6);
    objc_storeStrong((id *)&v9->_readPolicy, a4);
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v10 = objc_claimAutoreleasedReturnValue();
    uncommittedBatchingReasons = v9->_uncommittedBatchingReasons;
    v9->_uncommittedBatchingReasons = (NSMutableSet *)v10;

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v12 = objc_claimAutoreleasedReturnValue();
    batchedItemsToUpdate = v9->_batchedItemsToUpdate;
    v9->_batchedItemsToUpdate = (NSMutableSet *)v12;

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v14 = objc_claimAutoreleasedReturnValue();
    batchedItemProviderInvalidationReasons = v9->_batchedItemProviderInvalidationReasons;
    v9->_batchedItemProviderInvalidationReasons = (NSMutableSet *)v14;

    v16 = (NAFuture *)objc_alloc_init(MEMORY[0x1E0D519C0]);
    startExecutingBatchFuture = v9->_startExecutingBatchFuture;
    v9->_startExecutingBatchFuture = v16;

    v18 = (NAFuture *)objc_alloc_init(MEMORY[0x1E0D519C0]);
    finishExecutingBatchFuture = v9->_finishExecutingBatchFuture;
    v9->_finishExecutingBatchFuture = v18;

  }
  return v9;
}

void __60__HFItemManagerBatchedDelegateAdapter_beginBatchWithReason___block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint8_t v16[128];
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained && (objc_msgSend(*(id *)(a1 + 32), "isFinished") & 1) == 0)
  {
    HFLogForCategory(0x38uLL);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(WeakRetained, "uncommittedBatchingReasons");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v18 = v4;
      _os_log_impl(&dword_1DD34E000, v3, OS_LOG_TYPE_INFO, "Waited 15s to start executing a batch delegate operation, but it never committed. Will recover by forcibly committing batch. Remaining uncommittedBatchingReasons: %@", buf, 0xCu);

    }
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    objc_msgSend(WeakRetained, "uncommittedBatchingReasons", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v5, "copy");

    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v13;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v13 != v9)
            objc_enumerationMutation(v6);
          v11 = (id)objc_msgSend(WeakRetained, "commitBatchWithReason:senderSelector:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v10++), *(_QWORD *)(a1 + 48));
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v8);
    }

  }
}

- (BOOL)hasUncommittedBatchingReasons
{
  void *v2;
  BOOL v3;

  -[HFItemManagerBatchedDelegateAdapter uncommittedBatchingReasons](self, "uncommittedBatchingReasons");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

- (void)setReadPolicy:(id)a3
{
  objc_storeStrong((id *)&self->_readPolicy, a3);
}

- (void)setUncommittedBatchingReasons:(id)a3
{
  objc_storeStrong((id *)&self->_uncommittedBatchingReasons, a3);
}

- (void)setBatchedItemsToUpdate:(id)a3
{
  objc_storeStrong((id *)&self->_batchedItemsToUpdate, a3);
}

- (void)setBatchedItemProviderInvalidationReasons:(id)a3
{
  objc_storeStrong((id *)&self->_batchedItemProviderInvalidationReasons, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_finishExecutingBatchFuture, 0);
  objc_storeStrong((id *)&self->_startExecutingBatchFuture, 0);
  objc_storeStrong((id *)&self->_batchedItemProviderInvalidationReasons, 0);
  objc_storeStrong((id *)&self->_batchedItemsToUpdate, 0);
  objc_storeStrong((id *)&self->_uncommittedBatchingReasons, 0);
  objc_storeStrong((id *)&self->_readPolicy, 0);
  objc_destroyWeak((id *)&self->_itemManager);
}

@end
