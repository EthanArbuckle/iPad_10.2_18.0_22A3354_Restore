@implementation HDMCDeviceScopedStorageManager

- (HDMCDeviceScopedStorageManager)initWithProfile:(id)a3 settingsManager:(id)a4
{
  id v6;
  id v7;
  HDMCDeviceScopedStorageManager *v8;
  void *v9;
  id v10;
  objc_class *v11;
  void *v12;
  uint64_t v13;
  HKObserverSet *observers;
  objc_super v16;

  v6 = a3;
  v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)HDMCDeviceScopedStorageManager;
  v8 = -[HDMCDeviceScopedStorageManager init](&v16, sel_init);
  if (v8)
  {
    objc_msgSend(v6, "deviceKeyValueStoreManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)&v8->_keyValueStore, v9);

    objc_storeStrong((id *)&v8->_settingsManager, a4);
    v10 = objc_alloc(MEMORY[0x24BDD3DD0]);
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v10, "initWithName:loggingCategory:", v12, *MEMORY[0x24BDD3030]);
    observers = v8->_observers;
    v8->_observers = (HKObserverSet *)v13;

    -[HKMCSettingsManager addObserver:queue:](v8->_settingsManager, "addObserver:queue:", v8, 0);
  }

  return v8;
}

- (BOOL)updateLocalDeviceValuesNowWithError:(id *)a3
{
  void *v3;
  BOOL v4;

  -[HDMCDeviceScopedStorageManager _updateLocalDeviceValuesNowWithError:](self, "_updateLocalDeviceValuesNowWithError:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (id)_updateLocalDeviceValuesNowWithError:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  HKObserverSet *observers;
  id v12;
  id v13;
  void *v14;
  _QWORD v16[5];
  _QWORD v17[7];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  char v27;
  _QWORD v28[3];
  _QWORD v29[4];

  v29[3] = *MEMORY[0x24BDAC8D0];
  +[HDMCDeviceInfo localDeviceInfoWithSettingsManager:](HDMCDeviceInfo, "localDeviceInfoWithSettingsManager:", self->_settingsManager);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = CFSTR("DayStreamProcessorAlgorithmVersion");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v5, "dayStreamProcessorAlgorithmVersion"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = v6;
  v28[1] = CFSTR("MenstruationNotificationsEnabled");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v5, "menstruationNotificationsEnabled"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v29[1] = v7;
  v28[2] = CFSTR("FertileWindowNotificationsEnabled");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v5, "fertileWindowNotificationsEnabled"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v29[2] = v8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v29, v28, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = 0;
  v25 = &v24;
  v26 = 0x2020000000;
  v27 = 0;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__6;
  v22 = __Block_byref_object_dispose__6;
  v23 = 0;
  v10 = MEMORY[0x24BDAC760];
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __71__HDMCDeviceScopedStorageManager__updateLocalDeviceValuesNowWithError___block_invoke;
  v17[3] = &unk_24DB22530;
  v17[4] = self;
  v17[5] = &v24;
  v17[6] = &v18;
  objc_msgSend(v9, "enumerateKeysAndObjectsUsingBlock:", v17);
  if (*((_BYTE *)v25 + 24))
  {
    observers = self->_observers;
    v16[0] = v10;
    v16[1] = 3221225472;
    v16[2] = __71__HDMCDeviceScopedStorageManager__updateLocalDeviceValuesNowWithError___block_invoke_2;
    v16[3] = &unk_24DB22558;
    v16[4] = self;
    -[HKObserverSet notifyObservers:](observers, "notifyObservers:", v16);
    v12 = v5;
  }
  else
  {
    v13 = (id)v19[5];
    v14 = v13;
    if (v13)
    {
      if (a3)
        *a3 = objc_retainAutorelease(v13);
      else
        _HKLogDroppedError();
    }

    v12 = 0;
  }
  _Block_object_dispose(&v18, 8);

  _Block_object_dispose(&v24, 8);
  return v12;
}

void __71__HDMCDeviceScopedStorageManager__updateLocalDeviceValuesNowWithError___block_invoke(_QWORD *a1, void *a2, void *a3, _BYTE *a4)
{
  id *v7;
  id v8;
  id v9;
  id WeakRetained;
  char v11;
  id v12;
  id v13;
  id v14;

  v7 = (id *)(a1[4] + 8);
  v8 = a3;
  v9 = a2;
  WeakRetained = objc_loadWeakRetained(v7);
  v14 = 0;
  v11 = objc_msgSend(WeakRetained, "setNumber:forKey:domainName:protectionCategory:error:", v8, v9, CFSTR("MenstrualCycles"), 1, &v14);

  v12 = v14;
  v13 = v14;
  *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = v11;

  if (!*(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24))
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), v12);
    *a4 = 1;
  }

}

uint64_t __71__HDMCDeviceScopedStorageManager__updateLocalDeviceValuesNowWithError___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "deviceScopedStorageManagerDidUpdateLocalDeviceValues:", *(_QWORD *)(a1 + 32));
}

- (id)accountDevicesInfoWithError:(id *)a3
{
  void *v5;
  id v6;
  void *v7;
  id WeakRetained;
  id v9;
  id v10;
  id v11;
  HDMCAccountDevicesInfo *unitTest_accountDevicesInfo;
  HDMCAccountDevicesInfo *v13;
  id v14;
  HDMCAccountDevicesInfo *v15;
  id v16;
  id v18;
  id v19;

  v19 = 0;
  -[HDMCDeviceScopedStorageManager _updateLocalDeviceValuesNowWithError:](self, "_updateLocalDeviceValuesNowWithError:", &v19);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v19;
  v7 = v6;
  if (v5)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_keyValueStore);
    v18 = v7;
    objc_msgSend(WeakRetained, "fetchEntriesForDomain:key:protectionCategory:error:", CFSTR("MenstrualCycles"), 0, 1, &v18);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    v10 = v18;

    if (v9)
    {
      objc_msgSend(v9, "hk_map:", &__block_literal_global_4);
      v11 = (id)objc_claimAutoreleasedReturnValue();
      unitTest_accountDevicesInfo = self->_unitTest_accountDevicesInfo;
      if (unitTest_accountDevicesInfo)
        v13 = unitTest_accountDevicesInfo;
      else
        v13 = -[HDMCAccountDevicesInfo initWithHealthAppDevicesInfo:localDeviceInfo:]([HDMCAccountDevicesInfo alloc], "initWithHealthAppDevicesInfo:localDeviceInfo:", v11, v5);
      v15 = v13;
      goto LABEL_17;
    }
    v16 = v10;
    v11 = v16;
    if (v16)
    {
      if (a3)
      {
        v11 = objc_retainAutorelease(v16);
        v15 = 0;
        *a3 = v11;
LABEL_17:

        goto LABEL_18;
      }
      _HKLogDroppedError();
    }
    v15 = 0;
    goto LABEL_17;
  }
  v14 = v6;
  v9 = v14;
  if (!v14)
    goto LABEL_14;
  if (!a3)
  {
    _HKLogDroppedError();
LABEL_14:
    v15 = 0;
    v10 = v9;
    goto LABEL_18;
  }
  v9 = objc_retainAutorelease(v14);
  v15 = 0;
  *a3 = v9;
  v10 = v9;
LABEL_18:

  return v15;
}

id __62__HDMCDeviceScopedStorageManager_accountDevicesInfoWithError___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  unint64_t v4;
  void *v6;

  v2 = a2;
  objc_msgSend(v2, "deviceContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "type");

  if (v4 > 3 || v4 == 1)
  {
    v6 = 0;
  }
  else
  {
    +[HDMCDeviceInfo deviceInfoFromStorageGroup:](HDMCDeviceInfo, "deviceInfoFromStorageGroup:", v2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

- (void)registerObserver:(id)a3 queue:(id)a4
{
  -[HKObserverSet registerObserver:queue:](self->_observers, "registerObserver:queue:", a3, a4);
}

- (void)unregisterObserver:(id)a3
{
  -[HKObserverSet unregisterObserver:](self->_observers, "unregisterObserver:", a3);
}

- (void)settingsManagerDidUpdateNotificationSettings:(id)a3
{
  os_log_t *v4;
  void *v5;
  NSObject *v6;
  id v7;
  BOOL v8;
  id v9;
  os_log_t v10;
  id v11;
  uint8_t buf[4];
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  _HKInitializeLogging();
  v4 = (os_log_t *)MEMORY[0x24BDD3030];
  v5 = (void *)*MEMORY[0x24BDD3030];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    *(_DWORD *)buf = 138543362;
    v13 = (id)objc_opt_class();
    v7 = v13;
    _os_log_impl(&dword_21961B000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Received notification Settings update, updating device-scoped storage", buf, 0xCu);

  }
  v11 = 0;
  v8 = -[HDMCDeviceScopedStorageManager updateLocalDeviceValuesNowWithError:](self, "updateLocalDeviceValuesNowWithError:", &v11);
  v9 = v11;
  if (!v8)
  {
    _HKInitializeLogging();
    v10 = *v4;
    if (os_log_type_enabled(*v4, OS_LOG_TYPE_ERROR))
      -[HDMCDeviceScopedStorageManager settingsManagerDidUpdateNotificationSettings:].cold.1(v10, (uint64_t)self, (uint64_t)v9);
  }

}

- (HDMCAccountDevicesInfo)unitTest_accountDevicesInfo
{
  return self->_unitTest_accountDevicesInfo;
}

- (void)setUnitTest_accountDevicesInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unitTest_accountDevicesInfo, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_settingsManager, 0);
  objc_destroyWeak((id *)&self->_keyValueStore);
}

- (void)settingsManagerDidUpdateNotificationSettings:(uint64_t)a3 .cold.1(void *a1, uint64_t a2, uint64_t a3)
{
  NSObject *v4;
  id v5;
  int v6;
  id v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v4 = a1;
  v6 = 138543618;
  v7 = (id)objc_opt_class();
  v8 = 2114;
  v9 = a3;
  v5 = v7;
  _os_log_error_impl(&dword_21961B000, v4, OS_LOG_TYPE_ERROR, "[%{public}@] Error updating device-scoped storage after notification settings update %{public}@", (uint8_t *)&v6, 0x16u);

}

@end
