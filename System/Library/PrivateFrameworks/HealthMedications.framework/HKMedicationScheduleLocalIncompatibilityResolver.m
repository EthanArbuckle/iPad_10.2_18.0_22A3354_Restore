@implementation HKMedicationScheduleLocalIncompatibilityResolver

- (void)checkIncompatibilityForSchedule:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NRPairedDeviceRegistry *unitTestPairedDeviceRegistry;
  NRPairedDeviceRegistry *v9;
  NRPairedDeviceRegistry *v10;
  void *v11;
  NSObject *v12;
  id v13;
  int v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  unitTestPairedDeviceRegistry = self->_unitTestPairedDeviceRegistry;
  if (unitTestPairedDeviceRegistry)
  {
    v9 = unitTestPairedDeviceRegistry;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D51838], "sharedInstance");
    v9 = (NRPairedDeviceRegistry *)objc_claimAutoreleasedReturnValue();
  }
  v10 = v9;
  -[NRPairedDeviceRegistry getActivePairedDevice](v9, "getActivePairedDevice");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    -[HKMedicationScheduleLocalIncompatibilityResolver checkIncompatibilityForSchedule:pairedDevice:completion:](self, "checkIncompatibilityForSchedule:pairedDevice:completion:", v6, v11, v7);
  }
  else
  {
    _HKInitializeLogging();
    HKLogMedication();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v14 = 138543362;
      v15 = (id)objc_opt_class();
      v13 = v15;
      _os_log_impl(&dword_1B77D4000, v12, OS_LOG_TYPE_DEFAULT, "[%{public}@] Skipping incompatibility check, no active paired device found.", (uint8_t *)&v14, 0xCu);

    }
    (*((void (**)(id, _QWORD, _QWORD))v7 + 2))(v7, 0, 0);
  }

}

- (void)checkIncompatibilityForSchedule:(id)a3 pairedDevice:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  HKACAccountDevice *v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  HKACAccountDevice *v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = -[HKACAccountDevice initWithPairedDevice:]([HKACAccountDevice alloc], "initWithPairedDevice:", v9);

  v18[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v17, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __108__HKMedicationScheduleLocalIncompatibilityResolver_checkIncompatibilityForSchedule_pairedDevice_completion___block_invoke;
  v15[3] = &unk_1E6CD4F40;
  v16 = v8;
  v14 = v8;
  -[HKMedicationScheduleBaseIncompatibilityResolver _resolveIncompatibleScheduleResultsFromSchedules:scheduleError:devices:deviceError:completion:](self, "_resolveIncompatibleScheduleResultsFromSchedules:scheduleError:devices:deviceError:completion:", v12, 0, v13, 0, v15);

}

void __108__HKMedicationScheduleLocalIncompatibilityResolver_checkIncompatibilityForSchedule_pairedDevice_completion___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (void)_unitTest_setPairedDeviceRegistry:(id)a3
{
  objc_storeStrong((id *)&self->_unitTestPairedDeviceRegistry, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unitTestPairedDeviceRegistry, 0);
}

@end
