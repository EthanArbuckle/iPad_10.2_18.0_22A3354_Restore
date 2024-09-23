@implementation HMDMetricsDeviceStateManager

- (void)updateWithHomeManagerStatus:(unint64_t)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  if (self->_currentHomeManagerStatus != a3)
    self->_currentHomeManagerStatus = a3;
  os_unfair_lock_unlock(p_lock);
}

- (void)updateWithDataSyncState:(unint64_t)a3
{
  os_unfair_lock_s *p_lock;
  void *v6;
  HMDDataSyncStateLogEvent *v7;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  if (self->_currentDataSyncState != a3)
  {
    self->_currentDataSyncState = a3;
    -[HMDMetricsDeviceStateManager logEventSubmitter](self, "logEventSubmitter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[HMDDataSyncStateLogEvent initWithDataSyncState:]([HMDDataSyncStateLogEvent alloc], "initWithDataSyncState:", a3);
    objc_msgSend(v6, "submitLogEvent:", v7);

  }
  os_unfair_lock_unlock(p_lock);
}

- (HMDMetricsDeviceStateManager)initWithLogEventSubmitter:(id)a3 dailyScheduler:(id)a4 dateProvider:(id)a5
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
  HMDMetricsDeviceStateManager *v17;

  v8 = (void *)MEMORY[0x1E0D28690];
  v9 = a5;
  v10 = a4;
  v11 = a3;
  objc_msgSend(v8, "productInfo");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "softwareVersion");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "versionString");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D165F0], "systemStore");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[HMDMetricsDeviceStateManager initWithCurrentSoftwareVersion:logEventSubmitter:dailyScheduler:dateProvider:keyCountProvider:userDefaults:](self, "initWithCurrentSoftwareVersion:logEventSubmitter:dailyScheduler:dateProvider:keyCountProvider:userDefaults:", v14, v11, v10, v9, v15, v16);

  return v17;
}

- (HMDMetricsDeviceStateManager)initWithCurrentSoftwareVersion:(id)a3 logEventSubmitter:(id)a4 dailyScheduler:(id)a5 dateProvider:(id)a6 keyCountProvider:(id)a7 userDefaults:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  HMDMetricsDeviceStateManager *v20;
  uint64_t v21;
  NSDate *lastSoftwareUpdateDate;
  objc_super v24;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v24.receiver = self;
  v24.super_class = (Class)HMDMetricsDeviceStateManager;
  v20 = -[HMDMetricsDeviceStateManager init](&v24, sel_init);
  if (v20)
  {
    objc_msgSend((id)objc_opt_class(), "lastUpdateForSoftwareVersion:dateProvider:userDefaults:updateDefaultsIfNeeded:", v14, v17, v19, 1);
    v21 = objc_claimAutoreleasedReturnValue();
    lastSoftwareUpdateDate = v20->_lastSoftwareUpdateDate;
    v20->_lastSoftwareUpdateDate = (NSDate *)v21;

    objc_storeStrong((id *)&v20->_logEventSubmitter, a4);
    v20->_currentDataSyncState = 0;
    objc_storeWeak((id *)&v20->_dateProvider, v17);
    objc_storeStrong((id *)&v20->_keyCountProvider, a7);
    objc_msgSend(v16, "registerDailyTaskRunner:", v20);
    -[HMDMetricsDeviceStateManager registerForNotifications](v20, "registerForNotifications");
  }

  return v20;
}

- (void)registerForNotifications
{
  void *v3;
  HMDMetricsDeviceStateManager *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1D17BA0A0](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543362;
    v9 = v6;
    _os_log_impl(&dword_1CD062000, v5, OS_LOG_TYPE_INFO, "%{public}@registerForEvents", (uint8_t *)&v8, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObserver:selector:name:object:", v4, sel_handleHomeDataLoaded, CFSTR("HMDHomeManagerHomeDataLoadedNotification"), 0);

}

- (void)updateCachedPairingKeyStates
{
  os_unfair_lock_s *p_lock;
  void *v4;
  void *v5;
  void *v6;
  HMDMetricsDeviceStateManager *v7;
  NSObject *v8;
  void *v9;
  unint64_t bitMappedMissingKeys;
  unint64_t bitMappedDuplicateKeys;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  unint64_t v17;
  __int16 v18;
  unint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  -[HMDMetricsDeviceStateManager keyCountProvider](self, "keyCountProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "countAccessoryPairingKeysForMetrics");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  self->_bitMappedMissingKeys = -[HMDMetricsDeviceStateManager missingKeysBitMapFromKeyCounts:](self, "missingKeysBitMapFromKeyCounts:", v5);
  self->_bitMappedDuplicateKeys = -[HMDMetricsDeviceStateManager duplicateKeysBitMapFromKeyCounts:](self, "duplicateKeysBitMapFromKeyCounts:", v5);
  v6 = (void *)MEMORY[0x1D17BA0A0]();
  v7 = self;
  HMFGetOSLogHandle();
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    bitMappedMissingKeys = self->_bitMappedMissingKeys;
    bitMappedDuplicateKeys = self->_bitMappedDuplicateKeys;
    v12 = 138544130;
    v13 = v9;
    v14 = 2112;
    v15 = v5;
    v16 = 2048;
    v17 = bitMappedMissingKeys;
    v18 = 2048;
    v19 = bitMappedDuplicateKeys;
    _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_INFO, "%{public}@Fetched key counts: %@ \n Cached bitMappedMissingKeys: %lu Cached bitMappedDuplicateKeys: %lu", (uint8_t *)&v12, 0x2Au);

  }
  objc_autoreleasePoolPop(v6);

  os_unfair_lock_unlock(p_lock);
}

- (unint64_t)missingKeysBitMapFromKeyCounts:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  uint64_t v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v4, "objectForKeyedSubscript:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "integerValue");

        if (!v12)
          v7 |= -[HMDMetricsDeviceStateManager bitMaskForKeyType:](self, "bitMaskForKeyType:", objc_msgSend(v10, "unsignedIntegerValue"));
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)duplicateKeysBitMapFromKeyCounts:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  uint64_t v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v4, "objectForKeyedSubscript:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "integerValue");

        if (v12 >= 2)
          v7 |= -[HMDMetricsDeviceStateManager bitMaskForKeyType:](self, "bitMaskForKeyType:", objc_msgSend(v10, "unsignedIntegerValue"));
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)bitMaskForKeyType:(unint64_t)a3
{
  if ((uint64_t)a3 > 1751999336)
  {
    switch(a3)
    {
      case 0x686D6369uLL:
        return 8;
      case 0x686D6B32uLL:
        return 16;
      case 0x686D6C69uLL:
        return 32;
    }
  }
  else
  {
    switch(a3)
    {
      case 0x68617043uLL:
        return 2;
      case 0x68617053uLL:
        return 64;
      case 0x68617063uLL:
        return 4;
    }
  }
  return 1;
}

- (int64_t)deviceDaysSinceSoftwareUpdate
{
  os_unfair_lock_s *p_lock;
  void *v4;
  NSDate *lastSoftwareUpdateDate;
  id WeakRetained;
  int64_t v7;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = (void *)objc_opt_class();
  lastSoftwareUpdateDate = self->_lastSoftwareUpdateDate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_dateProvider);
  v7 = objc_msgSend(v4, "_daysSinceSoftwareUpdateFrom:dateProvider:", lastSoftwareUpdateDate, WeakRetained);

  os_unfair_lock_unlock(p_lock);
  return v7;
}

- (void)handleHomeDataLoaded
{
  void *v3;
  HMDMetricsDeviceStateManager *v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1D17BA0A0](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543362;
    v8 = v6;
    _os_log_impl(&dword_1CD062000, v5, OS_LOG_TYPE_INFO, "%{public}@handleHomeDataLoaded", (uint8_t *)&v7, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  -[HMDMetricsDeviceStateManager updateCachedPairingKeyStates](v4, "updateCachedPairingKeyStates");
}

- (void)runDailyTask
{
  void *v3;
  HMDMetricsDeviceStateManager *v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1D17BA0A0](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543362;
    v8 = v6;
    _os_log_impl(&dword_1CD062000, v5, OS_LOG_TYPE_INFO, "%{public}@runDailyTask", (uint8_t *)&v7, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  -[HMDMetricsDeviceStateManager updateCachedPairingKeyStates](v4, "updateCachedPairingKeyStates");
}

- (unint64_t)currentDataSyncState
{
  return self->_currentDataSyncState;
}

- (unint64_t)currentHomeManagerStatus
{
  return self->_currentHomeManagerStatus;
}

- (unint64_t)bitMappedMissingKeys
{
  return self->_bitMappedMissingKeys;
}

- (unint64_t)bitMappedDuplicateKeys
{
  return self->_bitMappedDuplicateKeys;
}

- (HMMLogEventSubmitting)logEventSubmitter
{
  return self->_logEventSubmitter;
}

- (NSDate)lastSoftwareUpdateDate
{
  return self->_lastSoftwareUpdateDate;
}

- (HMMDateProvider)dateProvider
{
  return (HMMDateProvider *)objc_loadWeakRetained((id *)&self->_dateProvider);
}

- (HAPSystemKeyCountProvider)keyCountProvider
{
  return self->_keyCountProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyCountProvider, 0);
  objc_destroyWeak((id *)&self->_dateProvider);
  objc_storeStrong((id *)&self->_lastSoftwareUpdateDate, 0);
  objc_storeStrong((id *)&self->_logEventSubmitter, 0);
}

+ (id)lastUpdateForSoftwareVersion:(id)a3 dateProvider:(id)a4 userDefaults:(id)a5 updateDefaultsIfNeeded:(BOOL)a6
{
  _BOOL4 v6;
  id v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;

  v6 = a6;
  v9 = a3;
  v10 = a4;
  v11 = a5;
  objc_msgSend(v11, "stringForKey:", CFSTR("HMDMetricsDeviceStateManagerLastStoredSoftwareVersionKey"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKey:", CFSTR("HMDMetricsDeviceStateManagerLastStoredSoftwareDateKey"));
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)v13;
  if (v12 && v13 && (objc_msgSend(v12, "isEqualToString:", v9) & 1) != 0)
  {
    v15 = v14;
  }
  else
  {
    objc_msgSend(v10, "startOfCurrentDay");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v11, "setObject:forKey:", v9, CFSTR("HMDMetricsDeviceStateManagerLastStoredSoftwareVersionKey"));
      objc_msgSend(v11, "setObject:forKey:", v15, CFSTR("HMDMetricsDeviceStateManagerLastStoredSoftwareDateKey"));
    }
  }

  return v15;
}

+ (int64_t)_daysSinceSoftwareUpdateFrom:(id)a3 dateProvider:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  int64_t v11;

  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (!v6
    || (v8 = (void *)MEMORY[0x1E0D33480],
        objc_msgSend(v6, "startOfCurrentDay"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v10 = objc_msgSend(v8, "daysFromDate:toDate:", v5, v9),
        v9,
        (v10 & 0x8000000000000000) != 0))
  {
    v11 = -1;
  }
  else if (v10 > 0x1E)
  {
    v11 = 9999;
  }
  else
  {
    v11 = qword_1CDB8EF38[v10];
  }

  return v11;
}

+ (int64_t)internalDeviceDaysSinceSoftwareUpdate
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int64_t v10;

  objc_msgSend(MEMORY[0x1E0D33480], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_opt_class();
  objc_msgSend(MEMORY[0x1E0D28690], "productInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "softwareVersion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "versionString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lastUpdateForSoftwareVersion:dateProvider:userDefaults:updateDefaultsIfNeeded:", v7, v3, v8, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(a1, "_daysSinceSoftwareUpdateFrom:dateProvider:", v9, v3);
  return v10;
}

@end
