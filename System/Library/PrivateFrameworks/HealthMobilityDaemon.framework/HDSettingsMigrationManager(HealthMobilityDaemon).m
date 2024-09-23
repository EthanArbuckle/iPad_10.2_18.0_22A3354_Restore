@implementation HDSettingsMigrationManager(HealthMobilityDaemon)

- (uint64_t)initForWalkingSteadinessWithProfile:()HealthMobilityDaemon delegate:
{
  objc_class *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  _QWORD v16[3];

  v16[2] = *MEMORY[0x24BDAC8D0];
  v6 = (objc_class *)MEMORY[0x24BDBCF50];
  v7 = a4;
  v8 = a3;
  v9 = (void *)objc_msgSend([v6 alloc], "initWithSuiteName:", CFSTR("com.apple.Mobility.notifications"));
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.private.health.walking-steadiness"));
  objc_msgSend(MEMORY[0x24BE40BD8], "crystalMigrateWalkingSteadinessEnablementToFeatureSettingsWithUserDefaults:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v11;
  objc_msgSend(MEMORY[0x24BE40BD8], "crystalMigrateWalkingSteadinessMoveOnboardingTileDismissalDateToKeyValueStorageWithUserDefaults:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v12;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v16, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(a1, "initWithProfile:identifier:currentMigrationVersion:migrationSteps:delegate:loggingCategory:", v8, CFSTR("HealthMobilityDaemon"), 18002, v13, v7, *MEMORY[0x24BDD3040]);

  return v14;
}

@end
