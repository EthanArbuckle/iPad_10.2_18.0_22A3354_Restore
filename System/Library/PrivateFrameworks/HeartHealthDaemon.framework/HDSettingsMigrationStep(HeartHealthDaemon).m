@implementation HDSettingsMigrationStep(HeartHealthDaemon)

+ (id)crystalMigrateCardioFitnessEnabledToNotificationDetailsEnteredWithUserDefaults:()HeartHealthDaemon
{
  id v4;
  id v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  v5 = [a1 alloc];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __125__HDSettingsMigrationStep_HeartHealthDaemon__crystalMigrateCardioFitnessEnabledToNotificationDetailsEnteredWithUserDefaults___block_invoke;
  v9[3] = &unk_1E87F0220;
  v10 = v4;
  v6 = v4;
  v7 = (void *)objc_msgSend(v5, "initWithIdentifier:migrationVersion:block:", CFSTR("CrystalMigrateCardioFitnessEnablemedToNotificationDetailsEntered"), 18001, v9);

  return v7;
}

+ (id)crystalMigrateCardioFitnessOnboardingTileDismissalDateToKeyValueStorageWithUserDefaults:()HeartHealthDaemon
{
  id v4;
  id v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  v5 = [a1 alloc];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __134__HDSettingsMigrationStep_HeartHealthDaemon__crystalMigrateCardioFitnessOnboardingTileDismissalDateToKeyValueStorageWithUserDefaults___block_invoke;
  v9[3] = &unk_1E87F0220;
  v10 = v4;
  v6 = v4;
  v7 = (void *)objc_msgSend(v5, "initWithIdentifier:migrationVersion:block:", CFSTR("CrystalMigrateCardioFitnessEnablemedToNotificationDetailsEntered"), 18002, v9);

  return v7;
}

@end
