@implementation HDCloudSyncRegisterSubscriptionsOperation

- (HDCloudSyncRegisterSubscriptionsOperation)initWithConfiguration:(id)a3 cloudState:(id)a4
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

- (HDCloudSyncRegisterSubscriptionsOperation)initWithConfiguration:(id)a3 cloudState:(id)a4 container:(id)a5 subscriptions:(id)a6
{
  id v11;
  id v12;
  HDCloudSyncRegisterSubscriptionsOperation *v13;
  uint64_t v14;
  NSDictionary *subscriptions;
  objc_super v17;

  v11 = a5;
  v12 = a6;
  v17.receiver = self;
  v17.super_class = (Class)HDCloudSyncRegisterSubscriptionsOperation;
  v13 = -[HDCloudSyncOperation initWithConfiguration:cloudState:](&v17, sel_initWithConfiguration_cloudState_, a3, a4);
  if (v13)
  {
    v14 = objc_msgSend(v12, "copy");
    subscriptions = v13->_subscriptions;
    v13->_subscriptions = (NSDictionary *)v14;

    objc_storeStrong((id *)&v13->_container, a5);
  }

  return v13;
}

- (void)main
{
  id v3;
  void *v4;
  void *v5;
  CKContainer *container;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, void *, void *);
  void *v18;
  HDCloudSyncRegisterSubscriptionsOperation *v19;
  id v20;
  uint8_t buf[4];
  HDCloudSyncRegisterSubscriptionsOperation *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (-[NSDictionary count](self->_subscriptions, "count"))
  {
    v3 = objc_alloc(MEMORY[0x1E0C94E60]);
    -[NSDictionary allKeys](self->_subscriptions, "allKeys");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v3, "initWithSubscriptionIDs:", v4);

    container = self->_container;
    -[HDCloudSyncOperation configuration](self, "configuration");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "repository");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "profileIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    HDDatabaseForContainer(container, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = MEMORY[0x1E0C809B0];
    v16 = 3221225472;
    v17 = __49__HDCloudSyncRegisterSubscriptionsOperation_main__block_invoke;
    v18 = &unk_1E6D0B540;
    v19 = self;
    v20 = v10;
    v11 = v10;
    objc_msgSend(v5, "setFetchSubscriptionCompletionBlock:", &v15);
    -[HDCloudSyncOperation configuration](self, "configuration", v15, v16, v17, v18, v19);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "operationGroup");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setGroup:", v13);

    objc_msgSend(v11, "addOperation:", v5);
  }
  else
  {
    _HKInitializeLogging();
    v14 = *MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v22 = self;
      _os_log_impl(&dword_1B7802000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@: No subscriptions to register.", buf, 0xCu);
    }
    -[HDCloudSyncOperation finishWithSuccess:error:](self, "finishWithSuccess:error:", 1, 0);
  }
}

void __49__HDCloudSyncRegisterSubscriptionsOperation_main__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  NSObject *v23;
  uint64_t v24;
  _QWORD v25[4];
  id v26;
  _QWORD v27[5];
  id v28;
  _BYTE buf[24];
  void *v30;
  void *v31;
  char *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v6 && (objc_msgSend(v6, "hk_isErrorInDomain:code:", *MEMORY[0x1E0C947D8], 2) & 1) == 0)
  {
    _HKInitializeLogging();
    v23 = *MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
    {
      v24 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v24;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v7;
      _os_log_error_impl(&dword_1B7802000, v23, OS_LOG_TYPE_ERROR, "%{public}@: Failed to look up subscriptions: %{public}@", buf, 0x16u);
    }
    objc_msgSend(*(id *)(a1 + 32), "finishWithSuccess:error:", 0, v7);
  }
  else
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "allKeys");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = MEMORY[0x1E0C809B0];
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __49__HDCloudSyncRegisterSubscriptionsOperation_main__block_invoke_186;
    v25[3] = &unk_1E6D0B518;
    v26 = v5;
    objc_msgSend(v8, "hk_filter:", v25);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v10, "count"))
    {
      _HKInitializeLogging();
      v11 = (void *)*MEMORY[0x1E0CB5370];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
      {
        v12 = *(_QWORD *)(a1 + 32);
        v13 = v11;
        v14 = objc_msgSend(v10, "count");
        objc_msgSend(v10, "componentsJoinedByString:", CFSTR(", "));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        *(_QWORD *)&buf[4] = v12;
        *(_WORD *)&buf[12] = 2048;
        *(_QWORD *)&buf[14] = v14;
        *(_WORD *)&buf[22] = 2112;
        v30 = v15;
        _os_log_impl(&dword_1B7802000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: Missing %ld subscriptions: %@", buf, 0x20u);

      }
      v16 = *(void **)(a1 + 32);
      v17 = *(id *)(a1 + 40);
      if (v16)
      {
        *(_QWORD *)buf = v9;
        *(_QWORD *)&buf[8] = 3221225472;
        *(_QWORD *)&buf[16] = __90__HDCloudSyncRegisterSubscriptionsOperation__registerSubscriptionsWithIdentifer_database___block_invoke;
        v30 = &unk_1E6D0B568;
        v31 = v16;
        v32 = sel__registerSubscriptionsWithIdentifer_database_;
        objc_msgSend(v10, "hk_map:", buf);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C94F28]), "initWithSubscriptionsToSave:subscriptionIDsToDelete:", v18, 0);
        v27[0] = v9;
        v27[1] = 3221225472;
        v27[2] = __90__HDCloudSyncRegisterSubscriptionsOperation__registerSubscriptionsWithIdentifer_database___block_invoke_2;
        v27[3] = &unk_1E6D0B590;
        v27[4] = v16;
        v20 = v17;
        v28 = v20;
        objc_msgSend(v19, "setModifySubscriptionsCompletionBlock:", v27);
        objc_msgSend(v16, "configuration");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "operationGroup");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setGroup:", v22);

        objc_msgSend(v20, "addOperation:", v19);
      }

    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "finishWithSuccess:error:", 1, 0);
    }

  }
}

BOOL __49__HDCloudSyncRegisterSubscriptionsOperation_main__block_invoke_186(uint64_t a1, uint64_t a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 == 0;

  return v3;
}

id __90__HDCloudSyncRegisterSubscriptionsOperation__registerSubscriptionsWithIdentifer_database___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  __CFString *v4;
  objc_class *v5;
  id v6;
  __CFString *v7;
  void *v8;
  id v9;
  __CFString *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v22;

  v3 = a2;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "objectForKeyedSubscript:", v3);
  v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), CFSTR("HDCloudSyncRegisterSubscriptionsOperation.m"), 86, CFSTR("Record type nil for subscription after validation."));

  }
  if (v4 != CFSTR("CloudSyncStateRecord"))
  {
    v5 = (objc_class *)MEMORY[0x1E0C94CB8];
    v6 = v3;
    v7 = v4;
    v8 = (void *)objc_msgSend([v5 alloc], "initWithSubscriptionID:", v6);
    objc_msgSend(v8, "setRecordType:", v7);

    v9 = objc_alloc_init(MEMORY[0x1E0C94F50]);
    objc_msgSend(v9, "setAlertBody:", v6);

    objc_msgSend(v8, "setNotificationInfo:", v9);
LABEL_7:

    goto LABEL_8;
  }
  v8 = *(void **)(a1 + 32);
  if (v8)
  {
    v10 = CFSTR("CloudSyncStateRecord");
    v11 = v3;
    objc_msgSend(v8, "profile");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "daemon");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "cloudSyncCoordinator");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stateSyncDomainForSubscriptionIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectForKeyedSubscript:", v11);
    v9 = (id)objc_claimAutoreleasedReturnValue();

    v16 = (void *)MEMORY[0x1E0C95098];
    objc_msgSend(v8, "configuration");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "syncContainerPrefix");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "hd_stateSyncZoneIDForSyncCircleIdentifier:domain:", v18, v9);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C950B0]), "initWithZoneID:subscriptionID:", v19, v11);
    objc_msgSend(v8, "setRecordType:", v10);

    v20 = objc_alloc_init(MEMORY[0x1E0C94F50]);
    objc_msgSend(v20, "setAlertBody:", v11);

    objc_msgSend(v8, "setNotificationInfo:", v20);
    goto LABEL_7;
  }
LABEL_8:

  return v8;
}

void __90__HDCloudSyncRegisterSubscriptionsOperation__registerSubscriptionsWithIdentifer_database___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  _HKInitializeLogging();
  v6 = *MEMORY[0x1E0CB5370];
  v7 = *MEMORY[0x1E0CB5370];
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v13 = *(_QWORD *)(a1 + 32);
      v14 = *(_QWORD *)(a1 + 40);
      v15 = 138543874;
      v16 = v13;
      v17 = 2114;
      v18 = v14;
      v19 = 2114;
      v20 = v5;
      _os_log_error_impl(&dword_1B7802000, v6, OS_LOG_TYPE_ERROR, "%{public}@ Error saving subscriptions in database %{public}@, error: %{public}@", (uint8_t *)&v15, 0x20u);
    }
    v8 = *(void **)(a1 + 32);
    v9 = 0;
    v10 = v5;
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v11 = *(_QWORD *)(a1 + 32);
      v12 = *(_QWORD *)(a1 + 40);
      v15 = 138543618;
      v16 = v11;
      v17 = 2114;
      v18 = v12;
      _os_log_impl(&dword_1B7802000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ Successfully saved subscriptions in database %{public}@", (uint8_t *)&v15, 0x16u);
    }
    v8 = *(void **)(a1 + 32);
    v9 = 1;
    v10 = 0;
  }
  objc_msgSend(v8, "finishWithSuccess:error:", v9, v10);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_container, 0);
  objc_storeStrong((id *)&self->_subscriptions, 0);
}

@end
