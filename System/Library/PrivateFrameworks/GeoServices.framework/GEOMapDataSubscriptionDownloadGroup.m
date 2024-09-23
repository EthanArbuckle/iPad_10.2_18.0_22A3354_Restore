@implementation GEOMapDataSubscriptionDownloadGroup

- (GEOMapDataSubscriptionDownloadGroup)initWithSubscriptions:(id)a3 downloadMode:(unint64_t)a4 auditToken:(id)a5 backgroundTask:(id)a6 delegate:(id)a7 delegateQueue:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  GEOMapDataSubscriptionDownloadGroup *v19;
  uint64_t v20;
  geo_isolater *isolation;
  uint64_t v22;
  NSArray *subscriptions;
  uint64_t v24;
  NSMutableArray *remainingSubscriptions;
  uint64_t v26;
  NSMutableArray *completedSubscriptions;
  uint64_t v28;
  NSMutableArray *failedSubscriptions;
  GEOMapDataSubscriptionDownloadGroup *v30;
  _QWORD v32[4];
  id v33;
  id location;
  objc_super v35;

  v14 = a3;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  v35.receiver = self;
  v35.super_class = (Class)GEOMapDataSubscriptionDownloadGroup;
  v19 = -[GEOMapDataSubscriptionDownloadGroup init](&v35, sel_init);
  if (v19)
  {
    v20 = geo_isolater_create();
    isolation = v19->_isolation;
    v19->_isolation = (geo_isolater *)v20;

    v22 = objc_msgSend(v14, "copy");
    subscriptions = v19->_subscriptions;
    v19->_subscriptions = (NSArray *)v22;

    v24 = objc_msgSend(v14, "mutableCopy");
    remainingSubscriptions = v19->_remainingSubscriptions;
    v19->_remainingSubscriptions = (NSMutableArray *)v24;

    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v14, "count"));
    v26 = objc_claimAutoreleasedReturnValue();
    completedSubscriptions = v19->_completedSubscriptions;
    v19->_completedSubscriptions = (NSMutableArray *)v26;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v28 = objc_claimAutoreleasedReturnValue();
    failedSubscriptions = v19->_failedSubscriptions;
    v19->_failedSubscriptions = (NSMutableArray *)v28;

    v19->_downloadMode = a4;
    objc_storeStrong((id *)&v19->_auditToken, a5);
    objc_storeWeak((id *)&v19->_delegate, v17);
    objc_storeStrong((id *)&v19->_delegateQueue, a8);
    objc_storeStrong((id *)&v19->_backgroundTask, a6);
    if (v19->_backgroundTask)
    {
      objc_initWeak(&location, v19);
      v32[0] = MEMORY[0x1E0C809B0];
      v32[1] = 3221225472;
      v32[2] = __123__GEOMapDataSubscriptionDownloadGroup_initWithSubscriptions_downloadMode_auditToken_backgroundTask_delegate_delegateQueue___block_invoke;
      v32[3] = &unk_1E1BFF8B0;
      objc_copyWeak(&v33, &location);
      -[BGSystemTask setExpirationHandler:](v19->_backgroundTask, "setExpirationHandler:", v32);
      objc_destroyWeak(&v33);
      objc_destroyWeak(&location);
    }
    v30 = v19;
  }

  return v19;
}

void __123__GEOMapDataSubscriptionDownloadGroup_initWithSubscriptions_downloadMode_auditToken_backgroundTask_delegate_delegateQueue___block_invoke(uint64_t a1)
{
  NSObject **WeakRetained;
  NSObject **v2;
  NSObject *v3;
  _BOOL4 v4;
  NSObject **v5;
  _QWORD block[6];

  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v5 = WeakRetained;
    if (WeakRetained[5])
    {
      v3 = WeakRetained[7];
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __67__GEOMapDataSubscriptionDownloadGroup__backgroundTaskNeedsDeferral__block_invoke;
      block[3] = &unk_1E1BFF6F8;
      block[4] = v2;
      dispatch_async(v3, block);
    }
    else
    {
      v4 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      v2 = v5;
      if (!v4)
        goto LABEL_5;
      LOWORD(block[0]) = 0;
      _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: _backgroundTask != ((void *)0)", (uint8_t *)block, 2u);
    }
    v2 = v5;
  }
LABEL_5:

}

void __67__GEOMapDataSubscriptionDownloadGroup__backgroundTaskNeedsDeferral__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 48));
  objc_msgSend(WeakRetained, "subscriptionDownloadGroupDidDefer:", *(_QWORD *)(a1 + 32));

}

- (NSArray)remainingSubscriptions
{
  void *v3;
  geo_isolater *v5;

  v5 = self->_isolation;
  _geo_isolate_lock_data();
  v3 = (void *)-[NSMutableArray copy](self->_remainingSubscriptions, "copy");
  _geo_isolate_unlock();

  return (NSArray *)v3;
}

- (NSArray)completedSubscriptions
{
  void *v3;
  geo_isolater *v5;

  v5 = self->_isolation;
  _geo_isolate_lock_data();
  v3 = (void *)-[NSMutableArray copy](self->_completedSubscriptions, "copy");
  _geo_isolate_unlock();

  return (NSArray *)v3;
}

- (void)removeSubscriptionWithIdentifier:(id)a3
{
  id v4;
  id v5;
  void *v6;
  NSArray *v7;
  NSArray *subscriptions;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, void *);
  void *v12;
  id v13;
  geo_isolater *v14;

  v4 = a3;
  v14 = self->_isolation;
  _geo_isolate_lock_data();
  v9 = MEMORY[0x1E0C809B0];
  v10 = 3221225472;
  v11 = __72__GEOMapDataSubscriptionDownloadGroup_removeSubscriptionWithIdentifier___block_invoke;
  v12 = &unk_1E1C01470;
  v5 = v4;
  v13 = v5;
  v6 = (void *)MEMORY[0x18D765024](&v9);
  -[NSArray _geo_filtered:](self->_subscriptions, "_geo_filtered:", v6, v9, v10, v11, v12);
  v7 = (NSArray *)objc_claimAutoreleasedReturnValue();
  subscriptions = self->_subscriptions;
  self->_subscriptions = v7;

  -[NSMutableArray _geo_filter:](self->_remainingSubscriptions, "_geo_filter:", v6);
  -[NSMutableArray _geo_filter:](self->_completedSubscriptions, "_geo_filter:", v6);
  -[NSMutableArray _geo_filter:](self->_failedSubscriptions, "_geo_filter:", v6);

  _geo_isolate_unlock();
}

uint64_t __72__GEOMapDataSubscriptionDownloadGroup_removeSubscriptionWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32)) ^ 1;

  return v4;
}

- (void)finishedDownloadingSubscription:(id)a3 withError:(id)a4
{
  id v6;
  id v7;
  NSMutableArray **p_failedSubscriptions;
  NSMutableArray *failedSubscriptions;
  NSObject *v10;
  const char *v11;
  uint8_t *v12;
  NSMutableArray *completedSubscriptions;
  uint64_t v14;
  __int16 v15;
  geo_isolater *v16;

  v6 = a3;
  v7 = a4;
  v16 = self->_isolation;
  _geo_isolate_lock_data();
  if ((-[NSMutableArray containsObject:](self->_remainingSubscriptions, "containsObject:", v6) & 1) != 0)
  {
    -[NSMutableArray removeObject:](self->_remainingSubscriptions, "removeObject:", v6);
    if (v7)
    {
      failedSubscriptions = self->_failedSubscriptions;
      p_failedSubscriptions = &self->_failedSubscriptions;
      if (!-[NSMutableArray containsObject:](failedSubscriptions, "containsObject:", v6)
        || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
      {
        goto LABEL_7;
      }
      v15 = 0;
      v10 = MEMORY[0x1E0C81028];
      v11 = "Assertion failed: ![_failedSubscriptions containsObject:subscription]";
      v12 = (uint8_t *)&v15;
    }
    else
    {
      completedSubscriptions = self->_completedSubscriptions;
      p_failedSubscriptions = &self->_completedSubscriptions;
      if (!-[NSMutableArray containsObject:](completedSubscriptions, "containsObject:", v6)
        || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
      {
        goto LABEL_7;
      }
      LOWORD(v14) = 0;
      v10 = MEMORY[0x1E0C81028];
      v11 = "Assertion failed: ![_completedSubscriptions containsObject:subscription]";
      v12 = (uint8_t *)&v14;
    }
    _os_log_fault_impl(&dword_1885A9000, v10, OS_LOG_TYPE_FAULT, v11, v12, 2u);
LABEL_7:
    -[NSMutableArray addObject:](*p_failedSubscriptions, "addObject:", v6, v14);
  }
  _geo_isolate_unlock();

}

- (void)restartedSubscriptions:(id)a3
{
  id v4;
  geo_isolater *v5;

  v4 = a3;
  v5 = self->_isolation;
  _geo_isolate_lock_data();
  -[NSMutableArray removeObjectsInArray:](self->_completedSubscriptions, "removeObjectsInArray:", v4);
  -[NSMutableArray addObjectsFromArray:](self->_remainingSubscriptions, "addObjectsFromArray:", v4);
  _geo_isolate_unlock();

}

- (NSArray)subscriptions
{
  return self->_subscriptions;
}

- (unint64_t)downloadMode
{
  return self->_downloadMode;
}

- (GEOApplicationAuditToken)auditToken
{
  return self->_auditToken;
}

- (GEOMapDataSubscriptionDownloadGroupDelegate)delegate
{
  return (GEOMapDataSubscriptionDownloadGroupDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (BGSystemTask)backgroundTask
{
  return self->_backgroundTask;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_failedSubscriptions, 0);
  objc_storeStrong((id *)&self->_completedSubscriptions, 0);
  objc_storeStrong((id *)&self->_remainingSubscriptions, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_backgroundTask, 0);
  objc_storeStrong((id *)&self->_auditToken, 0);
  objc_storeStrong((id *)&self->_subscriptions, 0);
  objc_storeStrong((id *)&self->_isolation, 0);
}

@end
