@implementation MAAutoAssetUpdatePolicy

- (id)initUpdatePolicy:(id)a3 forAssetType:(id)a4
{
  id v7;
  id v8;
  MAAutoAssetUpdatePolicy *v9;
  MAAutoAssetUpdatePolicy *v10;
  NSArray *categoryList;
  NSDictionary *additionalUpdatePolicyControl;
  id limitCellularByRestrictedTimePeriods;
  id limitWiFiByRestrictedTimePeriods;
  id limitCellularByFeeAgreement;
  id limitByNetworkType;
  NSUUID *assetAudienceUUID;
  objc_super v19;

  v7 = a3;
  v8 = a4;
  v19.receiver = self;
  v19.super_class = (Class)MAAutoAssetUpdatePolicy;
  v9 = -[MAAutoAssetUpdatePolicy init](&v19, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_updatePolicyName, a3);
    objc_storeStrong((id *)&v10->_assetType, a4);
    categoryList = v10->_categoryList;
    v10->_categoryList = 0;

    *(_WORD *)&v10->_checkForNewerAsUserInitiated = 0;
    v10->_newerFoundAutoDownloadPostponed = 0;
    *(_OWORD *)&v10->_checkForNewerIntervalSecs = xmmword_1AE3BAE70;
    *(_OWORD *)&v10->_newerFoundAutoDownloadJitterSecs = xmmword_1AE3BAE80;
    *(_QWORD *)&v10->_revokeIgnoredForUnlockedPurge = 0;
    v10->_allowLockWhenFilesystemSpaceCritical = 0;
    *(_OWORD *)&v10->_newerFoundUserInitiatedDownloadTimeoutSecs = xmmword_1AE3BAE90;
    *(_OWORD *)&v10->_maximumUnlockAfterUsageSecs = xmmword_1AE3BAE90;
    additionalUpdatePolicyControl = v10->_additionalUpdatePolicyControl;
    v10->_maximumPreventGarbageCollectionSecs = 900;
    v10->_additionalUpdatePolicyControl = 0;

    *(_QWORD *)&v10->_blockIfBeforeFirstUnlock = 0;
    *(_QWORD *)&v10->_allowAutoCheckForNewerWhenBatteryLow = 0;
    limitCellularByRestrictedTimePeriods = v10->_limitCellularByRestrictedTimePeriods;
    v10->_limitCellularByRestrictedTimePeriods = 0;

    limitWiFiByRestrictedTimePeriods = v10->_limitWiFiByRestrictedTimePeriods;
    v10->_limitWiFiByRestrictedTimePeriods = 0;

    limitCellularByFeeAgreement = v10->_limitCellularByFeeAgreement;
    v10->_limitCellularByFeeAgreement = 0;

    limitByNetworkType = v10->_limitByNetworkType;
    v10->_limitByNetworkType = 0;

    assetAudienceUUID = v10->_assetAudienceUUID;
    v10->_assetAudienceUUID = 0;

  }
  return v10;
}

- (MAAutoAssetUpdatePolicy)initWithCoder:(id)a3
{
  id v4;
  MAAutoAssetUpdatePolicy *v5;
  uint64_t v6;
  NSString *updatePolicyName;
  uint64_t v8;
  NSString *assetType;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSArray *categoryList;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  NSDictionary *additionalUpdatePolicyControl;
  uint64_t v20;
  NSUUID *assetAudienceUUID;
  objc_super v23;
  _QWORD v24[8];
  _QWORD v25[3];

  v25[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)MAAutoAssetUpdatePolicy;
  v5 = -[MAAutoAssetUpdatePolicy init](&v23, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("updatePolicyName"));
    v6 = objc_claimAutoreleasedReturnValue();
    updatePolicyName = v5->_updatePolicyName;
    v5->_updatePolicyName = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("assetType"));
    v8 = objc_claimAutoreleasedReturnValue();
    assetType = v5->_assetType;
    v5->_assetType = (NSString *)v8;

    v10 = objc_alloc(MEMORY[0x1E0C99E60]);
    v25[0] = objc_opt_class();
    v25[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v10, "initWithArray:", v11);
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("categoryList"));
    v13 = objc_claimAutoreleasedReturnValue();
    categoryList = v5->_categoryList;
    v5->_categoryList = (NSArray *)v13;

    v5->_checkForNewerIntervalSecs = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("checkForNewerIntervalSecs"));
    v5->_checkForNewerTimeoutSecs = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("checkForNewerTimeoutSecs"));
    v5->_checkForNewerAsUserInitiated = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("checkForNewerAsUserInitiated"));
    v5->_checkForNewerWithoutRampEnabled = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("checkForNewerWithoutRampEnabled"));
    v5->_newerFoundAutoDownloadPostponed = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("newerFoundAutoDownloadPostponed"));
    v5->_newerFoundAutoDownloadJitterSecs = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("newerFoundAutoDownloadJitterSecs"));
    v5->_newerFoundAutoDownloadTimeoutSecs = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("newerFoundAutoDownloadTimeoutSecs"));
    v5->_newerFoundUserInitiatedDownloadTimeoutSecs = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("newerFoundUserInitiatedDownloadTimeoutSecs"));
    v5->_revokeIgnoredForUnlockedPurge = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("revokeIgnoredForUnlockedPurge"));
    v5->_revokeIgnoredForLockedContent = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("revokeIgnoredForLockedContent"));
    v5->_revokeTriggersLockedPurge = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("revokeTriggersLockedPurge"));
    v5->_allowInterestAcrossTermination = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("allowInterestAcrossTermination"));
    v5->_allowLockAcrossTermination = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("allowLockAcrossTermination"));
    v5->_allowLockAcrossReboot = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("allowLockAcrossReboot"));
    v5->_allowLockAcrossOTAUpdate = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("allowLockAcrossOTAUpdate"));
    v5->_allowLockOfRevokedContent = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("allowLockOfRevokedContent"));
    v5->_allowLockWhenFilesystemSpaceCritical = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("allowLockWhenFilesystemSpaceCritical"));
    v5->_defaultUnlockAfterUsageSecs = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("defaultUnlockAfterUsageSecs"));
    v5->_maximumUnlockAfterUsageSecs = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("maximumUnlockAfterUsageSecs"));
    v5->_defaultPreventGarbageCollectionSecs = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("defaultPreventGarbageCollectionSecs"));
    v5->_maximumPreventGarbageCollectionSecs = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("maximumPreventGarbageCollectionSecs"));
    v15 = (void *)MEMORY[0x1E0C99E60];
    v24[0] = objc_opt_class();
    v24[1] = objc_opt_class();
    v24[2] = objc_opt_class();
    v24[3] = objc_opt_class();
    v24[4] = objc_opt_class();
    v24[5] = objc_opt_class();
    v24[6] = objc_opt_class();
    v24[7] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 8);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setWithArray:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v17, CFSTR("additionalUpdatePolicyControl"));
    v18 = objc_claimAutoreleasedReturnValue();
    additionalUpdatePolicyControl = v5->_additionalUpdatePolicyControl;
    v5->_additionalUpdatePolicyControl = (NSDictionary *)v18;

    v5->_allowAutoCheckForNewerWhenBatteryLow = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("allowAutoCheckForNewerWhenBatteryLow"));
    v5->_allowAutoCheckForNewerWhenCPUHigh = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("allowAutoCheckForNewerWhenCPUHigh"));
    v5->_allowAutoCheckForNewerOverExpensive = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("allowAutoCheckForNewerOverExpensive"));
    v5->_allowAutoDownloadWhenBatteryLow = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("allowAutoDownloadWhenBatteryLow"));
    v5->_allowAutoDownloadWhenCPUHigh = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("allowAutoDownloadWhenCPUHigh"));
    v5->_blockIfBeforeFirstUnlock = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("blockIfBeforeFirstUnlock"));
    v5->_blockAutoCheckForNewerOverCellular = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("blockAutoCheckForNewerOverCellular"));
    v5->_blockAutoDownloadOverCellular = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("blockAutoDownloadOverCellular"));
    v5->_blockUserInitiatedDownloadOverCellular = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("blockUserInitiatedDownloadOverCellular"));
    v5->_blockUserInitiatedDownloadWhenBatteryLow = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("blockUserInitiatedDownloadWhenBatteryLow"));
    v5->_blockUserInitiatedDownloadWhenCPUHigh = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("blockUserInitiatedDownloadWhenCPUHigh"));
    v5->_blockUserInitiatedDownloadOverExpensive = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("blockUserInitiatedDownloadOverExpensive"));
    v5->_downloadWithoutPreferenceForWiFi = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("downloadWithoutPreferenceForWiFi"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("assetAudienceUUID"));
    v20 = objc_claimAutoreleasedReturnValue();
    assetAudienceUUID = v5->_assetAudienceUUID;
    v5->_assetAudienceUUID = (NSUUID *)v20;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  -[MAAutoAssetUpdatePolicy updatePolicyName](self, "updatePolicyName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("updatePolicyName"));

  -[MAAutoAssetUpdatePolicy assetType](self, "assetType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("assetType"));

  -[MAAutoAssetUpdatePolicy categoryList](self, "categoryList");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("categoryList"));

  objc_msgSend(v4, "encodeInteger:forKey:", -[MAAutoAssetUpdatePolicy checkForNewerIntervalSecs](self, "checkForNewerIntervalSecs"), CFSTR("checkForNewerIntervalSecs"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[MAAutoAssetUpdatePolicy checkForNewerTimeoutSecs](self, "checkForNewerTimeoutSecs"), CFSTR("checkForNewerTimeoutSecs"));
  objc_msgSend(v4, "encodeBool:forKey:", -[MAAutoAssetUpdatePolicy checkForNewerAsUserInitiated](self, "checkForNewerAsUserInitiated"), CFSTR("checkForNewerAsUserInitiated"));
  objc_msgSend(v4, "encodeBool:forKey:", -[MAAutoAssetUpdatePolicy checkForNewerWithoutRampEnabled](self, "checkForNewerWithoutRampEnabled"), CFSTR("checkForNewerWithoutRampEnabled"));
  objc_msgSend(v4, "encodeBool:forKey:", -[MAAutoAssetUpdatePolicy newerFoundAutoDownloadPostponed](self, "newerFoundAutoDownloadPostponed"), CFSTR("newerFoundAutoDownloadPostponed"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[MAAutoAssetUpdatePolicy newerFoundAutoDownloadJitterSecs](self, "newerFoundAutoDownloadJitterSecs"), CFSTR("newerFoundAutoDownloadJitterSecs"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[MAAutoAssetUpdatePolicy newerFoundAutoDownloadTimeoutSecs](self, "newerFoundAutoDownloadTimeoutSecs"), CFSTR("newerFoundAutoDownloadTimeoutSecs"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[MAAutoAssetUpdatePolicy newerFoundUserInitiatedDownloadTimeoutSecs](self, "newerFoundUserInitiatedDownloadTimeoutSecs"), CFSTR("newerFoundUserInitiatedDownloadTimeoutSecs"));
  objc_msgSend(v4, "encodeBool:forKey:", -[MAAutoAssetUpdatePolicy revokeIgnoredForUnlockedPurge](self, "revokeIgnoredForUnlockedPurge"), CFSTR("revokeIgnoredForUnlockedPurge"));
  objc_msgSend(v4, "encodeBool:forKey:", -[MAAutoAssetUpdatePolicy revokeIgnoredForLockedContent](self, "revokeIgnoredForLockedContent"), CFSTR("revokeIgnoredForLockedContent"));
  objc_msgSend(v4, "encodeBool:forKey:", -[MAAutoAssetUpdatePolicy revokeTriggersLockedPurge](self, "revokeTriggersLockedPurge"), CFSTR("revokeTriggersLockedPurge"));
  objc_msgSend(v4, "encodeBool:forKey:", -[MAAutoAssetUpdatePolicy allowInterestAcrossTermination](self, "allowInterestAcrossTermination"), CFSTR("allowInterestAcrossTermination"));
  objc_msgSend(v4, "encodeBool:forKey:", -[MAAutoAssetUpdatePolicy allowLockAcrossTermination](self, "allowLockAcrossTermination"), CFSTR("allowLockAcrossTermination"));
  objc_msgSend(v4, "encodeBool:forKey:", -[MAAutoAssetUpdatePolicy allowLockAcrossReboot](self, "allowLockAcrossReboot"), CFSTR("allowLockAcrossReboot"));
  objc_msgSend(v4, "encodeBool:forKey:", -[MAAutoAssetUpdatePolicy allowLockAcrossOTAUpdate](self, "allowLockAcrossOTAUpdate"), CFSTR("allowLockAcrossOTAUpdate"));
  objc_msgSend(v4, "encodeBool:forKey:", -[MAAutoAssetUpdatePolicy allowLockOfRevokedContent](self, "allowLockOfRevokedContent"), CFSTR("allowLockOfRevokedContent"));
  objc_msgSend(v4, "encodeBool:forKey:", -[MAAutoAssetUpdatePolicy allowLockWhenFilesystemSpaceCritical](self, "allowLockWhenFilesystemSpaceCritical"), CFSTR("allowLockWhenFilesystemSpaceCritical"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[MAAutoAssetUpdatePolicy defaultUnlockAfterUsageSecs](self, "defaultUnlockAfterUsageSecs"), CFSTR("defaultUnlockAfterUsageSecs"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[MAAutoAssetUpdatePolicy maximumUnlockAfterUsageSecs](self, "maximumUnlockAfterUsageSecs"), CFSTR("maximumUnlockAfterUsageSecs"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[MAAutoAssetUpdatePolicy defaultPreventGarbageCollectionSecs](self, "defaultPreventGarbageCollectionSecs"), CFSTR("defaultPreventGarbageCollectionSecs"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[MAAutoAssetUpdatePolicy maximumPreventGarbageCollectionSecs](self, "maximumPreventGarbageCollectionSecs"), CFSTR("maximumPreventGarbageCollectionSecs"));
  -[MAAutoAssetUpdatePolicy additionalUpdatePolicyControl](self, "additionalUpdatePolicyControl");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("additionalUpdatePolicyControl"));

  objc_msgSend(v4, "encodeBool:forKey:", -[MAAutoAssetUpdatePolicy allowAutoCheckForNewerWhenBatteryLow](self, "allowAutoCheckForNewerWhenBatteryLow"), CFSTR("allowAutoCheckForNewerWhenBatteryLow"));
  objc_msgSend(v4, "encodeBool:forKey:", -[MAAutoAssetUpdatePolicy allowAutoCheckForNewerWhenCPUHigh](self, "allowAutoCheckForNewerWhenCPUHigh"), CFSTR("allowAutoCheckForNewerWhenCPUHigh"));
  objc_msgSend(v4, "encodeBool:forKey:", -[MAAutoAssetUpdatePolicy allowAutoCheckForNewerOverExpensive](self, "allowAutoCheckForNewerOverExpensive"), CFSTR("allowAutoCheckForNewerOverExpensive"));
  objc_msgSend(v4, "encodeBool:forKey:", -[MAAutoAssetUpdatePolicy allowAutoDownloadWhenBatteryLow](self, "allowAutoDownloadWhenBatteryLow"), CFSTR("allowAutoDownloadWhenBatteryLow"));
  objc_msgSend(v4, "encodeBool:forKey:", -[MAAutoAssetUpdatePolicy allowAutoDownloadWhenCPUHigh](self, "allowAutoDownloadWhenCPUHigh"), CFSTR("allowAutoDownloadWhenCPUHigh"));
  objc_msgSend(v4, "encodeBool:forKey:", -[MAAutoAssetUpdatePolicy blockIfBeforeFirstUnlock](self, "blockIfBeforeFirstUnlock"), CFSTR("blockIfBeforeFirstUnlock"));
  objc_msgSend(v4, "encodeBool:forKey:", -[MAAutoAssetUpdatePolicy blockAutoCheckForNewerOverCellular](self, "blockAutoCheckForNewerOverCellular"), CFSTR("blockAutoCheckForNewerOverCellular"));
  objc_msgSend(v4, "encodeBool:forKey:", -[MAAutoAssetUpdatePolicy blockAutoDownloadOverCellular](self, "blockAutoDownloadOverCellular"), CFSTR("blockAutoDownloadOverCellular"));
  objc_msgSend(v4, "encodeBool:forKey:", -[MAAutoAssetUpdatePolicy blockUserInitiatedDownloadOverCellular](self, "blockUserInitiatedDownloadOverCellular"), CFSTR("blockUserInitiatedDownloadOverCellular"));
  objc_msgSend(v4, "encodeBool:forKey:", -[MAAutoAssetUpdatePolicy blockUserInitiatedDownloadWhenBatteryLow](self, "blockUserInitiatedDownloadWhenBatteryLow"), CFSTR("blockUserInitiatedDownloadWhenBatteryLow"));
  objc_msgSend(v4, "encodeBool:forKey:", -[MAAutoAssetUpdatePolicy blockUserInitiatedDownloadWhenCPUHigh](self, "blockUserInitiatedDownloadWhenCPUHigh"), CFSTR("blockUserInitiatedDownloadWhenCPUHigh"));
  objc_msgSend(v4, "encodeBool:forKey:", -[MAAutoAssetUpdatePolicy blockUserInitiatedDownloadOverExpensive](self, "blockUserInitiatedDownloadOverExpensive"), CFSTR("blockUserInitiatedDownloadOverExpensive"));
  objc_msgSend(v4, "encodeBool:forKey:", -[MAAutoAssetUpdatePolicy downloadWithoutPreferenceForWiFi](self, "downloadWithoutPreferenceForWiFi"), CFSTR("downloadWithoutPreferenceForWiFi"));
  -[MAAutoAssetUpdatePolicy assetAudienceUUID](self, "assetAudienceUUID");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("assetAudienceUUID"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)summary
{
  void *v3;
  void *v4;
  void *v5;
  __CFString *v6;
  void *v7;
  void *v8;
  _BOOL4 v9;
  const __CFString *v10;
  void *v11;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[MAAutoAssetUpdatePolicy updatePolicyName](self, "updatePolicyName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MAAutoAssetUpdatePolicy assetType](self, "assetType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[MAAutoAssetUpdatePolicy assetType](self, "assetType");
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = CFSTR("ALL-ASSET-TYPES");
  }
  +[MAAutoAssetUpdatePolicy activityIntervalString:](MAAutoAssetUpdatePolicy, "activityIntervalString:", -[MAAutoAssetUpdatePolicy checkForNewerIntervalSecs](self, "checkForNewerIntervalSecs"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetUpdatePolicy activityIntervalString:](MAAutoAssetUpdatePolicy, "activityIntervalString:", -[MAAutoAssetUpdatePolicy newerFoundAutoDownloadJitterSecs](self, "newerFoundAutoDownloadJitterSecs"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[MAAutoAssetUpdatePolicy blockIfBeforeFirstUnlock](self, "blockIfBeforeFirstUnlock");
  v10 = CFSTR("N");
  if (v9)
    v10 = CFSTR("Y");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("[%@(%@)|checkForNewerInterval:%@,newerFoundAutoDownloadJitter:%@,blockIfBeforeFirstUnlock:%@]"), v4, v6, v7, v8, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  return v11;
}

- (id)newSummaryDictionary
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v9;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[MAAutoAssetUpdatePolicy updatePolicyName](self, "updatePolicyName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSafeObject:forKey:", v4, CFSTR("updatePolicyName"));

  -[MAAutoAssetUpdatePolicy assetType](self, "assetType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[MAAutoAssetUpdatePolicy assetType](self, "assetType");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setSafeObject:forKey:", v6, CFSTR("assetType"));

  }
  else
  {
    objc_msgSend(v3, "setSafeObject:forKey:", CFSTR("ALL-ASSET-TYPES"), CFSTR("assetType"));
  }

  +[MAAutoAssetUpdatePolicy activityIntervalString:](MAAutoAssetUpdatePolicy, "activityIntervalString:", -[MAAutoAssetUpdatePolicy checkForNewerIntervalSecs](self, "checkForNewerIntervalSecs"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSafeObject:forKey:", v7, CFSTR("checkForNewerIntervalSecs"));

  +[MAAutoAssetUpdatePolicy activityIntervalString:](MAAutoAssetUpdatePolicy, "activityIntervalString:", -[MAAutoAssetUpdatePolicy newerFoundAutoDownloadJitterSecs](self, "newerFoundAutoDownloadJitterSecs"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSafeObject:forKey:", v8, CFSTR("newerFoundAutoDownloadJitterSecs"));

  if (-[MAAutoAssetUpdatePolicy blockIfBeforeFirstUnlock](self, "blockIfBeforeFirstUnlock"))
    v9 = CFSTR("YES");
  else
    v9 = CFSTR("NO");
  objc_msgSend(v3, "setSafeObject:forKey:", v9, CFSTR("blockIfBeforeFirstUnlock"));
  return v3;
}

+ (id)activityIntervalString:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __CFString *v6;
  const __CFString *v7;
  uint64_t v9;
  uint64_t v10;

  if (a3 < 1)
  {
    v6 = CFSTR("DISABLED");
  }
  else
  {
    v3 = (uint64_t)(a3 % 0x15180uLL) % 3600;
    v4 = v3 / 60;
    v5 = v3 % 60;
    if ((unint64_t)a3 >> 7 >= 0x2A3)
    {
      if ((unint64_t)(a3 - 86400) >= 0x15180)
        v7 = CFSTR("s");
      else
        v7 = &stru_1E5D5F930;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%ld day%@ %02ld:%02ld:%02ld"), a3 / 0x15180uLL, v7, (uint64_t)(a3 % 0x15180uLL) / 3600, v4, v5);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%02ld:%02ld:%02ld"), (uint64_t)(a3 % 0x15180uLL) / 3600, v4, v5, v9, v10);
    }
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

- (NSString)updatePolicyName
{
  return self->_updatePolicyName;
}

- (NSString)assetType
{
  return self->_assetType;
}

- (NSArray)categoryList
{
  return self->_categoryList;
}

- (int64_t)checkForNewerIntervalSecs
{
  return self->_checkForNewerIntervalSecs;
}

- (void)setCheckForNewerIntervalSecs:(int64_t)a3
{
  self->_checkForNewerIntervalSecs = a3;
}

- (int64_t)checkForNewerTimeoutSecs
{
  return self->_checkForNewerTimeoutSecs;
}

- (void)setCheckForNewerTimeoutSecs:(int64_t)a3
{
  self->_checkForNewerTimeoutSecs = a3;
}

- (BOOL)checkForNewerAsUserInitiated
{
  return self->_checkForNewerAsUserInitiated;
}

- (void)setCheckForNewerAsUserInitiated:(BOOL)a3
{
  self->_checkForNewerAsUserInitiated = a3;
}

- (BOOL)checkForNewerWithoutRampEnabled
{
  return self->_checkForNewerWithoutRampEnabled;
}

- (void)setCheckForNewerWithoutRampEnabled:(BOOL)a3
{
  self->_checkForNewerWithoutRampEnabled = a3;
}

- (BOOL)newerFoundAutoDownloadPostponed
{
  return self->_newerFoundAutoDownloadPostponed;
}

- (void)setNewerFoundAutoDownloadPostponed:(BOOL)a3
{
  self->_newerFoundAutoDownloadPostponed = a3;
}

- (int64_t)newerFoundAutoDownloadJitterSecs
{
  return self->_newerFoundAutoDownloadJitterSecs;
}

- (void)setNewerFoundAutoDownloadJitterSecs:(int64_t)a3
{
  self->_newerFoundAutoDownloadJitterSecs = a3;
}

- (int64_t)newerFoundAutoDownloadTimeoutSecs
{
  return self->_newerFoundAutoDownloadTimeoutSecs;
}

- (void)setNewerFoundAutoDownloadTimeoutSecs:(int64_t)a3
{
  self->_newerFoundAutoDownloadTimeoutSecs = a3;
}

- (int64_t)newerFoundUserInitiatedDownloadTimeoutSecs
{
  return self->_newerFoundUserInitiatedDownloadTimeoutSecs;
}

- (void)setNewerFoundUserInitiatedDownloadTimeoutSecs:(int64_t)a3
{
  self->_newerFoundUserInitiatedDownloadTimeoutSecs = a3;
}

- (BOOL)revokeIgnoredForUnlockedPurge
{
  return self->_revokeIgnoredForUnlockedPurge;
}

- (void)setRevokeIgnoredForUnlockedPurge:(BOOL)a3
{
  self->_revokeIgnoredForUnlockedPurge = a3;
}

- (BOOL)revokeIgnoredForLockedContent
{
  return self->_revokeIgnoredForLockedContent;
}

- (void)setRevokeIgnoredForLockedContent:(BOOL)a3
{
  self->_revokeIgnoredForLockedContent = a3;
}

- (BOOL)revokeTriggersLockedPurge
{
  return self->_revokeTriggersLockedPurge;
}

- (void)setRevokeTriggersLockedPurge:(BOOL)a3
{
  self->_revokeTriggersLockedPurge = a3;
}

- (BOOL)allowInterestAcrossTermination
{
  return self->_allowInterestAcrossTermination;
}

- (void)setAllowInterestAcrossTermination:(BOOL)a3
{
  self->_allowInterestAcrossTermination = a3;
}

- (BOOL)allowLockAcrossTermination
{
  return self->_allowLockAcrossTermination;
}

- (void)setAllowLockAcrossTermination:(BOOL)a3
{
  self->_allowLockAcrossTermination = a3;
}

- (BOOL)allowLockAcrossReboot
{
  return self->_allowLockAcrossReboot;
}

- (void)setAllowLockAcrossReboot:(BOOL)a3
{
  self->_allowLockAcrossReboot = a3;
}

- (BOOL)allowLockAcrossOTAUpdate
{
  return self->_allowLockAcrossOTAUpdate;
}

- (void)setAllowLockAcrossOTAUpdate:(BOOL)a3
{
  self->_allowLockAcrossOTAUpdate = a3;
}

- (BOOL)allowLockOfRevokedContent
{
  return self->_allowLockOfRevokedContent;
}

- (void)setAllowLockOfRevokedContent:(BOOL)a3
{
  self->_allowLockOfRevokedContent = a3;
}

- (BOOL)allowLockWhenFilesystemSpaceCritical
{
  return self->_allowLockWhenFilesystemSpaceCritical;
}

- (void)setAllowLockWhenFilesystemSpaceCritical:(BOOL)a3
{
  self->_allowLockWhenFilesystemSpaceCritical = a3;
}

- (int64_t)defaultUnlockAfterUsageSecs
{
  return self->_defaultUnlockAfterUsageSecs;
}

- (void)setDefaultUnlockAfterUsageSecs:(int64_t)a3
{
  self->_defaultUnlockAfterUsageSecs = a3;
}

- (int64_t)maximumUnlockAfterUsageSecs
{
  return self->_maximumUnlockAfterUsageSecs;
}

- (void)setMaximumUnlockAfterUsageSecs:(int64_t)a3
{
  self->_maximumUnlockAfterUsageSecs = a3;
}

- (int64_t)defaultPreventGarbageCollectionSecs
{
  return self->_defaultPreventGarbageCollectionSecs;
}

- (void)setDefaultPreventGarbageCollectionSecs:(int64_t)a3
{
  self->_defaultPreventGarbageCollectionSecs = a3;
}

- (int64_t)maximumPreventGarbageCollectionSecs
{
  return self->_maximumPreventGarbageCollectionSecs;
}

- (void)setMaximumPreventGarbageCollectionSecs:(int64_t)a3
{
  self->_maximumPreventGarbageCollectionSecs = a3;
}

- (NSDictionary)additionalUpdatePolicyControl
{
  return self->_additionalUpdatePolicyControl;
}

- (void)setAdditionalUpdatePolicyControl:(id)a3
{
  objc_storeStrong((id *)&self->_additionalUpdatePolicyControl, a3);
}

- (BOOL)allowAutoCheckForNewerWhenBatteryLow
{
  return self->_allowAutoCheckForNewerWhenBatteryLow;
}

- (void)setAllowAutoCheckForNewerWhenBatteryLow:(BOOL)a3
{
  self->_allowAutoCheckForNewerWhenBatteryLow = a3;
}

- (BOOL)allowAutoCheckForNewerWhenCPUHigh
{
  return self->_allowAutoCheckForNewerWhenCPUHigh;
}

- (void)setAllowAutoCheckForNewerWhenCPUHigh:(BOOL)a3
{
  self->_allowAutoCheckForNewerWhenCPUHigh = a3;
}

- (BOOL)allowAutoCheckForNewerOverExpensive
{
  return self->_allowAutoCheckForNewerOverExpensive;
}

- (void)setAllowAutoCheckForNewerOverExpensive:(BOOL)a3
{
  self->_allowAutoCheckForNewerOverExpensive = a3;
}

- (BOOL)allowAutoDownloadWhenBatteryLow
{
  return self->_allowAutoDownloadWhenBatteryLow;
}

- (void)setAllowAutoDownloadWhenBatteryLow:(BOOL)a3
{
  self->_allowAutoDownloadWhenBatteryLow = a3;
}

- (BOOL)allowAutoDownloadWhenCPUHigh
{
  return self->_allowAutoDownloadWhenCPUHigh;
}

- (void)setAllowAutoDownloadWhenCPUHigh:(BOOL)a3
{
  self->_allowAutoDownloadWhenCPUHigh = a3;
}

- (BOOL)blockIfBeforeFirstUnlock
{
  return self->_blockIfBeforeFirstUnlock;
}

- (void)setBlockIfBeforeFirstUnlock:(BOOL)a3
{
  self->_blockIfBeforeFirstUnlock = a3;
}

- (BOOL)blockAutoCheckForNewerOverCellular
{
  return self->_blockAutoCheckForNewerOverCellular;
}

- (void)setBlockAutoCheckForNewerOverCellular:(BOOL)a3
{
  self->_blockAutoCheckForNewerOverCellular = a3;
}

- (BOOL)blockAutoDownloadOverCellular
{
  return self->_blockAutoDownloadOverCellular;
}

- (void)setBlockAutoDownloadOverCellular:(BOOL)a3
{
  self->_blockAutoDownloadOverCellular = a3;
}

- (BOOL)blockUserInitiatedDownloadOverCellular
{
  return self->_blockUserInitiatedDownloadOverCellular;
}

- (void)setBlockUserInitiatedDownloadOverCellular:(BOOL)a3
{
  self->_blockUserInitiatedDownloadOverCellular = a3;
}

- (BOOL)blockUserInitiatedDownloadWhenBatteryLow
{
  return self->_blockUserInitiatedDownloadWhenBatteryLow;
}

- (void)setBlockUserInitiatedDownloadWhenBatteryLow:(BOOL)a3
{
  self->_blockUserInitiatedDownloadWhenBatteryLow = a3;
}

- (BOOL)blockUserInitiatedDownloadWhenCPUHigh
{
  return self->_blockUserInitiatedDownloadWhenCPUHigh;
}

- (void)setBlockUserInitiatedDownloadWhenCPUHigh:(BOOL)a3
{
  self->_blockUserInitiatedDownloadWhenCPUHigh = a3;
}

- (BOOL)blockUserInitiatedDownloadOverExpensive
{
  return self->_blockUserInitiatedDownloadOverExpensive;
}

- (void)setBlockUserInitiatedDownloadOverExpensive:(BOOL)a3
{
  self->_blockUserInitiatedDownloadOverExpensive = a3;
}

- (BOOL)downloadWithoutPreferenceForWiFi
{
  return self->_downloadWithoutPreferenceForWiFi;
}

- (void)setDownloadWithoutPreferenceForWiFi:(BOOL)a3
{
  self->_downloadWithoutPreferenceForWiFi = a3;
}

- (id)limitCellularByRestrictedTimePeriods
{
  return self->_limitCellularByRestrictedTimePeriods;
}

- (void)setLimitCellularByRestrictedTimePeriods:(id)a3
{
  objc_storeStrong(&self->_limitCellularByRestrictedTimePeriods, a3);
}

- (id)limitWiFiByRestrictedTimePeriods
{
  return self->_limitWiFiByRestrictedTimePeriods;
}

- (void)setLimitWiFiByRestrictedTimePeriods:(id)a3
{
  objc_storeStrong(&self->_limitWiFiByRestrictedTimePeriods, a3);
}

- (id)limitCellularByFeeAgreement
{
  return self->_limitCellularByFeeAgreement;
}

- (void)setLimitCellularByFeeAgreement:(id)a3
{
  objc_storeStrong(&self->_limitCellularByFeeAgreement, a3);
}

- (id)limitByNetworkType
{
  return self->_limitByNetworkType;
}

- (void)setLimitByNetworkType:(id)a3
{
  objc_storeStrong(&self->_limitByNetworkType, a3);
}

- (NSUUID)assetAudienceUUID
{
  return self->_assetAudienceUUID;
}

- (void)setAssetAudienceUUID:(id)a3
{
  objc_storeStrong((id *)&self->_assetAudienceUUID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetAudienceUUID, 0);
  objc_storeStrong(&self->_limitByNetworkType, 0);
  objc_storeStrong(&self->_limitCellularByFeeAgreement, 0);
  objc_storeStrong(&self->_limitWiFiByRestrictedTimePeriods, 0);
  objc_storeStrong(&self->_limitCellularByRestrictedTimePeriods, 0);
  objc_storeStrong((id *)&self->_additionalUpdatePolicyControl, 0);
  objc_storeStrong((id *)&self->_categoryList, 0);
  objc_storeStrong((id *)&self->_assetType, 0);
  objc_storeStrong((id *)&self->_updatePolicyName, 0);
}

@end
