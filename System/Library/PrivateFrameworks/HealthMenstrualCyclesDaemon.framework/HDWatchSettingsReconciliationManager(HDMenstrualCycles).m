@implementation HDWatchSettingsReconciliationManager(HDMenstrualCycles)

- (uint64_t)initWithProfile:()HDMenstrualCycles userDefaults:
{
  objc_class *v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  _QWORD v16[3];

  v16[2] = *MEMORY[0x24BDAC8D0];
  v6 = (objc_class *)MEMORY[0x24BE40CF0];
  v7 = a4;
  v8 = a3;
  v9 = [v6 alloc];
  v10 = (void *)objc_msgSend(v9, "initWithFeatureIdentifier:defaultsEnabledKey:", *MEMORY[0x24BDD2E38], CFSTR("SensorBasedProjectionsEnabled"));
  v16[0] = v10;
  v11 = objc_alloc(MEMORY[0x24BE40CF0]);
  v12 = (void *)objc_msgSend(v11, "initWithFeatureIdentifier:defaultsEnabledKey:", *MEMORY[0x24BDD2E40], CFSTR("WristTemperatureBasedProjectionsEnabled"));
  v16[1] = v12;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v16, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(a1, "initWithProfile:userDefaults:managedKeys:debugIdentifier:loggingCategory:", v8, v7, v13, CFSTR("HealthMenstrualCycles"), *MEMORY[0x24BDD3030]);

  return v14;
}

@end
