@implementation AMSBag

- (id)integerForKey:(id)a3
{
  id v4;
  AMSBagValue *v5;
  void *v6;
  AMSBagValue *v7;

  v4 = a3;
  v5 = [AMSBagValue alloc];
  -[AMSBag dataSource](self, "dataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[AMSBagValue initWithDataSource:key:valueType:](v5, "initWithDataSource:key:valueType:", v6, v4, 3);

  return v7;
}

- (id)BOOLForKey:(id)a3
{
  id v4;
  AMSBagValue *v5;
  void *v6;
  AMSBagValue *v7;

  v4 = a3;
  v5 = [AMSBagValue alloc];
  -[AMSBag dataSource](self, "dataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[AMSBagValue initWithDataSource:key:valueType:](v5, "initWithDataSource:key:valueType:", v6, v4, 1);

  return v7;
}

- (id)arrayForKey:(id)a3
{
  id v4;
  AMSBagValue *v5;
  void *v6;
  AMSBagValue *v7;

  v4 = a3;
  v5 = [AMSBagValue alloc];
  -[AMSBag dataSource](self, "dataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[AMSBagValue initWithDataSource:key:valueType:](v5, "initWithDataSource:key:valueType:", v6, v4, 0);

  return v7;
}

- (id)stringForKey:(id)a3
{
  id v4;
  AMSBagValue *v5;
  void *v6;
  AMSBagValue *v7;

  v4 = a3;
  v5 = [AMSBagValue alloc];
  -[AMSBag dataSource](self, "dataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[AMSBagValue initWithDataSource:key:valueType:](v5, "initWithDataSource:key:valueType:", v6, v4, 4);

  return v7;
}

- (id)doubleForKey:(id)a3
{
  id v4;
  AMSBagValue *v5;
  void *v6;
  AMSBagValue *v7;

  v4 = a3;
  v5 = [AMSBagValue alloc];
  -[AMSBag dataSource](self, "dataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[AMSBagValue initWithDataSource:key:valueType:](v5, "initWithDataSource:key:valueType:", v6, v4, 2);

  return v7;
}

- (id)dictionaryForKey:(id)a3
{
  id v4;
  AMSBagValue *v5;
  void *v6;
  AMSBagValue *v7;

  v4 = a3;
  v5 = [AMSBagValue alloc];
  -[AMSBag dataSource](self, "dataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[AMSBagValue initWithDataSource:key:valueType:](v5, "initWithDataSource:key:valueType:", v6, v4, 6);

  return v7;
}

- (AMSBagDataSourceProtocol)dataSource
{
  return self->_dataSource;
}

- (id)URLForKey:(id)a3
{
  id v4;
  AMSBagValue *v5;
  void *v6;
  AMSBagValue *v7;

  v4 = a3;
  v5 = [AMSBagValue alloc];
  -[AMSBag dataSource](self, "dataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[AMSBagValue initWithDataSource:key:valueType:](v5, "initWithDataSource:key:valueType:", v6, v4, 5);

  return v7;
}

+ (id)bagForProfile:(id)a3 profileVersion:(id)a4
{
  id v5;
  id v6;
  void *v7;

  v5 = a3;
  v6 = a4;
  objc_msgSend((id)objc_opt_class(), "bagForProfile:profileVersion:processInfo:", v5, v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)bagForProfile:(id)a3 profileVersion:(id)a4 processInfo:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  AMSBagActiveAccountProvider *v11;
  void *v12;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = (void *)objc_opt_class();
  v11 = objc_alloc_init(AMSBagActiveAccountProvider);
  objc_msgSend(v10, "_bagForProfile:profileVersion:processInfo:accountProvider:", v7, v8, v9, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)_bagForProfile:(id)a3 profileVersion:(id)a4 processInfo:(id)a5 accountProvider:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  _QWORD v28[4];
  id v29;
  id v30;
  id v31;
  id v32;
  SEL v33;
  id v34;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  if (v11)
  {
    if (v12)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("AMSBag.mm"), 474, CFSTR("Unexpected nil reference: %s"), "profile");

    if (v12)
    {
LABEL_3:
      if (v14)
        goto LABEL_4;
LABEL_9:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("AMSBag.mm"), 476, CFSTR("Unexpected nil reference: %s"), "accountProvider");

      if (v13)
        goto LABEL_6;
      goto LABEL_5;
    }
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("AMSBag.mm"), 475, CFSTR("Unexpected nil reference: %s"), "profileVersion");

  if (!v14)
    goto LABEL_9;
LABEL_4:
  if (!v13)
  {
LABEL_5:
    +[AMSProcessInfo currentProcess](AMSProcessInfo, "currentProcess");
    v13 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_6:
  +[AMSBagNetworkDataSource requestPartialIdentifierForClientInfo:profile:profileVersion:](AMSBagNetworkDataSource, "requestPartialIdentifierForClientInfo:profile:profileVersion:", v13, v11, v12);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "identity");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "accountMediaType");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "bagCache");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __68__AMSBag__bagForProfile_profileVersion_processInfo_accountProvider___block_invoke;
  v28[3] = &unk_1E253E6C8;
  v16 = v11;
  v29 = v16;
  v17 = v12;
  v30 = v17;
  v18 = v13;
  v31 = v18;
  v19 = v14;
  v32 = v19;
  v33 = a2;
  v34 = a1;
  objc_msgSend(v15, "bagWithIdentifier:accountProviderIdentity:accountMediaType:orCreateUsingBlock:", v27, v26, v25, v28);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

+ (AMSBagCache)bagCache
{
  if (_MergedGlobals_83 != -1)
    dispatch_once(&_MergedGlobals_83, &__block_literal_global_15);
  return (AMSBagCache *)(id)qword_1ECEACF98;
}

AMSBag *__68__AMSBag__bagForProfile_profileVersion_processInfo_accountProvider___block_invoke(_QWORD *a1)
{
  AMSBagNetworkDataSource *v2;
  AMSBag *v3;
  void *v4;
  void *v6;

  v2 = -[AMSBagNetworkDataSource initWithProfile:profileVersion:processInfo:accountProvider:]([AMSBagNetworkDataSource alloc], "initWithProfile:profileVersion:processInfo:accountProvider:", a1[4], a1[5], a1[6], a1[7]);
  v3 = -[AMSBag initWithDataSource:shouldConfigureDataSourceHandlers:]([AMSBag alloc], "initWithDataSource:shouldConfigureDataSourceHandlers:", v2, 1);
  -[AMSBag dataSource](v3, "dataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "loadWithCompletion:", &__block_literal_global_89);

  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a1[8], a1[9], CFSTR("AMSBag.mm"), 499, CFSTR("Unexpected nil reference: %s"), "bag");

  }
  return v3;
}

- (AMSBag)initWithDataSource:(id)a3 shouldConfigureDataSourceHandlers:(BOOL)a4
{
  _BOOL8 v4;
  id v7;
  void *v8;
  void *v9;
  AMSBagCachedValueUpdateHandlers *v10;
  AMSBag *v11;
  void *v13;

  v4 = a4;
  v7 = a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("AMSBag.mm"), 121, CFSTR("Unexpected nil reference: %s"), "dataSource");

  }
  +[AMSBag sharedPersistenceWithDefaultDirectory](AMSBag, "sharedPersistenceWithDefaultDirectory");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    +[AMSBag sharedPersistenceQueue](AMSBag, "sharedPersistenceQueue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }
  v10 = objc_alloc_init(AMSBagCachedValueUpdateHandlers);
  v11 = -[AMSBag _initWithDataSource:persistence:persistenceQueue:updateHandlers:shouldConfigureDataSourceHandlers:](self, "_initWithDataSource:persistence:persistenceQueue:updateHandlers:shouldConfigureDataSourceHandlers:", v7, v8, v9, v10, v4);

  return v11;
}

+ (id)sharedPersistenceWithDefaultDirectory
{
  if (qword_1ECEACFB0 != -1)
    dispatch_once(&qword_1ECEACFB0, &__block_literal_global_34);
  return (id)qword_1ECEACFB8;
}

+ (id)sharedPersistenceQueue
{
  if (qword_1ECEACFA0 != -1)
    dispatch_once(&qword_1ECEACFA0, &__block_literal_global_32);
  return (id)qword_1ECEACFA8;
}

- (id)_initWithDataSource:(id)a3 persistence:(id)a4 persistenceQueue:(id)a5 updateHandlers:(id)a6 shouldConfigureDataSourceHandlers:(BOOL)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  AMSBag *v18;
  NSObject *v19;
  dispatch_queue_t v20;
  OS_dispatch_queue *changeNotificationQueue;
  void *v23;
  void *v24;
  void *v25;
  SEL v26;
  const char *v27;
  const char *v28;
  SEL v29;
  _BOOL4 v30;
  objc_super v31;

  v30 = a7;
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = v16;
  if (v13)
  {
    if (v16)
      goto LABEL_3;
  }
  else
  {
    v27 = a2;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", v27, self, CFSTR("AMSBag.mm"), 139, CFSTR("Unexpected nil reference: %s"), "dataSource");

    a2 = v27;
    if (v17)
    {
LABEL_3:
      if (!v14)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  v28 = a2;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", v28, self, CFSTR("AMSBag.mm"), 140, CFSTR("Unexpected nil reference: %s"), "updateHandlers");

  a2 = v28;
  if (!v14)
    goto LABEL_5;
LABEL_4:
  if (!v15)
  {
    v26 = a2;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", v26, self, CFSTR("AMSBag.mm"), 141, CFSTR("'persistenceQueue' must be provided if 'persistence' is provided."));
LABEL_16:

    goto LABEL_7;
  }
LABEL_5:
  if (!v14 && v15)
  {
    v29 = a2;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", v29, self, CFSTR("AMSBag.mm"), 142, CFSTR("'persistence' must be provided if 'persistenceQueue' is provided."));
    goto LABEL_16;
  }
LABEL_7:
  v31.receiver = self;
  v31.super_class = (Class)AMSBag;
  v18 = -[AMSBag init](&v31, sel_init);
  if (v18)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = dispatch_queue_create("com.apple.AppleMediaServices.AMSBag.changeNotificationQueue", v19);
    changeNotificationQueue = v18->_changeNotificationQueue;
    v18->_changeNotificationQueue = (OS_dispatch_queue *)v20;

    objc_storeStrong((id *)&v18->_dataSource, a3);
    objc_storeStrong((id *)&v18->_persistence, a4);
    v18->_persistenceAPIWasCalled = 0;
    objc_storeStrong((id *)&v18->_persistenceQueue, a5);
    v18->_updateHandlerConsistencyLock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v18->_updateHandlers, a6);
    if (v30)
      -[AMSBag _configureDataSourceHandlers](v18, "_configureDataSourceHandlers");
  }

  return v18;
}

- (void)_configureDataSourceHandlers
{
  uint64_t v3;
  void *v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  _QWORD v8[4];
  id v9;
  id location;

  objc_initWeak(&location, self);
  v3 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __38__AMSBag__configureDataSourceHandlers__block_invoke;
  v8[3] = &unk_1E253E718;
  objc_copyWeak(&v9, &location);
  -[AMSBag dataSource](self, "dataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDataSourceChangedHandler:", v8);

  v6[0] = v3;
  v6[1] = 3221225472;
  v6[2] = __38__AMSBag__configureDataSourceHandlers__block_invoke_2;
  v6[3] = &unk_1E253E740;
  objc_copyWeak(&v7, &location);
  -[AMSBag dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDataSourceDataInvalidatedHandler:", v6);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __47__AMSBag_sharedPersistenceWithDefaultDirectory__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[AMSBagUnderlyingDataPersistence persistenceWithDefaultDirectory](AMSBagUnderlyingDataPersistence, "persistenceWithDefaultDirectory");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ECEACFB8;
  qword_1ECEACFB8 = v0;

}

- (NSString)description
{
  void *v2;
  void *v3;

  -[AMSBag dataSource](self, "dataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)removeObserverWithToken:(unint64_t)a3
{
  id v4;

  -[AMSBag updateHandlers](self, "updateHandlers");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeHandlerWithToken:", a3);

}

- (BOOL)isExpired
{
  void *v2;
  void *v3;
  BOOL v4;

  -[AMSBag expirationDate](self, "expirationDate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "compare:", v2) == 1;

  }
  else
  {
    v4 = 1;
  }

  return v4;
}

void __39__AMSBag_createSnapshotWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  id v8;
  AMSSnapshotBagBuilder *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  id v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  NSObject *v25;
  id v26;
  void *v27;
  uint64_t v28;
  void *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  id v35;
  id v36;
  id v37;
  uint8_t buf[4];
  id v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  id v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v8 = AMSSetLogKey(*(void **)(a1 + 32));
  if (WeakRetained)
  {
    if (v5)
    {
      v9 = objc_alloc_init(AMSSnapshotBagBuilder);
      objc_msgSend(v5, "data");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[AMSSnapshotBagBuilder setData:](v9, "setData:", v10);

      objc_msgSend(WeakRetained, "expirationDate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[AMSSnapshotBagBuilder setExpirationDate:](v9, "setExpirationDate:", v11);

      objc_msgSend(WeakRetained, "profile");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[AMSSnapshotBagBuilder setProfile:](v9, "setProfile:", v12);

      objc_msgSend(WeakRetained, "profileVersion");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[AMSSnapshotBagBuilder setProfileVersion:](v9, "setProfileVersion:", v13);

      objc_msgSend(WeakRetained, "processInfo");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[AMSSnapshotBagBuilder setProcessInfo:](v9, "setProcessInfo:", v14);

      v37 = 0;
      -[AMSSnapshotBagBuilder buildWithError:](v9, "buildWithError:", &v37);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = v37;
      if (v15)
      {
        +[AMSLogConfig sharedBagConfig](AMSLogConfig, "sharedBagConfig");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v16)
        {
          +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v16, "OSLogObject");
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          v18 = (id)objc_opt_class();
          AMSLogKey();
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v39 = v18;
          v40 = 2114;
          v41 = v19;
          _os_log_impl(&dword_18C849000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Successfully created the snapshot.", buf, 0x16u);

        }
        (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
      }
      else
      {
        +[AMSLogConfig sharedBagConfig](AMSLogConfig, "sharedBagConfig");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v29)
        {
          +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v29, "OSLogObject");
        v30 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        {
          v35 = (id)objc_opt_class();
          AMSLogKey();
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          AMSHashIfNeeded(v6);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v39 = v35;
          v40 = 2114;
          v41 = v31;
          v42 = 2114;
          v43 = v32;
          _os_log_impl(&dword_18C849000, v30, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to create the snapshot. error = %{public}@", buf, 0x20u);

        }
        v33 = *(_QWORD *)(a1 + 40);
        AMSError(205, CFSTR("Cannot Create Snapshot"), CFSTR("We failed to create the snapshot."), v36);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, _QWORD, void *))(v33 + 16))(v33, 0, v34);

      }
    }
    else
    {
      +[AMSLogConfig sharedBagConfig](AMSLogConfig, "sharedBagConfig");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v24)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v24, "OSLogObject");
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        v26 = (id)objc_opt_class();
        AMSLogKey();
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v39 = v26;
        v40 = 2114;
        v41 = v27;
        v42 = 2114;
        v43 = v6;
        _os_log_impl(&dword_18C849000, v25, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to load the bag. Unable to create a snapshot. error = %{public}@", buf, 0x20u);

      }
      v28 = *(_QWORD *)(a1 + 40);
      AMSError(205, CFSTR("Cannot Create Snapshot"), CFSTR("We can't create a snapshot because we failed to load the bag."), v6);
      v9 = (AMSSnapshotBagBuilder *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, AMSSnapshotBagBuilder *))(v28 + 16))(v28, 0, v9);
    }
  }
  else
  {
    +[AMSLogConfig sharedBagConfig](AMSLogConfig, "sharedBagConfig");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v20)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v20, "OSLogObject");
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      AMSLogKey();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v39 = v22;
      _os_log_impl(&dword_18C849000, v21, OS_LOG_TYPE_ERROR, "AMSBag: [%{public}@] Someone called -[AMSBag createSnapshotWithCompletion:] but didn't hold onto a reference to the original AMSBag.", buf, 0xCu);

    }
    v23 = *(_QWORD *)(a1 + 40);
    AMSError(0, 0, 0, v6);
    v9 = (AMSSnapshotBagBuilder *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, AMSSnapshotBagBuilder *))(v23 + 16))(v23, 0, v9);
  }

}

- (NSDate)expirationDate
{
  void *v2;
  void *v3;

  -[AMSBag dataSource](self, "dataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "expirationDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v3;
}

- (AMSProcessInfo)processInfo
{
  void *v2;
  void *v3;

  -[AMSBag dataSource](self, "dataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "processInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (AMSProcessInfo *)v3;
}

- (void)_persistBagDictionary:(id)a3 withIdentifier:(id)a4 partialIdentifier:(id)a5 expirationDate:(id)a6 onlyIfPreExisting:(BOOL)a7
{
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  NSObject *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  BOOL v48;
  int v49;
  void *v50;
  void *v51;
  NSObject *v52;
  void *v53;
  void *v54;
  uint64_t v55;
  void *v56;
  void *v57;
  void *v58;
  NSObject *v59;
  void *v60;
  void *v61;
  uint64_t v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  NSObject *v71;
  void *v72;
  void *v73;
  uint64_t v74;
  void *v75;
  void *v76;
  void *v77;
  NSObject *v78;
  void *v79;
  void *v80;
  uint64_t v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  int v88;
  void *v89;
  NSObject *v90;
  void *v91;
  void *v92;
  uint64_t v93;
  void *v94;
  void *v95;
  void *v96;
  NSObject *v97;
  void *v98;
  void *v99;
  uint64_t v100;
  void *v101;
  void *v102;
  void *v103;
  NSObject *v104;
  void *v105;
  void *v106;
  uint64_t v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  uint64_t v118;
  void *v119;
  id v121;
  id v122;
  id v123;
  id v124;
  _QWORD v125[5];
  id v126;
  id v127;
  id v128;
  id v129;
  BOOL v130;
  uint8_t buf[4];
  void *v132;
  __int16 v133;
  void *v134;
  __int16 v135;
  void *v136;
  uint64_t v137;

  v137 = *MEMORY[0x1E0C80C00];
  v121 = a3;
  v124 = a4;
  v122 = a5;
  v123 = a6;
  -[AMSBag persistence](self, "persistence");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    if (+[AMSUnitTests isRunningUnitTests](AMSUnitTests, "isRunningUnitTests"))
    {
      +[AMSLogConfig sharedBagConfig](AMSLogConfig, "sharedBagConfig");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v12)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v12, "OSLogObject");
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        AMSLogKey();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = (void *)MEMORY[0x1E0CB3940];
        if (v14)
        {
          v16 = objc_opt_class();
          AMSLogKey();
          v118 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "stringWithFormat:", CFSTR("%@: [%@] "), v16, v118);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = (void *)v118;
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: "), objc_opt_class());
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = v17;
        }
        AMSHashIfNeeded(CFSTR("self.persistence"));
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        AMSHashIfNeeded(CFSTR("persistence was unexpectedly nil."));
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v132 = v17;
        v133 = 2114;
        v134 = v26;
        v135 = 2114;
        v136 = v27;
        _os_log_impl(&dword_18C849000, v13, OS_LOG_TYPE_ERROR, "%{public}@Assertion failed: %{public}@. Description: %{public}@", buf, 0x20u);
        if (v14)

      }
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      +[AMSLogConfig sharedBagConfig](AMSLogConfig, "sharedBagConfig");
      v20 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "postNotificationName:object:userInfo:", CFSTR("com.apple.AppleMediaServicesTests.FaultLogged"), v20, 0);
    }
    else
    {
      +[AMSLogConfig sharedBagConfig](AMSLogConfig, "sharedBagConfig");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v19)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v19, "OSLogObject");
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
      {
        AMSLogKey();
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = (void *)MEMORY[0x1E0CB3940];
        if (v21)
        {
          v23 = objc_opt_class();
          AMSLogKey();
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "stringWithFormat:", CFSTR("%@: [%@] "), v23, v24);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: "), objc_opt_class());
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = v25;
        }
        AMSHashIfNeeded(CFSTR("self.persistence"));
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        AMSHashIfNeeded(CFSTR("persistence was unexpectedly nil."));
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v132 = v25;
        v133 = 2114;
        v134 = v28;
        v135 = 2114;
        v136 = v29;
        _os_log_impl(&dword_18C849000, v20, OS_LOG_TYPE_FAULT, "%{public}@Assertion failed: %{public}@. Description: %{public}@", buf, 0x20u);
        if (v21)

      }
    }

  }
  -[AMSBag persistenceQueue](self, "persistenceQueue");
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v30)
  {
    if (+[AMSUnitTests isRunningUnitTests](AMSUnitTests, "isRunningUnitTests"))
    {
      +[AMSLogConfig sharedBagConfig](AMSLogConfig, "sharedBagConfig");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v31)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v31, "OSLogObject");
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        AMSLogKey();
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = (void *)MEMORY[0x1E0CB3940];
        if (v33)
        {
          v35 = objc_opt_class();
          AMSLogKey();
          v119 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "stringWithFormat:", CFSTR("%@: [%@] "), v35, v119);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: "), objc_opt_class());
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v119 = v36;
        }
        AMSHashIfNeeded(CFSTR("self.persistenceQueue"));
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        AMSHashIfNeeded(CFSTR("persistenceQueue was unexpectedly nil."));
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v132 = v36;
        v133 = 2114;
        v134 = v44;
        v135 = 2114;
        v136 = v45;
        _os_log_impl(&dword_18C849000, v32, OS_LOG_TYPE_ERROR, "%{public}@Assertion failed: %{public}@. Description: %{public}@", buf, 0x20u);
        if (v33)

      }
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      +[AMSLogConfig sharedBagConfig](AMSLogConfig, "sharedBagConfig");
      v38 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "postNotificationName:object:userInfo:", CFSTR("com.apple.AppleMediaServicesTests.FaultLogged"), v38, 0);
    }
    else
    {
      +[AMSLogConfig sharedBagConfig](AMSLogConfig, "sharedBagConfig");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v37)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v37, "OSLogObject");
      v38 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_FAULT))
      {
        AMSLogKey();
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = (void *)MEMORY[0x1E0CB3940];
        if (v39)
        {
          v41 = objc_opt_class();
          AMSLogKey();
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "stringWithFormat:", CFSTR("%@: [%@] "), v41, v42);
          v43 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: "), objc_opt_class());
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          v42 = v43;
        }
        AMSHashIfNeeded(CFSTR("self.persistenceQueue"));
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        AMSHashIfNeeded(CFSTR("persistenceQueue was unexpectedly nil."));
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v132 = v43;
        v133 = 2114;
        v134 = v46;
        v135 = 2114;
        v136 = v47;
        _os_log_impl(&dword_18C849000, v38, OS_LOG_TYPE_FAULT, "%{public}@Assertion failed: %{public}@. Description: %{public}@", buf, 0x20u);
        if (v39)

      }
    }

  }
  if (v11)
    v48 = v30 == 0;
  else
    v48 = 1;
  v49 = !v48;
  v50 = v124;
  if (!v124)
  {
    if (+[AMSUnitTests isRunningUnitTests](AMSUnitTests, "isRunningUnitTests"))
    {
      +[AMSLogConfig sharedBagConfig](AMSLogConfig, "sharedBagConfig");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v51)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v51, "OSLogObject");
      v52 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
      {
        AMSLogKey();
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        v54 = (void *)MEMORY[0x1E0CB3940];
        if (v53)
        {
          v55 = objc_opt_class();
          AMSLogKey();
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v54, "stringWithFormat:", CFSTR("%@: [%@] "), v55, v56);
          v57 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: "), objc_opt_class());
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          v56 = v57;
        }
        AMSHashIfNeeded(CFSTR("identifier"));
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        AMSHashIfNeeded(CFSTR("identifier argument was unexpectedly nil."));
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v132 = v57;
        v133 = 2114;
        v134 = v65;
        v135 = 2114;
        v136 = v66;
        _os_log_impl(&dword_18C849000, v52, OS_LOG_TYPE_ERROR, "%{public}@Assertion failed: %{public}@. Description: %{public}@", buf, 0x20u);
        if (v53)

      }
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      +[AMSLogConfig sharedBagConfig](AMSLogConfig, "sharedBagConfig");
      v59 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "postNotificationName:object:userInfo:", CFSTR("com.apple.AppleMediaServicesTests.FaultLogged"), v59, 0);
    }
    else
    {
      +[AMSLogConfig sharedBagConfig](AMSLogConfig, "sharedBagConfig");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v58)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v58, "OSLogObject");
      v59 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v59, OS_LOG_TYPE_FAULT))
      {
        AMSLogKey();
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        v61 = (void *)MEMORY[0x1E0CB3940];
        if (v60)
        {
          v62 = objc_opt_class();
          AMSLogKey();
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v61, "stringWithFormat:", CFSTR("%@: [%@] "), v62, v63);
          v64 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: "), objc_opt_class());
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          v63 = v64;
        }
        AMSHashIfNeeded(CFSTR("identifier"));
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        AMSHashIfNeeded(CFSTR("identifier argument was unexpectedly nil."));
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v132 = v64;
        v133 = 2114;
        v134 = v67;
        v135 = 2114;
        v136 = v68;
        _os_log_impl(&dword_18C849000, v59, OS_LOG_TYPE_FAULT, "%{public}@Assertion failed: %{public}@. Description: %{public}@", buf, 0x20u);
        if (v60)

      }
    }

    v50 = 0;
  }
  if (!v50)
    v49 = 0;
  v69 = v123;
  if (!v123)
  {
    if (+[AMSUnitTests isRunningUnitTests](AMSUnitTests, "isRunningUnitTests"))
    {
      +[AMSLogConfig sharedBagConfig](AMSLogConfig, "sharedBagConfig");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v70)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v70 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v70, "OSLogObject");
      v71 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v71, OS_LOG_TYPE_ERROR))
      {
        AMSLogKey();
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        v73 = (void *)MEMORY[0x1E0CB3940];
        if (v72)
        {
          v74 = objc_opt_class();
          AMSLogKey();
          v75 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v73, "stringWithFormat:", CFSTR("%@: [%@] "), v74, v75);
          v76 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: "), objc_opt_class());
          v76 = (void *)objc_claimAutoreleasedReturnValue();
          v75 = v76;
        }
        AMSHashIfNeeded(CFSTR("expirationDate"));
        v84 = (void *)objc_claimAutoreleasedReturnValue();
        AMSHashIfNeeded(CFSTR("expirationDate argument was unexpectedly nil."));
        v85 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v132 = v76;
        v133 = 2114;
        v134 = v84;
        v135 = 2114;
        v136 = v85;
        _os_log_impl(&dword_18C849000, v71, OS_LOG_TYPE_ERROR, "%{public}@Assertion failed: %{public}@. Description: %{public}@", buf, 0x20u);
        if (v72)

      }
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      +[AMSLogConfig sharedBagConfig](AMSLogConfig, "sharedBagConfig");
      v78 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v77, "postNotificationName:object:userInfo:", CFSTR("com.apple.AppleMediaServicesTests.FaultLogged"), v78, 0);
    }
    else
    {
      +[AMSLogConfig sharedBagConfig](AMSLogConfig, "sharedBagConfig");
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v77)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v77 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v77, "OSLogObject");
      v78 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v78, OS_LOG_TYPE_FAULT))
      {
        AMSLogKey();
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        v80 = (void *)MEMORY[0x1E0CB3940];
        if (v79)
        {
          v81 = objc_opt_class();
          AMSLogKey();
          v82 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v80, "stringWithFormat:", CFSTR("%@: [%@] "), v81, v82);
          v83 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: "), objc_opt_class());
          v83 = (void *)objc_claimAutoreleasedReturnValue();
          v82 = v83;
        }
        AMSHashIfNeeded(CFSTR("expirationDate"));
        v86 = (void *)objc_claimAutoreleasedReturnValue();
        AMSHashIfNeeded(CFSTR("expirationDate argument was unexpectedly nil."));
        v87 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v132 = v83;
        v133 = 2114;
        v134 = v86;
        v135 = 2114;
        v136 = v87;
        _os_log_impl(&dword_18C849000, v78, OS_LOG_TYPE_FAULT, "%{public}@Assertion failed: %{public}@. Description: %{public}@", buf, 0x20u);
        if (v79)

      }
    }

    v69 = 0;
    v50 = v124;
  }
  if (v69)
    v88 = v49;
  else
    v88 = 0;
  if (!objc_msgSend(v50, "length"))
  {
    if (+[AMSUnitTests isRunningUnitTests](AMSUnitTests, "isRunningUnitTests"))
    {
      +[AMSLogConfig sharedBagConfig](AMSLogConfig, "sharedBagConfig");
      v96 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v96)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v96 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v96, "OSLogObject");
      v97 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v97, OS_LOG_TYPE_ERROR))
      {
        AMSLogKey();
        v98 = (void *)objc_claimAutoreleasedReturnValue();
        v99 = (void *)MEMORY[0x1E0CB3940];
        if (v98)
        {
          v100 = objc_opt_class();
          AMSLogKey();
          v101 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v99, "stringWithFormat:", CFSTR("%@: [%@] "), v100, v101);
          v102 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: "), objc_opt_class());
          v102 = (void *)objc_claimAutoreleasedReturnValue();
          v101 = v102;
        }
        AMSHashIfNeeded(CFSTR("identifier.length > 0"));
        v112 = (void *)objc_claimAutoreleasedReturnValue();
        AMSHashIfNeeded(CFSTR("'identifier' must be non-empty in order to persist a bag."));
        v113 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v132 = v102;
        v133 = 2114;
        v134 = v112;
        v135 = 2114;
        v136 = v113;
        _os_log_impl(&dword_18C849000, v97, OS_LOG_TYPE_ERROR, "%{public}@Assertion failed: %{public}@. Description: %{public}@", buf, 0x20u);
        if (v98)

      }
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v114 = (void *)objc_claimAutoreleasedReturnValue();
      +[AMSLogConfig sharedBagConfig](AMSLogConfig, "sharedBagConfig");
      v115 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v114, "postNotificationName:object:userInfo:", CFSTR("com.apple.AppleMediaServicesTests.FaultLogged"), v115, 0);

    }
    else
    {
      +[AMSLogConfig sharedBagConfig](AMSLogConfig, "sharedBagConfig");
      v103 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v103)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v103 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v103, "OSLogObject");
      v104 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v104, OS_LOG_TYPE_FAULT))
      {
        AMSLogKey();
        v105 = (void *)objc_claimAutoreleasedReturnValue();
        v106 = (void *)MEMORY[0x1E0CB3940];
        if (v105)
        {
          v107 = objc_opt_class();
          AMSLogKey();
          v108 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v106, "stringWithFormat:", CFSTR("%@: [%@] "), v107, v108);
          v109 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: "), objc_opt_class());
          v109 = (void *)objc_claimAutoreleasedReturnValue();
          v108 = v109;
        }
        AMSHashIfNeeded(CFSTR("identifier.length > 0"));
        v116 = (void *)objc_claimAutoreleasedReturnValue();
        AMSHashIfNeeded(CFSTR("'identifier' must be non-empty in order to persist a bag."));
        v117 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v132 = v109;
        v133 = 2114;
        v134 = v116;
        v135 = 2114;
        v136 = v117;
        _os_log_impl(&dword_18C849000, v104, OS_LOG_TYPE_FAULT, "%{public}@Assertion failed: %{public}@. Description: %{public}@", buf, 0x20u);
        if (v105)

      }
    }
    goto LABEL_133;
  }
  if (v88)
  {
    +[AMSLogConfig sharedBagConfig](AMSLogConfig, "sharedBagConfig");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v89)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v89 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v89, "OSLogObject");
    v90 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v90, OS_LOG_TYPE_DEFAULT))
    {
      AMSLogKey();
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      v92 = (void *)MEMORY[0x1E0CB3940];
      if (v91)
      {
        v93 = objc_opt_class();
        AMSLogKey();
        v94 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v92, "stringWithFormat:", CFSTR("%@: [%@] "), v93, v94);
        v95 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: "), objc_opt_class());
        v95 = (void *)objc_claimAutoreleasedReturnValue();
        v94 = v95;
      }
      AMSHashIfNeeded(v124);
      v110 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v132 = v95;
      v133 = 2114;
      v134 = v110;
      _os_log_impl(&dword_18C849000, v90, OS_LOG_TYPE_DEFAULT, "%{public}@Enqueuing async bag persistence. bagIdentifier = %{public}@", buf, 0x16u);
      if (v91)

    }
    -[AMSBag persistenceQueue](self, "persistenceQueue");
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    v125[0] = MEMORY[0x1E0C809B0];
    v125[1] = 3221225472;
    v125[2] = __98__AMSBag__persistBagDictionary_withIdentifier_partialIdentifier_expirationDate_onlyIfPreExisting___block_invoke;
    v125[3] = &unk_1E253E768;
    v125[4] = self;
    v126 = v124;
    v127 = v123;
    v130 = a7;
    v128 = v122;
    v129 = v121;
    AMSDispatchAsync(v111, v125);

LABEL_133:
    v69 = v123;
  }

}

void __38__AMSBag__configureDataSourceHandlers__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v4;
  id WeakRetained;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  _QWORD v37[5];
  id v38;
  _QWORD block[5];
  _QWORD v40[3];
  _QWORD v41[3];
  uint8_t buf[4];
  void *v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v6 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "persistenceQueue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(v6, "persistenceQueue");
      v8 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __38__AMSBag__configureDataSourceHandlers__block_invoke_92;
      block[3] = &unk_1E253E5C0;
      block[4] = v6;
      dispatch_async(v8, block);

    }
    +[AMSLogConfig sharedBagConfig](AMSLogConfig, "sharedBagConfig");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v9, "OSLogObject");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      AMSLogKey();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)MEMORY[0x1E0CB3940];
      if (v11)
      {
        v13 = objc_opt_class();
        AMSLogKey();
        v2 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "stringWithFormat:", CFSTR("%@: [%@] "), v13, v2);
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: "), objc_opt_class());
      }
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v43 = v14;
      _os_log_impl(&dword_18C849000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@The bag changed. Posting a notification.", buf, 0xCu);
      if (v11)
      {

        v14 = (void *)v2;
      }

    }
    if (objc_msgSend(v6, "persistenceIsEnabled")
      && objc_msgSend(v6, "persistenceAPIWasCalled"))
    {
      objc_msgSend(v4, "updatedData");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "loadedBagIdentifier");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "loadedBagPartialIdentifier");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "updatedExpirationDate");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "_persistBagDictionary:withIdentifier:partialIdentifier:expirationDate:onlyIfPreExisting:", v21, v22, v23, v24, 1);

    }
    objc_msgSend(v6, "updateHandlers");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "updatedData");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "changedKeys");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "callHandlersUsingNewBagDictionary:changedKeys:", v26, v27);

    v40[0] = CFSTR("profile");
    objc_msgSend(v6, "profile");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v41[0] = v28;
    v40[1] = CFSTR("profileVersion");
    objc_msgSend(v6, "profileVersion");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v41[1] = v29;
    v40[2] = CFSTR("changedKeys");
    objc_msgSend(v4, "changedKeys");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "allObjects");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v41[2] = v31;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v41, v40, 3);
    v32 = objc_claimAutoreleasedReturnValue();
    v33 = (void *)objc_msgSend((id)v32, "mutableCopy");

    objc_msgSend(v4, "accountIdentifier");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v32) = v34 == 0;

    if ((v32 & 1) == 0)
    {
      objc_msgSend(v4, "accountIdentifier");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "setObject:forKeyedSubscript:", v35, CFSTR("accountIdentifier"));

    }
    objc_msgSend(v6, "changeNotificationQueue");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37[0] = MEMORY[0x1E0C809B0];
    v37[1] = 3221225472;
    v37[2] = __38__AMSBag__configureDataSourceHandlers__block_invoke_94;
    v37[3] = &unk_1E253E6F0;
    v37[4] = v6;
    v15 = v33;
    v38 = v15;
    AMSDispatchAsync(v36, v37);

  }
  else
  {
    +[AMSLogConfig sharedBagConfig](AMSLogConfig, "sharedBagConfig");
    v15 = (id)objc_claimAutoreleasedReturnValue();
    if (!v15)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v15 = (id)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v15, "OSLogObject");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      AMSLogKey();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = (void *)MEMORY[0x1E0CB3940];
      objc_opt_class();
      if (v17)
      {
        v19 = objc_opt_class();
        AMSLogKey();
        v2 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "stringWithFormat:", CFSTR("%@: [%@] "), v19, v2);
      }
      else
      {
        objc_msgSend(v18, "stringWithFormat:", CFSTR("%@: "), objc_opt_class());
      }
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v43 = v20;
      _os_log_impl(&dword_18C849000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@dataSourceChangedHandler was called, but the owning bag was deallocated after the handler was called. No AMSBagChangedNotification will be posted.", buf, 0xCu);
      if (v17)
      {

        v20 = (void *)v2;
      }

    }
  }

}

- (OS_dispatch_queue)persistenceQueue
{
  return self->_persistenceQueue;
}

- (NSString)profile
{
  void *v2;
  void *v3;

  -[AMSBag dataSource](self, "dataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "profile");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)profileVersion
{
  void *v2;
  void *v3;

  -[AMSBag dataSource](self, "dataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "profileVersion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (AMSBagCachedValueUpdateHandlers)updateHandlers
{
  return self->_updateHandlers;
}

- (BOOL)persistenceIsEnabled
{
  void *v2;
  BOOL v3;

  -[AMSBag persistence](self, "persistence");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (BOOL)persistenceAPIWasCalled
{
  return self->_persistenceAPIWasCalled;
}

- (OS_dispatch_queue)changeNotificationQueue
{
  return self->_changeNotificationQueue;
}

void __98__AMSBag__persistBagDictionary_withIdentifier_partialIdentifier_expirationDate_onlyIfPreExisting___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  BOOL v15;
  void *v16;
  AMSBagUnderlyingData *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  uint64_t v28;
  id v29;
  void *v30;
  void *v31;
  uint64_t v32;
  id v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  id v39;
  id v40;
  uint8_t buf[4];
  uint64_t v42;
  __int16 v43;
  id v44;
  __int16 v45;
  void *v46;
  __int16 v47;
  void *v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  +[AMSLogConfig sharedBagConfig](AMSLogConfig, "sharedBagConfig");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v2, "OSLogObject");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    AMSLogKey();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)MEMORY[0x1E0CB3940];
    if (v4)
    {
      v6 = objc_opt_class();
      AMSLogKey();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "stringWithFormat:", CFSTR("%@: [%@] "), v6, v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: "), objc_opt_class());
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v8;
    }
    AMSHashIfNeeded(*(void **)(a1 + 40));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v42 = (uint64_t)v8;
    v43 = 2114;
    v44 = v9;
    _os_log_impl(&dword_18C849000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@Starting enqueued async bag persistence. bagIdentifier = %{public}@", buf, 0x16u);
    if (v4)

  }
  objc_msgSend(*(id *)(a1 + 32), "persistence");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = *(_QWORD *)(a1 + 40);
  v40 = 0;
  objc_msgSend(v10, "underlyingDataFor:error:", v11, &v40);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v40;

  if (v12)
  {
    objc_msgSend(v12, "expirationDate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "compare:", *(_QWORD *)(a1 + 48)) == -1;

    if (!v15)
    {
      +[AMSLogConfig sharedBagConfig](AMSLogConfig, "sharedBagConfig");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v16)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v16, "OSLogObject");
      v17 = (AMSBagUnderlyingData *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(&v17->super, OS_LOG_TYPE_DEFAULT))
      {
        v18 = objc_opt_class();
        AMSLogKey();
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        AMSHashIfNeeded(*(void **)(a1 + 40));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v42 = v18;
        v43 = 2114;
        v44 = v19;
        v45 = 2114;
        v46 = v20;
        _os_log_impl(&dword_18C849000, &v17->super, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Bag won't be persisted since the expiration date is earlier than an existing persisted one. bagIdentifier = %{public}@", buf, 0x20u);

      }
      goto LABEL_39;
    }
  }
  if (!v13)
  {
LABEL_23:
    objc_msgSend(MEMORY[0x1E0C99E20], "setWithObject:", *(_QWORD *)(a1 + 56));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      objc_msgSend(v12, "aliasKeys");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "unionSet:", v24);

    }
    v17 = -[AMSBagUnderlyingData initWithFileKey:aliasKeys:bagDictionary:expirationDate:]([AMSBagUnderlyingData alloc], "initWithFileKey:aliasKeys:bagDictionary:expirationDate:", *(_QWORD *)(a1 + 40), v16, *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 48));

    objc_msgSend(*(id *)(a1 + 32), "persistence");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = 0;
    objc_msgSend(v25, "persist:error:", v17, &v39);
    v13 = v39;

    if (v13)
    {
      +[AMSLogConfig sharedBagConfig](AMSLogConfig, "sharedBagConfig");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v26)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v26, "OSLogObject");
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        v28 = objc_opt_class();
        AMSLogKey();
        v29 = (id)objc_claimAutoreleasedReturnValue();
        AMSLogableError(v13);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        AMSHashIfNeeded(*(void **)(a1 + 40));
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v42 = v28;
        v43 = 2114;
        v44 = v29;
        v45 = 2114;
        v46 = v30;
        v47 = 2114;
        v48 = v31;
        _os_log_impl(&dword_18C849000, v27, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to persist bag. error = %{public}@ | bagIdentifier = %{public}@", buf, 0x2Au);

      }
    }
    else
    {
      +[AMSLogConfig sharedBagConfig](AMSLogConfig, "sharedBagConfig");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v26)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v26, "OSLogObject");
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        v36 = objc_opt_class();
        AMSLogKey();
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        AMSHashIfNeeded(*(void **)(a1 + 40));
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v42 = v36;
        v43 = 2114;
        v44 = v37;
        v45 = 2114;
        v46 = v38;
        _os_log_impl(&dword_18C849000, v27, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Successfully persisted bag. bagIdentifier = %{public}@", buf, 0x20u);

      }
    }

    goto LABEL_39;
  }
  if (AMSErrorIsEqual(v13, CFSTR("AMSErrorDomain"), 7))
  {
    if (*(_BYTE *)(a1 + 72))
    {
      +[AMSLogConfig sharedBagConfig](AMSLogConfig, "sharedBagConfig");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v16)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v16, "OSLogObject");
      v17 = (AMSBagUnderlyingData *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(&v17->super, OS_LOG_TYPE_DEFAULT))
      {
        v21 = objc_opt_class();
        AMSLogKey();
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        AMSHashIfNeeded(*(void **)(a1 + 40));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v42 = v21;
        v43 = 2114;
        v44 = v22;
        v45 = 2114;
        v46 = v23;
        _os_log_impl(&dword_18C849000, &v17->super, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Bag won't be persisted as an existing persisted bag wasn't found. bagIdentifier = %{public}@", buf, 0x20u);

      }
      goto LABEL_39;
    }
    goto LABEL_23;
  }
  +[AMSLogConfig sharedBagConfig](AMSLogConfig, "sharedBagConfig");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v16)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v16, "OSLogObject");
  v17 = (AMSBagUnderlyingData *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(&v17->super, OS_LOG_TYPE_ERROR))
  {
    v32 = objc_opt_class();
    AMSLogKey();
    v33 = (id)objc_claimAutoreleasedReturnValue();
    AMSLogableError(v13);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    AMSHashIfNeeded(*(void **)(a1 + 40));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v42 = v32;
    v43 = 2114;
    v44 = v33;
    v45 = 2114;
    v46 = v34;
    v47 = 2114;
    v48 = v35;
    _os_log_impl(&dword_18C849000, &v17->super, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to load persisted bag. error = %{public}@ | bagIdentifier = %{public}@", buf, 0x2Au);

  }
LABEL_39:

}

- (AMSBagUnderlyingDataPersistence)persistence
{
  return self->_persistence;
}

void __28__AMSBag__loadAndPersistBag__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v3;
  uint64_t v4;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  BOOL v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint8_t buf[4];
  void *v42;
  __int16 v43;
  void *v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  +[AMSLogConfig sharedBagConfig](AMSLogConfig, "sharedBagConfig");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v8, "OSLogObject");
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    AMSLogKey();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)MEMORY[0x1E0CB3940];
    if (v3)
    {
      v11 = objc_opt_class();
      AMSLogKey();
      v4 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "stringWithFormat:", CFSTR("%@: [%@] "), v11, v4);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: "), objc_opt_class());
    }
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v42 = v12;
    _os_log_impl(&dword_18C849000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@Handling result of loadWithCompletion.", buf, 0xCu);
    if (v3)
    {

      v12 = (void *)v4;
    }

  }
  if (a3)
  {
    +[AMSLogConfig sharedBagConfig](AMSLogConfig, "sharedBagConfig");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v13)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v13, "OSLogObject");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      AMSLogKey();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (void *)MEMORY[0x1E0CB3940];
      if (v15)
      {
        v17 = objc_opt_class();
        AMSLogKey();
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "stringWithFormat:", CFSTR("%@: [%@] "), v17, v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: "), objc_opt_class());
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = v19;
      }
      objc_msgSend(v7, "loadedBagIdentifier");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      AMSHashIfNeeded(v34);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v42 = v19;
      v43 = 2114;
      v44 = v35;
      _os_log_impl(&dword_18C849000, v14, OS_LOG_TYPE_ERROR, "%{public}@Failed to load bag while attempting persistence. bagIdentifier = %{public}@", buf, 0x16u);

      if (v15)
    }
  }
  else
  {
    objc_msgSend(v7, "loadedBagIdentifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v20
      || (objc_msgSend(v7, "loadedBagIdentifier"),
          v21 = (void *)objc_claimAutoreleasedReturnValue(),
          v22 = objc_msgSend(v21, "length") == 0,
          v21,
          v20,
          v22))
    {
      +[AMSLogConfig sharedBagConfig](AMSLogConfig, "sharedBagConfig");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v13)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v13, "OSLogObject");
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        AMSLogKey();
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = (void *)MEMORY[0x1E0CB3940];
        if (v30)
        {
          v32 = objc_opt_class();
          AMSLogKey();
          v3 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "stringWithFormat:", CFSTR("%@: [%@] "), v32, v3);
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: "), objc_opt_class());
        }
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v42 = v33;
        _os_log_impl(&dword_18C849000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@Bag persistence will be skipped as no loadedBagIdentifier was provided.", buf, 0xCu);
        if (v30)
        {

          v33 = v3;
        }

      }
    }
    else
    {
      +[AMSLogConfig sharedBagConfig](AMSLogConfig, "sharedBagConfig");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v23)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v23, "OSLogObject");
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        AMSLogKey();
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = (void *)MEMORY[0x1E0CB3940];
        if (v25)
        {
          v27 = objc_opt_class();
          AMSLogKey();
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "stringWithFormat:", CFSTR("%@: [%@] "), v27, v28);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: "), objc_opt_class());
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = v29;
        }
        objc_msgSend(v7, "loadedBagIdentifier");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        AMSHashIfNeeded(v36);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v42 = v29;
        v43 = 2114;
        v44 = v37;
        _os_log_impl(&dword_18C849000, v24, OS_LOG_TYPE_DEFAULT, "%{public}@Attempting bag persistence. bagIdentifier = %{public}@", buf, 0x16u);

        if (v25)
      }

      v38 = *(void **)(a1 + 32);
      objc_msgSend(v7, "data");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "loadedBagIdentifier");
      v14 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "loadedBagPartialIdentifier");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "expirationDate");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "_persistBagDictionary:withIdentifier:partialIdentifier:expirationDate:onlyIfPreExisting:", v13, v14, v39, v40, 0);

    }
  }

}

void __18__AMSBag_bagCache__block_invoke()
{
  AMSBagCache *v0;
  void *v1;

  v0 = objc_alloc_init(AMSBagCache);
  v1 = (void *)qword_1ECEACF98;
  qword_1ECEACF98 = (uint64_t)v0;

}

void __32__AMSBag_sharedPersistenceQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("com.apple.AppleMediaServices.AMSBag.persistenceQueue", v2);
  v1 = (void *)qword_1ECEACFA8;
  qword_1ECEACFA8 = (uint64_t)v0;

}

- (void)setTemporaryPreloadedBagData:(id)a3
{
  objc_storeStrong((id *)&self->_temporaryPreloadedBagData, a3);
}

- (AMSBagUnderlyingData)temporaryPreloadedBagData
{
  return self->_temporaryPreloadedBagData;
}

- (id)cachedValuesForKeys:(id)a3 observationToken:(unint64_t *)a4 updateHandler:(id)a5
{
  void *v5;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  id v17;
  void *v18;
  BOOL v19;
  NSObject *v20;
  id v21;
  uint64_t v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  _UNKNOWN **v29;
  void *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  _UNKNOWN **v36;
  void *v37;
  NSObject *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  NSObject *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  uint64_t v57;
  void (**v58)(_QWORD);
  void (**v59)(_QWORD);
  void *v60;
  void *v61;
  _QWORD v62[5];
  _QWORD block[5];
  id v64;
  __int128 *p_buf;
  uint64_t *v66;
  uint64_t *v67;
  uint64_t v68;
  uint64_t *v69;
  uint64_t v70;
  uint64_t (*v71)(uint64_t, uint64_t);
  void (*v72)(uint64_t);
  id v73;
  uint64_t v74;
  uint64_t *v75;
  uint64_t v76;
  uint64_t (*v77)(uint64_t, uint64_t);
  void (*v78)(uint64_t);
  id v79;
  id v80;
  _QWORD v81[5];
  _QWORD aBlock[6];
  uint8_t v83[4];
  void *v84;
  __int128 buf;
  uint64_t v86;
  uint64_t (*v87)(uint64_t, uint64_t);
  void (*v88)(uint64_t);
  id v89;
  uint64_t v90;

  v90 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a5;
  v61 = v11;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("AMSBag.mm"), 236, CFSTR("The 'keys' set must be provided."));

  }
  if (!objc_msgSend(v10, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("AMSBag.mm"), 237, CFSTR("The 'keys' set must not be empty."));

  }
  if ((objc_msgSend(v10, "ams_allWithTest:", &__block_literal_global_41) & 1) != 0)
  {
    if (a4)
      goto LABEL_7;
LABEL_63:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("AMSBag.mm"), 241, CFSTR("An 'outToken' pointer must be provided."));

    if (v11)
      goto LABEL_8;
    goto LABEL_64;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("AMSBag.mm"), 240, CFSTR("Every value in the 'keys' set must be a non-empty string."));

  if (!a4)
    goto LABEL_63;
LABEL_7:
  if (v11)
    goto LABEL_8;
LABEL_64:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("AMSBag.mm"), 242, CFSTR("An 'updateHandler' block must be provided."));

LABEL_8:
  v12 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __61__AMSBag_cachedValuesForKeys_observationToken_updateHandler___block_invoke_2;
  aBlock[3] = &unk_1E253E598;
  aBlock[4] = self;
  aBlock[5] = a4;
  v58 = (void (**)(_QWORD))_Block_copy(aBlock);
  -[AMSBag setPersistenceAPIWasCalled:](self, "setPersistenceAPIWasCalled:", 1);
  os_unfair_lock_lock(&self->_updateHandlerConsistencyLock);
  v81[0] = v12;
  v81[1] = 3221225472;
  v81[2] = __61__AMSBag_cachedValuesForKeys_observationToken_updateHandler___block_invoke_62;
  v81[3] = &unk_1E253E5C0;
  v81[4] = self;
  v59 = (void (**)(_QWORD))_Block_copy(v81);
  -[AMSBag dataSource](self, "dataSource");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "bagLoadingPartialIdentifier");
  v60 = (void *)objc_claimAutoreleasedReturnValue();

  -[AMSBag dataSource](self, "dataSource");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_opt_respondsToSelector();

  if ((v15 & 1) == 0)
    goto LABEL_12;
  -[AMSBag dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v80 = 0;
  objc_msgSend(v5, "loadedValuesForKeys:outExpirationDate:", v10, &v80);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v80;

  if (!v16)
  {

LABEL_12:
    v74 = 0;
    v75 = &v74;
    v76 = 0x3032000000;
    v77 = __Block_byref_object_copy__7;
    v78 = __Block_byref_object_dispose__7;
    v79 = 0;
    v68 = 0;
    v69 = &v68;
    v70 = 0x3032000000;
    v71 = __Block_byref_object_copy__7;
    v72 = __Block_byref_object_dispose__7;
    v73 = 0;
    if (!-[AMSBag persistenceIsEnabled](self, "persistenceIsEnabled"))
    {
      v29 = &off_1E2519000;
      +[AMSLogConfig sharedBagConfig](AMSLogConfig, "sharedBagConfig");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v30)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v30, "OSLogObject");
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        AMSLogKey();
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = (void *)MEMORY[0x1E0CB3940];
        if (v32)
        {
          v34 = objc_opt_class();
          AMSLogKey();
          v29 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "stringWithFormat:", CFSTR("%@: [%@] "), v34, v29);
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: "), objc_opt_class());
        }
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(buf) = 138543362;
        *(_QWORD *)((char *)&buf + 4) = v35;
        _os_log_impl(&dword_18C849000, v31, OS_LOG_TYPE_DEFAULT, "%{public}@Persistence is not enabled. No cached values will be returned from cachedValuesForKeys:.", (uint8_t *)&buf, 0xCu);
        if (v32)
        {

          v35 = v29;
        }

      }
      -[AMSBag updateHandlers](self, "updateHandlers");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      *a4 = objc_msgSend(v49, "addHandlerWithKeys:initialValues:handler:", v10, MEMORY[0x1E0C9AA70], v61);

      -[AMSBag dataSource](self, "dataSource");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v62[0] = v12;
      v62[1] = 3221225472;
      v62[2] = __61__AMSBag_cachedValuesForKeys_observationToken_updateHandler___block_invoke_66;
      v62[3] = &unk_1E253E610;
      v62[4] = self;
      objc_msgSend(v50, "loadWithCompletion:", v62);

      v5 = (void *)MEMORY[0x1E0C9AA70];
      goto LABEL_60;
    }
    -[AMSBag persistenceQueue](self, "persistenceQueue");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18 == 0;

    if (v19)
    {
      v36 = &off_1E2519000;
      if (+[AMSUnitTests isRunningUnitTests](AMSUnitTests, "isRunningUnitTests"))
      {
        +[AMSLogConfig sharedBagConfig](AMSLogConfig, "sharedBagConfig");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v37)
        {
          +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v37, "OSLogObject");
        v38 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
        {
          AMSLogKey();
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          v40 = (void *)MEMORY[0x1E0CB3940];
          if (v39)
          {
            v41 = objc_opt_class();
            AMSLogKey();
            v12 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(v40, "stringWithFormat:", CFSTR("%@: [%@] "), v41, v12);
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: "), objc_opt_class());
          }
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(buf) = 138543362;
          *(_QWORD *)((char *)&buf + 4) = v42;
          _os_log_impl(&dword_18C849000, v38, OS_LOG_TYPE_ERROR, "%{public}@Persistence was enabled but persisteneQueue was unexpectedly nil. No persisted bag will be loaded.", (uint8_t *)&buf, 0xCu);
          if (v39)
          {

            v42 = (void *)v12;
          }

        }
        objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        +[AMSLogConfig sharedBagConfig](AMSLogConfig, "sharedBagConfig");
        v44 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "postNotificationName:object:userInfo:", CFSTR("com.apple.AppleMediaServicesTests.FaultLogged"), v44, 0);
      }
      else
      {
        +[AMSLogConfig sharedBagConfig](AMSLogConfig, "sharedBagConfig");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v43)
        {
          +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v43, "OSLogObject");
        v44 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_FAULT))
        {
          AMSLogKey();
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          v46 = (void *)MEMORY[0x1E0CB3940];
          if (v45)
          {
            v47 = objc_opt_class();
            AMSLogKey();
            v36 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v46, "stringWithFormat:", CFSTR("%@: [%@] "), v47, v36);
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: "), objc_opt_class());
          }
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(buf) = 138543362;
          *(_QWORD *)((char *)&buf + 4) = v48;
          _os_log_impl(&dword_18C849000, v44, OS_LOG_TYPE_FAULT, "%{public}@Persistence was enabled but persisteneQueue was unexpectedly nil. No persisted bag will be loaded.", (uint8_t *)&buf, 0xCu);
          if (v45)
          {

            v48 = v36;
          }

        }
      }

    }
    else
    {
      *(_QWORD *)&buf = 0;
      *((_QWORD *)&buf + 1) = &buf;
      v86 = 0x3032000000;
      v87 = __Block_byref_object_copy__7;
      v88 = __Block_byref_object_dispose__7;
      v89 = 0;
      -[AMSBag persistenceQueue](self, "persistenceQueue");
      v20 = objc_claimAutoreleasedReturnValue();
      block[0] = v12;
      block[1] = 3221225472;
      block[2] = __61__AMSBag_cachedValuesForKeys_observationToken_updateHandler___block_invoke_65;
      block[3] = &unk_1E253E5E8;
      block[4] = self;
      p_buf = &buf;
      v21 = v60;
      v64 = v21;
      v66 = &v74;
      v67 = &v68;
      dispatch_sync(v20, block);

      v22 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 40);
      if (v22)
      {
        +[AMSLogConfig sharedBagConfig](AMSLogConfig, "sharedBagConfig");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v23)
        {
          +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v23, "OSLogObject");
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          AMSLogKey();
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = (void *)MEMORY[0x1E0CB3940];
          if (v25)
          {
            v27 = objc_opt_class();
            AMSLogKey();
            v57 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "stringWithFormat:", CFSTR("%@: [%@] "), v27, v57);
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: "), objc_opt_class());
          }
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)v83 = 138543362;
          v84 = v28;
          _os_log_impl(&dword_18C849000, v24, OS_LOG_TYPE_DEFAULT, "%{public}@Preloaded persisted bag data was found and will be returned from cachedValuesForKeys:.", v83, 0xCu);
          if (v25)
          {

            v28 = (void *)v57;
          }

        }
        -[AMSBag _availableValuesFromPersistedBagData:error:keys:partialIdentifier:updateHandler:outToken:](self, "_availableValuesFromPersistedBagData:error:keys:partialIdentifier:updateHandler:outToken:", *(_QWORD *)(*((_QWORD *)&buf + 1) + 40), 0, v10, v21, v61, a4);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
      }

      _Block_object_dispose(&buf, 8);
      if (v22)
        goto LABEL_60;
    }
    -[AMSBag _availableValuesFromPersistedBagData:error:keys:partialIdentifier:updateHandler:outToken:](self, "_availableValuesFromPersistedBagData:error:keys:partialIdentifier:updateHandler:outToken:", v75[5], v69[5], v10, v60, v61, a4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_60:
    _Block_object_dispose(&v68, 8);

    _Block_object_dispose(&v74, 8);
    goto LABEL_61;
  }
  -[AMSBag _availableValuesFromCachedData:keys:partialIdentifier:expirationDate:updateHandler:outToken:](self, "_availableValuesFromCachedData:keys:partialIdentifier:expirationDate:updateHandler:outToken:", v16, v10, v60, v17, v61, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_61:
  v59[2](v59);

  v58[2](v58);
  return v5;
}

void __61__AMSBag_cachedValuesForKeys_observationToken_updateHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  _BOOL4 v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v1 = **(_QWORD **)(a1 + 40);
  if (v1 == +[AMSBag uninitializedToken](AMSBag, "uninitializedToken"))
  {
    v2 = +[AMSUnitTests isRunningUnitTests](AMSUnitTests, "isRunningUnitTests");
    +[AMSLogConfig sharedBagConfig](AMSLogConfig, "sharedBagConfig");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)v3;
    if (v2)
    {
      if (!v3)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v4, "OSLogObject");
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        AMSLogKey();
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = (void *)MEMORY[0x1E0CB3940];
        if (v6)
        {
          v8 = objc_opt_class();
          AMSLogKey();
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "stringWithFormat:", CFSTR("%@: [%@] "), v8, v9);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: "), objc_opt_class());
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v9 = v10;
        }
        AMSHashIfNeeded(CFSTR("*outToken != AMSBagObservationUninitializedToken"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        AMSHashIfNeeded(CFSTR("Expected 'outToken' parameter to be assigned before returning."));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v22 = v10;
        v23 = 2114;
        v24 = v17;
        v25 = 2114;
        v26 = v18;
        _os_log_impl(&dword_18C849000, v5, OS_LOG_TYPE_ERROR, "%{public}@Assertion failed: %{public}@. Description: %{public}@", buf, 0x20u);
        if (v6)

      }
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      +[AMSLogConfig sharedBagConfig](AMSLogConfig, "sharedBagConfig");
      v11 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "postNotificationName:object:userInfo:", CFSTR("com.apple.AppleMediaServicesTests.FaultLogged"), v11, 0);
    }
    else
    {
      if (!v3)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v4, "OSLogObject");
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      {
        AMSLogKey();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = (void *)MEMORY[0x1E0CB3940];
        if (v12)
        {
          v14 = objc_opt_class();
          AMSLogKey();
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "stringWithFormat:", CFSTR("%@: [%@] "), v14, v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: "), objc_opt_class());
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = v16;
        }
        AMSHashIfNeeded(CFSTR("*outToken != AMSBagObservationUninitializedToken"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        AMSHashIfNeeded(CFSTR("Expected 'outToken' parameter to be assigned before returning."));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v22 = v16;
        v23 = 2114;
        v24 = v19;
        v25 = 2114;
        v26 = v20;
        _os_log_impl(&dword_18C849000, v11, OS_LOG_TYPE_FAULT, "%{public}@Assertion failed: %{public}@. Description: %{public}@", buf, 0x20u);
        if (v12)

      }
    }

  }
}

+ (unint64_t)uninitializedToken
{
  return +[AMSBagCachedValueUpdateHandlers uninitializedToken](AMSBagCachedValueUpdateHandlers, "uninitializedToken");
}

BOOL __61__AMSBag_cachedValuesForKeys_observationToken_updateHandler___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  _BOOL8 v3;

  v2 = a2;
  objc_opt_class();
  v3 = (objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v2, "length") != 0;

  return v3;
}

- (void)setPersistenceAPIWasCalled:(BOOL)a3
{
  self->_persistenceAPIWasCalled = a3;
}

- (id)_availableValuesFromCachedData:(id)a3 keys:(id)a4 partialIdentifier:(id)a5 expirationDate:(id)a6 updateHandler:(id)a7 outToken:(unint64_t *)a8
{
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  unint64_t *v35;
  id v36;
  void *v37;
  id v38;
  id v39;
  uint8_t buf[4];
  void *v42;
  __int16 v43;
  uint64_t v44;
  __int16 v45;
  uint64_t v46;
  __int16 v47;
  void *v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  v36 = a5;
  v39 = a6;
  v37 = v13;
  v38 = a7;
  v15 = (void *)objc_msgSend(v14, "mutableCopy");
  v16 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(v13, "allKeys");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setWithArray:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "intersectSet:", v18);

  v19 = objc_msgSend(v15, "count");
  v35 = a8;
  v20 = objc_msgSend(v14, "count");
  +[AMSLogConfig sharedBagConfig](AMSLogConfig, "sharedBagConfig");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v21)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v21, "OSLogObject");
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    AMSLogKey();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (void *)MEMORY[0x1E0CB3940];
    if (v23)
    {
      v25 = objc_opt_class();
      AMSLogKey();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "stringWithFormat:", CFSTR("%@: [%@] "), v25, v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: "), objc_opt_class());
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = v27;
    }
    AMSHashIfNeeded(v36);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v42 = v27;
    v43 = 2048;
    v44 = v19;
    v45 = 2048;
    v46 = v20;
    v47 = 2114;
    v48 = v28;
    _os_log_impl(&dword_18C849000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@Returning %lu cached bag values from a total of %lu. partialBagIdentifier = %{public}@", buf, 0x2Au);
    if (v23)

  }
  objc_msgSend(v37, "ams_valuesForKeys:", v15);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend(v39, "compare:", v30);

  +[AMSBagPersistenceMetricsTracker trackerForCachedValuesCallWithRequestedValueCount:cachedValueCount:cachedBagWasExpired:](AMSBagPersistenceMetricsTracker, "trackerForCachedValuesCallWithRequestedValueCount:cachedValueCount:cachedBagWasExpired:", objc_msgSend(v14, "count"), objc_msgSend(v15, "count"), v31 == -1);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSBag updateHandlers](self, "updateHandlers");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  *v35 = objc_msgSend(v33, "addHandlerWithKeys:initialValues:metricsTracker:handler:", v14, v29, v32, v38);

  -[AMSBag _loadAndPersistBag](self, "_loadAndPersistBag");
  return v29;
}

- (void)_loadAndPersistBag
{
  uint64_t v2;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  _QWORD v11[5];
  uint8_t buf[4];
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  +[AMSLogConfig sharedBagConfig](AMSLogConfig, "sharedBagConfig");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v4, "OSLogObject");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    AMSLogKey();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)MEMORY[0x1E0CB3940];
    if (v6)
    {
      v8 = objc_opt_class();
      AMSLogKey();
      v2 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "stringWithFormat:", CFSTR("%@: [%@] "), v8, v2);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: "), objc_opt_class());
    }
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v13 = v9;
    _os_log_impl(&dword_18C849000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@Calling loadWithCompletion.", buf, 0xCu);
    if (v6)
    {

      v9 = (void *)v2;
    }

  }
  -[AMSBag dataSource](self, "dataSource");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __28__AMSBag__loadAndPersistBag__block_invoke;
  v11[3] = &unk_1E253E610;
  v11[4] = self;
  objc_msgSend(v10, "loadWithCompletion:", v11);

}

- (id)_availableValuesFromPersistedBagData:(id)a3 error:(id)a4 keys:(id)a5 partialIdentifier:(id)a6 updateHandler:(id)a7 outToken:(unint64_t *)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v43;
  NSObject *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  void *v52;
  void *v53;
  id v54;
  uint8_t buf[4];
  void *v56;
  __int16 v57;
  void *v58;
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v54 = a6;
  v17 = a7;
  v53 = v14;
  if (v15)
  {
    -[AMSBag updateHandlers](self, "updateHandlers");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *a8 = objc_msgSend(v18, "addHandlerWithKeys:initialValues:handler:", v16, MEMORY[0x1E0C9AA70], v17);

    if ((AMSErrorIsEqual(v15, CFSTR("AMSErrorDomain"), 7) & 1) != 0)
    {
      +[AMSLogConfig sharedBagConfig](AMSLogConfig, "sharedBagConfig");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v19)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v19, "OSLogObject");
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        AMSLogKey();
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = (void *)MEMORY[0x1E0CB3940];
        if (v21)
        {
          v23 = objc_opt_class();
          AMSLogKey();
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "stringWithFormat:", CFSTR("%@: [%@] "), v23, v24);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: "), objc_opt_class());
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = v25;
        }
        AMSHashIfNeeded(v54);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v56 = v25;
        v57 = 2114;
        v58 = v40;
        _os_log_impl(&dword_18C849000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@Failed to load persisted bag because one wasn't found on file system. Returning empty dictionary. partialBagIdentifier = %{public}@", buf, 0x16u);
        if (v21)

      }
    }
    else
    {
      +[AMSLogConfig sharedBagConfig](AMSLogConfig, "sharedBagConfig");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v19)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v19, "OSLogObject");
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        AMSLogKey();
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = (void *)MEMORY[0x1E0CB3940];
        if (v29)
        {
          v31 = objc_opt_class();
          AMSLogKey();
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "stringWithFormat:", CFSTR("%@: [%@] "), v31, v32);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: "), objc_opt_class());
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = v33;
        }
        AMSHashIfNeeded(v54);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v56 = v33;
        v57 = 2114;
        v58 = v41;
        _os_log_impl(&dword_18C849000, v20, OS_LOG_TYPE_ERROR, "%{public}@Failed to load persisted bag for reading cached values. partialBagIdentifier = %{public}@", buf, 0x16u);
        if (v29)

      }
    }

    -[AMSBag _loadAndPersistBag](self, "_loadAndPersistBag");
    +[AMSBagPersistenceMetricsTracker trackCachedValuesUnavailableWithRequestedValueCount:](AMSBagPersistenceMetricsTracker, "trackCachedValuesUnavailableWithRequestedValueCount:", objc_msgSend(v16, "count"));
LABEL_31:
    v28 = (void *)MEMORY[0x1E0C9AA70];
    goto LABEL_32;
  }
  if (!v14)
  {
    if (v54)
    {
      if (+[AMSUnitTests isRunningUnitTests](AMSUnitTests, "isRunningUnitTests"))
      {
        +[AMSLogConfig sharedBagConfig](AMSLogConfig, "sharedBagConfig");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v34)
        {
          +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v34, "OSLogObject");
        v35 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
        {
          AMSLogKey();
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = (void *)MEMORY[0x1E0CB3940];
          if (v36)
          {
            v38 = objc_opt_class();
            AMSLogKey();
            a6 = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v37, "stringWithFormat:", CFSTR("%@: [%@] "), v38, a6);
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: "), objc_opt_class());
          }
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v56 = v39;
          _os_log_impl(&dword_18C849000, v35, OS_LOG_TYPE_ERROR, "%{public}@Unexpectedly received no error or result data. No data will be returned.", buf, 0xCu);
          if (v36)
          {

            v39 = a6;
          }

        }
        objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        +[AMSLogConfig sharedBagConfig](AMSLogConfig, "sharedBagConfig");
        v44 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "postNotificationName:object:userInfo:", CFSTR("com.apple.AppleMediaServicesTests.FaultLogged"), v44, 0);
      }
      else
      {
        +[AMSLogConfig sharedBagConfig](AMSLogConfig, "sharedBagConfig");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v43)
        {
          +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v43, "OSLogObject");
        v44 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_FAULT))
        {
          AMSLogKey();
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          v50 = (void *)MEMORY[0x1E0CB3940];
          if (v49)
          {
            v51 = objc_opt_class();
            AMSLogKey();
            a6 = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v50, "stringWithFormat:", CFSTR("%@: [%@] "), v51, a6);
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: "), objc_opt_class());
          }
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v56 = v52;
          _os_log_impl(&dword_18C849000, v44, OS_LOG_TYPE_FAULT, "%{public}@Unexpectedly received no error or result data. No data will be returned.", buf, 0xCu);
          if (v49)
          {

            v52 = a6;
          }

        }
      }
    }
    else
    {
      +[AMSLogConfig sharedBagConfig](AMSLogConfig, "sharedBagConfig");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v43)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v43, "OSLogObject");
      v44 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
      {
        AMSLogKey();
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v46 = (void *)MEMORY[0x1E0CB3940];
        if (v45)
        {
          v47 = objc_opt_class();
          AMSLogKey();
          a6 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v46, "stringWithFormat:", CFSTR("%@: [%@] "), v47, a6);
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: "), objc_opt_class());
        }
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v56 = v48;
        _os_log_impl(&dword_18C849000, v44, OS_LOG_TYPE_DEFAULT, "%{public}@Data source didn't provide a loading identifier. No cached data will be returned.", buf, 0xCu);
        if (v45)
        {

          v48 = a6;
        }

      }
    }

    goto LABEL_31;
  }
  objc_msgSend(v14, "bagDictionary");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "expirationDate");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSBag _availableValuesFromCachedData:keys:partialIdentifier:expirationDate:updateHandler:outToken:](self, "_availableValuesFromCachedData:keys:partialIdentifier:expirationDate:updateHandler:outToken:", v26, v16, v54, v27, v17, a8);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_32:
  return v28;
}

- (void)createSnapshotWithCompletion:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  uint8_t buf[4];
  id v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  AMSBag *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[AMSLogConfig sharedConfigOversize](AMSLogConfig, "sharedConfigOversize");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v5, "OSLogObject");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (id)objc_opt_class();
    AMSLogKey();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v18 = v7;
    v19 = 2114;
    v20 = v8;
    v21 = 2114;
    v22 = self;
    _os_log_impl(&dword_18C849000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Attempting to create a snapshot. originalBag = %{public}@", buf, 0x20u);

  }
  AMSLogKey();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak((id *)buf, self);
  -[AMSBag dataSource](self, "dataSource");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __39__AMSBag_createSnapshotWithCompletion___block_invoke;
  v13[3] = &unk_1E253E638;
  objc_copyWeak(&v16, (id *)buf);
  v11 = v9;
  v14 = v11;
  v12 = v4;
  v15 = v12;
  objc_msgSend(v10, "loadWithCompletion:", v13);

  objc_destroyWeak(&v16);
  objc_destroyWeak((id *)buf);

}

- (AMSBag)initWithDataSource:(id)a3
{
  return -[AMSBag initWithDataSource:shouldConfigureDataSourceHandlers:](self, "initWithDataSource:shouldConfigureDataSourceHandlers:", a3, 0);
}

- (AMSBag)initWithDataSource:(id)a3 persistenceDirectoryURL:(id)a4 persistenceQueue:(id)a5 changeHandlerQueue:(id)a6 shouldConfigureDataSourceHandlers:(BOOL)a7
{
  _BOOL8 v7;
  id v13;
  id v14;
  id v15;
  id v16;
  AMSBagUnderlyingDataPersistence *v17;
  AMSBagCachedValueUpdateHandlers *v18;
  AMSBag *v19;
  void *v21;
  void *v22;
  void *v23;
  void *v24;

  v7 = a7;
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  if (v13)
  {
    if (v14)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("AMSBag.mm"), 106, CFSTR("Unexpected nil reference: %s"), "dataSource");

    if (v14)
    {
LABEL_3:
      if (v15)
        goto LABEL_4;
LABEL_8:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("AMSBag.mm"), 108, CFSTR("Unexpected nil reference: %s"), "persistenceQueue");

      if (v16)
        goto LABEL_5;
LABEL_9:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("AMSBag.mm"), 109, CFSTR("Unexpected nil reference: %s"), "changeHandlerQueue");

      goto LABEL_5;
    }
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("AMSBag.mm"), 107, CFSTR("Unexpected nil reference: %s"), "persistenceDirectoryURL");

  if (!v15)
    goto LABEL_8;
LABEL_4:
  if (!v16)
    goto LABEL_9;
LABEL_5:
  v17 = -[AMSBagUnderlyingDataPersistence initWithDirectoryURL:]([AMSBagUnderlyingDataPersistence alloc], "initWithDirectoryURL:", v14);
  v18 = -[AMSBagCachedValueUpdateHandlers initWithHandlerQueue:]([AMSBagCachedValueUpdateHandlers alloc], "initWithHandlerQueue:", v16);
  v19 = -[AMSBag _initWithDataSource:persistence:persistenceQueue:updateHandlers:shouldConfigureDataSourceHandlers:](self, "_initWithDataSource:persistence:persistenceQueue:updateHandlers:shouldConfigureDataSourceHandlers:", v13, v17, v15, v18, v7);

  return v19;
}

+ (id)bagForProfile:(id)a3 profileVersion:(id)a4 processInfo:(id)a5 account:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  AMSBagFixedAccountProvider *v14;
  void *v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = (void *)objc_opt_class();
  v14 = -[AMSBagFixedAccountProvider initWithAccount:]([AMSBagFixedAccountProvider alloc], "initWithAccount:", v12);
  objc_msgSend(v13, "_bagForProfile:profileVersion:processInfo:accountProvider:", v9, v10, v11, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (BOOL)isLoaded
{
  void *v2;
  char v3;

  -[AMSBag dataSource](self, "dataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isLoaded");

  return v3;
}

void __61__AMSBag_cachedValuesForKeys_observationToken_updateHandler___block_invoke_62(uint64_t a1)
{
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 12));
}

void __61__AMSBag_cachedValuesForKeys_observationToken_updateHandler___block_invoke_65(uint64_t a1)
{
  uint64_t v1;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  id obj;
  uint8_t buf[4];
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "temporaryPreloadedBagData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "temporaryPreloadedBagData");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v4;

  }
  else
  {
    v7 = *(void **)(a1 + 40);
    if (v7 && objc_msgSend(v7, "length"))
    {
      objc_msgSend(*(id *)(a1 + 32), "persistence");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = *(_QWORD *)(a1 + 40);
      v10 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
      obj = *(id *)(v10 + 40);
      objc_msgSend(v8, "underlyingDataFor:error:", v9, &obj);
      v11 = objc_claimAutoreleasedReturnValue();
      objc_storeStrong((id *)(v10 + 40), obj);
      v12 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v13 = *(void **)(v12 + 40);
      *(_QWORD *)(v12 + 40) = v11;

      objc_msgSend(*(id *)(a1 + 32), "temporaryPreloadedBagData");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14)
      {

      }
      else if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
      {
        +[AMSLogConfig sharedBagConfig](AMSLogConfig, "sharedBagConfig");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v15)
        {
          +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v15, "OSLogObject");
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          AMSLogKey();
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = (void *)MEMORY[0x1E0CB3940];
          if (v17)
          {
            v19 = objc_opt_class();
            AMSLogKey();
            v1 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "stringWithFormat:", CFSTR("%@: [%@] "), v19, v1);
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: "), objc_opt_class());
          }
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v23 = v20;
          _os_log_impl(&dword_18C849000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@Persisted bag data was loaded and will be returned from cachedValuesForKeys: on future calls.", buf, 0xCu);
          if (v17)
          {

            v20 = (void *)v1;
          }

        }
        objc_msgSend(*(id *)(a1 + 32), "setTemporaryPreloadedBagData:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
      }
    }
  }
}

void __61__AMSBag_cachedValuesForKeys_observationToken_updateHandler___block_invoke_66(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    +[AMSLogConfig sharedBagConfig](AMSLogConfig, "sharedBagConfig");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v7, "OSLogObject");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      AMSLogKey();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)MEMORY[0x1E0CB3940];
      if (v9)
      {
        v11 = objc_opt_class();
        AMSLogKey();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "stringWithFormat:", CFSTR("%@: [%@] "), v11, v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: "), objc_opt_class());
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v13;
      }
      objc_msgSend(v5, "loadedBagIdentifier");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      AMSHashIfNeeded(v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v31 = v13;
      v32 = 2114;
      v33 = v22;
      _os_log_impl(&dword_18C849000, v8, OS_LOG_TYPE_ERROR, "%{public}@Failed to load bag. bagIdentifier = %{public}@", buf, 0x16u);

      if (v9)
    }
  }
  else
  {
    +[AMSLogConfig sharedBagConfig](AMSLogConfig, "sharedBagConfig");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v14)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v14, "OSLogObject");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      AMSLogKey();
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = (void *)MEMORY[0x1E0CB3940];
      v29 = (void *)v16;
      if (v16)
      {
        v18 = objc_opt_class();
        AMSLogKey();
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "stringWithFormat:", CFSTR("%@: [%@] "), v18, v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: "), objc_opt_class());
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = v20;
      }
      objc_msgSend(v5, "loadedBagIdentifier");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      AMSHashIfNeeded(v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v31 = v20;
      v32 = 2114;
      v33 = v24;
      _os_log_impl(&dword_18C849000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@Calling update handlers. bagIdentifier = %{public}@", buf, 0x16u);

      if (v29)
    }

    objc_msgSend(*(id *)(a1 + 32), "updateHandlers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "data");
    v8 = objc_claimAutoreleasedReturnValue();
    v25 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(v5, "data");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "allKeys");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setWithArray:", v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "callHandlersUsingNewBagDictionary:changedKeys:", v8, v28);

  }
}

- (NSString)descriptionExtended
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  void *v7;

  -[AMSBag dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  -[AMSBag dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if ((v4 & 1) != 0)
    objc_msgSend(v5, "descriptionExtended");
  else
    objc_msgSend(v5, "description");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (void)setDefaultValue:(id)a3 forKey:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  -[AMSBag dataSource](self, "dataSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDefaultValue:forKey:", v8, v6);

}

- (id)URLForKey:(id)a3 account:(id)a4
{
  id v6;
  id v7;
  AMSBagValue *v8;
  void *v9;
  AMSBagValue *v10;

  v6 = a3;
  v7 = a4;
  v8 = [AMSBagValue alloc];
  -[AMSBag dataSource](self, "dataSource");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[AMSBagValue initWithDataSource:key:valueType:account:](v8, "initWithDataSource:key:valueType:account:", v9, v6, 5, v7);

  return v10;
}

- (id)_temporaryDictionary
{
  AMSMutablePromise *v3;
  void *v4;
  AMSMutablePromise *v5;
  _QWORD v7[5];
  AMSMutablePromise *v8;
  id v9;
  id location;

  v3 = objc_alloc_init(AMSMutablePromise);
  objc_initWeak(&location, self);
  -[AMSBag dataSource](self, "dataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __30__AMSBag__temporaryDictionary__block_invoke;
  v7[3] = &unk_1E253E660;
  objc_copyWeak(&v9, &location);
  v7[4] = self;
  v5 = v3;
  v8 = v5;
  objc_msgSend(v4, "loadWithCompletion:", v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
  return v5;
}

void __30__AMSBag__temporaryDictionary__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  id v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (v5)
  {
    v8 = *(void **)(a1 + 40);
    objc_msgSend(v5, "data");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "finishWithResult:", v9);

  }
  else
  {
    +[AMSLogConfig sharedBagConfig](AMSLogConfig, "sharedBagConfig");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v10, "OSLogObject");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = (id)objc_opt_class();
      AMSLogKey();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138543618;
      v17 = v12;
      v18 = 2114;
      v19 = v13;
      _os_log_impl(&dword_18C849000, v11, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Unable to retrieve temporary dictionary because we failed to load the bag.", (uint8_t *)&v16, 0x16u);

    }
    v14 = *(void **)(a1 + 40);
    AMSError(203, CFSTR("Bag Load Failed"), CFSTR("Unable to retrieve temporary dictionary because we failed to load the bag."), v6);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "finishWithError:", v15);

  }
}

uint64_t __38__AMSBag__configureDataSourceHandlers__block_invoke_92(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setTemporaryPreloadedBagData:", 0);
}

void __38__AMSBag__configureDataSourceHandlers__block_invoke_94(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:userInfo:", CFSTR("AMSBagChangedNotification"), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __38__AMSBag__configureDataSourceHandlers__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  _QWORD v12[2];
  _QWORD v13[2];
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    +[AMSLogConfig sharedBagConfig](AMSLogConfig, "sharedBagConfig");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v2)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v2, "OSLogObject");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = objc_opt_class();
      AMSLogKey();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v15 = v4;
      v16 = 2114;
      v17 = v5;
      _os_log_impl(&dword_18C849000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] The bag was invalidated. Posting a notification.", buf, 0x16u);

    }
    objc_msgSend(WeakRetained, "profile", CFSTR("profile"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v12[1] = CFSTR("profileVersion");
    v13[0] = v6;
    objc_msgSend(WeakRetained, "profileVersion");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v13[1] = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v9 = objc_claimAutoreleasedReturnValue();
    -[NSObject postNotificationName:object:userInfo:](v9, "postNotificationName:object:userInfo:", CFSTR("AMSBagInvalidatedNotification"), WeakRetained, v8);
  }
  else
  {
    +[AMSLogConfig sharedBagConfig](AMSLogConfig, "sharedBagConfig");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v8, "OSLogObject");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = objc_opt_class();
      AMSLogKey();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v15 = v10;
      v16 = 2114;
      v17 = v11;
      _os_log_impl(&dword_18C849000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] dataSourceDataInvalidatedHandler was called, but the owning bag was deallocated after the handler was called. No AMSBagInvalidatedNotification will be posted.", buf, 0x16u);

    }
  }

}

+ (void)resetBagCache
{
  id v2;

  objc_msgSend(a1, "bagCache");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeAll");

}

- (void)waitUntilPersistenceWorkComplete
{
  void *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint8_t buf[4];
  void *v12;
  uint64_t v13;

  v2 = self;
  v13 = *MEMORY[0x1E0C80C00];
  -[AMSBag persistenceQueue](self, "persistenceQueue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(v2, "persistenceQueue");
    v4 = objc_claimAutoreleasedReturnValue();
    dispatch_sync(v4, &__block_literal_global_120);

    +[AMSLogConfig sharedBagConfig](AMSLogConfig, "sharedBagConfig");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v5, "OSLogObject");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      AMSLogKey();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (void *)MEMORY[0x1E0CB3940];
      if (v7)
      {
        v9 = objc_opt_class();
        AMSLogKey();
        v2 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "stringWithFormat:", CFSTR("%@: [%@] "), v9, v2);
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: "), objc_opt_class());
      }
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v12 = v10;
      _os_log_impl(&dword_18C849000, v6, OS_LOG_TYPE_DEBUG, "%{public}@Finished waiting for any pending persistence work.", buf, 0xCu);
      if (v7)
      {

        v10 = v2;
      }

    }
  }
}

- (id)URLFromURLString:(id)a3
{
  -[AMSBag URLFromURLString:account:](self, "URLFromURLString:account:", a3, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)URLFromURLString:(id)a3 account:(id)a4
{
  id v6;
  id v7;
  AMSBagActiveAccountProvider *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v23;
  uint64_t v24;
  id (*v25)(uint64_t, void *);
  void *v26;
  AMSBag *v27;
  id v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!v7)
  {
    v8 = objc_alloc_init(AMSBagActiveAccountProvider);
    -[AMSBag processInfo](self, "processInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "accountMediaType");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSBagActiveAccountProvider bagAccountForAccountMediaType:](v8, "bagAccountForAccountMediaType:", v10);
    v7 = (id)objc_claimAutoreleasedReturnValue();

  }
  v23 = MEMORY[0x1E0C809B0];
  v24 = 3221225472;
  v25 = __35__AMSBag_URLFromURLString_account___block_invoke;
  v26 = &unk_1E253E790;
  v27 = self;
  v11 = v7;
  v28 = v11;
  +[AMSBagURLParser URLBySubstitutingVariablesInURLString:usingBlock:](AMSBagURLParser, "URLBySubstitutingVariablesInURLString:usingBlock:", v6, &v23);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    +[AMSLogConfig sharedBagConfig](AMSLogConfig, "sharedBagConfig");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v13)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v13, "OSLogObject");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      AMSLogKey();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (void *)MEMORY[0x1E0CB3940];
      if (v15)
      {
        v17 = objc_opt_class();
        AMSLogKey();
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "stringWithFormat:", CFSTR("%@: [%@] "), v17, v18, v23, v24, v25, v26, v27);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: "), objc_opt_class());
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = v19;
      }
      AMSHashIfNeeded(v6);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      AMSHashIfNeeded(v11);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v30 = v19;
      v31 = 2114;
      v32 = v20;
      v33 = 2114;
      v34 = v21;
      _os_log_impl(&dword_18C849000, v14, OS_LOG_TYPE_ERROR, "%{public}@Failed to create template-substituted URL. URL = %{public}@ | account = %{public}@", buf, 0x20u);
      if (v15)

    }
  }

  return v12;
}

id __35__AMSBag_URLFromURLString_account___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "dataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "valueForURLVariable:account:", v3, *(_QWORD *)(a1 + 40));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (os_unfair_lock_s)updateHandlerConsistencyLock
{
  return self->_updateHandlerConsistencyLock;
}

- (void)setUpdateHandlerConsistencyLock:(os_unfair_lock_s)a3
{
  self->_updateHandlerConsistencyLock = a3;
}

- (void)setDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_dataSource, a3);
}

- (void)setProcessInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updateHandlers, 0);
  objc_storeStrong((id *)&self->_processInfo, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_temporaryPreloadedBagData, 0);
  objc_storeStrong((id *)&self->_persistence, 0);
  objc_storeStrong((id *)&self->_persistenceQueue, 0);
  objc_storeStrong((id *)&self->_changeNotificationQueue, 0);
}

@end
