@implementation HDKeyValueDomain(HDMCUnconfirmedDeviationNotification)

+ (id)hdmc_menstrualCyclesUnconfirmedDeviationNotificationStateSyncedUnprotectedDomainWithProfile:()HDMCUnconfirmedDeviationNotification
{
  objc_class *v3;
  id v4;
  void *v5;

  v3 = (objc_class *)MEMORY[0x24BE40AD0];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithCategory:domainName:profile:", 1, CFSTR("com.apple.private.health.menstrual-cycles.unconfirmed-deviation-notification-state"), v4);

  return v5;
}

- (uint64_t)hdmc_menstrualCyclesUnconfirmedDeviationNotificationSetValuesWithState:()HDMCUnconfirmedDeviationNotification error:
{
  id v7;
  void *v8;
  char v9;
  char v10;
  id v11;
  void *v12;
  os_log_t *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  id v17;
  void *v18;
  char v19;
  id v20;
  os_log_t v21;
  NSObject *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  os_log_t v29;
  NSObject *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  id v39;
  uint8_t buf[4];
  void *v41;
  __int16 v42;
  void *v43;
  __int16 v44;
  void *v45;
  __int16 v46;
  id v47;
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  objc_msgSend(a1, "domainName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("com.apple.private.health.menstrual-cycles.unconfirmed-deviation-notification-state"));

  if ((v9 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HDKeyValueDomain+HKMenstrualCycles.m"), 165, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[self.domainName isEqualToString:HKMCMenstrualCyclesUnconfirmedDeviationNotificationStateDomain]"));

  }
  if (objc_msgSend(a1, "category") != 1)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HDKeyValueDomain+HKMenstrualCycles.m"), 166, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("self.category == HDKeyValueEntityCategoryNanoUserDefaults"));

  }
  v39 = 0;
  v10 = objc_msgSend(a1, "setValueForAllKeys:error:", 0, &v39);
  v11 = v39;
  v12 = v11;
  if ((v10 & 1) == 0)
  {
    v20 = v11;
    if (v20)
    {
      if (a4)
        *a4 = objc_retainAutorelease(v20);
      else
        _HKLogDroppedError();
    }

    _HKInitializeLogging();
    v28 = (void *)*MEMORY[0x24BDD3030];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_ERROR))
      -[HDKeyValueDomain(HDMCUnconfirmedDeviationNotification) hdmc_menstrualCyclesUnconfirmedDeviationNotificationSetValuesWithState:error:].cold.1(v28, (uint64_t)a1, (uint64_t)v20);
    goto LABEL_24;
  }
  _HKInitializeLogging();
  v13 = (os_log_t *)MEMORY[0x24BDD3030];
  v14 = (void *)*MEMORY[0x24BDD3030];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_DEFAULT))
  {
    v15 = v14;
    v16 = (void *)objc_opt_class();
    *(_DWORD *)buf = 138543362;
    v41 = v16;
    v17 = v16;
    _os_log_impl(&dword_21961B000, v15, OS_LOG_TYPE_DEFAULT, "[%{public}@] Cleared key value domain of unconfirmed deviation notification state", buf, 0xCu);

  }
  objc_msgSend(v7, "dictionaryRepresentation");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = v12;
  v19 = objc_msgSend(a1, "setValuesWithDictionary:error:", v18, &v38);
  v20 = v38;

  if ((v19 & 1) == 0)
  {
    v20 = v20;
    if (v20)
    {
      if (a4)
        *a4 = objc_retainAutorelease(v20);
      else
        _HKLogDroppedError();
    }

    _HKInitializeLogging();
    v29 = *v13;
    if (os_log_type_enabled(*v13, OS_LOG_TYPE_ERROR))
    {
      v31 = v29;
      v32 = (void *)objc_opt_class();
      v33 = v32;
      HKSensitiveLogItem();
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "domainName");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v41 = v32;
      v42 = 2112;
      v43 = v34;
      v44 = 2112;
      v45 = v35;
      v46 = 2114;
      v47 = v20;
      _os_log_error_impl(&dword_21961B000, v31, OS_LOG_TYPE_ERROR, "[%{public}@] Error saving state:%@ in key value domain: %@ error: %{public}@", buf, 0x2Au);

    }
LABEL_24:
    v27 = 0;
    goto LABEL_25;
  }
  _HKInitializeLogging();
  v21 = *v13;
  if (os_log_type_enabled(*v13, OS_LOG_TYPE_DEFAULT))
  {
    v22 = v21;
    v23 = (void *)objc_opt_class();
    v24 = v23;
    HKSensitiveLogItem();
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "domainName");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v41 = v23;
    v42 = 2112;
    v43 = v25;
    v44 = 2112;
    v45 = v26;
    _os_log_impl(&dword_21961B000, v22, OS_LOG_TYPE_DEFAULT, "[%{public}@] Successfully saved new state:%@ in key value domain:%@", buf, 0x20u);

  }
  v27 = 1;
LABEL_25:

  return v27;
}

- (id)hdmc_menstrualCyclesUnconfirmedDeviationNotificationGetStateWithError:()HDMCUnconfirmedDeviationNotification
{
  void *v6;
  char v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v15;
  void *v16;
  id v17;

  objc_msgSend(a1, "domainName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.private.health.menstrual-cycles.unconfirmed-deviation-notification-state"));

  if ((v7 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HDKeyValueDomain+HKMenstrualCycles.m"), 189, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[self.domainName isEqualToString:HKMCMenstrualCyclesUnconfirmedDeviationNotificationStateDomain]"));

  }
  if (objc_msgSend(a1, "category") != 1)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HDKeyValueDomain+HKMenstrualCycles.m"), 190, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("self.category == HDKeyValueEntityCategoryNanoUserDefaults"));

  }
  v17 = 0;
  objc_msgSend(a1, "allValuesWithError:", &v17);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v17;
  v10 = v9;
  if (v8)
  {
    +[HDMCUnconfirmedDeviationNotificationStateMachineState stateFromDictionaryRepresentation:](HDMCUnconfirmedDeviationNotificationStateMachineState, "stateFromDictionaryRepresentation:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = v9;
    if (v12)
    {
      if (a3)
        *a3 = objc_retainAutorelease(v12);
      else
        _HKLogDroppedError();
    }

    _HKInitializeLogging();
    v13 = (void *)*MEMORY[0x24BDD3030];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_ERROR))
      -[HDKeyValueDomain(HDMCOvulationConfirmationNotification) hdmc_menstrualCyclesOvulationConfirmationNotificationGetStateWithError:].cold.1(v13, a1);
    v11 = 0;
  }

  return v11;
}

- (void)hdmc_menstrualCyclesUnconfirmedDeviationNotificationSetValuesWithState:()HDMCUnconfirmedDeviationNotification error:.cold.1(void *a1, uint64_t a2, uint64_t a3)
{
  NSObject *v3;
  id v5;
  id v6;
  int v7;
  id v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v5 = a1;
  v7 = 138543618;
  v8 = (id)OUTLINED_FUNCTION_3();
  v9 = 2114;
  v10 = a3;
  v6 = v8;
  _os_log_error_impl(&dword_21961B000, v3, OS_LOG_TYPE_ERROR, "[%{public}@] Error clearing key value domain of unconfirmed deviation notification state: %{public}@", (uint8_t *)&v7, 0x16u);

}

@end
