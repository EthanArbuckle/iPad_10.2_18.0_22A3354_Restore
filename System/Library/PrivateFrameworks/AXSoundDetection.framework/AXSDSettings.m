@implementation AXSDSettings

- (BOOL)shouldStoreLocally
{
  return 1;
}

- (id)preferenceDomainForPreferenceKey:(id)a3
{
  return (id)*MEMORY[0x24BED2910];
}

- (NSArray)supportedSoundDetectionTypes
{
  uint64_t v3;
  void *v4;
  void *v5;

  v3 = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HCSettings objectValueForKey:withClass:andDefaultValue:](self, "objectValueForKey:withClass:andDefaultValue:", CFSTR("AXSSoundDetectionSupportedTypes"), v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v5;
}

- (NSData)kShotDetectors
{
  uint64_t v3;
  void *v4;
  void *v5;

  v3 = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE50], "data");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HCSettings objectValueForKey:withClass:andDefaultValue:](self, "objectValueForKey:withClass:andDefaultValue:", CFSTR("AXSSoundDetectionKShotDetectors"), v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v5;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_0);
  return (id)sharedInstance_Settings;
}

- (NSArray)enabledSoundDetectionTypes
{
  uint64_t v3;
  void *v4;
  void *v5;

  v3 = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HCSettings objectValueForKey:withClass:andDefaultValue:](self, "objectValueForKey:withClass:andDefaultValue:", CFSTR("AXSEnabledSoundDetectionTypes"), v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v5;
}

- (void)logMessage:(id)a3
{
  id v3;
  NSObject *v4;

  v3 = a3;
  AXLogUltron();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    -[AXSDSettings logMessage:].cold.1((uint64_t)v3, v4);

}

void __30__AXSDSettings_sharedInstance__block_invoke()
{
  AXSDSettings *v0;
  void *v1;

  v0 = objc_alloc_init(AXSDSettings);
  v1 = (void *)sharedInstance_Settings;
  sharedInstance_Settings = (uint64_t)v0;

}

- (id)keysToSync
{
  return (id)objc_msgSend(MEMORY[0x24BDBCF20], "set");
}

+ (void)initialize
{
  id v2;

  v2 = +[AXSDSettings sharedInstance](AXSDSettings, "sharedInstance");
}

- (id)preferenceKeyForSelector:(SEL)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  objc_super v11;

  if (preferenceKeyForSelector__onceToken != -1)
    dispatch_once(&preferenceKeyForSelector__onceToken, &__block_literal_global_36);
  v5 = (void *)preferenceKeyForSelector__SelectorMap;
  NSStringFromSelector(a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = v7;
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)AXSDSettings;
    -[HCSettings preferenceKeyForSelector:](&v11, sel_preferenceKeyForSelector_, a3);
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;

  return v9;
}

void __41__AXSDSettings_preferenceKeyForSelector___block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v14 = objc_alloc(MEMORY[0x24BDBCE70]);
  NSStringFromSelector(sel_ultronIsRunning);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_ultronSupportEnabled);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_soundDetectionState);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_enabledSoundDetectionTypes);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_soundDetectionSnoozeDictionary);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_supportedSoundDetectionTypes);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_kShotDetectors);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_kShotSoundRecordings);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_enabledKShotDetectorIdentifiers);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_soundDetectionKShotListeningState);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_kShotShouldSaveCurrentSound);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_isActivelyTrainingAKShotModel);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_micDisabled);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_pipedInFile);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_retrainModelIdentifier);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_forceMedinaSupport);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v14, "initWithObjectsAndKeys:", CFSTR("AXSUltronV2RunningStatus"), v18, CFSTR("AXSUltronV2Enabled"), v13, CFSTR("AXSEnabledSoundDetectionState"), v17, CFSTR("AXSEnabledSoundDetectionTypes"), v16, CFSTR("AXSSoundDetectionSnoozeDictionary"), v15, CFSTR("AXSSoundDetectionSupportedTypes"), v0, CFSTR("AXSSoundDetectionKShotDetectors"), v12, CFSTR("AXSSoundDetectionKShotRecordings"), v11, CFSTR("AXSSoundDetectionKShotEnabledDetectorIdentifiers"),
         v1,
         CFSTR("AXSSoundDetectionKShotListeningStateIdentifier"),
         v2,
         CFSTR("AXSSoundDetectionKShotShouldSaveCurrentSoundIdentifier"),
         v10,
         CFSTR("AXSSoundDetectionKShotisActivelyTrainingAKShotModelIdentifier"),
         v3,
         CFSTR("AXSSoundDetectionMicDisabled"),
         v4,
         CFSTR("AXSSoundDetectionPipedInFile"),
         v5,
         CFSTR("AXSSoundDetectionRetrainModelIdentifier"),
         v6,
         CFSTR("AXSSoundDetectionMedinaSupportForced"),
         v7,
         0);
  v9 = (void *)preferenceKeyForSelector__SelectorMap;
  preferenceKeyForSelector__SelectorMap = v8;

}

- (BOOL)ultronIsRunning
{
  return -[HCSettings BOOLValueForPreferenceKey:withDefaultValue:](self, "BOOLValueForPreferenceKey:withDefaultValue:", CFSTR("AXSUltronV2RunningStatus"), 0);
}

- (void)setUltronIsRunning:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[HCSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("AXSUltronV2RunningStatus"));

}

- (BOOL)ultronSupportEnabled
{
  return -[HCSettings BOOLValueForPreferenceKey:withDefaultValue:](self, "BOOLValueForPreferenceKey:withDefaultValue:", CFSTR("AXSUltronV2Enabled"), 0);
}

- (void)setUltronSupportEnabled:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[HCSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("AXSUltronV2Enabled"));

}

- (int64_t)soundDetectionState
{
  return -[HCSettings integerValueForKey:withDefaultValue:](self, "integerValueForKey:withDefaultValue:", CFSTR("AXSEnabledSoundDetectionState"), 0);
}

- (void)setSoundDetectionState:(int64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[HCSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("AXSEnabledSoundDetectionState"));

}

- (void)setEnabledSoundDetectionTypes:(id)a3
{
  -[HCSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", a3, CFSTR("AXSEnabledSoundDetectionTypes"));
}

- (NSMutableDictionary)soundDetectionSnoozeDictionary
{
  uint64_t v3;
  void *v4;
  void *v5;

  v3 = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HCSettings objectValueForKey:withClass:andDefaultValue:](self, "objectValueForKey:withClass:andDefaultValue:", CFSTR("AXSSoundDetectionSnoozeDictionary"), v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSMutableDictionary *)v5;
}

- (void)setSoundDetectionSnoozeDictionary:(id)a3
{
  -[HCSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", a3, CFSTR("AXSSoundDetectionSnoozeDictionary"));
}

- (void)setSupportedSoundDetectionTypes:(id)a3
{
  -[HCSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", a3, CFSTR("AXSSoundDetectionSupportedTypes"));
}

- (void)setKShotDetectors:(id)a3
{
  -[HCSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", a3, CFSTR("AXSSoundDetectionKShotDetectors"));
}

- (NSMutableDictionary)kShotSoundRecordings
{
  uint64_t v3;
  void *v4;
  void *v5;

  v3 = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HCSettings objectValueForKey:withClass:andDefaultValue:](self, "objectValueForKey:withClass:andDefaultValue:", CFSTR("AXSSoundDetectionKShotRecordings"), v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSMutableDictionary *)v5;
}

- (void)setKShotSoundRecordings:(id)a3
{
  -[HCSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", a3, CFSTR("AXSSoundDetectionKShotRecordings"));
}

- (NSArray)enabledKShotDetectorIdentifiers
{
  uint64_t v3;
  void *v4;
  void *v5;

  v3 = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HCSettings objectValueForKey:withClass:andDefaultValue:](self, "objectValueForKey:withClass:andDefaultValue:", CFSTR("AXSSoundDetectionKShotEnabledDetectorIdentifiers"), v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v5;
}

- (void)setEnabledKShotDetectorIdentifiers:(id)a3
{
  -[HCSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", a3, CFSTR("AXSSoundDetectionKShotEnabledDetectorIdentifiers"));
}

- (int64_t)soundDetectionKShotListeningState
{
  return -[HCSettings integerValueForKey:withDefaultValue:](self, "integerValueForKey:withDefaultValue:", CFSTR("AXSSoundDetectionKShotListeningStateIdentifier"), 0);
}

- (void)setSoundDetectionKShotListeningState:(int64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[HCSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("AXSSoundDetectionKShotListeningStateIdentifier"));

}

- (BOOL)kShotShouldSaveCurrentSound
{
  return -[HCSettings BOOLValueForPreferenceKey:withDefaultValue:](self, "BOOLValueForPreferenceKey:withDefaultValue:", CFSTR("AXSSoundDetectionKShotShouldSaveCurrentSoundIdentifier"), 0);
}

- (void)setKShotShouldSaveCurrentSound:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[HCSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("AXSSoundDetectionKShotShouldSaveCurrentSoundIdentifier"));

}

- (BOOL)isActivelyTrainingAKShotModel
{
  return -[HCSettings BOOLValueForPreferenceKey:withDefaultValue:](self, "BOOLValueForPreferenceKey:withDefaultValue:", CFSTR("AXSSoundDetectionKShotisActivelyTrainingAKShotModelIdentifier"), 0);
}

- (void)setIsActivelyTrainingAKShotModel:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[HCSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("AXSSoundDetectionKShotisActivelyTrainingAKShotModelIdentifier"));

}

- (BOOL)micDisabled
{
  return -[HCSettings BOOLValueForPreferenceKey:withDefaultValue:](self, "BOOLValueForPreferenceKey:withDefaultValue:", CFSTR("AXSSoundDetectionMicDisabled"), 0);
}

- (void)setMicDisabled:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[HCSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("AXSSoundDetectionMicDisabled"));

}

- (NSString)pipedInFile
{
  uint64_t v3;
  void *v4;
  void *v5;

  v3 = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDD17C8], "string");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HCSettings objectValueForKey:withClass:andDefaultValue:](self, "objectValueForKey:withClass:andDefaultValue:", CFSTR("AXSSoundDetectionPipedInFile"), v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (void)setPipedInFile:(id)a3
{
  -[HCSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", a3, CFSTR("AXSSoundDetectionPipedInFile"));
}

- (NSString)retrainModelIdentifier
{
  uint64_t v3;
  void *v4;
  void *v5;

  v3 = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDD17C8], "string");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HCSettings objectValueForKey:withClass:andDefaultValue:](self, "objectValueForKey:withClass:andDefaultValue:", CFSTR("AXSSoundDetectionRetrainModelIdentifier"), v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (void)setRetrainModelIdentifier:(id)a3
{
  -[HCSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", a3, CFSTR("AXSSoundDetectionRetrainModelIdentifier"));
}

- (BOOL)forceMedinaSupport
{
  return -[HCSettings BOOLValueForPreferenceKey:withDefaultValue:](self, "BOOLValueForPreferenceKey:withDefaultValue:", CFSTR("AXSSoundDetectionMedinaSupportForced"), 0);
}

- (void)setForceMedinaSupport:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[HCSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("AXSSoundDetectionMedinaSupportForced"));

}

- (BOOL)soundDetectionEnabled
{
  return -[AXSDSettings soundDetectionState](self, "soundDetectionState") != 0;
}

- (void)addSoundDetectionType:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = (void *)MEMORY[0x24BDBCEF0];
  v5 = a3;
  -[AXSDSettings enabledSoundDetectionTypes](self, "enabledSoundDetectionTypes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopy");
  objc_msgSend(v4, "setWithArray:", v7);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "addObject:", v5);
  objc_msgSend(v9, "allObjects");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXSDSettings setEnabledSoundDetectionTypes:](self, "setEnabledSoundDetectionTypes:", v8);

}

- (void)removeSoundDetectionType:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = (void *)MEMORY[0x24BDBCEF0];
  v5 = a3;
  -[AXSDSettings enabledSoundDetectionTypes](self, "enabledSoundDetectionTypes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopy");
  objc_msgSend(v4, "setWithArray:", v7);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "removeObject:", v5);
  objc_msgSend(v9, "allObjects");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXSDSettings setEnabledSoundDetectionTypes:](self, "setEnabledSoundDetectionTypes:", v8);

}

- (void)removeAllSoundDetectionTypes
{
  id v3;

  objc_msgSend(MEMORY[0x24BDBCE30], "array");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[AXSDSettings setEnabledSoundDetectionTypes:](self, "setEnabledSoundDetectionTypes:", v3);

}

- (void)addSnoozeDateToSnoozeDictionary:(id)a3 forKey:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;

  v12 = a3;
  v6 = a4;
  -[AXSDSettings soundDetectionSnoozeDictionary](self, "soundDetectionSnoozeDictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "mutableCopy");

  objc_msgSend(v8, "objectForKey:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_msgSend(v12, "laterDate:", v9);
    v10 = objc_claimAutoreleasedReturnValue();

    v11 = (id)v10;
  }
  else
  {
    v11 = v12;
  }
  v13 = v11;
  objc_msgSend(v8, "setObject:forKey:", v11, v6);
  -[AXSDSettings setSoundDetectionSnoozeDictionary:](self, "setSoundDetectionSnoozeDictionary:", v8);

}

- (id)soundAlertTopicForSoundDetectionType:(id)a3
{
  id v3;
  id *v4;
  __CFString *v5;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", AXSDSoundDetectionTypeApplianceBeeps) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", AXSDSoundDetectionTypeApplianceBuzzes) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", AXSDSoundDetectionTypeApplianceBellDings) & 1) != 0)
  {
    v4 = (id *)MEMORY[0x24BEB8D30];
LABEL_5:
    v5 = (__CFString *)*v4;
    goto LABEL_6;
  }
  if ((objc_msgSend(v3, "isEqualToString:", AXSDSoundDetectionTypeDistressedBaby) & 1) != 0)
  {
    v4 = (id *)MEMORY[0x24BEB8D38];
    goto LABEL_5;
  }
  if ((objc_msgSend(v3, "isEqualToString:", AXSDSoundDetectionTypeCarHorns) & 1) != 0)
  {
    v4 = (id *)MEMORY[0x24BEB8D40];
    goto LABEL_5;
  }
  if ((objc_msgSend(v3, "isEqualToString:", AXSDSoundDetectionTypeCatMeows) & 1) != 0)
  {
    v4 = (id *)MEMORY[0x24BEB8D48];
    goto LABEL_5;
  }
  if ((objc_msgSend(v3, "isEqualToString:", AXSDSoundDetectionTypeCough) & 1) != 0)
  {
    v4 = (id *)MEMORY[0x24BEB8D50];
    goto LABEL_5;
  }
  if ((objc_msgSend(v3, "isEqualToString:", AXSDSoundDetectionTypeDogBarks) & 1) != 0)
  {
    v4 = (id *)MEMORY[0x24BEB8D58];
    goto LABEL_5;
  }
  if ((objc_msgSend(v3, "isEqualToString:", AXSDSoundDetectionTypeDoorbells) & 1) != 0)
  {
    v4 = (id *)MEMORY[0x24BEB8D60];
    goto LABEL_5;
  }
  if ((objc_msgSend(v3, "isEqualToString:", AXSDSoundDetectionTypeDoorKnocks) & 1) != 0)
  {
    v4 = (id *)MEMORY[0x24BEB8D68];
    goto LABEL_5;
  }
  if ((objc_msgSend(v3, "isEqualToString:", AXSDSoundDetectionTypeFireAlarms) & 1) != 0)
  {
    v4 = (id *)MEMORY[0x24BEB8D70];
    goto LABEL_5;
  }
  if ((objc_msgSend(v3, "isEqualToString:", AXSDSoundDetectionTypePersonShouting) & 1) != 0)
  {
    v4 = (id *)MEMORY[0x24BEB8D78];
    goto LABEL_5;
  }
  if ((objc_msgSend(v3, "isEqualToString:", AXSDSoundDetectionTypeSirenAlarms) & 1) != 0)
  {
    v4 = (id *)MEMORY[0x24BEB8D80];
    goto LABEL_5;
  }
  if ((objc_msgSend(v3, "isEqualToString:", AXSDSoundDetectionTypeSmokeAlarms) & 1) != 0)
  {
    v4 = (id *)MEMORY[0x24BEB8D88];
    goto LABEL_5;
  }
  if ((objc_msgSend(v3, "isEqualToString:", AXSDSoundDetectionTypeWaterRunning) & 1) != 0)
  {
    v4 = (id *)MEMORY[0x24BEB8D90];
    goto LABEL_5;
  }
  if ((objc_msgSend(v3, "isEqualToString:", AXSDSoundDetectionTypeGlassBreaking) & 1) != 0)
  {
    v5 = CFSTR("TLAlertTopicSoundRecognitionGlassBreaking");
  }
  else if (objc_msgSend(v3, "isEqualToString:", AXSDSoundDetectionTypeKettle))
  {
    v5 = CFSTR("TLAlertTopicSoundRecognitionKettle");
  }
  else
  {
    v5 = 0;
  }
LABEL_6:

  return v5;
}

+ (id)stringForSoundDetectionState:(int64_t)a3
{
  const __CFString *v3;

  v3 = CFSTR("Off");
  if (a3 == 2)
    v3 = CFSTR("Running");
  if (a3 == 1)
    return CFSTR("Available");
  else
    return (id)v3;
}

- (id)localizedNameForSoundDetectionType:(id)a3
{
  return AXSDSoundDetectionLocalizedTitleForType(a3);
}

- (id)sortedSupportedSoundDetectionTypes
{
  void *v3;
  void *v4;
  _QWORD v6[5];

  -[AXSDSettings supportedSoundDetectionTypes](self, "supportedSoundDetectionTypes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __50__AXSDSettings_sortedSupportedSoundDetectionTypes__block_invoke;
  v6[3] = &unk_24D0E3408;
  v6[4] = self;
  objc_msgSend(v3, "sortedArrayUsingComparator:", v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t __50__AXSDSettings_sortedSupportedSoundDetectionTypes__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(v5, "localizedNameForSoundDetectionType:", a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "localizedNameForSoundDetectionType:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v7, "localizedCompare:", v8);
  return v9;
}

- (BOOL)hasCustomToneForDetector:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  -[AXSDSettings soundAlertTopicForSoundDetectionType:](self, "soundAlertTopicForSoundDetectionType:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BEB8CC8], "sharedToneManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "defaultToneIdentifierForAlertType:topic:", 29, v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BEB8CC8], "sharedToneManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "currentToneIdentifierForAlertType:topic:", 29, v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "lowercaseString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "lowercaseString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "isEqualToString:", v9) ^ 1;

  }
  else
  {
    AXLogUltron();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[AXSDSettings hasCustomToneForDetector:].cold.1(v11, v12, v13, v14, v15, v16, v17, v18);

    LOBYTE(v10) = 0;
  }

  return v10;
}

- (BOOL)hasCustomHapticForDetector:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  -[AXSDSettings soundAlertTopicForSoundDetectionType:](self, "soundAlertTopicForSoundDetectionType:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BEB8CD8], "sharedVibrationManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "defaultVibrationIdentifierForAlertType:topic:", 29, v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BEB8CD8], "sharedVibrationManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "currentVibrationIdentifierForAlertType:topic:", 29, v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "lowercaseString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "lowercaseString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "isEqualToString:", v9) ^ 1;

  }
  else
  {
    AXLogUltron();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[AXSDSettings hasCustomHapticForDetector:].cold.1(v11, v12, v13, v14, v15, v16, v17, v18);

    LOBYTE(v10) = 0;
  }

  return v10;
}

- (void)pipeFile:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  int v8;
  id v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "absoluteString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXSDSettings setPipedInFile:](self, "setPipedInFile:", v5);

  AXLogUltron();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    -[AXSDSettings pipedInFile](self, "pipedInFile");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412546;
    v9 = v4;
    v10 = 2112;
    v11 = v7;
    _os_log_impl(&dword_213CB2000, v6, OS_LOG_TYPE_INFO, "Setting pipe file to %@ -> %@", (uint8_t *)&v8, 0x16u);

  }
}

- (void)retrainModelWithIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  id v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[AXSDSettings setRetrainModelIdentifier:](self, "setRetrainModelIdentifier:", v4);
  AXLogUltron();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    -[AXSDSettings retrainModelIdentifier](self, "retrainModelIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412546;
    v8 = v4;
    v9 = 2112;
    v10 = v6;
    _os_log_impl(&dword_213CB2000, v5, OS_LOG_TYPE_INFO, "Setting model to retrain to %@ -> %@", (uint8_t *)&v7, 0x16u);

  }
}

- (void)hasCustomToneForDetector:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_213CB2000, a1, a3, "Trying to log custom tone for non-existent alert topic", a5, a6, a7, a8, 0);
}

- (void)hasCustomHapticForDetector:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_213CB2000, a1, a3, "Trying to log custom haptic for non-existent alert topic", a5, a6, a7, a8, 0);
}

- (void)logMessage:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl(&dword_213CB2000, a2, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&v2, 0xCu);
}

@end
