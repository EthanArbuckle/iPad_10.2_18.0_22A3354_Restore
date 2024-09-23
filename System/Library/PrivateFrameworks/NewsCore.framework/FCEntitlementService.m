@implementation FCEntitlementService

- (void)performEntitlementWithIgnoreCache:(BOOL)a3 completion:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  BOOL v12;

  v6 = a4;
  -[FCEntitlementService configurationManager](self, "configurationManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  dispatch_get_global_queue(25, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __69__FCEntitlementService_performEntitlementWithIgnoreCache_completion___block_invoke;
  v10[3] = &unk_1E4643300;
  v12 = a3;
  v10[4] = self;
  v11 = v6;
  v9 = v6;
  objc_msgSend(v7, "fetchConfigurationIfNeededWithCompletionQueue:completion:", v8, v10);

}

- (FCCoreConfigurationManager)configurationManager
{
  return self->_configurationManager;
}

uint64_t __69__FCEntitlementService_performEntitlementWithIgnoreCache_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_performEntitlementWithIgnoreCache:requestTimeoutDuration:completion:", *(unsigned __int8 *)(a1 + 48), objc_msgSend(a2, "entitlementsRequestTimeoutDurationInSeconds"), *(_QWORD *)(a1 + 40));
}

- (FCEntitlementService)initWithConfigurationManager:(id)a3
{
  id v5;
  FCEntitlementService *v6;
  uint64_t v7;
  NSMutableArray *blocks;
  NFMutexLock *v9;
  NFMutexLock *accessLock;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)FCEntitlementService;
  v6 = -[FCEntitlementService init](&v12, sel_init);
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v7 = objc_claimAutoreleasedReturnValue();
    blocks = v6->_blocks;
    v6->_blocks = (NSMutableArray *)v7;

    v9 = (NFMutexLock *)objc_alloc_init(MEMORY[0x1E0D60AE0]);
    accessLock = v6->_accessLock;
    v6->_accessLock = v9;

    objc_storeStrong((id *)&v6->_configurationManager, a3);
  }

  return v6;
}

void __54__FCEntitlementService_startTimerWithTimeoutDuration___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0C99E88], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", *(_QWORD *)(a1 + 32), sel_clearTimer, 0, 0, *(double *)(a1 + 40));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setEntitlementRequestTimer:", v2);

}

- (void)_performEntitlementWithIgnoreCache:(BOOL)a3 requestTimeoutDuration:(int64_t)a4 completion:(id)a5
{
  _BOOL8 v6;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t, void *, uint64_t, void *);
  void *v22;
  FCEntitlementService *v23;
  id v24;
  uint8_t buf[4];
  uint64_t v26;
  uint64_t v27;

  v6 = a3;
  v27 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  -[FCEntitlementService accessLock](self, "accessLock");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "lock");

  -[FCEntitlementService blocks](self, "blocks");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = _Block_copy(v8);

  objc_msgSend(v10, "addObject:", v11);
  if (-[FCEntitlementService requestInProgress](self, "requestInProgress"))
  {
    v12 = (void *)FCPurchaseLog;
    if (os_log_type_enabled((os_log_t)FCPurchaseLog, OS_LOG_TYPE_DEBUG))
    {
      v18 = v12;
      *(_DWORD *)buf = 138412290;
      v26 = objc_opt_class();
      _os_log_debug_impl(&dword_1A1B90000, v18, OS_LOG_TYPE_DEBUG, "%@ Entitlements request in progress returning early", buf, 0xCu);

    }
    -[FCEntitlementService accessLock](self, "accessLock");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "unlock");
  }
  else
  {
    -[FCEntitlementService startTimerWithTimeoutDuration:](self, "startTimerWithTimeoutDuration:", (double)a4);
    -[FCEntitlementService setRequestInProgress:](self, "setRequestInProgress:", 1);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = FCPurchaseLog;
    if (os_log_type_enabled((os_log_t)FCPurchaseLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v26) = v6;
      _os_log_impl(&dword_1A1B90000, v15, OS_LOG_TYPE_DEFAULT, "Fetching Entitlements with ignoreCaches: %d", buf, 8u);
    }
    objc_msgSend(MEMORY[0x1E0CF9DD0], "sharedInstance");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = MEMORY[0x1E0C809B0];
    v20 = 3221225472;
    v21 = __93__FCEntitlementService__performEntitlementWithIgnoreCache_requestTimeoutDuration_completion___block_invoke;
    v22 = &unk_1E4643328;
    v23 = self;
    v24 = v14;
    v13 = v14;
    objc_msgSend(v16, "getSubscriptionEntitlementsForSegment:ignoreCaches:withResultHandler:", 0, v6, &v19);

    -[FCEntitlementService accessLock](self, "accessLock", v19, v20, v21, v22, v23);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "unlock");

  }
}

- (NFMutexLock)accessLock
{
  return self->_accessLock;
}

- (void)setRequestInProgress:(BOOL)a3
{
  self->_requestInProgress = a3;
}

- (BOOL)requestInProgress
{
  return self->_requestInProgress;
}

void __93__FCEntitlementService__performEntitlementWithIgnoreCache_requestTimeoutDuration_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t v29[128];
  uint8_t buf[4];
  uint64_t v31;
  __int16 v32;
  uint64_t v33;
  __int16 v34;
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a4;
  v9 = (void *)FCPurchaseLog;
  if (v8)
  {
    if (!os_log_type_enabled((os_log_t)FCPurchaseLog, OS_LOG_TYPE_ERROR))
      goto LABEL_7;
    v10 = v9;
    *(_DWORD *)buf = 138412802;
    v31 = objc_opt_class();
    v32 = 2114;
    v33 = (uint64_t)v7;
    v34 = 2114;
    v35 = v8;
    _os_log_error_impl(&dword_1A1B90000, v10, OS_LOG_TYPE_ERROR, "%@ failed to fetch entitlements with entitlements:%{public}@, error: %{public}@", buf, 0x20u);
  }
  else
  {
    if (!os_log_type_enabled((os_log_t)FCPurchaseLog, OS_LOG_TYPE_DEFAULT))
      goto LABEL_7;
    v10 = v9;
    v11 = objc_opt_class();
    v12 = objc_msgSend(*(id *)(a1 + 40), "fc_millisecondTimeIntervalUntilNow");
    *(_DWORD *)buf = 138412802;
    v31 = v11;
    v32 = 2048;
    v33 = v12;
    v34 = 2114;
    v35 = v7;
    _os_log_impl(&dword_1A1B90000, v10, OS_LOG_TYPE_DEFAULT, "%@ Entitlements response received in %llums with entitlements: %{public}@", buf, 0x20u);
  }

LABEL_7:
  objc_msgSend(*(id *)(a1 + 32), "accessLock");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "lock");

  objc_msgSend(*(id *)(a1 + 32), "blocks");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v14, "copy");

  if (objc_msgSend(*(id *)(a1 + 32), "requestInProgress"))
  {
    objc_msgSend(*(id *)(a1 + 32), "entitlementRequestTimer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "invalidate");

    objc_msgSend(*(id *)(a1 + 32), "setEntitlementRequestTimer:", 0);
    objc_msgSend(*(id *)(a1 + 32), "blocks");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "removeAllObjects");

    objc_msgSend(*(id *)(a1 + 32), "setRequestInProgress:", 0);
  }
  objc_msgSend(*(id *)(a1 + 32), "accessLock");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "unlock");

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v19 = v15;
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v21; ++i)
      {
        if (*(_QWORD *)v26 != v22)
          objc_enumerationMutation(v19);
        v24 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i);
        if (v24)
          (*(void (**)(uint64_t, id, uint64_t, id))(v24 + 16))(v24, v7, a3, v8);
      }
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v21);
  }

}

- (NSMutableArray)blocks
{
  return self->_blocks;
}

- (void)setEntitlementRequestTimer:(id)a3
{
  objc_storeStrong((id *)&self->_entitlementRequestTimer, a3);
}

- (void)startTimerWithTimeoutDuration:(double)a3
{
  void *v5;
  _QWORD v6[6];

  -[FCEntitlementService entitlementRequestTimer](self, "entitlementRequestTimer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __54__FCEntitlementService_startTimerWithTimeoutDuration___block_invoke;
    v6[3] = &unk_1E4640A20;
    v6[4] = self;
    *(double *)&v6[5] = a3;
    FCPerformBlockOnMainThread(v6);
  }
}

- (NSTimer)entitlementRequestTimer
{
  return self->_entitlementRequestTimer;
}

- (void)clearTimer
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t v22[128];
  uint8_t buf[4];
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = (void *)FCPurchaseLog;
  if (os_log_type_enabled((os_log_t)FCPurchaseLog, OS_LOG_TYPE_DEFAULT))
  {
    v4 = v3;
    *(_DWORD *)buf = 138412290;
    v24 = objc_opt_class();
    _os_log_impl(&dword_1A1B90000, v4, OS_LOG_TYPE_DEFAULT, "%@ clearing the timer", buf, 0xCu);

  }
  -[FCEntitlementService accessLock](self, "accessLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lock");

  -[FCEntitlementService blocks](self, "blocks");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copy");

  -[FCEntitlementService blocks](self, "blocks");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeAllObjects");

  -[FCEntitlementService entitlementRequestTimer](self, "entitlementRequestTimer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "invalidate");

  -[FCEntitlementService setEntitlementRequestTimer:](self, "setEntitlementRequestTimer:", 0);
  -[FCEntitlementService setRequestInProgress:](self, "setRequestInProgress:", 0);
  -[FCEntitlementService accessLock](self, "accessLock");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "unlock");

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("EntitlementsProviderErrorDomain"), 3001, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v12 = v7;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v19;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v19 != v15)
          objc_enumerationMutation(v12);
        v17 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v16);
        if (v17)
          (*(void (**)(uint64_t, _QWORD, _QWORD, void *))(v17 + 16))(v17, 0, 0, v11);
        ++v16;
      }
      while (v14 != v16);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v14);
  }

}

- (void)setBlocks:(id)a3
{
  objc_storeStrong((id *)&self->_blocks, a3);
}

- (void)setAccessLock:(id)a3
{
  objc_storeStrong((id *)&self->_accessLock, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configurationManager, 0);
  objc_storeStrong((id *)&self->_accessLock, 0);
  objc_storeStrong((id *)&self->_blocks, 0);
  objc_storeStrong((id *)&self->_entitlementRequestTimer, 0);
}

@end
