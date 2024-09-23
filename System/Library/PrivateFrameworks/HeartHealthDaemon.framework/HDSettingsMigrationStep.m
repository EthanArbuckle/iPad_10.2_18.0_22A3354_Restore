@implementation HDSettingsMigrationStep

uint64_t __125__HDSettingsMigrationStep_HeartHealthDaemon__crystalMigrateCardioFitnessEnabledToNotificationDetailsEnteredWithUserDefaults___block_invoke(uint64_t a1, void *a2, _QWORD *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  id v11;
  NSObject *v12;
  id v14;
  uint8_t buf[4];
  const __CFString *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "hk_keyExists:", *MEMORY[0x1E0CB76E0]) & 1) != 0)
  {
    objc_msgSend(v5, "featureSettingsManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *MEMORY[0x1E0D2F9F0];
    v8 = *MEMORY[0x1E0CB5000];
    v14 = 0;
    v9 = objc_msgSend(v6, "setFeatureSettingsNumber:forKey:featureIdentifier:suppressNotificationsToObserver:error:", MEMORY[0x1E0C9AAB0], v7, v8, 0, &v14);
    v10 = v14;

    if ((v9 & 1) == 0)
    {
      _HKInitializeLogging();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52E8], OS_LOG_TYPE_ERROR))
        __125__HDSettingsMigrationStep_HeartHealthDaemon__crystalMigrateCardioFitnessEnabledToNotificationDetailsEnteredWithUserDefaults___block_invoke_cold_1();
      v11 = v10;
      if (v11)
      {
        if (a3)
          *a3 = objc_retainAutorelease(v11);
        else
          _HKLogDroppedError();
      }

    }
  }
  else
  {
    _HKInitializeLogging();
    v12 = *MEMORY[0x1E0CB52E8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52E8], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v16 = CFSTR("CrystalMigrateCardioFitnessEnablemedToNotificationDetailsEntered");
      _os_log_impl(&dword_1CC29C000, v12, OS_LOG_TYPE_DEFAULT, "[%{public}@] Migration occurred but no Cardio Fitness notifications enablement key present, not setting notification details entered", buf, 0xCu);
    }
    v9 = 1;
  }

  return v9;
}

uint64_t __134__HDSettingsMigrationStep_HeartHealthDaemon__crystalMigrateCardioFitnessOnboardingTileDismissalDateToKeyValueStorageWithUserDefaults___block_invoke(uint64_t a1, void *a2, _QWORD *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  id v10;
  NSObject *v11;
  id v13;
  uint8_t buf[4];
  const __CFString *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "hk_keyExists:", CFSTR("OnboardingTileDismissedDate")) & 1) != 0)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D294B8]), "initWithCategory:domainName:profile:", 100, CFSTR("OnboardingPromotionDismissalState"), v5);
    v7 = *MEMORY[0x1E0D2F9F8];
    v13 = 0;
    v8 = objc_msgSend(v6, "setNumber:forKey:error:", MEMORY[0x1E0C9AAB0], v7, &v13);
    v9 = v13;
    if ((v8 & 1) == 0)
    {
      _HKInitializeLogging();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52E8], OS_LOG_TYPE_ERROR))
        __134__HDSettingsMigrationStep_HeartHealthDaemon__crystalMigrateCardioFitnessOnboardingTileDismissalDateToKeyValueStorageWithUserDefaults___block_invoke_cold_1();
      v10 = v9;
      if (v10)
      {
        if (a3)
          *a3 = objc_retainAutorelease(v10);
        else
          _HKLogDroppedError();
      }

    }
  }
  else
  {
    _HKInitializeLogging();
    v11 = *MEMORY[0x1E0CB52E8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52E8], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v15 = CFSTR("CrystalMoveOnboardingTileDismissalDateToKeyValueStorage");
      _os_log_impl(&dword_1CC29C000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] Migration occurred but no Cardio Fitness onboarding dismissal key present, not setting notification details entered", buf, 0xCu);
    }
    v8 = 1;
  }

  return v8;
}

void __125__HDSettingsMigrationStep_HeartHealthDaemon__crystalMigrateCardioFitnessEnabledToNotificationDetailsEnteredWithUserDefaults___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_0_6(&dword_1CC29C000, v0, v1, "[%{public}@] Error when saving notification details entered: %{public}@", v2, v3, v4, v5, 2u);
}

void __134__HDSettingsMigrationStep_HeartHealthDaemon__crystalMigrateCardioFitnessOnboardingTileDismissalDateToKeyValueStorageWithUserDefaults___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_0_6(&dword_1CC29C000, v0, v1, "[%{public}@] Error when saving onboarding promotion dismissal state: %{public}@", v2, v3, v4, v5, 2u);
}

@end
