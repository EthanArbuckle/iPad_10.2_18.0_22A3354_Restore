@implementation HDSettingsMigrationStep

uint64_t __124__HDSettingsMigrationStep_HealthMobilityDaemon__crystalMigrateWalkingSteadinessEnablementToFeatureSettingsWithUserDefaults___block_invoke(uint64_t a1, void *a2, _QWORD *a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  id v12;
  NSObject *v13;
  id v15;
  uint8_t buf[4];
  const __CFString *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "hk_keyExists:", CFSTR("EnableWalkingSteadinessNotifications")) & 1) != 0)
  {
    objc_msgSend(v5, "featureSettingsManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "BOOLForKey:", CFSTR("EnableWalkingSteadinessNotifications")));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *MEMORY[0x24BDD2EB0];
    v9 = *MEMORY[0x24BDD2EA0];
    v15 = 0;
    v10 = objc_msgSend(v6, "setFeatureSettingsNumber:forKey:featureIdentifier:suppressNotificationsToObserver:error:", v7, v8, v9, 0, &v15);
    v11 = v15;

    if ((v10 & 1) == 0)
    {
      _HKInitializeLogging();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3040], OS_LOG_TYPE_ERROR))
        __124__HDSettingsMigrationStep_HealthMobilityDaemon__crystalMigrateWalkingSteadinessEnablementToFeatureSettingsWithUserDefaults___block_invoke_cold_1();
      v12 = v11;
      if (v12)
      {
        if (a3)
          *a3 = objc_retainAutorelease(v12);
        else
          _HKLogDroppedError();
      }

    }
  }
  else
  {
    _HKInitializeLogging();
    v13 = *MEMORY[0x24BDD3040];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3040], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v17 = CFSTR("CrystalMigrateWalkingSteadinessEnablementToFeatureSettings");
      _os_log_impl(&dword_2160FB000, v13, OS_LOG_TYPE_DEFAULT, "[%{public}@] Migration occurred but no Walking Steadiness notifications enablement key present, not setting enablement feature setting", buf, 0xCu);
    }
    v10 = 1;
  }

  return v10;
}

uint64_t __145__HDSettingsMigrationStep_HealthMobilityDaemon__crystalMigrateWalkingSteadinessMoveOnboardingTileDismissalDateToKeyValueStorageWithUserDefaults___block_invoke(uint64_t a1, void *a2, _QWORD *a3)
{
  id v5;
  void (**v6)(_QWORD);
  void *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  NSObject *v11;
  id v12;
  id v14;
  _QWORD v15[4];
  id v16;
  uint8_t buf[4];
  const __CFString *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __145__HDSettingsMigrationStep_HealthMobilityDaemon__crystalMigrateWalkingSteadinessMoveOnboardingTileDismissalDateToKeyValueStorageWithUserDefaults___block_invoke_2;
  v15[3] = &unk_24D4DF948;
  v16 = *(id *)(a1 + 32);
  v6 = (void (**)(_QWORD))MEMORY[0x2199F50B4](v15);
  if ((objc_msgSend(*(id *)(a1 + 32), "hk_keyExists:", CFSTR("OnboardingTileDismissedDate")) & 1) != 0)
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE40AD0]), "initWithCategory:domainName:profile:", 100, CFSTR("OnboardingPromotionDismissalState"), v5);
    v8 = *MEMORY[0x24BE46D50];
    v14 = 0;
    v9 = objc_msgSend(v7, "setNumber:forKey:error:", MEMORY[0x24BDBD1C8], v8, &v14);
    v10 = v14;
    if ((v9 & 1) != 0)
    {
      v6[2](v6);
    }
    else
    {
      _HKInitializeLogging();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3040], OS_LOG_TYPE_ERROR))
        __145__HDSettingsMigrationStep_HealthMobilityDaemon__crystalMigrateWalkingSteadinessMoveOnboardingTileDismissalDateToKeyValueStorageWithUserDefaults___block_invoke_cold_1();
      v12 = v10;
      if (v12)
      {
        if (a3)
          *a3 = objc_retainAutorelease(v12);
        else
          _HKLogDroppedError();
      }

    }
  }
  else
  {
    _HKInitializeLogging();
    v11 = *MEMORY[0x24BDD3040];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3040], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v18 = CFSTR("CrystalMigrateWalkingSteadinessOnboardingTileDismissalDateToKeyValueStorage");
      _os_log_impl(&dword_2160FB000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] Migration occurred but no Walking Steadiness onboarding dismissal key present, not setting notification details entered", buf, 0xCu);
    }
    v6[2](v6);
    v9 = 1;
  }

  return v9;
}

uint64_t __145__HDSettingsMigrationStep_HealthMobilityDaemon__crystalMigrateWalkingSteadinessMoveOnboardingTileDismissalDateToKeyValueStorageWithUserDefaults___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  int v4;
  const __CFString *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  _HKInitializeLogging();
  v2 = *MEMORY[0x24BDD3040];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3040], OS_LOG_TYPE_DEFAULT))
  {
    v4 = 138543362;
    v5 = CFSTR("CrystalMigrateWalkingSteadinessOnboardingTileDismissalDateToKeyValueStorage");
    _os_log_impl(&dword_2160FB000, v2, OS_LOG_TYPE_DEFAULT, "[%{public}@] Deleting the old defaults domain", (uint8_t *)&v4, 0xCu);
  }
  return objc_msgSend(*(id *)(a1 + 32), "removePersistentDomainForName:", CFSTR("com.apple.private.health.walking-steadiness"));
}

void __124__HDSettingsMigrationStep_HealthMobilityDaemon__crystalMigrateWalkingSteadinessEnablementToFeatureSettingsWithUserDefaults___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2160FB000, v0, v1, "[%{public}@] Error when saving notification details entered: %{public}@", v2, v3, v4, v5, 2u);
}

void __145__HDSettingsMigrationStep_HealthMobilityDaemon__crystalMigrateWalkingSteadinessMoveOnboardingTileDismissalDateToKeyValueStorageWithUserDefaults___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2160FB000, v0, v1, "[%{public}@] Error when saving onboarding promotion dismissal state: %{public}@", v2, v3, v4, v5, 2u);
}

@end
