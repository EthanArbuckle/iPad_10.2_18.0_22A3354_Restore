@implementation HKMedicationScheduleCloudIncompatibilityResolver

- (HKMedicationScheduleCloudIncompatibilityResolver)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The -%@ method is not available on %@"), v5, objc_opt_class());

  return 0;
}

- (HKMedicationScheduleCloudIncompatibilityResolver)initWithHealthStore:(id)a3 accountStore:(id)a4 deviceRequest:(id)a5
{
  id v9;
  id v10;
  id v11;
  HKMedicationScheduleCloudIncompatibilityResolver *v12;
  HKMedicationScheduleCloudIncompatibilityResolver *v13;
  HKACAccountDeviceStore *v14;
  HKACAccountDeviceStore *accountDeviceStore;
  HKMedicationScheduleControl *v16;
  HKMedicationScheduleControl *scheduleControl;
  objc_super v19;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)HKMedicationScheduleCloudIncompatibilityResolver;
  v12 = -[HKMedicationScheduleBaseIncompatibilityResolver init](&v19, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_healthStore, a3);
    v14 = -[HKACAccountDeviceStore initWithAccountStore:]([HKACAccountDeviceStore alloc], "initWithAccountStore:", v10);
    accountDeviceStore = v13->_accountDeviceStore;
    v13->_accountDeviceStore = v14;

    objc_storeStrong((id *)&v13->_deviceRequest, a5);
    v16 = -[HKMedicationScheduleControl initWithHealthStore:]([HKMedicationScheduleControl alloc], "initWithHealthStore:", v13->_healthStore);
    scheduleControl = v13->_scheduleControl;
    v13->_scheduleControl = v16;

  }
  return v13;
}

- (void)resolveIncompatibleSchedulesWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  id v13;
  _QWORD block[5];
  id v15;
  _QWORD *v16;
  _QWORD *v17;
  _QWORD *v18;
  _QWORD *v19;
  _QWORD v20[5];
  NSObject *v21;
  _QWORD *v22;
  _QWORD *v23;
  _QWORD v24[5];
  id v25;
  _QWORD v26[5];
  id v27;
  _QWORD v28[5];
  NSObject *v29;
  _QWORD *v30;
  _QWORD *v31;
  _QWORD v32[5];
  id v33;
  _QWORD v34[5];
  id v35;

  v4 = a3;
  v5 = dispatch_group_create();
  v34[0] = 0;
  v34[1] = v34;
  v34[2] = 0x3032000000;
  v34[3] = __Block_byref_object_copy_;
  v34[4] = __Block_byref_object_dispose_;
  v35 = 0;
  v32[0] = 0;
  v32[1] = v32;
  v32[2] = 0x3032000000;
  v32[3] = __Block_byref_object_copy_;
  v32[4] = __Block_byref_object_dispose_;
  v33 = 0;
  dispatch_group_enter(v5);
  -[HKMedicationScheduleCloudIncompatibilityResolver accountDeviceStore](self, "accountDeviceStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKMedicationScheduleCloudIncompatibilityResolver deviceRequest](self, "deviceRequest");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __95__HKMedicationScheduleCloudIncompatibilityResolver_resolveIncompatibleSchedulesWithCompletion___block_invoke;
  v28[3] = &unk_1E6CD4EF0;
  v30 = v32;
  v31 = v34;
  v28[4] = self;
  v9 = v5;
  v29 = v9;
  objc_msgSend(v6, "fetchDevicesWithRequest:completion:", v7, v28);

  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x3032000000;
  v26[3] = __Block_byref_object_copy_;
  v26[4] = __Block_byref_object_dispose_;
  v27 = 0;
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x3032000000;
  v24[3] = __Block_byref_object_copy_;
  v24[4] = __Block_byref_object_dispose_;
  v25 = 0;
  dispatch_group_enter(v9);
  -[HKMedicationScheduleCloudIncompatibilityResolver scheduleControl](self, "scheduleControl");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v8;
  v20[1] = 3221225472;
  v20[2] = __95__HKMedicationScheduleCloudIncompatibilityResolver_resolveIncompatibleSchedulesWithCompletion___block_invoke_204;
  v20[3] = &unk_1E6CD4EF0;
  v22 = v24;
  v23 = v26;
  v20[4] = self;
  v11 = v9;
  v21 = v11;
  objc_msgSend(v10, "fetchAllSchedulesWithCompletion:", v20);

  -[HKHealthStore clientQueue](self->_healthStore, "clientQueue");
  v12 = objc_claimAutoreleasedReturnValue();
  block[0] = v8;
  block[1] = 3221225472;
  block[2] = __95__HKMedicationScheduleCloudIncompatibilityResolver_resolveIncompatibleSchedulesWithCompletion___block_invoke_205;
  block[3] = &unk_1E6CD4F18;
  v16 = v26;
  v17 = v24;
  v18 = v34;
  v19 = v32;
  block[4] = self;
  v15 = v4;
  v13 = v4;
  dispatch_group_notify(v11, v12, block);

  _Block_object_dispose(v24, 8);
  _Block_object_dispose(v26, 8);

  _Block_object_dispose(v32, 8);
  _Block_object_dispose(v34, 8);

}

void __95__HKMedicationScheduleCloudIncompatibilityResolver_resolveIncompatibleSchedulesWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  int v12;
  void *v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a3;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a3);
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), a2);
  _HKInitializeLogging();
  HKLogMedication();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = (void *)objc_opt_class();
    v10 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
    v11 = v9;
    v12 = 138543618;
    v13 = v9;
    v14 = 2048;
    v15 = objc_msgSend(v10, "count");
    _os_log_impl(&dword_1B77D4000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] Found %ld cloud devices to evaluate", (uint8_t *)&v12, 0x16u);

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));

}

void __95__HKMedicationScheduleCloudIncompatibilityResolver_resolveIncompatibleSchedulesWithCompletion___block_invoke_204(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  int v12;
  void *v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a3;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a3);
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), a2);
  _HKInitializeLogging();
  HKLogMedication();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = (void *)objc_opt_class();
    v10 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
    v11 = v9;
    v12 = 138543618;
    v13 = v9;
    v14 = 2048;
    v15 = objc_msgSend(v10, "count");
    _os_log_impl(&dword_1B77D4000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] Found %ld schedules to evaluate", (uint8_t *)&v12, 0x16u);

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));

}

uint64_t __95__HKMedicationScheduleCloudIncompatibilityResolver_resolveIncompatibleSchedulesWithCompletion___block_invoke_205(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_resolveIncompatibleScheduleResultsFromSchedules:scheduleError:devices:deviceError:completion:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), *(_QWORD *)(a1 + 40));
}

- (void)checkIncompatibilityForSchedule:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  -[HKMedicationScheduleCloudIncompatibilityResolver accountDeviceStore](self, "accountDeviceStore");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKMedicationScheduleCloudIncompatibilityResolver deviceRequest](self, "deviceRequest");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __95__HKMedicationScheduleCloudIncompatibilityResolver_checkIncompatibilityForSchedule_completion___block_invoke;
  v12[3] = &unk_1E6CD4F68;
  v12[4] = self;
  v13 = v6;
  v14 = v7;
  v10 = v7;
  v11 = v6;
  objc_msgSend(v8, "fetchDevicesWithRequest:completion:", v9, v12);

}

void __95__HKMedicationScheduleCloudIncompatibilityResolver_checkIncompatibilityForSchedule_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v5 = *(void **)(a1 + 32);
  v12[0] = *(_QWORD *)(a1 + 40);
  v6 = (void *)MEMORY[0x1E0C99D20];
  v7 = a3;
  v8 = a2;
  objc_msgSend(v6, "arrayWithObjects:count:", v12, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __95__HKMedicationScheduleCloudIncompatibilityResolver_checkIncompatibilityForSchedule_completion___block_invoke_2;
  v10[3] = &unk_1E6CD4F40;
  v11 = *(id *)(a1 + 48);
  objc_msgSend(v5, "_resolveIncompatibleScheduleResultsFromSchedules:scheduleError:devices:deviceError:completion:", v9, 0, v8, v7, v10);

}

void __95__HKMedicationScheduleCloudIncompatibilityResolver_checkIncompatibilityForSchedule_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4;
  id v5;
  id v6;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = a3;
  objc_msgSend(a2, "firstObject");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, v6, v5);

}

- (HKHealthStore)healthStore
{
  return self->_healthStore;
}

- (void)setHealthStore:(id)a3
{
  objc_storeStrong((id *)&self->_healthStore, a3);
}

- (HKMedicationScheduleControl)scheduleControl
{
  return self->_scheduleControl;
}

- (void)setScheduleControl:(id)a3
{
  objc_storeStrong((id *)&self->_scheduleControl, a3);
}

- (HKACAccountDeviceStore)accountDeviceStore
{
  return self->_accountDeviceStore;
}

- (void)setAccountDeviceStore:(id)a3
{
  objc_storeStrong((id *)&self->_accountDeviceStore, a3);
}

- (HKACDeviceListRequestProtocol)deviceRequest
{
  return self->_deviceRequest;
}

- (void)setDeviceRequest:(id)a3
{
  objc_storeStrong((id *)&self->_deviceRequest, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceRequest, 0);
  objc_storeStrong((id *)&self->_accountDeviceStore, 0);
  objc_storeStrong((id *)&self->_scheduleControl, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);
}

@end
