@implementation HDHRIrregularRhythmNotificationsSettingMigrator

- (HDHRIrregularRhythmNotificationsSettingMigrator)initWithV1FeatureAvailabilityManager:(id)a3 v2FeatureAvailabilityManager:(id)a4
{
  id v7;
  id v8;
  HDHRIrregularRhythmNotificationsSettingMigrator *v9;
  HDHRIrregularRhythmNotificationsSettingMigrator *v10;
  uint64_t v11;
  OS_dispatch_queue *queue;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HDHRIrregularRhythmNotificationsSettingMigrator;
  v9 = -[HDHRIrregularRhythmNotificationsSettingMigrator init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_v1FeatureAvailabilityManager, a3);
    objc_storeStrong((id *)&v10->_v2FeatureAvailabilityManager, a4);
    HKCreateSerialDispatchQueue();
    v11 = objc_claimAutoreleasedReturnValue();
    queue = v10->_queue;
    v10->_queue = (OS_dispatch_queue *)v11;

    -[HDHRIrregularRhythmNotificationsSettingMigrator _startObservingSettingChanges](v10, "_startObservingSettingChanges");
  }

  return v10;
}

- (void)_startObservingSettingChanges
{
  -[HDFeatureAvailabilityExtension registerObserver:queue:](self->_v1FeatureAvailabilityManager, "registerObserver:queue:", self, self->_queue);
  -[HDFeatureAvailabilityExtension registerObserver:queue:](self->_v2FeatureAvailabilityManager, "registerObserver:queue:", self, self->_queue);
}

- (void)_syncSettingIfPossibleFromSource:(id)a3
{
  void *v4;
  uint64_t v5;
  id v6;
  id v7;

  v7 = a3;
  objc_msgSend(v7, "featureIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 8;
  if (v4 == (void *)*MEMORY[0x1E0CB5040])
    v5 = 16;
  v6 = *(id *)((char *)&self->super.isa + v5);

  -[HDHRIrregularRhythmNotificationsSettingMigrator _syncSettingIfPossibleFromManager:toManager:](self, "_syncSettingIfPossibleFromManager:toManager:", v7, v6);
}

- (void)_syncSettingIfPossibleFromManager:(id)a3 toManager:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  id v38;
  void *v39;
  void *v40;
  uint64_t v41;
  NSObject *v42;
  void *v43;
  NSObject *v44;
  void *v45;
  id v46;
  void *v47;
  void *v48;
  NSObject *v49;
  NSObject *v50;
  void *v51;
  void *v52;
  void *v53;
  uint64_t v54;
  void *v55;
  id *v56;
  NSObject *v57;
  id *v58;
  void *v59;
  NSObject *v60;
  void *v61;
  void *v62;
  NSObject *v63;
  void *v64;
  id v65;
  void *v66;
  id v67;
  id v68;
  void *v69;
  NSObject *loga;
  os_log_t log;
  id v72;
  NSObject *v73;
  _QWORD v74[5];
  NSObject *v75;
  id v76;
  id v77;
  _QWORD v78[5];
  id v79;
  id v80;
  id v81;
  id v82;
  id v83;
  id v84;
  uint8_t buf[4];
  void *v86;
  __int16 v87;
  void *v88;
  __int16 v89;
  id v90;
  __int16 v91;
  void *v92;
  uint64_t v93;

  v93 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v84 = 0;
  objc_msgSend(v6, "featureOnboardingRecordWithError:", &v84);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v84;
  v10 = v9;
  if (v8)
  {
    v83 = v9;
    objc_msgSend(v7, "featureOnboardingRecordWithError:", &v83);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v83;

    if (!v11)
    {
      _HKInitializeLogging();
      v25 = (void *)*MEMORY[0x1E0CB52F0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52F0], OS_LOG_TYPE_ERROR))
      {
        v19 = v25;
        v26 = (void *)objc_opt_class();
        v27 = v12;
        v28 = v26;
        objc_msgSend(v7, "featureIdentifier");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v86 = v26;
        v87 = 2114;
        v88 = v29;
        v89 = 2114;
        v90 = v27;
        _os_log_error_impl(&dword_1CC29C000, v19, OS_LOG_TYPE_ERROR, "[%{public}@] Failed to retrieve onboarding record for %{public}@: %{public}@", buf, 0x20u);

        v12 = v27;
LABEL_36:

        goto LABEL_37;
      }
      goto LABEL_37;
    }
    if (objc_msgSend(v8, "onboardingState") == 1)
    {
      _HKInitializeLogging();
      v13 = (void *)*MEMORY[0x1E0CB52F0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52F0], OS_LOG_TYPE_DEFAULT))
      {
        loga = v13;
        v14 = v12;
        v15 = (void *)objc_opt_class();
        v72 = v15;
        objc_msgSend(v6, "featureIdentifier");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "featureIdentifier");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "featureIdentifier");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v86 = v15;
        v12 = v14;
        v87 = 2114;
        v88 = v16;
        v89 = 2114;
        v90 = v17;
        v91 = 2114;
        v92 = v18;
        v19 = loga;
        _os_log_impl(&dword_1CC29C000, loga, OS_LOG_TYPE_DEFAULT, "[%{public}@] Skipping setting sync from %{public}@ to %{public}@: %{public}@ is not onboarded", buf, 0x2Au);

LABEL_13:
        goto LABEL_36;
      }
      goto LABEL_37;
    }
    if (objc_msgSend(v11, "onboardingState") == 1)
    {
      _HKInitializeLogging();
      v30 = (void *)*MEMORY[0x1E0CB52F0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52F0], OS_LOG_TYPE_DEFAULT))
      {
        v19 = v30;
        v31 = (void *)objc_opt_class();
        v72 = v31;
        objc_msgSend(v6, "featureIdentifier");
        v32 = v12;
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "featureIdentifier");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "featureIdentifier");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v86 = v31;
        v87 = 2114;
        v88 = v33;
        v89 = 2114;
        v90 = v34;
        v91 = 2114;
        v92 = v35;
        _os_log_impl(&dword_1CC29C000, v19, OS_LOG_TYPE_DEFAULT, "[%{public}@] Skipping setting sync from %{public}@ to %{public}@: %{public}@ is not onboarded", buf, 0x2Au);

        v12 = v32;
        goto LABEL_13;
      }
LABEL_37:

      v10 = v12;
      goto LABEL_38;
    }
    objc_msgSend(v8, "featureSettings");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = *MEMORY[0x1E0CB50C8];
    v82 = v12;
    objc_msgSend(v36, "numberForKey:error:", v37, &v82);
    v19 = objc_claimAutoreleasedReturnValue();
    v38 = v82;

    if (!v19 && v38)
    {
      _HKInitializeLogging();
      v39 = (void *)*MEMORY[0x1E0CB52F0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52F0], OS_LOG_TYPE_ERROR))
      {
        v63 = v39;
        v64 = (void *)objc_opt_class();
        v65 = v64;
        objc_msgSend(v6, "featureIdentifier");
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v86 = v64;
        v87 = 2114;
        v88 = v66;
        v89 = 2114;
        v90 = v38;
        _os_log_error_impl(&dword_1CC29C000, v63, OS_LOG_TYPE_ERROR, "[%{public}@] Error retrieving setting for %{public}@: %{public}@", buf, 0x20u);

      }
      v12 = v38;
      goto LABEL_36;
    }
    v73 = v19;
    objc_msgSend(v11, "featureSettings");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v81 = v38;
    objc_msgSend(v40, "numberForKey:error:", v37, &v81);
    v41 = objc_claimAutoreleasedReturnValue();
    v12 = v81;

    v42 = v41;
    if (v41 || !v12)
    {
      v19 = v73;
      if (v73 == v42 || v42 && -[NSObject isEqual:](v73, "isEqual:", v42))
      {
        _HKInitializeLogging();
        v48 = (void *)*MEMORY[0x1E0CB52F0];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52F0], OS_LOG_TYPE_DEFAULT))
        {
          v49 = v48;
          v50 = v42;
          v51 = (void *)objc_opt_class();
          v68 = v51;
          objc_msgSend(v6, "featureIdentifier");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "featureIdentifier");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v86 = v51;
          v42 = v50;
          v19 = v73;
          v87 = 2114;
          v88 = v52;
          v89 = 2114;
          v90 = v53;
          _os_log_impl(&dword_1CC29C000, v49, OS_LOG_TYPE_DEFAULT, "[%{public}@] Skipping setting sync from %{public}@ to %{public}@: setting values already match", buf, 0x20u);

        }
        goto LABEL_35;
      }
      objc_msgSend(v7, "featureIdentifier");
      v54 = objc_claimAutoreleasedReturnValue();
      v55 = (void *)v54;
      log = v42;
      if (v73)
      {
        v74[0] = MEMORY[0x1E0C809B0];
        v74[1] = 3221225472;
        v74[2] = __95__HDHRIrregularRhythmNotificationsSettingMigrator__syncSettingIfPossibleFromManager_toManager___block_invoke_186;
        v74[3] = &unk_1E87EF908;
        v74[4] = self;
        v56 = (id *)&v75;
        v57 = v73;
        v75 = v57;
        v58 = &v76;
        v76 = v6;
        v77 = v55;
        objc_msgSend(v7, "setFeatureSettingNumber:forKey:completion:", v57, v37, v74);

      }
      else
      {
        v69 = (void *)v54;
        _HKInitializeLogging();
        v59 = (void *)*MEMORY[0x1E0CB52F0];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52F0], OS_LOG_TYPE_DEFAULT))
        {
          v60 = v59;
          v61 = (void *)objc_opt_class();
          v67 = v61;
          objc_msgSend(v6, "featureIdentifier");
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v86 = v61;
          v87 = 2114;
          v88 = v62;
          _os_log_impl(&dword_1CC29C000, v60, OS_LOG_TYPE_DEFAULT, "[%{public}@] Detected removal of setting from %{public}@", buf, 0x16u);

        }
        v78[0] = MEMORY[0x1E0C809B0];
        v78[1] = 3221225472;
        v78[2] = __95__HDHRIrregularRhythmNotificationsSettingMigrator__syncSettingIfPossibleFromManager_toManager___block_invoke;
        v78[3] = &unk_1E87EF8E0;
        v78[4] = self;
        v56 = &v79;
        v79 = v6;
        v58 = &v80;
        v55 = v69;
        v80 = v69;
        objc_msgSend(v7, "removeFeatureSettingValueForKey:completion:", v37, v78);
      }

      v42 = log;
    }
    else
    {
      _HKInitializeLogging();
      v43 = (void *)*MEMORY[0x1E0CB52F0];
      v19 = v73;
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52F0], OS_LOG_TYPE_ERROR))
      {
LABEL_35:

        goto LABEL_36;
      }
      v44 = v43;
      v45 = (void *)objc_opt_class();
      v46 = v45;
      objc_msgSend(v7, "featureIdentifier");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v86 = v45;
      v87 = 2114;
      v88 = v47;
      v89 = 2114;
      v90 = v12;
      _os_log_error_impl(&dword_1CC29C000, v44, OS_LOG_TYPE_ERROR, "[%{public}@] Error retrieving setting for %{public}@: %{public}@", buf, 0x20u);

      v42 = 0;
    }
    v19 = v73;
    goto LABEL_35;
  }
  _HKInitializeLogging();
  v20 = (void *)*MEMORY[0x1E0CB52F0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52F0], OS_LOG_TYPE_ERROR))
  {
    v21 = v20;
    v22 = (void *)objc_opt_class();
    v23 = v22;
    objc_msgSend(v6, "featureIdentifier");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v86 = v22;
    v87 = 2114;
    v88 = v24;
    v89 = 2114;
    v90 = v10;
    _os_log_error_impl(&dword_1CC29C000, v21, OS_LOG_TYPE_ERROR, "[%{public}@] Failed to retrieve onboarding record for %{public}@: %{public}@", buf, 0x20u);

  }
LABEL_38:

}

void __95__HDHRIrregularRhythmNotificationsSettingMigrator__syncSettingIfPossibleFromManager_toManager___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  _HKInitializeLogging();
  v6 = (void *)*MEMORY[0x1E0CB52F0];
  v7 = *MEMORY[0x1E0CB52F0];
  if (a2)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = v6;
      v9 = (void *)objc_opt_class();
      v10 = *(void **)(a1 + 40);
      v11 = v9;
      objc_msgSend(v10, "featureIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = *(_QWORD *)(a1 + 48);
      v14 = 138543874;
      v15 = v9;
      v16 = 2114;
      v17 = v12;
      v18 = 2114;
      v19 = v13;
      _os_log_impl(&dword_1CC29C000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] Successfully synced setting (removal) from %{public}@ to %{public}@", (uint8_t *)&v14, 0x20u);

    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    __95__HDHRIrregularRhythmNotificationsSettingMigrator__syncSettingIfPossibleFromManager_toManager___block_invoke_cold_1(a1, v6);
  }

}

void __95__HDHRIrregularRhythmNotificationsSettingMigrator__syncSettingIfPossibleFromManager_toManager___block_invoke_186(_QWORD *a1, int a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  uint64_t v14;
  int v15;
  void *v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  _HKInitializeLogging();
  v6 = (void *)*MEMORY[0x1E0CB52F0];
  v7 = *MEMORY[0x1E0CB52F0];
  if (a2)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = v6;
      v9 = (void *)objc_opt_class();
      v11 = a1[5];
      v10 = (void *)a1[6];
      v12 = v9;
      objc_msgSend(v10, "featureIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = a1[7];
      v15 = 138544130;
      v16 = v9;
      v17 = 2114;
      v18 = v11;
      v19 = 2114;
      v20 = v13;
      v21 = 2114;
      v22 = v14;
      _os_log_impl(&dword_1CC29C000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] Successfully synced updated setting (%{public}@) from %{public}@ to %{public}@", (uint8_t *)&v15, 0x2Au);

    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    __95__HDHRIrregularRhythmNotificationsSettingMigrator__syncSettingIfPossibleFromManager_toManager___block_invoke_186_cold_1((uint64_t)a1, v6);
  }

}

- (HDFeatureAvailabilityExtension)v1FeatureAvailabilityManager
{
  return self->_v1FeatureAvailabilityManager;
}

- (HDFeatureAvailabilityExtension)v2FeatureAvailabilityManager
{
  return self->_v2FeatureAvailabilityManager;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_v2FeatureAvailabilityManager, 0);
  objc_storeStrong((id *)&self->_v1FeatureAvailabilityManager, 0);
}

void __95__HDHRIrregularRhythmNotificationsSettingMigrator__syncSettingIfPossibleFromManager_toManager___block_invoke_cold_1(uint64_t a1, void *a2)
{
  void *v2;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint8_t v14;

  OUTLINED_FUNCTION_3_1(a1, a2);
  v4 = (void *)OUTLINED_FUNCTION_4_0();
  v5 = *(void **)(a1 + 40);
  v6 = v4;
  objc_msgSend(v5, "featureIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_2(&dword_1CC29C000, v8, v9, "[%{public}@] Error syncing setting (removal) from %{public}@ to %{public}@: %{public}@", v10, v11, v12, v13, v14);

  OUTLINED_FUNCTION_2_1();
}

void __95__HDHRIrregularRhythmNotificationsSettingMigrator__syncSettingIfPossibleFromManager_toManager___block_invoke_186_cold_1(uint64_t a1, void *a2)
{
  void *v2;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint8_t v14;

  OUTLINED_FUNCTION_3_1(a1, a2);
  v4 = (void *)OUTLINED_FUNCTION_4_0();
  v5 = *(void **)(a1 + 48);
  v6 = v4;
  objc_msgSend(v5, "featureIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_2(&dword_1CC29C000, v8, v9, "[%{public}@] Error syncing setting from %{public}@ to %{public}@: %{public}@", v10, v11, v12, v13, v14);

  OUTLINED_FUNCTION_2_1();
}

@end
