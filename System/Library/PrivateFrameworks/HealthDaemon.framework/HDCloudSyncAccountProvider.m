@implementation HDCloudSyncAccountProvider

- (HDCloudSyncAccountProvider)initWithCoordinator:(id)a3 behavior:(id)a4
{
  return -[HDCloudSyncAccountProvider initWithCoordinator:behavior:accountStore:](self, "initWithCoordinator:behavior:accountStore:", a3, a4, 0);
}

- (HDCloudSyncAccountProvider)initWithCoordinator:(id)a3 behavior:(id)a4 accountStore:(id)a5
{
  id v8;
  id v9;
  id v10;
  HDCloudSyncAccountProvider *v11;
  uint64_t v12;
  OS_dispatch_queue *queue;
  ACAccountStore *v14;
  ACAccountStore *lock_accountStore;
  id WeakRetained;
  void *v17;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)HDCloudSyncAccountProvider;
  v11 = -[HDCloudSyncAccountProvider init](&v19, sel_init);
  if (v11)
  {
    HKCreateSerialUtilityDispatchQueue();
    v12 = objc_claimAutoreleasedReturnValue();
    queue = v11->_queue;
    v11->_queue = (OS_dispatch_queue *)v12;

    objc_storeWeak((id *)&v11->_coordinator, v8);
    v11->_lock._os_unfair_lock_opaque = 0;
    if (v10)
      v14 = (ACAccountStore *)v10;
    else
      v14 = (ACAccountStore *)objc_alloc_init(MEMORY[0x1E0C8F2B8]);
    lock_accountStore = v11->_lock_accountStore;
    v11->_lock_accountStore = v14;

    objc_storeStrong((id *)&v11->_behavior, a4);
    WeakRetained = objc_loadWeakRetained((id *)&v11->_coordinator);
    objc_msgSend(WeakRetained, "daemon");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "registerDaemonReadyObserver:queue:", v11, v11->_queue);

  }
  return v11;
}

- (void)accountConfigurationDidChangeWithCompletion:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __74__HDCloudSyncAccountProvider_accountConfigurationDidChangeWithCompletion___block_invoke;
  block[3] = &unk_1E6CE9C08;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(queue, block);

}

uint64_t __74__HDCloudSyncAccountProvider_accountConfigurationDidChangeWithCompletion___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(WeakRetained, "periodicActivityScheduler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "updatePeriodicActivityCriteria");

  objc_msgSend(*(id *)(a1 + 32), "_resetCachedOwnerIdentifiers");
  objc_msgSend(*(id *)(a1 + 32), "_triggerSyncForAccountChange");
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (BOOL)isAccountInManateeUnavailableCFUState
{
  void *v2;
  BOOL v3;

  -[HDCloudSyncAccountProvider getPersistedAccountInfo](self, "getPersistedAccountInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (objc_msgSend(v2, "supportsDeviceToDeviceEncryption") & 1) == 0
    && (objc_msgSend(v2, "deviceToDeviceEncryptionAvailability") & 1) != 0;

  return v3;
}

- (BOOL)primaryAccountIsProhibitedFromCloudSync
{
  HDCloudSyncAccountProvider *v2;
  os_unfair_lock_s *p_lock;
  void *v4;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[ACAccountStore aa_primaryAppleAccount](v2->_lock_accountStore, "aa_primaryAppleAccount");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);
  LOBYTE(v2) = -[HDCloudSyncAccountProvider accountIsProhibitedFromCloudSync:](v2, "accountIsProhibitedFromCloudSync:", v4);

  return (char)v2;
}

- (void)disableSyncLocallyWithCompletion:(id)a3
{
  -[HDCloudSyncAccountProvider _setHealthAccountDataclassEnabled:completion:](self, "_setHealthAccountDataclassEnabled:completion:", 0, a3);
}

- (id)disableAndDeleteAllSyncDataWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  uint64_t v7;
  id v8;
  id WeakRetained;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v25;
  id v26;
  id obj;
  _QWORD v28[4];
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _QWORD v34[4];
  id v35;
  _QWORD v36[5];
  id v37;
  uint8_t v38[128];
  uint8_t buf[4];
  HDCloudSyncAccountProvider *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _HKInitializeLogging();
  v5 = *MEMORY[0x1E0CB5370];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v40 = self;
    _os_log_impl(&dword_1B7802000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: Beginning disable-and-delete operation for cloud sync.", buf, 0xCu);
  }
  v6 = objc_alloc_init(MEMORY[0x1E0D298C8]);
  v7 = MEMORY[0x1E0C809B0];
  v36[0] = MEMORY[0x1E0C809B0];
  v36[1] = 3221225472;
  v36[2] = __72__HDCloudSyncAccountProvider_disableAndDeleteAllSyncDataWithCompletion___block_invoke;
  v36[3] = &unk_1E6CEFB98;
  v36[4] = self;
  v26 = v4;
  v37 = v26;
  objc_msgSend(v6, "setDidFinish:", v36);
  objc_msgSend(v6, "beginTask");
  objc_msgSend(v6, "beginTask");
  v34[0] = v7;
  v34[1] = 3221225472;
  v34[2] = __72__HDCloudSyncAccountProvider_disableAndDeleteAllSyncDataWithCompletion___block_invoke_2;
  v34[3] = &unk_1E6CE77C8;
  v8 = v6;
  v35 = v8;
  -[HDCloudSyncAccountProvider disableSyncLocallyWithCompletion:](self, "disableSyncLocallyWithCompletion:", v34);
  WeakRetained = objc_loadWeakRetained((id *)&self->_coordinator);
  objc_msgSend(WeakRetained, "daemon");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "profileManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = v11;
  objc_msgSend(v11, "allProfileIdentifiers");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB38A8], "discreteProgressWithTotalUnitCount:", objc_msgSend(v12, "count"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  obj = v12;
  v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v31 != v16)
          objc_enumerationMutation(obj);
        v18 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * i);
        v19 = objc_loadWeakRetained((id *)&self->_coordinator);
        objc_msgSend(v19, "daemon");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "profileManager");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "profileForIdentifier:", v18);
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v8, "beginTask");
        v28[0] = MEMORY[0x1E0C809B0];
        v28[1] = 3221225472;
        v28[2] = __72__HDCloudSyncAccountProvider_disableAndDeleteAllSyncDataWithCompletion___block_invoke_3;
        v28[3] = &unk_1E6CE77C8;
        v29 = v8;
        -[HDCloudSyncAccountProvider _disableAndDeleteAllSyncDataForProfile:completion:](self, "_disableAndDeleteAllSyncDataForProfile:completion:", v22, v28);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "addChild:withPendingUnitCount:", v23, 1);

      }
      v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
    }
    while (v15);
  }

  objc_msgSend(v8, "finishTask");
  return v13;
}

void __72__HDCloudSyncAccountProvider_disableAndDeleteAllSyncDataWithCompletion___block_invoke(uint64_t a1, uint64_t a2, int a3, void *a4)
{
  id v6;
  void *v7;
  uint64_t v8;
  const __CFString *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  id v15;
  _QWORD v16[4];
  id v17;
  uint64_t v18;
  id v19;
  char v20;
  uint8_t buf[4];
  uint64_t v22;
  __int16 v23;
  const __CFString *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  _HKInitializeLogging();
  v7 = (void *)*MEMORY[0x1E0CB5370];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
  {
    v8 = *(_QWORD *)(a1 + 32);
    if (a3)
      v9 = CFSTR("YES");
    else
      v9 = CFSTR("NO");
    v10 = v7;
    objc_msgSend(v6, "firstObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v22 = v8;
    v23 = 2114;
    v24 = v9;
    v25 = 2114;
    v26 = v11;
    _os_log_impl(&dword_1B7802000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@: finish disableAndDeleteCloudSyncData: success (%{public}@), error (%{public}@)", buf, 0x20u);

  }
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __72__HDCloudSyncAccountProvider_disableAndDeleteAllSyncDataWithCompletion___block_invoke_193;
  v16[3] = &unk_1E6D01030;
  v12 = *(void **)(a1 + 32);
  v13 = *(id *)(a1 + 40);
  v20 = a3;
  v14 = *(_QWORD *)(a1 + 32);
  v17 = v6;
  v18 = v14;
  v19 = v13;
  v15 = v6;
  objc_msgSend(v12, "disableSyncLocallyWithCompletion:", v16);

}

void __72__HDCloudSyncAccountProvider_disableAndDeleteAllSyncDataWithCompletion___block_invoke_193(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  NSObject *v8;
  _QWORD v9[4];
  id v10;
  id v11;
  char v12;
  uint8_t buf[4];
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((a2 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "hk_removeObjectsForKeysWithPrefix:", CFSTR("HDLastLongTimeWithoutSuccessfulCloudSyncReportDate"));

    v7 = objc_alloc_init(MEMORY[0x1E0D298C8]);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __72__HDCloudSyncAccountProvider_disableAndDeleteAllSyncDataWithCompletion___block_invoke_195;
    v9[3] = &unk_1E6D01008;
    v11 = *(id *)(a1 + 48);
    v12 = *(_BYTE *)(a1 + 56);
    v10 = *(id *)(a1 + 32);
    objc_msgSend(v7, "setDidFinish:", v9);
    objc_msgSend(*(id *)(a1 + 40), "_rollOwnerDifferentiatorAfterCloudSyncDisableForAllProfiles:", v7);

  }
  else
  {
    _HKInitializeLogging();
    v8 = *MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v14 = v5;
      _os_log_error_impl(&dword_1B7802000, v8, OS_LOG_TYPE_ERROR, "Failed to disable cloud sync: %{public}@", buf, 0xCu);
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

void __72__HDCloudSyncAccountProvider_disableAndDeleteAllSyncDataWithCompletion___block_invoke_195(uint64_t a1, uint64_t a2, int a3, void *a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t);
  uint64_t v8;
  uint64_t v9;
  id v10;

  v4 = *(_QWORD *)(a1 + 40);
  if (a3)
  {
    v5 = *(unsigned __int8 *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 32), "firstObject");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(void (**)(uint64_t, uint64_t))(v4 + 16);
    v8 = v4;
    v9 = v5;
  }
  else
  {
    objc_msgSend(a4, "firstObject");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(void (**)(uint64_t, uint64_t))(v4 + 16);
    v8 = v4;
    v9 = 0;
  }
  v10 = (id)v6;
  v7(v8, v9);

}

uint64_t __72__HDCloudSyncAccountProvider_disableAndDeleteAllSyncDataWithCompletion___block_invoke_2(uint64_t a1, int a2)
{
  void *v2;

  v2 = *(void **)(a1 + 32);
  if (a2)
    return objc_msgSend(v2, "finishTask");
  else
    return objc_msgSend(v2, "failTaskWithError:");
}

uint64_t __72__HDCloudSyncAccountProvider_disableAndDeleteAllSyncDataWithCompletion___block_invoke_3(uint64_t a1, int a2)
{
  void *v2;

  v2 = *(void **)(a1 + 32);
  if (a2)
    return objc_msgSend(v2, "finishTask");
  else
    return objc_msgSend(v2, "failTaskWithError:");
}

- (void)enableSyncLocallyWithCompletion:(id)a3
{
  -[HDCloudSyncAccountProvider _setHealthAccountDataclassEnabled:completion:](self, "_setHealthAccountDataclassEnabled:completion:", 1, a3);
}

- (BOOL)accountIsProhibitedFromCloudSync:(id)a3
{
  return objc_msgSend(a3, "aa_isManagedAppleID");
}

- (BOOL)computeCanPerformCloudSyncForPrimaryAccount:(id *)a3
{
  os_unfair_lock_s *p_lock;
  void *v6;
  BOOL v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  char v14;
  void *v16;
  const __CFString *v17;
  const __CFString *v18;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[ACAccountStore aa_primaryAppleAccount](self->_lock_accountStore, "aa_primaryAppleAccount");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);
  if (!-[HDCloudSyncAccountProvider accountIsProhibitedFromCloudSync:](self, "accountIsProhibitedFromCloudSync:", v6))
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKey:", *MEMORY[0x1E0CB7710]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v6, "isEnabledForDataclass:", *MEMORY[0x1E0C8F3B0]) & 1) != 0)
    {
      if ((objc_msgSend(MEMORY[0x1E0CB6F50], "usingDemoDataDatabase") & 1) != 0)
        v10 = 0;
      else
        v10 = -[_HKBehavior isRunningStoreDemoMode](self->_behavior, "isRunningStoreDemoMode") ^ 1;
      objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "BOOLForKey:", CFSTR("HealthCloudSyncForDemoDataKey"));

      if ((v10 & 1) != 0 || (v14 & 1) != 0)
      {
        if (v9 && (objc_msgSend(v9, "BOOLValue") & 1) == 0)
        {
          v16 = (void *)MEMORY[0x1E0CB35C8];
          v17 = CFSTR("Cloud sync disabled by switch: Internal Settings > Health > Cloud Sync Enabled");
        }
        else
        {
          if ((-[_HKBehavior supportsCloudSync](self->_behavior, "supportsCloudSync") & 1) != 0)
          {
            v7 = 1;
            goto LABEL_13;
          }
          v16 = (void *)MEMORY[0x1E0CB35C8];
          v17 = CFSTR("Cloud sync not supported on this device.");
        }
        objc_msgSend(v16, "hk_assignError:code:description:", a3, 701, v17);
LABEL_12:
        v7 = 0;
LABEL_13:

        goto LABEL_14;
      }
      v11 = (void *)MEMORY[0x1E0CB35C8];
      v18 = CFSTR("HealthCloudSyncForDemoDataKey");
      v12 = CFSTR("Cloud sync disabled: Demo data is enabled but sync for demo data default (%@) is not set.");
    }
    else
    {
      v11 = (void *)MEMORY[0x1E0CB35C8];
      v12 = CFSTR("Health cloud sync is disabled for this Apple ID.");
    }
    objc_msgSend(v11, "hk_assignError:code:format:", a3, 701, v12, v18);
    goto LABEL_12;
  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a3, 701, CFSTR("Managed Apple IDs are not permitted to participate in cloud sync."));
  v7 = 0;
LABEL_14:

  return v7;
}

- (id)getPersistedAccountInfo
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  id v8;
  uint8_t buf[4];
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("HDCloudSyncAccountInfo"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v8 = 0;
    objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v3, &v8);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v8;
    if (!v4)
    {
      _HKInitializeLogging();
      v6 = *MEMORY[0x1E0CB5370];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v10 = v5;
        _os_log_error_impl(&dword_1B7802000, v6, OS_LOG_TYPE_ERROR, "Failed to decode persisted CK account info: %{public}@", buf, 0xCu);
      }
    }

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)_resetCachedOwnerIdentifiers
{
  HDCloudSyncManagerDiscardCachedOwnerIdentifiersTask *v3;
  id WeakRetained;
  void *v5;
  id v6;
  HDCloudSyncManagerDiscardCachedOwnerIdentifiersTask *v7;

  v3 = [HDCloudSyncManagerDiscardCachedOwnerIdentifiersTask alloc];
  self = (HDCloudSyncAccountProvider *)((char *)self + 8);
  WeakRetained = objc_loadWeakRetained((id *)&self->super.isa);
  objc_msgSend(WeakRetained, "daemon");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HDCloudSyncManagerDiscardCachedOwnerIdentifiersTask initWithDaemon:](v3, "initWithDaemon:", v5);

  -[HDCloudSyncManagerTask setPriority:](v7, "setPriority:", 1000);
  v6 = objc_loadWeakRetained((id *)&self->super.isa);
  objc_msgSend(v6, "addManagerTask:", v7);

}

- (id)_disableAndDeleteAllSyncDataForProfile:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, uint64_t, _QWORD);
  id WeakRetained;
  char v9;
  void *v10;
  void *v11;
  void *v12;

  v6 = a3;
  v7 = (void (**)(id, uint64_t, _QWORD))a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_coordinator);
  v9 = objc_msgSend(WeakRetained, "shouldSyncProfile:", v6);

  if ((v9 & 1) != 0 && v6)
  {
    objc_msgSend(v6, "cloudSyncManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
    {
      objc_msgSend(v10, "disableAndDeleteAllSyncDataWithCompletion:", v7);
    }
    else
    {
      v7[2](v7, 1, 0);
      objc_msgSend(MEMORY[0x1E0CB38A8], "hk_finishedDiscreteProgressWithTotalUnitCount:", 1);
    }
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7[2](v7, 1, 0);
    objc_msgSend(MEMORY[0x1E0CB38A8], "hk_finishedDiscreteProgressWithTotalUnitCount:", 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v12;
}

- (void)_setHealthAccountDataclassEnabled:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  id v6;
  ACAccountStore *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[5];
  id v12;
  BOOL v13;

  v4 = a3;
  v6 = a4;
  os_unfair_lock_lock(&self->_lock);
  v7 = self->_lock_accountStore;
  os_unfair_lock_unlock(&self->_lock);
  -[ACAccountStore aa_primaryAppleAccount](v7, "aa_primaryAppleAccount");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "setEnabled:forDataclass:", v4, *MEMORY[0x1E0C8F3B0]);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __75__HDCloudSyncAccountProvider__setHealthAccountDataclassEnabled_completion___block_invoke;
    v11[3] = &unk_1E6D01058;
    v11[4] = self;
    v13 = v4;
    v12 = v6;
    -[ACAccountStore saveAccount:withCompletionHandler:](v7, "saveAccount:withCompletionHandler:", v9, v11);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:format:", 100, CFSTR("cannot set Health dataclass enabled state because the primary account is nil"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v6 + 2))(v6, 0, v10);

  }
}

void __75__HDCloudSyncAccountProvider__setHealthAccountDataclassEnabled_completion___block_invoke(uint64_t a1, int a2, void *a3)
{
  __CFString *v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  const __CFString *v9;
  const __CFString *v10;
  uint64_t v11;
  const __CFString *v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  const __CFString *v17;
  __int16 v18;
  const __CFString *v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  _HKInitializeLogging();
  v6 = *MEMORY[0x1E0CB5370];
  v7 = *MEMORY[0x1E0CB5370];
  if (a2)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(_QWORD *)(a1 + 32);
      if (*(_BYTE *)(a1 + 48))
        v9 = CFSTR("YES");
      else
        v9 = CFSTR("NO");
      v10 = (const __CFString *)*MEMORY[0x1E0C8F3B0];
      v14 = 138543874;
      v15 = v8;
      v16 = 2114;
      v17 = v9;
      v18 = 2114;
      v19 = v10;
      _os_log_impl(&dword_1B7802000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: set enabled = %{public}@ for dataclass %{public}@", (uint8_t *)&v14, 0x20u);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    v11 = *(_QWORD *)(a1 + 32);
    if (*(_BYTE *)(a1 + 48))
      v12 = CFSTR("YES");
    else
      v12 = CFSTR("NO");
    v13 = *MEMORY[0x1E0C8F3B0];
    v14 = 138544130;
    v15 = v11;
    v16 = 2114;
    v17 = v5;
    v18 = 2114;
    v19 = v12;
    v20 = 2114;
    v21 = v13;
    _os_log_error_impl(&dword_1B7802000, v6, OS_LOG_TYPE_ERROR, "%{public}@: error %{public}@ trying to set enabled = %{public}@ for dataclass %{public}@", (uint8_t *)&v14, 0x2Au);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)_rollOwnerDifferentiatorAfterCloudSyncDisableForAllProfiles:(id)a3
{
  id v4;
  HDCloudSyncCoordinator **p_coordinator;
  id WeakRetained;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "beginTask");
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  p_coordinator = &self->_coordinator;
  WeakRetained = objc_loadWeakRetained((id *)p_coordinator);
  objc_msgSend(WeakRetained, "daemon");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "profileManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "allProfileIdentifiers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v25;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v25 != v12)
          objc_enumerationMutation(v9);
        v14 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * v13);
        v15 = objc_loadWeakRetained((id *)p_coordinator);
        objc_msgSend(v15, "daemon");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "profileManager");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "profileForIdentifier:", v14);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        if (v18)
        {
          objc_msgSend(v4, "beginTask");
          objc_msgSend(v18, "cloudSyncManager");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "ownerIdentifierManager");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21[0] = MEMORY[0x1E0C809B0];
          v21[1] = 3221225472;
          v21[2] = __90__HDCloudSyncAccountProvider__rollOwnerDifferentiatorAfterCloudSyncDisableForAllProfiles___block_invoke;
          v21[3] = &unk_1E6CEB718;
          v22 = v18;
          v23 = v4;
          objc_msgSend(v20, "rollOwnerDifferentiatorAfterCloudSyncDisableWithCompletion:", v21);

        }
        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v11);
  }

  objc_msgSend(v4, "finishTask");
}

void __90__HDCloudSyncAccountProvider__rollOwnerDifferentiatorAfterCloudSyncDisableForAllProfiles___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  _HKInitializeLogging();
  v6 = *MEMORY[0x1E0CB5370];
  v7 = *MEMORY[0x1E0CB5370];
  if (a2)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(_QWORD *)(a1 + 32);
      v10 = 138543362;
      v11 = v8;
      _os_log_impl(&dword_1B7802000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: Updated owner identifier after disabling cloud sync.", (uint8_t *)&v10, 0xCu);
    }
    objc_msgSend(*(id *)(a1 + 40), "finishTask");
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v9 = *(_QWORD *)(a1 + 32);
      v10 = 138543618;
      v11 = v9;
      v12 = 2114;
      v13 = v5;
      _os_log_error_impl(&dword_1B7802000, v6, OS_LOG_TYPE_ERROR, "%{public}@: Failed to update owner differentiator after disabling cloud sync: %{public}@.", (uint8_t *)&v10, 0x16u);
    }
    objc_msgSend(*(id *)(a1 + 40), "failTaskWithError:", v5);
  }

}

- (void)_triggerSyncForAccountChange
{
  NSObject *v3;
  int v4;
  HDCloudSyncAccountProvider *v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  _HKInitializeLogging();
  v3 = *MEMORY[0x1E0CB5370];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
  {
    v4 = 138543618;
    v5 = self;
    v6 = 2048;
    v7 = 0x404E000000000000;
    _os_log_impl(&dword_1B7802000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: Scheduling post-account-change sync with grace period %lf", (uint8_t *)&v4, 0x16u);
  }
  -[HDXPCGatedActivity requestRunWithMaximumDelay:completion:](self->_accountChangeGatedSyncActivity, "requestRunWithMaximumDelay:completion:", &__block_literal_global_178, 60.0);
}

- (BOOL)_shouldPerformFullSyncOnAccountChange
{
  return -[_HKBehavior supportsPeriodicFullCloudSync](self->_behavior, "supportsPeriodicFullCloudSync");
}

- (void)_performSyncForAccountChangeWithCompletion:(id)a3
{
  NSObject *queue;
  id v5;
  _QWORD block[5];
  id v7;

  v5 = a3;
  if (-[HDCloudSyncAccountProvider _shouldPerformFullSyncOnAccountChange](self, "_shouldPerformFullSyncOnAccountChange"))
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __73__HDCloudSyncAccountProvider__performSyncForAccountChangeWithCompletion___block_invoke;
    block[3] = &unk_1E6CE9C08;
    block[4] = self;
    v7 = v5;
    dispatch_sync(queue, block);

  }
  else
  {
    (*((void (**)(id, _QWORD, _QWORD))v5 + 2))(v5, 0, 0);
  }

}

void __73__HDCloudSyncAccountProvider__performSyncForAccountChangeWithCompletion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  id v5;
  id WeakRetained;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;
  uint8_t buf[4];
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  _HKInitializeLogging();
  v2 = *MEMORY[0x1E0CB5370];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    v14 = v3;
    _os_log_impl(&dword_1B7802000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@: Cloud sync triggered by account changes (iCloud login or health dataclass enabled)", buf, 0xCu);
  }
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[HDCloudSyncContext initForPurpose:options:reason:xpcActivity:]([HDCloudSyncContext alloc], "initForPurpose:options:reason:xpcActivity:", 0, 0, 2, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40));
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __73__HDCloudSyncAccountProvider__performSyncForAccountChangeWithCompletion___block_invoke_219;
  v10[3] = &unk_1E6CE7868;
  v7 = *(void **)(a1 + 40);
  v10[4] = *(_QWORD *)(a1 + 32);
  v11 = v4;
  v12 = v7;
  v8 = v4;
  v9 = (id)objc_msgSend(WeakRetained, "syncAllProfilesWithContext:completion:", v5, v10);

}

void __73__HDCloudSyncAccountProvider__performSyncForAccountChangeWithCompletion___block_invoke_219(_QWORD *a1, char a2, void *a3)
{
  id v5;
  double v6;
  uint64_t v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  double v12;
  id WeakRetained;
  void *v14;
  id v15;

  v5 = a3;
  v6 = 0.0;
  v15 = v5;
  if ((a2 & 1) != 0)
  {
    v7 = 0;
    goto LABEL_12;
  }
  objc_msgSend(v5, "domain");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0C947D8]);

  if (v9)
  {
    if (objc_msgSend(v15, "code") == 6 || objc_msgSend(v15, "code") == 7)
    {
      objc_msgSend(v15, "userInfo");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x1E0C94808]);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "doubleValue");
      v6 = v12;

    }
    goto LABEL_11;
  }
  if (!objc_msgSend(v15, "hk_isHealthKitError"))
  {
LABEL_11:
    v7 = 3;
    goto LABEL_12;
  }
  if (objc_msgSend(v15, "code") == 701)
    v7 = 2;
  else
    v7 = 3;
LABEL_12:
  WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 8));
  objc_msgSend(WeakRetained, "periodicActivityScheduler");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "updatePeriodicActivitesWithResult:minimumRetryInterval:activityStartDate:error:", v7, a1[5], v15, v6);

  (*(void (**)(void))(a1[6] + 16))();
}

- (void)unitTest_setAccountStore:(id)a3
{
  ACAccountStore *v4;
  ACAccountStore *lock_accountStore;

  v4 = (ACAccountStore *)a3;
  os_unfair_lock_lock(&self->_lock);
  lock_accountStore = self->_lock_accountStore;
  self->_lock_accountStore = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)profileDidBecomeReady:(id)a3
{
  id v4;
  xpc_object_t empty;
  id v6;
  uint64_t v7;
  HDXPCGatedActivity *v8;
  HDXPCGatedActivity *accountChangeGatedSyncActivity;
  _QWORD v10[4];
  id v11;
  id location;

  v4 = a3;
  empty = xpc_dictionary_create_empty();
  xpc_dictionary_set_BOOL(empty, (const char *)*MEMORY[0x1E0C808B8], 1);
  xpc_dictionary_set_BOOL(empty, (const char *)*MEMORY[0x1E0C808D0], 1);
  xpc_dictionary_set_BOOL(empty, (const char *)*MEMORY[0x1E0C808A0], 1);
  xpc_dictionary_set_string(empty, (const char *)*MEMORY[0x1E0C80878], (const char *)*MEMORY[0x1E0C80888]);
  xpc_dictionary_set_BOOL(empty, (const char *)*MEMORY[0x1E0C80758], 1);
  xpc_dictionary_set_int64(empty, (const char *)*MEMORY[0x1E0C80818], 263192576);
  _HKInitializeLogging();
  objc_initWeak(&location, self);
  v6 = objc_alloc(MEMORY[0x1E0D298F8]);
  v7 = *MEMORY[0x1E0CB5370];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __52__HDCloudSyncAccountProvider_profileDidBecomeReady___block_invoke;
  v10[3] = &unk_1E6CEFA88;
  objc_copyWeak(&v11, &location);
  v8 = (HDXPCGatedActivity *)objc_msgSend(v6, "initWithName:criteria:loggingCategory:handler:", CFSTR("com.apple.healthd.sync.accountChange"), empty, v7, v10);
  accountChangeGatedSyncActivity = self->_accountChangeGatedSyncActivity;
  self->_accountChangeGatedSyncActivity = v8;

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

}

void __52__HDCloudSyncAccountProvider_profileDidBecomeReady___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id *v4;
  id v5;
  id WeakRetained;

  v4 = (id *)(a1 + 32);
  v5 = a4;
  WeakRetained = objc_loadWeakRetained(v4);
  objc_msgSend(WeakRetained, "_performSyncForAccountChangeWithCompletion:", v5);

}

- (void)daemonReady:(id)a3
{
  void *v4;
  void *v5;
  id WeakRetained;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  WeakRetained = objc_loadWeakRetained((id *)&self->_coordinator);
  objc_msgSend(WeakRetained, "daemon");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "primaryProfile");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "registerProfileReadyObserver:queue:", self, self->_queue);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_accountChangeGatedSyncActivity, 0);
  objc_storeStrong((id *)&self->_lock_accountStore, 0);
  objc_storeStrong((id *)&self->_behavior, 0);
  objc_destroyWeak((id *)&self->_coordinator);
}

@end
