@implementation HDKeyValueDomain(HDMCOvulationConfirmationNotification)

+ (id)hdmc_menstrualCyclesOvulationConfirmationNotificationStateSyncedUnprotectedDomainWithProfile:()HDMCOvulationConfirmationNotification
{
  objc_class *v3;
  id v4;
  void *v5;

  v3 = (objc_class *)MEMORY[0x24BE40AD0];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithCategory:domainName:profile:", 1, CFSTR("com.apple.private.health.menstrual-cycles.ovulation-confirmation-notification-state"), v4);

  return v5;
}

- (uint64_t)hdmc_menstrualCyclesOvulationConfirmationNotificationSetValuesWithState:()HDMCOvulationConfirmationNotification error:
{
  id v7;
  void *v8;
  char v9;
  void *v10;
  uint64_t v11;
  void *v13;
  void *v14;

  v7 = a3;
  objc_msgSend(a1, "domainName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("com.apple.private.health.menstrual-cycles.ovulation-confirmation-notification-state"));

  if ((v9 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HDKeyValueDomain+HKMenstrualCycles.m"), 135, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[self.domainName isEqualToString:HKMCMenstrualCyclesOvulationConfirmationNotificationStateDomain]"));

  }
  if (objc_msgSend(a1, "category") != 1)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HDKeyValueDomain+HKMenstrualCycles.m"), 136, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("self.category == HDKeyValueEntityCategoryNanoUserDefaults"));

  }
  objc_msgSend(v7, "dictionaryRepresentation");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(a1, "setValuesWithDictionary:error:", v10, a4);

  return v11;
}

- (id)hdmc_menstrualCyclesOvulationConfirmationNotificationGetStateWithError:()HDMCOvulationConfirmationNotification
{
  void *v6;
  char v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v14;
  void *v15;
  id v16;

  objc_msgSend(a1, "domainName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.private.health.menstrual-cycles.ovulation-confirmation-notification-state"));

  if ((v7 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HDKeyValueDomain+HKMenstrualCycles.m"), 141, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[self.domainName isEqualToString:HKMCMenstrualCyclesOvulationConfirmationNotificationStateDomain]"));

  }
  if (objc_msgSend(a1, "category") != 1)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HDKeyValueDomain+HKMenstrualCycles.m"), 142, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("self.category == HDKeyValueEntityCategoryNanoUserDefaults"));

  }
  v16 = 0;
  objc_msgSend(a1, "allValuesWithError:", &v16);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v16;
  if (v8)
  {
    +[HDMCOvulationConfirmationNotificationStateMachineState stateFromDictionaryRepresentation:](HDMCOvulationConfirmationNotificationStateMachineState, "stateFromDictionaryRepresentation:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    _HKInitializeLogging();
    v11 = (void *)*MEMORY[0x24BDD3030];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_ERROR))
      -[HDKeyValueDomain(HDMCOvulationConfirmationNotification) hdmc_menstrualCyclesOvulationConfirmationNotificationGetStateWithError:].cold.1(v11, a1);
    v12 = v9;
    if (v12)
    {
      if (a3)
        *a3 = objc_retainAutorelease(v12);
      else
        _HKLogDroppedError();
    }

    v10 = 0;
  }

  return v10;
}

- (void)hdmc_menstrualCyclesOvulationConfirmationNotificationGetStateWithError:()HDMCOvulationConfirmationNotification .cold.1(void *a1, void *a2)
{
  void *v2;
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint8_t v13;

  v4 = a1;
  v5 = (id)OUTLINED_FUNCTION_3();
  objc_msgSend(a2, "domainName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_21961B000, v7, v8, "[%{public}@] Error retrieving dictionary from key value domain: %@ error:%@", v9, v10, v11, v12, v13);

  OUTLINED_FUNCTION_3_0();
}

@end
