@implementation HDMCWatchSettingsCompatibilityManager

- (HDMCWatchSettingsCompatibilityManager)initWithProfile:(id)a3 userDefaults:(id)a4
{
  id v7;
  id v8;
  HDMCWatchSettingsCompatibilityManager *v9;
  uint64_t v10;
  OS_dispatch_queue *queue;
  void *v12;
  void *v13;
  uint64_t v14;
  NSArray *managedFeatures;
  id WeakRetained;
  void *v18;
  objc_super v19;
  _QWORD v20[3];

  v20[2] = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v19.receiver = self;
  v19.super_class = (Class)HDMCWatchSettingsCompatibilityManager;
  v9 = -[HDMCWatchSettingsCompatibilityManager init](&v19, sel_init);
  if (v9)
  {
    if (objc_msgSend(v7, "profileType") != 1)
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, v9, CFSTR("HDMCWatchSettingsCompatibilityManager.m"), 32, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("profile.profileType == HKProfileTypePrimary"));

    }
    objc_storeWeak((id *)&v9->_profile, v7);
    objc_storeStrong((id *)&v9->_userDefaults, a4);
    HKCreateSerialDispatchQueue();
    v10 = objc_claimAutoreleasedReturnValue();
    queue = v9->_queue;
    v9->_queue = (OS_dispatch_queue *)v10;

    +[HDMCWatchFeatureSettings algorithmicProjectionsSettings](HDMCWatchFeatureSettings, "algorithmicProjectionsSettings");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = v12;
    +[HDMCWatchFeatureSettings hiddenLoggingRowsSettings](HDMCWatchFeatureSettings, "hiddenLoggingRowsSettings");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v20[1] = v13;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v20, 2);
    v14 = objc_claimAutoreleasedReturnValue();
    managedFeatures = v9->_managedFeatures;
    v9->_managedFeatures = (NSArray *)v14;

    WeakRetained = objc_loadWeakRetained((id *)&v9->_profile);
    objc_msgSend(WeakRetained, "registerProfileReadyObserver:queue:", v9, v9->_queue);

  }
  return v9;
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

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = self->_managedFeatures;
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
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __53__HDMCWatchSettingsCompatibilityManager_daemonReady___block_invoke;
  v7[3] = &unk_24DB21D60;
  v7[4] = self;
  objc_msgSend(v5, "performWhenDataProtectedByFirstUnlockIsAvailableOnQueue:block:", queue, v7);

}

void __53__HDMCWatchSettingsCompatibilityManager_daemonReady___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  _QWORD v11[5];

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(WeakRetained, "daemon");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "maintenanceWorkCoordinator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x24BE40AF8];
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(_QWORD *)(v8 + 24);
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __53__HDMCWatchSettingsCompatibilityManager_daemonReady___block_invoke_2;
  v11[3] = &unk_24DB21D60;
  v11[4] = v8;
  objc_msgSend(v5, "maintenanceOperationWithName:queue:synchronousBlock:", v7, v9, v11);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "enqueueMaintenanceOperation:", v10);

}

uint64_t __53__HDMCWatchSettingsCompatibilityManager_daemonReady___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_computeAndApplyChangesForAllFeatures");
}

- (void)featureSettingsManager:(id)a3 didUpdateSettingsForFeatureIdentifier:(id)a4
{
  id v5;
  void *v6;
  NSObject *v7;
  id v8;
  NSArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  int v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t v21[128];
  uint8_t buf[4];
  id v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  _HKInitializeLogging();
  v6 = (void *)*MEMORY[0x24BDD3030];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_DEFAULT))
  {
    v7 = v6;
    *(_DWORD *)buf = 138543618;
    v23 = (id)objc_opt_class();
    v24 = 2114;
    v25 = v5;
    v8 = v23;
    _os_log_impl(&dword_21961B000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] Notified of update to settings for %{public}@", buf, 0x16u);

  }
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v9 = self->_managedFeatures;
  v10 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v18 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v14, "featureIdentifier", (_QWORD)v17);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "isEqualToString:", v5);

        if (v16)
          -[HDMCWatchSettingsCompatibilityManager _queue_computeAndApplyChangesForFeature:](self, "_queue_computeAndApplyChangesForFeature:", v14);
      }
      v11 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v11);
  }

}

- (void)_queue_computeAndApplyChangesForAllFeatures
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

  v13 = *MEMORY[0x24BDAC8D0];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  v3 = self->_managedFeatures;
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
        -[HDMCWatchSettingsCompatibilityManager _queue_computeAndApplyChangesForFeature:](self, "_queue_computeAndApplyChangesForFeature:", *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v7++), (_QWORD)v8);
      }
      while (v5 != v7);
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (void)_queue_computeAndApplyChangesForFeature:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  NSObject *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "featureSettingsManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "featureIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0;
  objc_msgSend(v6, "featureSettingsForFeatureIdentifier:error:", v7, &v23);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v23;

  if (v8)
  {
    objc_msgSend(v4, "userDefaultsChangesFromFeatureSettings:currentUserDefaults:", v8, self->_userDefaults);
    v10 = objc_claimAutoreleasedReturnValue();
    -[NSUserDefaults setValuesForKeysWithDictionary:](self->_userDefaults, "setValuesForKeysWithDictionary:", v10);
    _HKInitializeLogging();
    v11 = (void *)*MEMORY[0x24BDD3030];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_DEFAULT))
    {
      v12 = v11;
      v13 = (void *)objc_opt_class();
      v14 = v13;
      objc_msgSend(v4, "featureIdentifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v25 = v13;
      v26 = 2114;
      v27 = v15;
      v28 = 2114;
      v29 = v10;
      _os_log_impl(&dword_21961B000, v12, OS_LOG_TYPE_DEFAULT, "[%{public}@] Applied changes for %{public}@: %{public}@", buf, 0x20u);

    }
    v16 = objc_loadWeakRetained((id *)&self->_delegate);
    v17 = (void *)MEMORY[0x24BDBCF20];
    -[NSObject allKeys](v10, "allKeys");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setWithArray:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "watchSettingsCompatibilityManager:didChangeUserDefaultsKeys:", self, v19);

  }
  else
  {
    _HKInitializeLogging();
    v20 = (void *)*MEMORY[0x24BDD3030];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_ERROR))
      goto LABEL_7;
    v10 = v20;
    v21 = (void *)objc_opt_class();
    v16 = v21;
    objc_msgSend(v4, "featureIdentifier");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v25 = v21;
    v26 = 2114;
    v27 = v22;
    v28 = 2114;
    v29 = v9;
    _os_log_error_impl(&dword_21961B000, v10, OS_LOG_TYPE_ERROR, "[%{public}@] Error retrieving %{public}@ feature settings: %{public}@", buf, 0x20u);

  }
LABEL_7:

}

- (HDMCWatchSettingsCompatibilityManagerDelegate)delegate
{
  return (HDMCWatchSettingsCompatibilityManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_managedFeatures, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_userDefaults, 0);
  objc_destroyWeak((id *)&self->_profile);
}

@end
