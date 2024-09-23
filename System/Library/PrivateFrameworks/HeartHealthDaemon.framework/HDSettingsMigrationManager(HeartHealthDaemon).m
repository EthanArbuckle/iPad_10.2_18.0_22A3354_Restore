@implementation HDSettingsMigrationManager(HeartHealthDaemon)

- (uint64_t)initWithProfile:()HeartHealthDaemon heartNotificationsUserDefaults:delegate:
{
  objc_class *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  _QWORD v18[3];

  v18[2] = *MEMORY[0x1E0C80C00];
  v8 = (objc_class *)MEMORY[0x1E0C99EA0];
  v9 = a5;
  v10 = a4;
  v11 = a3;
  v12 = (void *)objc_msgSend([v8 alloc], "initWithSuiteName:", CFSTR("com.apple.private.health.cardio-fitness"));
  objc_msgSend(MEMORY[0x1E0D29588], "crystalMigrateCardioFitnessEnabledToNotificationDetailsEnteredWithUserDefaults:", v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v18[0] = v13;
  objc_msgSend(MEMORY[0x1E0D29588], "crystalMigrateCardioFitnessOnboardingTileDismissalDateToKeyValueStorageWithUserDefaults:", v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(a1, "initWithProfile:identifier:currentMigrationVersion:migrationSteps:delegate:loggingCategory:", v11, CFSTR("HeartHealthDaemon"), 18002, v15, v9, *MEMORY[0x1E0CB52E8]);

  return v16;
}

@end
