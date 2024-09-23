@implementation HDSettingsMigrationStep(HealthMobilityDaemon)

+ (id)crystalMigrateWalkingSteadinessEnablementToFeatureSettingsWithUserDefaults:()HealthMobilityDaemon
{
  id v4;
  id v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  v5 = [a1 alloc];
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __124__HDSettingsMigrationStep_HealthMobilityDaemon__crystalMigrateWalkingSteadinessEnablementToFeatureSettingsWithUserDefaults___block_invoke;
  v9[3] = &unk_24D4DF920;
  v10 = v4;
  v6 = v4;
  v7 = (void *)objc_msgSend(v5, "initWithIdentifier:migrationVersion:block:", CFSTR("CrystalMigrateWalkingSteadinessEnablementToFeatureSettings"), 18001, v9);

  return v7;
}

+ (id)crystalMigrateWalkingSteadinessMoveOnboardingTileDismissalDateToKeyValueStorageWithUserDefaults:()HealthMobilityDaemon
{
  id v4;
  id v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  v5 = [a1 alloc];
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __145__HDSettingsMigrationStep_HealthMobilityDaemon__crystalMigrateWalkingSteadinessMoveOnboardingTileDismissalDateToKeyValueStorageWithUserDefaults___block_invoke;
  v9[3] = &unk_24D4DF920;
  v10 = v4;
  v6 = v4;
  v7 = (void *)objc_msgSend(v5, "initWithIdentifier:migrationVersion:block:", CFSTR("CrystalMigrateWalkingSteadinessOnboardingTileDismissalDateToKeyValueStorage"), 18002, v9);

  return v7;
}

@end
