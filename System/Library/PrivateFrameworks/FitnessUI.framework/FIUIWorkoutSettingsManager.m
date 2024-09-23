@implementation FIUIWorkoutSettingsManager

- (void)_readFromDomain
{
  void *v3;
  void *v4;
  NSMutableDictionary *v5;
  NSMutableDictionary *settingsByActivityType;
  NSMutableDictionary *v7;
  NSMutableDictionary *v8;
  NSMutableDictionary *v9;
  void *v10;
  void *v11;
  unint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  NSMutableDictionary *v16;
  void *v17;
  void *v18;
  NSMutableDictionary *v19;
  NSMutableDictionary *settingOverridesByMetric;
  void *v21;
  NSMutableArray *v22;
  NSMutableArray *enabledMetrics;
  os_log_t *v24;
  void *v25;
  NSMutableDictionary *v26;
  NSMutableArray *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  NSMutableArray *v32;
  NSMutableArray *v33;
  NSMutableDictionary *v34;
  NSMutableDictionary *v35;
  os_log_t v36;
  NSMutableDictionary *v37;
  NSMutableArray *v38;
  NSObject *v39;
  void *v40;
  void *v41;
  int v42;
  NSMutableDictionary *v43;
  __int16 v44;
  NSMutableArray *v45;
  __int16 v46;
  void *v47;
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  -[FIUIWorkoutSettingsManager domainAccessor](self, "domainAccessor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("SettingsByActivityType"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (NSMutableDictionary *)objc_msgSend(v4, "mutableCopy");
  settingsByActivityType = self->_settingsByActivityType;
  self->_settingsByActivityType = v5;

  v7 = self->_settingsByActivityType;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v8 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    v9 = self->_settingsByActivityType;
    self->_settingsByActivityType = v8;

    v7 = self->_settingsByActivityType;
  }
  KeyForWorkoutActivityType(self->_workoutActivityType);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](v7, "objectForKey:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    if (+[FIUIWorkoutActivityType shouldDisambiguateOnLocationType:](FIUIWorkoutActivityType, "shouldDisambiguateOnLocationType:", -[FIUIWorkoutActivityType effectiveTypeIdentifier](self->_workoutActivityType, "effectiveTypeIdentifier")))
    {
      v11 = 0;
    }
    else
    {
      v12 = -[FIUIWorkoutActivityType identifier](self->_workoutActivityType, "identifier");
      v13 = -[FIUIWorkoutActivityType isIndoor](self->_workoutActivityType, "isIndoor") ^ 1;
      -[FIUIWorkoutActivityType metadata](self->_workoutActivityType, "metadata");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      +[FIUIWorkoutActivityType activityTypeWithHKWorkoutActivityTypeIdentifier:isIndoor:metadata:](FIUIWorkoutActivityType, "activityTypeWithHKWorkoutActivityTypeIdentifier:isIndoor:metadata:", v12, v13, v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      v16 = self->_settingsByActivityType;
      KeyForWorkoutActivityType(v15);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary objectForKey:](v16, "objectForKey:", v17);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  objc_msgSend(v11, "objectForKey:", CFSTR("MetricSettingOverrides"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (NSMutableDictionary *)objc_msgSend(v18, "mutableCopy");
  settingOverridesByMetric = self->_settingOverridesByMetric;
  self->_settingOverridesByMetric = v19;

  objc_msgSend(v11, "objectForKey:", CFSTR("EnabledMetrics"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (NSMutableArray *)objc_msgSend(v21, "mutableCopy");
  enabledMetrics = self->_enabledMetrics;
  self->_enabledMetrics = v22;

  _HKInitializeLogging();
  v24 = (os_log_t *)MEMORY[0x24BDD3078];
  v25 = (void *)*MEMORY[0x24BDD3078];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3078], OS_LOG_TYPE_DEFAULT))
  {
    v26 = self->_settingsByActivityType;
    v27 = self->_enabledMetrics;
    v28 = v25;
    -[FIUIWorkoutSettingsManager domainAccessor](self, "domainAccessor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "objectForKey:", CFSTR("ActivitySettingsFormatVersion"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = 138412802;
    v43 = v26;
    v44 = 2112;
    v45 = v27;
    v46 = 2112;
    v47 = v30;
    _os_log_impl(&dword_21307C000, v28, OS_LOG_TYPE_DEFAULT, "[WorkoutSettingsManager] _readFromDomain called before _migratePaceViewSettingsIfNeeded with settingsByActivityType:%@ and enabledMetrics:%@ and versionNumber:%@", (uint8_t *)&v42, 0x20u);

  }
  if (!self->_enabledMetrics)
  {
    -[FIUIWorkoutDefaultMetricsProvider defaultEnabledMetrics](self->_defaultMetricsProvider, "defaultEnabledMetrics");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = (NSMutableArray *)objc_msgSend(v31, "mutableCopy");
    v33 = self->_enabledMetrics;
    self->_enabledMetrics = v32;

  }
  if (!self->_settingOverridesByMetric)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v34 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    v35 = self->_settingOverridesByMetric;
    self->_settingOverridesByMetric = v34;

  }
  -[FIUIWorkoutSettingsManager _migratePaceViewSettingIfNeeded](self, "_migratePaceViewSettingIfNeeded");
  _HKInitializeLogging();
  v36 = *v24;
  if (os_log_type_enabled(*v24, OS_LOG_TYPE_DEFAULT))
  {
    v37 = self->_settingsByActivityType;
    v38 = self->_enabledMetrics;
    v39 = v36;
    -[FIUIWorkoutSettingsManager domainAccessor](self, "domainAccessor");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "objectForKey:", CFSTR("ActivitySettingsFormatVersion"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = 138412802;
    v43 = v37;
    v44 = 2112;
    v45 = v38;
    v46 = 2112;
    v47 = v41;
    _os_log_impl(&dword_21307C000, v39, OS_LOG_TYPE_DEFAULT, "[WorkoutSettingsManager] _readFromDomain called after _migratePaceViewSettingsIfNeeded with settingsByActivityType:%@ and enabledMetrics:%@ and versionNumber:%@", (uint8_t *)&v42, 0x20u);

  }
}

- (BOOL)isMetricEnabled:(unint64_t)a3
{
  NSMutableDictionary *settingOverridesByMetric;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;

  settingOverridesByMetric = self->_settingOverridesByMetric;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%lu"), a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](settingOverridesByMetric, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = objc_msgSend(v7, "BOOLValue");
  }
  else
  {
    -[FIUIWorkoutDefaultMetricsProvider defaultEnabledMetrics](self->_defaultMetricsProvider, "defaultEnabledMetrics");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v9, "containsObject:", v10);

  }
  return v8;
}

- (void)_migratePaceViewSettingIfNeeded
{
  void *v3;
  NSMutableDictionary *settingOverridesByMetric;
  void *v5;
  NSMutableDictionary *v6;
  void *v7;
  id v8;

  if (!-[NSMutableDictionary count](self->_settingOverridesByMetric, "count")
    && -[FIUIWorkoutSettingsManager isMetricEnabled:](self, "isMetricEnabled:", 4))
  {
    -[FIUIWorkoutSettingsManager domainAccessor](self, "domainAccessor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKey:", CFSTR("ShowAveragePace"));
    v8 = (id)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v8, "BOOLValue"))
    {
      settingOverridesByMetric = self->_settingOverridesByMetric;
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%lu"), 8);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKey:](settingOverridesByMetric, "setObject:forKey:", MEMORY[0x24BDBD1C8], v5);

      v6 = self->_settingOverridesByMetric;
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%lu"), 4);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKey:](v6, "setObject:forKey:", MEMORY[0x24BDBD1C0], v7);

      -[NSMutableArray replaceObjectAtIndex:withObject:](self->_enabledMetrics, "replaceObjectAtIndex:withObject:", -[NSMutableArray indexOfObject:](self->_enabledMetrics, "indexOfObject:", &unk_24CF4F9B0), &unk_24CF4F9C8);
      -[FIUIWorkoutSettingsManager _writeToDomainWithShouldUpdateVersion:](self, "_writeToDomainWithShouldUpdateVersion:", 0);
    }

  }
}

- (id)orderedSupportedMetrics
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  -[FIUIWorkoutSettingsManager supportedMetrics](self, "supportedMetrics");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  v6 = (void *)MEMORY[0x24BDBCF20];
  -[FIUIWorkoutDefaultMetricsProvider supportedMetrics](self->_defaultMetricsProvider, "supportedMetrics");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setWithArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v10 = v5;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v18 != v13)
          objc_enumerationMutation(v10);
        v15 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
        if (objc_msgSend(v8, "containsObject:", v15, (_QWORD)v17))
          objc_msgSend(v9, "addObject:", v15);
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v12);
  }

  objc_msgSend(v9, "sortUsingFunction:context:", _SortMetricBySortIndex, 0);
  return v9;
}

- (id)supportedMetrics
{
  unint64_t v3;
  _BOOL8 v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = -[FIUIWorkoutActivityType identifier](self->_workoutActivityType, "identifier");
  v4 = -[FIUIWorkoutActivityType isIndoor](self->_workoutActivityType, "isIndoor");
  v5 = (void *)MEMORY[0x24BDBCEF0];
  -[FIUIWorkoutDefaultMetricsProvider supportedMetrics](self->_defaultMetricsProvider, "supportedMetrics");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setWithArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(MEMORY[0x24BDD4118], "fiui_isHeartRateSupportedForActivityType:isIndoor:", v3, v4) & 1) == 0)
  {
    objc_msgSend(v7, "removeObject:", &unk_24CF4F938);
    objc_msgSend(v7, "removeObject:", &unk_24CF4F950);
    objc_msgSend(v7, "removeObject:", &unk_24CF4F968);
    objc_msgSend(v7, "removeObject:", &unk_24CF4F980);
    objc_msgSend(v7, "removeObject:", &unk_24CF4F998);
  }
  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultMetricsProvider, 0);
  objc_storeStrong((id *)&self->_workoutActivityType, 0);
  objc_storeStrong((id *)&self->_lazy_syncManager, 0);
  objc_storeStrong((id *)&self->_lazy_domainAccessor, 0);
  objc_storeStrong((id *)&self->_enabledMetrics, 0);
  objc_storeStrong((id *)&self->_settingOverridesByMetric, 0);
  objc_storeStrong((id *)&self->_settingsByActivityType, 0);
}

- (id)orderedEnabledAndSupportedMetrics
{
  void *v3;
  void *v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[FIUIWorkoutSettingsManager supportedMetrics](self, "supportedMetrics");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = self->_enabledMetrics;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v4, "containsObject:", v10, (_QWORD)v12))
          objc_msgSend(v3, "addObject:", v10);
      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  return v3;
}

- (FIUIWorkoutSettingsManager)init
{

  return 0;
}

- (FIUIWorkoutSettingsManager)initWithWorkoutActivityType:(id)a3 activityMoveMode:(int64_t)a4
{
  id v7;
  FIUIWorkoutSettingsManager *v8;
  FIUIWorkoutSettingsManager *v9;
  FIUIWorkoutDefaultMetricsProvider *v10;
  uint64_t v11;
  uint64_t v12;
  FIUIWorkoutDefaultMetricsProvider *defaultMetricsProvider;
  void *v14;
  uint64_t v15;
  NSMutableArray *enabledMetrics;
  objc_super v18;

  v7 = a3;
  v18.receiver = self;
  v18.super_class = (Class)FIUIWorkoutSettingsManager;
  v8 = -[FIUIWorkoutSettingsManager init](&v18, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_workoutActivityType, a3);
    v9->_activityMoveMode = a4;
    v10 = [FIUIWorkoutDefaultMetricsProvider alloc];
    v11 = FIUIDeviceSupportsElevationGain();
    v12 = -[FIUIWorkoutDefaultMetricsProvider initWithMetricsVersion:activityType:activityMoveMode:deviceSupportsElevationMetrics:deviceSupportsGroundElevationMetrics:](v10, "initWithMetricsVersion:activityType:activityMoveMode:deviceSupportsElevationMetrics:deviceSupportsGroundElevationMetrics:", 6, v7, a4, v11, FIUIDeviceSupportsGroundElevation());
    defaultMetricsProvider = v9->_defaultMetricsProvider;
    v9->_defaultMetricsProvider = (FIUIWorkoutDefaultMetricsProvider *)v12;

    if (-[FIUIWorkoutSettingsManager _useUserConfiguredWorkoutMetricsForMetricsActivityMoveMode:activityMoveMode:](v9, "_useUserConfiguredWorkoutMetricsForMetricsActivityMoveMode:activityMoveMode:", +[FIUIWorkoutSettingsManager readWorkoutMetricsActivityMoveMode](FIUIWorkoutSettingsManager, "readWorkoutMetricsActivityMoveMode"), a4))
    {
      -[FIUIWorkoutSettingsManager _clearOldMetricsIfNeeded](v9, "_clearOldMetricsIfNeeded");
      -[FIUIWorkoutSettingsManager _readFromDomain](v9, "_readFromDomain");
    }
    else
    {
      -[FIUIWorkoutDefaultMetricsProvider defaultEnabledMetrics](v9->_defaultMetricsProvider, "defaultEnabledMetrics");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "mutableCopy");
      enabledMetrics = v9->_enabledMetrics;
      v9->_enabledMetrics = (NSMutableArray *)v15;

    }
  }

  return v9;
}

- (NPSDomainAccessor)domainAccessor
{
  NPSDomainAccessor *lazy_domainAccessor;
  id v4;
  NPSDomainAccessor *v5;
  NPSDomainAccessor *v6;

  lazy_domainAccessor = self->_lazy_domainAccessor;
  if (!lazy_domainAccessor)
  {
    v4 = objc_alloc(MEMORY[0x24BE6B2C0]);
    v5 = (NPSDomainAccessor *)objc_msgSend(v4, "initWithDomain:", *MEMORY[0x24BE32888]);
    v6 = self->_lazy_domainAccessor;
    self->_lazy_domainAccessor = v5;

    lazy_domainAccessor = self->_lazy_domainAccessor;
  }
  return lazy_domainAccessor;
}

- (NPSManager)syncManager
{
  NPSManager *lazy_syncManager;
  NPSManager *v4;
  NPSManager *v5;

  lazy_syncManager = self->_lazy_syncManager;
  if (!lazy_syncManager)
  {
    v4 = (NPSManager *)objc_alloc_init(MEMORY[0x24BE6B2C8]);
    v5 = self->_lazy_syncManager;
    self->_lazy_syncManager = v4;

    lazy_syncManager = self->_lazy_syncManager;
  }
  return lazy_syncManager;
}

- (void)_clearOldMetricsIfNeeded
{
  void *v3;
  void *v4;
  NSMutableDictionary *v5;
  NSMutableDictionary *settingsByActivityType;
  NSMutableDictionary *v7;
  void *v8;
  void *v9;
  void *v10;
  NSMutableDictionary *v11;
  NSMutableDictionary *settingOverridesByMetric;
  void *v13;
  NSMutableArray *v14;
  NSMutableArray *enabledMetrics;
  void *v16;
  void *v17;
  NSObject *v18;
  FIUIWorkoutActivityType *workoutActivityType;
  NSMutableDictionary *v20;
  NSMutableDictionary *v21;
  NSMutableArray *v22;
  int v23;
  FIUIWorkoutActivityType *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  NSMutableDictionary *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  -[FIUIWorkoutSettingsManager domainAccessor](self, "domainAccessor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("SettingsByActivityType"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (NSMutableDictionary *)objc_msgSend(v4, "mutableCopy");
  settingsByActivityType = self->_settingsByActivityType;
  self->_settingsByActivityType = v5;

  v7 = self->_settingsByActivityType;
  KeyForWorkoutActivityType(self->_workoutActivityType);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](v7, "objectForKey:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "objectForKey:", CFSTR("MetricSettingOverrides"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (NSMutableDictionary *)objc_msgSend(v10, "mutableCopy");
  settingOverridesByMetric = self->_settingOverridesByMetric;
  self->_settingOverridesByMetric = v11;

  objc_msgSend(v9, "objectForKey:", CFSTR("EnabledMetrics"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (NSMutableArray *)objc_msgSend(v13, "mutableCopy");
  enabledMetrics = self->_enabledMetrics;
  self->_enabledMetrics = v14;

  -[FIUIWorkoutSettingsManager domainAccessor](self, "domainAccessor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectForKey:", CFSTR("ActivitySettingsFormatVersion"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[FIUIWorkoutActivityType identifier](self->_workoutActivityType, "identifier") == 37
    && !-[FIUIWorkoutActivityType isIndoor](self->_workoutActivityType, "isIndoor")
    && FIDeviceMeetsMinimumOSVersionGlory()
    && !-[FIUIWorkoutSettingsManager _hasUserMadeMetricChangesToWorkoutType:enabledMetrics:settingOverridesByMetric:metricFormatVersion:](self, "_hasUserMadeMetricChangesToWorkoutType:enabledMetrics:settingOverridesByMetric:metricFormatVersion:", self->_workoutActivityType, self->_enabledMetrics, self->_settingOverridesByMetric, v17))
  {
    _HKInitializeLogging();
    v18 = *MEMORY[0x24BDD3078];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3078], OS_LOG_TYPE_DEFAULT))
    {
      workoutActivityType = self->_workoutActivityType;
      v20 = self->_settingsByActivityType;
      v23 = 138543874;
      v24 = workoutActivityType;
      v25 = 2114;
      v26 = v17;
      v27 = 2114;
      v28 = v20;
      _os_log_impl(&dword_21307C000, v18, OS_LOG_TYPE_DEFAULT, "[WorkoutSettingsManager] Clearing metrics for activity type: %{public}@, version number: %{public}@, settingsByActivityType: %{public}@", (uint8_t *)&v23, 0x20u);
    }
    v21 = self->_settingOverridesByMetric;
    self->_settingOverridesByMetric = 0;

    v22 = self->_enabledMetrics;
    self->_enabledMetrics = 0;

    -[FIUIWorkoutSettingsManager _writeToDomainWithShouldUpdateVersion:](self, "_writeToDomainWithShouldUpdateVersion:", 1);
  }

}

- (id)orderedEnabledMetrics
{
  return self->_enabledMetrics;
}

- (id)orderedDisabledMetrics
{
  void *v3;
  void *v4;

  -[FIUIWorkoutDefaultMetricsProvider supportedMetrics](self->_defaultMetricsProvider, "supportedMetrics");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  objc_msgSend(v4, "removeObjectsInArray:", self->_enabledMetrics);
  objc_msgSend(v4, "sortUsingFunction:context:", _SortMetricBySortIndex, 0);
  return v4;
}

- (void)setEnabled:(BOOL)a3 forMetricType:(unint64_t)a4 didChange:(BOOL *)a5
{
  _BOOL8 v7;
  uint64_t v9;
  void *v10;
  void *v11;
  char v12;
  NSMutableDictionary *settingOverridesByMetric;
  void *v14;
  NSMutableArray *enabledMetrics;
  void *v16;
  id v17;

  v7 = a3;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%lu"), a4);
  v9 = objc_claimAutoreleasedReturnValue();
  v17 = (id)v9;
  if (a5)
  {
    -[NSMutableDictionary objectForKey:](self->_settingOverridesByMetric, "objectForKey:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
      v12 = objc_msgSend(v10, "BOOLValue") ^ v7;
    else
      v12 = 1;
    *a5 = v12;

  }
  settingOverridesByMetric = self->_settingOverridesByMetric;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v7);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](settingOverridesByMetric, "setObject:forKey:", v14, v17);

  enabledMetrics = self->_enabledMetrics;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    -[NSMutableArray addObject:](enabledMetrics, "addObject:", v16);
  else
    -[NSMutableArray removeObject:](enabledMetrics, "removeObject:", v16);

  -[FIUIWorkoutSettingsManager _writeToDomainWithShouldUpdateVersion:](self, "_writeToDomainWithShouldUpdateVersion:", 0);
}

- (void)moveMetricType:(unint64_t)a3 toEnabledIndex:(int64_t)a4
{
  void *v7;
  NSMutableArray *enabledMetrics;
  void *v9;
  NSMutableArray *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  if (-[NSMutableArray count](self->_enabledMetrics, "count") >= (unint64_t)a4)
  {
    enabledMetrics = self->_enabledMetrics;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray removeObject:](enabledMetrics, "removeObject:", v9);

    v10 = self->_enabledMetrics;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray insertObject:atIndex:](v10, "insertObject:atIndex:", v11, a4);

    -[FIUIWorkoutSettingsManager _writeToDomainWithShouldUpdateVersion:](self, "_writeToDomainWithShouldUpdateVersion:", 0);
  }
  else
  {
    _HKInitializeLogging();
    v7 = (void *)*MEMORY[0x24BDD2FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FA8], OS_LOG_TYPE_ERROR))
    {
      v12 = (void *)MEMORY[0x24BDD16E0];
      v13 = v7;
      objc_msgSend(v12, "numberWithUnsignedInteger:", a3);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a4);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[NSMutableArray count](self->_enabledMetrics, "count"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138412802;
      v18 = v14;
      v19 = 2112;
      v20 = v15;
      v21 = 2112;
      v22 = v16;
      _os_log_error_impl(&dword_21307C000, v13, OS_LOG_TYPE_ERROR, "Workout Settings Manager attempting to move metric %@ to index %@ (enabled count = %@)", (uint8_t *)&v17, 0x20u);

    }
  }
}

- (void)assignMetricType:(unint64_t)a3 toSlotIndex:(int64_t)a4
{
  NSMutableArray *enabledMetrics;
  void *v8;

  -[NSMutableArray removeObjectAtIndex:](self->_enabledMetrics, "removeObjectAtIndex:", a4);
  enabledMetrics = self->_enabledMetrics;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray insertObject:atIndex:](enabledMetrics, "insertObject:atIndex:", v8, a4);

  -[FIUIWorkoutSettingsManager _writeToDomainWithShouldUpdateVersion:](self, "_writeToDomainWithShouldUpdateVersion:", 0);
}

- (int64_t)disabledIndexForMetricType:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int64_t v9;

  -[FIUIWorkoutSettingsManager orderedDisabledMetrics](self, "orderedDisabledMetrics");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  if (-[FIUIWorkoutSettingsManager isMetricEnabled:](self, "isMetricEnabled:", a3))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v7);

    objc_msgSend(v6, "sortUsingFunction:context:", _SortMetricBySortIndex, 0);
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "indexOfObject:", v8);

  return v9;
}

- (void)reloadMetrics
{
  NSMutableArray *v3;
  NSMutableArray *enabledMetrics;
  id v5;

  if (-[FIUIWorkoutSettingsManager _useUserConfiguredWorkoutMetricsForMetricsActivityMoveMode:activityMoveMode:](self, "_useUserConfiguredWorkoutMetricsForMetricsActivityMoveMode:activityMoveMode:", +[FIUIWorkoutSettingsManager readWorkoutMetricsActivityMoveMode](FIUIWorkoutSettingsManager, "readWorkoutMetricsActivityMoveMode"), self->_activityMoveMode))
  {
    -[FIUIWorkoutSettingsManager _readFromDomain](self, "_readFromDomain");
  }
  else
  {
    -[FIUIWorkoutDefaultMetricsProvider defaultEnabledMetrics](self->_defaultMetricsProvider, "defaultEnabledMetrics");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    v3 = (NSMutableArray *)objc_msgSend(v5, "mutableCopy");
    enabledMetrics = self->_enabledMetrics;
    self->_enabledMetrics = v3;

  }
}

- (BOOL)_enabledMetricsAreDefaultAfterPaceMigration:(id)a3 workoutActivityType:(id)a4
{
  id v5;
  id v6;
  char v7;
  uint64_t v8;
  BOOL v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;

  v5 = a3;
  v6 = a4;
  v7 = objc_msgSend(v6, "isIndoor");
  v8 = objc_msgSend(v6, "identifier");

  v9 = 0;
  if (v8 == 37 && (v7 & 1) == 0)
  {
    if (objc_msgSend(v5, "count") != 4)
      goto LABEL_8;
    objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "unsignedIntegerValue");

    if (v11 != 3)
      goto LABEL_8;
    objc_msgSend(v5, "objectAtIndexedSubscript:", 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "unsignedIntegerValue");

    if (v13 != 8)
      goto LABEL_8;
    objc_msgSend(v5, "objectAtIndexedSubscript:", 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "unsignedIntegerValue");

    if (v15 == 5)
    {
      objc_msgSend(v5, "objectAtIndexedSubscript:", 3);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v16, "unsignedIntegerValue") == 1;

    }
    else
    {
LABEL_8:
      v9 = 0;
    }
  }

  return v9;
}

- (BOOL)_hasUserMadeMetricChangesToWorkoutType:(id)a3 enabledMetrics:(id)a4 settingOverridesByMetric:(id)a5 metricFormatVersion:(id)a6
{
  id v10;
  unint64_t v11;
  unint64_t v12;
  id v13;
  void *v14;
  _BOOL4 v15;

  v10 = a3;
  v11 = (unint64_t)a4;
  v12 = (unint64_t)a5;
  v13 = a6;
  v14 = v13;
  if (v11 | v12)
  {
    if (objc_msgSend(v13, "intValue") == 1 || objc_msgSend(v14, "intValue") == 2)
      v15 = !-[FIUIWorkoutSettingsManager _enabledMetricsAreDefaultAfterPaceMigration:workoutActivityType:](self, "_enabledMetricsAreDefaultAfterPaceMigration:workoutActivityType:", v11, v10);
    else
      LOBYTE(v15) = 1;
  }
  else
  {
    LOBYTE(v15) = 0;
  }

  return v15;
}

+ (int64_t)readWorkoutMetricsActivityMoveMode
{
  id v2;
  void *v3;
  id v4;
  uint64_t v5;
  int64_t v6;
  char v8;

  v2 = objc_alloc(MEMORY[0x24BE6B2C0]);
  v3 = (void *)objc_msgSend(v2, "initWithDomain:", *MEMORY[0x24BE32888]);
  v4 = (id)objc_msgSend(v3, "synchronize");
  v8 = 0;
  v5 = objc_msgSend(v3, "integerForKey:keyExistsAndHasValidFormat:", CFSTR("WorkoutMetricsActivityMoveMode"), &v8);
  if (v8)
    v6 = v5;
  else
    v6 = 1;

  return v6;
}

- (void)_writeToDomainWithShouldUpdateVersion:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  NSMutableArray *enabledMetrics;
  NSMutableDictionary *settingOverridesByMetric;
  uint64_t v9;
  NSMutableDictionary *settingsByActivityType;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSMutableDictionary *v22;
  NSMutableArray *v23;
  const __CFString *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  int v28;
  NSMutableDictionary *v29;
  __int16 v30;
  NSMutableArray *v31;
  __int16 v32;
  const __CFString *v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v3 = a3;
  v36 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  enabledMetrics = self->_enabledMetrics;
  if (enabledMetrics)
    objc_msgSend(v5, "setObject:forKey:", enabledMetrics, CFSTR("EnabledMetrics"));
  settingOverridesByMetric = self->_settingOverridesByMetric;
  if (settingOverridesByMetric)
    objc_msgSend(v6, "setObject:forKey:", settingOverridesByMetric, CFSTR("MetricSettingOverrides"));
  v9 = objc_msgSend(v6, "count");
  settingsByActivityType = self->_settingsByActivityType;
  KeyForWorkoutActivityType(self->_workoutActivityType);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
    -[NSMutableDictionary setObject:forKey:](settingsByActivityType, "setObject:forKey:", v6, v11);
  else
    -[NSMutableDictionary removeObjectForKey:](settingsByActivityType, "removeObjectForKey:", v11);

  -[FIUIWorkoutSettingsManager domainAccessor](self, "domainAccessor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKey:", self->_settingsByActivityType, CFSTR("SettingsByActivityType"));

  if (v3)
  {
    -[FIUIWorkoutSettingsManager domainAccessor](self, "domainAccessor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[FIUIWorkoutDefaultMetricsProvider metricsVersion](self->_defaultMetricsProvider, "metricsVersion"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKey:", v14, CFSTR("ActivitySettingsFormatVersion"));

  }
  -[FIUIWorkoutSettingsManager domainAccessor](self, "domainAccessor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (id)objc_msgSend(v15, "synchronize");

  -[FIUIWorkoutSettingsManager syncManager](self, "syncManager");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[FIUIWorkoutSettingsManager domainAccessor](self, "domainAccessor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "domain");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", CFSTR("SettingsByActivityType"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "synchronizeNanoDomain:keys:", v19, v20);

  _HKInitializeLogging();
  v21 = (void *)*MEMORY[0x24BDD3078];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3078], OS_LOG_TYPE_DEFAULT))
  {
    v22 = self->_settingsByActivityType;
    v23 = self->_enabledMetrics;
    if (v3)
      v24 = CFSTR("YES");
    else
      v24 = CFSTR("NO");
    v25 = v21;
    -[FIUIWorkoutSettingsManager domainAccessor](self, "domainAccessor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "objectForKey:", CFSTR("ActivitySettingsFormatVersion"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = 138413058;
    v29 = v22;
    v30 = 2112;
    v31 = v23;
    v32 = 2112;
    v33 = v24;
    v34 = 2112;
    v35 = v27;
    _os_log_impl(&dword_21307C000, v25, OS_LOG_TYPE_DEFAULT, "[WorkoutSettingsManager] _writeToDomain called with settingsByActivityType:%@ and enabledMetrics:%@ and shouldUpdateVersion:%@ and metricsVersion:%@", (uint8_t *)&v28, 0x2Au);

  }
}

- (BOOL)_useUserConfiguredWorkoutMetricsForMetricsActivityMoveMode:(int64_t)a3 activityMoveMode:(int64_t)a4
{
  BOOL v4;

  v4 = a3 != 2 || (unint64_t)a4 > 1;
  if ((unint64_t)a3 >= 2)
    return v4;
  else
    return a4 != 2;
}

+ (void)obliterateUserConfiguredWorkoutMetrics
{
  id v2;
  void *v3;
  id v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint8_t v12[8];
  _QWORD v13[3];

  v13[2] = *MEMORY[0x24BDAC8D0];
  v2 = objc_alloc(MEMORY[0x24BE6B2C0]);
  v3 = (void *)objc_msgSend(v2, "initWithDomain:", *MEMORY[0x24BE32888]);
  v4 = (id)objc_msgSend(v3, "synchronize");
  objc_msgSend(v3, "removeObjectForKey:", CFSTR("SettingsByActivityType"));
  objc_msgSend(v3, "removeObjectForKey:", CFSTR("ActivitySettingsFormatVersion"));
  objc_msgSend(v3, "removeObjectForKey:", CFSTR("WorkoutMetricsActivityMoveMode"));
  v5 = (id)objc_msgSend(v3, "synchronize");
  v6 = objc_alloc_init(MEMORY[0x24BE6B2C8]);
  v7 = (void *)MEMORY[0x24BDBCEF0];
  v13[0] = CFSTR("SettingsByActivityType");
  v13[1] = CFSTR("ActivitySettingsFormatVersion");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v13, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWithArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "addObject:", CFSTR("WorkoutMetricsActivityMoveMode"));
  objc_msgSend(v3, "domain");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "synchronizeNanoDomain:keys:", v10, v9);

  _HKInitializeLogging();
  v11 = *MEMORY[0x24BDD3078];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3078], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v12 = 0;
    _os_log_impl(&dword_21307C000, v11, OS_LOG_TYPE_DEFAULT, "[WorkoutSettingsManager] user configured workout metrics obliterated", v12, 2u);
  }

}

- (void)setDomainAccessor:(id)a3
{
  objc_storeStrong((id *)&self->_lazy_domainAccessor, a3);
}

- (void)setSyncManager:(id)a3
{
  objc_storeStrong((id *)&self->_lazy_syncManager, a3);
}

- (FIUIWorkoutActivityType)workoutActivityType
{
  return self->_workoutActivityType;
}

- (FIUIWorkoutDefaultMetricsProvider)defaultMetricsProvider
{
  return self->_defaultMetricsProvider;
}

@end
