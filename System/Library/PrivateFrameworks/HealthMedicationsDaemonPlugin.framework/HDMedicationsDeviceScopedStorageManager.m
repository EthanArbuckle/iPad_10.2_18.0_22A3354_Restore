@implementation HDMedicationsDeviceScopedStorageManager

- (HDMedicationsDeviceScopedStorageManager)initWithProfile:(id)a3
{
  id v4;
  HDMedicationsDeviceScopedStorageManager *v5;
  void *v6;
  uint64_t v7;
  HDSyncIdentityManager *syncIdentityManager;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HDMedicationsDeviceScopedStorageManager;
  v5 = -[HDMedicationsDeviceScopedStorageManager init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "deviceKeyValueStoreManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)&v5->_keyValueStore, v6);

    objc_msgSend(v4, "syncIdentityManager");
    v7 = objc_claimAutoreleasedReturnValue();
    syncIdentityManager = v5->_syncIdentityManager;
    v5->_syncIdentityManager = (HDSyncIdentityManager *)v7;

    objc_msgSend(v4, "registerProfileReadyObserver:queue:", v5, 0);
  }

  return v5;
}

- (void)profileDidBecomeReady:(id)a3
{
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[5];
  id v13;
  _QWORD v14[5];

  v4 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __65__HDMedicationsDeviceScopedStorageManager_profileDidBecomeReady___block_invoke;
  v14[3] = &unk_1E6E006B0;
  v14[4] = self;
  v5 = a3;
  v6 = (void *)MEMORY[0x1BCCADA70](v14);
  v7 = (void *)MEMORY[0x1E0D294D0];
  v12[0] = v4;
  v12[1] = 3221225472;
  v12[2] = __65__HDMedicationsDeviceScopedStorageManager_profileDidBecomeReady___block_invoke_198;
  v12[3] = &unk_1E6E01BB0;
  v12[4] = self;
  v13 = v6;
  v8 = v6;
  objc_msgSend(v7, "maintenanceOperationWithName:asynchronousBlock:", CFSTR("HDMedicationsDeviceScopedStorageManger"), v12);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "daemon");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "maintenanceWorkCoordinator");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "enqueueMaintenanceOperation:", v9);

}

void __65__HDMedicationsDeviceScopedStorageManager_profileDidBecomeReady___block_invoke(uint64_t a1)
{
  void *v1;
  char v2;
  id v3;
  NSObject *v4;
  id v5;

  v1 = *(void **)(a1 + 32);
  v5 = 0;
  v2 = objc_msgSend(v1, "updateLocalDeviceValuesNowWithError:", &v5);
  v3 = v5;
  if ((v2 & 1) == 0)
  {
    _HKInitializeLogging();
    HKLogMedication();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __65__HDMedicationsDeviceScopedStorageManager_profileDidBecomeReady___block_invoke_cold_1();

  }
}

void __65__HDMedicationsDeviceScopedStorageManager_profileDidBecomeReady___block_invoke_198(uint64_t a1, void *a2)
{
  uint64_t v2;
  void (*v3)(uint64_t);
  void (**v4)(_QWORD);
  NSObject *v5;
  id v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 40);
  v3 = *(void (**)(uint64_t))(v2 + 16);
  v4 = a2;
  v3(v2);
  _HKInitializeLogging();
  HKLogMedication();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138543362;
    v8 = (id)objc_opt_class();
    v6 = v8;
    _os_log_impl(&dword_1B815E000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@]: Finished local device update as maintenance operation", (uint8_t *)&v7, 0xCu);

  }
  v4[2](v4);

}

- (BOOL)updateLocalDeviceValuesNowWithError:(id *)a3
{
  void *v3;
  BOOL v4;

  -[HDMedicationsDeviceScopedStorageManager _updateLocalDeviceValuesNowWithError:]((uint64_t)self, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (id)_updateLocalDeviceValuesNowWithError:(uint64_t)a1
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  _QWORD v14[7];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  char v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD v28[4];
  _QWORD v29[5];

  v29[4] = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  objc_msgSend(MEMORY[0x1E0D2C500], "localDeviceInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = CFSTR("_Name");
  objc_msgSend(v4, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = v5;
  v28[1] = CFSTR("_Model");
  objc_msgSend(v4, "model");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v29[1] = v6;
  v28[2] = CFSTR("_OperatingSystemVersion");
  if (v4)
  {
    objc_msgSend(v4, "operatingSystemVersion");
  }
  else
  {
    v25 = 0;
    v26 = 0;
    v27 = 0;
  }
  HKNSOperatingSystemVersionString();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v29[2] = v7;
  v28[3] = CFSTR("_ScheduleCompatibilityVersion");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v4, "scheduleCompatibilityVersion"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v29[3] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, v28, 4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 0;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__13;
  v19 = __Block_byref_object_dispose__13;
  v20 = 0;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __80__HDMedicationsDeviceScopedStorageManager__updateLocalDeviceValuesNowWithError___block_invoke;
  v14[3] = &unk_1E6E01BD8;
  v14[4] = a1;
  v14[5] = &v21;
  v14[6] = &v15;
  objc_msgSend(v9, "enumerateKeysAndObjectsUsingBlock:", v14);
  if (*((_BYTE *)v22 + 24))
  {
    v10 = v4;
  }
  else
  {
    v11 = (id)v16[5];
    v12 = v11;
    if (v11)
    {
      if (a2)
        *a2 = objc_retainAutorelease(v11);
      else
        _HKLogDroppedError();
    }

    v10 = 0;
  }
  _Block_object_dispose(&v15, 8);

  _Block_object_dispose(&v21, 8);
  return v10;
}

void __80__HDMedicationsDeviceScopedStorageManager__updateLocalDeviceValuesNowWithError___block_invoke(_QWORD *a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  id v8;
  id WeakRetained;
  char v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;

  v7 = a2;
  v8 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 8));
    v16 = 0;
    v10 = objc_msgSend(WeakRetained, "setNumber:forKey:domainName:protectionCategory:error:", v8, v7, CFSTR("Medications"), 1, &v16);
    v11 = v16;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v12 = 0;
      goto LABEL_8;
    }
    WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 8));
    v15 = 0;
    v10 = objc_msgSend(WeakRetained, "setString:forKey:domainName:protectionCategory:error:", v8, v7, CFSTR("Medications"), 1, &v15);
    v11 = v15;
  }
  v12 = v11;
  *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = v10;

  if (!*(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24))
  {
    v13 = *(_QWORD *)(a1[6] + 8);
    v12 = v12;
    v14 = *(void **)(v13 + 40);
    *(_QWORD *)(v13 + 40) = v12;

    *a4 = 1;
  }
LABEL_8:

}

- (id)accountDevicesInfoTriggeringUpdate:(BOOL)a3 error:(id *)a4
{
  NSObject *v6;
  id v7;
  void *v8;
  id v9;
  id WeakRetained;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  HKMedicationsAccountDevicesInfo *unitTest_accountDevicesInfo;
  HKMedicationsAccountDevicesInfo *v17;
  id v18;
  HKMedicationsAccountDevicesInfo *v19;
  _QWORD v21[5];
  id v22;
  id v23;

  if (a3)
  {
    v23 = 0;
    -[HDMedicationsDeviceScopedStorageManager _updateLocalDeviceValuesNowWithError:]((uint64_t)self, &v23);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = v23;
    v8 = v7;
    if (!v6)
    {
      v9 = v7;
      if (v9)
      {
        if (a4)
          *a4 = objc_retainAutorelease(v9);
        else
          _HKLogDroppedError();
      }

      _HKInitializeLogging();
      HKLogMedication();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        -[HDMedicationsDeviceScopedStorageManager accountDevicesInfoTriggeringUpdate:error:].cold.1();
      v19 = 0;
      goto LABEL_18;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D2C500], "localDeviceInfo");
    v6 = objc_claimAutoreleasedReturnValue();
    v8 = 0;
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_keyValueStore);
  v22 = v8;
  objc_msgSend(WeakRetained, "fetchEntriesForDomain:key:protectionCategory:error:", CFSTR("Medications"), 0, 1, &v22);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v22;

  if (v11)
  {
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __84__HDMedicationsDeviceScopedStorageManager_accountDevicesInfoTriggeringUpdate_error___block_invoke;
    v21[3] = &unk_1E6E01C00;
    v21[4] = self;
    objc_msgSend(v11, "hk_map:", v21);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDSyncIdentityManager currentSyncIdentity](self->_syncIdentityManager, "currentSyncIdentity");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "identity");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "hardwareIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject _setHardwareIdentifier:](v6, "_setHardwareIdentifier:", v15);

    unitTest_accountDevicesInfo = self->_unitTest_accountDevicesInfo;
    if (unitTest_accountDevicesInfo)
      v17 = unitTest_accountDevicesInfo;
    else
      v17 = (HKMedicationsAccountDevicesInfo *)objc_msgSend(objc_alloc(MEMORY[0x1E0D2C4E8]), "initWithMedicationFeatureDevicesInfo:localDeviceInfo:", v12, v6);
    v19 = v17;

  }
  else
  {
    v18 = v9;
    if (v18)
    {
      if (a4)
        *a4 = objc_retainAutorelease(v18);
      else
        _HKLogDroppedError();
    }

    v19 = 0;
  }

LABEL_18:
  return v19;
}

id __84__HDMedicationsDeviceScopedStorageManager_accountDevicesInfoTriggeringUpdate_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  unint64_t v5;
  void *v6;

  v3 = a2;
  objc_msgSend(v3, "deviceContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "type");

  if (v5 > 3)
  {
    v6 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D2C500], "deviceInfoFromStorageGroup:syncIdentityManager:", v3, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

- (HKMedicationsAccountDevicesInfo)unitTest_accountDevicesInfo
{
  return self->_unitTest_accountDevicesInfo;
}

- (void)setUnitTest_accountDevicesInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unitTest_accountDevicesInfo, 0);
  objc_storeStrong((id *)&self->_syncIdentityManager, 0);
  objc_destroyWeak((id *)&self->_keyValueStore);
}

void __65__HDMedicationsDeviceScopedStorageManager_profileDidBecomeReady___block_invoke_cold_1()
{
  void *v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v0 = (void *)objc_opt_class();
  v1 = OUTLINED_FUNCTION_0_1(v0);
  OUTLINED_FUNCTION_1_1(&dword_1B815E000, v2, v3, "[%{public}@]: Error updating local device values: %{public}@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2_2();
}

- (void)accountDevicesInfoTriggeringUpdate:error:.cold.1()
{
  void *v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v0 = (void *)objc_opt_class();
  v1 = OUTLINED_FUNCTION_0_1(v0);
  OUTLINED_FUNCTION_1_1(&dword_1B815E000, v2, v3, "[%{public}@]: Error updating local device values: %{public}@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2_2();
}

@end
