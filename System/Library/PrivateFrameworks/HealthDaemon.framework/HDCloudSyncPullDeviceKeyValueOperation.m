@implementation HDCloudSyncPullDeviceKeyValueOperation

- (HDCloudSyncPullDeviceKeyValueOperation)initWithConfiguration:(id)a3 cloudState:(id)a4
{
  void *v5;
  uint64_t v6;
  void *v7;

  v5 = (void *)MEMORY[0x1E0C99DA0];
  v6 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "raise:format:", v6, CFSTR("The -%@ method is not available on %@"), v7, objc_opt_class());

  return 0;
}

- (HDCloudSyncPullDeviceKeyValueOperation)initWithConfiguration:(id)a3 container:(id)a4
{
  id v7;
  HDCloudSyncPullDeviceKeyValueOperation *v8;
  HDCloudSyncPullDeviceKeyValueOperation *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)HDCloudSyncPullDeviceKeyValueOperation;
  v8 = -[HDCloudSyncOperation initWithConfiguration:cloudState:](&v11, sel_initWithConfiguration_cloudState_, a3, 0);
  v9 = v8;
  if (v8)
    objc_storeStrong((id *)&v8->_container, a4);

  return v9;
}

- (BOOL)performWithError:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  HDIngestDeviceKeyValueEntriesOperation *v10;
  void *v11;
  void *v12;
  void *v13;
  HDIngestDeviceKeyValueEntriesOperation *v14;
  void *v15;
  _BOOL4 v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v22;
  CKContainer *container;
  NSObject *v24;
  void *v25;
  id v26;
  uint8_t buf[4];
  HDCloudSyncPullDeviceKeyValueOperation *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  -[HDCloudSyncOperation configuration](self, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cachedCloudState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKContainer containerIdentifier](self->_container, "containerIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0;
  objc_msgSend(v6, "contextSyncZoneForContainerID:error:", v7, &v26);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v26;

  if (v8)
  {
    v10 = [HDIngestDeviceKeyValueEntriesOperation alloc];
    -[HDCloudSyncOperation configuration](self, "configuration");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "accessibilityAssertion");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKContainer containerIdentifier](self->_container, "containerIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[HDIngestDeviceKeyValueEntriesOperation initWithAccessibilityAssertion:containerIdentifier:](v10, "initWithAccessibilityAssertion:containerIdentifier:", v12, v13);

    -[HDCloudSyncOperation profile](self, "profile");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[HDJournalableOperation performOrJournalWithProfile:error:](v14, "performOrJournalWithProfile:error:", v15, a3);

    if (v16)
    {
      if (-[HDJournalableOperation didJournal](v14, "didJournal"))
      {
        _HKInitializeLogging();
        v17 = (void *)*MEMORY[0x1E0CB5370];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
        {
          v18 = v17;
          -[HDCloudSyncOperation profile](self, "profile");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          -[CKContainer containerIdentifier](self->_container, "containerIdentifier");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v28 = self;
          v29 = 2114;
          v30 = v19;
          v31 = 2114;
          v32 = v20;
          _os_log_impl(&dword_1B7802000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@: Journaled device contexts for profile: %{public}@, container identifier: %{public}@", buf, 0x20u);

        }
      }
    }

  }
  else if (v9)
  {
    if (a3)
    {
      LOBYTE(v16) = 0;
      *a3 = objc_retainAutorelease(v9);
    }
    else
    {
      _HKLogDroppedError();
      LOBYTE(v16) = 0;
    }
  }
  else
  {
    _HKInitializeLogging();
    v22 = (void *)*MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
    {
      container = self->_container;
      v24 = v22;
      -[CKContainer containerIdentifier](container, "containerIdentifier");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v28 = self;
      v29 = 2114;
      v30 = v25;
      _os_log_impl(&dword_1B7802000, v24, OS_LOG_TYPE_DEFAULT, "%{public}@: Context sync zone not present for container identifier: %{public}@", buf, 0x16u);

    }
    LOBYTE(v16) = 1;
  }

  return v16;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_container, 0);
  objc_storeStrong((id *)&self->_contextSyncZone, 0);
}

@end
