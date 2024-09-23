@implementation HDCloudSyncManager

- (HDCloudSyncManager)initWithProfile:(id)a3
{
  id v4;
  HDCloudSyncManager *v5;
  HDCloudSyncManager *v6;
  uint64_t v7;
  OS_dispatch_queue *queue;
  void *v9;
  void *v10;
  BOOL supportsRebase;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  objc_class *v17;
  void *v18;
  uint64_t v19;
  HKObserverSet *observers;
  HDCloudSyncOwnerIdentifierManager *v21;
  HDCloudSyncOwnerIdentifierManager *ownerIdentifierManager;
  HDCloudSyncSharedSummaryManager *v23;
  HDCloudSyncSharedSummaryManager *sharedSummaryManager;
  HDCloudSyncContextSyncManager *v25;
  HDCloudSyncContextSyncManager *contextSyncManager;
  HDAssertionManager *v27;
  HDAssertionManager *assertionManager;
  void *v29;
  uint64_t v30;
  NSString *inProgressDownloadDirectoryPath;
  objc_super v33;

  v4 = a3;
  v33.receiver = self;
  v33.super_class = (Class)HDCloudSyncManager;
  v5 = -[HDCloudSyncManager init](&v33, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_profile, v4);
    v6->_lock._os_unfair_lock_opaque = 0;
    HKCreateSerialUtilityDispatchQueue();
    v7 = objc_claimAutoreleasedReturnValue();
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v7;

    objc_msgSend(v4, "daemon");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "behavior");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v6->_supportsRebase = objc_msgSend(v10, "isAppleWatch") ^ 1;

    supportsRebase = v6->_supportsRebase;
    if (supportsRebase)
      supportsRebase = objc_msgSend(v4, "profileType") != 3;
    v6->_supportsRebase = supportsRebase;
    objc_msgSend(v4, "daemon");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "behavior");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v13, "isAppleWatch") & 1) != 0)
    {
      objc_msgSend(v4, "daemon");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "behavior");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v6->_isChild = objc_msgSend(v15, "tinkerModeEnabled") ^ 1;

    }
    else
    {
      v6->_isChild = 0;
    }

    v16 = objc_alloc(MEMORY[0x1E0CB6988]);
    v17 = (objc_class *)objc_opt_class();
    NSStringFromClass(v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v16, "initWithName:loggingCategory:", v18, *MEMORY[0x1E0CB5370]);
    observers = v6->_observers;
    v6->_observers = (HKObserverSet *)v19;

    v21 = -[HDCloudSyncOwnerIdentifierManager initWithCloudSyncManager:]([HDCloudSyncOwnerIdentifierManager alloc], "initWithCloudSyncManager:", v6);
    ownerIdentifierManager = v6->_ownerIdentifierManager;
    v6->_ownerIdentifierManager = v21;

    v23 = -[HDCloudSyncSharedSummaryManager initWithProfile:]([HDCloudSyncSharedSummaryManager alloc], "initWithProfile:", v4);
    sharedSummaryManager = v6->_sharedSummaryManager;
    v6->_sharedSummaryManager = v23;

    v25 = -[HDCloudSyncContextSyncManager initWithProfile:]([HDCloudSyncContextSyncManager alloc], "initWithProfile:", v4);
    contextSyncManager = v6->_contextSyncManager;
    v6->_contextSyncManager = v25;

    v27 = (HDAssertionManager *)objc_alloc_init(MEMORY[0x1E0D29808]);
    assertionManager = v6->_assertionManager;
    v6->_assertionManager = v27;

    -[HDAssertionManager addObserver:forAssertionIdentifier:queue:](v6->_assertionManager, "addObserver:forAssertionIdentifier:queue:", v6, CFSTR("HDCloudSyncDownloadDirectoryAssertionIdentifier"), v6->_queue);
    objc_msgSend(v4, "directoryPath");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "stringByAppendingPathComponent:", CFSTR("InProgressCloudDownload"));
    v30 = objc_claimAutoreleasedReturnValue();
    inProgressDownloadDirectoryPath = v6->_inProgressDownloadDirectoryPath;
    v6->_inProgressDownloadDirectoryPath = (NSString *)v30;

    v6->_inProgressDownloadDirectoryLock._os_unfair_lock_opaque = 0;
    objc_msgSend(v4, "registerProfileReadyObserver:queue:", v6, v6->_queue);
  }

  return v6;
}

- (void)dealloc
{
  void *v3;
  HKObserverSet *observers;
  id WeakRetained;
  void *v6;
  void *v7;
  objc_super v8;

  -[HDCloudSyncManager preparedDatabaseAccessibilityAssertion](self, "preparedDatabaseAccessibilityAssertion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  observers = self->_observers;
  self->_observers = 0;

  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "daemon");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "analyticsSubmissionCoordinator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeObserver:", self);

  v8.receiver = self;
  v8.super_class = (Class)HDCloudSyncManager;
  -[HDCloudSyncManager dealloc](&v8, sel_dealloc);
}

- (void)_workoutSamplesAssociated:(id)a3
{
  void *v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB6388]), "initWithPush:pull:lite:", 1, 0, 1);
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __48__HDCloudSyncManager__workoutSamplesAssociated___block_invoke;
  v7[3] = &unk_1E6CE8080;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

void __48__HDCloudSyncManager__workoutSamplesAssociated___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 104));
  objc_msgSend(WeakRetained, "cloudSyncManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB6430]), "initWithChangesSyncRequest:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v2, "syncWithRequest:reason:completion:", v3, CFSTR("Workout samples associated"), &__block_literal_global_116);

}

void __48__HDCloudSyncManager__workoutSamplesAssociated___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((a2 & 1) == 0 && (HKIsUnitTesting() & 1) == 0)
  {
    _HKInitializeLogging();
    v5 = (void *)*MEMORY[0x1E0CB5380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_ERROR))
    {
      v6 = v5;
      objc_msgSend(v4, "localizedDescription");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138543362;
      v9 = v7;
      _os_log_error_impl(&dword_1B7802000, v6, OS_LOG_TYPE_ERROR, "Failed to cloud sync after workout samples associated: %{public}@", (uint8_t *)&v8, 0xCu);

    }
  }

}

- (int64_t)bytesPerChangeRecordAssetThreshold
{
  return +[HDCloudSyncChangeRecord bytesPerChangeRecordAssetThreshold](HDCloudSyncChangeRecord, "bytesPerChangeRecordAssetThreshold");
}

- (int64_t)bytesPerChangeRecordAssetThresholdHardLimit
{
  return +[HDCloudSyncChangeRecord bytesPerChangeRecordAssetThresholdHardLimit](HDCloudSyncChangeRecord, "bytesPerChangeRecordAssetThresholdHardLimit");
}

- (HDCloudSyncStatus)status
{
  HDCloudSyncStatus *v3;

  v3 = objc_alloc_init(HDCloudSyncStatus);
  os_unfair_lock_lock(&self->_lock);
  -[HDCloudSyncStatus setLastSuccessfulPullDate:](v3, "setLastSuccessfulPullDate:", self->_lock_lastSuccessfulPullDate);
  -[HDCloudSyncStatus setLastSuccessfulPushDate:](v3, "setLastSuccessfulPushDate:", self->_lock_lastSuccessfulPushDate);
  -[HDCloudSyncStatus setLastSuccessfulLitePushDate:](v3, "setLastSuccessfulLitePushDate:", self->_lock_lastSuccessfulLitePushDate);
  os_unfair_lock_unlock(&self->_lock);
  return v3;
}

- (id)lastPushForwardProgressDate
{
  id WeakRetained;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  NSObject *v7;
  id v8;
  id v10;
  uint8_t buf[4];
  const __CFString *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  HDCloudSyncKeyValueDomainWithProfile(WeakRetained);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = 0;
  objc_msgSend(v3, "dateForKey:error:", CFSTR("HDCloudSyncPrimaryLastPushForwardProgressDate"), &v10);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v10;
  v6 = v5;
  if (v4 || !v5)
  {
    v8 = v4;
  }
  else
  {
    _HKInitializeLogging();
    v7 = *MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v12 = CFSTR("HDCloudSyncPrimaryLastPushForwardProgressDate");
      v13 = 2114;
      v14 = v6;
      _os_log_error_impl(&dword_1B7802000, v7, OS_LOG_TYPE_ERROR, "Unable to determine value for %{public}@: %{public}@.", buf, 0x16u);
    }
    v8 = 0;
  }

  return v8;
}

- (void)didCompleteSuccessfulPullWithDate:(id)a3
{
  NSDate *v5;
  NSDate *lock_lastSuccessfulPullDate;
  HKObserverSet *observers;
  _QWORD v8[5];
  NSDate *v9;

  v5 = (NSDate *)a3;
  os_unfair_lock_lock(&self->_lock);
  lock_lastSuccessfulPullDate = self->_lock_lastSuccessfulPullDate;
  if (lock_lastSuccessfulPullDate == v5
    || v5 && -[NSDate isEqual:](lock_lastSuccessfulPullDate, "isEqual:", v5))
  {
    os_unfair_lock_unlock(&self->_lock);
  }
  else
  {
    objc_storeStrong((id *)&self->_lock_lastSuccessfulPullDate, a3);
    os_unfair_lock_unlock(&self->_lock);
    observers = self->_observers;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __56__HDCloudSyncManager_didCompleteSuccessfulPullWithDate___block_invoke;
    v8[3] = &unk_1E6CFAA40;
    v8[4] = self;
    v9 = v5;
    -[HKObserverSet notifyObservers:](observers, "notifyObservers:", v8);

  }
}

uint64_t __56__HDCloudSyncManager_didCompleteSuccessfulPullWithDate___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "cloudSyncManager:didUpdateLastPullDate:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (void)didCompleteSuccessfulPullOfUpdateWithDate:(id)a3
{
  id v4;
  HKObserverSet *observers;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  observers = self->_observers;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __64__HDCloudSyncManager_didCompleteSuccessfulPullOfUpdateWithDate___block_invoke;
  v7[3] = &unk_1E6CFAA40;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[HKObserverSet notifyObservers:](observers, "notifyObservers:", v7);

}

uint64_t __64__HDCloudSyncManager_didCompleteSuccessfulPullOfUpdateWithDate___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "cloudSyncManager:didUpdateLastPulledUpdateDate:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (void)didCompleteSuccessfulPushWithDate:(id)a3
{
  NSDate *v5;
  NSDate *lock_lastSuccessfulPushDate;
  HKObserverSet *observers;
  _QWORD v8[5];
  NSDate *v9;

  v5 = (NSDate *)a3;
  os_unfair_lock_lock(&self->_lock);
  lock_lastSuccessfulPushDate = self->_lock_lastSuccessfulPushDate;
  if (lock_lastSuccessfulPushDate == v5
    || v5 && -[NSDate isEqual:](lock_lastSuccessfulPushDate, "isEqual:", v5))
  {
    os_unfair_lock_unlock(&self->_lock);
  }
  else
  {
    objc_storeStrong((id *)&self->_lock_lastSuccessfulPushDate, a3);
    os_unfair_lock_unlock(&self->_lock);
    observers = self->_observers;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __56__HDCloudSyncManager_didCompleteSuccessfulPushWithDate___block_invoke;
    v8[3] = &unk_1E6CFAA40;
    v8[4] = self;
    v9 = v5;
    -[HKObserverSet notifyObservers:](observers, "notifyObservers:", v8);

  }
}

uint64_t __56__HDCloudSyncManager_didCompleteSuccessfulPushWithDate___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "cloudSyncManager:didUpdateLastPushDate:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (void)didCompleteSuccessfulLitePushWithDate:(id)a3
{
  NSDate *v5;
  NSDate *lock_lastSuccessfulLitePushDate;
  HKObserverSet *observers;
  _QWORD v8[5];
  NSDate *v9;

  v5 = (NSDate *)a3;
  os_unfair_lock_lock(&self->_lock);
  lock_lastSuccessfulLitePushDate = self->_lock_lastSuccessfulLitePushDate;
  if (lock_lastSuccessfulLitePushDate == v5
    || v5 && -[NSDate isEqual:](lock_lastSuccessfulLitePushDate, "isEqual:", v5))
  {
    os_unfair_lock_unlock(&self->_lock);
  }
  else
  {
    objc_storeStrong((id *)&self->_lock_lastSuccessfulLitePushDate, a3);
    os_unfair_lock_unlock(&self->_lock);
    observers = self->_observers;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __60__HDCloudSyncManager_didCompleteSuccessfulLitePushWithDate___block_invoke;
    v8[3] = &unk_1E6CFAA40;
    v8[4] = self;
    v9 = v5;
    -[HKObserverSet notifyObservers:](observers, "notifyObservers:", v8);

  }
}

uint64_t __60__HDCloudSyncManager_didCompleteSuccessfulLitePushWithDate___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "cloudSyncManager:didUpdateLastLitePushDate:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (id)assetDownloadStagingManagerWithAssertion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  char v7;
  id v8;
  id v9;
  NSObject *v10;
  HDCloudSyncManager *v11;
  HDCloudSyncManager *v12;
  HDCloudSyncManager *v13;
  void *v14;
  id v15;
  id v17;
  uint8_t buf[4];
  HDCloudSyncManager *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self)
  {
    -[HDAssertionManager takeAssertion:](self->_assertionManager, "takeAssertion:", v4);
    os_unfair_lock_lock(&self->_inProgressDownloadDirectoryLock);
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", self->_inProgressDownloadDirectoryPath, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_alloc_init(MEMORY[0x1E0CB3620]);
    v17 = 0;
    v7 = objc_msgSend(v6, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v5, 1, 0, &v17);
    v8 = v17;
    if ((v7 & 1) != 0)
    {
      os_unfair_lock_unlock(&self->_inProgressDownloadDirectoryLock);
      v9 = v5;
      self = 0;
    }
    else
    {
      _HKInitializeLogging();
      v10 = *MEMORY[0x1E0CB5370];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        v19 = self;
        v20 = 2114;
        v21 = v8;
        _os_log_error_impl(&dword_1B7802000, v10, OS_LOG_TYPE_ERROR, "%{public}@ Unable to create in progress download directory, %{public}@", buf, 0x16u);
      }
      os_unfair_lock_unlock(&self->_inProgressDownloadDirectoryLock);
      v11 = (HDCloudSyncManager *)v8;
      self = v11;
      if (v11)
        v12 = objc_retainAutorelease(v11);

      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }
  v13 = self;
  if (v9)
  {
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C94BD0]), "initWithDirectory:", v9);
    objc_msgSend(v14, "setFileProtectionType:", *MEMORY[0x1E0CB2AB8]);
    objc_msgSend(v14, "setKeepInflightFilesOpen:", 1);
    v15 = v14;

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (void)_scheduleResetReceivedCloudSyncAnchorsAndRebaseForHFDRecovery
{
  OS_dispatch_queue *queue;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[5];

  queue = self->_queue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __83__HDCloudSyncManager__scheduleResetReceivedCloudSyncAnchorsAndRebaseForHFDRecovery__block_invoke;
  v8[3] = &unk_1E6CE80E8;
  v8[4] = self;
  +[HDMaintenanceOperation maintenanceOperationWithName:queue:synchronousBlock:](HDMaintenanceOperation, "maintenanceOperationWithName:queue:synchronousBlock:", CFSTR("Reset Received Cloud Sync Anchors"), queue, v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCloudSyncManager profile](self, "profile");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "daemon");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "maintenanceWorkCoordinator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "enqueueMaintenanceOperation:", v4);

}

void __83__HDCloudSyncManager__scheduleResetReceivedCloudSyncAnchorsAndRebaseForHFDRecovery__block_invoke(uint64_t a1)
{
  NSObject **v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  BOOL v15;
  id v16;
  NSObject *v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  id v23;
  uint8_t buf[4];
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  _HKInitializeLogging();
  v2 = (NSObject **)MEMORY[0x1E0CB52B0];
  v3 = *MEMORY[0x1E0CB52B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    v25 = v4;
    _os_log_impl(&dword_1B7802000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: Attempting reset of cloud sync anchors", buf, 0xCu);
  }
  objc_msgSend(*(id *)(a1 + 32), "profile");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "database");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDDatabaseTransactionContext contextForWriting](HDDatabaseTransactionContext, "contextForWriting");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0;
  v8 = objc_msgSend(v6, "performTransactionWithContext:error:block:inaccessibilityHandler:", v7, &v23, &__block_literal_global_249, 0);
  v9 = v23;

  _HKInitializeLogging();
  v10 = *v2;
  v11 = *v2;
  if ((v8 & 1) != 0)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      v25 = v12;
      _os_log_impl(&dword_1B7802000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@: Reset of cloud sync anchors completed", buf, 0xCu);
    }
  }
  else if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    v20 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    v25 = v20;
    _os_log_error_impl(&dword_1B7802000, v10, OS_LOG_TYPE_ERROR, "%{public}@: Failed to reset sync anchors as requested after HFD rebuild step.", buf, 0xCu);
  }
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "profile");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v9;
  v15 = +[HDCloudSyncStoreEntity rebaseRequiredByDate:intervals:profile:error:](HDCloudSyncStoreEntity, "rebaseRequiredByDate:intervals:profile:error:", v13, 0, v14, &v22);
  v16 = v22;

  _HKInitializeLogging();
  v17 = *v2;
  v18 = *v2;
  if (v15)
  {
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v19 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      v25 = v19;
      _os_log_impl(&dword_1B7802000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@: Marked rebase required after HFD recovery.", buf, 0xCu);
    }
  }
  else if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    v21 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    v25 = v21;
    _os_log_error_impl(&dword_1B7802000, v17, OS_LOG_TYPE_ERROR, "%{public}@: Failed to request rebase after HFD recovery.", buf, 0xCu);
  }

}

BOOL __83__HDCloudSyncManager__scheduleResetReceivedCloudSyncAnchorsAndRebaseForHFDRecovery__block_invoke_247(uint64_t a1, void *a2, uint64_t a3)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _BOOL8 v8;

  v4 = a2;
  +[HDSyncStoreEntity allSyncStoreEntitiesOfType:transaction:error:](HDSyncStoreEntity, "allSyncStoreEntitiesOfType:transaction:error:", 2, v4, a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "hk_map:", &__block_literal_global_252);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = +[HDSyncAnchorEntity resetAllSyncAnchorsOfType:syncProvenances:transaction:error:](HDSyncAnchorEntity, "resetAllSyncAnchorsOfType:syncProvenances:transaction:error:", 3, v7, v4, a3);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

uint64_t __83__HDCloudSyncManager__scheduleResetReceivedCloudSyncAnchorsAndRebaseForHFDRecovery__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(a2, "syncProvenance"));
}

- (void)addObserver:(id)a3 queue:(id)a4
{
  -[HKObserverSet registerObserver:queue:](self->_observers, "registerObserver:queue:", a3, a4);
}

- (void)removeObserver:(id)a3
{
  -[HKObserverSet unregisterObserver:](self->_observers, "unregisterObserver:", a3);
}

- (BOOL)canPerformCloudSyncWithError:(id *)a3
{
  id WeakRetained;
  void *v5;
  void *v6;

  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "daemon");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cloudSyncCoordinator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = objc_msgSend(v6, "canPerformCloudSyncWithError:", a3);

  return (char)a3;
}

- (void)prepareForPeriodicSync
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__HDCloudSyncManager_prepareForPeriodicSync__block_invoke;
  block[3] = &unk_1E6CE80E8;
  block[4] = self;
  dispatch_sync(queue, block);
}

void __44__HDCloudSyncManager_prepareForPeriodicSync__block_invoke(uint64_t a1)
{
  -[HDCloudSyncManager _queue_updateAccessibilityAssertion](*(_QWORD *)(a1 + 32));
}

- (void)_queue_updateAccessibilityAssertion
{
  id WeakRetained;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  const char *v7;
  void *v8;
  NSObject *v9;
  id v10;
  uint8_t buf[4];
  uint64_t v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 120));
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 104));
    objc_msgSend(WeakRetained, "database");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 0;
    objc_msgSend(v3, "takeAccessibilityAssertionWithOwnerIdentifier:timeout:error:", CFSTR("HDCloudSyncManager Sync Preparation"), &v10, 600.0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v10;

    if (v4)
    {
      objc_msgSend((id)a1, "preparedDatabaseAccessibilityAssertion");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v6;
      if (v6)
        objc_msgSend(v6, "invalidate");
      objc_setProperty_atomic((id)a1, v7, v4, 8);

    }
    else
    {
      _HKInitializeLogging();
      v9 = *MEMORY[0x1E0CB5370];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        v12 = a1;
        v13 = 2114;
        v14 = v5;
        _os_log_error_impl(&dword_1B7802000, v9, OS_LOG_TYPE_ERROR, "%{public}@: Failed to take database accessibility assertion during sync preparation: %{public}@", buf, 0x16u);
      }
    }

  }
}

- (id)syncSessionForSyncStore:(id)a3 reason:(id)a4 delegate:(id)a5 accessibilityAssertion:(id)a6 excludedStores:(id)a7 excludedSyncIdentities:(id)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  HDCloudSyncSession *v19;

  v13 = a8;
  v14 = a7;
  v15 = a6;
  v16 = a5;
  v17 = a4;
  v18 = a3;
  v19 = -[HDSyncSession initWithSyncStore:reason:delegate:]([HDCloudSyncSession alloc], "initWithSyncStore:reason:delegate:", v18, v17, v16);

  -[HDSyncSession setDatabaseAccessibilityAssertion:](v19, "setDatabaseAccessibilityAssertion:", v15);
  -[HDCloudSyncSession setExcludedSyncStores:](v19, "setExcludedSyncStores:", v14);

  -[HDCloudSyncSession setExcludedSyncIdentities:](v19, "setExcludedSyncIdentities:", v13);
  return v19;
}

- (void)syncWithRequest:(id)a3 reason:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, uint64_t, id);
  NSObject *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  id v18;
  uint8_t buf[4];
  HDCloudSyncManager *v20;
  __int16 v21;
  id v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, uint64_t, id))a5;
  _HKInitializeLogging();
  v11 = *MEMORY[0x1E0CB5370];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    v20 = self;
    v21 = 2114;
    v22 = v8;
    v23 = 2114;
    v24 = v9;
    _os_log_impl(&dword_1B7802000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: Cloud Sync Requested: %{public}@ Reason: %{public}@", buf, 0x20u);
  }
  v12 = -[HDCloudSyncContext initForPurpose:options:reason:xpcActivity:]([HDCloudSyncContext alloc], "initForPurpose:options:reason:xpcActivity:", 0, HDOptionsForRequest(v8), 1, 0);
  objc_msgSend(v12, "setSyncRequest:", v8);
  -[HDCloudSyncManager profile](self, "profile");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "daemon");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "cloudSyncCoordinator");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0;
  v16 = objc_msgSend(v15, "scheduleSyncForAllProfilesViaGatedXPCActivity:context:reason:error:", 1, v12, v9, &v18);
  v17 = v18;

  v10[2](v10, v16, v17);
}

- (id)syncWithContext:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  char v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  const __CFString *v28;
  id v29;
  id v30;
  char v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  HKObserverSet *observers;
  HDCloudSyncManagerSyncTask *v37;
  void *v38;
  HDCloudSyncManagerSyncTask *v39;
  id WeakRetained;
  void *v41;
  void *v42;
  void *v43;
  NSObject *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t (*v48)(uint64_t);
  void *v49;
  id v50;
  _QWORD v51[5];
  uint8_t buf[4];
  HDCloudSyncManager *v53;
  __int16 v54;
  void *v55;
  __int16 v56;
  id v57;
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v6;
  v9 = v8;
  if (!self)
  {

    v14 = 0;
    goto LABEL_30;
  }
  -[HDCloudSyncManager profile](self, "profile");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "daemon");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "behavior");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "supportsPeriodicFullCloudSync");

  if ((v13 & 1) != 0)
  {
LABEL_3:

    v14 = 0;
LABEL_22:
    if (!-[HDCloudSyncManager supportsRebase](self, "supportsRebase"))
    {
      objc_msgSend(v9, "subContextByAddingOptions:", 320);
      v33 = objc_claimAutoreleasedReturnValue();

      v9 = (void *)v33;
    }
    if (objc_msgSend(v9, "reason") == 1 && (objc_msgSend(v9, "options") & 8) == 0)
    {
      objc_msgSend(v9, "subContextByAddingOptions:", 64);
      v34 = objc_claimAutoreleasedReturnValue();

      v9 = (void *)v34;
    }
    v35 = MEMORY[0x1E0C809B0];
    observers = self->_observers;
    v51[0] = MEMORY[0x1E0C809B0];
    v51[1] = 3221225472;
    v51[2] = __49__HDCloudSyncManager_syncWithContext_completion___block_invoke;
    v51[3] = &unk_1E6CFAAA8;
    v51[4] = self;
    -[HKObserverSet notifyObservers:](observers, "notifyObservers:", v51);
    v37 = [HDCloudSyncManagerSyncTask alloc];
    -[HDCloudSyncManager preparedDatabaseAccessibilityAssertion](self, "preparedDatabaseAccessibilityAssertion");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = v35;
    v47 = 3221225472;
    v48 = __49__HDCloudSyncManager_syncWithContext_completion___block_invoke_2;
    v49 = &unk_1E6CFAAD0;
    v50 = v7;
    v39 = -[HDCloudSyncManagerPipelineTask initWithManager:context:accessibilityAssertion:completion:](v37, "initWithManager:context:accessibilityAssertion:completion:", self, v9, v38, &v46);

    WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
    objc_msgSend(WeakRetained, "daemon", v46, v47, v48, v49);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "cloudSyncCoordinator");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "addManagerTask:", v39);

    -[HDCloudSyncManagerTask progress](v39, "progress");
    v43 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_28;
  }
  objc_msgSend(v9, "syncRequest");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v15)
  {
    v29 = v9;
    if ((objc_msgSend(v29, "options") & 0x80) != 0)
    {
      if ((objc_msgSend(v29, "options") & 0x1000) == 0)
        goto LABEL_14;
      v27 = (void *)MEMORY[0x1E0CB35C8];
      v28 = CFSTR("Sync options incorrectly setup, device cannot perform lite sync pull.");
    }
    else
    {
      v27 = (void *)MEMORY[0x1E0CB35C8];
      v28 = CFSTR("Sync options incorrectly setup, device can only perform lite sync.");
    }
LABEL_17:
    objc_msgSend(v27, "hk_error:format:", 3, v28);
    v32 = (id)objc_claimAutoreleasedReturnValue();
    if (v32)
    {
      v30 = objc_retainAutorelease(v32);
      v31 = 0;
      v23 = v30;
      v22 = v30;
    }
    else
    {
      v30 = 0;
      v23 = 0;
      v22 = 0;
      v31 = 0;
    }
    goto LABEL_20;
  }
  objc_msgSend(v9, "syncRequest");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "changesSyncRequest");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v17)
    goto LABEL_3;
  v18 = v9;
  objc_msgSend(v18, "syncRequest");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "changesSyncRequest");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "lite");

  if ((v21 & 1) == 0)
  {
    v27 = (void *)MEMORY[0x1E0CB35C8];
    v28 = CFSTR("Sync request incorrectly setup, device can only perform lite sync.");
    goto LABEL_17;
  }
  objc_msgSend(v18, "syncRequest");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "changesSyncRequest");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v23, "lite"))
  {
    objc_msgSend(v18, "syncRequest");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "changesSyncRequest");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "pull");

    if (v26)
    {
      v27 = (void *)MEMORY[0x1E0CB35C8];
      v28 = CFSTR("Sync request incorrectly setup, device cannot perform lite sync pull.");
      goto LABEL_17;
    }
LABEL_14:
    v30 = 0;
    v31 = 1;
    goto LABEL_21;
  }
  v30 = 0;
  v31 = 1;
LABEL_20:

LABEL_21:
  v14 = v30;
  if ((v31 & 1) != 0)
    goto LABEL_22;
LABEL_30:
  _HKInitializeLogging();
  v45 = *MEMORY[0x1E0CB5370];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    v53 = self;
    v54 = 2114;
    v55 = v9;
    v56 = 2114;
    v57 = v14;
    _os_log_impl(&dword_1B7802000, v45, OS_LOG_TYPE_DEFAULT, "%{public}@: Failed to validate cloud sync context %{public}@ with error %{public}@", buf, 0x20u);
  }
  (*((void (**)(id, _QWORD, id))v7 + 2))(v7, 0, v14);
  objc_msgSend(MEMORY[0x1E0CB38A8], "hk_finishedDiscreteProgressWithTotalUnitCount:", 1);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_28:

  return v43;
}

void __49__HDCloudSyncManager_syncWithContext_completion___block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;

  v3 = (id *)(*(_QWORD *)(a1 + 32) + 104);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "daemon");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "cloudSyncCoordinator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  v8 = objc_msgSend(v7, "canPerformCloudSyncWithError:", &v10);
  v9 = v10;

  objc_msgSend(v4, "cloudSyncManager:didUpdateSyncEnabled:", *(_QWORD *)(a1 + 32), v8);
}

uint64_t __49__HDCloudSyncManager_syncWithContext_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)resetWithContext:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  HDCloudSyncManagerResetTask *v8;
  void *v9;
  id v10;
  HDCloudSyncManagerResetTask *v11;
  id WeakRetained;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[4];
  id v18;

  v6 = a4;
  v7 = a3;
  v8 = [HDCloudSyncManagerResetTask alloc];
  -[HDCloudSyncManager preparedDatabaseAccessibilityAssertion](self, "preparedDatabaseAccessibilityAssertion");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __50__HDCloudSyncManager_resetWithContext_completion___block_invoke;
  v17[3] = &unk_1E6CFAAD0;
  v18 = v6;
  v10 = v6;
  v11 = -[HDCloudSyncManagerPipelineTask initWithManager:context:accessibilityAssertion:completion:](v8, "initWithManager:context:accessibilityAssertion:completion:", self, v7, v9, v17);

  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "daemon");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "cloudSyncCoordinator");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addManagerTask:", v11);

  -[HDCloudSyncManagerTask progress](v11, "progress");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

uint64_t __50__HDCloudSyncManager_resetWithContext_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)fetchDescriptionWithContext:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  id WeakRetained;
  HDCloudSyncManagerShowTask *v11;
  void *v12;
  id v13;
  HDCloudSyncManagerShowTask *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v20[4];
  id v21;
  uint8_t buf[4];
  HDCloudSyncManager *v23;
  __int16 v24;
  id v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  _HKInitializeLogging();
  v8 = (void *)*MEMORY[0x1E0CB5370];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
  {
    v9 = v8;
    WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
    *(_DWORD *)buf = 138543874;
    v23 = self;
    v24 = 2114;
    v25 = WeakRetained;
    v26 = 2114;
    v27 = v6;
    _os_log_impl(&dword_1B7802000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: Beginning description fetch for profile (%{public}@) %{public}@", buf, 0x20u);

  }
  v11 = [HDCloudSyncManagerShowTask alloc];
  -[HDCloudSyncManager preparedDatabaseAccessibilityAssertion](self, "preparedDatabaseAccessibilityAssertion");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __61__HDCloudSyncManager_fetchDescriptionWithContext_completion___block_invoke;
  v20[3] = &unk_1E6CFAAF8;
  v21 = v7;
  v13 = v7;
  v14 = -[HDCloudSyncManagerShowTask initWithManager:context:accessibilityAssertion:completion:](v11, "initWithManager:context:accessibilityAssertion:completion:", self, v6, v12, v20);

  -[HDCloudSyncManagerRepositoryTask setRunWhenSyncProhibited:](v14, "setRunWhenSyncProhibited:", 1);
  v15 = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(v15, "daemon");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "cloudSyncCoordinator");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addManagerTask:", v14);

  -[HDCloudSyncManagerTask progress](v14, "progress");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

void __61__HDCloudSyncManager_fetchDescriptionWithContext_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v5;
  id v6;
  id v7;

  v5 = *(_QWORD *)(a1 + 32);
  v6 = a4;
  objc_msgSend(a2, "repositoryDescriptions");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, id))(v5 + 16))(v5, v7, v6);

}

- (void)fetchSyncStatusWithCompletion:(id)a3
{
  void (**v4)(id, _QWORD, void *);
  os_log_t *v5;
  NSObject *v6;
  id WeakRetained;
  uint64_t v8;
  void *v9;
  HDCloudSyncManagerStatusTask *v10;
  os_log_t v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  id v17;
  uint8_t buf[4];
  HDCloudSyncManager *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, _QWORD, void *))a3;
  _HKInitializeLogging();
  v5 = (os_log_t *)MEMORY[0x1E0CB5370];
  v6 = *MEMORY[0x1E0CB5370];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v19 = self;
    _os_log_impl(&dword_1B7802000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ Starting fetch cloud sync status task", buf, 0xCu);
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  v8 = objc_msgSend(WeakRetained, "profileType");

  if (v8 != 3)
    goto LABEL_6;
  v17 = 0;
  -[HDCloudSyncManager shareOwnerParticipantWithError:](self, "shareOwnerParticipantWithError:", &v17);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (HDCloudSyncManagerStatusTask *)v17;
  if (v9)
  {

LABEL_6:
    v10 = -[HDCloudSyncManagerStatusTask initWithManager:completion:]([HDCloudSyncManagerStatusTask alloc], "initWithManager:completion:", self, v4);
    -[HDCloudSyncManagerTask startWithCompletion:](v10, "startWithCompletion:", &__block_literal_global_269_0);
    goto LABEL_7;
  }
  _HKInitializeLogging();
  v11 = *v5;
  if (os_log_type_enabled(*v5, OS_LOG_TYPE_ERROR))
  {
    v15 = v11;
    -[HDCloudSyncManager profile](self, "profile");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v19 = self;
    v20 = 2114;
    v21 = v16;
    _os_log_error_impl(&dword_1B7802000, v15, OS_LOG_TYPE_ERROR, "%{public}@: Sync unavailable before setting a source share participant for profile %{public}@", buf, 0x16u);

  }
  v12 = (void *)MEMORY[0x1E0CB35C8];
  -[HDCloudSyncManager profile](self, "profile");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "hk_error:format:", 729, CFSTR("Sync unavailable before setting a source share participant for profile: %@"), v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v4[2](v4, 0, v14);

LABEL_7:
}

- (void)fetchCloudKitAccountInfoWithCompletion:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __61__HDCloudSyncManager_fetchCloudKitAccountInfoWithCompletion___block_invoke;
  v6[3] = &unk_1E6CF3398;
  v7 = v4;
  v5 = v4;
  -[HDCloudSyncManager cloudSyncRepositoriesForClient:completion:](self, "cloudSyncRepositoriesForClient:completion:", 0, v6);

}

void __61__HDCloudSyncManager_fetchCloudKitAccountInfoWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "primaryCKContainer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __61__HDCloudSyncManager_fetchCloudKitAccountInfoWithCompletion___block_invoke_2;
    v7[3] = &unk_1E6CFAB40;
    v9 = *(id *)(a1 + 32);
    v8 = v4;
    objc_msgSend(v6, "fetchFullNameAndPrimaryEmailOnAccountWithCompletionHandler:", v7);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

void __61__HDCloudSyncManager_fetchCloudKitAccountInfoWithCompletion___block_invoke_2(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a2;
  v7 = a3;
  if (a4)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    v8 = objc_alloc(MEMORY[0x1E0CB63E0]);
    objc_msgSend(*(id *)(a1 + 32), "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v8, "initWithFullName:emailAddress:accountSettings:", v11, v7, objc_msgSend(v9, "repositorySettings"));

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

- (id)disableAndDeleteAllSyncDataWithCompletion:(id)a3
{
  id v4;
  id v5;
  HDCloudSyncManagerDisableAndDeleteTask *v6;
  void *v7;
  id v8;
  HDCloudSyncManagerDisableAndDeleteTask *v9;
  id WeakRetained;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[4];
  id v16;

  v4 = a3;
  v5 = -[HDCloudSyncContext initForPurpose:options:reason:xpcActivity:]([HDCloudSyncContext alloc], "initForPurpose:options:reason:xpcActivity:", 5, 64, 6, 0);
  v6 = [HDCloudSyncManagerDisableAndDeleteTask alloc];
  -[HDCloudSyncManager preparedDatabaseAccessibilityAssertion](self, "preparedDatabaseAccessibilityAssertion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __64__HDCloudSyncManager_disableAndDeleteAllSyncDataWithCompletion___block_invoke;
  v15[3] = &unk_1E6CFAAD0;
  v16 = v4;
  v8 = v4;
  v9 = -[HDCloudSyncManagerPipelineTask initWithManager:context:accessibilityAssertion:completion:](v6, "initWithManager:context:accessibilityAssertion:completion:", self, v5, v7, v15);

  -[HDCloudSyncManagerRepositoryTask setRunWhenSyncProhibited:](v9, "setRunWhenSyncProhibited:", 1);
  -[HDCloudSyncManagerTask setPriority:](v9, "setPriority:", 100);
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "daemon");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "cloudSyncCoordinator");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addManagerTask:", v9);

  -[HDCloudSyncManagerTask progress](v9, "progress");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

uint64_t __64__HDCloudSyncManager_disableAndDeleteAllSyncDataWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)accountDeviceToDeviceEncryptionAvailabilityStatusWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;
  id v9;

  v4 = a3;
  v9 = 0;
  -[HDCloudSyncManager _containerWithIdentifier:client:error:](self, "_containerWithIdentifier:client:error:", CFSTR("com.apple.health.sync"), 0, &v9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v9;
  if (v5)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __86__HDCloudSyncManager_accountDeviceToDeviceEncryptionAvailabilityStatusWithCompletion___block_invoke;
    v7[3] = &unk_1E6CFAB68;
    v7[4] = self;
    v8 = v4;
    objc_msgSend(v5, "accountInfoWithCompletionHandler:", v7);

  }
  else
  {
    (*((void (**)(id, _QWORD, id))v4 + 2))(v4, 0, v6);
  }

}

void __86__HDCloudSyncManager_accountDeviceToDeviceEncryptionAvailabilityStatusWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  _HKInitializeLogging();
  v7 = *MEMORY[0x1E0CB5370];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
  {
    v8 = *(_QWORD *)(a1 + 32);
    v11 = 138543618;
    v12 = v8;
    v13 = 2114;
    v14 = v5;
    _os_log_impl(&dword_1B7802000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: accountInfo %{public}@", (uint8_t *)&v11, 0x16u);
  }
  v9 = *(_QWORD *)(a1 + 40);
  if (v5)
  {
    if (objc_msgSend(v5, "deviceToDeviceEncryptionAvailability"))
      v10 = 1;
    else
      v10 = objc_msgSend(v5, "supportsDeviceToDeviceEncryption");
    (*(void (**)(uint64_t, uint64_t, _QWORD))(v9 + 16))(v9, v10, 0);
  }
  else
  {
    (*(void (**)(uint64_t, _QWORD, id))(v9 + 16))(v9, 0, v6);
  }

}

- (id)syncMedicalIDDataWithContext:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  HDCloudSyncManagerMedicalIDSyncTask *v8;
  void *v9;
  id v10;
  HDCloudSyncManagerMedicalIDSyncTask *v11;
  id WeakRetained;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[4];
  id v18;

  v6 = a4;
  v7 = a3;
  v8 = [HDCloudSyncManagerMedicalIDSyncTask alloc];
  -[HDCloudSyncManager preparedDatabaseAccessibilityAssertion](self, "preparedDatabaseAccessibilityAssertion");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __62__HDCloudSyncManager_syncMedicalIDDataWithContext_completion___block_invoke;
  v17[3] = &unk_1E6CFAAD0;
  v18 = v6;
  v10 = v6;
  v11 = -[HDCloudSyncManagerPipelineTask initWithManager:context:accessibilityAssertion:completion:](v8, "initWithManager:context:accessibilityAssertion:completion:", self, v7, v9, v17);

  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "daemon");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "cloudSyncCoordinator");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addManagerTask:", v11);

  -[HDCloudSyncManagerTask progress](v11, "progress");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

uint64_t __62__HDCloudSyncManager_syncMedicalIDDataWithContext_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)cloudSyncRepositoriesForClient:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, void *);
  id WeakRetained;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  __CFString *v16;
  char *v17;
  id v18;
  void *v19;
  id v20;
  uint64_t v21;
  void *v22;
  void *v23;
  _QWORD v24[5];
  id v25;
  id v26;
  char *v27;
  void (**v28)(id, _QWORD, void *);
  id v29;

  v6 = a3;
  v7 = (void (**)(id, _QWORD, void *))a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  v9 = WeakRetained;
  if (!WeakRetained)
  {
    -[HDCloudSyncManager _errorForNilProfile](self);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, 0, v19);

    goto LABEL_15;
  }
  v10 = WeakRetained;
  v11 = v10;
  if (!self)
  {
    v18 = 0;
    v17 = 0;
    goto LABEL_11;
  }
  HDCloudSyncKeyValueDomainWithProfile(v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0;
  objc_msgSend(v12, "stringForKey:error:", CFSTR("HDCloudSyncCircleIdentifier"), &v29);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v29;
  v15 = v14;
  if (v13)
  {
    v16 = v13;
  }
  else
  {
    if (v14)
    {
      v18 = objc_retainAutorelease(v14);
      v17 = 0;
      goto LABEL_10;
    }
    v21 = objc_msgSend(v11, "profileType");
    if ((unint64_t)(v21 - 1) >= 3)
    {
      if (v21 == 4)
      {
        objc_msgSend(v11, "profileIdentifier");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "hd_syncCircleIdentifier");
        v17 = (char *)objc_claimAutoreleasedReturnValue();

        goto LABEL_6;
      }
      if (v21 != 100)
      {
        v17 = sel__syncCircleIdentifierForProfile_error_;
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", sel__syncCircleIdentifierForProfile_error_, self, CFSTR("HDCloudSyncManager.m"), 734, CFSTR("Unhandled profile type %ld"), objc_msgSend(v11, "profileType"));

        v18 = 0;
        goto LABEL_10;
      }
    }
    v16 = CFSTR("PrimarySyncCircle");
  }
  v17 = (char *)v16;
LABEL_6:
  v18 = 0;
LABEL_10:

LABEL_11:
  v20 = v18;
  if (v17)
  {
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __64__HDCloudSyncManager_cloudSyncRepositoriesForClient_completion___block_invoke;
    v24[3] = &unk_1E6CFABB8;
    v28 = v7;
    v24[4] = self;
    v25 = v11;
    v26 = v6;
    v27 = v17;
    -[HDCloudSyncManager containerIdentifiersForCurrentAccountWithCompletion:](self, "containerIdentifiersForCurrentAccountWithCompletion:", v24);

  }
  else
  {
    v7[2](v7, 0, v20);
  }

LABEL_15:
}

- (id)_errorForNilProfile
{
  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:", 100, CFSTR("profile is nil"));
    a1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

void __64__HDCloudSyncManager_cloudSyncRepositoriesForClient_completion___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  uint64_t v27;
  id v28;
  id v29;
  uint8_t buf[4];
  uint64_t v31;
  __int16 v32;
  uint64_t v33;
  __int16 v34;
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  if (v7)
  {
    _HKInitializeLogging();
    v9 = *MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
    {
      v10 = *(_QWORD *)(a1 + 32);
      v11 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138543874;
      v31 = v10;
      v32 = 2114;
      v33 = v11;
      v34 = 2114;
      v35 = v7;
      _os_log_impl(&dword_1B7802000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@ Using primary cloud sync container identifier: %{public}@", buf, 0x20u);
    }
    v12 = *(void **)(a1 + 32);
    v13 = *(_QWORD *)(a1 + 48);
    v29 = 0;
    objc_msgSend(v12, "_containerWithIdentifier:client:error:", v7, v13, &v29);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v29;
    if (v14)
    {
      if (v8)
      {
        v16 = *(void **)(a1 + 32);
        v17 = *(_QWORD *)(a1 + 48);
        v28 = v15;
        objc_msgSend(v16, "_containerWithIdentifier:client:error:", v8, v17, &v28);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = v28;

        if (!v18 && v19)
        {
          (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
          v15 = v19;
LABEL_14:

          goto LABEL_15;
        }
        v15 = v19;
      }
      else
      {
        v18 = 0;
      }
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __64__HDCloudSyncManager_cloudSyncRepositoriesForClient_completion___block_invoke_291;
      v21[3] = &unk_1E6CFAB90;
      v22 = *(id *)(a1 + 40);
      v23 = *(id *)(a1 + 56);
      v24 = v14;
      v25 = v18;
      v26 = *(id *)(a1 + 64);
      v27 = a4;
      v20 = v18;
      objc_msgSend(v24, "fetchUserRecordIDWithCompletionHandler:", v21);

      goto LABEL_14;
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
    goto LABEL_14;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
LABEL_15:

}

void __64__HDCloudSyncManager_cloudSyncRepositoriesForClient_completion___block_invoke_291(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  HDCloudSyncRepository *v7;
  HDCloudSyncRepository *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  HDCloudSyncRepository *v13;
  HDCloudSyncRepository *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  HDCloudSyncRepository *v23;
  uint64_t v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (HDIsUnitTesting())
  {
    v7 = [HDCloudSyncRepository alloc];
    v8 = v7;
    v9 = a1[4];
    v10 = a1[5];
    v11 = a1[6];
    if (a1[7])
    {
      v25[0] = a1[7];
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = -[HDCloudSyncRepository initWithProfile:syncCircleIdentifier:primaryCKContainer:secondaryCKContainers:userRecordName:](v8, "initWithProfile:syncCircleIdentifier:primaryCKContainer:secondaryCKContainers:userRecordName:", v9, v10, v11, v12, CFSTR("TestUserRecordName"));

    }
    else
    {
      v13 = -[HDCloudSyncRepository initWithProfile:syncCircleIdentifier:primaryCKContainer:secondaryCKContainers:userRecordName:](v7, "initWithProfile:syncCircleIdentifier:primaryCKContainer:secondaryCKContainers:userRecordName:", a1[4], a1[5], a1[6], MEMORY[0x1E0C9AA60], CFSTR("TestUserRecordName"));
    }
LABEL_12:
    -[HDCloudSyncRepository setRepositorySettings:](v13, "setRepositorySettings:", a1[9]);
    v21 = a1[8];
    v23 = v13;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v23, 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, _QWORD))(v21 + 16))(v21, v22, 0);

    goto LABEL_13;
  }
  if (v5)
  {
    v14 = [HDCloudSyncRepository alloc];
    v15 = a1[4];
    v16 = a1[5];
    v17 = a1[6];
    v18 = a1[7];
    if (v18)
    {
      v24 = a1[7];
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v24, 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v19 = (void *)MEMORY[0x1E0C9AA60];
    }
    objc_msgSend(v5, "recordName");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[HDCloudSyncRepository initWithProfile:syncCircleIdentifier:primaryCKContainer:secondaryCKContainers:userRecordName:](v14, "initWithProfile:syncCircleIdentifier:primaryCKContainer:secondaryCKContainers:userRecordName:", v15, v16, v17, v19, v20);

    if (v18)
    goto LABEL_12;
  }
  (*(void (**)(void))(a1[8] + 16))();
LABEL_13:

}

+ (void)_containerIdentifiersWithEncryptionSupportEnabled:(BOOL)a3 accountManateeEnabled:(BOOL)a4 resultHandler:(id)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  void (**v7)(id, const __CFString *, const __CFString *);
  NSObject *v8;
  const __CFString *v9;
  const __CFString *v10;
  _DWORD v11[2];
  __int16 v12;
  _BOOL4 v13;
  uint64_t v14;

  v5 = a4;
  v6 = a3;
  v14 = *MEMORY[0x1E0C80C00];
  v7 = (void (**)(id, const __CFString *, const __CFString *))a5;
  _HKInitializeLogging();
  v8 = *MEMORY[0x1E0CB5370];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
  {
    v11[0] = 67109376;
    v11[1] = v6;
    v12 = 1024;
    v13 = v5;
    _os_log_impl(&dword_1B7802000, v8, OS_LOG_TYPE_DEFAULT, "Setting container identifiers. CloudKitSupportsDeviceToDeviceEncryption=%{BOOL}d, CKDeviceToDeviceEncryptionStatusSupportedByAccount=%{BOOL}d", (uint8_t *)v11, 0xEu);
  }
  if (v6 || v5)
    v9 = CFSTR("com.apple.health.sync.secure");
  else
    v9 = CFSTR("com.apple.health.sync");
  if (v6 || v5)
    v10 = CFSTR("com.apple.health.sync");
  else
    v10 = CFSTR("com.apple.health.sync.secure");
  v7[2](v7, v9, v10);

}

- (id)_containerWithIdentifier:(id)a3 client:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v8 = a3;
  v9 = a4;
  if ((objc_msgSend(MEMORY[0x1E0C94C28], "currentProcessCanUseCloudKit") & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0C94C28], "containerWithIdentifier:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "options");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setUseZoneWidePCS:", 1);

    objc_msgSend(v10, "options");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setApplicationBundleIdentifierOverride:", *MEMORY[0x1E0CB7630]);

    if (v9)
    {
      objc_msgSend(v9, "process");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "valueForEntitlement:", *MEMORY[0x1E0CB4A08]);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v10, "options");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setApplicationBundleIdentifierOverrideForNetworkAttribution:", v14);
      }
      else
      {
        objc_msgSend(v9, "process");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "bundleIdentifier");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "options");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setApplicationBundleIdentifierOverrideForNetworkAttribution:", v16);

      }
    }
    else
    {
      objc_msgSend(v10, "options");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setApplicationBundleIdentifierOverrideForNetworkAttribution:", *MEMORY[0x1E0CB76B8]);
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a5, 100, CFSTR("%@: Process cannot use CloudKit"), self);
    v10 = 0;
  }

  return v10;
}

- (void)containerIdentifiersForCurrentAccountWithCompletion:(id)a3
{
  id WeakRetained;
  void *v5;
  uint64_t v6;
  void (**v7)(id, const __CFString *, _QWORD, uint64_t, id);
  void *v8;
  id v9;
  const __CFString *v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  id v17;
  id v18;

  v17 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v6 = objc_msgSend(WeakRetained, "profileType");
    switch(v6)
    {
      case 1:
        goto LABEL_8;
      case 2:
        v7 = (void (**)(id, const __CFString *, _QWORD, uint64_t, id))v17;
        if (self)
        {
          v18 = 0;
          -[HDCloudSyncManager _containerWithIdentifier:client:error:](self, "_containerWithIdentifier:client:error:", CFSTR("com.apple.health.sync.secure"), 0, &v18);
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v9 = v18;
          if (v8)
          {
            v10 = CFSTR("com.apple.health.sync.secure");
            v11 = 1;
            v12 = 0;
          }
          else
          {
            v10 = 0;
            v11 = 0;
            v12 = v9;
          }
          v7[2](v7, v10, 0, v11, v12);

        }
        break;
      case 3:
        goto LABEL_9;
      case 4:
        goto LABEL_10;
      default:
        if (v6 != 100)
          break;
LABEL_8:
        objc_msgSend(v5, "daemon", v17);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "behavior");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "tinkerModeEnabled");

        if (v16)
LABEL_9:
          -[HDCloudSyncManager _tinkerContainerIdentifiersWithCompletion:](self, v17);
        else
LABEL_10:
          -[HDCloudSyncManager _primaryContainerIdentifiersForCurrentAccountWithCompletion:](self, v17);
        break;
    }
  }
  else
  {
    -[HDCloudSyncManager _errorForNilProfile](self);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, _QWORD, _QWORD, void *))v17 + 2))(v17, 0, 0, 0, v13);

  }
}

- (void)_tinkerContainerIdentifiersWithCompletion:(void *)a1
{
  void (**v3)(id, __CFString *, _QWORD, uint64_t, id);
  __CFString *v4;
  void *v5;
  int v6;
  __CFString *v7;
  uint64_t v8;
  void *v9;
  id v10;
  __CFString *v11;
  uint64_t v12;
  id v13;
  id v14;

  v3 = a2;
  if (a1)
  {
    v4 = CFSTR("com.apple.health.sync.secure");
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "BOOLForKey:", *MEMORY[0x1E0CB4BE0]);

    if (v6)
    {
      v7 = CFSTR("com.apple.health.sync");

      v8 = 0;
      v4 = v7;
    }
    else
    {
      v8 = 1;
    }
    v14 = 0;
    objc_msgSend(a1, "_containerWithIdentifier:client:error:", v4, 0, &v14);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v14;
    if (v9)
    {
      v11 = v4;
      v12 = v8;
      v13 = 0;
    }
    else
    {
      v11 = 0;
      v12 = 0;
      v13 = v10;
    }
    v3[2](v3, v11, 0, v12, v13);

  }
}

- (void)_primaryContainerIdentifiersForCurrentAccountWithCompletion:(void *)a1
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[5];
  id v7;
  id v8;

  v3 = a2;
  if (a1)
  {
    v8 = 0;
    objc_msgSend(a1, "_containerWithIdentifier:client:error:", CFSTR("com.apple.health.sync"), 0, &v8);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v8;
    if (v4)
    {
      v6[0] = MEMORY[0x1E0C809B0];
      v6[1] = 3221225472;
      v6[2] = __82__HDCloudSyncManager__primaryContainerIdentifiersForCurrentAccountWithCompletion___block_invoke;
      v6[3] = &unk_1E6CFAB68;
      v6[4] = a1;
      v7 = v3;
      objc_msgSend(v4, "accountInfoWithCompletionHandler:", v6);

    }
    else
    {
      (*((void (**)(id, _QWORD, _QWORD, _QWORD, id))v3 + 2))(v3, 0, 0, 0, v5);
    }

  }
}

void __82__HDCloudSyncManager__primaryContainerIdentifiersForCurrentAccountWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject **v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  _QWORD v16[4];
  id v17;
  char v18;
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  _HKInitializeLogging();
  v7 = (NSObject **)MEMORY[0x1E0CB5370];
  v8 = *MEMORY[0x1E0CB5370];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
  {
    v9 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543618;
    v20 = v9;
    v21 = 2114;
    v22 = v5;
    _os_log_impl(&dword_1B7802000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: accountInfo %{public}@", buf, 0x16u);
  }
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v5, 1, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setObject:forKey:", v10, CFSTR("HDCloudSyncAccountInfo"));

    }
    else
    {
      _HKInitializeLogging();
      v12 = *v7;
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1B7802000, v12, OS_LOG_TYPE_ERROR, "Failed to archive CKAccountInfo", buf, 2u);
      }
    }
    v13 = objc_msgSend(v5, "deviceToDeviceEncryptionAvailability") & 1;
    v14 = (void *)objc_opt_class();
    v15 = objc_msgSend(v5, "supportsDeviceToDeviceEncryption");
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __82__HDCloudSyncManager__primaryContainerIdentifiersForCurrentAccountWithCompletion___block_invoke_306;
    v16[3] = &unk_1E6CFABE0;
    v18 = v13;
    v17 = *(id *)(a1 + 40);
    objc_msgSend(v14, "_containerIdentifiersWithEncryptionSupportEnabled:accountManateeEnabled:resultHandler:", v15, v13, v16);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

uint64_t __82__HDCloudSyncManager__primaryContainerIdentifiersForCurrentAccountWithCompletion___block_invoke_306(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)updateErrorRequiringUserAction:(id)a3
{
  void *v4;
  id WeakRetained;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  id v10;

  if (a3)
  {
    objc_msgSend(a3, "hd_cloudKitErrorRequiringUserAction");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v10 = v4;
      if (!objc_msgSend(v4, "hk_isHealthKitErrorWithCode:", 706))
        goto LABEL_5;
      WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
      objc_msgSend(WeakRetained, "daemon");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "cloudSyncCoordinator");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "accountProvider");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "isAccountInManateeUnavailableCFUState");

      v4 = v10;
      if (v9)
      {
LABEL_5:
        -[HDCloudSyncManager _persistErrorRequiringUserAction:]((uint64_t)self, v10);
        v4 = v10;
      }
    }

  }
  else
  {
    -[HDCloudSyncManager _persistErrorRequiringUserAction:]((uint64_t)self, 0);
  }
}

- (void)_persistErrorRequiringUserAction:(uint64_t)a1
{
  id v3;
  id WeakRetained;
  void *v5;
  uint64_t v6;
  id v7;
  _BOOL4 v8;
  id v9;
  void *v10;
  _QWORD v11[5];
  id v12;
  _QWORD v13[5];
  id v14;
  uint64_t *v15;
  id v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;

  v3 = a2;
  if (a1)
  {
    v17 = 0;
    v18 = &v17;
    v19 = 0x2020000000;
    v20 = 0;
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 104));
    objc_msgSend(WeakRetained, "database");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = MEMORY[0x1E0C809B0];
    v16 = 0;
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __55__HDCloudSyncManager__persistErrorRequiringUserAction___block_invoke;
    v13[3] = &unk_1E6CEB640;
    v13[4] = a1;
    v7 = v3;
    v14 = v7;
    v15 = &v17;
    v8 = +[HDHealthEntity performWriteTransactionWithHealthDatabase:error:block:](HDUnprotectedKeyValueEntity, "performWriteTransactionWithHealthDatabase:error:block:", v5, &v16, v13);
    v9 = v16;

    if (v8 && *((_BYTE *)v18 + 24))
    {
      v10 = *(void **)(a1 + 88);
      v11[0] = v6;
      v11[1] = 3221225472;
      v11[2] = __55__HDCloudSyncManager__persistErrorRequiringUserAction___block_invoke_315;
      v11[3] = &unk_1E6CFAA40;
      v11[4] = a1;
      v12 = v7;
      objc_msgSend(v10, "notifyObservers:", v11);

    }
    _Block_object_dispose(&v17, 8);
  }

}

uint64_t __55__HDCloudSyncManager__persistErrorRequiringUserAction___block_invoke(_QWORD *a1, uint64_t a2, _QWORD *a3)
{
  id WeakRetained;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  NSObject *v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  uint64_t v18;
  uint64_t v19;
  id v20;
  id v21;
  uint8_t buf[4];
  uint64_t v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 104));
  HDCloudSyncKeyValueDomainWithProfile(WeakRetained);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = 0;
  objc_msgSend(v6, "dataForKey:error:", CFSTR("HDCloudSyncKeyErrorRequiringUserAction"), &v21);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v21;
  v9 = v8;
  if (v7)
  {
LABEL_2:
    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 1;
    v10 = a1[5];
    if (v10)
    {
      v20 = 0;
      objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v10, 1, &v20);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v20;
      if (v12)
      {
        _HKInitializeLogging();
        v13 = *MEMORY[0x1E0CB5370];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
        {
          v18 = a1[4];
          *(_DWORD *)buf = 138543618;
          v23 = v18;
          v24 = 2114;
          v25 = v12;
          _os_log_error_impl(&dword_1B7802000, v13, OS_LOG_TYPE_ERROR, "%{public}@: Failed to archive cloud sync error requiring user action: %{public}@", buf, 0x16u);
        }
        if (a3)
        {
          v14 = 0;
          *a3 = objc_retainAutorelease(v12);
        }
        else
        {
          _HKLogDroppedError();
          v14 = 0;
        }
      }
      else
      {
        v14 = objc_msgSend(v6, "setData:forKey:error:", v11, CFSTR("HDCloudSyncKeyErrorRequiringUserAction"), a3);
      }

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("HDCloudSyncKeyErrorRequiringUserAction"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v6, "removeValuesForKeys:error:", v16, a3);

    }
    goto LABEL_19;
  }
  if (!v8)
  {
    if (!a1[5])
    {
      v14 = 1;
      goto LABEL_19;
    }
    goto LABEL_2;
  }
  _HKInitializeLogging();
  v15 = *MEMORY[0x1E0CB5370];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
  {
    v19 = a1[4];
    *(_DWORD *)buf = 138543618;
    v23 = v19;
    v24 = 2114;
    v25 = v9;
    _os_log_error_impl(&dword_1B7802000, v15, OS_LOG_TYPE_ERROR, "%{public}@: Failed to read cloud sync error requiring user action: %{public}@", buf, 0x16u);
  }
  if (a3)
  {
    v14 = 0;
    *a3 = objc_retainAutorelease(v9);
  }
  else
  {
    _HKLogDroppedError();
    v14 = 0;
  }
LABEL_19:

  return v14;
}

uint64_t __55__HDCloudSyncManager__persistErrorRequiringUserAction___block_invoke_315(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "cloudSyncManager:didUpdateErrorRequiringUserAction:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (BOOL)persistRestoreCompletionDate:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  __CFString *v9;
  NSObject **v10;
  void *v11;
  NSObject *v12;
  void *v13;
  char v14;
  id v15;
  HKObserverSet *observers;
  NSObject *v17;
  id v18;
  _QWORD v20[5];
  id v21;
  id v22;
  uint8_t buf[4];
  HDCloudSyncManager *v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[HDCloudSyncManager profile](self, "profile");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  HDCloudSyncKeyValueDomainWithProfile(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = CFSTR("HKCloudSyncObserverRestoreCompletionDate");
  _HKInitializeLogging();
  v10 = (NSObject **)MEMORY[0x1E0CB5370];
  v11 = (void *)*MEMORY[0x1E0CB5370];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_INFO))
  {
    v12 = v11;
    HKDiagnosticStringFromDate();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v24 = self;
    v25 = 2114;
    v26 = v13;
    _os_log_impl(&dword_1B7802000, v12, OS_LOG_TYPE_INFO, "%{public}@: Set cloud sync restore completion date: %{public}@", buf, 0x16u);

  }
  v22 = 0;
  v14 = objc_msgSend(v8, "setDate:forKey:error:", v6, v9, &v22);
  v15 = v22;
  if ((v14 & 1) != 0)
  {
    observers = self->_observers;
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __57__HDCloudSyncManager_persistRestoreCompletionDate_error___block_invoke;
    v20[3] = &unk_1E6CFAA40;
    v20[4] = self;
    v21 = v6;
    -[HKObserverSet notifyObservers:](observers, "notifyObservers:", v20);

  }
  else
  {
    _HKInitializeLogging();
    v17 = *v10;
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v24 = self;
      v25 = 2114;
      v26 = v15;
      _os_log_error_impl(&dword_1B7802000, v17, OS_LOG_TYPE_ERROR, "%{public}@: Failed to record cloud sync restore completion date: %{public}@.", buf, 0x16u);
    }
    v18 = v15;
    if (v18)
    {
      if (a4)
        *a4 = objc_retainAutorelease(v18);
      else
        _HKLogDroppedError();
    }

  }
  return v14;
}

uint64_t __57__HDCloudSyncManager_persistRestoreCompletionDate_error___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "cloudSyncManager:didUpdateRestoreCompletionDate:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (id)restoreCompletionDateWithError:(id *)a3
{
  void *v4;
  void *v5;
  void *v6;

  -[HDCloudSyncManager profile](self, "profile");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  HDCloudSyncKeyValueDomainWithProfile(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "dateForKey:error:", CFSTR("HKCloudSyncObserverRestoreCompletionDate"), a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)updateDataUploadRequestStatus:(int64_t)a3
{
  os_unfair_lock_s *p_lock;
  NSDate *v6;
  NSDate *lock_lastDataUploadRequestCompletionDate;
  NSDate *v8;
  NSDate *v9;
  NSDate *v10;
  HKObserverSet *observers;
  NSDate *v12;
  NSDate *v13;
  _QWORD v14[5];
  NSDate *v15;
  NSDate *v16;
  int64_t v17;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_lock_uploadRequestStatus = a3;
  if (a3 == 4)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v8 = (NSDate *)objc_claimAutoreleasedReturnValue();
    lock_lastDataUploadRequestCompletionDate = self->_lock_lastDataUploadRequestCompletionDate;
    self->_lock_lastDataUploadRequestCompletionDate = v8;
    goto LABEL_5;
  }
  if (a3 == 1)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v6 = (NSDate *)objc_claimAutoreleasedReturnValue();
    lock_lastDataUploadRequestCompletionDate = self->_lock_lastDataUploadRequestStartDate;
    self->_lock_lastDataUploadRequestStartDate = v6;
LABEL_5:

  }
  v9 = self->_lock_lastDataUploadRequestStartDate;
  v10 = self->_lock_lastDataUploadRequestCompletionDate;
  observers = self->_observers;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __52__HDCloudSyncManager_updateDataUploadRequestStatus___block_invoke;
  v14[3] = &unk_1E6CFAC08;
  v14[4] = self;
  v15 = v9;
  v16 = v10;
  v17 = a3;
  v12 = v10;
  v13 = v9;
  -[HKObserverSet notifyObservers:](observers, "notifyObservers:", v14);
  os_unfair_lock_unlock(p_lock);

}

uint64_t __52__HDCloudSyncManager_updateDataUploadRequestStatus___block_invoke(_QWORD *a1, void *a2)
{
  return objc_msgSend(a2, "cloudSyncManager:didUpdateDataUploadRequestStatus:startDate:endDate:", a1[4], a1[7], a1[5], a1[6]);
}

- (void)profileDidBecomeReady:(id)a3
{
  HDProfile **p_profile;
  id WeakRetained;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  p_profile = &self->_profile;
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "database");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addProtectedDataObserver:queue:", self, self->_queue);

  v7 = objc_loadWeakRetained((id *)p_profile);
  objc_msgSend(v7, "daemon");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "analyticsSubmissionCoordinator");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObserver:queue:", self, self->_queue);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObserver:selector:name:object:", self, sel__workoutSamplesAssociated_, CFSTR("HDHealthStoreServerDidAssociateWorkoutSamples"), 0);

}

- (void)database:(id)a3 protectedDataDidBecomeAvailable:(BOOL)a4
{
  _BOOL4 v4;

  v4 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (v4)
    -[HDCloudSyncManager _queue_considerStartingBackstopSyncForThreshold:]((uint64_t)self, 345600.0);
}

- (void)_queue_considerStartingBackstopSyncForThreshold:(uint64_t)a1
{
  void *v4;
  void *v5;
  void *v6;
  int v7;
  id WeakRetained;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  id v13;
  void *v14;
  void *v15;
  double v16;
  id v17;
  NSObject *v18;
  NSObject *v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  NSObject *v24;
  double v25;
  char v26;
  NSObject *v27;
  NSObject *v28;
  void *v29;
  double v30;
  double v31;
  void *v32;
  double v33;
  os_log_t *v34;
  NSObject *v35;
  NSObject *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  CFAbsoluteTime Current;
  void *v42;
  void *v43;
  void *v44;
  NSObject *v45;
  NSObject *v46;
  _QWORD v47[6];
  id v48;
  id v49;
  id v50;
  id v51;
  uint8_t buf[4];
  uint64_t v53;
  __int16 v54;
  double v55;
  __int16 v56;
  double v57;
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 120));
    objc_msgSend((id)a1, "profile");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "daemon");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "behavior");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "supportsPeriodicFullCloudSync");

    if (v7)
    {
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 104));
      v9 = WeakRetained;
      if (!WeakRetained)
      {
LABEL_28:

        return;
      }
      objc_msgSend(WeakRetained, "daemon");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "cloudSyncCoordinator");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = 0;
      v12 = objc_msgSend(v11, "canPerformCloudSyncWithError:", &v51);
      v13 = v51;

      if ((v12 & 1) == 0)
      {
        if (v13)
        {
          if ((objc_msgSend(v13, "hk_isHealthKitErrorWithCode:", 111) & 1) == 0)
          {
            _HKInitializeLogging();
            v19 = *MEMORY[0x1E0CB5370];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543618;
              v53 = a1;
              v54 = 2114;
              v55 = *(double *)&v13;
              _os_log_error_impl(&dword_1B7802000, v19, OS_LOG_TYPE_ERROR, "%{public}@: Failed to check sync enablement status during backstop consideration: %{public}@", buf, 0x16u);
            }
          }
        }
        if (!_HDIsUnitTesting)
          goto LABEL_27;
        objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "postNotificationName:object:", CFSTR("HDBackstopSyncRefusedNotification"), a1);
LABEL_26:

LABEL_27:
        goto LABEL_28;
      }
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      HDCloudSyncKeyValueDomainWithProfile(v9);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = v13;
      objc_msgSend(v15, "dateForKey:error:", CFSTR("HDBackstopSyncLastConsiderationDateKey"), &v50);
      v16 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
      v17 = v50;

      if (v16 == 0.0 && v17)
      {
        _HKInitializeLogging();
        v18 = *MEMORY[0x1E0CB5370];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          v53 = a1;
          v54 = 2114;
          v55 = *(double *)&v17;
          _os_log_error_impl(&dword_1B7802000, v18, OS_LOG_TYPE_ERROR, "%{public}@: Failed to get last backstop reconsideration date: %{public}@", buf, 0x16u);
        }
LABEL_21:
        if (!_HDIsUnitTesting)
        {
LABEL_24:
          v13 = v17;
LABEL_25:

          goto LABEL_26;
        }
        objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
        v25 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
        objc_msgSend(*(id *)&v25, "postNotificationName:object:", CFSTR("HDBackstopSyncRefusedNotification"), a1);
LABEL_23:

        goto LABEL_24;
      }
      if (v16 == 0.0)
      {
        objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "timeIntervalSinceDate:", v22);
        v21 = v23;

      }
      else
      {
        objc_msgSend(v14, "timeIntervalSinceDate:", *(_QWORD *)&v16);
        v21 = v20;
      }
      if (v21 < 14400.0)
      {
        _HKInitializeLogging();
        v24 = *MEMORY[0x1E0CB5370];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138543874;
          v53 = a1;
          v54 = 2048;
          v55 = v21;
          v56 = 2114;
          v57 = v16;
          _os_log_impl(&dword_1B7802000, v24, OS_LOG_TYPE_INFO, "%{public}@: Last backstop sync reconsideration was too recent, not syncing (%0.2lfs, %{public}@)", buf, 0x20u);
        }
        goto LABEL_21;
      }
      v49 = v17;
      v26 = objc_msgSend(v15, "setDate:forKey:error:", v14, CFSTR("HDBackstopSyncLastConsiderationDateKey"), &v49);
      v13 = v49;

      if ((v26 & 1) == 0
        && (_HKInitializeLogging(),
            v27 = *MEMORY[0x1E0CB5370],
            os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR)))
      {
        *(_DWORD *)buf = 138543618;
        v53 = a1;
        v54 = 2114;
        v55 = *(double *)&v13;
        _os_log_error_impl(&dword_1B7802000, v27, OS_LOG_TYPE_ERROR, "%{public}@: Failed to update last backstop reconsideration date: %{public}@", buf, 0x16u);
        if (v16 == 0.0)
          goto LABEL_54;
      }
      else if (v16 == 0.0)
      {
        goto LABEL_54;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v48 = v13;
        +[HDCloudSyncStoreEntity persistedMostRecentLastSyncDateForProfile:error:](HDCloudSyncStoreEntity, "persistedMostRecentLastSyncDateForProfile:error:", v9, &v48);
        v25 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
        v17 = v48;

        if (v25 == 0.0 && v17)
        {
          _HKInitializeLogging();
          v28 = *MEMORY[0x1E0CB5370];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543618;
            v53 = a1;
            v54 = 2114;
            v55 = *(double *)&v17;
            _os_log_error_impl(&dword_1B7802000, v28, OS_LOG_TYPE_ERROR, "%{public}@: Failed to check last successful push date: %{public}@", buf, 0x16u);
          }
          if (_HDIsUnitTesting)
          {
            objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "postNotificationName:object:", CFSTR("HDBackstopSyncRefusedNotification"), a1);

          }
          v25 = 0.0;
        }
        else
        {
          if (v25 == 0.0)
          {
            objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "timeIntervalSinceDate:", v32);
            v31 = v33;

          }
          else
          {
            objc_msgSend(v14, "timeIntervalSinceDate:", *(_QWORD *)&v25);
            v31 = v30;
          }
          _HKInitializeLogging();
          v34 = (os_log_t *)MEMORY[0x1E0CB5370];
          v35 = *MEMORY[0x1E0CB5370];
          v36 = *MEMORY[0x1E0CB5370];
          if (v31 >= a2)
          {
            if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543874;
              v53 = a1;
              v54 = 2048;
              v55 = v31;
              v56 = 2048;
              v57 = a2;
              _os_log_impl(&dword_1B7802000, v35, OS_LOG_TYPE_DEFAULT, "%{public}@: Scheduling backstop sync; time since last successful push (%0.2lfs) is greater than threshold %0.2lfs",
                buf,
                0x20u);
            }
            -[HDCloudSyncManager _queue_updateAccessibilityAssertion](a1);
            objc_msgSend((id)a1, "preparedDatabaseAccessibilityAssertion");
            v38 = (void *)objc_claimAutoreleasedReturnValue();

            if (v38)
            {
              objc_msgSend(v9, "daemon");
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v39, "analyticsSubmissionCoordinator");
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v40, "cloudSync_reportPeriodicSyncStartForType:", 1);

              Current = CFAbsoluteTimeGetCurrent();
              v47[0] = MEMORY[0x1E0C809B0];
              v47[1] = 3221225472;
              v47[2] = __70__HDCloudSyncManager__queue_considerStartingBackstopSyncForThreshold___block_invoke;
              v47[3] = &unk_1E6CFAC58;
              v47[4] = a1;
              *(CFAbsoluteTime *)&v47[5] = Current;
              +[HDMaintenanceOperation maintenanceOperationWithName:asynchronousBlock:](HDMaintenanceOperation, "maintenanceOperationWithName:asynchronousBlock:", CFSTR("Backstop Cloud Sync"), v47);
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v9, "daemon");
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v43, "maintenanceWorkCoordinator");
              v44 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v44, "enqueueMaintenanceOperation:", v42);

            }
            else
            {
              _HKInitializeLogging();
              v46 = *v34;
              if (os_log_type_enabled(*v34, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138543362;
                v53 = a1;
                _os_log_impl(&dword_1B7802000, v46, OS_LOG_TYPE_DEFAULT, "%{public}@: Unable to take database accessibility assertion.", buf, 0xCu);
              }
            }
          }
          else
          {
            if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138543874;
              v53 = a1;
              v54 = 2048;
              v55 = v31;
              v56 = 2114;
              v57 = v25;
              _os_log_impl(&dword_1B7802000, v35, OS_LOG_TYPE_INFO, "%{public}@: Last successful push was too recent, not syncing (%0.2lfs, %{public}@)", buf, 0x20u);
            }
            if (_HDIsUnitTesting)
            {
              objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v37, "postNotificationName:object:", CFSTR("HDBackstopSyncRefusedNotification"), a1);

            }
          }
        }
        goto LABEL_23;
      }
LABEL_54:
      _HKInitializeLogging();
      v45 = *MEMORY[0x1E0CB5370];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v53 = a1;
        _os_log_impl(&dword_1B7802000, v45, OS_LOG_TYPE_DEFAULT, "%{public}@: First backstop reconsideration; setting date and not syncing.",
          buf,
          0xCu);
      }
      if (!_HDIsUnitTesting)
        goto LABEL_25;
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v25 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
      objc_msgSend(*(id *)&v25, "postNotificationName:object:", CFSTR("HDBackstopSyncRefusedNotification"), a1);
      v17 = v13;
      goto LABEL_23;
    }
  }
}

- (void)contentProtectionStateChanged:(int64_t)a3 previousState:(int64_t)a4
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (a3 == 3)
    -[HDCloudSyncManager _queue_considerStartingBackstopSyncForThreshold:]((uint64_t)self, 259200.0);
}

void __70__HDCloudSyncManager__queue_considerStartingBackstopSyncForThreshold___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;
  uint64_t v9;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(NSObject **)(v4 + 120);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __70__HDCloudSyncManager__queue_considerStartingBackstopSyncForThreshold___block_invoke_2;
  block[3] = &unk_1E6CF7C30;
  v9 = *(_QWORD *)(a1 + 40);
  block[4] = v4;
  v8 = v3;
  v6 = v3;
  dispatch_sync(v5, block);

}

void __70__HDCloudSyncManager__queue_considerStartingBackstopSyncForThreshold___block_invoke_2(_QWORD *a1)
{
  NSObject *v2;
  uint64_t v3;
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  uint64_t v10;
  uint8_t buf[4];
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  _HKInitializeLogging();
  v2 = *MEMORY[0x1E0CB5370];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
  {
    v3 = a1[4];
    *(_DWORD *)buf = 138543362;
    v12 = v3;
    _os_log_impl(&dword_1B7802000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@: Performing backstop sync.", buf, 0xCu);
  }
  v4 = -[HDCloudSyncContext initForPurpose:options:reason:xpcActivity:]([HDCloudSyncContext alloc], "initForPurpose:options:reason:xpcActivity:", 0, 0, 8, 0);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __70__HDCloudSyncManager__queue_considerStartingBackstopSyncForThreshold___block_invoke_318;
  v7[3] = &unk_1E6CFAC30;
  v5 = (void *)a1[5];
  v8 = (id)a1[4];
  v10 = a1[6];
  v9 = v5;
  v6 = (id)objc_msgSend(v8, "syncWithContext:completion:", v4, v7);

}

void __70__HDCloudSyncManager__queue_considerStartingBackstopSyncForThreshold___block_invoke_318(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  id WeakRetained;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  _HKInitializeLogging();
  v6 = *MEMORY[0x1E0CB5370];
  v7 = *MEMORY[0x1E0CB5370];
  if (a2)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(_QWORD *)(a1 + 32);
      v14 = 138543362;
      v15 = v8;
      _os_log_impl(&dword_1B7802000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: Finished backstop sync successfully.", (uint8_t *)&v14, 0xCu);
    }
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 104));
    objc_msgSend(WeakRetained, "daemon");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "analyticsSubmissionCoordinator");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "cloudSync_reportPeriodicSyncSuccessAfterDuration:type:", 1, CFAbsoluteTimeGetCurrent() - *(double *)(a1 + 48));
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v13 = *(_QWORD *)(a1 + 32);
      v14 = 138543618;
      v15 = v13;
      v16 = 2114;
      v17 = v5;
      _os_log_error_impl(&dword_1B7802000, v6, OS_LOG_TYPE_ERROR, "%{public}@: Backstop sync failed with error: %{public}@", (uint8_t *)&v14, 0x16u);
    }
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 104));
    objc_msgSend(WeakRetained, "daemon");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "analyticsSubmissionCoordinator");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "cloudSync_reportPeriodicSyncFailureWithError:duration:type:", v5, 1, CFAbsoluteTimeGetCurrent() - *(double *)(a1 + 48));
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  if (_HDIsUnitTesting)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "postNotificationName:object:", CFSTR("HDBackstopSyncCompletionNotification"), *(_QWORD *)(a1 + 32));

  }
}

- (id)shareOwnerParticipantWithError:(id *)a3
{
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;

  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  HDCloudSyncKeyValueDomainWithProfile(WeakRetained);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "dataForKey:error:", CFSTR("HDCloudSyncShareOwnerParticipantKey"), a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v6, a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)setShareOwnerParticipant:(id)a3 error:(id *)a4
{
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  char v10;

  v6 = a3;
  if ((-[HDCloudSyncManager _isValidOwnerParticipant:]((uint64_t)self, v6) & 1) != 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
    HDCloudSyncKeyValueDomainWithProfile(WeakRetained);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v6, 1, a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
      v10 = objc_msgSend(v8, "setData:forKey:error:", v9, CFSTR("HDCloudSyncShareOwnerParticipantKey"), a4);
    else
      v10 = 0;

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a4, 3, CFSTR("Owner participant is not valid; will not save."));
    v10 = 0;
  }

  return v10;
}

- (uint64_t)_isValidOwnerParticipant:(uint64_t)a1
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  int v11;
  uint64_t v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  v5 = 0;
  if (a1 && v3)
  {
    objc_msgSend(v3, "userIdentity");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "userRecordID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "recordName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      v5 = 1;
    }
    else
    {
      _HKInitializeLogging();
      v9 = *MEMORY[0x1E0CB5370];
      v5 = 0;
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
      {
        v11 = 138543618;
        v12 = a1;
        v13 = 2114;
        v14 = v4;
        _os_log_impl(&dword_1B7802000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: Participant record has nil record name; ignoring invalid participant: %{public}@",
          (uint8_t *)&v11,
          0x16u);
        v5 = 0;
      }
    }
  }

  return v5;
}

- (void)configureForShareSetupMetadata:(id)a3 acceptedShares:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id WeakRetained;
  void *v12;
  void *v13;
  char v14;
  id v15;
  void *v16;
  id v17;
  NSObject *v18;
  id v19;
  void *v20;
  void (**v21)(void *, _QWORD);
  void *v22;
  _QWORD v24[4];
  id v25;
  HDCloudSyncManager *v26;
  id v27;
  void (**v28)(void *, _QWORD);
  _BYTE *v29;
  SEL v30;
  _QWORD aBlock[5];
  id v32;
  id v33;
  id v34;
  _BYTE buf[24];
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  HDCloudSyncKeyValueDomainWithProfile(WeakRetained);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "syncCircleIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = 0;
  v14 = objc_msgSend(v12, "setString:forKey:error:", v13, CFSTR("HDCloudSyncCircleIdentifier"), &v34);
  v15 = v34;

  if ((v14 & 1) != 0)
  {
    v33 = 0;
    -[HDCloudSyncManager shareOwnerParticipantWithError:](self, "shareOwnerParticipantWithError:", &v33);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v33;
    v22 = v17;
    if (!v16 || v17)
    {
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __79__HDCloudSyncManager_configureForShareSetupMetadata_acceptedShares_completion___block_invoke;
      aBlock[3] = &unk_1E6CFAC80;
      aBlock[4] = self;
      v19 = v10;
      v32 = v19;
      v21 = (void (**)(void *, _QWORD))_Block_copy(aBlock);
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x3032000000;
      v36 = __Block_byref_object_copy__108;
      v37 = __Block_byref_object_dispose__108;
      objc_msgSend(v9, "firstObject");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "owner");
      v38 = (id)objc_claimAutoreleasedReturnValue();

      if (-[HDCloudSyncManager _isValidOwnerParticipant:]((uint64_t)self, *(void **)(*(_QWORD *)&buf[8] + 40)))
      {
        v21[2](v21, *(_QWORD *)(*(_QWORD *)&buf[8] + 40));
      }
      else
      {
        v24[0] = MEMORY[0x1E0C809B0];
        v24[1] = 3221225472;
        v24[2] = __79__HDCloudSyncManager_configureForShareSetupMetadata_acceptedShares_completion___block_invoke_325;
        v24[3] = &unk_1E6CFACF8;
        v27 = v19;
        v25 = v8;
        v26 = self;
        v29 = buf;
        v28 = v21;
        v30 = a2;
        -[HDCloudSyncManager cloudSyncRepositoriesForClient:completion:](self, "cloudSyncRepositoriesForClient:completion:", 0, v24);

      }
      _Block_object_dispose(buf, 8);

    }
    else
    {
      _HKInitializeLogging();
      v18 = *MEMORY[0x1E0CB5370];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = self;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v16;
        _os_log_impl(&dword_1B7802000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@ Participant already set up for profile, skipping configuring share setup metadata. %{public}@", buf, 0x16u);
      }
      (*((void (**)(id, uint64_t, _QWORD))v10 + 2))(v10, 1, 0);
    }

  }
  else
  {
    (*((void (**)(id, _QWORD, id))v10 + 2))(v10, 0, v15);
  }

}

void __79__HDCloudSyncManager_configureForShareSetupMetadata_acceptedShares_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  id v4;
  id v5;

  v3 = *(void **)(a1 + 32);
  v5 = 0;
  objc_msgSend(v3, "setShareOwnerParticipant:error:", a2, &v5);
  v4 = v5;
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __79__HDCloudSyncManager_configureForShareSetupMetadata_acceptedShares_completion___block_invoke_325(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  uint64_t v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  _QWORD v25[5];
  id v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD v30[6];
  _QWORD v31[2];

  v31[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    if (objc_msgSend(v5, "count") == 1)
    {
      objc_msgSend(v5, "firstObject");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "ownerCloudKitEmailAddress");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C95218]), "initWithEmailAddress:", v8);
      v10 = objc_alloc(MEMORY[0x1E0C94E50]);
      v31[0] = v9;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)objc_msgSend(v10, "initWithUserIdentityLookupInfos:", v11);

      v13 = MEMORY[0x1E0C809B0];
      v30[0] = MEMORY[0x1E0C809B0];
      v30[1] = 3221225472;
      v30[2] = __79__HDCloudSyncManager_configureForShareSetupMetadata_acceptedShares_completion___block_invoke_2;
      v30[3] = &unk_1E6CFACA8;
      v14 = *(_QWORD *)(a1 + 64);
      v30[4] = *(_QWORD *)(a1 + 40);
      v30[5] = v14;
      objc_msgSend(v12, "setPerShareParticipantCompletionBlock:", v30);
      v25[0] = v13;
      v25[1] = 3221225472;
      v25[2] = __79__HDCloudSyncManager_configureForShareSetupMetadata_acceptedShares_completion___block_invoke_331;
      v25[3] = &unk_1E6CFACD0;
      v16 = *(void **)(a1 + 56);
      v15 = *(_QWORD *)(a1 + 64);
      v25[4] = *(_QWORD *)(a1 + 40);
      v28 = v15;
      v17 = v16;
      v18 = *(_QWORD *)(a1 + 72);
      v26 = v17;
      v29 = v18;
      v27 = *(id *)(a1 + 48);
      objc_msgSend(v12, "setFetchShareParticipantsCompletionBlock:", v25);
      v19 = -[HDCloudSyncContext initForPurpose:options:reason:xpcActivity:]([HDCloudSyncContext alloc], "initForPurpose:options:reason:xpcActivity:", 13, 0, 10, 0);
      objc_msgSend(v7, "syncCircleIdentifier");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      +[HDCloudSyncPipeline operationGroupForContext:syncCircleIdentifier:assetDownloadStagingManager:](HDCloudSyncPipeline, "operationGroupForContext:syncCircleIdentifier:assetDownloadStagingManager:", v19, v20, 0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setGroup:", v21);

      objc_msgSend(v7, "primaryCKContainer");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "addOperation:", v12);

    }
    else
    {
      v23 = *(_QWORD *)(a1 + 48);
      objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:format:", 100, CFSTR("Expected a single repository during share configuration."));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v23 + 16))(v23, 0, v24);

    }
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

void __79__HDCloudSyncManager_configureForShareSetupMetadata_acceptedShares_completion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (v7)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
  }
  else
  {
    _HKInitializeLogging();
    v9 = *MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
    {
      v10 = *(_QWORD *)(a1 + 32);
      v11 = 138543618;
      v12 = v10;
      v13 = 2114;
      v14 = v8;
      _os_log_error_impl(&dword_1B7802000, v9, OS_LOG_TYPE_ERROR, "%{public}@: Error fetching participant %{public}@.", (uint8_t *)&v11, 0x16u);
    }
  }

}

void __79__HDCloudSyncManager_configureForShareSetupMetadata_acceptedShares_completion___block_invoke_331(uint64_t *a1, void *a2)
{
  uint64_t v3;
  id v4;

  v4 = a2;
  if (-[HDCloudSyncManager _isValidOwnerParticipant:](a1[4], *(void **)(*(_QWORD *)(a1[7] + 8) + 40)))
  {
    (*(void (**)(void))(a1[5] + 16))();
  }
  else
  {
    v3 = (uint64_t)v4;
    if (!v4)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hk_errorForInvalidArgument:class:selector:format:", CFSTR("@\"\"), objc_opt_class(), a1[8], CFSTR("Cannot fetch valid owner participant"));
      v3 = objc_claimAutoreleasedReturnValue();
    }
    v4 = (id)v3;
    (*(void (**)(void))(a1[6] + 16))();
  }

}

- (id)prepareForSharingWithCompletion:(id)a3
{
  id v4;
  id v5;
  HDCloudSyncManagerPrepareForSharingTask *v6;
  void *v7;
  id v8;
  HDCloudSyncManagerPrepareForSharingTask *v9;
  id WeakRetained;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[4];
  id v16;

  v4 = a3;
  v5 = -[HDCloudSyncContext initForPurpose:options:reason:xpcActivity:]([HDCloudSyncContext alloc], "initForPurpose:options:reason:xpcActivity:", 17, 64, 19, 0);
  v6 = [HDCloudSyncManagerPrepareForSharingTask alloc];
  -[HDCloudSyncManager preparedDatabaseAccessibilityAssertion](self, "preparedDatabaseAccessibilityAssertion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __54__HDCloudSyncManager_prepareForSharingWithCompletion___block_invoke;
  v15[3] = &unk_1E6CFAD20;
  v16 = v4;
  v8 = v4;
  v9 = -[HDCloudSyncManagerPipelineTask initWithManager:context:accessibilityAssertion:completion:](v6, "initWithManager:context:accessibilityAssertion:completion:", self, v5, v7, v15);

  -[HDCloudSyncManagerTask setPriority:](v9, "setPriority:", 100);
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "daemon");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "cloudSyncCoordinator");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addManagerTask:", v9);

  -[HDCloudSyncManagerTask progress](v9, "progress");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

uint64_t __54__HDCloudSyncManager_prepareForSharingWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)setupSharingToAccountWithIdentityLookupInfo:(id)a3 requireExistingRelationship:(BOOL)a4 requireZoneDeviceMode:(id)a5 completion:(id)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  id v12;
  id v13;
  HDCloudSyncSetupSharingForUnifiedZoneTask *v14;
  void *v15;
  id v16;
  HDCloudSyncSetupSharingForUnifiedZoneTask *v17;
  id WeakRetained;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v23[4];
  id v24;

  v7 = a4;
  v10 = a6;
  v11 = a5;
  v12 = a3;
  v13 = -[HDCloudSyncContext initForPurpose:options:reason:xpcActivity:]([HDCloudSyncContext alloc], "initForPurpose:options:reason:xpcActivity:", 10, 64, 9, 0);
  v14 = [HDCloudSyncSetupSharingForUnifiedZoneTask alloc];
  -[HDCloudSyncManager preparedDatabaseAccessibilityAssertion](self, "preparedDatabaseAccessibilityAssertion");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __127__HDCloudSyncManager_setupSharingToAccountWithIdentityLookupInfo_requireExistingRelationship_requireZoneDeviceMode_completion___block_invoke;
  v23[3] = &unk_1E6CFAD48;
  v24 = v10;
  v16 = v10;
  v17 = -[HDCloudSyncSetupSharingForUnifiedZoneTask initWithManager:context:lookupInfo:requireExistingRelationship:requireZoneDeviceMode:accessibilityAssertion:completion:](v14, "initWithManager:context:lookupInfo:requireExistingRelationship:requireZoneDeviceMode:accessibilityAssertion:completion:", self, v13, v12, v7, v11, v15, v23);

  -[HDCloudSyncManagerTask setPriority:](v17, "setPriority:", 100);
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "daemon");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "cloudSyncCoordinator");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "addManagerTask:", v17);

  -[HDCloudSyncManagerTask progress](v17, "progress");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

void __127__HDCloudSyncManager_setupSharingToAccountWithIdentityLookupInfo_requireExistingRelationship_requireZoneDeviceMode_completion___block_invoke(uint64_t a1, void *a2, int a3, uint64_t a4)
{
  uint64_t v4;
  id v5;

  v4 = *(_QWORD *)(a1 + 32);
  if (a3)
  {
    objc_msgSend(a2, "shareSetupMetadata");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id, _QWORD))(v4 + 16))(v4, v5, 0);

  }
  else
  {
    (*(void (**)(_QWORD, _QWORD, uint64_t))(v4 + 16))(*(_QWORD *)(a1 + 32), 0, a4);
  }
}

uint64_t __67__HDCloudSyncManager__removeParticipants_fromSharesWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)removeParticipants:(id)a3 fromSharesWithCompletion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  id v11;
  HDCloudSyncManagerRemoveParticipantsTask *v12;
  void *v13;
  HDCloudSyncManagerRemoveParticipantsTask *v14;
  id WeakRetained;
  void *v16;
  void *v17;
  _BYTE v19[24];
  void *v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (self)
  {
    _HKInitializeLogging();
    v8 = (void *)*MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
    {
      v9 = v8;
      objc_msgSend(v6, "description");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v19 = 138543618;
      *(_QWORD *)&v19[4] = self;
      *(_WORD *)&v19[12] = 2114;
      *(_QWORD *)&v19[14] = v10;
      _os_log_impl(&dword_1B7802000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: Removing Participants: %{public}@", v19, 0x16u);

    }
    v11 = -[HDCloudSyncContext initForPurpose:options:reason:xpcActivity:]([HDCloudSyncContext alloc], "initForPurpose:options:reason:xpcActivity:", 11, 64, 11, 0);
    v12 = [HDCloudSyncManagerRemoveParticipantsTask alloc];
    -[HDCloudSyncManager preparedDatabaseAccessibilityAssertion](self, "preparedDatabaseAccessibilityAssertion");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)v19 = MEMORY[0x1E0C809B0];
    *(_QWORD *)&v19[8] = 3221225472;
    *(_QWORD *)&v19[16] = __67__HDCloudSyncManager__removeParticipants_fromSharesWithCompletion___block_invoke;
    v20 = &unk_1E6CFAD70;
    v21 = v7;
    v14 = -[HDCloudSyncManagerRemoveParticipantsTask initWithManager:context:removeAllParticipants:participantsToRemove:accessibilityAssertion:completion:](v12, "initWithManager:context:removeAllParticipants:participantsToRemove:accessibilityAssertion:completion:", self, v11, v6 == 0, v6, v13, v19);

    -[HDCloudSyncManagerTask setPriority:](v14, "setPriority:", 100);
    WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
    objc_msgSend(WeakRetained, "daemon");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "cloudSyncCoordinator");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addManagerTask:", v14);

    -[HDCloudSyncManagerTask progress](v14, "progress");
    self = (HDCloudSyncManager *)objc_claimAutoreleasedReturnValue();

  }
  return self;
}

- (id)removeAllParticipantsForSharingType:(unint64_t)a3 completion:(id)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v15[5];
  id v16;
  id v17;
  uint8_t buf[4];
  HDCloudSyncManager *v19;
  __int16 v20;
  unint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  _HKInitializeLogging();
  v7 = *MEMORY[0x1E0CB5370];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v19 = self;
    v20 = 2048;
    v21 = a3;
    _os_log_impl(&dword_1B7802000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: Removing All Participants of Sharing Type: %lu", buf, 0x16u);
  }
  objc_msgSend(MEMORY[0x1E0CB38A8], "discreteProgressWithTotalUnitCount:", 1000);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __69__HDCloudSyncManager_removeAllParticipantsForSharingType_completion___block_invoke;
  v15[3] = &unk_1E6CFADB8;
  v17 = v6;
  v15[4] = self;
  v9 = v8;
  v16 = v9;
  v10 = v6;
  v11 = -[HDCloudSyncManager fetchShareParticipantsForSharingType:completion:](self, "fetchShareParticipantsForSharingType:completion:", a3, v15);
  v12 = v16;
  v13 = v9;

  return v13;
}

void __69__HDCloudSyncManager_removeAllParticipantsForSharingType_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  HDCloudSyncManagerRemoveParticipantsTask *v10;
  void *v11;
  void *v12;
  HDCloudSyncManagerRemoveParticipantsTask *v13;
  id WeakRetained;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[4];
  id v20;

  v5 = a2;
  if (v5 || !a3)
  {
    v6 = -[HDCloudSyncContext initForPurpose:options:reason:xpcActivity:]([HDCloudSyncContext alloc], "initForPurpose:options:reason:xpcActivity:", 11, 64, 11, 0);
    v7 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(v5, "hk_filter:", &__block_literal_global_345);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setWithArray:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = [HDCloudSyncManagerRemoveParticipantsTask alloc];
    v11 = *(void **)(a1 + 32);
    objc_msgSend(v11, "preparedDatabaseAccessibilityAssertion");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __69__HDCloudSyncManager_removeAllParticipantsForSharingType_completion___block_invoke_3;
    v19[3] = &unk_1E6CFAD70;
    v20 = *(id *)(a1 + 48);
    v13 = -[HDCloudSyncManagerRemoveParticipantsTask initWithManager:context:removeAllParticipants:participantsToRemove:accessibilityAssertion:completion:](v10, "initWithManager:context:removeAllParticipants:participantsToRemove:accessibilityAssertion:completion:", v11, v6, 0, v9, v12, v19);

    -[HDCloudSyncManagerTask setPriority:](v13, "setPriority:", 100);
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 104));
    objc_msgSend(WeakRetained, "daemon");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "cloudSyncCoordinator");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addManagerTask:", v13);

    v17 = *(void **)(a1 + 40);
    -[HDCloudSyncManagerTask progress](v13, "progress");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addChild:withPendingUnitCount:", v18, 1000);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

BOOL __69__HDCloudSyncManager_removeAllParticipantsForSharingType_completion___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "role") != 1;
}

uint64_t __69__HDCloudSyncManager_removeAllParticipantsForSharingType_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)fetchShareParticipantsForSharingType:(unint64_t)a3 completion:(id)a4
{
  id v6;
  id v7;
  HDCloudSyncManagerFetchShareParticipantsTask *v8;
  void *v9;
  id v10;
  HDCloudSyncManagerFetchShareParticipantsTask *v11;
  id WeakRetained;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t, void *, int);
  void *v20;
  id v21;
  unint64_t v22;

  v6 = a4;
  v7 = -[HDCloudSyncContext initForPurpose:options:reason:xpcActivity:]([HDCloudSyncContext alloc], "initForPurpose:options:reason:xpcActivity:", 16, 64, 12, 0);
  v8 = [HDCloudSyncManagerFetchShareParticipantsTask alloc];
  -[HDCloudSyncManager preparedDatabaseAccessibilityAssertion](self, "preparedDatabaseAccessibilityAssertion");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = MEMORY[0x1E0C809B0];
  v18 = 3221225472;
  v19 = __70__HDCloudSyncManager_fetchShareParticipantsForSharingType_completion___block_invoke;
  v20 = &unk_1E6CFADE0;
  v21 = v6;
  v22 = a3;
  v10 = v6;
  v11 = -[HDCloudSyncManagerFetchShareParticipantsTask initWithManager:context:fetchAllShares:accessibilityAssertion:completion:](v8, "initWithManager:context:fetchAllShares:accessibilityAssertion:completion:", self, v7, 0, v9, &v17);

  -[HDCloudSyncManagerTask setPriority:](v11, "setPriority:", 100, v17, v18, v19, v20);
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "daemon");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "cloudSyncCoordinator");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addManagerTask:", v11);

  -[HDCloudSyncManagerTask progress](v11, "progress");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

void __70__HDCloudSyncManager_fetchShareParticipantsForSharingType_completion___block_invoke(uint64_t a1, void *a2, int a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void (*v18)(void);
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _QWORD v23[5];
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = v5;
  if (!a3)
  {
    v18 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
LABEL_13:
    v18();
    goto LABEL_14;
  }
  objc_msgSend(v5, "shares");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    v18 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
    goto LABEL_13;
  }
  objc_msgSend(v6, "shares");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *(_QWORD *)(a1 + 40);
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __HDFilterSharesBySharingType_block_invoke;
  v23[3] = &__block_descriptor_40_e17_B16__0__CKShare_8l;
  v23[4] = v9;
  objc_msgSend(v8, "hk_filter:", v23);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v12 = v10;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v20 != v15)
          objc_enumerationMutation(v12);
        objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * i), "participants", (_QWORD)v19);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "addObjectsFromArray:", v17);

      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    }
    while (v14);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
LABEL_14:

}

- (id)fetchSharingStatusForCurrentAppleIDWithOwnerEmailAddress:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  HDCloudSyncManagerFetchShareParticipantsTask *v9;
  void *v10;
  id v11;
  id v12;
  HDCloudSyncManagerFetchShareParticipantsTask *v13;
  id WeakRetained;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t, void *, int);
  void *v22;
  id v23;
  id v24;

  v6 = a3;
  v7 = a4;
  v8 = -[HDCloudSyncContext initForPurpose:options:reason:xpcActivity:]([HDCloudSyncContext alloc], "initForPurpose:options:reason:xpcActivity:", 16, 64, 12, 0);
  v9 = [HDCloudSyncManagerFetchShareParticipantsTask alloc];
  -[HDCloudSyncManager preparedDatabaseAccessibilityAssertion](self, "preparedDatabaseAccessibilityAssertion");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = MEMORY[0x1E0C809B0];
  v20 = 3221225472;
  v21 = __90__HDCloudSyncManager_fetchSharingStatusForCurrentAppleIDWithOwnerEmailAddress_completion___block_invoke;
  v22 = &unk_1E6CFAE08;
  v23 = v6;
  v24 = v7;
  v11 = v6;
  v12 = v7;
  v13 = -[HDCloudSyncManagerFetchShareParticipantsTask initWithManager:context:fetchAllShares:accessibilityAssertion:completion:](v9, "initWithManager:context:fetchAllShares:accessibilityAssertion:completion:", self, v8, 1, v10, &v19);

  -[HDCloudSyncManagerTask setPriority:](v13, "setPriority:", 100, v19, v20, v21, v22);
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "daemon");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "cloudSyncCoordinator");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addManagerTask:", v13);

  -[HDCloudSyncManagerTask progress](v13, "progress");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

void __90__HDCloudSyncManager_fetchSharingStatusForCurrentAppleIDWithOwnerEmailAddress_completion___block_invoke(uint64_t a1, void *a2, int a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void (*v22)(void);
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = v5;
  if (a3)
  {
    objc_msgSend(v5, "shares");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      v33 = 0u;
      v34 = 0u;
      v31 = 0u;
      v32 = 0u;
      objc_msgSend(v6, "shares");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
      if (v24)
      {
        v9 = *(_QWORD *)v32;
        v26 = v8;
        v23 = *(_QWORD *)v32;
        do
        {
          v10 = 0;
          do
          {
            if (*(_QWORD *)v32 != v9)
              objc_enumerationMutation(v8);
            v25 = v10;
            v11 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * v10);
            v27 = 0u;
            v28 = 0u;
            v29 = 0u;
            v30 = 0u;
            objc_msgSend(v11, "participants", v23);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
            if (v13)
            {
              v14 = v13;
              v15 = *(_QWORD *)v28;
              while (2)
              {
                for (i = 0; i != v14; ++i)
                {
                  if (*(_QWORD *)v28 != v15)
                    objc_enumerationMutation(v12);
                  v17 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
                  if (objc_msgSend(v17, "role") == 1)
                  {
                    v18 = *(void **)(a1 + 32);
                    objc_msgSend(v17, "userIdentity");
                    v19 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v19, "lookupInfo");
                    v20 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v20, "emailAddress");
                    v21 = (void *)objc_claimAutoreleasedReturnValue();
                    LOBYTE(v18) = objc_msgSend(v18, "isEqualToString:", v21);

                    if ((v18 & 1) != 0)
                    {
                      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

                      goto LABEL_23;
                    }
                  }
                }
                v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
                if (v14)
                  continue;
                break;
              }
            }

            v10 = v25 + 1;
            v8 = v26;
            v9 = v23;
          }
          while (v25 + 1 != v24);
          v24 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
        }
        while (v24);
      }

    }
    v22 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  else
  {
    v22 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  v22();
LABEL_23:

}

- (id)lookupParticipantWithIdentityLookUpInfo:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  HDCloudSyncManagerLookupTask *v9;
  void *v10;
  id v11;
  HDCloudSyncManagerLookupTask *v12;
  id WeakRetained;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v18[4];
  id v19;

  v6 = a4;
  v7 = a3;
  v8 = -[HDCloudSyncContext initForPurpose:options:reason:xpcActivity:]([HDCloudSyncContext alloc], "initForPurpose:options:reason:xpcActivity:", 16, 0, 12, 0);
  v9 = [HDCloudSyncManagerLookupTask alloc];
  -[HDCloudSyncManager preparedDatabaseAccessibilityAssertion](self, "preparedDatabaseAccessibilityAssertion");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __73__HDCloudSyncManager_lookupParticipantWithIdentityLookUpInfo_completion___block_invoke;
  v18[3] = &unk_1E6CFAE30;
  v19 = v6;
  v11 = v6;
  v12 = -[HDCloudSyncManagerLookupTask initWithManager:context:lookupInfo:accessibilityAssertion:completion:](v9, "initWithManager:context:lookupInfo:accessibilityAssertion:completion:", self, v8, v7, v10, v18);

  -[HDCloudSyncManagerTask setPriority:](v12, "setPriority:", 100);
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "daemon");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "cloudSyncCoordinator");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addManagerTask:", v12);

  -[HDCloudSyncManagerTask progress](v12, "progress");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

void __73__HDCloudSyncManager_lookupParticipantWithIdentityLookUpInfo_completion___block_invoke(uint64_t a1, void *a2, int a3, uint64_t a4)
{
  uint64_t v4;
  id v5;

  v4 = *(_QWORD *)(a1 + 32);
  if (a3)
  {
    objc_msgSend(a2, "participant");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id, _QWORD))(v4 + 16))(v4, v5, 0);

  }
  else
  {
    (*(void (**)(_QWORD, _QWORD, uint64_t))(v4 + 16))(*(_QWORD *)(a1 + 32), 0, a4);
  }
}

- (id)leaveSharesWithCompletion:(id)a3
{
  id v4;
  id v5;
  HDCloudSyncManagerLeaveSharesTask *v6;
  void *v7;
  id v8;
  HDCloudSyncManagerLeaveSharesTask *v9;
  id WeakRetained;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[4];
  id v16;

  v4 = a3;
  v5 = -[HDCloudSyncContext initForPurpose:options:reason:xpcActivity:]([HDCloudSyncContext alloc], "initForPurpose:options:reason:xpcActivity:", 16, 64, 13, 0);
  v6 = [HDCloudSyncManagerLeaveSharesTask alloc];
  -[HDCloudSyncManager preparedDatabaseAccessibilityAssertion](self, "preparedDatabaseAccessibilityAssertion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __48__HDCloudSyncManager_leaveSharesWithCompletion___block_invoke;
  v15[3] = &unk_1E6CFAE58;
  v16 = v4;
  v8 = v4;
  v9 = -[HDCloudSyncManagerPipelineTask initWithManager:context:accessibilityAssertion:completion:](v6, "initWithManager:context:accessibilityAssertion:completion:", self, v5, v7, v15);

  -[HDCloudSyncManagerTask setPriority:](v9, "setPriority:", 100);
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "daemon");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "cloudSyncCoordinator");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addManagerTask:", v9);

  -[HDCloudSyncManagerTask progress](v9, "progress");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

uint64_t __48__HDCloudSyncManager_leaveSharesWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)acceptShare:(id)a3 completion:(id)a4
{
  id v6;
  HDProfile **p_profile;
  id v8;
  id WeakRetained;
  void *v10;
  objc_class *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  HDCloudSyncManagerAcceptSharesTask *v18;
  id v19;
  id v20;
  HDCloudSyncManagerAcceptSharesTask *v21;
  id v22;
  void *v23;
  void *v24;
  _QWORD v25[4];
  id v26;
  id v27;
  id v28;

  v6 = a4;
  p_profile = &self->_profile;
  v8 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "database");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (objc_class *)objc_opt_class();
  NSStringFromClass(v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0;
  objc_msgSend(v10, "takeAccessibilityAssertionWithOwnerIdentifier:timeout:error:", v12, &v28, 300.0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v28;

  v15 = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(v15, "cloudSyncManager");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "prepareForPeriodicSync");

  v17 = -[HDCloudSyncContext initForPurpose:options:reason:xpcActivity:]([HDCloudSyncContext alloc], "initForPurpose:options:reason:xpcActivity:", 13, 64, 10, 0);
  v18 = [HDCloudSyncManagerAcceptSharesTask alloc];
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __45__HDCloudSyncManager_acceptShare_completion___block_invoke;
  v25[3] = &unk_1E6CFAE80;
  v26 = v13;
  v27 = v6;
  v19 = v6;
  v20 = v13;
  v21 = -[HDCloudSyncManagerAcceptSharesTask initWithManager:context:shareSetupMetadata:accessibilityAssertion:completion:](v18, "initWithManager:context:shareSetupMetadata:accessibilityAssertion:completion:", self, v17, v8, v20, v25);

  -[HDCloudSyncManagerTask setPriority:](v21, "setPriority:", 100);
  v22 = objc_loadWeakRetained((id *)p_profile);
  objc_msgSend(v22, "daemon");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "cloudSyncCoordinator");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "addManagerTask:", v21);

}

void __45__HDCloudSyncManager_acceptShare_completion___block_invoke(uint64_t a1, void *a2, int a3, void *a4)
{
  id v7;
  uint64_t v8;
  void *v9;
  id v10;

  v10 = a2;
  v7 = a4;
  objc_msgSend(*(id *)(a1 + 32), "invalidate");
  v8 = *(_QWORD *)(a1 + 40);
  if (a3)
  {
    objc_msgSend(v10, "acceptedShares");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, _QWORD))(v8 + 16))(v8, v9, 0);

  }
  else
  {
    (*(void (**)(uint64_t, _QWORD, id))(v8 + 16))(v8, 0, v7);
  }

}

- (void)_subscribeToSubscriptions:(void *)a3 completion:
{
  id v5;
  id v6;
  id v7;
  HDCloudSyncManagerSubscriptionTask *v8;
  void *v9;
  HDCloudSyncManagerSubscriptionTask *v10;
  id WeakRetained;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;

  v5 = a3;
  if (a1)
  {
    v6 = a2;
    v7 = -[HDCloudSyncContext initForPurpose:options:reason:xpcActivity:]([HDCloudSyncContext alloc], "initForPurpose:options:reason:xpcActivity:", 14, 64, 22, 0);
    v8 = [HDCloudSyncManagerSubscriptionTask alloc];
    objc_msgSend(a1, "preparedDatabaseAccessibilityAssertion");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __59__HDCloudSyncManager__subscribeToSubscriptions_completion___block_invoke;
    v14[3] = &unk_1E6CFAEA8;
    v15 = v5;
    v10 = -[HDCloudSyncManagerSubscriptionTask initWithManager:context:subscriptions:accessibilityAssertion:completion:](v8, "initWithManager:context:subscriptions:accessibilityAssertion:completion:", a1, v7, v6, v9, v14);

    WeakRetained = objc_loadWeakRetained(a1 + 13);
    objc_msgSend(WeakRetained, "daemon");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "cloudSyncCoordinator");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addManagerTask:", v10);

  }
}

uint64_t __59__HDCloudSyncManager__subscribeToSubscriptions_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)subscribeToDataUploadRequestsWithCompletion:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  __CFString *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HDCloudSyncManager profile](self, "profile");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "profileType");

  if (v6 == 1)
  {
    v8 = HDCloudSyncPrimaryProfileDataRequestedSubscriptionIdentifier;
    v9[0] = 0x1E6D24278;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDCloudSyncManager _subscribeToSubscriptions:completion:]((id *)&self->super.isa, v7, v4);

  }
  else
  {
    (*((void (**)(id, uint64_t, _QWORD))v4 + 2))(v4, 1, 0);
  }

}

- (void)subscribeToDataAvailableNotificationsWithCompletion:(id)a3
{
  void (**v4)(id, uint64_t, _QWORD);
  void *v5;
  uint64_t v6;
  void *v7;
  __CFString **v8;
  __CFString **v9;
  uint64_t v10;
  void *v11;
  __CFString *v12;
  __CFString *v13;
  _QWORD v14[2];
  _QWORD v15[2];
  _QWORD v16[2];
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, uint64_t, _QWORD))a3;
  -[HDCloudSyncManager profile](self, "profile");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "profileType");

  switch(v6)
  {
    case 1:
      goto LABEL_4;
    case 2:
      v12 = HDCloudSyncSharedSummaryDataAvailableForDownloadSubscriptionIdentifier;
      v13 = CFSTR("SharedSummaryTransactionRecordType");
      v7 = (void *)MEMORY[0x1E0C99D80];
      v8 = &v13;
      v9 = &v12;
      v10 = 1;
      goto LABEL_7;
    case 3:
      v14[0] = HDCloudSyncTinkerProfileDataAvailableForDownloadSubscriptionIdentifier;
      v14[1] = HDCloudSyncTinkerMedicalIDDataAvailableForDownloadSubscriptionIdentifier;
      v15[0] = CFSTR("CloudSyncStoreRecord");
      v15[1] = 0x1E6D1E038;
      v7 = (void *)MEMORY[0x1E0C99D80];
      v8 = (__CFString **)v15;
      v9 = (__CFString **)v14;
      goto LABEL_6;
    case 4:
      v4[2](v4, 1, 0);
      goto LABEL_8;
    default:
      if (v6 != 100)
        goto LABEL_8;
LABEL_4:
      v16[0] = HDCloudSyncPrimaryProfileDataAvailableForDownloadSubscriptionIdentifier;
      v16[1] = HDCloudSyncPrimaryMedicalIDDataAvailableForDownloadSubscriptionIdentifier;
      v17[0] = CFSTR("CloudSyncStoreRecord");
      v17[1] = 0x1E6D1E038;
      v7 = (void *)MEMORY[0x1E0C99D80];
      v8 = (__CFString **)v17;
      v9 = (__CFString **)v16;
LABEL_6:
      v10 = 2;
LABEL_7:
      objc_msgSend(v7, "dictionaryWithObjects:forKeys:count:", v8, v9, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[HDCloudSyncManager _subscribeToSubscriptions:completion:]((id *)&self->super.isa, v11, v4);

LABEL_8:
      return;
  }
}

- (void)requestDataUploadWithCompletion:(id)a3
{
  id v5;
  id v6;
  _QWORD v7[5];
  id v8;
  SEL v9;

  v5 = a3;
  -[HDCloudSyncManager updateDataUploadRequestStatus:](self, "updateDataUploadRequestStatus:", 1);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __54__HDCloudSyncManager_requestDataUploadWithCompletion___block_invoke;
  v7[3] = &unk_1E6CFAEF8;
  v7[4] = self;
  v8 = v5;
  v9 = a2;
  v6 = v5;
  -[HDCloudSyncManager cloudSyncRepositoriesForClient:completion:](self, "cloudSyncRepositoriesForClient:completion:", 0, v7);

}

void __54__HDCloudSyncManager_requestDataUploadWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  HDCloudSyncPipeline *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  HDCloudSyncPipelineStageFetchAndUpdateCache *v14;
  void *v15;
  HDCloudSyncPipelineStageFetchAndUpdateCache *v16;
  HDCloudSyncPipelineStageSynchronize *v17;
  void *v18;
  HDCloudSyncPipelineStageSynchronize *v19;
  HDCloudSyncRequestDataUploadOperation *v20;
  void *v21;
  HDCloudSyncRequestDataUploadOperation *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  _QWORD v27[5];
  id v28;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "updateDataUploadRequestStatus:", 5);
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    objc_msgSend(v5, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "count") != 1)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32), CFSTR("HDCloudSyncManager.m"), 1718, CFSTR("Expected only a single repository when attempting to request data upload."));

    }
    v8 = -[HDCloudSyncContext initForPurpose:options:reason:xpcActivity:]([HDCloudSyncContext alloc], "initForPurpose:options:reason:xpcActivity:", 15, 64, 18, 0);
    v9 = [HDCloudSyncPipeline alloc];
    objc_msgSend(*(id *)(a1 + 32), "preparedDatabaseAccessibilityAssertion");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[HDCloudSyncPipeline initForContext:repository:accessibilityAssertion:queue:](v9, "initForContext:repository:accessibilityAssertion:queue:", v8, v7, v10, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 120));

    objc_msgSend(v11, "operationGroup");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "defaultConfiguration");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setQualityOfService:", 17);

    v14 = [HDCloudSyncPipelineStageFetchAndUpdateCache alloc];
    objc_msgSend(v11, "operationConfiguration");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[HDCloudSyncPipelineStage initWithConfiguration:cloudState:](v14, "initWithConfiguration:cloudState:", v15, 0);
    objc_msgSend(v11, "addStage:", v16);

    v17 = [HDCloudSyncPipelineStageSynchronize alloc];
    objc_msgSend(v11, "operationConfiguration");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = -[HDCloudSyncPipelineStage initWithConfiguration:cloudState:](v17, "initWithConfiguration:cloudState:", v18, 0);
    objc_msgSend(v11, "addStage:", v19);

    v20 = [HDCloudSyncRequestDataUploadOperation alloc];
    objc_msgSend(v11, "operationConfiguration");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = -[HDCloudSyncOperation initWithConfiguration:cloudState:](v20, "initWithConfiguration:cloudState:", v21, 0);
    -[HDCloudSyncOperation asPipelineStage](v22, "asPipelineStage");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addStage:", v23);

    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __54__HDCloudSyncManager_requestDataUploadWithCompletion___block_invoke_2;
    v27[3] = &unk_1E6CFAED0;
    v24 = *(void **)(a1 + 40);
    v27[4] = *(_QWORD *)(a1 + 32);
    v28 = v24;
    v25 = (id)objc_msgSend(v11, "beginWithCompletion:", v27);

  }
}

void __54__HDCloudSyncManager_requestDataUploadWithCompletion___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  void *v6;
  id v7;

  v7 = a4;
  v6 = *(void **)(a1 + 32);
  if (a3 == 1)
    objc_msgSend(v6, "updateDataUploadRequestStatus:", 2);
  else
    objc_msgSend(v6, "updateDataUploadRequestStatus:", 5);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)fetchServerPreferredPushEnvironmentWithCompletion:(id)a3
{
  id v5;
  id v6;
  _QWORD v7[5];
  id v8;
  SEL v9;

  v5 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __72__HDCloudSyncManager_fetchServerPreferredPushEnvironmentWithCompletion___block_invoke;
  v7[3] = &unk_1E6CFAF20;
  v8 = v5;
  v9 = a2;
  v7[4] = self;
  v6 = v5;
  -[HDCloudSyncManager cloudSyncRepositoriesForClient:completion:](self, "cloudSyncRepositoriesForClient:completion:", 0, v7);

}

void __72__HDCloudSyncManager_fetchServerPreferredPushEnvironmentWithCompletion___block_invoke(_QWORD *a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v5 = a2;
  v9 = v5;
  if (a3)
  {
    (*(void (**)(void))(a1[5] + 16))();
  }
  else
  {
    objc_msgSend(v5, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "count") != 1)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a1[6], a1[4], CFSTR("HDCloudSyncManager.m"), 1755, CFSTR("Expected only a single repository when attempting to fetch server preferred push environment."));

    }
    objc_msgSend(v6, "primaryCKContainer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "serverPreferredPushEnvironmentWithCompletionHandler:", a1[5]);

  }
}

- (void)assertionManager:(id)a3 assertionInvalidated:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  id v11;
  id v12;
  void *v13;
  char v14;
  id v15;
  void *v16;
  BOOL v17;
  NSObject *v18;
  id v19;
  id v20;
  NSObject *v21;
  void *v22;
  void (**v23)(_QWORD, _QWORD, _QWORD);
  id v24;
  uint8_t buf[4];
  HDCloudSyncManager *v26;
  __int16 v27;
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[HDAssertionManager activeAssertionsForIdentifier:](self->_assertionManager, "activeAssertionsForIdentifier:", CFSTR("HDCloudSyncDownloadDirectoryAssertionIdentifier"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (v9)
  {
    _HKInitializeLogging();
    v10 = *MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v26 = self;
      v27 = 2050;
      v28 = v9;
      _os_log_impl(&dword_1B7802000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@: Active assertions count: %{public}lu", buf, 0x16u);
    }
    v11 = 0;
  }
  else
  {
    os_unfair_lock_lock(&self->_inProgressDownloadDirectoryLock);
    v12 = objc_alloc_init(MEMORY[0x1E0CB3620]);
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", self->_inProgressDownloadDirectoryPath, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 0;
    v14 = objc_msgSend(v12, "removeItemAtURL:error:", v13, &v24);
    v15 = v24;
    if ((v14 & 1) != 0)
    {
      os_unfair_lock_unlock(&self->_inProgressDownloadDirectoryLock);
      v16 = 0;
      v17 = 1;
    }
    else
    {
      _HKInitializeLogging();
      v18 = *MEMORY[0x1E0CB5370];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        v26 = self;
        v27 = 2114;
        v28 = (uint64_t)v15;
        _os_log_error_impl(&dword_1B7802000, v18, OS_LOG_TYPE_ERROR, "%{public}@ Unable to remove in progress download directory, %{public}@", buf, 0x16u);
      }
      os_unfair_lock_unlock(&self->_inProgressDownloadDirectoryLock);
      v19 = v15;
      v16 = v19;
      v17 = v19 == 0;
      if (v19)
        v20 = objc_retainAutorelease(v19);

    }
    v11 = v16;
    if (!v17)
    {
      _HKInitializeLogging();
      v21 = *MEMORY[0x1E0CB5370];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        v26 = self;
        v27 = 2114;
        v28 = (uint64_t)v11;
        _os_log_error_impl(&dword_1B7802000, v21, OS_LOG_TYPE_ERROR, "%{public}@: Failed to delete in progress download directory, %{public}@", buf, 0x16u);
      }
    }
  }
  -[HDCloudSyncManager unitTest_assertionInvalidatedHandler](self, "unitTest_assertionInvalidatedHandler");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    -[HDCloudSyncManager unitTest_assertionInvalidatedHandler](self, "unitTest_assertionInvalidatedHandler");
    v23 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id, id))v23)[2](v23, v6, v7);

  }
}

- (void)unitTest_setSupportsRebase:(BOOL)a3
{
  self->_supportsRebase = a3;
}

- (void)unitTest_setIsChild:(BOOL)a3
{
  self->_isChild = a3;
}

- (HDProfile)profile
{
  return (HDProfile *)objc_loadWeakRetained((id *)&self->_profile);
}

- (HKProfileIdentifier)profileIdentifier
{
  return self->_profileIdentifier;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (HDCloudSyncOwnerIdentifierManager)ownerIdentifierManager
{
  return self->_ownerIdentifierManager;
}

- (HDAssertion)preparedDatabaseAccessibilityAssertion
{
  return (HDAssertion *)objc_getProperty(self, a2, 8, 1);
}

- (BOOL)supportsRebase
{
  return self->_supportsRebase;
}

- (BOOL)isChild
{
  return self->_isChild;
}

- (HDCloudSyncSharedSummaryManager)sharedSummaryManager
{
  return self->_sharedSummaryManager;
}

- (HDCloudSyncContextSyncManager)contextSyncManager
{
  return self->_contextSyncManager;
}

- (HDAssertionManager)assertionManager
{
  return self->_assertionManager;
}

- (id)unitTest_assertionInvalidatedHandler
{
  return self->_unitTest_assertionInvalidatedHandler;
}

- (void)setUnitTest_assertionInvalidatedHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_unitTest_assertionInvalidatedHandler, 0);
  objc_storeStrong((id *)&self->_assertionManager, 0);
  objc_storeStrong((id *)&self->_contextSyncManager, 0);
  objc_storeStrong((id *)&self->_sharedSummaryManager, 0);
  objc_storeStrong((id *)&self->_ownerIdentifierManager, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_profileIdentifier, 0);
  objc_destroyWeak((id *)&self->_profile);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_inProgressDownloadDirectoryPath, 0);
  objc_storeStrong((id *)&self->_lock_lastDataUploadRequestCompletionDate, 0);
  objc_storeStrong((id *)&self->_lock_lastDataUploadRequestStartDate, 0);
  objc_storeStrong((id *)&self->_lock_lastSuccessfulLitePushDate, 0);
  objc_storeStrong((id *)&self->_lock_lastSuccessfulPushDate, 0);
  objc_storeStrong((id *)&self->_lock_lastSuccessfulPullDate, 0);
  objc_storeStrong((id *)&self->_preparedDatabaseAccessibilityAssertion, 0);
}

- (void)reportDailyAnalyticsWithCoordinator:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, uint64_t, void *);
  void *v17;
  id v18;
  HDCloudSyncManager *v19;
  SEL v20;
  _QWORD v21[5];
  id v22;
  _QWORD v23[4];
  id v24;

  v6 = a4;
  -[HDCloudSyncManager profile](self, "profile");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = objc_alloc(MEMORY[0x1E0D29810]);
    v9 = MEMORY[0x1E0C809B0];
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __80__HDCloudSyncManager_Analytics__reportDailyAnalyticsWithCoordinator_completion___block_invoke;
    v23[3] = &unk_1E6CF1260;
    v24 = v6;
    v10 = (void *)objc_msgSend(v8, "initWithDescription:completion:", CFSTR("Report Daily Analytics"), v23);
    -[HDCloudSyncManager queue](self, "queue");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = v9;
    v21[1] = 3221225472;
    v21[2] = __80__HDCloudSyncManager_Analytics__reportDailyAnalyticsWithCoordinator_completion___block_invoke_2;
    v21[3] = &unk_1E6CED9E8;
    v21[4] = self;
    v12 = v7;
    v22 = v12;
    objc_msgSend(v10, "addTaskOnQueue:task:", v11, v21);

    -[HDCloudSyncManager queue](self, "queue");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v9;
    v15 = 3221225472;
    v16 = __80__HDCloudSyncManager_Analytics__reportDailyAnalyticsWithCoordinator_completion___block_invoke_199;
    v17 = &unk_1E6D01E20;
    v18 = v12;
    v19 = self;
    v20 = a2;
    objc_msgSend(v10, "addTaskOnQueue:task:", v13, &v14);

    objc_msgSend(v10, "begin", v14, v15, v16, v17);
  }
  else
  {
    (*((void (**)(id, _QWORD, _QWORD, _QWORD))v6 + 2))(v6, 0, 0, 0);
  }

}

uint64_t __80__HDCloudSyncManager_Analytics__reportDailyAnalyticsWithCoordinator_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __80__HDCloudSyncManager_Analytics__reportDailyAnalyticsWithCoordinator_completion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  id v10;

  v4 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __80__HDCloudSyncManager_Analytics__reportDailyAnalyticsWithCoordinator_completion___block_invoke_3;
  v8[3] = &unk_1E6CFADB8;
  v6 = *(void **)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  v10 = v4;
  v8[4] = v6;
  v9 = v5;
  v7 = v4;
  objc_msgSend(v6, "cloudSyncRepositoriesForClient:completion:", 0, v8);

}

void __80__HDCloudSyncManager_Analytics__reportDailyAnalyticsWithCoordinator_completion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  id v14;
  _QWORD v15[4];
  id v16;
  uint64_t v17;
  id v18;
  id v19;

  v5 = a2;
  v6 = a3;
  objc_msgSend(v5, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(v5, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "primaryCKContainer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "containerIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __80__HDCloudSyncManager_Analytics__reportDailyAnalyticsWithCoordinator_completion___block_invoke_4;
    v15[3] = &unk_1E6D01D60;
    v11 = *(void **)(a1 + 32);
    v12 = *(id *)(a1 + 40);
    v13 = *(_QWORD *)(a1 + 32);
    v16 = v12;
    v17 = v13;
    v18 = v10;
    v19 = *(id *)(a1 + 48);
    v14 = v10;
    objc_msgSend(v11, "fetchSyncStatusWithCompletion:", v15);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

void __80__HDCloudSyncManager_Analytics__reportDailyAnalyticsWithCoordinator_completion___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  void *v24;
  void *v25;
  void *v26;
  double v27;
  void *v28;
  void *v29;
  void *v30;
  double v31;
  void *v32;
  uint64_t v33;
  id v34;
  NSObject *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  double v39;
  uint64_t v40;
  uint64_t v41;
  id v42;
  void *v43;
  NSObject *v44;
  void *v45;
  uint64_t v46;
  id v47;
  NSObject *v48;
  void *v49;
  id v50;
  NSObject *v51;
  void *v52;
  id v53;
  NSObject *v54;
  void *v55;
  void *v56;
  id v57;
  NSObject *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  void *v76;
  char v77;
  char v78;
  void *v79;
  void *v80;
  id v81;
  void *v82;
  void *v83;
  id v84;
  void *v85;
  void *v86;
  unsigned int v87;
  void *v88;
  void *v89;
  void *v90;
  id v91;
  void *v92;
  id v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  id v103;
  id v104;
  id v105;
  id v106;
  id v107;
  id v108;
  id v109;
  id v110;
  id v111;
  uint8_t buf[4];
  uint64_t v113;
  __int16 v114;
  id v115;
  uint64_t v116;

  v116 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v93 = a3;
  objc_msgSend(*(id *)(a1 + 32), "daemon");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "cloudSyncCoordinator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v111 = 0;
  v87 = objc_msgSend(v7, "canPerformCloudSyncWithError:", &v111);
  v91 = v111;

  HDCloudSyncKeyValueDomainWithProfile(*(void **)(a1 + 32));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  HDCloudSyncRestorePhaseSyncCompleteStartDate(*(void **)(a1 + 32));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  HDCloudSyncRestorePhaseMergeCompleteEndDate(*(void **)(a1 + 32));
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = 0;
  v96 = (void *)v10;
  if (!v10)
  {
    v12 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v9, "timeIntervalSinceNow");
    objc_msgSend(v12, "numberWithDouble:", -v13);
    v11 = objc_claimAutoreleasedReturnValue();
  }
  v88 = (void *)v11;
  v89 = v9;
  v14 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(*(id *)(a1 + 32), "database");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "_journalForType:", 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "numberWithUnsignedLong:", (unint64_t)objc_msgSend(v16, "sizeOnDisk") >> 20);
  v102 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(*(id *)(a1 + 32), "database");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "_journalForType:", 2);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "ageOfOldestJournal");
  objc_msgSend(v17, "numberWithDouble:");
  v101 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "lastSuccessfulPullDate");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20)
  {
    v21 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v5, "lastSuccessfulPullDate");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "timeIntervalSinceNow");
    objc_msgSend(v21, "numberWithDouble:", -v23);
    v100 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v100 = 0;
  }

  objc_msgSend(v5, "lastSuccessfulPushDate");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (v24)
  {
    v25 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v5, "lastSuccessfulPushDate");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "timeIntervalSinceNow");
    objc_msgSend(v25, "numberWithDouble:", -v27);
    v99 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v99 = 0;
  }

  objc_msgSend(v5, "lastSuccessfulLitePushDate");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  if (v28)
  {
    v29 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v5, "lastSuccessfulLitePushDate");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "timeIntervalSinceNow");
    objc_msgSend(v29, "numberWithDouble:", -v31);
    v97 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v97 = 0;
  }

  objc_msgSend(*(id *)(a1 + 40), "profile");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v110 = 0;
  +[HDCloudSyncStoreEntity persistedStoreUUIDsForProfile:error:](HDCloudSyncStoreEntity, "persistedStoreUUIDsForProfile:error:", v32, &v110);
  v33 = objc_claimAutoreleasedReturnValue();
  v34 = v110;

  v98 = (void *)v33;
  if (!v33)
  {
    _HKInitializeLogging();
    v35 = *MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
    {
      v71 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      v113 = v71;
      v114 = 2114;
      v115 = v34;
      _os_log_error_impl(&dword_1B7802000, v35, OS_LOG_TYPE_ERROR, "%{public}@: Failed to retrieve persisted store UUIDs for daily analytics: %{public}@", buf, 0x16u);
    }
  }
  v109 = 0;
  objc_msgSend(v8, "dateForKey:error:", CFSTR("HDCloudSyncPrimaryLastPushForwardProgressDate"), &v109);
  v36 = objc_claimAutoreleasedReturnValue();
  v84 = v109;
  v85 = (void *)v36;
  if (v36)
  {
    v37 = (void *)v36;
    v38 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v37, "timeIntervalSinceNow");
    objc_msgSend(v38, "numberWithDouble:", -v39);
    v83 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v83 = 0;
  }
  v108 = 0;
  objc_msgSend(v8, "dataForKey:error:", CFSTR("HDCloudSyncKeyErrorRequiringUserAction"), &v108);
  v40 = objc_claimAutoreleasedReturnValue();
  v81 = v108;
  v82 = (void *)v40;
  if (v40)
  {
    v107 = 0;
    objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v40, &v107);
    v41 = objc_claimAutoreleasedReturnValue();
    v42 = v107;
    v43 = v42;
    v80 = (void *)v41;
    if (!v41)
    {
      if (v42)
      {
        _HKInitializeLogging();
        v44 = *MEMORY[0x1E0CB5370];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
        {
          v73 = *(_QWORD *)(a1 + 40);
          *(_DWORD *)buf = 138543618;
          v113 = v73;
          v114 = 2114;
          v115 = v43;
          _os_log_error_impl(&dword_1B7802000, v44, OS_LOG_TYPE_ERROR, "%{public}@: Failed to unarchive cloud sync error requiring user action: %{public}@", buf, 0x16u);
        }
      }
    }

  }
  else
  {
    v80 = 0;
  }
  objc_msgSend(*(id *)(a1 + 32), "syncIdentityManager");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v106 = 0;
  objc_msgSend(v45, "childIdentitiesForCurrentSyncIdentityWithError:", &v106);
  v46 = objc_claimAutoreleasedReturnValue();
  v47 = v106;

  v95 = (void *)v46;
  if (!v46)
  {
    _HKInitializeLogging();
    v48 = *MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
    {
      v72 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      v113 = v72;
      v114 = 2114;
      v115 = v47;
      _os_log_error_impl(&dword_1B7802000, v48, OS_LOG_TYPE_ERROR, "%{public}@: Unable to get child sync identities from local storage: %{public}@ for daily analytics", buf, 0x16u);
    }
  }
  v49 = *(void **)(a1 + 32);
  v105 = 0;
  v78 = HDUpgradedToSyncIdentity(v49, (uint64_t)&v105);
  v50 = v105;
  if (v50)
  {
    _HKInitializeLogging();
    v51 = *MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
    {
      v68 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      v113 = v68;
      v114 = 2114;
      v115 = v50;
      _os_log_error_impl(&dword_1B7802000, v51, OS_LOG_TYPE_ERROR, "%{public}@: Failed to get upgraded to sync identity status for daily analytics: %{public}@", buf, 0x16u);
    }
  }
  v90 = v8;
  v52 = *(void **)(a1 + 32);
  v104 = 0;
  v77 = HDCompletedTransitionToSyncIdentity(v52, (uint64_t)&v104);
  v53 = v104;
  if (v53)
  {
    _HKInitializeLogging();
    v54 = *MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
    {
      v69 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      v113 = v69;
      v114 = 2114;
      v115 = v53;
      _os_log_error_impl(&dword_1B7802000, v54, OS_LOG_TYPE_ERROR, "%{public}@: Failed to get completed transition to sync identity status for daily analytics: %{public}@", buf, 0x16u);
    }
  }
  v79 = v53;
  objc_msgSend(*(id *)(a1 + 32), "deviceContextManager");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v103 = v93;
  objc_msgSend(v55, "numberOfDeviceContextsPerDeviceType:", &v103);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = v103;

  v94 = v57;
  if (v57)
  {
    _HKInitializeLogging();
    v58 = *MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
    {
      v70 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      v113 = v70;
      v114 = 2114;
      v115 = v57;
      _os_log_error_impl(&dword_1B7802000, v58, OS_LOG_TYPE_ERROR, "%{public}@: Failed to get device contexts dictionary for cloud sync daily analytics: %{public}@", buf, 0x16u);
    }
  }
  objc_msgSend(v56, "objectForKeyedSubscript:", &unk_1E6DFE558);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v86 = v34;
  if (v59)
  {
    objc_msgSend(v56, "objectForKeyedSubscript:", &unk_1E6DFE558);
    v76 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v76 = &unk_1E6DFE570;
  }

  objc_msgSend(v56, "objectForKeyedSubscript:", &unk_1E6DFE588);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  if (v60)
  {
    objc_msgSend(v56, "objectForKeyedSubscript:", &unk_1E6DFE588);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v61 = &unk_1E6DFE570;
  }
  v92 = v5;

  objc_msgSend(v56, "objectForKeyedSubscript:", &unk_1E6DFE5A0);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  if (v62)
  {
    objc_msgSend(v56, "objectForKeyedSubscript:", &unk_1E6DFE5A0);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v63 = &unk_1E6DFE570;
  }

  objc_msgSend(v56, "objectForKeyedSubscript:", &unk_1E6DFE5B8);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  if (v64)
  {
    objc_msgSend(v56, "objectForKeyedSubscript:", &unk_1E6DFE5B8);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v65 = &unk_1E6DFE570;
  }

  objc_msgSend(*(id *)(a1 + 32), "daemon");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "analyticsSubmissionCoordinator");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  BYTE2(v75) = v78 & v77;
  BYTE1(v75) = v78 & (v77 ^ 1);
  LOBYTE(v75) = (v78 | v77) ^ 1;
  BYTE2(v74) = 0;
  LOWORD(v74) = 0;
  objc_msgSend(v67, "cloudSync_reportDailyAnalyticForProfileType:syncEnabled:syncDisabledError:primaryContainer:restoreComplete:timeSinceRestoreStart:journalSize:oldestJournalAge:timeSinceLastSuccessfulPull:timeSinceLastSuccessfulPush:timeSinceLastSuccessfulLitePush:timeSinceLastPushForwardProgress:storeCount:zoneCount:hasUnifiedZone:hasMasterZone:hasMedicalID:errorRequiringUserAction:childSyncIdentityCount:canUpgradeToSyncIdentity:startedUpgradeToSyncIdentity:completedUpgradeToSyncIdentity:iPhoneCount:iPadCount:watchCount:visionProCount:", objc_msgSend(*(id *)(a1 + 32), "profileType"), v87, v91, *(_QWORD *)(a1 + 48), v96 != 0, v88, v102, v101, v100, v99, v97, v83, objc_msgSend(v98, "count"),
    0,
    v74,
    v80,
    objc_msgSend(v95, "count"),
    v75,
    v76,
    v61,
    v63,
    v65);

  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

void __80__HDCloudSyncManager_Analytics__reportDailyAnalyticsWithCoordinator_completion___block_invoke_199(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  id v14;
  uint64_t v15;
  id v16;
  int8x16_t v17;
  _QWORD v18[4];
  int8x16_t v19;
  id v20;
  uint64_t v21;
  id v22;

  v4 = a3;
  objc_msgSend(*(id *)(a1 + 32), "daemon");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cloudSyncCoordinator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0;
  v7 = objc_msgSend(v6, "canPerformCloudSyncWithError:", &v22);
  v8 = v22;
  if ((v7 & 1) == 0)
  {

    goto LABEL_5;
  }
  objc_msgSend(*(id *)(a1 + 40), "profile");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "daemon");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "behavior");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "supportsCloudSync");

  if ((v12 & 1) == 0)
  {
LABEL_5:
    (*((void (**)(id, _QWORD, _QWORD))v4 + 2))(v4, 0, 0);
    goto LABEL_6;
  }
  v13 = *(void **)(a1 + 40);
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __80__HDCloudSyncManager_Analytics__reportDailyAnalyticsWithCoordinator_completion___block_invoke_2_200;
  v18[3] = &unk_1E6D01DF8;
  v14 = v4;
  v15 = *(_QWORD *)(a1 + 48);
  v20 = v14;
  v21 = v15;
  v17 = *(int8x16_t *)(a1 + 32);
  v16 = (id)v17.i64[0];
  v19 = vextq_s8(v17, v17, 8uLL);
  objc_msgSend(v13, "cloudSyncRepositoriesForClient:completion:", 0, v18);

LABEL_6:
}

void __80__HDCloudSyncManager_Analytics__reportDailyAnalyticsWithCoordinator_completion___block_invoke_2_200(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  HDCloudSyncPipeline *v9;
  void *v10;
  id v11;
  HDCloudSyncPipelineStageFetchAndUpdateCache *v12;
  void *v13;
  HDCloudSyncPipelineStageFetchAndUpdateCache *v14;
  HDCloudSyncPipelineStageSynchronize *v15;
  void *v16;
  HDCloudSyncPipelineStageSynchronize *v17;
  HDCloudSyncPipelineStagePrepareForSync *v18;
  void *v19;
  HDCloudSyncPipelineStagePrepareForSync *v20;
  HDCloudSyncPipelineStageContextSyncPush *v21;
  void *v22;
  HDCloudSyncPipelineStageContextSyncPush *v23;
  HDCloudSyncPipelineStageContextSyncPull *v24;
  void *v25;
  HDCloudSyncPipelineStageContextSyncPull *v26;
  id v27;
  uint64_t v28;
  void *v29;
  id v30;
  id v31;
  void *v32;
  _QWORD v33[4];
  id v34;
  id v35;
  uint64_t v36;
  id v37;
  id v38;

  v5 = a2;
  v6 = a3;
  objc_msgSend(v5, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    if (objc_msgSend(v5, "count") != 1)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 32), CFSTR("HDCloudSyncManager+Analytics.m"), 200, CFSTR("Expected only a single repository when attempting to report cache analytics."));

    }
    v8 = -[HDCloudSyncContext initForPurpose:options:reason:xpcActivity:]([HDCloudSyncContext alloc], "initForPurpose:options:reason:xpcActivity:", 1, 64, 31, 0);
    v9 = [HDCloudSyncPipeline alloc];
    objc_msgSend(*(id *)(a1 + 32), "queue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[HDCloudSyncPipeline initForContext:repository:accessibilityAssertion:queue:](v9, "initForContext:repository:accessibilityAssertion:queue:", v8, v7, 0, v10);

    v12 = [HDCloudSyncPipelineStageFetchAndUpdateCache alloc];
    objc_msgSend(v11, "operationConfiguration");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[HDCloudSyncPipelineStage initWithConfiguration:cloudState:](v12, "initWithConfiguration:cloudState:", v13, 0);
    objc_msgSend(v11, "addStage:", v14);

    v15 = [HDCloudSyncPipelineStageSynchronize alloc];
    objc_msgSend(v11, "operationConfiguration");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[HDCloudSyncPipelineStage initWithConfiguration:cloudState:](v15, "initWithConfiguration:cloudState:", v16, 0);
    objc_msgSend(v11, "addStage:", v17);

    v18 = [HDCloudSyncPipelineStagePrepareForSync alloc];
    objc_msgSend(v11, "operationConfiguration");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = -[HDCloudSyncPipelineStage initWithConfiguration:cloudState:](v18, "initWithConfiguration:cloudState:", v19, 0);
    objc_msgSend(v11, "addStage:", v20);

    v21 = [HDCloudSyncPipelineStageContextSyncPush alloc];
    objc_msgSend(v11, "operationConfiguration");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = -[HDCloudSyncPipelineStage initWithConfiguration:cloudState:](v21, "initWithConfiguration:cloudState:", v22, 0);
    objc_msgSend(v11, "addStage:", v23);

    v24 = [HDCloudSyncPipelineStageContextSyncPull alloc];
    objc_msgSend(v11, "operationConfiguration");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = -[HDCloudSyncPipelineStage initWithConfiguration:cloudState:](v24, "initWithConfiguration:cloudState:", v25, 0);
    objc_msgSend(v11, "addStage:", v26);

    v33[0] = MEMORY[0x1E0C809B0];
    v33[1] = 3221225472;
    v33[2] = __80__HDCloudSyncManager_Analytics__reportDailyAnalyticsWithCoordinator_completion___block_invoke_3_213;
    v33[3] = &unk_1E6D01DD0;
    v34 = v11;
    v35 = v7;
    v27 = *(id *)(a1 + 48);
    v28 = *(_QWORD *)(a1 + 32);
    v29 = *(void **)(a1 + 40);
    v38 = v27;
    v36 = v28;
    v37 = v29;
    v30 = v11;
    v31 = (id)objc_msgSend(v30, "beginWithCompletion:", v33);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

void __80__HDCloudSyncManager_Analytics__reportDailyAnalyticsWithCoordinator_completion___block_invoke_3_213(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  unsigned int v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  id v25;
  id v26;
  id v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  id v32;
  void *v33;
  uint64_t v34;
  id v35;
  char v36;
  id v37;
  uint64_t v38;
  char v39;
  id v40;
  HDAttachmentCloudAnalytics *v41;
  void *v42;
  void *v43;
  void *v44;
  char v45;
  id v46;
  id v47;
  id v48;
  id v49;
  id v50;
  id v51;
  NSObject *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  uint64_t v57;
  char v58;
  void *j;
  void *v60;
  void *v61;
  unsigned int v62;
  id v63;
  id v64;
  void *v65;
  id v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  uint64_t v71;
  uint64_t v72;
  id v73;
  void *v74;
  void *v75;
  void *v76;
  id v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t k;
  void *v82;
  void *v83;
  NSObject *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t *v87;
  void *v88;
  uint64_t v89;
  void *v90;
  void *v91;
  void *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  id v96;
  void *v97;
  void *v98;
  void *v99;
  id v100;
  void *v101;
  id v102;
  id v103;
  void *v104;
  id v105;
  uint64_t v106;
  id v107;
  id v108;
  uint64_t v109;
  id v110;
  id obj;
  id obja;
  id objb;
  char v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  _QWORD v119[5];
  id v120;
  _QWORD v121[5];
  id v122;
  id v123;
  id v124;
  id v125;
  id v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  id v131;
  id v132;
  id v133;
  id v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  id v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  void *v143;
  uint64_t *v144;
  id v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  void *v149;
  id v150;
  uint64_t *v151;
  uint64_t *v152;
  id v153;
  id v154;
  uint64_t v155;
  double *v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t *v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t *v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t *v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t *v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t *v176;
  uint64_t v177;
  uint64_t v178;
  BOOL v179;
  _BYTE buf[24];
  char *v181;
  id v182;
  __int128 v183;
  uint64_t *v184;
  __int16 v185;
  uint64_t v186;
  _BYTE v187[128];
  _BYTE v188[128];
  _BYTE v189[128];
  uint64_t v190;

  v190 = *MEMORY[0x1E0C80C00];
  v102 = a2;
  v103 = a4;
  v106 = a1;
  objc_msgSend(*(id *)(a1 + 32), "operationConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "cachedCloudState");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(v106 + 40), "primaryCKContainer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "containerIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v139 = 0;
  objc_msgSend(v7, "zoneIdentifiersForContainerIdentifier:databaseScope:error:", v9, 2, &v139);
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  v105 = v139;

  if (v105)
  {
    (*(void (**)(void))(*(_QWORD *)(v106 + 64) + 16))();
    goto LABEL_65;
  }
  v137 = 0u;
  v138 = 0u;
  v135 = 0u;
  v136 = 0u;
  obj = v104;
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v135, v189, 16);
  if (v10)
  {
    v114 = 0;
    v11 = 0;
    v12 = *(_QWORD *)v136;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v136 != v12)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v135 + 1) + 8 * i);
        objc_msgSend(v14, "zoneIdentifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v133 = 0;
        v134 = 0;
        v16 = objc_msgSend(v15, "hd_isSharedSummaryZoneIDForUserIdentifier:syncCircleIdentifier:", &v134, &v133);
        v17 = v134;
        v18 = v133;

        objc_msgSend(v14, "zoneIdentifier");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v132 = v18;
        LOBYTE(v14) = objc_msgSend(v19, "hd_isUnifiedSyncZoneIDForSyncCircleIdentifier:", &v132);
        v20 = v132;

        v11 += v16;
        v114 |= v14;
      }
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v135, v189, 16);
    }
    while (v10);
  }
  else
  {
    v114 = 0;
    v11 = 0;
  }

  objc_msgSend(obj, "hk_filter:", &__block_literal_global_184);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "firstObject");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = *(_QWORD *)(v106 + 48);
  v24 = *(void **)(v106 + 40);
  v25 = *(id *)(v106 + 56);
  v26 = v22;
  v27 = v24;
  v101 = v26;
  if (!v23)
  {
    v44 = 0;
    v45 = 0;
    goto LABEL_31;
  }
  v175 = 0;
  v176 = &v175;
  v177 = 0x2020000000;
  v178 = 0;
  v171 = 0;
  v172 = &v171;
  v173 = 0x2020000000;
  v174 = 0;
  v167 = 0;
  v168 = &v167;
  v169 = 0x2020000000;
  v170 = 0;
  v163 = 0;
  v164 = &v163;
  v165 = 0x2020000000;
  v166 = 0;
  v159 = 0;
  v160 = &v159;
  v161 = 0x2020000000;
  v162 = 0;
  v155 = 0;
  v156 = (double *)&v155;
  v157 = 0x2020000000;
  v158 = 0;
  if (v26)
  {
    v28 = -[HDCloudSyncCachedZone initForZoneIdentifier:repository:accessibilityAssertion:]([HDCloudSyncCachedZone alloc], "initForZoneIdentifier:repository:accessibilityAssertion:", v26, v27, 0);
    v29 = objc_opt_class();
    v154 = 0;
    v30 = MEMORY[0x1E0C809B0];
    *(_QWORD *)buf = MEMORY[0x1E0C809B0];
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = __100__HDCloudSyncManager_Analytics___reportDailyAttachmentsAnalyticsForProfile_zoneID_repository_error___block_invoke;
    v181 = (char *)&unk_1E6D01E70;
    *(_QWORD *)&v183 = &v175;
    *((_QWORD *)&v183 + 1) = &v155;
    v31 = v28;
    v182 = v31;
    v184 = &v163;
    LOBYTE(v29) = objc_msgSend(v31, "recordsForClass:epoch:error:enumerationHandler:", v29, 0, &v154, buf);
    v32 = v154;
    v33 = v32;
    if ((v29 & 1) == 0)
    {
      v46 = v32;
      v44 = v46;
      if (v46)
        v47 = objc_retainAutorelease(v46);

      v179 = v44 == 0;
      v40 = v44;
      goto LABEL_29;
    }
    v34 = objc_opt_class();
    v153 = v33;
    v146 = v30;
    v147 = 3221225472;
    v148 = (uint64_t)__100__HDCloudSyncManager_Analytics___reportDailyAttachmentsAnalyticsForProfile_zoneID_repository_error___block_invoke_3;
    v149 = &unk_1E6D01E98;
    v151 = &v171;
    v35 = v31;
    v150 = v35;
    v152 = &v159;
    v36 = objc_msgSend(v35, "recordsForClass:epoch:error:enumerationHandler:", v34, 0, &v153, &v146);
    v37 = v153;

    if ((v36 & 1) != 0)
    {
      v38 = objc_opt_class();
      v145 = v37;
      v140 = v30;
      v141 = 3221225472;
      v142 = (uint64_t)__100__HDCloudSyncManager_Analytics___reportDailyAttachmentsAnalyticsForProfile_zoneID_repository_error___block_invoke_5;
      v143 = &unk_1E6D01EC0;
      v144 = &v167;
      v39 = objc_msgSend(v35, "recordsForClass:epoch:error:enumerationHandler:", v38, 0, &v145, &v140);
      v40 = v145;

      if ((v39 & 1) != 0)
      {
        v41 = objc_alloc_init(HDAttachmentCloudAnalytics);
        -[HDAttachmentCloudAnalytics setNumberOfAttachmentRecords:](v41, "setNumberOfAttachmentRecords:", v176[3]);
        -[HDAttachmentCloudAnalytics setNumberOfReferenceRecords:](v41, "setNumberOfReferenceRecords:", v172[3]);
        -[HDAttachmentCloudAnalytics setNumberOfTombstoneRecords:](v41, "setNumberOfTombstoneRecords:", v168[3]);
        -[HDAttachmentCloudAnalytics setNumberOfOrphanedAttachmentRecords:](v41, "setNumberOfOrphanedAttachmentRecords:", v164[3]);
        -[HDAttachmentCloudAnalytics setNumberOfOrphanedReferenceRecords:](v41, "setNumberOfOrphanedReferenceRecords:", v160[3]);
        -[HDAttachmentCloudAnalytics setPercentageOfAttachmentsWithAssetData:](v41, "setPercentageOfAttachmentsWithAssetData:", (uint64_t)(v156[3] / (double)v176[3] * 100.0));
        objc_msgSend(v25, "daemon");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "analyticsSubmissionCoordinator");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "attachments_reportDailyCloudAnalytics:", v41);

        v179 = 1;
        v44 = 0;
LABEL_28:

LABEL_29:
        v45 = v179;
        goto LABEL_30;
      }
      v50 = v40;
      v44 = v50;
      if (v50)
        v51 = objc_retainAutorelease(v50);
    }
    else
    {
      v48 = v37;
      v44 = v48;
      if (v48)
        v49 = objc_retainAutorelease(v48);
    }

    v179 = v44 == 0;
    v40 = v44;
    goto LABEL_28;
  }
  v44 = 0;
  v45 = 1;
LABEL_30:
  _Block_object_dispose(&v155, 8);
  _Block_object_dispose(&v159, 8);
  _Block_object_dispose(&v163, 8);
  _Block_object_dispose(&v167, 8);
  _Block_object_dispose(&v171, 8);
  _Block_object_dispose(&v175, 8);
LABEL_31:

  v100 = v44;
  if ((v45 & 1) == 0)
  {
    _HKInitializeLogging();
    HKLogAnalytics();
    v52 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
    {
      v95 = *(_QWORD *)(v106 + 48);
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v95;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v100;
      _os_log_error_impl(&dword_1B7802000, v52, OS_LOG_TYPE_ERROR, "%{public}@ Failed to report attachment cloud analytics, %{public}@", buf, 0x16u);
    }

  }
  objc_msgSend(*(id *)(v106 + 32), "operationConfiguration");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "cachedCloudState");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(v106 + 40), "primaryCKContainer");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "containerIdentifier");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v131 = 0;
  objc_msgSend(v54, "zoneIdentifiersForContainerIdentifier:databaseScope:error:", v56, 3, &v131);
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  v105 = v131;

  if (v104 || !v105)
  {
    v129 = 0u;
    v130 = 0u;
    v127 = 0u;
    v128 = 0u;
    v107 = v104;
    obja = (id)objc_msgSend(v107, "countByEnumeratingWithState:objects:count:", &v127, v188, 16);
    if (obja)
    {
      v57 = 0;
      v58 = 0;
      v109 = *(_QWORD *)v128;
      do
      {
        for (j = 0; j != obja; j = (char *)j + 1)
        {
          if (*(_QWORD *)v128 != v109)
            objc_enumerationMutation(v107);
          v60 = *(void **)(*((_QWORD *)&v127 + 1) + 8 * (_QWORD)j);
          objc_msgSend(v60, "zoneIdentifier");
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          v125 = 0;
          v126 = 0;
          v62 = objc_msgSend(v61, "hd_isSharedSummaryZoneIDForUserIdentifier:syncCircleIdentifier:", &v126, &v125);
          v63 = v126;
          v64 = v125;

          objc_msgSend(v60, "zoneIdentifier");
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          v124 = v64;
          LOBYTE(v60) = objc_msgSend(v65, "hd_isUnifiedSyncZoneIDForSyncCircleIdentifier:", &v124);
          v66 = v124;

          v57 += v62;
          v58 |= v60;
        }
        obja = (id)objc_msgSend(v107, "countByEnumeratingWithState:objects:count:", &v127, v188, 16);
      }
      while (obja);
    }
    else
    {
      v57 = 0;
      v58 = 0;
    }

    objc_msgSend(*(id *)(v106 + 32), "operationConfiguration");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "cachedCloudState");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(v106 + 40), "primaryCKContainer");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "containerIdentifier");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    v123 = 0;
    objc_msgSend(v68, "contextSyncZoneForContainerID:error:", v70, &v123);
    objb = (id)objc_claimAutoreleasedReturnValue();
    v110 = v123;

    if (objb)
    {
      v146 = 0;
      v147 = (uint64_t)&v146;
      v148 = 0x2020000000;
      v149 = 0;
      v140 = 0;
      v141 = (uint64_t)&v140;
      v142 = 0x2020000000;
      v143 = 0;
      v71 = objc_opt_class();
      v72 = MEMORY[0x1E0C809B0];
      v121[4] = &v140;
      v122 = 0;
      v121[0] = MEMORY[0x1E0C809B0];
      v121[1] = 3221225472;
      v121[2] = __80__HDCloudSyncManager_Analytics__reportDailyAnalyticsWithCoordinator_completion___block_invoke_219;
      v121[3] = &unk_1E6D01DA8;
      objc_msgSend(objb, "recordsForClass:epoch:error:enumerationHandler:", v71, 0, &v122, v121);
      v73 = v122;
      v119[0] = v72;
      v119[1] = 3221225472;
      v119[2] = __80__HDCloudSyncManager_Analytics__reportDailyAnalyticsWithCoordinator_completion___block_invoke_2_222;
      v119[3] = &unk_1E6D01DA8;
      v119[4] = &v146;
      v120 = v73;
      objc_msgSend(objb, "recordsForClass:epoch:error:enumerationHandler:", objc_opt_class(), 0, &v120, v119);
      v96 = v120;

      objc_msgSend(*(id *)(v106 + 32), "operationConfiguration");
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v74, "computedState");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v75, "pushTargets");
      v76 = (void *)objc_claimAutoreleasedReturnValue();

      v117 = 0u;
      v118 = 0u;
      v115 = 0u;
      v116 = 0u;
      v77 = v76;
      v78 = 0;
      v79 = objc_msgSend(v77, "countByEnumeratingWithState:objects:count:", &v115, v187, 16);
      if (v79)
      {
        v80 = *(_QWORD *)v116;
        do
        {
          for (k = 0; k != v79; ++k)
          {
            if (*(_QWORD *)v116 != v80)
              objc_enumerationMutation(v77);
            objc_msgSend(*(id *)(*((_QWORD *)&v115 + 1) + 8 * k), "storeRecord");
            v82 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v82, "syncIdentity");
            v83 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v83)
              ++v78;

          }
          v79 = objc_msgSend(v77, "countByEnumeratingWithState:objects:count:", &v115, v187, 16);
        }
        while (v79);
      }

      _HKInitializeLogging();
      HKLogAnalytics();
      v84 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v84, OS_LOG_TYPE_DEFAULT))
      {
        v85 = *(_QWORD *)(v106 + 48);
        v86 = *(_QWORD *)(v147 + 24);
        v87 = *(uint64_t **)(v141 + 24);
        *(_DWORD *)buf = 138545154;
        *(_QWORD *)&buf[4] = v85;
        *(_WORD *)&buf[12] = 2050;
        *(_QWORD *)&buf[14] = v57;
        *(_WORD *)&buf[22] = 2050;
        v181 = v11;
        LOWORD(v182) = 1026;
        *(_DWORD *)((char *)&v182 + 2) = v58 & 1;
        HIWORD(v182) = 1026;
        LODWORD(v183) = v114 & 1;
        WORD2(v183) = 2050;
        *(_QWORD *)((char *)&v183 + 6) = v86;
        HIWORD(v183) = 2050;
        v184 = v87;
        v185 = 2050;
        v186 = v78;
        _os_log_impl(&dword_1B7802000, v84, OS_LOG_TYPE_DEFAULT, "%{public}@ Reporting daily cache analytics -\n shared database sharing zone count: %{public}ld\n private database sharing zone count: %{public}ld\n shared database unified zone: %{public}d\n private unified zone: %{public}d\n device contexts count: %{public}ld\n device key values count: %{public}ld\n nil sync identities count: %{public}ld", buf, 0x4Au);
      }

      objc_msgSend(*(id *)(v106 + 56), "daemon");
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v88, "analyticsSubmissionCoordinator");
      v97 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(v106 + 32), "operationConfiguration");
      v108 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v108, "computedState");
      v99 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v99, "pushTargets");
      v98 = (void *)objc_claimAutoreleasedReturnValue();
      v89 = objc_msgSend(v98, "count");
      objc_msgSend(*(id *)(v106 + 32), "operationConfiguration");
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v90, "computedState");
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v91, "pullTargets");
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      v93 = objc_msgSend(v92, "count");
      objc_msgSend(v97, "cloudCache_reportDailyCacheAnalyticsWithPushTargets:pullTargets:sharedDBSummarySharingZones:privateDBSummarySharingZones:unifiedZoneInSharedDB:unifiedZoneInPrivateDB:deviceContexts:deviceKeys:nilSyncIdentities:", v89, v93, v57, v11, v58 & 1, v114 & 1, *(_QWORD *)(v147 + 24), *(_QWORD *)(v141 + 24), v78);

      (*(void (**)(void))(*(_QWORD *)(v106 + 64) + 16))();
      _Block_object_dispose(&v140, 8);
      _Block_object_dispose(&v146, 8);
    }
    else
    {
      v94 = (uint64_t)v110;
      if (!v110)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:format:", 724, CFSTR("Context sync zone not present for daily analytic collection."));
        v94 = objc_claimAutoreleasedReturnValue();
      }
      v110 = (id)v94;
      (*(void (**)(void))(*(_QWORD *)(v106 + 64) + 16))();
    }

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(v106 + 64) + 16))();
  }

LABEL_65:
}

uint64_t __80__HDCloudSyncManager_Analytics__reportDailyAnalyticsWithCoordinator_completion___block_invoke_4_214(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v5;

  objc_msgSend(a2, "zoneIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 0;
  v3 = objc_msgSend(v2, "hd_isAttachmentZoneIDForSyncCircleIdentifier:", &v5);

  return v3;
}

uint64_t __80__HDCloudSyncManager_Analytics__reportDailyAnalyticsWithCoordinator_completion___block_invoke_219(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  void *v5;

  objc_msgSend(a2, "deviceKeyValueEntry:", a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);

  return 1;
}

uint64_t __80__HDCloudSyncManager_Analytics__reportDailyAnalyticsWithCoordinator_completion___block_invoke_2_222(uint64_t a1)
{
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return 1;
}

uint64_t __100__HDCloudSyncManager_Analytics___reportDailyAttachmentsAnalyticsForProfile_zoneID_repository_error___block_invoke(_QWORD *a1, void *a2, uint64_t a3, _QWORD *a4)
{
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  BOOL v13;
  uint64_t v14;
  uint64_t v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, void *);
  void *v19;
  id v20;
  id v21;

  v6 = a2;
  ++*(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24);
  if (objc_msgSend(v6, "hasAssetData"))
    *(double *)(*(_QWORD *)(a1[6] + 8) + 24) = *(double *)(*(_QWORD *)(a1[6] + 8) + 24) + 1.0;
  v7 = (void *)a1[4];
  v8 = objc_opt_class();
  v21 = 0;
  v16 = MEMORY[0x1E0C809B0];
  v17 = 3221225472;
  v18 = __100__HDCloudSyncManager_Analytics___reportDailyAttachmentsAnalyticsForProfile_zoneID_repository_error___block_invoke_2;
  v19 = &unk_1E6D01E48;
  v9 = v6;
  v20 = v9;
  objc_msgSend(v7, "recordsForClass:error:filter:", v8, &v21, &v16);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v21;
  v12 = v11;
  if (v10)
    v13 = 1;
  else
    v13 = v11 == 0;
  v14 = v13;
  if (v13)
  {
    if (!objc_msgSend(v10, "count", v16, v17, v18, v19))
      ++*(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 24);
  }
  else if (a4)
  {
    *a4 = objc_retainAutorelease(v11);
  }
  else
  {
    _HKLogDroppedError();
  }

  return v14;
}

uint64_t __100__HDCloudSyncManager_Analytics___reportDailyAttachmentsAnalyticsForProfile_zoneID_repository_error___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "attachmentIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "attachmentIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqualToString:", v4);

  return v5;
}

uint64_t __100__HDCloudSyncManager_Analytics___reportDailyAttachmentsAnalyticsForProfile_zoneID_repository_error___block_invoke_3(_QWORD *a1, void *a2, uint64_t a3, _QWORD *a4)
{
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  BOOL v13;
  uint64_t v14;
  uint64_t v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, void *);
  void *v19;
  id v20;
  id v21;

  v6 = a2;
  ++*(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24);
  v7 = (void *)a1[4];
  v8 = objc_opt_class();
  v21 = 0;
  v16 = MEMORY[0x1E0C809B0];
  v17 = 3221225472;
  v18 = __100__HDCloudSyncManager_Analytics___reportDailyAttachmentsAnalyticsForProfile_zoneID_repository_error___block_invoke_4;
  v19 = &unk_1E6CFA370;
  v9 = v6;
  v20 = v9;
  objc_msgSend(v7, "recordsForClass:error:filter:", v8, &v21, &v16);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v21;
  v12 = v11;
  if (v10)
    v13 = 1;
  else
    v13 = v11 == 0;
  v14 = v13;
  if (v13)
  {
    if (!objc_msgSend(v10, "count", v16, v17, v18, v19))
      ++*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24);
  }
  else if (a4)
  {
    *a4 = objc_retainAutorelease(v11);
  }
  else
  {
    _HKLogDroppedError();
  }

  return v14;
}

uint64_t __100__HDCloudSyncManager_Analytics___reportDailyAttachmentsAnalyticsForProfile_zoneID_repository_error___block_invoke_4(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "attachmentIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "attachmentIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqualToString:", v4);

  return v5;
}

uint64_t __100__HDCloudSyncManager_Analytics___reportDailyAttachmentsAnalyticsForProfile_zoneID_repository_error___block_invoke_5(uint64_t a1)
{
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return 1;
}

@end
