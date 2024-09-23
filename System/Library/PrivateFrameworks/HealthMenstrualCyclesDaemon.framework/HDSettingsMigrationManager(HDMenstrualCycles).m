@implementation HDSettingsMigrationManager(HDMenstrualCycles)

- (uint64_t)initWithProfile:()HDMenstrualCycles userDefaults:delegate:
{
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  _QWORD v20[6];

  v20[5] = *MEMORY[0x24BDAC8D0];
  v8 = (void *)MEMORY[0x24BE40BD8];
  v9 = a5;
  v10 = a4;
  v11 = a3;
  objc_msgSend(v8, "dawnMoveAlgorithmicProjectionsToFeatureSettingsWithUserDefaults:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v12;
  objc_msgSend(MEMORY[0x24BE40BD8], "dawnMoveOnboardingTileDismissalDateToKeyValueStorageWithUserDefaults:", v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = v13;
  objc_msgSend(MEMORY[0x24BE40BD8], "dawnMoveHiddenCycleChartRowsSettingsWithUserDefaults:", v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v20[2] = v14;
  objc_msgSend(MEMORY[0x24BE40BD8], "dawnMoveHiddenLoggingRowsSettingsWithUserDefaults:", v10);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v20[3] = v15;
  objc_msgSend(MEMORY[0x24BE40BD8], "dawnMoveToDeviationDetectionFeatureSettingsWithUserDefaults:", v10);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v20[4] = v16;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v20, 5);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(a1, "initWithProfile:identifier:currentMigrationVersion:migrationSteps:delegate:migrationVersionDefaults:lastMigratedVersionKey:loggingCategory:", v11, CFSTR("HealthMenstrualCycles"), 17005, v17, v9, v10, CFSTR("HDMCSettingsMigrationManager_LastCompletedVersion"), *MEMORY[0x24BDD3030]);

  return v18;
}

@end
