@implementation HDWatchSettingsReconciliationManager

- (HDWatchSettingsReconciliationManager)initWithProfile:(id)a3 userDefaults:(id)a4 managedKeys:(id)a5 debugIdentifier:(id)a6 loggingCategory:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  HDWatchSettingsReconciliationManager *v17;
  uint64_t v18;
  OS_dispatch_queue *queue;
  id WeakRetained;
  void *v22;
  id v24;
  objc_super v25;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v25.receiver = self;
  v25.super_class = (Class)HDWatchSettingsReconciliationManager;
  v17 = -[HDWatchSettingsReconciliationManager init](&v25, sel_init);
  if (v17)
  {
    v24 = v13;
    if (objc_msgSend(v12, "profileType") != 1)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, v17, CFSTR("HDWatchSettingsReconciliationManager.m"), 44, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("profile.profileType == HKProfileTypePrimary"));

    }
    objc_storeWeak((id *)&v17->_profile, v12);
    HKCreateSerialDispatchQueue();
    v18 = objc_claimAutoreleasedReturnValue();
    queue = v17->_queue;
    v17->_queue = (OS_dispatch_queue *)v18;

    objc_storeStrong((id *)&v17->_userDefaults, a4);
    objc_storeStrong((id *)&v17->_managedKeys, a5);
    objc_storeStrong((id *)&v17->_debugIdentifier, a6);
    objc_storeStrong((id *)&v17->_loggingCategory, a7);
    -[HDWatchSettingsReconciliationManager _startKeyValueObserving](v17, "_startKeyValueObserving");
    WeakRetained = objc_loadWeakRetained((id *)&v17->_profile);
    objc_msgSend(WeakRetained, "registerProfileReadyObserver:queue:", v17, v17->_queue);

    v13 = v24;
  }

  return v17;
}

- (void)_startKeyValueObserving
{
  NSArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSUserDefaults *userDefaults;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = self->_managedKeys;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        userDefaults = self->_userDefaults;
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v7), "defaultsEnabledKey", (_QWORD)v10);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSUserDefaults addObserver:forKeyPath:options:context:](userDefaults, "addObserver:forKeyPath:options:context:", self, v9, 3, 0);

        ++v7;
      }
      while (v5 != v7);
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

}

- (void)dealloc
{
  NSArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id WeakRetained;
  void *v10;
  void *v11;
  NSUserDefaults *userDefaults;
  void *v13;
  objc_super v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v3 = self->_managedKeys;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v16;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v16 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v7);
        WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
        objc_msgSend(WeakRetained, "featureSettingsManager");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "featureIdentifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "unregisterObserver:featureIdentifier:", self, v11);

        userDefaults = self->_userDefaults;
        objc_msgSend(v8, "defaultsEnabledKey");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSUserDefaults removeObserver:forKeyPath:](userDefaults, "removeObserver:forKeyPath:", self, v13);

        ++v7;
      }
      while (v5 != v7);
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v5);
  }

  v14.receiver = self;
  v14.super_class = (Class)HDWatchSettingsReconciliationManager;
  -[HDWatchSettingsReconciliationManager dealloc](&v14, sel_dealloc);
}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@:%@>"), objc_opt_class(), self->_debugIdentifier);
}

- (void)profileDidBecomeReady:(id)a3
{
  id v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id WeakRetained;
  void *v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = self->_managedKeys;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v9);
        WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
        objc_msgSend(WeakRetained, "featureSettingsManager", (_QWORD)v15);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "featureIdentifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "registerObserver:featureIdentifier:queue:", self, v13, self->_queue);

        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }

  objc_msgSend(v4, "daemon");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "registerDaemonReadyObserver:queue:", self, self->_queue);

}

- (void)daemonReady:(id)a3
{
  id WeakRetained;
  void *v5;
  OS_dispatch_queue *queue;
  _QWORD v7[5];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "database");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __52__HDWatchSettingsReconciliationManager_daemonReady___block_invoke;
  v7[3] = &unk_1E6CE80E8;
  v7[4] = self;
  objc_msgSend(v5, "performWhenDataProtectedByFirstUnlockIsAvailableOnQueue:block:", queue, v7);

}

void __52__HDWatchSettingsReconciliationManager_daemonReady___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[5];

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(WeakRetained, "daemon");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "maintenanceWorkCoordinator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(_QWORD *)(v6 + 16);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __52__HDWatchSettingsReconciliationManager_daemonReady___block_invoke_2;
  v9[3] = &unk_1E6CE80E8;
  v9[4] = v6;
  +[HDMaintenanceOperation maintenanceOperationWithName:queue:synchronousBlock:](HDMaintenanceOperation, "maintenanceOperationWithName:queue:synchronousBlock:", v5, v7, v9);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "enqueueMaintenanceOperation:", v8);

}

uint64_t __52__HDWatchSettingsReconciliationManager_daemonReady___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_reconcileValuesForAllKeys");
}

- (void)featureSettingsManager:(id)a3 didUpdateSettingsForFeatureIdentifier:(id)a4
{
  id v5;
  NSObject *loggingCategory;
  NSArray *managedKeys;
  id v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  uint8_t buf[4];
  HDWatchSettingsReconciliationManager *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  _HKInitializeLogging();
  loggingCategory = self->_loggingCategory;
  if (os_log_type_enabled(loggingCategory, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v13 = self;
    v14 = 2114;
    v15 = v5;
    _os_log_impl(&dword_1B7802000, loggingCategory, OS_LOG_TYPE_DEFAULT, "[%{public}@] Notified of update to settings for %{public}@", buf, 0x16u);
  }
  managedKeys = self->_managedKeys;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __101__HDWatchSettingsReconciliationManager_featureSettingsManager_didUpdateSettingsForFeatureIdentifier___block_invoke;
  v10[3] = &unk_1E6D0A6D8;
  v11 = v5;
  v8 = v5;
  -[NSArray hk_firstObjectPassingTest:](managedKeys, "hk_firstObjectPassingTest:", v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
    -[HDWatchSettingsReconciliationManager _queue_reconcileValuesForKeys:](self, "_queue_reconcileValuesForKeys:", v9);

}

uint64_t __101__HDWatchSettingsReconciliationManager_featureSettingsManager_didUpdateSettingsForFeatureIdentifier___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "featureIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "isEqualToString:", v3);

  return v4;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *loggingCategory;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  void *v17;
  NSArray *managedKeys;
  uint64_t v19;
  id v20;
  void *v21;
  id WeakRetained;
  void *v23;
  OS_dispatch_queue *queue;
  objc_super v25;
  _QWORD v26[5];
  id v27;
  _QWORD v28[4];
  id v29;
  uint8_t buf[4];
  HDWatchSettingsReconciliationManager *v31;
  __int16 v32;
  id v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  _HKInitializeLogging();
  loggingCategory = self->_loggingCategory;
  if (os_log_type_enabled(loggingCategory, OS_LOG_TYPE_DEFAULT))
  {
    v14 = *MEMORY[0x1E0CB2CC8];
    v15 = loggingCategory;
    objc_msgSend(v12, "objectForKeyedSubscript:", v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2CB8]);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v31 = self;
    v32 = 2114;
    v33 = v10;
    v34 = 2114;
    v35 = v16;
    v36 = 2114;
    v37 = v17;
    _os_log_impl(&dword_1B7802000, v15, OS_LOG_TYPE_DEFAULT, "[%{public}@] %{public}@ changed: %{public}@ -> %{public}@", buf, 0x2Au);

  }
  managedKeys = self->_managedKeys;
  v19 = MEMORY[0x1E0C809B0];
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __87__HDWatchSettingsReconciliationManager_observeValueForKeyPath_ofObject_change_context___block_invoke;
  v28[3] = &unk_1E6D0A6D8;
  v20 = v10;
  v29 = v20;
  -[NSArray hk_firstObjectPassingTest:](managedKeys, "hk_firstObjectPassingTest:", v28);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (v21)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
    objc_msgSend(WeakRetained, "database");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    queue = self->_queue;
    v26[0] = v19;
    v26[1] = 3221225472;
    v26[2] = __87__HDWatchSettingsReconciliationManager_observeValueForKeyPath_ofObject_change_context___block_invoke_2;
    v26[3] = &unk_1E6CE8080;
    v26[4] = self;
    v27 = v21;
    objc_msgSend(v23, "performWhenDataProtectedByFirstUnlockIsAvailableOnQueue:block:", queue, v26);

  }
  else
  {
    v25.receiver = self;
    v25.super_class = (Class)HDWatchSettingsReconciliationManager;
    -[HDWatchSettingsReconciliationManager observeValueForKeyPath:ofObject:change:context:](&v25, sel_observeValueForKeyPath_ofObject_change_context_, v20, v11, v12, a6);
  }

}

uint64_t __87__HDWatchSettingsReconciliationManager_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "defaultsEnabledKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "isEqualToString:", v3);

  return v4;
}

uint64_t __87__HDWatchSettingsReconciliationManager_observeValueForKeyPath_ofObject_change_context___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_reconcileValuesForKeys:", *(_QWORD *)(a1 + 40));
}

- (void)_queue_reconcileValuesForAllKeys
{
  NSArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  v3 = self->_managedKeys;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        -[HDWatchSettingsReconciliationManager _queue_reconcileValuesForKeys:](self, "_queue_reconcileValuesForKeys:", *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v7++), (_QWORD)v8);
      }
      while (v5 != v7);
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (void)_queue_reconcileValuesForKeys:(id)a3
{
  id v4;
  NSObject *loggingCategory;
  void *v6;
  id v7;
  NSObject *v8;
  _QWORD v9[5];
  id v10;
  id v11;
  uint8_t buf[4];
  HDWatchSettingsReconciliationManager *v13;
  __int16 v14;
  id v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  _HKInitializeLogging();
  loggingCategory = self->_loggingCategory;
  if (os_log_type_enabled(loggingCategory, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v13 = self;
    v14 = 2114;
    v15 = v4;
    _os_log_impl(&dword_1B7802000, loggingCategory, OS_LOG_TYPE_DEFAULT, "[%{public}@] Beginning reconciliation for %{public}@", buf, 0x16u);
  }
  v11 = 0;
  -[HDWatchSettingsReconciliationManager _queue_settingValuesForSettingKeys:error:](self, "_queue_settingValuesForSettingKeys:error:", v4, &v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v11;
  if (v6)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __70__HDWatchSettingsReconciliationManager__queue_reconcileValuesForKeys___block_invoke;
    v9[3] = &unk_1E6D0A700;
    v9[4] = self;
    v10 = v6;
    -[HDWatchSettingsReconciliationManager _queue_applyReconciledValueFromSettingValues:forSettingKeys:completion:](self, "_queue_applyReconciledValueFromSettingValues:forSettingKeys:completion:", v10, v4, v9);

  }
  else
  {
    _HKInitializeLogging();
    v8 = self->_loggingCategory;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543874;
      v13 = self;
      v14 = 2114;
      v15 = v4;
      v16 = 2114;
      v17 = v7;
      _os_log_error_impl(&dword_1B7802000, v8, OS_LOG_TYPE_ERROR, "[%{public}@] Error retrieving settings values for %{public}@: %{public}@", buf, 0x20u);
    }
  }

}

void __70__HDWatchSettingsReconciliationManager__queue_reconcileValuesForKeys___block_invoke(uint64_t a1, char a2, uint64_t a3, uint64_t a4, void *a5, void *a6)
{
  id v11;
  id v12;
  id WeakRetained;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  int v19;
  uint64_t v20;
  __int16 v21;
  id v22;
  __int16 v23;
  id v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v11 = a5;
  v12 = a6;
  if ((a2 & 1) != 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 56));
    objc_msgSend(WeakRetained, "watchSettingsReconciliationManager:didReconcileValuesForKeys:didUpdateFeatureSetting:didUpdateUserDefault:", *(_QWORD *)(a1 + 32), v11, a3, a4);

  }
  else
  {
    _HKInitializeLogging();
    v14 = *(_QWORD *)(a1 + 32);
    v15 = *(NSObject **)(v14 + 48);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v18 = *(void **)(a1 + 40);
      v19 = 138544130;
      v20 = v14;
      v21 = 2114;
      v22 = v18;
      v23 = 2114;
      v24 = v11;
      v25 = 2114;
      v26 = v12;
      _os_log_error_impl(&dword_1B7802000, v15, OS_LOG_TYPE_ERROR, "[%{public}@] Error applying reconciled values: %{public}@ for %{public}@: %{public}@", (uint8_t *)&v19, 0x2Au);
    }
  }
  _HKInitializeLogging();
  v16 = *(_QWORD *)(a1 + 32);
  v17 = *(NSObject **)(v16 + 48);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    v19 = 138543618;
    v20 = v16;
    v21 = 2114;
    v22 = v11;
    _os_log_impl(&dword_1B7802000, v17, OS_LOG_TYPE_DEFAULT, "[%{public}@] Completed reconciliation for %{public}@", (uint8_t *)&v19, 0x16u);
  }

}

- (id)_queue_settingValuesForSettingKeys:(id)a3 error:(id *)a4
{
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  NSUserDefaults *userDefaults;
  void *v15;
  void *v16;
  id v17;
  HDWatchSettingValues *v18;
  id v19;
  NSUserDefaults *v20;
  void *v21;
  void *v22;
  id v24;
  id v25;
  id v26;

  v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "featureSettingsManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "featureIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0;
  objc_msgSend(v8, "featureSettingsForFeatureIdentifier:error:", v9, &v26);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v26;

  if (v10)
  {
    objc_msgSend(v6, "featureSettingEnabledKey");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "numberForKey:", v12);
    v13 = (id)objc_claimAutoreleasedReturnValue();

    userDefaults = self->_userDefaults;
    objc_msgSend(v6, "defaultsEnabledKey");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v11;
    -[NSUserDefaults hk_safeNumberIfExistsForKeyPath:error:](userDefaults, "hk_safeNumberIfExistsForKeyPath:error:", v15, &v25);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v25;

    if (v17)
    {
      if (a4)
      {
        v17 = objc_retainAutorelease(v17);
        v18 = 0;
        *a4 = v17;
      }
      else
      {
        _HKLogDroppedError();
        v18 = 0;
      }
    }
    else
    {
      v20 = self->_userDefaults;
      objc_msgSend(v6, "lastReconciledEnabledKey");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 0;
      -[NSUserDefaults hk_safeNumberIfExistsForKeyPath:error:](v20, "hk_safeNumberIfExistsForKeyPath:error:", v21, &v24);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v24;

      if (v17)
      {
        if (a4)
        {
          v18 = 0;
          *a4 = objc_retainAutorelease(v17);
        }
        else
        {
          _HKLogDroppedError();
          v18 = 0;
        }
      }
      else
      {
        v18 = -[HDWatchSettingValues initWithFeatureSettingEnabledValue:defaultsEnabledValue:lastReconciledEnabledValue:]([HDWatchSettingValues alloc], "initWithFeatureSettingEnabledValue:defaultsEnabledValue:lastReconciledEnabledValue:", v13, v16, v22);
      }

    }
  }
  else
  {
    v19 = v11;
    v13 = v19;
    if (v19)
    {
      if (a4)
      {
        v13 = objc_retainAutorelease(v19);
        v18 = 0;
        *a4 = v13;
      }
      else
      {
        _HKLogDroppedError();
        v18 = 0;
      }
      v17 = v13;
    }
    else
    {
      v17 = 0;
      v18 = 0;
    }
  }

  return v18;
}

- (void)_queue_applyReconciledValueFromSettingValues:(id)a3 forSettingKeys:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  NSObject *loggingCategory;
  _BOOL4 v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void (**v18)(void *, _QWORD);
  void *v19;
  char v20;
  void *v21;
  void *v22;
  id v23;
  id WeakRetained;
  id v25;
  _QWORD v26[5];
  id v27;
  id v28;
  void (**v29)(void *, _QWORD);
  id v30;
  id v31;
  _QWORD aBlock[4];
  id v33;
  id v34;
  HDWatchSettingsReconciliationManager *v35;
  id v36;
  id v37;
  uint8_t buf[4];
  HDWatchSettingsReconciliationManager *v39;
  __int16 v40;
  id v41;
  __int16 v42;
  id v43;
  __int16 v44;
  id v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  objc_msgSend(v8, "reconciledEnabledValue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  _HKInitializeLogging();
  loggingCategory = self->_loggingCategory;
  v13 = os_log_type_enabled(loggingCategory, OS_LOG_TYPE_DEFAULT);
  if (v11)
  {
    if (v13)
    {
      *(_DWORD *)buf = 138544130;
      v39 = self;
      v40 = 2114;
      v41 = v11;
      v42 = 2114;
      v43 = v8;
      v44 = 2114;
      v45 = v9;
      _os_log_impl(&dword_1B7802000, loggingCategory, OS_LOG_TYPE_DEFAULT, "[%{public}@] Applying reconciled value %{public}@ from %{public}@ for %{public}@", buf, 0x2Au);
    }
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __111__HDWatchSettingsReconciliationManager__queue_applyReconciledValueFromSettingValues_forSettingKeys_completion___block_invoke;
    aBlock[3] = &unk_1E6D0A728;
    v14 = v11;
    v33 = v14;
    v15 = v8;
    v34 = v15;
    v35 = self;
    v16 = v9;
    v36 = v16;
    v25 = v10;
    v17 = v10;
    v37 = v17;
    v18 = (void (**)(void *, _QWORD))_Block_copy(aBlock);
    objc_msgSend(v15, "featureSettingEnabledValue");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v14, "isEqual:", v19);

    if ((v20 & 1) != 0)
    {
      v18[2](v18, 0);
    }
    else
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
      objc_msgSend(WeakRetained, "database");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      +[HDDatabaseTransactionContext contextForWriting](HDDatabaseTransactionContext, "contextForWriting");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = 0;
      v26[0] = MEMORY[0x1E0C809B0];
      v26[1] = 3221225472;
      v26[2] = __111__HDWatchSettingsReconciliationManager__queue_applyReconciledValueFromSettingValues_forSettingKeys_completion___block_invoke_2;
      v26[3] = &unk_1E6D0A778;
      v29 = v18;
      v26[4] = self;
      v30 = v17;
      v27 = v16;
      v28 = v14;
      objc_msgSend(v21, "performTransactionWithContext:error:block:inaccessibilityHandler:", v22, &v31, v26, 0);
      v23 = v31;

    }
    v10 = v25;
  }
  else
  {
    if (v13)
    {
      *(_DWORD *)buf = 138543874;
      v39 = self;
      v40 = 2114;
      v41 = v8;
      v42 = 2114;
      v43 = v9;
      _os_log_impl(&dword_1B7802000, loggingCategory, OS_LOG_TYPE_DEFAULT, "[%{public}@] No value to reconcile from %{public}@ for %{public}@", buf, 0x20u);
    }
    (*((void (**)(id, uint64_t, _QWORD, _QWORD, id, _QWORD))v10 + 2))(v10, 1, 0, 0, v9, 0);
  }

}

uint64_t __111__HDWatchSettingsReconciliationManager__queue_applyReconciledValueFromSettingValues_forSettingKeys_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "lastReconciledEnabledValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = objc_msgSend(v2, "isEqual:", v3);

  if ((v2 & 1) == 0)
  {
    v4 = *(void **)(*(_QWORD *)(a1 + 48) + 24);
    v5 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 56), "lastReconciledEnabledKey");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v5, v6);

  }
  v7 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "defaultsEnabledValue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v7) = objc_msgSend(v7, "isEqual:", v8);

  if ((v7 & 1) == 0)
  {
    v9 = *(void **)(*(_QWORD *)(a1 + 48) + 24);
    v10 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 56), "defaultsEnabledKey");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKey:", v10, v11);

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
}

uint64_t __111__HDWatchSettingsReconciliationManager__queue_applyReconciledValueFromSettingValues_forSettingKeys_completion___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v6;
  id WeakRetained;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, void *);
  void *v17;
  uint64_t v18;
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;

  v6 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __111__HDWatchSettingsReconciliationManager__queue_applyReconciledValueFromSettingValues_forSettingKeys_completion___block_invoke_3;
  v21[3] = &unk_1E6CE7DE0;
  v22 = *(id *)(a1 + 56);
  v14 = v6;
  v15 = 3221225472;
  v16 = __111__HDWatchSettingsReconciliationManager__queue_applyReconciledValueFromSettingValues_forSettingKeys_completion___block_invoke_4;
  v17 = &unk_1E6D0A750;
  v18 = *(_QWORD *)(a1 + 32);
  v20 = *(id *)(a1 + 64);
  v19 = *(id *)(a1 + 40);
  objc_msgSend(a2, "onCommit:orRollback:", v21, &v14);
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(WeakRetained, "featureSettingsManager", v14, v15, v16, v17, v18);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 40), "featureSettingEnabledKey");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "featureIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v8, "setFeatureSettingsNumber:forKey:featureIdentifier:suppressNotificationsToObserver:error:", v9, v10, v11, *(_QWORD *)(a1 + 32), a3);

  return v12;
}

uint64_t __111__HDWatchSettingsReconciliationManager__queue_applyReconciledValueFromSettingValues_forSettingKeys_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __111__HDWatchSettingsReconciliationManager__queue_applyReconciledValueFromSettingValues_forSettingKeys_completion___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _HKInitializeLogging();
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(NSObject **)(v4 + 48);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    v6 = 138543618;
    v7 = v4;
    v8 = 2114;
    v9 = v3;
    _os_log_error_impl(&dword_1B7802000, v5, OS_LOG_TYPE_ERROR, "[%{public}@] Rolled back feature settings changes, not updating user defaults: %{public}@", (uint8_t *)&v6, 0x16u);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

- (HDWatchSettingsReconciliationManagerDelegate)delegate
{
  return (HDWatchSettingsReconciliationManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_loggingCategory, 0);
  objc_storeStrong((id *)&self->_debugIdentifier, 0);
  objc_storeStrong((id *)&self->_managedKeys, 0);
  objc_storeStrong((id *)&self->_userDefaults, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_profile);
}

@end
