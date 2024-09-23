@implementation ASCLockupViewGroup

+ (OS_os_log)log
{
  if (log_onceToken_4 != -1)
    dispatch_once(&log_onceToken_4, &__block_literal_global_13);
  return (OS_os_log *)(id)log_log_4;
}

void __25__ASCLockupViewGroup_log__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.AppStoreComponents", "ASCLockupViewGroup");
  v1 = (void *)log_log_4;
  log_log_4 = (uint64_t)v0;

}

- (ASCLockupViewGroup)initWithName:(id)a3 lockupFetcher:(id)a4
{
  id v6;
  id v7;
  ASCLockupViewGroup *v8;
  uint64_t v9;
  NSString *name;
  NSMutableDictionary *v11;
  NSMutableDictionary *deferredRequests;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  +[ASCEligibility assertCurrentProcessEligibility]();
  v14.receiver = self;
  v14.super_class = (Class)ASCLockupViewGroup;
  v8 = -[ASCLockupViewGroup init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    name = v8->_name;
    v8->_name = (NSString *)v9;

    objc_storeStrong((id *)&v8->_lockupFetcher, a4);
    v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    deferredRequests = v8->_deferredRequests;
    v8->_deferredRequests = v11;

  }
  return v8;
}

- (ASCLockupViewGroup)initWithName:(id)a3
{
  id v4;
  void *v5;
  ASCLockupViewGroup *v6;

  v4 = a3;
  +[ASCLockupFetcher sharedFetcher](ASCLockupFetcher, "sharedFetcher");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[ASCLockupViewGroup initWithName:lockupFetcher:](self, "initWithName:lockupFetcher:", v4, v5);

  return v6;
}

- (ASCLockupViewGroup)init
{
  return -[ASCLockupViewGroup initWithName:](self, "initWithName:", 0);
}

- (NSMutableArray)prefetchSpans
{
  void *v3;
  void *v4;
  id v5;

  -[ASCLockupViewGroup prefetchSpansIfLoaded](self, "prefetchSpansIfLoaded");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    -[ASCLockupViewGroup setPrefetchSpansIfLoaded:](self, "setPrefetchSpansIfLoaded:", v5);
  }

  return (NSMutableArray *)v5;
}

- (void)scheduleBatchRequestsIfNeeded
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138543362;
  v3 = a1;
  _os_log_debug_impl(&dword_1BCB7B000, a2, OS_LOG_TYPE_DEBUG, "%{public}@: Scheduled batch request of deferred lockup requests", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_1_2();
}

void __51__ASCLockupViewGroup_scheduleBatchRequestsIfNeeded__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "performBatchRequests");

}

- (void)performBatchRequests
{
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "deferredRequests");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138543874;
  v8 = a1;
  v9 = 2048;
  v10 = objc_msgSend(v6, "count");
  v11 = 2048;
  v12 = objc_msgSend(a2, "count");
  _os_log_debug_impl(&dword_1BCB7B000, a3, OS_LOG_TYPE_DEBUG, "%{public}@: Started %ld requests in %ld batches", (uint8_t *)&v7, 0x20u);

}

void __42__ASCLockupViewGroup_performBatchRequests__block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v4 = *(void **)(a1 + 32);
  v5 = a3;
  v6 = a2;
  objc_msgSend(v4, "lockupFetcher");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "lockupWithRequest:", v6);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "completionHandlerAdapter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "addFinishBlock:", v8);
}

- (id)lockupWithRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  NSObject *v12;

  v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  -[ASCLockupViewGroup lockupFetcher](self, "lockupFetcher");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "loadedLockupWithRequest:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = v6;
  }
  else
  {
    -[ASCLockupViewGroup deferredRequests](self, "deferredRequests");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(v9, "asc_copy");
      v7 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = objc_alloc_init(MEMORY[0x1E0CFDBB8]);
      -[ASCLockupViewGroup deferredRequests](self, "deferredRequests");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setObject:forKeyedSubscript:", v10, v4);

      -[ASCLockupViewGroup scheduleBatchRequestsIfNeeded](self, "scheduleBatchRequestsIfNeeded");
      +[ASCLockupViewGroup log](ASCLockupViewGroup, "log");
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        -[ASCLockupViewGroup lockupWithRequest:].cold.1((uint64_t)self, (uint64_t)v4, v12);

      objc_msgSend(v10, "asc_copy");
      v7 = (id)objc_claimAutoreleasedReturnValue();

    }
  }

  return v7;
}

- (id)description
{
  ASCDescriber *v3;
  void *v4;
  void *v5;

  v3 = -[ASCDescriber initWithObject:]([ASCDescriber alloc], "initWithObject:", self);
  -[ASCLockupViewGroup name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v4, CFSTR("name"));

  -[ASCDescriber finalizeDescription](v3, "finalizeDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (NSString)name
{
  return self->_name;
}

- (ASCLockupFetcher)lockupFetcher
{
  return self->_lockupFetcher;
}

- (NSMutableDictionary)deferredRequests
{
  return self->_deferredRequests;
}

- (BOOL)hasScheduledBatchRequest
{
  return self->_hasScheduledBatchRequest;
}

- (void)setHasScheduledBatchRequest:(BOOL)a3
{
  self->_hasScheduledBatchRequest = a3;
}

- (NSMutableArray)prefetchSpansIfLoaded
{
  return self->_prefetchSpansIfLoaded;
}

- (void)setPrefetchSpansIfLoaded:(id)a3
{
  objc_storeStrong((id *)&self->_prefetchSpansIfLoaded, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_prefetchSpansIfLoaded, 0);
  objc_storeStrong((id *)&self->_deferredRequests, 0);
  objc_storeStrong((id *)&self->_lockupFetcher, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

- (void)_lockupRequestForBundleID:(id)a3 withContext:(id)a4 completionBlock:(id)a5
{
  -[ASCLockupViewGroup _lockupRequestForBundleID:withContext:enableAppDistribution:completionBlock:](self, "_lockupRequestForBundleID:withContext:enableAppDistribution:completionBlock:", a3, a4, 0, a5);
}

- (void)_lockupRequestForBundleID:(id)a3 withContext:(id)a4 enableAppDistribution:(BOOL)a5 completionBlock:(id)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  id v12;
  ASCSignpostSpan *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  void *v18;
  ASCSignpostSpan *v19;
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  _QWORD v24[4];
  ASCSignpostSpan *v25;
  id v26;
  id v27;
  id location;
  _QWORD v29[4];
  id v30;
  BOOL v31;

  v7 = a5;
  v10 = a3;
  v11 = a4;
  v12 = a6;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  v13 = objc_alloc_init(ASCSignpostSpan);
  -[ASCSignpostSpan beginEmitting](v13, "beginEmitting");
  +[ASCViewRender modelPrefetchDidBeginWithTag:](ASCViewRender, "modelPrefetchDidBeginWithTag:", -[ASCSignpostSpan primaryTag](v13, "primaryTag"));
  -[ASCLockupViewGroup lockupFetcher](self, "lockupFetcher");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "lockupForBundleID:withContext:enableAppDistribution:", v10, v11, v7);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = MEMORY[0x1E0C809B0];
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __108__ASCLockupViewGroup_BundleID___lockupRequestForBundleID_withContext_enableAppDistribution_completionBlock___block_invoke;
  v29[3] = &unk_1E7560E38;
  v17 = v11;
  v30 = v17;
  v31 = v7;
  objc_msgSend(v15, "thenWithBlock:", v29);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v24[0] = v16;
  v24[1] = 3221225472;
  v24[2] = __108__ASCLockupViewGroup_BundleID___lockupRequestForBundleID_withContext_enableAppDistribution_completionBlock___block_invoke_2;
  v24[3] = &unk_1E7560E88;
  v19 = v13;
  v25 = v19;
  objc_copyWeak(&v27, &location);
  v20 = v12;
  v26 = v20;
  objc_msgSend(v18, "addSuccessBlock:", v24);
  v22[0] = v16;
  v22[1] = 3221225472;
  v22[2] = __108__ASCLockupViewGroup_BundleID___lockupRequestForBundleID_withContext_enableAppDistribution_completionBlock___block_invoke_4;
  v22[3] = &unk_1E7560ED8;
  v21 = v20;
  v23 = v21;
  objc_msgSend(v18, "addErrorBlock:", v22);

  objc_destroyWeak(&v27);
  objc_destroyWeak(&location);

}

id __108__ASCLockupViewGroup_BundleID___lockupRequestForBundleID_withContext_enableAppDistribution_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  ASCLockupRequest *v4;
  void *v5;
  void *v6;
  ASCLockupRequest *v7;
  uint64_t v8;
  void *v9;

  v3 = a2;
  v4 = [ASCLockupRequest alloc];
  objc_msgSend(v3, "id");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "kind");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[ASCLockupRequest initWithID:kind:context:](v4, "initWithID:kind:context:", v5, v6, *(_QWORD *)(a1 + 32));
  if (*(_BYTE *)(a1 + 40))
  {
    -[ASCLockupRequest lockupRequestWithAppDistributionEnabled](v7, "lockupRequestWithAppDistributionEnabled");
    v8 = objc_claimAutoreleasedReturnValue();

    v7 = (ASCLockupRequest *)v8;
  }
  objc_msgSend(MEMORY[0x1E0CFDBD8], "promiseWithResult:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

void __108__ASCLockupViewGroup_BundleID___lockupRequestForBundleID_withContext_enableAppDistribution_completionBlock___block_invoke_2(id *a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id v9;
  id v10;

  v3 = a2;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __108__ASCLockupViewGroup_BundleID___lockupRequestForBundleID_withContext_enableAppDistribution_completionBlock___block_invoke_3;
  v6[3] = &unk_1E7560E60;
  v7 = a1[4];
  objc_copyWeak(&v10, a1 + 6);
  v4 = a1[5];
  v8 = v3;
  v9 = v4;
  v5 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

  objc_destroyWeak(&v10);
}

uint64_t __108__ASCLockupViewGroup_BundleID___lockupRequestForBundleID_withContext_enableAppDistribution_completionBlock___block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  void *v3;

  +[ASCViewRender modelPrefetchDidEndWithTag:](ASCViewRender, "modelPrefetchDidEndWithTag:", objc_msgSend(*(id *)(a1 + 32), "primaryTag"));
  objc_msgSend(*(id *)(a1 + 32), "endEmitting");
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "prefetchSpans");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", *(_QWORD *)(a1 + 32));

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

void __108__ASCLockupViewGroup_BundleID___lockupRequestForBundleID_withContext_enableAppDistribution_completionBlock___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __108__ASCLockupViewGroup_BundleID___lockupRequestForBundleID_withContext_enableAppDistribution_completionBlock___block_invoke_5;
  v6[3] = &unk_1E7560EB0;
  v4 = *(id *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

uint64_t __108__ASCLockupViewGroup_BundleID___lockupRequestForBundleID_withContext_enableAppDistribution_completionBlock___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

- (void)_cacheLockupsWithRequests:(id)a3 withCompletionBlock:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  ASCSignpostSpan *v9;
  NSObject *v10;
  dispatch_queue_t v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  id v15;
  NSObject *v16;
  NSObject *v17;
  ASCSignpostSpan *v18;
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  ASCSignpostSpan *v23;
  id v24;
  id v25;
  id location;
  _QWORD v27[4];
  NSObject *v28;
  id v29;
  ASCLockupViewGroup *v30;
  dispatch_queue_t v31;

  v6 = a4;
  v7 = a3;
  v8 = MEMORY[0x1E0C80D38];
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  v9 = objc_alloc_init(ASCSignpostSpan);
  -[ASCSignpostSpan beginEmitting](v9, "beginEmitting");
  +[ASCViewRender modelPrefetchDidBeginWithTag:](ASCViewRender, "modelPrefetchDidBeginWithTag:", -[ASCSignpostSpan primaryTag](v9, "primaryTag"));
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = dispatch_queue_create("ASCLockupViewGroup.cachingLockups", v10);

  v12 = dispatch_group_create();
  dispatch_group_enter(v12);
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v7, "count"));
  v14 = MEMORY[0x1E0C809B0];
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __78__ASCLockupViewGroup_Fetching___cacheLockupsWithRequests_withCompletionBlock___block_invoke;
  v27[3] = &unk_1E7560FE0;
  v28 = v12;
  v15 = v13;
  v29 = v15;
  v30 = self;
  v31 = v11;
  v16 = v11;
  v17 = v12;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v27);

  dispatch_group_leave(v17);
  objc_initWeak(&location, self);
  v21[0] = v14;
  v21[1] = 3221225472;
  v21[2] = __78__ASCLockupViewGroup_Fetching___cacheLockupsWithRequests_withCompletionBlock___block_invoke_6;
  v21[3] = &unk_1E7561028;
  v22 = v15;
  v23 = v9;
  v18 = v9;
  v19 = v15;
  objc_copyWeak(&v25, &location);
  v24 = v6;
  v20 = v6;
  dispatch_group_notify(v17, v8, v21);

  objc_destroyWeak(&v25);
  objc_destroyWeak(&location);

}

void __78__ASCLockupViewGroup_Fetching___cacheLockupsWithRequests_withCompletionBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;

  v5 = a2;
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  v6 = *(void **)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v7);

  objc_msgSend(*(id *)(a1 + 48), "lockupWithRequest:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __78__ASCLockupViewGroup_Fetching___cacheLockupsWithRequests_withCompletionBlock___block_invoke_2;
  v15[3] = &unk_1E7560F90;
  v16 = *(id *)(a1 + 56);
  v10 = *(id *)(a1 + 40);
  v20 = a3;
  v17 = v10;
  v18 = v5;
  v19 = *(id *)(a1 + 32);
  v11 = v5;
  objc_msgSend(v8, "addSuccessBlock:", v15);
  v12[0] = v9;
  v12[1] = 3221225472;
  v12[2] = __78__ASCLockupViewGroup_Fetching___cacheLockupsWithRequests_withCompletionBlock___block_invoke_4;
  v12[3] = &unk_1E7560FB8;
  v13 = *(id *)(a1 + 56);
  v14 = *(id *)(a1 + 32);
  objc_msgSend(v8, "addErrorBlock:", v12);

}

void __78__ASCLockupViewGroup_Fetching___cacheLockupsWithRequests_withCompletionBlock___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  id v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  id v7;
  id v8;
  uint64_t v9;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __78__ASCLockupViewGroup_Fetching___cacheLockupsWithRequests_withCompletionBlock___block_invoke_3;
  v5[3] = &unk_1E7560C28;
  v2 = *(NSObject **)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 64);
  v6 = v3;
  v9 = v4;
  v7 = *(id *)(a1 + 48);
  v8 = *(id *)(a1 + 56);
  dispatch_async(v2, v5);

}

void __78__ASCLockupViewGroup_Fetching___cacheLockupsWithRequests_withCompletionBlock___block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "replaceObjectAtIndex:withObject:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40));
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

void __78__ASCLockupViewGroup_Fetching___cacheLockupsWithRequests_withCompletionBlock___block_invoke_4(uint64_t a1)
{
  NSObject *v1;
  _QWORD block[4];
  id v3;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __78__ASCLockupViewGroup_Fetching___cacheLockupsWithRequests_withCompletionBlock___block_invoke_5;
  block[3] = &unk_1E7560398;
  v1 = *(NSObject **)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  dispatch_async(v1, block);

}

void __78__ASCLockupViewGroup_Fetching___cacheLockupsWithRequests_withCompletionBlock___block_invoke_5(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __78__ASCLockupViewGroup_Fetching___cacheLockupsWithRequests_withCompletionBlock___block_invoke_6(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  uint64_t v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "ams_removeObjectsPassingTest:", &__block_literal_global_14);
  +[ASCViewRender modelPrefetchDidEndWithTag:](ASCViewRender, "modelPrefetchDidEndWithTag:", objc_msgSend(*(id *)(a1 + 40), "primaryTag"));
  objc_msgSend(*(id *)(a1 + 40), "endEmitting");
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "prefetchSpans");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", *(_QWORD *)(a1 + 40));

  v4 = *(_QWORD *)(a1 + 48);
  v5 = (id)objc_msgSend(*(id *)(a1 + 32), "copy");
  (*(void (**)(uint64_t, id))(v4 + 16))(v4, v5);

}

BOOL __78__ASCLockupViewGroup_Fetching___cacheLockupsWithRequests_withCompletionBlock___block_invoke_7(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = (void *)MEMORY[0x1E0C99E38];
  v3 = a2;
  objc_msgSend(v2, "null");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  return v4 == v3;
}

- (void)_lockupDictionaryForRequest:(id)a3 includingKeys:(id)a4 withCompletionBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  ASCSignpostSpan *v11;
  void *v12;
  uint64_t v13;
  ASCSignpostSpan *v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  _QWORD v20[4];
  ASCSignpostSpan *v21;
  id v22;
  id v23;
  id v24;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  v11 = objc_alloc_init(ASCSignpostSpan);
  -[ASCSignpostSpan beginEmitting](v11, "beginEmitting");
  +[ASCViewRender modelPrefetchDidBeginWithTag:](ASCViewRender, "modelPrefetchDidBeginWithTag:", -[ASCSignpostSpan primaryTag](v11, "primaryTag"));
  objc_initWeak(&location, self);
  -[ASCLockupViewGroup lockupWithRequest:](self, "lockupWithRequest:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __94__ASCLockupViewGroup_Fetching___lockupDictionaryForRequest_includingKeys_withCompletionBlock___block_invoke;
  v20[3] = &unk_1E7561078;
  v14 = v11;
  v21 = v14;
  objc_copyWeak(&v24, &location);
  v15 = v9;
  v22 = v15;
  v16 = v10;
  v23 = v16;
  objc_msgSend(v12, "addSuccessBlock:", v20);
  v18[0] = v13;
  v18[1] = 3221225472;
  v18[2] = __94__ASCLockupViewGroup_Fetching___lockupDictionaryForRequest_includingKeys_withCompletionBlock___block_invoke_3;
  v18[3] = &unk_1E7560ED8;
  v17 = v16;
  v19 = v17;
  objc_msgSend(v12, "addErrorBlock:", v18);

  objc_destroyWeak(&v24);
  objc_destroyWeak(&location);

}

void __94__ASCLockupViewGroup_Fetching___lockupDictionaryForRequest_includingKeys_withCompletionBlock___block_invoke(id *a1, void *a2)
{
  id v3;
  id v4;
  _QWORD block[4];
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;

  v3 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __94__ASCLockupViewGroup_Fetching___lockupDictionaryForRequest_includingKeys_withCompletionBlock___block_invoke_2;
  block[3] = &unk_1E7561050;
  v6 = a1[4];
  objc_copyWeak(&v10, a1 + 7);
  v7 = v3;
  v8 = a1[5];
  v9 = a1[6];
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v10);
}

void __94__ASCLockupViewGroup_Fetching___lockupDictionaryForRequest_includingKeys_withCompletionBlock___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[4];
  uint64_t v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  +[ASCViewRender modelPrefetchDidEndWithTag:](ASCViewRender, "modelPrefetchDidEndWithTag:", objc_msgSend(*(id *)(a1 + 32), "primaryTag"));
  objc_msgSend(*(id *)(a1 + 32), "endEmitting");
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  objc_msgSend(WeakRetained, "prefetchSpans");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", *(_QWORD *)(a1 + 32));

  v17 = a1;
  v4 = *(void **)(a1 + 40);
  v5 = *(void **)(a1 + 48);
  v6 = v4;
  v7 = v5;
  v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v19;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v19 != v12)
          objc_enumerationMutation(v9);
        v14 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v13);
        if (_ASCLockupKeyGetAllCases_onceToken != -1)
          dispatch_once(&_ASCLockupKeyGetAllCases_onceToken, &__block_literal_global_92);
        if ((objc_msgSend((id)_ASCLockupKeyGetAllCases_allCases, "containsObject:", v14) & 1) != 0)
        {
          objc_msgSend(v6, "valueForKey:", v14);
          v15 = objc_claimAutoreleasedReturnValue();
          if (v15)
            objc_msgSend(v8, "setObject:forKeyedSubscript:", v15, v14);
        }
        else
        {
          +[ASCLockupViewGroup log](ASCLockupViewGroup, "log");
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v23 = v14;
            _os_log_error_impl(&dword_1BCB7B000, v15, OS_LOG_TYPE_ERROR, "*** Ignoring unknown _ASCLockupKey %{safe}@", buf, 0xCu);
          }
        }

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
    }
    while (v11);
  }

  v16 = (void *)objc_msgSend(v8, "copy");
  (*(void (**)(void))(*(_QWORD *)(v17 + 56) + 16))();

}

void __94__ASCLockupViewGroup_Fetching___lockupDictionaryForRequest_includingKeys_withCompletionBlock___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __94__ASCLockupViewGroup_Fetching___lockupDictionaryForRequest_includingKeys_withCompletionBlock___block_invoke_4;
  v6[3] = &unk_1E7560EB0;
  v4 = *(id *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

uint64_t __94__ASCLockupViewGroup_Fetching___lockupDictionaryForRequest_includingKeys_withCompletionBlock___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

- (void)_cacheLockupsWithCollectionRequest:(id)a3 withCompletionBlock:(id)a4
{
  id v6;
  id v7;
  ASCSignpostSpan *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  ASCSignpostSpan *v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  ASCSignpostSpan *v19;
  id v20;
  id v21;
  id v22;
  id location;

  v6 = a3;
  v7 = a4;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  v8 = objc_alloc_init(ASCSignpostSpan);
  -[ASCSignpostSpan beginEmitting](v8, "beginEmitting");
  +[ASCViewRender modelPrefetchDidBeginWithTag:](ASCViewRender, "modelPrefetchDidBeginWithTag:", -[ASCSignpostSpan primaryTag](v8, "primaryTag"));
  objc_initWeak(&location, self);
  -[ASCLockupViewGroup lockupFetcher](self, "lockupFetcher");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "collectionWithRequest:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __87__ASCLockupViewGroup_Fetching___cacheLockupsWithCollectionRequest_withCompletionBlock___block_invoke;
  v18[3] = &unk_1E75610C8;
  v12 = v8;
  v19 = v12;
  objc_copyWeak(&v22, &location);
  v13 = v6;
  v20 = v13;
  v14 = v7;
  v21 = v14;
  objc_msgSend(v10, "addSuccessBlock:", v18);
  v16[0] = v11;
  v16[1] = 3221225472;
  v16[2] = __87__ASCLockupViewGroup_Fetching___cacheLockupsWithCollectionRequest_withCompletionBlock___block_invoke_4;
  v16[3] = &unk_1E7560ED8;
  v15 = v14;
  v17 = v15;
  objc_msgSend(v10, "addErrorBlock:", v16);

  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);

}

void __87__ASCLockupViewGroup_Fetching___cacheLockupsWithCollectionRequest_withCompletionBlock___block_invoke(id *a1, void *a2)
{
  id v3;
  id v4;
  _QWORD block[4];
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;

  v3 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __87__ASCLockupViewGroup_Fetching___cacheLockupsWithCollectionRequest_withCompletionBlock___block_invoke_2;
  block[3] = &unk_1E7561050;
  v6 = a1[4];
  objc_copyWeak(&v10, a1 + 7);
  v7 = v3;
  v8 = a1[5];
  v9 = a1[6];
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v10);
}

void __87__ASCLockupViewGroup_Fetching___cacheLockupsWithCollectionRequest_withCompletionBlock___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[4];
  id v7;

  +[ASCViewRender modelPrefetchDidEndWithTag:](ASCViewRender, "modelPrefetchDidEndWithTag:", objc_msgSend(*(id *)(a1 + 32), "primaryTag"));
  objc_msgSend(*(id *)(a1 + 32), "endEmitting");
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  objc_msgSend(WeakRetained, "prefetchSpans");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", *(_QWORD *)(a1 + 32));

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __87__ASCLockupViewGroup_Fetching___cacheLockupsWithCollectionRequest_withCompletionBlock___block_invoke_3;
  v6[3] = &unk_1E75610A0;
  v4 = *(void **)(a1 + 40);
  v7 = *(id *)(a1 + 48);
  objc_msgSend(v4, "ams_mapWithTransform:", v6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

}

ASCLockupRequest *__87__ASCLockupViewGroup_Fetching___cacheLockupsWithCollectionRequest_withCompletionBlock___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  ASCLockupRequest *v4;
  void *v5;
  void *v6;
  void *v7;
  ASCLockupRequest *v8;

  v3 = a2;
  v4 = [ASCLockupRequest alloc];
  objc_msgSend(v3, "id");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "kind");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[ASCLockupRequest initWithID:kind:context:](v4, "initWithID:kind:context:", v5, v6, v7);

  return v8;
}

void __87__ASCLockupViewGroup_Fetching___cacheLockupsWithCollectionRequest_withCompletionBlock___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __87__ASCLockupViewGroup_Fetching___cacheLockupsWithCollectionRequest_withCompletionBlock___block_invoke_5;
  v6[3] = &unk_1E7560EB0;
  v4 = *(id *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

uint64_t __87__ASCLockupViewGroup_Fetching___cacheLockupsWithCollectionRequest_withCompletionBlock___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

- (void)_prefetchLockupsWithRequests:(id)a3 withCompletionBlock:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  ASCSignpostSpan *v9;
  NSObject *v10;
  dispatch_queue_t v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  id v15;
  NSObject *v16;
  NSObject *v17;
  ASCSignpostSpan *v18;
  id v19;
  id v20;
  _QWORD v21[4];
  ASCSignpostSpan *v22;
  id v23;
  id v24;
  id v25;
  id location;
  _QWORD v27[4];
  NSObject *v28;
  id v29;
  ASCLockupViewGroup *v30;
  dispatch_queue_t v31;

  v6 = a4;
  v7 = a3;
  v8 = MEMORY[0x1E0C80D38];
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  v9 = objc_alloc_init(ASCSignpostSpan);
  -[ASCSignpostSpan beginEmitting](v9, "beginEmitting");
  +[ASCViewRender modelPrefetchDidBeginWithTag:](ASCViewRender, "modelPrefetchDidBeginWithTag:", -[ASCSignpostSpan primaryTag](v9, "primaryTag"));
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = dispatch_queue_create("ASCLockupViewGroup.prefetchingResults", v10);

  v12 = dispatch_group_create();
  dispatch_group_enter(v12);
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v7, "count"));
  v14 = MEMORY[0x1E0C809B0];
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __92__ASCLockupViewGroup_Fetching_Deprecated___prefetchLockupsWithRequests_withCompletionBlock___block_invoke;
  v27[3] = &unk_1E7560FE0;
  v28 = v12;
  v15 = v13;
  v29 = v15;
  v30 = self;
  v31 = v11;
  v16 = v11;
  v17 = v12;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v27);

  dispatch_group_leave(v17);
  objc_initWeak(&location, self);
  v21[0] = v14;
  v21[1] = 3221225472;
  v21[2] = __92__ASCLockupViewGroup_Fetching_Deprecated___prefetchLockupsWithRequests_withCompletionBlock___block_invoke_4;
  v21[3] = &unk_1E7560E60;
  v22 = v9;
  v18 = v9;
  objc_copyWeak(&v25, &location);
  v23 = v15;
  v24 = v6;
  v19 = v15;
  v20 = v6;
  dispatch_group_notify(v17, v8, v21);

  objc_destroyWeak(&v25);
  objc_destroyWeak(&location);

}

void __92__ASCLockupViewGroup_Fetching_Deprecated___prefetchLockupsWithRequests_withCompletionBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;

  v5 = a2;
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  v6 = *(void **)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v7);

  objc_msgSend(*(id *)(a1 + 48), "lockupWithRequest:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __92__ASCLockupViewGroup_Fetching_Deprecated___prefetchLockupsWithRequests_withCompletionBlock___block_invoke_2;
  v10[3] = &unk_1E75610F0;
  v11 = v5;
  v12 = *(id *)(a1 + 56);
  v13 = *(id *)(a1 + 40);
  v15 = a3;
  v14 = *(id *)(a1 + 32);
  v9 = v5;
  objc_msgSend(v8, "addFinishBlock:", v10);

}

void __92__ASCLockupViewGroup_Fetching_Deprecated___prefetchLockupsWithRequests_withCompletionBlock___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  _ASCLockupResponse *v7;
  NSObject *v8;
  id v9;
  void *v10;
  _ASCLockupResponse *v11;
  _QWORD v12[4];
  id v13;
  _ASCLockupResponse *v14;
  id v15;
  uint64_t v16;

  v5 = a3;
  v6 = a2;
  v7 = -[_ASCLockupResponse initWithRequest:lockup:error:]([_ASCLockupResponse alloc], "initWithRequest:lockup:error:", *(_QWORD *)(a1 + 32), v6, v5);

  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __92__ASCLockupViewGroup_Fetching_Deprecated___prefetchLockupsWithRequests_withCompletionBlock___block_invoke_3;
  v12[3] = &unk_1E7560C28;
  v8 = *(NSObject **)(a1 + 40);
  v9 = *(id *)(a1 + 48);
  v10 = *(void **)(a1 + 56);
  v16 = *(_QWORD *)(a1 + 64);
  v13 = v9;
  v14 = v7;
  v15 = v10;
  v11 = v7;
  dispatch_async(v8, v12);

}

void __92__ASCLockupViewGroup_Fetching_Deprecated___prefetchLockupsWithRequests_withCompletionBlock___block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "replaceObjectAtIndex:withObject:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40));
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

void __92__ASCLockupViewGroup_Fetching_Deprecated___prefetchLockupsWithRequests_withCompletionBlock___block_invoke_4(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  uint64_t v4;
  id v5;

  +[ASCViewRender modelPrefetchDidEndWithTag:](ASCViewRender, "modelPrefetchDidEndWithTag:", objc_msgSend(*(id *)(a1 + 32), "primaryTag"));
  objc_msgSend(*(id *)(a1 + 32), "endEmitting");
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "prefetchSpans");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", *(_QWORD *)(a1 + 32));

  v4 = *(_QWORD *)(a1 + 48);
  v5 = (id)objc_msgSend(*(id *)(a1 + 40), "copy");
  (*(void (**)(uint64_t, id))(v4 + 16))(v4, v5);

}

+ (void)createConnectionWithCompletionBlock:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v3 = a3;
  +[ASCEligibility assertCurrentProcessEligibility]();
  +[ASCServicesConnection sharedConnection](ASCServicesConnection, "sharedConnection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "testConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __72__ASCLockupViewGroup_ForSpotlight__createConnectionWithCompletionBlock___block_invoke;
  v7[3] = &unk_1E7560D98;
  v8 = v3;
  v6 = v3;
  objc_msgSend(v5, "addFinishBlock:", v7);

}

uint64_t __72__ASCLockupViewGroup_ForSpotlight__createConnectionWithCompletionBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_lockupFromMediaAPIResponse:(id)a3 withContext:(id)a4 completionBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  -[ASCLockupViewGroup lockupFetcher](self, "lockupFetcher");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "lockupFromMediaAPIResponse:withContext:", v10, v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __96__ASCLockupViewGroup_FromMAPIResponse___lockupFromMediaAPIResponse_withContext_completionBlock___block_invoke;
  v18[3] = &unk_1E7561138;
  v14 = v8;
  v19 = v14;
  objc_msgSend(v12, "addSuccessBlock:", v18);
  v16[0] = v13;
  v16[1] = 3221225472;
  v16[2] = __96__ASCLockupViewGroup_FromMAPIResponse___lockupFromMediaAPIResponse_withContext_completionBlock___block_invoke_3;
  v16[3] = &unk_1E7560ED8;
  v17 = v14;
  v15 = v14;
  objc_msgSend(v12, "addErrorBlock:", v16);

}

void __96__ASCLockupViewGroup_FromMAPIResponse___lockupFromMediaAPIResponse_withContext_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __96__ASCLockupViewGroup_FromMAPIResponse___lockupFromMediaAPIResponse_withContext_completionBlock___block_invoke_2;
  v6[3] = &unk_1E7560EB0;
  v4 = *(id *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

uint64_t __96__ASCLockupViewGroup_FromMAPIResponse___lockupFromMediaAPIResponse_withContext_completionBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

void __96__ASCLockupViewGroup_FromMAPIResponse___lockupFromMediaAPIResponse_withContext_completionBlock___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __96__ASCLockupViewGroup_FromMAPIResponse___lockupFromMediaAPIResponse_withContext_completionBlock___block_invoke_4;
  v6[3] = &unk_1E7560EB0;
  v4 = *(id *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

uint64_t __96__ASCLockupViewGroup_FromMAPIResponse___lockupFromMediaAPIResponse_withContext_completionBlock___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

- (void)lockupWithRequest:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138543618;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_debug_impl(&dword_1BCB7B000, log, OS_LOG_TYPE_DEBUG, "%{public}@: Deferred request %@", (uint8_t *)&v3, 0x16u);
  OUTLINED_FUNCTION_1_2();
}

@end
