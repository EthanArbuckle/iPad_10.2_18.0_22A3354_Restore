@implementation HDMedicationDoseEventObserver

- (HDMedicationDoseEventObserver)initWithProfile:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  HDMedicationDoseEventObserver *v7;

  v4 = a3;
  objc_msgSend(v4, "healthMedicationsProfileExtension");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "medicationNotificationSyncManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HDMedicationDoseEventObserver initWithProfile:notificationSyncManager:](self, "initWithProfile:notificationSyncManager:", v4, v6);

  return v7;
}

- (HDMedicationDoseEventObserver)initWithProfile:(id)a3 notificationSyncManager:(id)a4
{
  id v6;
  id v7;
  HDMedicationDoseEventObserver *v8;
  HDMedicationDoseEventObserver *v9;
  id WeakRetained;
  void *v11;
  void *v12;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HDMedicationDoseEventObserver;
  v8 = -[HDMedicationDoseEventObserver init](&v14, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_profile, v6);
    objc_storeStrong((id *)&v9->_notificationSyncManager, a4);
    WeakRetained = objc_loadWeakRetained((id *)&v9->_profile);
    objc_msgSend(WeakRetained, "dataManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB68B0], "medicationDoseEventType");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObserver:forDataType:", v9, v12);

  }
  return v9;
}

- (BOOL)_rescheduleIfNecessaryWithDoseEvents:(id)a3
{
  char v4;
  id WeakRetained;
  void *v6;
  void *v7;
  NSObject *v8;
  int v10;
  HDMedicationDoseEventObserver *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = objc_msgSend(a3, "hk_containsObjectPassingTest:", &__block_literal_global_14);
  if ((v4 & 1) != 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
    objc_msgSend(WeakRetained, "healthMedicationsProfileExtension");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "medicationScheduleManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "rescheduleMedicationsSynchronously:", 0);
  }
  else
  {
    _HKInitializeLogging();
    HKLogMedication();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 138543362;
      v11 = self;
      _os_log_impl(&dword_1B815E000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] Samples added are of not schduled doses. Skipping reschedule.", (uint8_t *)&v10, 0xCu);
    }

  }
  return v4;
}

BOOL __70__HDMedicationDoseEventObserver__rescheduleIfNecessaryWithDoseEvents___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  _BOOL8 v3;

  v2 = a2;
  v3 = objc_msgSend(v2, "logOrigin") == 2 && objc_msgSend(v2, "status") != 1;

  return v3;
}

- (void)samplesAdded:(id)a3 anchor:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  _BOOL4 v9;
  NSObject *v10;
  _BOOL8 v11;
  void (**samplesAddedDidRecheduleHandler)(id, _BOOL8);
  HDProfile **p_profile;
  id WeakRetained;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v24[5];
  uint8_t buf[4];
  HDMedicationDoseEventObserver *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  _HKInitializeLogging();
  HKLogMedication();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG);

  if (v9)
  {
    HKLogMedication();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v6, "count"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v26 = self;
      v27 = 2114;
      v28 = v23;
      v29 = 2114;
      v30 = v7;
      _os_log_debug_impl(&dword_1B815E000, v10, OS_LOG_TYPE_DEBUG, "[%{public}@] %{public}@ new samples added. anchor: %{public}@", buf, 0x20u);

    }
  }
  -[HDMedicationDoseEventObserver _logDoseEventSamplesAdded:anchor:](self, "_logDoseEventSamplesAdded:anchor:", v6, v7);
  v11 = -[HDMedicationDoseEventObserver _rescheduleIfNecessaryWithDoseEvents:](self, "_rescheduleIfNecessaryWithDoseEvents:", v6);
  samplesAddedDidRecheduleHandler = (void (**)(id, _BOOL8))self->_samplesAddedDidRecheduleHandler;
  if (samplesAddedDidRecheduleHandler)
    samplesAddedDidRecheduleHandler[2](samplesAddedDidRecheduleHandler, v11);
  p_profile = &self->_profile;
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "syncIdentityManager");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "currentSyncIdentity");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "entity");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "persistentID");

  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __53__HDMedicationDoseEventObserver_samplesAdded_anchor___block_invoke;
  v24[3] = &__block_descriptor_40_e31_B16__0__HKMedicationDoseEvent_8l;
  v24[4] = v18;
  if (objc_msgSend(v6, "hk_containsObjectPassingTest:", v24))
  {
    -[HDMedicationNotificationSyncManager doseEventsAdded:](self->_notificationSyncManager, "doseEventsAdded:", v6);
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@ observed medication samples added"), objc_opt_class());
    v20 = objc_loadWeakRetained((id *)p_profile);
    objc_msgSend(v20, "healthMedicationsProfileExtension");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "medicationSyncRequester");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "requestSyncsWithReason:", v19);

  }
}

BOOL __53__HDMedicationDoseEventObserver_samplesAdded_anchor___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  _BOOL8 v5;

  v3 = a2;
  objc_msgSend(v3, "hd_dataOriginProvenance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "syncIdentity") == *(_QWORD *)(a1 + 32) && objc_msgSend(v3, "status") != 1;

  return v5;
}

- (void)samplesOfTypesWereRemoved:(id)a3 anchor:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  _BOOL4 v9;
  NSObject *v10;
  void *v11;
  int v12;
  NSObject *v13;
  _BOOL4 v14;
  NSObject *v15;
  void *v16;
  id WeakRetained;
  void *v18;
  void *v19;
  void *v20;
  uint8_t buf[4];
  HDMedicationDoseEventObserver *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  id v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  _HKInitializeLogging();
  HKLogMedication();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG);

  if (v9)
  {
    HKLogMedication();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v6, "count"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v22 = self;
      v23 = 2114;
      v24 = v20;
      v25 = 2114;
      v26 = v6;
      v27 = 2114;
      v28 = v7;
      _os_log_debug_impl(&dword_1B815E000, v10, OS_LOG_TYPE_DEBUG, "[%{public}@] %{public}@ samples of types removed: %{public}@. anchor: %{public}@", buf, 0x2Au);

    }
  }
  objc_msgSend(MEMORY[0x1E0CB68B0], "medicationDoseEventType");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v6, "containsObject:", v11);

  if (v12)
  {
    _HKInitializeLogging();
    HKLogMedication();
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = os_log_type_enabled(v13, OS_LOG_TYPE_INFO);

    if (v14)
    {
      HKLogMedication();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543362;
        v22 = self;
        _os_log_impl(&dword_1B815E000, v15, OS_LOG_TYPE_INFO, "[%{public}@] dose event samples removed, requesting sync", buf, 0xCu);
      }

    }
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@ observed medication samples removed"), objc_opt_class());
    WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
    objc_msgSend(WeakRetained, "healthMedicationsProfileExtension");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "medicationSyncRequester");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "requestSyncsWithReason:", v16);

  }
}

- (void)_logDoseEventSamplesAdded:(id)a3 anchor:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  int v10;
  HDMedicationDoseEventObserver *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  id v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  if ((unint64_t)objc_msgSend(v6, "count") <= 9)
  {
    objc_msgSend(v8, "appendFormat:", CFSTR("["));
    objc_msgSend(v8, "hk_appendComponentsJoinedByString:container:componentGenerator:", CFSTR(", "), v6, &__block_literal_global_214);
    objc_msgSend(v8, "appendFormat:", CFSTR("]"));
  }
  _HKInitializeLogging();
  HKLogMedication();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138544130;
    v11 = self;
    v12 = 2048;
    v13 = objc_msgSend(v6, "count");
    v14 = 2114;
    v15 = v7;
    v16 = 2114;
    v17 = v8;
    _os_log_impl(&dword_1B815E000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] %ld dose event samples added. anchor: %{public}@ %{public}@", (uint8_t *)&v10, 0x2Au);
  }

}

id __66__HDMedicationDoseEventObserver__logDoseEventSamplesAdded_anchor___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "UUID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hk_shortRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)samplesAddedDidRecheduleHandler
{
  return self->_samplesAddedDidRecheduleHandler;
}

- (void)setSamplesAddedDidRecheduleHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_samplesAddedDidRecheduleHandler, 0);
  objc_storeStrong((id *)&self->_notificationSyncManager, 0);
  objc_destroyWeak((id *)&self->_profile);
}

@end
