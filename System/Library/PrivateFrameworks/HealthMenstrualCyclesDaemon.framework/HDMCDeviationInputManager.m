@implementation HDMCDeviationInputManager

- (HDMCDeviationInputManager)initWithProfile:(id)a3
{
  id v4;
  HDMCDeviationInputManager *v5;
  HDMCDeviationInputManager *v6;
  uint64_t v7;
  HDKeyValueDomain *keyValueDomain;
  uint64_t v9;
  HDKeyValueDomain *analyticsKeyValueDomain;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HDMCDeviationInputManager;
  v5 = -[HDMCDeviationInputManager init](&v12, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_profile, v4);
    objc_msgSend(MEMORY[0x24BE40AD0], "hdmc_syncedMenstrualCyclesDefaultsDomainWithProfile:", v4);
    v7 = objc_claimAutoreleasedReturnValue();
    keyValueDomain = v6->_keyValueDomain;
    v6->_keyValueDomain = (HDKeyValueDomain *)v7;

    objc_msgSend(MEMORY[0x24BE40AD0], "hdmc_deviationDetectionAnalyticsProtectedDomainWithProfile:", v4);
    v9 = objc_claimAutoreleasedReturnValue();
    analyticsKeyValueDomain = v6->_analyticsKeyValueDomain;
    v6->_analyticsKeyValueDomain = (HDKeyValueDomain *)v9;

  }
  return v6;
}

- (BOOL)clearStateIfNecessaryFromSettings:(id)a3 usageRequirementsSatisfied:(BOOL)a4 error:(id *)a5
{
  HDKeyValueDomain *keyValueDomain;
  void *v10;
  id v11;
  HDKeyValueDomain *v12;
  BOOL v13;
  id v14;
  id WeakRetained;
  uint64_t v16;
  id v17;
  void *v18;
  void *v19;
  objc_class *v20;
  void *v21;
  HDKeyValueDomain *analyticsKeyValueDomain;
  id v23;
  void *v24;
  NSObject *v25;
  NSObject *v26;
  void *v27;
  id v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  NSObject *v33;
  void *v34;
  id v35;
  id v36;
  _QWORD v37[5];
  id v38;
  id v39;
  uint8_t buf[4];
  void *v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend(a3, "deviationDetectionEnabledForAnyType") && a4)
    return 1;
  keyValueDomain = self->_keyValueDomain;
  v39 = 0;
  -[HDKeyValueDomain hdmc_unconfirmedDeviationDismissalDayIndexWithError:](keyValueDomain, "hdmc_unconfirmedDeviationDismissalDayIndexWithError:", &v39);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v39;

  if (v10)
  {

    v12 = self->_keyValueDomain;
    v38 = 0;
    v13 = -[HDKeyValueDomain hdmc_setUnconfirmedDeviationDismissalDayIndex:error:](v12, "hdmc_setUnconfirmedDeviationDismissalDayIndex:error:", 0, &v38);
    v14 = v38;
    if (v13)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
      objc_msgSend(WeakRetained, "cloudSyncManager");
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = objc_alloc(MEMORY[0x24BDD3A00]);
      v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD3998]), "initWithPush:pull:lite:", 1, 0, 1);
      v19 = (void *)objc_msgSend(v17, "initWithChangesSyncRequest:", v18);
      v20 = (objc_class *)objc_opt_class();
      NSStringFromClass(v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v37[0] = MEMORY[0x24BDAC760];
      v37[1] = 3221225472;
      v37[2] = __96__HDMCDeviationInputManager_clearStateIfNecessaryFromSettings_usageRequirementsSatisfied_error___block_invoke;
      v37[3] = &unk_24DB21C90;
      v37[4] = self;
      objc_msgSend((id)v16, "syncWithRequest:reason:completion:", v19, v21, v37);

      analyticsKeyValueDomain = self->_analyticsKeyValueDomain;
      v36 = v14;
      LOBYTE(v16) = -[HDKeyValueDomain setValueForAllKeys:error:](analyticsKeyValueDomain, "setValueForAllKeys:error:", 0, &v36);
      v23 = v36;

      _HKInitializeLogging();
      v24 = (void *)*MEMORY[0x24BDD3030];
      v25 = *MEMORY[0x24BDD3030];
      if ((v16 & 1) != 0)
      {
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          v26 = v24;
          v27 = (void *)objc_opt_class();
          *(_DWORD *)buf = 138543362;
          v41 = v27;
          v28 = v27;
          _os_log_impl(&dword_21961B000, v26, OS_LOG_TYPE_DEFAULT, "[%{public}@] Cleared key value domain of deviation detection analytics state", buf, 0xCu);

        }
        return 1;
      }
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        -[HDMCDeviationInputManager clearStateIfNecessaryFromSettings:usageRequirementsSatisfied:error:].cold.1(v24);
      v30 = v23;
    }
    else
    {
      _HKInitializeLogging();
      v29 = (void *)*MEMORY[0x24BDD3030];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_ERROR))
        -[HDMCDeviationInputManager clearStateIfNecessaryFromSettings:usageRequirementsSatisfied:error:].cold.2(v29);
      v30 = v14;
    }
    v31 = v30;
    if (v30)
    {
      if (a5)
        *a5 = objc_retainAutorelease(v30);
      else
        _HKLogDroppedError();
    }

  }
  else
  {
    if (!v11)
    {
      _HKInitializeLogging();
      v32 = (void *)*MEMORY[0x24BDD3030];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_DEFAULT))
      {
        v33 = v32;
        v34 = (void *)objc_opt_class();
        *(_DWORD *)buf = 138543362;
        v41 = v34;
        v35 = v34;
        _os_log_impl(&dword_21961B000, v33, OS_LOG_TYPE_DEFAULT, "[%{public}@] No value to clear in key-value domain", buf, 0xCu);

      }
      return 1;
    }
    if (a5)
      *a5 = objc_retainAutorelease(v11);
    else
      _HKLogDroppedError();

  }
  return 0;
}

void __96__HDMCDeviationInputManager_clearStateIfNecessaryFromSettings_usageRequirementsSatisfied_error___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  id v9;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  _HKInitializeLogging();
  v6 = (void *)*MEMORY[0x24BDD3030];
  v7 = *MEMORY[0x24BDD3030];
  if (a2)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = v6;
      v10 = 138543362;
      v11 = (id)objc_opt_class();
      v9 = v11;
      _os_log_impl(&dword_21961B000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] Cloud sync request completed", (uint8_t *)&v10, 0xCu);

    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    __96__HDMCDeviationInputManager_clearStateIfNecessaryFromSettings_usageRequirementsSatisfied_error___block_invoke_cold_1(a1, v6);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_analyticsKeyValueDomain, 0);
  objc_storeStrong((id *)&self->_keyValueDomain, 0);
  objc_destroyWeak((id *)&self->_profile);
}

- (void)clearStateIfNecessaryFromSettings:(void *)a1 usageRequirementsSatisfied:error:.cold.1(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  v2 = a1;
  v3 = (void *)OUTLINED_FUNCTION_3();
  v4 = OUTLINED_FUNCTION_0(v3);
  OUTLINED_FUNCTION_1(&dword_21961B000, v5, v6, "[%{public}@] Error clearing key value domain of deviation detection analytics state: %{public}@", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_2();
}

- (void)clearStateIfNecessaryFromSettings:(void *)a1 usageRequirementsSatisfied:error:.cold.2(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  v2 = a1;
  v3 = (void *)OUTLINED_FUNCTION_3();
  v4 = OUTLINED_FUNCTION_0(v3);
  OUTLINED_FUNCTION_1(&dword_21961B000, v5, v6, "[%{public}@] Error clearing key value domain of dismissal day index state: %{public}@", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_2();
}

void __96__HDMCDeviationInputManager_clearStateIfNecessaryFromSettings_usageRequirementsSatisfied_error___block_invoke_cold_1(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  v3 = a2;
  v4 = (void *)OUTLINED_FUNCTION_3();
  v5 = OUTLINED_FUNCTION_0(v4);
  OUTLINED_FUNCTION_1(&dword_21961B000, v6, v7, "[%{public}@] Cloud sync request failed: %{public}@", v8, v9, v10, v11, v12);

  OUTLINED_FUNCTION_2();
}

@end
