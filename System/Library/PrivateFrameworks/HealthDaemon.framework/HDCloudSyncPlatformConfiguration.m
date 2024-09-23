@implementation HDCloudSyncPlatformConfiguration

- (HDCloudSyncPlatformConfiguration)initWithPrimaryProfile:(id)a3 behavior:(id)a4
{
  id v6;
  id v7;
  HDCloudSyncPlatformConfiguration *v8;
  HDCloudSyncPlatformConfiguration *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)HDCloudSyncPlatformConfiguration;
  v8 = -[HDCloudSyncPlatformConfiguration init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_profile, v6);
    objc_storeStrong((id *)&v9->_behavior, a4);
    v9->_lock._os_unfair_lock_opaque = 0;
    v9->_allowLiteSync = 0;
  }

  return v9;
}

- (BOOL)shouldRegisterForPeriodicSyncActivities
{
  if ((-[_HKBehavior supportsPeriodicFullCloudSync](self->_behavior, "supportsPeriodicFullCloudSync") & 1) != 0)
    return 1;
  else
    return -[_HKBehavior supportsPeriodicLiteCloudSync](self->_behavior, "supportsPeriodicLiteCloudSync");
}

- (const)priorityForPeriodicSyncActivity
{
  int v2;
  const char **v3;

  v2 = -[_HKBehavior isAppleWatch](self->_behavior, "isAppleWatch");
  v3 = (const char **)MEMORY[0x1E0C80880];
  if (!v2)
    v3 = (const char **)MEMORY[0x1E0C80888];
  return *v3;
}

- (int64_t)baseIntervalForPeriodicSyncActivity
{
  _BOOL8 v3;
  int v4;
  _HKBehavior *behavior;

  v3 = -[HDCloudSyncPlatformConfiguration isConfiguredForLiteSync](self, "isConfiguredForLiteSync");
  v4 = -[_HKBehavior isAppleWatch](self->_behavior, "isAppleWatch");
  behavior = self->_behavior;
  if (v4)
    return -[HDCloudSyncPlatformConfiguration _baseIntervalForAppleWatchAllowingLiteSync:tinker:](self, "_baseIntervalForAppleWatchAllowingLiteSync:tinker:", v3, -[_HKBehavior tinkerModeEnabled](behavior, "tinkerModeEnabled"));
  if (-[_HKBehavior isRealityDevice](behavior, "isRealityDevice"))
    return -[HDCloudSyncPlatformConfiguration _baseIntervalForRealityDevice](self, "_baseIntervalForRealityDevice");
  return -[HDCloudSyncPlatformConfiguration _baseIntervalForiPhoneAllowingLiteSync:](self, "_baseIntervalForiPhoneAllowingLiteSync:", v3);
}

- (BOOL)canLiteSyncPull
{
  if (-[_HKBehavior isAppleWatch](self->_behavior, "isAppleWatch"))
    return -[_HKBehavior tinkerModeEnabled](self->_behavior, "tinkerModeEnabled");
  else
    return 1;
}

- (int64_t)_baseIntervalForAppleWatchAllowingLiteSync:(BOOL)a3 tinker:(BOOL)a4
{
  int64_t *v4;
  int64_t *v5;

  v4 = (int64_t *)MEMORY[0x1E0C807D8];
  v5 = (int64_t *)MEMORY[0x1E0C807C0];
  if (!a3)
    v5 = (int64_t *)MEMORY[0x1E0C807B8];
  if (!a4)
    v4 = v5;
  return *v4;
}

- (int64_t)_baseIntervalForRealityDevice
{
  return *MEMORY[0x1E0C807D8];
}

- (int64_t)_baseIntervalForiPhoneAllowingLiteSync:(BOOL)a3
{
  int64_t *v3;

  v3 = (int64_t *)MEMORY[0x1E0C807D0];
  if (!a3)
    v3 = (int64_t *)MEMORY[0x1E0C807D8];
  return *v3;
}

- (BOOL)requireInexpensiveNetworking
{
  int v3;
  HDProfile **p_profile;
  id WeakRetained;
  int v6;
  id v7;
  NSObject *v8;
  const char *v9;
  id v10;
  int v11;
  id v13;
  id v14;
  uint8_t buf[4];
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (-[_HKBehavior isAppleWatch](self->_behavior, "isAppleWatch")
    && !-[_HKBehavior tinkerModeEnabled](self->_behavior, "tinkerModeEnabled"))
  {
    goto LABEL_10;
  }
  v3 = -[_HKBehavior tinkerModeEnabled](self->_behavior, "tinkerModeEnabled");
  if (v3)
  {
    p_profile = &self->_profile;
    WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
    v14 = 0;
    v6 = HDUpgradedToSyncIdentity(WeakRetained, (uint64_t)&v14);
    v7 = v14;

    if (v7)
    {
      _HKInitializeLogging();
      v8 = *MEMORY[0x1E0CB5370];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v16 = v7;
        v9 = "Failed to read hasUpgradedToSyncIdentity with error: %{public}@.";
LABEL_15:
        _os_log_error_impl(&dword_1B7802000, v8, OS_LOG_TYPE_ERROR, v9, buf, 0xCu);
        goto LABEL_9;
      }
      goto LABEL_9;
    }
    v10 = objc_loadWeakRetained((id *)p_profile);
    v13 = 0;
    v11 = HDCompletedTransitionToSyncIdentity(v10, (uint64_t)&v13);
    v7 = v13;

    if (v7)
    {
      _HKInitializeLogging();
      v8 = *MEMORY[0x1E0CB5370];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v16 = v7;
        v9 = "Failed to read completedtransitionToSyncIdentity with error: %{public}@.";
        goto LABEL_15;
      }
LABEL_9:

LABEL_10:
      LOBYTE(v3) = 1;
      return v3;
    }
    if (((v6 ^ 1 | v11) & 1) == 0)
      goto LABEL_10;
    LOBYTE(v3) = 0;
  }
  return v3;
}

- (double)cellularSyncThreshold
{
  int v2;
  double result;

  v2 = -[_HKBehavior tinkerModeEnabled](self->_behavior, "tinkerModeEnabled");
  result = 259200.0;
  if (v2)
    return 172800.0;
  return result;
}

- (double)liteSyncThreshold
{
  int v3;
  double result;

  if (-[_HKBehavior isAppleWatch](self->_behavior, "isAppleWatch")
    && !-[_HKBehavior tinkerModeEnabled](self->_behavior, "tinkerModeEnabled"))
  {
    return 3600.0;
  }
  v3 = -[_HKBehavior isRealityDevice](self->_behavior, "isRealityDevice");
  result = 1800.0;
  if (v3)
    return 14400.0;
  return result;
}

- (BOOL)isConfiguredForLiteSync
{
  void *v3;
  int v4;
  NSObject *v5;
  BOOL v6;
  id WeakRetained;
  void *v8;
  char v9;
  id v10;
  NSObject *v11;
  HDKeyValueDomain *v12;
  id v13;
  HDKeyValueDomain *v14;
  uint64_t v15;
  void *v16;
  id v17;
  NSObject *v18;
  int v19;
  BOOL v20;
  id v21;
  NSObject *v22;
  id v24;
  id v25;
  _QWORD v26[5];
  id v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  BOOL allowLiteSync;
  uint8_t buf[4];
  HDCloudSyncPlatformConfiguration *v33;
  __int16 v34;
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v28 = 0;
  v29 = &v28;
  v30 = 0x2020000000;
  allowLiteSync = self->_allowLiteSync;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLForKey:", CFSTR("HDCloudSyncDisableFastSync"));

  if (v4)
  {
    _HKInitializeLogging();
    v5 = *MEMORY[0x1E0CB5370];
    v6 = 0;
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B7802000, v5, OS_LOG_TYPE_DEFAULT, "Lite sync disabled by internal user default", buf, 2u);
      v6 = 0;
    }
    goto LABEL_24;
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "deviceContextManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0;
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __59__HDCloudSyncPlatformConfiguration_isConfiguredForLiteSync__block_invoke;
  v26[3] = &unk_1E6CF4D88;
  v26[4] = &v28;
  v9 = objc_msgSend(v8, "enumerateAllEntriesWithError:handler:", &v27, v26);
  v10 = v27;

  if ((v9 & 1) == 0)
  {
    _HKInitializeLogging();
    v11 = *MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v33 = self;
      v34 = 2114;
      v35 = v10;
      _os_log_impl(&dword_1B7802000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: Failed to query database for device context objects %{public}@.", buf, 0x16u);
    }
  }
  v12 = [HDKeyValueDomain alloc];
  v13 = objc_loadWeakRetained((id *)&self->_profile);
  v14 = -[HDKeyValueDomain initWithCategory:domainName:profile:](v12, "initWithCategory:domainName:profile:", 0, CFSTR("CloudSyncCoordinator"), v13);

  v15 = *MEMORY[0x1E0CB7620];
  v25 = v10;
  -[HDKeyValueDomain numberForKey:error:](v14, "numberForKey:error:", v15, &v25);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v25;

  if (v16 || !v17)
  {
    if (v16)
    {
      v19 = objc_msgSend(v16, "BOOLValue") ^ 1;
      goto LABEL_14;
    }
  }
  else
  {
    _HKInitializeLogging();
    v18 = *MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v33 = self;
      v34 = 2114;
      v35 = v17;
      _os_log_error_impl(&dword_1B7802000, v18, OS_LOG_TYPE_ERROR, "%{public}@: Could not read lite synced on watch key %{public}@.", buf, 0x16u);
    }
  }
  v19 = 1;
LABEL_14:
  if (*((_BYTE *)v29 + 24)
    || ((-[_HKBehavior isAppleWatch](self->_behavior, "isAppleWatch") ^ 1 | v19) & 1) == 0)
  {
    if ((-[_HKBehavior isAppleWatch](self->_behavior, "isAppleWatch") & v19) == 1)
    {
      v24 = v17;
      v20 = -[HDKeyValueDomain setNumber:forKey:error:](v14, "setNumber:forKey:error:", MEMORY[0x1E0C9AAB0], v15, &v24);
      v21 = v24;

      if (!v20)
      {
        _HKInitializeLogging();
        v22 = *MEMORY[0x1E0CB5370];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          v33 = self;
          v34 = 2114;
          v35 = v21;
          _os_log_error_impl(&dword_1B7802000, v22, OS_LOG_TYPE_ERROR, "%{public}@: Failed to set lite synced on watch flag %{public}@.", buf, 0x16u);
        }
      }
      v6 = 1;
      v17 = v21;
    }
    else
    {
      v6 = 1;
    }
  }
  else
  {
    v6 = 0;
  }

LABEL_24:
  _Block_object_dispose(&v28, 8);
  return v6;
}

uint64_t __59__HDCloudSyncPlatformConfiguration_isConfiguredForLiteSync__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint8_t v6[16];

  v3 = a2;
  if (objc_msgSend(v3, "type") == 2 || objc_msgSend(v3, "type") == 3)
  {
    _HKInitializeLogging();
    v4 = *MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_1B7802000, v4, OS_LOG_TYPE_DEFAULT, "Lite sync enabled due to iPad or VisionPro in device context", v6, 2u);
    }
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
  }

  return 1;
}

- (BOOL)shouldRestrictSyncInSleepFocus
{
  int v3;

  v3 = -[_HKBehavior isAppleWatch](self->_behavior, "isAppleWatch");
  if (v3)
    LOBYTE(v3) = (-[_HKBehavior tinkerModeEnabled](self->_behavior, "tinkerModeEnabled") & 1) == 0
              && self->_isSleepFocusOn != 0;
  return v3;
}

- (BOOL)participateInCoordinatedSync
{
  int v3;

  v3 = -[_HKBehavior isAppleWatch](self->_behavior, "isAppleWatch");
  if (v3)
    LOBYTE(v3) = -[_HKBehavior tinkerModeEnabled](self->_behavior, "tinkerModeEnabled") ^ 1;
  return v3;
}

- (BOOL)_isSleepFocusOn
{
  uint64_t (**isSleepFocusOn)(void);
  HDBiomeInterface *v4;
  BOOL v5;

  if (_HDIsUnitTesting)
  {
    isSleepFocusOn = (uint64_t (**)(void))self->_isSleepFocusOn;
    if (isSleepFocusOn)
      return isSleepFocusOn[2]();
  }
  v4 = objc_alloc_init(HDBiomeInterface);
  v5 = -[HDBiomeInterface sleepFocusOn](v4, "sleepFocusOn");

  return v5;
}

- (void)unitTest_setAllowLiteSync:(BOOL)a3
{
  self->_allowLiteSync = a3;
}

- (id)isSleepFocusOn
{
  return self->_isSleepFocusOn;
}

- (void)setIsSleepFocusOn:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_isSleepFocusOn, 0);
  objc_storeStrong((id *)&self->_behavior, 0);
  objc_destroyWeak((id *)&self->_profile);
}

@end
