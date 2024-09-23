@implementation _HKBehavior

- (BOOL)isAppleInternalInstall
{
  return self->_isAppleInternalInstall;
}

- (BOOL)supportsSampleExpiration
{
  return self->_supportsSampleExpiration;
}

- (BOOL)isDeviceSupported
{
  return self->_isDeviceSupported;
}

+ (BOOL)isAppleInternalInstall
{
  void *v2;
  char v3;

  objc_msgSend(a1, "sharedBehavior");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isAppleInternalInstall");

  return v3;
}

+ (id)sharedBehavior
{
  _HKBehavior *v2;
  void *v3;
  id v4;
  void *v5;
  id v6;

  os_unfair_lock_lock((os_unfair_lock_t)&_sharedBehaviorLock);
  if (!+[_HKBehavior sharedBehavior]::defaultBehavior)
  {
    v2 = objc_alloc_init(_HKBehavior);
    v3 = (void *)+[_HKBehavior sharedBehavior]::defaultBehavior;
    +[_HKBehavior sharedBehavior]::defaultBehavior = (uint64_t)v2;

  }
  v4 = (id)_sharedBehaviorOverride;
  os_unfair_lock_unlock((os_unfair_lock_t)&_sharedBehaviorLock);
  if (v4)
    v5 = v4;
  else
    v5 = (void *)+[_HKBehavior sharedBehavior]::defaultBehavior;
  v6 = v5;

  return v6;
}

- (NSTimeZone)localTimeZone
{
  return (NSTimeZone *)objc_msgSend(MEMORY[0x1E0C99E80], "localTimeZone");
}

+ (BOOL)activePairedWatchHasSmartFitnessCoaching
{
  void *v2;
  void *v3;
  char v4;

  objc_msgSend((id)objc_opt_class(), "_getActivePairedDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", CFSTR("6ADE877A-70EB-43A1-A4D1-3E4BB50EFA54"));
  v4 = objc_msgSend(v2, "supportsCapability:", v3);

  return v4;
}

- (BOOL)futureMigrationsEnabled
{
  os_unfair_lock_s *p_loadLock;
  char value;
  _QWORD *v5;
  uint64_t v6;
  _HKBehavior *v8;
  _QWORD v9[3];
  _QWORD *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v8 = self;
  v9[0] = &off_1E37F7388;
  v9[1] = &v8;
  v10 = v9;
  p_loadLock = &self->_futureMigrationsEnabled._loadLock;
  os_unfair_lock_lock(&self->_futureMigrationsEnabled._loadLock);
  if (self->_futureMigrationsEnabled._hasLoaded)
  {
    value = self->_futureMigrationsEnabled._value;
  }
  else
  {
    if (!v10)
      std::__throw_bad_function_call[abi:ne180100]();
    value = (*(uint64_t (**)(_QWORD *))(*v10 + 48))(v10);
    self->_futureMigrationsEnabled._value = value;
    self->_futureMigrationsEnabled._hasLoaded = 1;
  }
  os_unfair_lock_unlock(p_loadLock);
  v5 = v10;
  if (v10 == v9)
  {
    v6 = 4;
    v5 = v9;
    goto LABEL_9;
  }
  if (v10)
  {
    v6 = 5;
LABEL_9:
    (*(void (**)(void))(*v5 + 8 * v6))();
  }
  return value;
}

- (BOOL)isAppleWatch
{
  return self->_isAppleWatch;
}

- (NSString)currentDeviceProductType
{
  return self->_currentDeviceProductType;
}

- (NSString)currentOSBuild
{
  return self->_currentOSBuild;
}

- ($9FE6E10C8CE45DBC9A88DFDEA39A390D)currentOSVersionStruct
{
  *($A44FF20282FB96BA82CF1B0FF6945C38 *)retstr = ($A44FF20282FB96BA82CF1B0FF6945C38)self[14];
  return self;
}

- (NSString)currentOSVersion
{
  return self->_currentOSVersion;
}

+ (id)currentDeviceProductType
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "sharedBehavior");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentDeviceProductType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)currentDeviceDisplayName
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "sharedBehavior");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentDeviceDisplayName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSString)currentDeviceDisplayName
{
  return (NSString *)(id)MGCopyAnswer();
}

+ (void)setSharedBehavior:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&_sharedBehaviorLock);
  v4 = (void *)_sharedBehaviorOverride;
  _sharedBehaviorOverride = (uint64_t)v3;

  os_unfair_lock_unlock((os_unfair_lock_t)&_sharedBehaviorLock);
}

+ (void)resetSharedBehavior
{
  void *v2;

  os_unfair_lock_lock((os_unfair_lock_t)&_sharedBehaviorLock);
  v2 = (void *)_sharedBehaviorOverride;
  _sharedBehaviorOverride = 0;

  os_unfair_lock_unlock((os_unfair_lock_t)&_sharedBehaviorLock);
}

+ (int)nanoSyncProtocolVersionForWatchSystemBuildVersion:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if (objc_msgSend(v3, "hk_compareBuildVersionWithString:", CFSTR("15R1")) == -1)
  {
    v4 = 5;
  }
  else if (objc_msgSend(v3, "hk_compareBuildVersionWithString:", CFSTR("16R1")) == -1)
  {
    v4 = 6;
  }
  else if (objc_msgSend(v3, "hk_compareBuildVersionWithString:", CFSTR("16R565")) == -1
         || (objc_msgSend(v3, "hk_isBetweenLowerBuildVersion:upperBuildVersion:", CFSTR("16R5000"), CFSTR("16R5565")) & 1) != 0)
  {
    v4 = 8;
  }
  else if (objc_msgSend(v3, "hk_compareBuildVersionWithString:", CFSTR("16S36")) == -1
         || (objc_msgSend(v3, "hk_isBetweenLowerBuildVersion:upperBuildVersion:", CFSTR("16S5000"), CFSTR("16S5036")) & 1) != 0)
  {
    v4 = 9;
  }
  else if (objc_msgSend(v3, "hk_compareBuildVersionWithString:", CFSTR("17R540")) == -1
         || (objc_msgSend(v3, "hk_isBetweenLowerBuildVersion:upperBuildVersion:", CFSTR("17R5000"), CFSTR("17R5540")) & 1) != 0)
  {
    v4 = 10;
  }
  else if (objc_msgSend(v3, "hk_compareBuildVersionWithString:", CFSTR("18R325")) == -1
         || (objc_msgSend(v3, "hk_isBetweenLowerBuildVersion:upperBuildVersion:", CFSTR("18R5000"), CFSTR("18R5325")) & 1) != 0)
  {
    v4 = 11;
  }
  else if (objc_msgSend(v3, "hk_compareBuildVersionWithString:", CFSTR("19R321")) == -1
         || (objc_msgSend(v3, "hk_isBetweenLowerBuildVersion:upperBuildVersion:", CFSTR("19R5000"), CFSTR("19R5321")) & 1) != 0)
  {
    v4 = 12;
  }
  else if (objc_msgSend(v3, "hk_compareBuildVersionWithString:", CFSTR("20R263")) == -1)
  {
    v4 = 13;
  }
  else if (objc_msgSend(v3, "hk_compareBuildVersionWithString:", CFSTR("21R305")) == -1
         || (objc_msgSend(v3, "hk_isBetweenLowerBuildVersion:upperBuildVersion:", CFSTR("21R5000"), CFSTR("21R5304")) & 1) != 0)
  {
    v4 = 14;
  }
  else if (objc_msgSend(v3, "hk_compareBuildVersionWithString:", CFSTR("22R278")) == -1)
  {
    v4 = 15;
  }
  else
  {
    v4 = 16;
  }

  return v4;
}

+ (int)nanoSyncProtocolVersionForCompanionSystemBuildVersion:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if (objc_msgSend(v3, "hk_compareBuildVersionWithString:", CFSTR("15A1")) == -1)
  {
    v4 = 5;
  }
  else if (objc_msgSend(v3, "hk_compareBuildVersionWithString:", CFSTR("16A1")) == -1)
  {
    v4 = 6;
  }
  else if (objc_msgSend(v3, "hk_compareBuildVersionWithString:", CFSTR("16B65")) == -1
         || (objc_msgSend(v3, "hk_isBetweenLowerBuildVersion:upperBuildVersion:", CFSTR("16B5000"), CFSTR("16B5065")) & 1) != 0)
  {
    v4 = 8;
  }
  else if (objc_msgSend(v3, "hk_compareBuildVersionWithString:", CFSTR("16C37")) == -1
         || (objc_msgSend(v3, "hk_isBetweenLowerBuildVersion:upperBuildVersion:", CFSTR("16C5000"), CFSTR("16C5037")) & 1) != 0)
  {
    v4 = 9;
  }
  else if (objc_msgSend(v3, "hk_compareBuildVersionWithString:", CFSTR("17A540")) == -1
         || (objc_msgSend(v3, "hk_isBetweenLowerBuildVersion:upperBuildVersion:", CFSTR("17A5000"), CFSTR("17A5540")) & 1) != 0)
  {
    v4 = 10;
  }
  else if (objc_msgSend(v3, "hk_compareBuildVersionWithString:", CFSTR("18A315")) == -1
         || (objc_msgSend(v3, "hk_isBetweenLowerBuildVersion:upperBuildVersion:", CFSTR("18A5000"), CFSTR("18A5315")) & 1) != 0)
  {
    v4 = 11;
  }
  else if (objc_msgSend(v3, "hk_compareBuildVersionWithString:", CFSTR("19A316")) == -1
         || (objc_msgSend(v3, "hk_isBetweenLowerBuildVersion:upperBuildVersion:", CFSTR("19A5000"), CFSTR("19A5316")) & 1) != 0)
  {
    v4 = 12;
  }
  else if (objc_msgSend(v3, "hk_compareBuildVersionWithString:", CFSTR("20A260")) == -1)
  {
    v4 = 13;
  }
  else if (objc_msgSend(v3, "hk_compareBuildVersionWithString:", CFSTR("21A277")) == -1
         || (objc_msgSend(v3, "hk_isBetweenLowerBuildVersion:upperBuildVersion:", CFSTR("21A5000"), CFSTR("21A5276")) & 1) != 0)
  {
    v4 = 14;
  }
  else if (objc_msgSend(v3, "hk_compareBuildVersionWithString:", CFSTR("22A276")) == -1)
  {
    v4 = 15;
  }
  else
  {
    v4 = 16;
  }

  return v4;
}

+ (BOOL)hasPairedWatch
{
  void *v2;
  BOOL v3;

  objc_msgSend((id)objc_opt_class(), "_getActivePairedDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

+ (id)_getActivePairedDevice
{
  void *v2;
  void *v3;

  objc_msgSend(getNRPairedDeviceRegistryClass(), "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "getActivePairedDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (BOOL)anyPairedWatchHasFlightsClimbedCapability
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(getNRPairedDeviceRegistryClass(), "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  objc_msgSend(v2, "getSetupCompletedDevices", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v3);
        v7 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
        v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", CFSTR("D1DBCF21-D875-4EA8-B63E-8182578C0B0C"));
        LOBYTE(v7) = objc_msgSend(v7, "supportsCapability:", v8);

        if ((v7 & 1) != 0)
        {
          LOBYTE(v4) = 1;
          goto LABEL_11;
        }
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_11:

  return v4;
}

+ (BOOL)activePairedWatchSupportsHeartRateMotionContexts
{
  void *v2;
  void *v3;
  char v4;

  objc_msgSend((id)objc_opt_class(), "_getActivePairedDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", CFSTR("E17D2903-B868-4E6C-8E76-6D4939BEED44"));
  v4 = objc_msgSend(v2, "supportsCapability:", v3);

  return v4;
}

+ (BOOL)allPairedWatchesSupportHeartRateMotionContexts
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  BOOL v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(getNRPairedDeviceRegistryClass(), "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  objc_msgSend(v2, "getSetupCompletedDevices", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v12 != v5)
          objc_enumerationMutation(v3);
        v7 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", CFSTR("E17D2903-B868-4E6C-8E76-6D4939BEED44"));
        LOBYTE(v7) = objc_msgSend(v7, "supportsCapability:", v8);

        if ((v7 & 1) == 0)
        {
          v9 = 0;
          goto LABEL_11;
        }
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v4)
        continue;
      break;
    }
  }
  v9 = 1;
LABEL_11:

  return v9;
}

+ (BOOL)activePairedWatchSupportsBradycardiaDetection
{
  char v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  char v6;

  v2 = objc_msgSend(a1, "activePairedWatchSupportsHeartRateMotionContexts");
  objc_msgSend((id)objc_opt_class(), "_getActivePairedDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  getNRWatchOSVersionForRemoteDevice(v3);
  v5 = v4;

  getNRVersionIsGreaterThanOrEqual(v5);
  return v2 & v6;
}

+ (BOOL)allPairedWatchesSupportBradycardiaDetection
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  uint64_t v7;
  int v8;
  BOOL v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend(a1, "allPairedWatchesSupportHeartRateMotionContexts"))
    return 0;
  objc_msgSend(getNRPairedDeviceRegistryClass(), "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  objc_msgSend(v2, "getSetupCompletedDevices", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v12 != v5)
          objc_enumerationMutation(v3);
        getNRWatchOSVersionForRemoteDevice(*(void **)(*((_QWORD *)&v11 + 1) + 8 * i));
        getNRVersionIsGreaterThanOrEqual(v7);
        if (!v8)
        {
          v9 = 0;
          goto LABEL_13;
        }
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v4)
        continue;
      break;
    }
  }
  v9 = 1;
LABEL_13:

  return v9;
}

- (_HKBehavior)init
{
  _HKBehavior *v2;
  uint64_t v3;
  NSString *currentDeviceName;
  uint64_t v5;
  NSString *currentOSBuild;
  uint64_t v7;
  NSString *currentOSVersion;
  void *v9;
  BOOL isAppleWatch;
  char v11;
  char isCompanionCapable;
  BOOL v13;
  uint64_t v14;
  NSString *currentDeviceProductType;
  uint64_t v16;
  NSString *currentDeviceSerialNumber;
  BOOL v18;
  BOOL v19;
  NSDictionary *featureRequirementOverrides;
  __int128 v22;
  int64_t v23;
  objc_super v24;

  v24.receiver = self;
  v24.super_class = (Class)_HKBehavior;
  v2 = -[_HKBehavior init](&v24, sel_init);
  if (v2)
  {
    v2->_isDeviceSupported = objc_msgSend((id)objc_opt_class(), "_isDeviceSupported");
    v2->_isAppleWatch = 0;
    v2->_isRunningSeedBuild = 0;
    v2->_isAppleInternalInstall = objc_msgSend((id)objc_opt_class(), "_isAppleInternalInstall");
    v2->_isCompanionCapable = MGGetBoolAnswer();
    v2->_hasTelephonyCapability = objc_msgSend((id)objc_opt_class(), "_hasTelephonyCapability");
    objc_msgSend((id)objc_opt_class(), "_currentDeviceName");
    v3 = objc_claimAutoreleasedReturnValue();
    currentDeviceName = v2->_currentDeviceName;
    v2->_currentDeviceName = (NSString *)v3;

    objc_msgSend((id)objc_opt_class(), "_currentOSBuild");
    v5 = objc_claimAutoreleasedReturnValue();
    currentOSBuild = v2->_currentOSBuild;
    v2->_currentOSBuild = (NSString *)v5;

    objc_msgSend((id)objc_opt_class(), "_currentOSVersion");
    v7 = objc_claimAutoreleasedReturnValue();
    currentOSVersion = v2->_currentOSVersion;
    v2->_currentOSVersion = (NSString *)v7;

    v9 = (void *)objc_opt_class();
    if (v9)
    {
      objc_msgSend(v9, "_currentOSVersionStruct");
    }
    else
    {
      v22 = 0uLL;
      v23 = 0;
    }
    *(_OWORD *)&v2->_currentOSVersionStruct.majorVersion = v22;
    v2->_currentOSVersionStruct.patchVersion = v23;
    isAppleWatch = v2->_isAppleWatch;
    if (isAppleWatch)
    {
      v11 = 0;
      isCompanionCapable = 1;
      v13 = 1;
    }
    else
    {
      isCompanionCapable = v2->_isCompanionCapable;
      v13 = isCompanionCapable != 0;
      v11 = 1;
    }
    v2->_supportsActivitySharing = isCompanionCapable;
    v2->_supportsBackgroundSyncRequests = 1;
    v2->_supportsAppSubscriptions = 1;
    v2->_supportsAWDMetricSubmission = v11;
    v2->_supportsNanoSync = v13;
    v2->_supportsSampleExpiration = isAppleWatch;
    v2->_supportsComputedUserCharacteristicCaching = v11;
    v2->_supportsHeartRateDataCollection = isAppleWatch;
    v2->_supportsBluetoothDiscovery = 1;
    v2->_isProdFused = MGGetBoolAnswer();
    v14 = MGCopyAnswer();
    currentDeviceProductType = v2->_currentDeviceProductType;
    v2->_currentDeviceProductType = (NSString *)v14;

    v16 = MGCopyAnswer();
    currentDeviceSerialNumber = v2->_currentDeviceSerialNumber;
    v2->_currentDeviceSerialNumber = (NSString *)v16;

    v2->_collectsData = 1;
    v18 = v2->_isAppleWatch;
    v2->_collectsCalorimetry = v18;
    v2->_performsAutomaticConceptIndexing = !v18;
    v2->_performsWorkoutCondensation = objc_msgSend((id)objc_opt_class(), "_isiPad") ^ 1;
    v2->_supportsWorkouts = 1;
    v19 = !v2->_isAppleWatch;
    v2->_supportsOntology = v19;
    v2->_supportsOntologyDatabaseUpdates = v19;
    v2->_supportsOntologyFeatureEvaluation = v19;
    v2->_supportsPeriodicCountryMonitoring = v19;
    v2->_showSensitiveLogItems = objc_msgSend((id)objc_opt_class(), "_showSensitiveLogItems");
    v2->_ontologyIndexingEnabled = v2->_supportsOntology;
    v2->_ontologyIndexingRequiresAccounts = 1;
    v2->_schedulesXPCAlarms = 1;
    v2->_invalidatesNotificationInstructionsOnLaunch = 1;
    featureRequirementOverrides = v2->_featureRequirementOverrides;
    v2->_featureRequirementOverrides = 0;

    v2->_shouldRegisterPeriodicActivities = 1;
    v2->_shouldOverrideSiriUOD = 0;
  }
  return v2;
}

- (_HKFeatureFlags)features
{
  os_unfair_lock_s *p_loadLock;
  _HKFeatureFlags *v4;
  _HKFeatureFlags *value;
  _HKFeatureFlags *v6;
  _QWORD *v7;
  uint64_t v8;
  _QWORD v10[3];
  _QWORD *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v10[0] = &unk_1E37F7178;
  v10[1] = &__block_literal_global_127;
  v11 = v10;
  p_loadLock = &self->_featureFlags._loadLock;
  os_unfair_lock_lock(&self->_featureFlags._loadLock);
  if (!self->_featureFlags._hasLoaded)
  {
    if (!v11)
      std::__throw_bad_function_call[abi:ne180100]();
    (*(void (**)(_QWORD *))(*v11 + 48))(v11);
    v4 = (_HKFeatureFlags *)objc_claimAutoreleasedReturnValue();
    value = self->_featureFlags._value;
    self->_featureFlags._value = v4;

    self->_featureFlags._hasLoaded = 1;
  }
  v6 = self->_featureFlags._value;
  os_unfair_lock_unlock(p_loadLock);
  v7 = v11;
  if (v11 == v10)
  {
    v8 = 4;
    v7 = v10;
    goto LABEL_8;
  }
  if (v11)
  {
    v8 = 5;
LABEL_8:
    (*(void (**)(void))(*v7 + 8 * v8))();
  }
  return v6;
}

+ (BOOL)hasTelephonyCapability
{
  void *v2;
  char v3;

  objc_msgSend(a1, "sharedBehavior");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasTelephonyCapability");

  return v3;
}

+ (BOOL)isDeviceSupported
{
  void *v2;
  char v3;

  objc_msgSend(a1, "sharedBehavior");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isDeviceSupported");

  return v3;
}

+ (BOOL)isRunningStoreDemoMode
{
  void *v2;
  char v3;

  objc_msgSend(a1, "sharedBehavior");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isRunningStoreDemoMode");

  return v3;
}

+ (BOOL)isiPod
{
  void *v2;
  void *v3;
  char v4;

  objc_msgSend(a1, "sharedBehavior");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentDeviceName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("iPod touch"));

  return v4;
}

- (BOOL)isiPad
{
  os_unfair_lock_s *p_loadLock;
  char value;
  _QWORD *v5;
  uint64_t v6;
  _HKBehavior *v8;
  _QWORD v9[3];
  _QWORD *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v8 = self;
  v9[0] = &off_1E37F7208;
  v9[1] = &v8;
  v10 = v9;
  p_loadLock = &self->_isiPad._loadLock;
  os_unfair_lock_lock(&self->_isiPad._loadLock);
  if (self->_isiPad._hasLoaded)
  {
    value = self->_isiPad._value;
  }
  else
  {
    if (!v10)
      std::__throw_bad_function_call[abi:ne180100]();
    value = (*(uint64_t (**)(_QWORD *))(*v10 + 48))(v10);
    self->_isiPad._value = value;
    self->_isiPad._hasLoaded = 1;
  }
  os_unfair_lock_unlock(p_loadLock);
  v5 = v10;
  if (v10 == v9)
  {
    v6 = 4;
    v5 = v9;
    goto LABEL_9;
  }
  if (v10)
  {
    v6 = 5;
LABEL_9:
    (*(void (**)(void))(*v5 + 8 * v6))();
  }
  return value;
}

- (void)setIsiPad:(BOOL)a3
{
  os_unfair_lock_s *p_loadLock;

  p_loadLock = &self->_isiPad._loadLock;
  os_unfair_lock_lock(&self->_isiPad._loadLock);
  self->_isiPad._hasLoaded = 1;
  self->_isiPad._value = a3;
  os_unfair_lock_unlock(p_loadLock);
}

+ (BOOL)_isiPad
{
  void *v2;
  char v3;

  v2 = (void *)MGCopyAnswer();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("iPad"));

  return v3;
}

+ (BOOL)runningInStoreDemoModeF201
{
  void *v2;
  char v3;

  objc_msgSend(a1, "sharedBehavior");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "runningInStoreDemoModeF201");

  return v3;
}

+ (BOOL)isTestingDevice
{
  void *v2;
  char v3;

  objc_msgSend(a1, "sharedBehavior");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isTestingDevice");

  return v3;
}

+ (void)setForceBuddy:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBool:forKey:", v3, CFSTR("ForceBuddy"));

}

+ (id)currentDeviceName
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "sharedBehavior");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentDeviceName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)currentDeviceManufacturer
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "sharedBehavior");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentDeviceManufacturer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)currentDeviceHWModelString
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "sharedBehavior");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentDeviceHWModelString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)currentDeviceRegionCode
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "sharedBehavior");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentDeviceRegionCode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)currentDeviceRegionInfo
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "sharedBehavior");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentDeviceRegionInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)currentDeviceClass
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "sharedBehavior");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentDeviceClass");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)currentDeviceReleaseType
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "sharedBehavior");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentDeviceReleaseType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)currentOSName
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "sharedBehavior");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentOSName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)currentOSBuild
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "sharedBehavior");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentOSBuild");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)currentOSVersion
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "sharedBehavior");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentOSVersion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ ($9FE6E10C8CE45DBC9A88DFDEA39A390D)currentOSVersionStruct
{
  void *v4;
  $9FE6E10C8CE45DBC9A88DFDEA39A390D *result;
  id v6;

  objc_msgSend(a2, "sharedBehavior");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4;
  if (v4)
  {
    objc_msgSend(v4, "currentOSVersionStruct");
  }
  else
  {
    retstr->var0 = 0;
    retstr->var1 = 0;
    retstr->var2 = 0;
  }

  return result;
}

+ (BOOL)_tinkerModeEnabled
{
  return 0;
}

+ (BOOL)_healthAppHidden
{
  void *v2;
  int v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  char v8;
  char v9;
  char v10;
  void *v11;

  +[_HKBehavior sharedBehavior](_HKBehavior, "sharedBehavior");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isAppleWatch");

  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "restrictedAppBundleIDs");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "containsObject:", CFSTR("com.apple.Health"));
    objc_msgSend(v4, "parentalControlsBlockedAppBundleIDs");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "containsObject:", CFSTR("com.apple.Health"));
    if (objc_msgSend(v4, "effectiveBoolValueForSetting:", *MEMORY[0x1E0D47068]) == 2)
      v9 = 1;
    else
      v9 = v6;
    v10 = v9 | v8;

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CA5860], "applicationProxyForIdentifier:placeholder:", CFSTR("com.apple.Health"), 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v11;
    if (!v11)
    {
      v10 = 0;
      goto LABEL_9;
    }
    objc_msgSend(v11, "appState");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v5, "isRestricted");
  }

LABEL_9:
  return v10;
}

+ (BOOL)_healthAppNotInstalled
{
  void *v2;
  char v3;
  BOOL v4;
  void *v5;
  id v6;
  void *v7;
  NSObject *v8;
  id v9;
  void *v10;
  id v12;
  uint8_t buf[24];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "sharedBehavior");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isAppleWatch");

  if ((v3 & 1) != 0)
    return 0;
  v12 = 0;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA5870]), "initWithBundleIdentifier:allowPlaceholder:error:", CFSTR("com.apple.Health"), 1, &v12);
  v6 = v12;
  v7 = v6;
  if (v6 && (objc_msgSend(v6, "hk_isErrorInDomain:code:", *MEMORY[0x1E0CB2F90], -10814) & 1) == 0)
  {
    _HKInitializeLogging();
    HKLogInfrastructure();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = (id)objc_opt_class();
      objc_msgSend(v7, "localizedDescription");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      +[_HKBehavior _healthAppNotInstalled].cold.1(v9, v10, buf, v8);
    }

    v4 = 0;
  }
  else
  {
    v4 = v5 == 0;
  }

  return v4;
}

+ (BOOL)_healthAppSupportedOnDevice
{
  return 1;
}

+ (BOOL)_isStandalonePhoneFitnessMode
{
  return (objc_msgSend((id)objc_opt_class(), "_isiPad") & 1) == 0
      && CFPreferencesGetAppBooleanValue(CFSTR("IsStandalonePhoneFitnessMode"), CFSTR("com.apple.nanolifestyle"), 0) != 0;
}

+ (unint64_t)_fitnessMode
{
  unint64_t result;
  Boolean keyExistsAndHasValidFormat;

  if ((objc_msgSend((id)objc_opt_class(), "_isiPad") & 1) != 0)
    return 1;
  keyExistsAndHasValidFormat = 0;
  result = CFPreferencesGetAppIntegerValue(CFSTR("FitnessMode"), CFSTR("com.apple.nanolifestyle"), &keyExistsAndHasValidFormat);
  if (!keyExistsAndHasValidFormat)
    return 1;
  return result;
}

- (BOOL)tinkerModeEnabled
{
  if (self->_tinkerModeEnabled)
    return 1;
  else
    return objc_msgSend((id)objc_opt_class(), "_tinkerModeEnabled");
}

- (BOOL)healthAppHidden
{
  if (self->_healthAppHidden)
    return 1;
  else
    return objc_msgSend((id)objc_opt_class(), "_healthAppHidden");
}

- (BOOL)healthAppNotInstalled
{
  if (self->_healthAppNotInstalled)
    return 1;
  else
    return objc_msgSend((id)objc_opt_class(), "_healthAppNotInstalled");
}

- (BOOL)healthAppHiddenOrNotInstalled
{
  return -[_HKBehavior healthAppHidden](self, "healthAppHidden")
      || -[_HKBehavior healthAppNotInstalled](self, "healthAppNotInstalled");
}

- (BOOL)healthAppSupportedOnDevice
{
  if (self->_healthAppSupportedOnDevice)
    return 1;
  else
    return objc_msgSend((id)objc_opt_class(), "_healthAppSupportedOnDevice");
}

- (BOOL)isStandalonePhoneFitnessMode
{
  if (self->_isStandalonePhoneFitnessMode)
    return 1;
  else
    return objc_msgSend((id)objc_opt_class(), "_isStandalonePhoneFitnessMode");
}

- (unint64_t)fitnessMode
{
  if (self->_overriddenFitnessMode)
    return -[NSNumber unsignedIntegerValue](self->_overriddenFitnessMode, "unsignedIntegerValue");
  else
    return objc_msgSend((id)objc_opt_class(), "_fitnessMode");
}

- (void)setFitnessMode:(unint64_t)a3
{
  NSNumber *v4;
  NSNumber *overriddenFitnessMode;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v4 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  overriddenFitnessMode = self->_overriddenFitnessMode;
  self->_overriddenFitnessMode = v4;

}

- (BOOL)supportsWorkoutRouteSmoothing
{
  if (self->_overriddenSupportsWorkoutSmoothing)
    return -[NSNumber BOOLValue](self->_overriddenSupportsWorkoutSmoothing, "BOOLValue");
  if (-[_HKBehavior isAppleWatch](self, "isAppleWatch"))
    return _os_feature_enabled_impl();
  return 1;
}

- (void)setSupportsWorkoutRouteSmoothingOverride:(BOOL)a3
{
  NSNumber *v4;
  NSNumber *overriddenSupportsWorkoutSmoothing;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  overriddenSupportsWorkoutSmoothing = self->_overriddenSupportsWorkoutSmoothing;
  self->_overriddenSupportsWorkoutSmoothing = v4;

}

- (BOOL)supportsCachedStatisticsCollectionQueries
{
  NSNumber *overriddenSupportsCachedStatisticsCollectionQueries;

  overriddenSupportsCachedStatisticsCollectionQueries = self->_overriddenSupportsCachedStatisticsCollectionQueries;
  if (overriddenSupportsCachedStatisticsCollectionQueries)
    return -[NSNumber BOOLValue](overriddenSupportsCachedStatisticsCollectionQueries, "BOOLValue");
  else
    return _os_feature_enabled_impl();
}

- (void)setSupportsCachedStatisticsCollectionQueries:(BOOL)a3
{
  NSNumber *v4;
  NSNumber *overriddenSupportsCachedStatisticsCollectionQueries;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  overriddenSupportsCachedStatisticsCollectionQueries = self->_overriddenSupportsCachedStatisticsCollectionQueries;
  self->_overriddenSupportsCachedStatisticsCollectionQueries = v4;

}

- (BOOL)supportsCachedSleepDaySummaryQueries
{
  NSNumber *overriddenSupportsCachedSleepDaySummaryQueries;

  overriddenSupportsCachedSleepDaySummaryQueries = self->_overriddenSupportsCachedSleepDaySummaryQueries;
  if (overriddenSupportsCachedSleepDaySummaryQueries)
    return -[NSNumber BOOLValue](overriddenSupportsCachedSleepDaySummaryQueries, "BOOLValue");
  else
    return _os_feature_enabled_impl();
}

- (void)setSupportsCachedSleepDaySummaryQueries:(BOOL)a3
{
  NSNumber *v4;
  NSNumber *overriddenSupportsCachedSleepDaySummaryQueries;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  overriddenSupportsCachedSleepDaySummaryQueries = self->_overriddenSupportsCachedSleepDaySummaryQueries;
  self->_overriddenSupportsCachedSleepDaySummaryQueries = v4;

}

- (BOOL)supportsActiveQueryDaemonTransactions
{
  NSNumber *overriddenSupportsActiveQueryDaemonTransactions;

  overriddenSupportsActiveQueryDaemonTransactions = self->_overriddenSupportsActiveQueryDaemonTransactions;
  if (overriddenSupportsActiveQueryDaemonTransactions)
    return -[NSNumber BOOLValue](overriddenSupportsActiveQueryDaemonTransactions, "BOOLValue");
  else
    return _os_feature_enabled_impl();
}

- (void)setSupportsActiveQueryDaemonTransactions:(BOOL)a3
{
  NSNumber *v4;
  NSNumber *overriddenSupportsActiveQueryDaemonTransactions;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  overriddenSupportsActiveQueryDaemonTransactions = self->_overriddenSupportsActiveQueryDaemonTransactions;
  self->_overriddenSupportsActiveQueryDaemonTransactions = v4;

}

- (BOOL)supportsSecondaryProfiles
{
  return !-[_HKBehavior isAppleWatch](self, "isAppleWatch");
}

- (BOOL)isTestingDevice
{
  return CFPreferencesGetAppBooleanValue(CFSTR("device-used-for-testing"), CFSTR("com.apple.dt.Xcode"), 0) != 0;
}

- (BOOL)isRunningStoreDemoMode
{
  int AppBooleanValue;
  BOOL v1;
  Boolean keyExistsAndHasValidFormat;

  keyExistsAndHasValidFormat = 0;
  AppBooleanValue = CFPreferencesGetAppBooleanValue(CFSTR("StoreDemoMode"), CFSTR("com.apple.demo-settings"), &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat)
    v1 = AppBooleanValue == 0;
  else
    v1 = 1;
  return !v1;
}

- (void)setIsRunningStoreDemoMode:(BOOL)a3
{
  os_unfair_lock_s *p_loadLock;

  p_loadLock = &self->_isRunningStoreDemoMode._loadLock;
  os_unfair_lock_lock(&self->_isRunningStoreDemoMode._loadLock);
  self->_isRunningStoreDemoMode._hasLoaded = 1;
  self->_isRunningStoreDemoMode._value = a3;
  os_unfair_lock_unlock(p_loadLock);
}

- (BOOL)runningInStoreDemoModeF201
{
  return ___ZZ41___HKBehavior_runningInStoreDemoModeF201_ENK3__2clEv_block_invoke() == 201;
}

- (void)setRunningInStoreDemoModeF201:(BOOL)a3
{
  os_unfair_lock_s *p_loadLock;

  p_loadLock = &self->_runningInStoreDemoModeF201._loadLock;
  os_unfair_lock_lock(&self->_runningInStoreDemoModeF201._loadLock);
  self->_runningInStoreDemoModeF201._hasLoaded = 1;
  self->_runningInStoreDemoModeF201._value = a3;
  os_unfair_lock_unlock(p_loadLock);
}

- (BOOL)shouldReceiveECGSamples
{
  char value;
  _QWORD *v4;
  uint64_t v5;
  _QWORD v7[5];
  _QWORD v8[3];
  _QWORD *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __38___HKBehavior_shouldReceiveECGSamples__block_invoke;
  v7[3] = &unk_1E37F7088;
  v7[4] = self;
  v8[0] = &unk_1E37F61A0;
  v8[1] = _Block_copy(v7);
  v9 = v8;
  os_unfair_lock_lock(&self->_shouldReceiveECGSamples._loadLock);
  if (self->_shouldReceiveECGSamples._hasLoaded)
  {
    value = self->_shouldReceiveECGSamples._value;
  }
  else
  {
    if (!v9)
      std::__throw_bad_function_call[abi:ne180100]();
    value = (*(uint64_t (**)(_QWORD *))(*v9 + 48))(v9);
    self->_shouldReceiveECGSamples._value = value;
    self->_shouldReceiveECGSamples._hasLoaded = 1;
  }
  os_unfair_lock_unlock(&self->_shouldReceiveECGSamples._loadLock);
  v4 = v9;
  if (v9 == v8)
  {
    v5 = 4;
    v4 = v8;
    goto LABEL_9;
  }
  if (v9)
  {
    v5 = 5;
LABEL_9:
    (*(void (**)(void))(*v4 + 8 * v5))();
  }
  return value;
}

- (void)setShouldReceiveECGSamples:(BOOL)a3
{
  os_unfair_lock_s *p_loadLock;

  p_loadLock = &self->_shouldReceiveECGSamples._loadLock;
  os_unfair_lock_lock(&self->_shouldReceiveECGSamples._loadLock);
  self->_shouldReceiveECGSamples._hasLoaded = 1;
  self->_shouldReceiveECGSamples._value = a3;
  os_unfair_lock_unlock(p_loadLock);
}

- (void)setCurrentDeviceDisplayName:(id)a3
{
  objc_storeStrong((id *)&self->_overriddenCurrentDeviceDisplayName, a3);
}

- (NSString)currentDeviceRegionCode
{
  NSString *unitTest_deviceRegionCode;

  unitTest_deviceRegionCode = self->_unitTest_deviceRegionCode;
  if (unitTest_deviceRegionCode)
    return unitTest_deviceRegionCode;
  else
    return (NSString *)(id)MGCopyAnswer();
}

- (NSString)currentDeviceRegionInfo
{
  return (NSString *)(id)MGCopyAnswer();
}

- (NSString)currentDeviceManufacturer
{
  return (NSString *)CFSTR("Apple Inc.");
}

- (NSString)currentDeviceHWModelString
{
  return (NSString *)(id)MGCopyAnswer();
}

- (NSString)currentInternalDeviceModel
{
  void *v3;

  if (-[_HKBehavior isAppleInternalInstall](self, "isAppleInternalInstall"))
  {
    -[_HKBehavior currentDeviceHWModelString](self, "currentDeviceHWModelString");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (NSString *)v3;
}

- (id)currentDeviceReleaseType
{
  return (id)MGCopyAnswer();
}

- (BOOL)_hasProductTypePrefix:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[_HKBehavior currentDeviceProductType](self, "currentDeviceProductType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hasPrefix:", v4);

  return v6;
}

- (BOOL)isRealityDevice
{
  os_unfair_lock_s *p_loadLock;
  char value;
  _QWORD *v5;
  uint64_t v6;
  _QWORD v8[3];
  _QWORD *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v8[0] = &unk_1E37F61A0;
  v8[1] = &__block_literal_global_145;
  v9 = v8;
  p_loadLock = &self->_isRealityDevice._loadLock;
  os_unfair_lock_lock(&self->_isRealityDevice._loadLock);
  if (self->_isRealityDevice._hasLoaded)
  {
    value = self->_isRealityDevice._value;
  }
  else
  {
    if (!v9)
      std::__throw_bad_function_call[abi:ne180100]();
    value = (*(uint64_t (**)(_QWORD *))(*v9 + 48))(v9);
    self->_isRealityDevice._value = value;
    self->_isRealityDevice._hasLoaded = 1;
  }
  os_unfair_lock_unlock(p_loadLock);
  v5 = v9;
  if (v9 == v8)
  {
    v6 = 4;
    v5 = v8;
    goto LABEL_9;
  }
  if (v9)
  {
    v6 = 5;
LABEL_9:
    (*(void (**)(void))(*v5 + 8 * v6))();
  }
  return value;
}

- (void)setIsRealityDevice:(BOOL)a3
{
  os_unfair_lock_s *p_loadLock;

  p_loadLock = &self->_isRealityDevice._loadLock;
  os_unfair_lock_lock(&self->_isRealityDevice._loadLock);
  self->_isRealityDevice._hasLoaded = 1;
  self->_isRealityDevice._value = a3;
  os_unfair_lock_unlock(p_loadLock);
}

- (BOOL)supportsSharedSummarySync
{
  char value;
  _QWORD *v4;
  uint64_t v5;
  _QWORD v7[5];
  _QWORD v8[3];
  _QWORD *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __40___HKBehavior_supportsSharedSummarySync__block_invoke;
  v7[3] = &unk_1E37F7088;
  v7[4] = self;
  v8[0] = &unk_1E37F61A0;
  v8[1] = _Block_copy(v7);
  v9 = v8;
  os_unfair_lock_lock(&self->_supportsSharedSummarySync._loadLock);
  if (self->_supportsSharedSummarySync._hasLoaded)
  {
    value = self->_supportsSharedSummarySync._value;
  }
  else
  {
    if (!v9)
      std::__throw_bad_function_call[abi:ne180100]();
    value = (*(uint64_t (**)(_QWORD *))(*v9 + 48))(v9);
    self->_supportsSharedSummarySync._value = value;
    self->_supportsSharedSummarySync._hasLoaded = 1;
  }
  os_unfair_lock_unlock(&self->_supportsSharedSummarySync._loadLock);
  v4 = v9;
  if (v9 == v8)
  {
    v5 = 4;
    v4 = v8;
    goto LABEL_9;
  }
  if (v9)
  {
    v5 = 5;
LABEL_9:
    (*(void (**)(void))(*v4 + 8 * v5))();
  }
  return value;
}

- (void)setSupportsSharedSummarySync:(BOOL)a3
{
  os_unfair_lock_s *p_loadLock;

  p_loadLock = &self->_supportsSharedSummarySync._loadLock;
  os_unfair_lock_lock(&self->_supportsSharedSummarySync._loadLock);
  self->_supportsSharedSummarySync._hasLoaded = 1;
  self->_supportsSharedSummarySync._value = a3;
  os_unfair_lock_unlock(p_loadLock);
}

- (BOOL)canPerformOwnershipTakeover
{
  char value;
  _QWORD *v4;
  uint64_t v5;
  _QWORD v7[5];
  _QWORD v8[3];
  _QWORD *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __42___HKBehavior_canPerformOwnershipTakeover__block_invoke;
  v7[3] = &unk_1E37F7088;
  v7[4] = self;
  v8[0] = &unk_1E37F61A0;
  v8[1] = _Block_copy(v7);
  v9 = v8;
  os_unfair_lock_lock(&self->_canPerformOwnershipTakeover._loadLock);
  if (self->_canPerformOwnershipTakeover._hasLoaded)
  {
    value = self->_canPerformOwnershipTakeover._value;
  }
  else
  {
    if (!v9)
      std::__throw_bad_function_call[abi:ne180100]();
    value = (*(uint64_t (**)(_QWORD *))(*v9 + 48))(v9);
    self->_canPerformOwnershipTakeover._value = value;
    self->_canPerformOwnershipTakeover._hasLoaded = 1;
  }
  os_unfair_lock_unlock(&self->_canPerformOwnershipTakeover._loadLock);
  v4 = v9;
  if (v9 == v8)
  {
    v5 = 4;
    v4 = v8;
    goto LABEL_9;
  }
  if (v9)
  {
    v5 = 5;
LABEL_9:
    (*(void (**)(void))(*v4 + 8 * v5))();
  }
  return value;
}

- (void)setCanPerformOwnershipTakeover:(BOOL)a3
{
  os_unfair_lock_s *p_loadLock;

  p_loadLock = &self->_canPerformOwnershipTakeover._loadLock;
  os_unfair_lock_lock(&self->_canPerformOwnershipTakeover._loadLock);
  self->_canPerformOwnershipTakeover._hasLoaded = 1;
  self->_canPerformOwnershipTakeover._value = a3;
  os_unfair_lock_unlock(p_loadLock);
}

- (NSString)currentDeviceClass
{
  NSString *currentDeviceClass;

  currentDeviceClass = self->_currentDeviceClass;
  if (currentDeviceClass)
    return currentDeviceClass;
  else
    return (NSString *)(id)MGCopyAnswer();
}

+ (id)_currentOSBuild
{
  return (id)MGCopyAnswer();
}

- (NSString)currentOSName
{
  return (NSString *)(id)MGCopyAnswer();
}

+ (id)_currentDeviceName
{
  return (id)MGCopyAnswer();
}

+ (id)_currentOSVersion
{
  return (id)MGCopyAnswer();
}

+ ($9FE6E10C8CE45DBC9A88DFDEA39A390D)_currentOSVersionStruct
{
  void *v4;
  $9FE6E10C8CE45DBC9A88DFDEA39A390D *result;
  id v6;

  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4;
  if (v4)
  {
    objc_msgSend(v4, "operatingSystemVersion");
  }
  else
  {
    retstr->var0 = 0;
    retstr->var1 = 0;
    retstr->var2 = 0;
  }

  return result;
}

- (NSDictionary)currentDiskUsage
{
  return (NSDictionary *)(id)MGCopyAnswer();
}

- (unint64_t)totalDiskCapacity
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[_HKBehavior currentDiskUsage](self, "currentDiskUsage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x1E0DE2CC0]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "unsignedLongLongValue");

  return v4;
}

- (unint64_t)currentDiskSpaceAvailable
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[_HKBehavior currentDiskUsage](self, "currentDiskUsage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x1E0DE2CA0]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "unsignedLongLongValue");

  return v4;
}

- (BOOL)supportsSwimmingWorkoutSessions
{
  NSNumber *overriddenSupportsSwimmingWorkoutSessions;

  overriddenSupportsSwimmingWorkoutSessions = self->_overriddenSupportsSwimmingWorkoutSessions;
  if (overriddenSupportsSwimmingWorkoutSessions)
    return -[NSNumber BOOLValue](overriddenSupportsSwimmingWorkoutSessions, "BOOLValue");
  else
    return HKCoreMotionSupportsSwimmingWorkoutSessions();
}

- (void)setSupportsSwimmingWorkoutSessions:(BOOL)a3
{
  NSNumber *v4;
  NSNumber *overriddenSupportsSwimmingWorkoutSessions;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  overriddenSupportsSwimmingWorkoutSessions = self->_overriddenSupportsSwimmingWorkoutSessions;
  self->_overriddenSupportsSwimmingWorkoutSessions = v4;

}

- (BOOL)supportsEED
{
  return CLShouldDisplayEEDUI() != 0;
}

- (void)setFutureMigrationsEnabled:(BOOL)a3
{
  os_unfair_lock_s *p_loadLock;

  p_loadLock = &self->_futureMigrationsEnabled._loadLock;
  os_unfair_lock_lock(&self->_futureMigrationsEnabled._loadLock);
  self->_futureMigrationsEnabled._hasLoaded = 1;
  self->_futureMigrationsEnabled._value = a3;
  os_unfair_lock_unlock(p_loadLock);
}

- (BOOL)supportsOntologyDatabaseFutureMigrations
{
  os_unfair_lock_s *p_loadLock;
  char value;
  _QWORD *v5;
  uint64_t v6;
  _HKBehavior *v8;
  _QWORD v9[3];
  _QWORD *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v8 = self;
  v9[0] = &off_1E37F7408;
  v9[1] = &v8;
  v10 = v9;
  p_loadLock = &self->_ontologyDatabaseFutureMigrationsEnabled._loadLock;
  os_unfair_lock_lock(&self->_ontologyDatabaseFutureMigrationsEnabled._loadLock);
  if (self->_ontologyDatabaseFutureMigrationsEnabled._hasLoaded)
  {
    value = self->_ontologyDatabaseFutureMigrationsEnabled._value;
  }
  else
  {
    if (!v10)
      std::__throw_bad_function_call[abi:ne180100]();
    value = (*(uint64_t (**)(_QWORD *))(*v10 + 48))(v10);
    self->_ontologyDatabaseFutureMigrationsEnabled._value = value;
    self->_ontologyDatabaseFutureMigrationsEnabled._hasLoaded = 1;
  }
  os_unfair_lock_unlock(p_loadLock);
  v5 = v10;
  if (v10 == v9)
  {
    v6 = 4;
    v5 = v9;
    goto LABEL_9;
  }
  if (v10)
  {
    v6 = 5;
LABEL_9:
    (*(void (**)(void))(*v5 + 8 * v6))();
  }
  return value;
}

- (void)setSupportsOntologyDatabaseFutureMigrations:(BOOL)a3
{
  os_unfair_lock_s *p_loadLock;

  p_loadLock = &self->_ontologyDatabaseFutureMigrationsEnabled._loadLock;
  os_unfair_lock_lock(&self->_ontologyDatabaseFutureMigrationsEnabled._loadLock);
  self->_ontologyDatabaseFutureMigrationsEnabled._hasLoaded = 1;
  self->_ontologyDatabaseFutureMigrationsEnabled._value = a3;
  os_unfair_lock_unlock(p_loadLock);
}

- (BOOL)performsAutomaticUserDomainConceptProcessing
{
  os_unfair_lock_s *p_loadLock;
  char value;
  _QWORD *v5;
  uint64_t v6;
  _HKBehavior *v8;
  _QWORD v9[3];
  _QWORD *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v8 = self;
  v9[0] = &off_1E37F7488;
  v9[1] = &v8;
  v10 = v9;
  p_loadLock = &self->_performsAutomaticUserDomainConceptProcessing._loadLock;
  os_unfair_lock_lock(&self->_performsAutomaticUserDomainConceptProcessing._loadLock);
  if (self->_performsAutomaticUserDomainConceptProcessing._hasLoaded)
  {
    value = self->_performsAutomaticUserDomainConceptProcessing._value;
  }
  else
  {
    if (!v10)
      std::__throw_bad_function_call[abi:ne180100]();
    value = (*(uint64_t (**)(_QWORD *))(*v10 + 48))(v10);
    self->_performsAutomaticUserDomainConceptProcessing._value = value;
    self->_performsAutomaticUserDomainConceptProcessing._hasLoaded = 1;
  }
  os_unfair_lock_unlock(p_loadLock);
  v5 = v10;
  if (v10 == v9)
  {
    v6 = 4;
    v5 = v9;
    goto LABEL_9;
  }
  if (v10)
  {
    v6 = 5;
LABEL_9:
    (*(void (**)(void))(*v5 + 8 * v6))();
  }
  return value;
}

- (void)setPerformsAutomaticUserDomainConceptProcessing:(BOOL)a3
{
  os_unfair_lock_s *p_loadLock;

  p_loadLock = &self->_performsAutomaticUserDomainConceptProcessing._loadLock;
  os_unfair_lock_lock(&self->_performsAutomaticUserDomainConceptProcessing._loadLock);
  self->_performsAutomaticUserDomainConceptProcessing._hasLoaded = 1;
  self->_performsAutomaticUserDomainConceptProcessing._value = a3;
  os_unfair_lock_unlock(p_loadLock);
}

- (void)setSupportsCloudSync:(BOOL)a3
{
  os_unfair_lock_s *p_loadLock;

  p_loadLock = &self->_supportsCloudSync._loadLock;
  os_unfair_lock_lock(&self->_supportsCloudSync._loadLock);
  self->_supportsCloudSync._hasLoaded = 1;
  self->_supportsCloudSync._value = a3;
  os_unfair_lock_unlock(p_loadLock);
}

- (BOOL)supportsCloudSync
{
  os_unfair_lock_s *p_loadLock;
  char value;
  _QWORD *v5;
  uint64_t v6;
  _QWORD v8[3];
  _QWORD *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v8[0] = &unk_1E37F61A0;
  v8[1] = &__block_literal_global_158;
  v9 = v8;
  p_loadLock = &self->_supportsCloudSync._loadLock;
  os_unfair_lock_lock(&self->_supportsCloudSync._loadLock);
  if (self->_supportsCloudSync._hasLoaded)
  {
    value = self->_supportsCloudSync._value;
  }
  else
  {
    if (!v9)
      std::__throw_bad_function_call[abi:ne180100]();
    value = (*(uint64_t (**)(_QWORD *))(*v9 + 48))(v9);
    self->_supportsCloudSync._value = value;
    self->_supportsCloudSync._hasLoaded = 1;
  }
  os_unfair_lock_unlock(p_loadLock);
  v5 = v9;
  if (v9 == v8)
  {
    v6 = 4;
    v5 = v8;
    goto LABEL_9;
  }
  if (v9)
  {
    v6 = 5;
LABEL_9:
    (*(void (**)(void))(*v5 + 8 * v6))();
  }
  return value;
}

- (void)resetSupportsCloudSync
{
  os_unfair_lock_s *p_loadLock;

  p_loadLock = &self->_supportsCloudSync._loadLock;
  os_unfair_lock_lock(&self->_supportsCloudSync._loadLock);
  self->_supportsCloudSync._hasLoaded = 0;
  os_unfair_lock_unlock(p_loadLock);
}

- (BOOL)supportsCloudSyncSharding
{
  char value;
  _QWORD *v4;
  uint64_t v5;
  _QWORD v7[5];
  _QWORD v8[3];
  _QWORD *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __40___HKBehavior_supportsCloudSyncSharding__block_invoke;
  v7[3] = &unk_1E37F7088;
  v7[4] = self;
  v8[0] = &unk_1E37F61A0;
  v8[1] = _Block_copy(v7);
  v9 = v8;
  os_unfair_lock_lock(&self->_supportsCloudSyncSharding._loadLock);
  if (self->_supportsCloudSyncSharding._hasLoaded)
  {
    value = self->_supportsCloudSyncSharding._value;
  }
  else
  {
    if (!v9)
      std::__throw_bad_function_call[abi:ne180100]();
    value = (*(uint64_t (**)(_QWORD *))(*v9 + 48))(v9);
    self->_supportsCloudSyncSharding._value = value;
    self->_supportsCloudSyncSharding._hasLoaded = 1;
  }
  os_unfair_lock_unlock(&self->_supportsCloudSyncSharding._loadLock);
  v4 = v9;
  if (v9 == v8)
  {
    v5 = 4;
    v4 = v8;
    goto LABEL_9;
  }
  if (v9)
  {
    v5 = 5;
LABEL_9:
    (*(void (**)(void))(*v4 + 8 * v5))();
  }
  return value;
}

- (void)setSupportsCloudSyncSharding:(BOOL)a3
{
  os_unfair_lock_s *p_loadLock;

  p_loadLock = &self->_supportsCloudSyncSharding._loadLock;
  os_unfair_lock_lock(&self->_supportsCloudSyncSharding._loadLock);
  self->_supportsCloudSyncSharding._hasLoaded = 1;
  self->_supportsCloudSyncSharding._value = a3;
  os_unfair_lock_unlock(p_loadLock);
}

- (BOOL)supportsCloudSyncStagingShard
{
  char value;
  _QWORD *v4;
  uint64_t v5;
  _QWORD v7[5];
  _QWORD v8[3];
  _QWORD *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __44___HKBehavior_supportsCloudSyncStagingShard__block_invoke;
  v7[3] = &unk_1E37F7088;
  v7[4] = self;
  v8[0] = &unk_1E37F61A0;
  v8[1] = _Block_copy(v7);
  v9 = v8;
  os_unfair_lock_lock(&self->_supportsCloudSyncStagingShard._loadLock);
  if (self->_supportsCloudSyncStagingShard._hasLoaded)
  {
    value = self->_supportsCloudSyncStagingShard._value;
  }
  else
  {
    if (!v9)
      std::__throw_bad_function_call[abi:ne180100]();
    value = (*(uint64_t (**)(_QWORD *))(*v9 + 48))(v9);
    self->_supportsCloudSyncStagingShard._value = value;
    self->_supportsCloudSyncStagingShard._hasLoaded = 1;
  }
  os_unfair_lock_unlock(&self->_supportsCloudSyncStagingShard._loadLock);
  v4 = v9;
  if (v9 == v8)
  {
    v5 = 4;
    v4 = v8;
    goto LABEL_9;
  }
  if (v9)
  {
    v5 = 5;
LABEL_9:
    (*(void (**)(void))(*v4 + 8 * v5))();
  }
  return value;
}

- (void)setSupportsCloudSyncStagingShard:(BOOL)a3
{
  os_unfair_lock_s *p_loadLock;

  p_loadLock = &self->_supportsCloudSyncStagingShard._loadLock;
  os_unfair_lock_lock(&self->_supportsCloudSyncStagingShard._loadLock);
  self->_supportsCloudSyncStagingShard._hasLoaded = 1;
  self->_supportsCloudSyncStagingShard._value = a3;
  os_unfair_lock_unlock(p_loadLock);
}

- (BOOL)supportsPeriodicFullCloudSync
{
  char value;
  _QWORD *v4;
  uint64_t v5;
  _QWORD v7[5];
  _QWORD v8[3];
  _QWORD *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __44___HKBehavior_supportsPeriodicFullCloudSync__block_invoke;
  v7[3] = &unk_1E37F7088;
  v7[4] = self;
  v8[0] = &unk_1E37F61A0;
  v8[1] = _Block_copy(v7);
  v9 = v8;
  os_unfair_lock_lock(&self->_supportsPeriodicFullCloudSync._loadLock);
  if (self->_supportsPeriodicFullCloudSync._hasLoaded)
  {
    value = self->_supportsPeriodicFullCloudSync._value;
  }
  else
  {
    if (!v9)
      std::__throw_bad_function_call[abi:ne180100]();
    value = (*(uint64_t (**)(_QWORD *))(*v9 + 48))(v9);
    self->_supportsPeriodicFullCloudSync._value = value;
    self->_supportsPeriodicFullCloudSync._hasLoaded = 1;
  }
  os_unfair_lock_unlock(&self->_supportsPeriodicFullCloudSync._loadLock);
  v4 = v9;
  if (v9 == v8)
  {
    v5 = 4;
    v4 = v8;
    goto LABEL_9;
  }
  if (v9)
  {
    v5 = 5;
LABEL_9:
    (*(void (**)(void))(*v4 + 8 * v5))();
  }
  return value;
}

- (void)setSupportsPeriodicFullCloudSync:(BOOL)a3
{
  os_unfair_lock_s *p_loadLock;

  p_loadLock = &self->_supportsPeriodicFullCloudSync._loadLock;
  os_unfair_lock_lock(&self->_supportsPeriodicFullCloudSync._loadLock);
  self->_supportsPeriodicFullCloudSync._hasLoaded = 1;
  self->_supportsPeriodicFullCloudSync._value = a3;
  os_unfair_lock_unlock(p_loadLock);
}

- (BOOL)supportsPeriodicLiteCloudSync
{
  char value;
  _QWORD *v4;
  uint64_t v5;
  _QWORD v7[5];
  _QWORD v8[3];
  _QWORD *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __44___HKBehavior_supportsPeriodicLiteCloudSync__block_invoke;
  v7[3] = &unk_1E37F7088;
  v7[4] = self;
  v8[0] = &unk_1E37F61A0;
  v8[1] = _Block_copy(v7);
  v9 = v8;
  os_unfair_lock_lock(&self->_supportsPeriodicLiteCloudSync._loadLock);
  if (self->_supportsPeriodicLiteCloudSync._hasLoaded)
  {
    value = self->_supportsPeriodicLiteCloudSync._value;
  }
  else
  {
    if (!v9)
      std::__throw_bad_function_call[abi:ne180100]();
    value = (*(uint64_t (**)(_QWORD *))(*v9 + 48))(v9);
    self->_supportsPeriodicLiteCloudSync._value = value;
    self->_supportsPeriodicLiteCloudSync._hasLoaded = 1;
  }
  os_unfair_lock_unlock(&self->_supportsPeriodicLiteCloudSync._loadLock);
  v4 = v9;
  if (v9 == v8)
  {
    v5 = 4;
    v4 = v8;
    goto LABEL_9;
  }
  if (v9)
  {
    v5 = 5;
LABEL_9:
    (*(void (**)(void))(*v4 + 8 * v5))();
  }
  return value;
}

- (void)setSupportsPeriodicLiteCloudSync:(BOOL)a3
{
  os_unfair_lock_s *p_loadLock;

  p_loadLock = &self->_supportsPeriodicLiteCloudSync._loadLock;
  os_unfair_lock_lock(&self->_supportsPeriodicLiteCloudSync._loadLock);
  self->_supportsPeriodicLiteCloudSync._hasLoaded = 1;
  self->_supportsPeriodicLiteCloudSync._value = a3;
  os_unfair_lock_unlock(p_loadLock);
}

- (BOOL)supportsCoordinatedCloudSync
{
  os_unfair_lock_s *p_loadLock;
  char value;
  _QWORD *v5;
  uint64_t v6;
  _QWORD v8[3];
  _QWORD *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v8[0] = &unk_1E37F61A0;
  v8[1] = &__block_literal_global_159;
  v9 = v8;
  p_loadLock = &self->_supportsCoordinatedCloudSync._loadLock;
  os_unfair_lock_lock(&self->_supportsCoordinatedCloudSync._loadLock);
  if (self->_supportsCoordinatedCloudSync._hasLoaded)
  {
    value = self->_supportsCoordinatedCloudSync._value;
  }
  else
  {
    if (!v9)
      std::__throw_bad_function_call[abi:ne180100]();
    value = (*(uint64_t (**)(_QWORD *))(*v9 + 48))(v9);
    self->_supportsCoordinatedCloudSync._value = value;
    self->_supportsCoordinatedCloudSync._hasLoaded = 1;
  }
  os_unfair_lock_unlock(p_loadLock);
  v5 = v9;
  if (v9 == v8)
  {
    v6 = 4;
    v5 = v8;
    goto LABEL_9;
  }
  if (v9)
  {
    v6 = 5;
LABEL_9:
    (*(void (**)(void))(*v5 + 8 * v6))();
  }
  return value;
}

- (void)setSupportsCoordinatedCloudSync:(BOOL)a3
{
  os_unfair_lock_s *p_loadLock;

  p_loadLock = &self->_supportsCoordinatedCloudSync._loadLock;
  os_unfair_lock_lock(&self->_supportsCoordinatedCloudSync._loadLock);
  self->_supportsCoordinatedCloudSync._hasLoaded = 1;
  self->_supportsCoordinatedCloudSync._value = a3;
  os_unfair_lock_unlock(p_loadLock);
}

+ (BOOL)processHasLoadedUIKit
{
  return NSClassFromString(CFSTR("UIColor")) != 0;
}

- (BOOL)processHasLoadedUIKit
{
  return objc_msgSend((id)objc_opt_class(), "processHasLoadedUIKit");
}

+ (BOOL)_isDeviceSupported
{
  BOOL v3;
  void *v4;
  int v5;
  void (*v6)();
  uint64_t *v7;
  uint64_t v9;
  uint64_t v10;

  if ((MGGetBoolAnswer() & 1) != 0)
    return 1;
  if (objc_msgSend(a1, "_isAppleInternalInstall")
    && (objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v5 = objc_msgSend(v4, "BOOLForKey:", CFSTR("HealthKitOverrideDeviceSupported")),
        v4,
        v5))
  {
    v10 = MEMORY[0x1E0C809B0];
    v3 = 1;
    v6 = __33___HKBehavior__isDeviceSupported__block_invoke;
    v7 = &v10;
  }
  else
  {
    v3 = 0;
    v9 = MEMORY[0x1E0C809B0];
    v6 = __33___HKBehavior__isDeviceSupported__block_invoke_165;
    v7 = &v9;
  }
  v7[1] = 3221225472;
  v7[2] = (uint64_t)v6;
  v7[3] = (uint64_t)&__block_descriptor_40_e5_v8__0l;
  v7[4] = (uint64_t)a1;
  HKDispatchAsyncOnGlobalConcurrentQueue(0x15u, v7);
  return v3;
}

+ (BOOL)_isAppleInternalInstall
{
  char has_internal_diagnostics;
  _QWORD v4[4];
  char v5;

  has_internal_diagnostics = os_variant_has_internal_diagnostics();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __38___HKBehavior__isAppleInternalInstall__block_invoke;
  v4[3] = &__block_descriptor_33_e5_v8__0l;
  v5 = has_internal_diagnostics;
  HKDispatchAsyncOnGlobalConcurrentQueue(0x15u, v4);
  return has_internal_diagnostics;
}

+ (BOOL)_hasTelephonyCapability
{
  return MGGetBoolAnswer();
}

+ (BOOL)_isForceBuddyEnabled
{
  void *v2;
  char v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "BOOLForKey:", CFSTR("ForceBuddy")) & 1) != 0)
  {
    v3 = 1;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "environment");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("WD_FORCE_BUDDY"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v6, "isEqualToString:", CFSTR("YES"));

  }
  return v3;
}

+ (BOOL)_hasCompletedBuddyWithVersion:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  char v8;
  _QWORD *v9;

  objc_msgSend(a1, "sharedBehavior");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "features");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "stanley") & 1) == 0)
  {

    goto LABEL_5;
  }
  objc_msgSend(a1, "sharedBehavior");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isiPad");

  if ((v8 & 1) == 0)
  {
LABEL_5:
    v9 = &kHKHAKeyCompletedBuddyVersion;
    return objc_msgSend(a1, "_hasCompletedBuddyWithKey:version:", *v9, a3);
  }
  v9 = &kHKHAKeyCompletedBuddyOniPadVersion;
  return objc_msgSend(a1, "_hasCompletedBuddyWithKey:version:", *v9, a3);
}

+ (void)_setHasCompletedBuddyWithVersion:(int64_t)a3
{
  void *v5;
  void *v6;
  int v7;
  id v8;

  objc_msgSend(a1, "_setHasCompletedBuddyWithKey:version:", CFSTR("CompletedBuddyVersion"), a3);
  objc_msgSend(a1, "sharedBehavior");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "features");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "stanley") & 1) != 0)
  {
    objc_msgSend(a1, "sharedBehavior");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isiPad");

    if (v7)
      objc_msgSend(a1, "_setHasCompletedBuddyWithKey:version:", CFSTR("CompletedBuddyOniPadVersion"), a3);
  }
  else
  {

  }
}

+ (BOOL)_hasCompletedBuddyWithKey:(id)a3 version:(int64_t)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  int64_t v9;
  void *v10;

  v5 = a3;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.health.shared"));
  objc_msgSend(v6, "objectForKey:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v9 = objc_msgSend(v7, "integerValue");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v10, "integerForKey:", v5);

    objc_msgSend(v6, "setInteger:forKey:", v9, v5);
  }

  return v9 >= a4;
}

+ (void)_setHasCompletedBuddyWithKey:(id)a3 version:(int64_t)a4
{
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.health.shared"));
  objc_msgSend(v5, "setInteger:forKey:", a4, v7);
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setInteger:forKey:", a4, v7);

}

+ (void)_resetBuddy
{
  objc_msgSend(a1, "setHasCompletedBuddyWithVersion:", 0);
}

+ (BOOL)_shouldShowBuddy
{
  if (objc_msgSend(a1, "_isAppleInternalInstall") && (objc_msgSend(a1, "_isForceBuddyEnabled") & 1) != 0)
    return 1;
  else
    return objc_msgSend(a1, "hasCompletedBuddyWithVersion:", 2) ^ 1;
}

+ (BOOL)_isBuddyDisabled
{
  char v2;
  void *v3;

  if ((objc_msgSend((id)objc_opt_class(), "isRunningStoreDemoMode") & 1) != 0)
    return 1;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v3, "BOOLForKey:", CFSTR("DisableBuddy"));

  return v2;
}

+ (BOOL)_isDataCollectionForwarderDisabled
{
  void *v2;
  char v3;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.healthd"));
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("DisableDataCollectionForwarder"));

  return v3;
}

+ (BOOL)_isCollectBLETypesFromLocalSourceEnabled
{
  void *v2;
  char v3;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.healthd"));
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("CollectBLETypesFromLocalSource"));

  return v3;
}

+ (BOOL)_showSensitiveLogItems
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("HKShowSensitiveLogItems"));

  return v3;
}

+ (BOOL)_futureMigrationsEnabled
{
  void *v2;
  void *v3;
  void *v4;
  char v5;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "persistentDomainForName:", CFSTR("com.apple.healthd"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "objectForKey:", CFSTR("EnableFutureMigrations"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  return v5;
}

+ (BOOL)_ontologyDatabaseFutureMigrationsEnabled
{
  void *v2;
  void *v3;
  void *v4;
  char v5;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "persistentDomainForName:", CFSTR("com.apple.healthd"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "objectForKey:", CFSTR("EnableOntologyFutureMigrations"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  return v5;
}

+ (BOOL)_condensesHeartRateSamples
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("HDWorkoutCondenser-heartRate"));

  return v3;
}

+ (BOOL)_isAutomaticProcessingEnabled
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("DisableAutomaticUDCProcessing")) ^ 1;

  return v3;
}

- (void)setIsDeviceSupported:(BOOL)a3
{
  self->_isDeviceSupported = a3;
}

- (void)setIsAppleInternalInstall:(BOOL)a3
{
  self->_isAppleInternalInstall = a3;
}

- (void)setIsAppleWatch:(BOOL)a3
{
  self->_isAppleWatch = a3;
}

- (BOOL)isCompanionCapable
{
  return self->_isCompanionCapable;
}

- (void)setIsCompanionCapable:(BOOL)a3
{
  self->_isCompanionCapable = a3;
}

- (BOOL)hasTelephonyCapability
{
  return self->_hasTelephonyCapability;
}

- (void)setHasTelephonyCapability:(BOOL)a3
{
  self->_hasTelephonyCapability = a3;
}

- (void)setIsTestingDevice:(BOOL)a3
{
  self->_isTestingDevice = a3;
}

- (BOOL)isRunningSeedBuild
{
  return self->_isRunningSeedBuild;
}

- (void)setIsRunningSeedBuild:(BOOL)a3
{
  self->_isRunningSeedBuild = a3;
}

- (BOOL)supportsBluetoothDiscovery
{
  return self->_supportsBluetoothDiscovery;
}

- (void)setSupportsBluetoothDiscovery:(BOOL)a3
{
  self->_supportsBluetoothDiscovery = a3;
}

- (BOOL)isProdFused
{
  return self->_isProdFused;
}

- (void)setIsProdFused:(BOOL)a3
{
  self->_isProdFused = a3;
}

- (BOOL)collectsCalorimetry
{
  return self->_collectsCalorimetry;
}

- (void)setCollectsCalorimetry:(BOOL)a3
{
  self->_collectsCalorimetry = a3;
}

- (BOOL)collectsData
{
  return self->_collectsData;
}

- (void)setCollectsData:(BOOL)a3
{
  self->_collectsData = a3;
}

- (BOOL)performsAutomaticConceptIndexing
{
  return self->_performsAutomaticConceptIndexing;
}

- (void)setPerformsAutomaticConceptIndexing:(BOOL)a3
{
  self->_performsAutomaticConceptIndexing = a3;
}

- (BOOL)performsWorkoutCondensation
{
  return self->_performsWorkoutCondensation;
}

- (void)setPerformsWorkoutCondensation:(BOOL)a3
{
  self->_performsWorkoutCondensation = a3;
}

- (BOOL)supportsAWDMetricSubmission
{
  return self->_supportsAWDMetricSubmission;
}

- (void)setSupportsAWDMetricSubmission:(BOOL)a3
{
  self->_supportsAWDMetricSubmission = a3;
}

- (BOOL)supportsActivitySharing
{
  return self->_supportsActivitySharing;
}

- (void)setSupportsActivitySharing:(BOOL)a3
{
  self->_supportsActivitySharing = a3;
}

- (BOOL)supportsAppSubscriptions
{
  return self->_supportsAppSubscriptions;
}

- (void)setSupportsAppSubscriptions:(BOOL)a3
{
  self->_supportsAppSubscriptions = a3;
}

- (BOOL)supportsComputedUserCharacteristicCaching
{
  return self->_supportsComputedUserCharacteristicCaching;
}

- (void)setSupportsComputedUserCharacteristicCaching:(BOOL)a3
{
  self->_supportsComputedUserCharacteristicCaching = a3;
}

- (BOOL)supportsHeartRateDataCollection
{
  return self->_supportsHeartRateDataCollection;
}

- (void)setSupportsHeartRateDataCollection:(BOOL)a3
{
  self->_supportsHeartRateDataCollection = a3;
}

- (BOOL)supportsNanoSync
{
  return self->_supportsNanoSync;
}

- (void)setSupportsNanoSync:(BOOL)a3
{
  self->_supportsNanoSync = a3;
}

- (void)setSupportsSampleExpiration:(BOOL)a3
{
  self->_supportsSampleExpiration = a3;
}

- (BOOL)supportsWorkouts
{
  return self->_supportsWorkouts;
}

- (void)setSupportsWorkouts:(BOOL)a3
{
  self->_supportsWorkouts = a3;
}

- (BOOL)supportsOntology
{
  return self->_supportsOntology;
}

- (void)setSupportsOntology:(BOOL)a3
{
  self->_supportsOntology = a3;
}

- (BOOL)supportsOntologyDatabaseUpdates
{
  return self->_supportsOntologyDatabaseUpdates;
}

- (void)setSupportsOntologyDatabaseUpdates:(BOOL)a3
{
  self->_supportsOntologyDatabaseUpdates = a3;
}

- (BOOL)supportsOntologyFeatureEvaluation
{
  return self->_supportsOntologyFeatureEvaluation;
}

- (void)setSupportsOntologyFeatureEvaluation:(BOOL)a3
{
  self->_supportsOntologyFeatureEvaluation = a3;
}

- (void)setSupportsWorkoutRouteSmoothing:(BOOL)a3
{
  self->_supportsWorkoutRouteSmoothing = a3;
}

- (BOOL)supportsPeriodicCountryMonitoring
{
  return self->_supportsPeriodicCountryMonitoring;
}

- (void)setSupportsPeriodicCountryMonitoring:(BOOL)a3
{
  self->_supportsPeriodicCountryMonitoring = a3;
}

- (BOOL)shouldOverrideSiriUOD
{
  return self->_shouldOverrideSiriUOD;
}

- (void)setShouldOverrideSiriUOD:(BOOL)a3
{
  self->_shouldOverrideSiriUOD = a3;
}

- (void)setTinkerModeEnabled:(BOOL)a3
{
  self->_tinkerModeEnabled = a3;
}

- (void)setHealthAppHidden:(BOOL)a3
{
  self->_healthAppHidden = a3;
}

- (void)setHealthAppNotInstalled:(BOOL)a3
{
  self->_healthAppNotInstalled = a3;
}

- (void)setHealthAppSupportedOnDevice:(BOOL)a3
{
  self->_healthAppSupportedOnDevice = a3;
}

- (BOOL)schedulesXPCAlarms
{
  return self->_schedulesXPCAlarms;
}

- (void)setSchedulesXPCAlarms:(BOOL)a3
{
  self->_schedulesXPCAlarms = a3;
}

- (void)setIsStandalonePhoneFitnessMode:(BOOL)a3
{
  self->_isStandalonePhoneFitnessMode = a3;
}

- (NSString)currentDeviceName
{
  return self->_currentDeviceName;
}

- (void)setCurrentDeviceName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 256);
}

- (void)setCurrentDeviceClass:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 264);
}

- (void)setCurrentDeviceProductType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 272);
}

- (NSString)currentDeviceSerialNumber
{
  return self->_currentDeviceSerialNumber;
}

- (void)setCurrentDeviceSerialNumber:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 280);
}

- (void)setCurrentOSBuild:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 288);
}

- (void)setCurrentOSName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 296);
}

- (void)setCurrentOSVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 304);
}

- (void)setCurrentOSVersionStruct:(id *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)&a3->var0;
  self->_currentOSVersionStruct.patchVersion = a3->var2;
  *(_OWORD *)&self->_currentOSVersionStruct.majorVersion = v3;
}

- (BOOL)showSensitiveLogItems
{
  return self->_showSensitiveLogItems;
}

- (void)setShowSensitiveLogItems:(BOOL)a3
{
  self->_showSensitiveLogItems = a3;
}

- (NSString)additionalEntitlementForConnection
{
  return self->_additionalEntitlementForConnection;
}

- (void)setAdditionalEntitlementForConnection:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 312);
}

- (BOOL)shouldRegisterPeriodicActivities
{
  return self->_shouldRegisterPeriodicActivities;
}

- (void)setShouldRegisterPeriodicActivities:(BOOL)a3
{
  self->_shouldRegisterPeriodicActivities = a3;
}

- (BOOL)invalidatesNotificationInstructionsOnLaunch
{
  return self->_invalidatesNotificationInstructionsOnLaunch;
}

- (void)setInvalidatesNotificationInstructionsOnLaunch:(BOOL)a3
{
  self->_invalidatesNotificationInstructionsOnLaunch = a3;
}

- (NSString)unitTest_deviceRegionCode
{
  return self->_unitTest_deviceRegionCode;
}

- (void)setUnitTest_deviceRegionCode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 320);
}

- (BOOL)ontologyIndexingEnabled
{
  return self->_ontologyIndexingEnabled;
}

- (void)setOntologyIndexingEnabled:(BOOL)a3
{
  self->_ontologyIndexingEnabled = a3;
}

- (BOOL)ontologyIndexingRequiresAccounts
{
  return self->_ontologyIndexingRequiresAccounts;
}

- (void)setOntologyIndexingRequiresAccounts:(BOOL)a3
{
  self->_ontologyIndexingRequiresAccounts = a3;
}

- (BOOL)supportsBackgroundSyncRequests
{
  return self->_supportsBackgroundSyncRequests;
}

- (void)setSupportsBackgroundSyncRequests:(BOOL)a3
{
  self->_supportsBackgroundSyncRequests = a3;
}

- (NSDictionary)featureRequirementOverrides
{
  return self->_featureRequirementOverrides;
}

- (void)setFeatureRequirementOverrides:(id)a3
{
  objc_storeStrong((id *)&self->_featureRequirementOverrides, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featureRequirementOverrides, 0);
  objc_storeStrong((id *)&self->_unitTest_deviceRegionCode, 0);
  objc_storeStrong((id *)&self->_additionalEntitlementForConnection, 0);
  objc_storeStrong((id *)&self->_currentOSVersion, 0);
  objc_storeStrong((id *)&self->_currentOSName, 0);
  objc_storeStrong((id *)&self->_currentOSBuild, 0);
  objc_storeStrong((id *)&self->_currentDeviceSerialNumber, 0);
  objc_storeStrong((id *)&self->_currentDeviceProductType, 0);
  objc_storeStrong((id *)&self->_currentDeviceClass, 0);
  objc_storeStrong((id *)&self->_currentDeviceName, 0);
  objc_storeStrong((id *)&self->_overriddenCurrentDeviceDisplayName, 0);
  objc_storeStrong((id *)&self->_overriddenFitnessMode, 0);
  objc_storeStrong((id *)&self->_overriddenSupportsActiveQueryDaemonTransactions, 0);
  objc_storeStrong((id *)&self->_overriddenSupportsCachedSleepDaySummaryQueries, 0);
  objc_storeStrong((id *)&self->_overriddenSupportsCachedStatisticsCollectionQueries, 0);
  objc_storeStrong((id *)&self->_overriddenSupportsWorkoutSmoothing, 0);
  objc_storeStrong((id *)&self->_overriddenEnableManateeForHSA2Accounts, 0);
  objc_storeStrong((id *)&self->_overriddenSupportsSwimmingWorkoutSessions, 0);

}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_DWORD *)self + 5) = 0;
  *((_DWORD *)self + 23) = 0;
  *((_DWORD *)self + 25) = 0;
  *((_DWORD *)self + 27) = 0;
  *((_DWORD *)self + 29) = 0;
  *((_DWORD *)self + 31) = 0;
  *((_DWORD *)self + 33) = 0;
  *((_DWORD *)self + 35) = 0;
  *((_DWORD *)self + 37) = 0;
  *((_DWORD *)self + 39) = 0;
  *((_DWORD *)self + 41) = 0;
  *((_DWORD *)self + 43) = 0;
  *((_DWORD *)self + 45) = 0;
  *((_DWORD *)self + 47) = 0;
  *((_DWORD *)self + 49) = 0;
  *((_DWORD *)self + 51) = 0;
  *((_DWORD *)self + 53) = 0;
  return self;
}

- (void)isiPad
{
}

- (_QWORD)isiPad
{
  _QWORD *result;
  uint64_t v3;

  result = operator new(0x10uLL);
  v3 = *(_QWORD *)(a1 + 8);
  *result = &off_1E37F7208;
  result[1] = v3;
  return result;
}

- (uint64_t)isiPad
{
    return a1 + 8;
  else
    return 0;
}

- (void)isRunningStoreDemoMode
{
}

- (_QWORD)isRunningStoreDemoMode
{
  _QWORD *result;

  result = operator new(0x10uLL);
  *result = &off_1E37F7288;
  return result;
}

- (uint64_t)isRunningStoreDemoMode
{
    return a1 + 8;
  else
    return 0;
}

- (void)runningInStoreDemoModeF201
{
}

- (_QWORD)runningInStoreDemoModeF201
{
  _QWORD *result;

  result = operator new(0x10uLL);
  *result = &off_1E37F7308;
  return result;
}

- (uint64_t)runningInStoreDemoModeF201
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

- (void)futureMigrationsEnabled
{
}

- (_QWORD)futureMigrationsEnabled
{
  _QWORD *result;
  uint64_t v3;

  result = operator new(0x10uLL);
  v3 = *(_QWORD *)(a1 + 8);
  *result = &off_1E37F7388;
  result[1] = v3;
  return result;
}

- (uint64_t)futureMigrationsEnabled
{
    return a1 + 8;
  else
    return 0;
}

- (void)supportsOntologyDatabaseFutureMigrations
{
}

- (_QWORD)supportsOntologyDatabaseFutureMigrations
{
  _QWORD *result;
  uint64_t v3;

  result = operator new(0x10uLL);
  v3 = *(_QWORD *)(a1 + 8);
  *result = &off_1E37F7408;
  result[1] = v3;
  return result;
}

- (uint64_t)supportsOntologyDatabaseFutureMigrations
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

- (void)performsAutomaticUserDomainConceptProcessing
{
}

- (_QWORD)performsAutomaticUserDomainConceptProcessing
{
  _QWORD *result;
  uint64_t v3;

  result = operator new(0x10uLL);
  v3 = *(_QWORD *)(a1 + 8);
  *result = &off_1E37F7488;
  result[1] = v3;
  return result;
}

- (uint64_t)performsAutomaticUserDomainConceptProcessing
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

+ (void)_healthAppNotInstalled
{
  *(_DWORD *)buf = 138543618;
  *(_QWORD *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2114;
  *(_QWORD *)(buf + 14) = a2;
  _os_log_error_impl(&dword_19A0E6000, log, OS_LOG_TYPE_ERROR, "%{public}@: Assuming installed due to error in getting Health app install state: %{public}@", buf, 0x16u);

}

@end
