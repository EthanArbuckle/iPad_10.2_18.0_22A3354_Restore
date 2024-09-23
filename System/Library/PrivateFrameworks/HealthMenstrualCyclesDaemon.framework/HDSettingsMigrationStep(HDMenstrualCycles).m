@implementation HDSettingsMigrationStep(HDMenstrualCycles)

+ (id)dawnMoveAlgorithmicProjectionsToFeatureSettingsWithUserDefaults:()HDMenstrualCycles
{
  id v4;
  id v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;
  objc_class *v11;

  v4 = a3;
  v5 = [a1 alloc];
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __110__HDSettingsMigrationStep_HDMenstrualCycles__dawnMoveAlgorithmicProjectionsToFeatureSettingsWithUserDefaults___block_invoke;
  v9[3] = &unk_24DB223F8;
  v10 = v4;
  v11 = a1;
  v6 = v4;
  v7 = (void *)objc_msgSend(v5, "initWithIdentifier:migrationVersion:block:", CFSTR("DawnMoveAlgorithmicProjectionsToFeatureSettings"), 17001, v9);

  return v7;
}

+ (id)dawnMoveOnboardingTileDismissalDateToKeyValueStorageWithUserDefaults:()HDMenstrualCycles
{
  id v4;
  id v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;
  objc_class *v11;

  v4 = a3;
  v5 = [a1 alloc];
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __115__HDSettingsMigrationStep_HDMenstrualCycles__dawnMoveOnboardingTileDismissalDateToKeyValueStorageWithUserDefaults___block_invoke;
  v9[3] = &unk_24DB223F8;
  v10 = v4;
  v11 = a1;
  v6 = v4;
  v7 = (void *)objc_msgSend(v5, "initWithIdentifier:migrationVersion:block:", CFSTR("DawnMoveOnboardingTileDismissalDateToKeyValueStorage"), 17002, v9);

  return v7;
}

+ (id)dawnMoveHiddenCycleChartRowsSettingsWithUserDefaults:()HDMenstrualCycles
{
  id v4;
  id v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;
  objc_class *v11;

  v4 = a3;
  v5 = [a1 alloc];
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __99__HDSettingsMigrationStep_HDMenstrualCycles__dawnMoveHiddenCycleChartRowsSettingsWithUserDefaults___block_invoke;
  v9[3] = &unk_24DB223F8;
  v10 = v4;
  v11 = a1;
  v6 = v4;
  v7 = (void *)objc_msgSend(v5, "initWithIdentifier:migrationVersion:block:", CFSTR("DawnMoveHiddenCycleChartRowsSettings"), 17003, v9);

  return v7;
}

+ (id)dawnMoveHiddenLoggingRowsSettingsWithUserDefaults:()HDMenstrualCycles
{
  id v4;
  id v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;
  objc_class *v11;

  v4 = a3;
  v5 = [a1 alloc];
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __96__HDSettingsMigrationStep_HDMenstrualCycles__dawnMoveHiddenLoggingRowsSettingsWithUserDefaults___block_invoke;
  v9[3] = &unk_24DB223F8;
  v10 = v4;
  v11 = a1;
  v6 = v4;
  v7 = (void *)objc_msgSend(v5, "initWithIdentifier:migrationVersion:block:", CFSTR("DawnMoveHiddenLoggingRowsSettings"), 17004, v9);

  return v7;
}

+ (id)dawnMoveToDeviationDetectionFeatureSettingsWithUserDefaults:()HDMenstrualCycles
{
  id v4;
  id v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;
  objc_class *v11;

  v4 = a3;
  v5 = [a1 alloc];
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __106__HDSettingsMigrationStep_HDMenstrualCycles__dawnMoveToDeviationDetectionFeatureSettingsWithUserDefaults___block_invoke;
  v9[3] = &unk_24DB223F8;
  v10 = v4;
  v11 = a1;
  v6 = v4;
  v7 = (void *)objc_msgSend(v5, "initWithIdentifier:migrationVersion:block:", CFSTR("DawnMoveDeviationDetectionFeatureSettings"), 17005, v9);

  return v7;
}

@end
