@implementation CLFSettings_GeneratedCode

+ (CLFSettings)sharedInstance
{
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_1);
  return (CLFSettings *)(id)sharedInstance_SharedSettings;
}

- (CLFSettings_GeneratedCode)init
{
  CLFSettings_GeneratedCode *v2;
  CLFSettings_GeneratedCode *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  objc_super v33;

  v33.receiver = self;
  v33.super_class = (Class)CLFSettings_GeneratedCode;
  v2 = -[CLFBaseSettings init](&v33, sel_init);
  v3 = v2;
  if (v2)
  {
    -[CLFBaseSettings preferenceKeysBySelectorName]((uint64_t)v2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_adminPasscodeRecoveryAppleID);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", CFSTR("AdminPasscodeRecoveryAppleID"), v5);

    -[CLFBaseSettings preferenceKeysBySelectorName]((uint64_t)v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_allowSiri);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", CFSTR("AllowSiri"), v7);

    -[CLFBaseSettings preferenceKeysBySelectorName]((uint64_t)v3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_applicationBundleIdentifiers);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", CFSTR("ApplicationBundleIdentifiers"), v9);

    -[CLFBaseSettings preferenceKeysBySelectorName]((uint64_t)v3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_batteryMonitoringEnabled);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", CFSTR("BatteryMonitoringEnabled"), v11);

    -[CLFBaseSettings preferenceKeysBySelectorName]((uint64_t)v3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_emergencyKeypadEnabled);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKeyedSubscript:", CFSTR("EmergencyKeypadEnabled"), v13);

    -[CLFBaseSettings preferenceKeysBySelectorName]((uint64_t)v3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_hasMigratedFileProtections);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKeyedSubscript:", CFSTR("HasMigratedFileProtections"), v15);

    -[CLFBaseSettings preferenceKeysBySelectorName]((uint64_t)v3);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_listLayout);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setObject:forKeyedSubscript:", CFSTR("ListLayout"), v17);

    -[CLFBaseSettings preferenceKeysBySelectorName]((uint64_t)v3);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_lockScreenClockEnabled);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setObject:forKeyedSubscript:", CFSTR("LockScreenClockEnabled"), v19);

    -[CLFBaseSettings preferenceKeysBySelectorName]((uint64_t)v3);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_notificationsEnabled);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setObject:forKeyedSubscript:", CFSTR("NotificationsEnabled"), v21);

    -[CLFBaseSettings preferenceKeysBySelectorName]((uint64_t)v3);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_overrideNonClarityApplicationBundleIdentifiers);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setObject:forKeyedSubscript:", CFSTR("OverrideNonClarityApplicationBundleIdentifiers"), v23);

    -[CLFBaseSettings preferenceKeysBySelectorName]((uint64_t)v3);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_restartReason);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setObject:forKeyedSubscript:", CFSTR("RestartReason"), v25);

    -[CLFBaseSettings preferenceKeysBySelectorName]((uint64_t)v3);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_shouldShowTripleClickInstructions);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setObject:forKeyedSubscript:", CFSTR("ShouldShowTripleClickInstructions"), v27);

    -[CLFBaseSettings preferenceKeysBySelectorName]((uint64_t)v3);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_silentModeToggleEnabled);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setObject:forKeyedSubscript:", CFSTR("SilentModeToggleEnabled"), v29);

    -[CLFBaseSettings preferenceKeysBySelectorName]((uint64_t)v3);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_volumeButtonsEnabled);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setObject:forKeyedSubscript:", CFSTR("VolumeButtonsEnabled"), v31);

  }
  return v3;
}

+ (id)domainName
{
  return CFSTR("com.apple.ClarityUI");
}

+ (id)allPreferenceSelectorsAsStrings
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  objc_super v20;
  _QWORD v21[16];

  v21[14] = *MEMORY[0x24BDAC8D0];
  v20.receiver = a1;
  v20.super_class = (Class)&OBJC_METACLASS___CLFSettings_GeneratedCode;
  objc_msgSendSuper2(&v20, sel_allPreferenceSelectorsAsStrings);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_adminPasscodeRecoveryAppleID);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v19;
  NSStringFromSelector(sel_allowSiri);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v21[1] = v18;
  NSStringFromSelector(sel_applicationBundleIdentifiers);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v21[2] = v17;
  NSStringFromSelector(sel_batteryMonitoringEnabled);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v21[3] = v16;
  NSStringFromSelector(sel_emergencyKeypadEnabled);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v21[4] = v15;
  NSStringFromSelector(sel_hasMigratedFileProtections);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v21[5] = v14;
  NSStringFromSelector(sel_listLayout);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v21[6] = v3;
  NSStringFromSelector(sel_lockScreenClockEnabled);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v21[7] = v4;
  NSStringFromSelector(sel_notificationsEnabled);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v21[8] = v5;
  NSStringFromSelector(sel_overrideNonClarityApplicationBundleIdentifiers);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v21[9] = v6;
  NSStringFromSelector(sel_restartReason);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v21[10] = v7;
  NSStringFromSelector(sel_shouldShowTripleClickInstructions);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v21[11] = v8;
  NSStringFromSelector(sel_silentModeToggleEnabled);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v21[12] = v9;
  NSStringFromSelector(sel_volumeButtonsEnabled);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v21[13] = v10;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v21, 14);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "arrayByAddingObjectsFromArray:", v11);
  v13 = (id)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (NSString)adminPasscodeRecoveryAppleID
{
  return (NSString *)-[AXBaseSettings objectValueForPreferenceKey:ofClass:defaultValue:](self, "objectValueForPreferenceKey:ofClass:defaultValue:", CFSTR("AdminPasscodeRecoveryAppleID"), objc_opt_class(), 0);
}

- (void)setAdminPasscodeRecoveryAppleID:(id)a3
{
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", a3, CFSTR("AdminPasscodeRecoveryAppleID"));
}

- (BOOL)allowSiri
{
  return -[AXBaseSettings BOOLValueForPreferenceKey:defaultValue:](self, "BOOLValueForPreferenceKey:defaultValue:", CFSTR("AllowSiri"), 0);
}

- (void)setAllowSiri:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("AllowSiri"));

}

- (NSArray)applicationBundleIdentifiers
{
  return (NSArray *)-[AXBaseSettings objectValueForPreferenceKey:ofClass:defaultValue:](self, "objectValueForPreferenceKey:ofClass:defaultValue:", CFSTR("ApplicationBundleIdentifiers"), objc_opt_class(), MEMORY[0x24BDBD1A8]);
}

- (void)setApplicationBundleIdentifiers:(id)a3
{
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", a3, CFSTR("ApplicationBundleIdentifiers"));
}

- (BOOL)batteryMonitoringEnabled
{
  return -[AXBaseSettings BOOLValueForPreferenceKey:defaultValue:](self, "BOOLValueForPreferenceKey:defaultValue:", CFSTR("BatteryMonitoringEnabled"), 0);
}

- (void)setBatteryMonitoringEnabled:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("BatteryMonitoringEnabled"));

}

- (BOOL)emergencyKeypadEnabled
{
  return -[AXBaseSettings BOOLValueForPreferenceKey:defaultValue:](self, "BOOLValueForPreferenceKey:defaultValue:", CFSTR("EmergencyKeypadEnabled"), 0);
}

- (void)setEmergencyKeypadEnabled:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("EmergencyKeypadEnabled"));

}

- (BOOL)hasMigratedFileProtections
{
  return -[AXBaseSettings BOOLValueForPreferenceKey:defaultValue:](self, "BOOLValueForPreferenceKey:defaultValue:", CFSTR("HasMigratedFileProtections"), 0);
}

- (void)setHasMigratedFileProtections:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("HasMigratedFileProtections"));

}

- (NSString)listLayout
{
  return (NSString *)-[AXBaseSettings objectValueForPreferenceKey:ofClass:defaultValue:](self, "objectValueForPreferenceKey:ofClass:defaultValue:", CFSTR("ListLayout"), objc_opt_class(), CFSTR("grid"));
}

- (void)setListLayout:(id)a3
{
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", a3, CFSTR("ListLayout"));
}

- (BOOL)lockScreenClockEnabled
{
  return -[AXBaseSettings BOOLValueForPreferenceKey:defaultValue:](self, "BOOLValueForPreferenceKey:defaultValue:", CFSTR("LockScreenClockEnabled"), 1);
}

- (void)setLockScreenClockEnabled:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("LockScreenClockEnabled"));

}

- (BOOL)notificationsEnabled
{
  return -[AXBaseSettings BOOLValueForPreferenceKey:defaultValue:](self, "BOOLValueForPreferenceKey:defaultValue:", CFSTR("NotificationsEnabled"), 1);
}

- (void)setNotificationsEnabled:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("NotificationsEnabled"));

}

- (NSArray)overrideNonClarityApplicationBundleIdentifiers
{
  return (NSArray *)-[AXBaseSettings objectValueForPreferenceKey:ofClass:defaultValue:](self, "objectValueForPreferenceKey:ofClass:defaultValue:", CFSTR("OverrideNonClarityApplicationBundleIdentifiers"), objc_opt_class(), MEMORY[0x24BDBD1A8]);
}

- (void)setOverrideNonClarityApplicationBundleIdentifiers:(id)a3
{
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", a3, CFSTR("OverrideNonClarityApplicationBundleIdentifiers"));
}

- (NSString)restartReason
{
  return (NSString *)-[AXBaseSettings objectValueForPreferenceKey:ofClass:defaultValue:](self, "objectValueForPreferenceKey:ofClass:defaultValue:", CFSTR("RestartReason"), objc_opt_class(), CFSTR("unknown"));
}

- (void)setRestartReason:(id)a3
{
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", a3, CFSTR("RestartReason"));
}

- (BOOL)shouldShowTripleClickInstructions
{
  return -[AXBaseSettings BOOLValueForPreferenceKey:defaultValue:](self, "BOOLValueForPreferenceKey:defaultValue:", CFSTR("ShouldShowTripleClickInstructions"), 0);
}

- (void)setShouldShowTripleClickInstructions:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("ShouldShowTripleClickInstructions"));

}

- (BOOL)silentModeToggleEnabled
{
  return -[AXBaseSettings BOOLValueForPreferenceKey:defaultValue:](self, "BOOLValueForPreferenceKey:defaultValue:", CFSTR("SilentModeToggleEnabled"), 0);
}

- (void)setSilentModeToggleEnabled:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("SilentModeToggleEnabled"));

}

- (BOOL)volumeButtonsEnabled
{
  return -[AXBaseSettings BOOLValueForPreferenceKey:defaultValue:](self, "BOOLValueForPreferenceKey:defaultValue:", CFSTR("VolumeButtonsEnabled"), 1);
}

- (void)setVolumeButtonsEnabled:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("VolumeButtonsEnabled"));

}

@end
