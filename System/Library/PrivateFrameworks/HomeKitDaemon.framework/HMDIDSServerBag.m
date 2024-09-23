@implementation HMDIDSServerBag

- (HMDIDSServerBag)init
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  int v10;
  __CFString *v11;
  __CFString *v12;
  void *v13;
  HMDIDSServerBag *v14;
  NSObject *v15;
  void *v16;
  HMDIDSServerBag *v17;
  int v19;
  void *v20;
  __int16 v21;
  __CFString *v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  double v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE4FCB0], "sharedInstanceForBagType:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE3F248], "sharedPreferences");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "preferenceForKey:", CFSTR("idsServerBagMaximumPollInterval"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "numberValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "doubleValue");
  v8 = v7;

  if (fabs(v8) < 2.22044605e-16)
    _HMFPreconditionFailure();
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE3F170]), "initWithMinimumTimeInterval:maximumTimeInterval:exponentialFactor:options:", 2, 12, 30.0, v8);
  v10 = isInternalBuild();
  v11 = &stru_24E79DB48;
  if (v10)
    v11 = CFSTR("-internal");
  v12 = v11;
  v13 = (void *)MEMORY[0x227676638]();
  v14 = self;
  HMFGetOSLogHandle();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 138544130;
    v20 = v16;
    v21 = 2112;
    v22 = v12;
    v23 = 2048;
    v24 = 0x403E000000000000;
    v25 = 2048;
    v26 = v8;
    _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_INFO, "%{public}@Initializing using key suffix %@ with initial timer interval of %fs and maximum of %fs", (uint8_t *)&v19, 0x2Au);

  }
  objc_autoreleasePoolPop(v13);
  v17 = -[HMDIDSServerBag initWithIDSServerBag:refreshTimer:keySuffix:](v14, "initWithIDSServerBag:refreshTimer:keySuffix:", v3, v9, v12);

  return v17;
}

- (HMDIDSServerBag)initWithIDSServerBag:(id)a3 refreshTimer:(id)a4 keySuffix:(id)a5
{
  id v9;
  id v10;
  id v11;
  HMDIDSServerBag *v12;
  HMDIDSServerBag *v13;
  uint64_t v14;
  NSString *keySuffix;
  NSNumber *hh2AutoMigrationWithoutSharedUserRampDivisor;
  NSNumber *hh2AutoMigrationWithoutSharedUserRampRemainder;
  NSNumber *hh2AutoMigrationWithSharedUserRampDivisor;
  NSNumber *hh2AutoMigrationWithSharedUserRampRemainder;
  HMDHomeKitVersion *v20;
  HMDHomeKitVersion *v21;
  HMDHomeKitVersion *minimumHomeKitVersionForSharedUserHH2MigrationByOwnerManual;
  HMDHomeKitVersion *minimumHomeKitVersionForOwnerResidentDevicesAutoHH2MigrationWithSharedUsers;
  objc_super v25;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v25.receiver = self;
  v25.super_class = (Class)HMDIDSServerBag;
  v12 = -[HMDIDSServerBag init](&v25, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_idsServerBag, a3);
    objc_storeStrong((id *)&v13->_refreshTimer, a4);
    v14 = objc_msgSend(v11, "copy");
    keySuffix = v13->_keySuffix;
    v13->_keySuffix = (NSString *)v14;

    hh2AutoMigrationWithoutSharedUserRampDivisor = v13->_hh2AutoMigrationWithoutSharedUserRampDivisor;
    v13->_hh2AutoMigrationWithoutSharedUserRampDivisor = (NSNumber *)&unk_24E96B6C0;

    hh2AutoMigrationWithoutSharedUserRampRemainder = v13->_hh2AutoMigrationWithoutSharedUserRampRemainder;
    v13->_hh2AutoMigrationWithoutSharedUserRampRemainder = (NSNumber *)&unk_24E96B6D8;

    hh2AutoMigrationWithSharedUserRampDivisor = v13->_hh2AutoMigrationWithSharedUserRampDivisor;
    v13->_hh2AutoMigrationWithSharedUserRampDivisor = (NSNumber *)&unk_24E96B6C0;

    hh2AutoMigrationWithSharedUserRampRemainder = v13->_hh2AutoMigrationWithSharedUserRampRemainder;
    v13->_hh2AutoMigrationWithSharedUserRampRemainder = (NSNumber *)&unk_24E96B6D8;

    v20 = -[HMDHomeKitVersion initWithVersionString:]([HMDHomeKitVersion alloc], "initWithVersionString:", CFSTR("9999"));
    v21 = -[HMDHomeKitVersion initWithVersionString:]([HMDHomeKitVersion alloc], "initWithVersionString:", CFSTR("10.4"));
    minimumHomeKitVersionForSharedUserHH2MigrationByOwnerManual = v13->_minimumHomeKitVersionForSharedUserHH2MigrationByOwnerManual;
    v13->_minimumHomeKitVersionForSharedUserHH2MigrationByOwnerManual = v21;

    objc_storeStrong((id *)&v13->_minimumHomeKitVersionForSharedUserHH2MigrationByOwnerAuto, v20);
    objc_storeStrong((id *)&v13->_minimumHomeKitVersionForOwnerMeDeviceAutoHH2MigrationWithoutSharedUsers, v20);
    objc_storeStrong((id *)&v13->_minimumHomeKitVersionForOwnerOtherDevicesAutoHH2MigrationWithoutSharedUsers, v20);
    objc_storeStrong((id *)&v13->_minimumHomeKitVersionForOwnerResidentDevicesAutoHH2MigrationWithoutSharedUsers, v20);
    objc_storeStrong((id *)&v13->_minimumHomeKitVersionForOwnerMeDeviceAutoHH2MigrationWithSharedUsers, v20);
    objc_storeStrong((id *)&v13->_minimumHomeKitVersionForOwnerOtherDevicesAutoHH2MigrationWithSharedUsers, v20);
    minimumHomeKitVersionForOwnerResidentDevicesAutoHH2MigrationWithSharedUsers = v13->_minimumHomeKitVersionForOwnerResidentDevicesAutoHH2MigrationWithSharedUsers;
    v13->_minimumHomeKitVersionForOwnerResidentDevicesAutoHH2MigrationWithSharedUsers = v20;

  }
  return v13;
}

- (void)configure
{
  void *v3;
  void *v4;

  -[HMDIDSServerBag refreshTimer](self, "refreshTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDelegate:", self);

  -[HMDIDSServerBag refreshTimer](self, "refreshTimer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "resume");

  -[HMDIDSServerBag updateCachedValuesWithServerValues](self);
}

- (void)timerDidFire:(id)a3
{
  id v4;
  id v5;
  void *v6;
  HMDIDSServerBag *v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDIDSServerBag refreshTimer](self, "refreshTimer");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
  {
    v6 = (void *)MEMORY[0x227676638]();
    v7 = self;
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543362;
      v11 = v9;
      _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_INFO, "%{public}@Server bag refresh timer fired", (uint8_t *)&v10, 0xCu);

    }
    objc_autoreleasePoolPop(v6);
    -[HMDIDSServerBag updateCachedValuesWithServerValues](v7);
  }

}

- (HMDIDSServerBagDelegate)delegate
{
  return (HMDIDSServerBagDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)isHH2SoftwareReleased
{
  return self->_hh2SoftwareReleased;
}

- (void)setHh2SoftwareReleased:(BOOL)a3
{
  self->_hh2SoftwareReleased = a3;
}

- (BOOL)isHH2ManualMigrationEnabled
{
  return self->_hh2ManualMigrationEnabled;
}

- (void)setHh2ManualMigrationEnabled:(BOOL)a3
{
  self->_hh2ManualMigrationEnabled = a3;
}

- (BOOL)isHH2AutoMigrationEnabled
{
  return self->_hh2AutoMigrationEnabled;
}

- (void)setHh2AutoMigrationEnabled:(BOOL)a3
{
  self->_hh2AutoMigrationEnabled = a3;
}

- (HMDHomeKitVersion)minimumHomeKitVersionForSharedUserHH2MigrationByOwnerManual
{
  return (HMDHomeKitVersion *)objc_getProperty(self, a2, 24, 1);
}

- (void)setMinimumHomeKitVersionForSharedUserHH2MigrationByOwnerManual:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (HMDHomeKitVersion)minimumHomeKitVersionForSharedUserHH2MigrationByOwnerAuto
{
  return (HMDHomeKitVersion *)objc_getProperty(self, a2, 32, 1);
}

- (void)setMinimumHomeKitVersionForSharedUserHH2MigrationByOwnerAuto:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (HMDHomeKitVersion)minimumHomeKitVersionForOwnerMeDeviceAutoHH2MigrationWithoutSharedUsers
{
  return (HMDHomeKitVersion *)objc_getProperty(self, a2, 40, 1);
}

- (void)setMinimumHomeKitVersionForOwnerMeDeviceAutoHH2MigrationWithoutSharedUsers:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (HMDHomeKitVersion)minimumHomeKitVersionForOwnerOtherDevicesAutoHH2MigrationWithoutSharedUsers
{
  return (HMDHomeKitVersion *)objc_getProperty(self, a2, 48, 1);
}

- (void)setMinimumHomeKitVersionForOwnerOtherDevicesAutoHH2MigrationWithoutSharedUsers:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (HMDHomeKitVersion)minimumHomeKitVersionForOwnerResidentDevicesAutoHH2MigrationWithoutSharedUsers
{
  return (HMDHomeKitVersion *)objc_getProperty(self, a2, 56, 1);
}

- (void)setMinimumHomeKitVersionForOwnerResidentDevicesAutoHH2MigrationWithoutSharedUsers:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (HMDHomeKitVersion)minimumHomeKitVersionForOwnerMeDeviceAutoHH2MigrationWithSharedUsers
{
  return (HMDHomeKitVersion *)objc_getProperty(self, a2, 64, 1);
}

- (void)setMinimumHomeKitVersionForOwnerMeDeviceAutoHH2MigrationWithSharedUsers:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (HMDHomeKitVersion)minimumHomeKitVersionForOwnerOtherDevicesAutoHH2MigrationWithSharedUsers
{
  return (HMDHomeKitVersion *)objc_getProperty(self, a2, 72, 1);
}

- (void)setMinimumHomeKitVersionForOwnerOtherDevicesAutoHH2MigrationWithSharedUsers:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (HMDHomeKitVersion)minimumHomeKitVersionForOwnerResidentDevicesAutoHH2MigrationWithSharedUsers
{
  return (HMDHomeKitVersion *)objc_getProperty(self, a2, 80, 1);
}

- (void)setMinimumHomeKitVersionForOwnerResidentDevicesAutoHH2MigrationWithSharedUsers:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (BOOL)hh2SuppressDuplicateUserModelBulletins
{
  return self->_hh2SuppressDuplicateUserModelBulletins;
}

- (void)setHh2SuppressDuplicateUserModelBulletins:(BOOL)a3
{
  self->_hh2SuppressDuplicateUserModelBulletins = a3;
}

- (BOOL)homeSafetySecurityEnabled
{
  return self->_homeSafetySecurityEnabled;
}

- (void)setHomeSafetySecurityEnabled:(BOOL)a3
{
  self->_homeSafetySecurityEnabled = a3;
}

- (NSNumber)hh2AutoMigrationWithoutSharedUserRampDivisor
{
  return (NSNumber *)objc_getProperty(self, a2, 88, 1);
}

- (void)setHh2AutoMigrationWithoutSharedUserRampDivisor:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (NSNumber)hh2AutoMigrationWithoutSharedUserRampRemainder
{
  return (NSNumber *)objc_getProperty(self, a2, 96, 1);
}

- (void)setHh2AutoMigrationWithoutSharedUserRampRemainder:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (NSNumber)hh2AutoMigrationWithSharedUserRampDivisor
{
  return (NSNumber *)objc_getProperty(self, a2, 104, 1);
}

- (void)setHh2AutoMigrationWithSharedUserRampDivisor:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

- (NSNumber)hh2AutoMigrationWithSharedUserRampRemainder
{
  return (NSNumber *)objc_getProperty(self, a2, 112, 1);
}

- (void)setHh2AutoMigrationWithSharedUserRampRemainder:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 112);
}

- (BOOL)statusKitResidentStatusEnabled
{
  return self->_statusKitResidentStatusEnabled;
}

- (void)setStatusKitResidentStatusEnabled:(BOOL)a3
{
  self->_statusKitResidentStatusEnabled = a3;
}

- (NSNumber)statusKitInitialConnectionTimeoutSeconds
{
  return (NSNumber *)objc_getProperty(self, a2, 120, 1);
}

- (void)setStatusKitInitialConnectionTimeoutSeconds:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 120);
}

- (NSNumber)statusKitConnectionTTSUNoReachablePrimaryTimeoutSeconds
{
  return (NSNumber *)objc_getProperty(self, a2, 128, 1);
}

- (void)setStatusKitConnectionTTSUNoReachablePrimaryTimeoutSeconds:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 128);
}

- (NSNumber)statusKitUnsubscribeFromChannelDebounceTimeSec
{
  return (NSNumber *)objc_getProperty(self, a2, 136, 1);
}

- (void)setStatusKitUnsubscribeFromChannelDebounceTimeSec:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 136);
}

- (NSNumber)residentSelectionPreferredResidentEvaluationDelay
{
  return (NSNumber *)objc_getProperty(self, a2, 144, 1);
}

- (void)setResidentSelectionPreferredResidentEvaluationDelay:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 144);
}

- (NSNumber)residentSelectionPreferredResidentsListMaxSize
{
  return (NSNumber *)objc_getProperty(self, a2, 152, 1);
}

- (void)setResidentSelectionPreferredResidentsListMaxSize:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 152);
}

- (NSNumber)residentSelectionStatusDebounceInterval
{
  return (NSNumber *)objc_getProperty(self, a2, 160, 1);
}

- (void)setResidentSelectionStatusDebounceInterval:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 160);
}

- (NSNumber)residentSelectionTakeOverIfPrimaryIsNotViableInterval
{
  return (NSNumber *)objc_getProperty(self, a2, 168, 1);
}

- (void)setResidentSelectionTakeOverIfPrimaryIsNotViableInterval:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 168);
}

- (NSNumber)residentSelectionTakeOverInterval
{
  return (NSNumber *)objc_getProperty(self, a2, 176, 1);
}

- (void)setResidentSelectionTakeOverInterval:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 176);
}

- (NSNumber)residentSelectionTakeOverOnlyIfCurrentPrimaryIsNotViableJitter
{
  return (NSNumber *)objc_getProperty(self, a2, 184, 1);
}

- (void)setResidentSelectionTakeOverOnlyIfCurrentPrimaryIsNotViableJitter:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 184);
}

- (NSNumber)residentSelectionPreferredListGenerationStartHour
{
  return (NSNumber *)objc_getProperty(self, a2, 192, 1);
}

- (void)setResidentSelectionPreferredListGenerationStartHour:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 192);
}

- (NSNumber)residentSelectionPreferredListGenerationEndHour
{
  return (NSNumber *)objc_getProperty(self, a2, 200, 1);
}

- (void)setResidentSelectionPreferredListGenerationEndHour:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 200);
}

- (HMDHomeKitVersion)residentSelectionMinHomeKitVersion
{
  return (HMDHomeKitVersion *)objc_getProperty(self, a2, 208, 1);
}

- (void)setResidentSelectionMinHomeKitVersion:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 208);
}

- (NSNumber)residentSelectionReachabilityNotificationAfterConnectivityDelay
{
  return (NSNumber *)objc_getProperty(self, a2, 216, 1);
}

- (void)setResidentSelectionReachabilityNotificationAfterConnectivityDelay:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 216);
}

- (NSNumber)residentSelectionUserPreferredReachabilityNotificationDelay
{
  return (NSNumber *)objc_getProperty(self, a2, 224, 1);
}

- (void)setResidentSelectionUserPreferredReachabilityNotificationDelay:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 224);
}

- (NSNumber)residentDeviceManagerBlockPrimaryTakeoverDurationSeconds
{
  return (NSNumber *)objc_getProperty(self, a2, 232, 1);
}

- (void)setResidentDeviceManagerBlockPrimaryTakeoverDurationSeconds:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 232);
}

- (IDSServerBag)idsServerBag
{
  return (IDSServerBag *)objc_getProperty(self, a2, 240, 1);
}

- (HMFTimer)refreshTimer
{
  return (HMFTimer *)objc_getProperty(self, a2, 248, 1);
}

- (NSString)keySuffix
{
  return (NSString *)objc_getProperty(self, a2, 256, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keySuffix, 0);
  objc_storeStrong((id *)&self->_refreshTimer, 0);
  objc_storeStrong((id *)&self->_idsServerBag, 0);
  objc_storeStrong((id *)&self->_residentDeviceManagerBlockPrimaryTakeoverDurationSeconds, 0);
  objc_storeStrong((id *)&self->_residentSelectionUserPreferredReachabilityNotificationDelay, 0);
  objc_storeStrong((id *)&self->_residentSelectionReachabilityNotificationAfterConnectivityDelay, 0);
  objc_storeStrong((id *)&self->_residentSelectionMinHomeKitVersion, 0);
  objc_storeStrong((id *)&self->_residentSelectionPreferredListGenerationEndHour, 0);
  objc_storeStrong((id *)&self->_residentSelectionPreferredListGenerationStartHour, 0);
  objc_storeStrong((id *)&self->_residentSelectionTakeOverOnlyIfCurrentPrimaryIsNotViableJitter, 0);
  objc_storeStrong((id *)&self->_residentSelectionTakeOverInterval, 0);
  objc_storeStrong((id *)&self->_residentSelectionTakeOverIfPrimaryIsNotViableInterval, 0);
  objc_storeStrong((id *)&self->_residentSelectionStatusDebounceInterval, 0);
  objc_storeStrong((id *)&self->_residentSelectionPreferredResidentsListMaxSize, 0);
  objc_storeStrong((id *)&self->_residentSelectionPreferredResidentEvaluationDelay, 0);
  objc_storeStrong((id *)&self->_statusKitUnsubscribeFromChannelDebounceTimeSec, 0);
  objc_storeStrong((id *)&self->_statusKitConnectionTTSUNoReachablePrimaryTimeoutSeconds, 0);
  objc_storeStrong((id *)&self->_statusKitInitialConnectionTimeoutSeconds, 0);
  objc_storeStrong((id *)&self->_hh2AutoMigrationWithSharedUserRampRemainder, 0);
  objc_storeStrong((id *)&self->_hh2AutoMigrationWithSharedUserRampDivisor, 0);
  objc_storeStrong((id *)&self->_hh2AutoMigrationWithoutSharedUserRampRemainder, 0);
  objc_storeStrong((id *)&self->_hh2AutoMigrationWithoutSharedUserRampDivisor, 0);
  objc_storeStrong((id *)&self->_minimumHomeKitVersionForOwnerResidentDevicesAutoHH2MigrationWithSharedUsers, 0);
  objc_storeStrong((id *)&self->_minimumHomeKitVersionForOwnerOtherDevicesAutoHH2MigrationWithSharedUsers, 0);
  objc_storeStrong((id *)&self->_minimumHomeKitVersionForOwnerMeDeviceAutoHH2MigrationWithSharedUsers, 0);
  objc_storeStrong((id *)&self->_minimumHomeKitVersionForOwnerResidentDevicesAutoHH2MigrationWithoutSharedUsers, 0);
  objc_storeStrong((id *)&self->_minimumHomeKitVersionForOwnerOtherDevicesAutoHH2MigrationWithoutSharedUsers, 0);
  objc_storeStrong((id *)&self->_minimumHomeKitVersionForOwnerMeDeviceAutoHH2MigrationWithoutSharedUsers, 0);
  objc_storeStrong((id *)&self->_minimumHomeKitVersionForSharedUserHH2MigrationByOwnerAuto, 0);
  objc_storeStrong((id *)&self->_minimumHomeKitVersionForSharedUserHH2MigrationByOwnerManual, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)updateCachedValuesWithServerValues
{
  uint64_t v2;
  void *v3;
  int v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  id v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  char v32;
  int v33;
  void *v34;
  id v35;
  NSObject *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  char v41;
  void *v42;
  id v43;
  NSObject *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  char v49;
  void *v50;
  id v51;
  NSObject *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  char v57;
  void *v58;
  id v59;
  NSObject *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  int v65;
  void *v66;
  id v67;
  NSObject *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  id v73;
  NSObject *v74;
  void *v75;
  void *v76;
  void *v77;
  int v78;
  void *v79;
  id v80;
  NSObject *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  id v86;
  NSObject *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  id v92;
  NSObject *v93;
  void *v94;
  void *v95;
  void *v96;
  int v97;
  void *v98;
  id v99;
  NSObject *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  id v105;
  NSObject *v106;
  void *v107;
  int v108;
  void *v109;
  void *v110;
  void *v111;
  id v112;
  NSObject *v113;
  void *v114;
  int v115;
  void *v116;
  int v117;
  void *v118;
  id v119;
  NSObject *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  int v125;
  void *v126;
  id v127;
  NSObject *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  int v133;
  void *v134;
  id v135;
  NSObject *v136;
  void *v137;
  void *v138;
  void *v139;
  int v140;
  void *v141;
  void *v142;
  char v143;
  void *v144;
  id v145;
  NSObject *v146;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  char v151;
  void *v152;
  id v153;
  NSObject *v154;
  void *v155;
  void *v156;
  void *v157;
  void *v158;
  char v159;
  void *v160;
  id v161;
  NSObject *v162;
  void *v163;
  void *v164;
  void *v165;
  void *v166;
  char v167;
  int v168;
  void *v169;
  id v170;
  NSObject *v171;
  void *v172;
  void *v173;
  void *v174;
  void *v175;
  char v176;
  void *v177;
  id v178;
  NSObject *v179;
  void *v180;
  void *v181;
  void *v182;
  void *v183;
  char v184;
  void *v185;
  id v186;
  NSObject *v187;
  void *v188;
  void *v189;
  void *v190;
  void *v191;
  char v192;
  void *v193;
  id v194;
  NSObject *v195;
  void *v196;
  void *v197;
  void *v198;
  void *v199;
  char v200;
  void *v201;
  id v202;
  NSObject *v203;
  void *v204;
  void *v205;
  void *v206;
  void *v207;
  char v208;
  void *v209;
  id v210;
  NSObject *v211;
  void *v212;
  void *v213;
  void *v214;
  void *v215;
  char v216;
  void *v217;
  id v218;
  NSObject *v219;
  void *v220;
  void *v221;
  void *v222;
  void *v223;
  char v224;
  void *v225;
  id v226;
  NSObject *v227;
  void *v228;
  void *v229;
  void *v230;
  void *v231;
  void *v232;
  id v233;
  NSObject *v234;
  void *v235;
  void *v236;
  void *v237;
  char v238;
  void *v239;
  id v240;
  NSObject *v241;
  void *v242;
  void *v243;
  void *v244;
  void *v245;
  char v246;
  void *v247;
  id v248;
  NSObject *v249;
  void *v250;
  void *v251;
  void *v252;
  void *v253;
  char v254;
  int v255;
  void *v256;
  void *v257;
  id v258;
  NSObject *v259;
  void *v260;
  void *v261;
  void *v262;
  id v263;
  NSObject *v264;
  void *v265;
  void *v266;
  void *v267;
  int v268;
  int v269;
  void *v270;
  void *v271;
  void *v272;
  void *v273;
  uint8_t buf[4];
  void *v275;
  __int16 v276;
  void *v277;
  __int16 v278;
  void *v279;
  uint64_t v280;

  v280 = *MEMORY[0x24BDAC8D0];
  if (a1)
  {
    -[HMDIDSServerBag serverBagNumberValueForKey:](a1, CFSTR("hh2SoftwareReleased"));
    v2 = objc_claimAutoreleasedReturnValue();
    v273 = (void *)v2;
    if (!v2
      || (v3 = (void *)v2,
          v4 = objc_msgSend(a1, "isHH2SoftwareReleased"),
          v4 == objc_msgSend(v3, "BOOLValue")))
    {
      v11 = 0;
    }
    else
    {
      v5 = (void *)MEMORY[0x227676638]();
      v6 = a1;
      HMFGetOSLogHandle();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "isHH2SoftwareReleased");
        HMFBooleanToString();
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "BOOLValue");
        HMFBooleanToString();
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v275 = v8;
        v276 = 2112;
        v277 = v9;
        v278 = 2112;
        v279 = v10;
        _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Updating hh2SoftwareReleased from %@ to %@", buf, 0x20u);

        v3 = v273;
      }

      objc_autoreleasePoolPop(v5);
      objc_msgSend(v6, "setHh2SoftwareReleased:", objc_msgSend(v3, "BOOLValue"));
      v11 = 1;
    }
    -[HMDIDSServerBag serverBagNumberValueForKey:](a1, CFSTR("hh2ManualMigrationEnabledV2"));
    v12 = objc_claimAutoreleasedReturnValue();
    -[HMDIDSServerBag serverBagNumberValueForKey:](a1, CFSTR("home-rme-c"));
    v13 = objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend((id)v12, "BOOLValue") & 1) != 0)
      v14 = 1;
    else
      v14 = objc_msgSend((id)v13, "BOOLValue");
    v271 = (void *)v13;
    v272 = (void *)v12;
    if (v12 | v13 && (_DWORD)v14 != objc_msgSend(a1, "isHH2ManualMigrationEnabled"))
    {
      v15 = (void *)MEMORY[0x227676638]();
      v16 = a1;
      HMFGetOSLogHandle();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "isHH2ManualMigrationEnabled");
        HMFBooleanToString();
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        HMFBooleanToString();
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v275 = v18;
        v276 = 2112;
        v277 = v19;
        v278 = 2112;
        v279 = v20;
        _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_INFO, "%{public}@Updating hh2ManualMigrationEnabled from %@ to %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v15);
      objc_msgSend(v16, "setHh2ManualMigrationEnabled:", v14);
      v11 = 1;
    }
    -[HMDIDSServerBag serverBagNumberValueForKey:](a1, CFSTR("hh2AutoMigrationEnabledV2"));
    v21 = objc_claimAutoreleasedReturnValue();
    -[HMDIDSServerBag serverBagNumberValueForKey:](a1, CFSTR("home-rae-c"));
    v22 = objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend((id)v21, "BOOLValue") & 1) != 0)
      v23 = 1;
    else
      v23 = objc_msgSend((id)v22, "BOOLValue");
    if (v21 | v22 && (_DWORD)v23 != objc_msgSend(a1, "isHH2AutoMigrationEnabled"))
    {
      v24 = (void *)MEMORY[0x227676638]();
      v25 = a1;
      HMFGetOSLogHandle();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "isHH2AutoMigrationEnabled");
        HMFBooleanToString();
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        HMFBooleanToString();
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v275 = v27;
        v276 = 2112;
        v277 = v28;
        v278 = 2112;
        v279 = v29;
        _os_log_impl(&dword_2218F0000, v26, OS_LOG_TYPE_INFO, "%{public}@Updating hh2AutoMigrationEnabled from %@ to %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v24);
      objc_msgSend(v25, "setHh2AutoMigrationEnabled:", v23);
      v11 = 1;
    }
    -[HMDIDSServerBag serverBagNumberValueForKey:](a1, CFSTR("home-ramrd"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v267 = (void *)v21;
    v270 = (void *)v22;
    if (v30
      && (objc_msgSend(a1, "hh2AutoMigrationWithoutSharedUserRampDivisor"),
          v31 = (void *)objc_claimAutoreleasedReturnValue(),
          v32 = objc_msgSend(v31, "isEqual:", v30),
          v31,
          (v32 & 1) == 0))
    {
      v34 = (void *)MEMORY[0x227676638]();
      v35 = a1;
      HMFGetOSLogHandle();
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "hh2AutoMigrationWithoutSharedUserRampDivisor");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v275 = v37;
        v276 = 2112;
        v277 = v38;
        v278 = 2112;
        v279 = v30;
        _os_log_impl(&dword_2218F0000, v36, OS_LOG_TYPE_INFO, "%{public}@Updating hh2AutoMigrationWithoutSharedUserRampDivisor from %@ to %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v34);
      objc_msgSend(v35, "setHh2AutoMigrationWithoutSharedUserRampDivisor:", v30);
      v33 = 1;
    }
    else
    {
      v33 = 0;
    }

    -[HMDIDSServerBag serverBagNumberValueForKey:](a1, CFSTR("home-ramrr"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    if (v39)
    {
      objc_msgSend(a1, "hh2AutoMigrationWithoutSharedUserRampRemainder");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = objc_msgSend(v40, "isEqual:", v39);

      if ((v41 & 1) == 0)
      {
        v42 = (void *)MEMORY[0x227676638]();
        v43 = a1;
        HMFGetOSLogHandle();
        v44 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "hh2AutoMigrationWithoutSharedUserRampRemainder");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v275 = v45;
          v276 = 2112;
          v277 = v46;
          v278 = 2112;
          v279 = v39;
          _os_log_impl(&dword_2218F0000, v44, OS_LOG_TYPE_INFO, "%{public}@Updating hh2AutoMigrationWithoutSharedUserRampRemainder from %@ to %@", buf, 0x20u);

        }
        objc_autoreleasePoolPop(v42);
        objc_msgSend(v43, "setHh2AutoMigrationWithoutSharedUserRampRemainder:", v39);
        v33 = 1;
      }
    }

    -[HMDIDSServerBag serverBagNumberValueForKey:](a1, CFSTR("home-ramrdwsu"));
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    if (v47)
    {
      objc_msgSend(a1, "hh2AutoMigrationWithSharedUserRampDivisor");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = objc_msgSend(v48, "isEqual:", v47);

      if ((v49 & 1) == 0)
      {
        v50 = (void *)MEMORY[0x227676638]();
        v51 = a1;
        HMFGetOSLogHandle();
        v52 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v51, "hh2AutoMigrationWithSharedUserRampDivisor");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v275 = v53;
          v276 = 2112;
          v277 = v54;
          v278 = 2112;
          v279 = v47;
          _os_log_impl(&dword_2218F0000, v52, OS_LOG_TYPE_INFO, "%{public}@Updating hh2AutoMigrationWithSharedUserRampDivisor from %@ to %@", buf, 0x20u);

        }
        objc_autoreleasePoolPop(v50);
        objc_msgSend(v51, "setHh2AutoMigrationWithSharedUserRampDivisor:", v47);
        v33 = 1;
      }
    }

    -[HMDIDSServerBag serverBagNumberValueForKey:](a1, CFSTR("home-ramrrwsu"));
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    if (v55)
    {
      objc_msgSend(a1, "hh2AutoMigrationWithSharedUserRampRemainder");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      v57 = objc_msgSend(v56, "isEqual:", v55);

      if ((v57 & 1) == 0)
      {
        v58 = (void *)MEMORY[0x227676638]();
        v59 = a1;
        HMFGetOSLogHandle();
        v60 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v60, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v59, "hh2AutoMigrationWithSharedUserRampRemainder");
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v275 = v61;
          v276 = 2112;
          v277 = v62;
          v278 = 2112;
          v279 = v55;
          _os_log_impl(&dword_2218F0000, v60, OS_LOG_TYPE_INFO, "%{public}@Updating hh2AutoMigrationWithSharedUserRampRemainder from %@ to %@", buf, 0x20u);

        }
        objc_autoreleasePoolPop(v58);
        objc_msgSend(v59, "setHh2AutoMigrationWithSharedUserRampRemainder:", v55);
        v33 = 1;
      }
    }

    -[HMDIDSServerBag serverBagHomeKitVersionForKey:](a1, CFSTR("home-rmvfsumbom"));
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "minimumHomeKitVersionForSharedUserHH2MigrationByOwnerManual");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    v268 = v11;
    if (v63 && (objc_msgSend(v63, "isEqualToVersion:", v64) & 1) == 0)
    {
      v66 = (void *)MEMORY[0x227676638]();
      v67 = a1;
      HMFGetOSLogHandle();
      v68 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v68, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v275 = v69;
        v276 = 2114;
        v277 = v64;
        v278 = 2114;
        v279 = v63;
        _os_log_impl(&dword_2218F0000, v68, OS_LOG_TYPE_INFO, "%{public}@Updating minimumHomeKitVersionForSharedUserHH2MigrationByOwnerManual from %{public}@ to %{public}@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v66);
      objc_msgSend(v67, "setMinimumHomeKitVersionForSharedUserHH2MigrationByOwnerManual:", v63);
      v65 = 1;
    }
    else
    {
      v65 = 0;
    }

    -[HMDIDSServerBag serverBagHomeKitVersionForKey:](a1, CFSTR("home-rmvfsumboa"));
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "minimumHomeKitVersionForSharedUserHH2MigrationByOwnerAuto");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    if (v70 && (objc_msgSend(v70, "isEqualToVersion:", v71) & 1) == 0)
    {
      v72 = (void *)MEMORY[0x227676638]();
      v73 = a1;
      HMFGetOSLogHandle();
      v74 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v74, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v275 = v75;
        v276 = 2114;
        v277 = v71;
        v278 = 2114;
        v279 = v70;
        _os_log_impl(&dword_2218F0000, v74, OS_LOG_TYPE_INFO, "%{public}@Updating minimumHomeKitVersionForSharedUserHH2MigrationByOwnerAuto from %{public}@ to %{public}@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v72);
      objc_msgSend(v73, "setMinimumHomeKitVersionForSharedUserHH2MigrationByOwnerAuto:", v70);
      v65 = 1;
    }

    -[HMDIDSServerBag serverBagHomeKitVersionForKey:](a1, CFSTR("home-rmvfomdmwosu"));
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "minimumHomeKitVersionForOwnerMeDeviceAutoHH2MigrationWithoutSharedUsers");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    if (v76 && (objc_msgSend(v76, "isEqualToVersion:", v77) & 1) == 0)
    {
      v79 = (void *)MEMORY[0x227676638]();
      v80 = a1;
      HMFGetOSLogHandle();
      v81 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v81, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v275 = v82;
        v276 = 2114;
        v277 = v77;
        v278 = 2114;
        v279 = v76;
        _os_log_impl(&dword_2218F0000, v81, OS_LOG_TYPE_INFO, "%{public}@Updating minimumHomeKitVersionForOwnerMeDeviceAutoHH2MigrationWithoutSharedUsers from %{public}@ to %{public}@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v79);
      objc_msgSend(v80, "setMinimumHomeKitVersionForOwnerMeDeviceAutoHH2MigrationWithoutSharedUsers:", v76);
      v78 = 1;
    }
    else
    {
      v78 = 0;
    }

    -[HMDIDSServerBag serverBagHomeKitVersionForKey:](a1, CFSTR("home-rmvfoodmwosu"));
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "minimumHomeKitVersionForOwnerOtherDevicesAutoHH2MigrationWithoutSharedUsers");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    if (v83 && (objc_msgSend(v83, "isEqualToVersion:", v84) & 1) == 0)
    {
      v85 = (void *)MEMORY[0x227676638]();
      v86 = a1;
      HMFGetOSLogHandle();
      v87 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v87, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v88 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v275 = v88;
        v276 = 2114;
        v277 = v84;
        v278 = 2114;
        v279 = v83;
        _os_log_impl(&dword_2218F0000, v87, OS_LOG_TYPE_INFO, "%{public}@Updating minimumHomeKitVersionForOwnerOtherDevicesAutoHH2MigrationWithoutSharedUsers from %{public}@ to %{public}@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v85);
      objc_msgSend(v86, "setMinimumHomeKitVersionForOwnerOtherDevicesAutoHH2MigrationWithoutSharedUsers:", v83);
      v78 = 1;
    }

    -[HMDIDSServerBag serverBagHomeKitVersionForKey:](a1, CFSTR("home-rmvfordmwosu"));
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "minimumHomeKitVersionForOwnerResidentDevicesAutoHH2MigrationWithoutSharedUsers");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    if (v89 && (objc_msgSend(v89, "isEqualToVersion:", v90) & 1) == 0)
    {
      v91 = (void *)MEMORY[0x227676638]();
      v92 = a1;
      HMFGetOSLogHandle();
      v93 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v93, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v94 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v275 = v94;
        v276 = 2114;
        v277 = v90;
        v278 = 2114;
        v279 = v89;
        _os_log_impl(&dword_2218F0000, v93, OS_LOG_TYPE_INFO, "%{public}@Updating minimumHomeKitVersionForOwnerResidentDevicesAutoHH2MigrationWithoutSharedUsers from %{public}@ to %{public}@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v91);
      objc_msgSend(v92, "setMinimumHomeKitVersionForOwnerResidentDevicesAutoHH2MigrationWithoutSharedUsers:", v89);
      v78 = 1;
    }

    -[HMDIDSServerBag serverBagHomeKitVersionForKey:](a1, CFSTR("home-rmvfomdm"));
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "minimumHomeKitVersionForOwnerMeDeviceAutoHH2MigrationWithSharedUsers");
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    if (v95 && (objc_msgSend(v95, "isEqualToVersion:", v96) & 1) == 0)
    {
      v98 = (void *)MEMORY[0x227676638]();
      v99 = a1;
      HMFGetOSLogHandle();
      v100 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v100, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v101 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v275 = v101;
        v276 = 2114;
        v277 = v96;
        v278 = 2114;
        v279 = v95;
        _os_log_impl(&dword_2218F0000, v100, OS_LOG_TYPE_INFO, "%{public}@Updating minimumHomeKitVersionForOwnerMeDeviceAutoHH2MigrationWithSharedUsers from %{public}@ to %{public}@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v98);
      objc_msgSend(v99, "setMinimumHomeKitVersionForOwnerMeDeviceAutoHH2MigrationWithSharedUsers:", v95);
      v97 = 1;
    }
    else
    {
      v97 = 0;
    }

    -[HMDIDSServerBag serverBagHomeKitVersionForKey:](a1, CFSTR("home-rmvfoodm"));
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "minimumHomeKitVersionForOwnerOtherDevicesAutoHH2MigrationWithSharedUsers");
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    if (v102 && (objc_msgSend(v102, "isEqualToVersion:", v103) & 1) == 0)
    {
      v104 = (void *)MEMORY[0x227676638]();
      v105 = a1;
      HMFGetOSLogHandle();
      v106 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v106, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v107 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v275 = v107;
        v276 = 2114;
        v277 = v103;
        v278 = 2114;
        v279 = v102;
        _os_log_impl(&dword_2218F0000, v106, OS_LOG_TYPE_INFO, "%{public}@Updating minimumHomeKitVersionForOwnerOtherDevicesAutoHH2MigrationWithSharedUsers from %{public}@ to %{public}@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v104);
      objc_msgSend(v105, "setMinimumHomeKitVersionForOwnerOtherDevicesAutoHH2MigrationWithSharedUsers:", v102);
      v97 = 1;
    }
    v108 = v268 | v33;

    -[HMDIDSServerBag serverBagHomeKitVersionForKey:](a1, CFSTR("home-rmvfordm"));
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "minimumHomeKitVersionForOwnerResidentDevicesAutoHH2MigrationWithSharedUsers");
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    if (v109 && (objc_msgSend(v109, "isEqualToVersion:", v110) & 1) == 0)
    {
      v111 = (void *)MEMORY[0x227676638]();
      v112 = a1;
      HMFGetOSLogHandle();
      v113 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v113, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v114 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v275 = v114;
        v276 = 2114;
        v277 = v110;
        v278 = 2114;
        v279 = v109;
        _os_log_impl(&dword_2218F0000, v113, OS_LOG_TYPE_INFO, "%{public}@Updating minimumHomeKitVersionForOwnerResidentDevicesAutoHH2MigrationWithSharedUsers from %{public}@ to %{public}@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v111);
      objc_msgSend(v112, "setMinimumHomeKitVersionForOwnerResidentDevicesAutoHH2MigrationWithSharedUsers:", v109);
      v97 = 1;
    }

    v115 = v97 | v78 | v65 | v108;
    -[HMDIDSServerBag serverBagNumberValueForKey:](a1, CFSTR("hh2SuppressDuplicateUserModelBulletins"));
    v116 = (void *)objc_claimAutoreleasedReturnValue();
    if (v116)
    {
      v117 = objc_msgSend(a1, "hh2SuppressDuplicateUserModelBulletins");
      if (v117 != objc_msgSend(v116, "BOOLValue"))
      {
        v118 = (void *)MEMORY[0x227676638]();
        v119 = a1;
        HMFGetOSLogHandle();
        v120 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v120, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v121 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v119, "hh2SuppressDuplicateUserModelBulletins");
          HMFBooleanToString();
          v122 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v116, "BOOLValue");
          HMFBooleanToString();
          v123 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v275 = v121;
          v276 = 2112;
          v277 = v122;
          v278 = 2112;
          v279 = v123;
          _os_log_impl(&dword_2218F0000, v120, OS_LOG_TYPE_INFO, "%{public}@Updating hh2SuppressDuplicateUserModelBulletins from %@ to %@", buf, 0x20u);

        }
        objc_autoreleasePoolPop(v118);
        objc_msgSend(v119, "setHh2SuppressDuplicateUserModelBulletins:", objc_msgSend(v116, "BOOLValue"));
        v115 = 1;
      }
    }
    -[HMDIDSServerBag serverBagNumberValueForKey:](a1, CFSTR("home-cb"));
    v124 = (void *)objc_claimAutoreleasedReturnValue();
    if (v124)
    {
      v125 = objc_msgSend(a1, "homeSafetySecurityEnabled");
      if (v125 != objc_msgSend(v124, "BOOLValue"))
      {
        v126 = (void *)MEMORY[0x227676638]();
        v127 = a1;
        HMFGetOSLogHandle();
        v128 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v128, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v129 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v127, "homeSafetySecurityEnabled");
          HMFBooleanToString();
          v130 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v124, "BOOLValue");
          HMFBooleanToString();
          v131 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v275 = v129;
          v276 = 2112;
          v277 = v130;
          v278 = 2112;
          v279 = v131;
          _os_log_impl(&dword_2218F0000, v128, OS_LOG_TYPE_INFO, "%{public}@Updating homeSafetySecurityEnabled from %@ to %@", buf, 0x20u);

        }
        objc_autoreleasePoolPop(v126);
        objc_msgSend(v127, "setHomeSafetySecurityEnabled:", objc_msgSend(v124, "BOOLValue"));
        v115 = 1;
      }
    }
    -[HMDIDSServerBag serverBagNumberValueForKey:](a1, CFSTR("home-skrse"));
    v132 = (void *)objc_claimAutoreleasedReturnValue();
    v269 = v115;
    if (!v132
      || (v133 = objc_msgSend(a1, "statusKitResidentStatusEnabled"),
          v133 == objc_msgSend(v132, "BOOLValue")))
    {
      v140 = 0;
    }
    else
    {
      v134 = (void *)MEMORY[0x227676638]();
      v135 = a1;
      HMFGetOSLogHandle();
      v136 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v136, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v137 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v135, "statusKitResidentStatusEnabled");
        HMFBooleanToString();
        v138 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v132, "BOOLValue");
        HMFBooleanToString();
        v139 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v275 = v137;
        v276 = 2112;
        v277 = v138;
        v278 = 2112;
        v279 = v139;
        _os_log_impl(&dword_2218F0000, v136, OS_LOG_TYPE_INFO, "%{public}@Updating statusKitResidentStatusEnabled from %@ to %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v134);
      objc_msgSend(v135, "setStatusKitResidentStatusEnabled:", objc_msgSend(v132, "BOOLValue"));
      v140 = 1;
    }

    -[HMDIDSServerBag serverBagNumberValueForKey:](a1, CFSTR("home-skict"));
    v141 = (void *)objc_claimAutoreleasedReturnValue();
    if (v141)
    {
      objc_msgSend(a1, "statusKitInitialConnectionTimeoutSeconds");
      v142 = (void *)objc_claimAutoreleasedReturnValue();
      v143 = objc_msgSend(v142, "isEqual:", v141);

      if ((v143 & 1) == 0)
      {
        v144 = (void *)MEMORY[0x227676638]();
        v145 = a1;
        HMFGetOSLogHandle();
        v146 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v146, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v147 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v145, "statusKitInitialConnectionTimeoutSeconds");
          v148 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v275 = v147;
          v276 = 2112;
          v277 = v148;
          v278 = 2112;
          v279 = v141;
          _os_log_impl(&dword_2218F0000, v146, OS_LOG_TYPE_INFO, "%{public}@Updating statusKitInitialConnectionTimeoutSeconds from %@ to %@", buf, 0x20u);

        }
        objc_autoreleasePoolPop(v144);
        objc_msgSend(v145, "setStatusKitInitialConnectionTimeoutSeconds:", v141);
        v140 = 1;
      }
    }

    -[HMDIDSServerBag serverBagNumberValueForKey:](a1, CFSTR("home-skctnrpt"));
    v149 = (void *)objc_claimAutoreleasedReturnValue();
    if (v149)
    {
      objc_msgSend(a1, "statusKitConnectionTTSUNoReachablePrimaryTimeoutSeconds");
      v150 = (void *)objc_claimAutoreleasedReturnValue();
      v151 = objc_msgSend(v150, "isEqual:", v149);

      if ((v151 & 1) == 0)
      {
        v152 = (void *)MEMORY[0x227676638]();
        v153 = a1;
        HMFGetOSLogHandle();
        v154 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v154, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v155 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v153, "statusKitConnectionTTSUNoReachablePrimaryTimeoutSeconds");
          v156 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v275 = v155;
          v276 = 2112;
          v277 = v156;
          v278 = 2112;
          v279 = v149;
          _os_log_impl(&dword_2218F0000, v154, OS_LOG_TYPE_INFO, "%{public}@Updating statusKitConnectionTTSUNoReachablePrimaryTimeoutSeconds from %@ to %@", buf, 0x20u);

        }
        objc_autoreleasePoolPop(v152);
        objc_msgSend(v153, "setStatusKitConnectionTTSUNoReachablePrimaryTimeoutSeconds:", v149);
        v140 = 1;
      }
    }

    -[HMDIDSServerBag serverBagNumberValueForKey:](a1, CFSTR("home-skufcdt"));
    v157 = (void *)objc_claimAutoreleasedReturnValue();
    if (v157)
    {
      objc_msgSend(a1, "statusKitUnsubscribeFromChannelDebounceTimeSec");
      v158 = (void *)objc_claimAutoreleasedReturnValue();
      v159 = objc_msgSend(v158, "isEqual:", v157);

      if ((v159 & 1) == 0)
      {
        v160 = (void *)MEMORY[0x227676638]();
        v161 = a1;
        HMFGetOSLogHandle();
        v162 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v162, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v163 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v161, "statusKitUnsubscribeFromChannelDebounceTimeSec");
          v164 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v275 = v163;
          v276 = 2112;
          v277 = v164;
          v278 = 2112;
          v279 = v157;
          _os_log_impl(&dword_2218F0000, v162, OS_LOG_TYPE_INFO, "%{public}@Updating statusKitUnsubscribeFromChannelDebounceTimeSec from %@ to %@", buf, 0x20u);

        }
        objc_autoreleasePoolPop(v160);
        objc_msgSend(v161, "setStatusKitUnsubscribeFromChannelDebounceTimeSec:", v157);
        v140 = 1;
      }
    }

    -[HMDIDSServerBag serverBagNumberValueForKey:](a1, CFSTR("home-rs-pred"));
    v165 = (void *)objc_claimAutoreleasedReturnValue();
    if (v165
      && (objc_msgSend(a1, "residentSelectionPreferredResidentEvaluationDelay"),
          v166 = (void *)objc_claimAutoreleasedReturnValue(),
          v167 = objc_msgSend(v166, "isEqual:", v165),
          v166,
          (v167 & 1) == 0))
    {
      v169 = (void *)MEMORY[0x227676638]();
      v170 = a1;
      HMFGetOSLogHandle();
      v171 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v171, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v172 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v170, "residentSelectionPreferredResidentEvaluationDelay");
        v173 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v275 = v172;
        v276 = 2112;
        v277 = v173;
        v278 = 2112;
        v279 = v165;
        _os_log_impl(&dword_2218F0000, v171, OS_LOG_TYPE_INFO, "%{public}@Updating residentSelectionPreferredResidentEvaluationDelay from %@ to %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v169);
      objc_msgSend(v170, "setResidentSelectionPreferredResidentEvaluationDelay:", v165);
      v168 = 1;
    }
    else
    {
      v168 = 0;
    }

    -[HMDIDSServerBag serverBagNumberValueForKey:](a1, CFSTR("home-rs-prlms"));
    v174 = (void *)objc_claimAutoreleasedReturnValue();
    if (v174)
    {
      objc_msgSend(a1, "residentSelectionPreferredResidentsListMaxSize");
      v175 = (void *)objc_claimAutoreleasedReturnValue();
      v176 = objc_msgSend(v175, "isEqual:", v174);

      if ((v176 & 1) == 0)
      {
        v177 = (void *)MEMORY[0x227676638]();
        v178 = a1;
        HMFGetOSLogHandle();
        v179 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v179, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v180 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v178, "residentSelectionPreferredResidentsListMaxSize");
          v181 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v275 = v180;
          v276 = 2112;
          v277 = v181;
          v278 = 2112;
          v279 = v174;
          _os_log_impl(&dword_2218F0000, v179, OS_LOG_TYPE_INFO, "%{public}@Updating residentSelectionPreferredResidentsListMaxSize from %@ to %@", buf, 0x20u);

        }
        objc_autoreleasePoolPop(v177);
        objc_msgSend(v178, "setResidentSelectionPreferredResidentsListMaxSize:", v174);
        v168 = 1;
      }
    }

    -[HMDIDSServerBag serverBagNumberValueForKey:](a1, CFSTR("home-rs-sdi"));
    v182 = (void *)objc_claimAutoreleasedReturnValue();
    if (v182)
    {
      objc_msgSend(a1, "residentSelectionStatusDebounceInterval");
      v183 = (void *)objc_claimAutoreleasedReturnValue();
      v184 = objc_msgSend(v183, "isEqual:", v182);

      if ((v184 & 1) == 0)
      {
        v185 = (void *)MEMORY[0x227676638]();
        v186 = a1;
        HMFGetOSLogHandle();
        v187 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v187, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v188 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v186, "residentSelectionStatusDebounceInterval");
          v189 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v275 = v188;
          v276 = 2112;
          v277 = v189;
          v278 = 2112;
          v279 = v182;
          _os_log_impl(&dword_2218F0000, v187, OS_LOG_TYPE_INFO, "%{public}@Updating residentSelectionStatusDebounceInterval from %@ to %@", buf, 0x20u);

        }
        objc_autoreleasePoolPop(v185);
        objc_msgSend(v186, "setResidentSelectionStatusDebounceInterval:", v182);
        v168 = 1;
      }
    }

    -[HMDIDSServerBag serverBagNumberValueForKey:](a1, CFSTR("home-rs-toipinvi"));
    v190 = (void *)objc_claimAutoreleasedReturnValue();
    if (v190)
    {
      objc_msgSend(a1, "residentSelectionTakeOverIfPrimaryIsNotViableInterval");
      v191 = (void *)objc_claimAutoreleasedReturnValue();
      v192 = objc_msgSend(v191, "isEqual:", v190);

      if ((v192 & 1) == 0)
      {
        v193 = (void *)MEMORY[0x227676638]();
        v194 = a1;
        HMFGetOSLogHandle();
        v195 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v195, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v196 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v194, "residentSelectionTakeOverIfPrimaryIsNotViableInterval");
          v197 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v275 = v196;
          v276 = 2112;
          v277 = v197;
          v278 = 2112;
          v279 = v190;
          _os_log_impl(&dword_2218F0000, v195, OS_LOG_TYPE_INFO, "%{public}@Updating residentSelectionTakeOverIfPrimaryIsNotViableInterval from %@ to %@", buf, 0x20u);

        }
        objc_autoreleasePoolPop(v193);
        objc_msgSend(v194, "setResidentSelectionTakeOverIfPrimaryIsNotViableInterval:", v190);
        v168 = 1;
      }
    }

    -[HMDIDSServerBag serverBagNumberValueForKey:](a1, CFSTR("home-rs-toi"));
    v198 = (void *)objc_claimAutoreleasedReturnValue();
    if (v198)
    {
      objc_msgSend(a1, "residentSelectionTakeOverInterval");
      v199 = (void *)objc_claimAutoreleasedReturnValue();
      v200 = objc_msgSend(v199, "isEqual:", v198);

      if ((v200 & 1) == 0)
      {
        v201 = (void *)MEMORY[0x227676638]();
        v202 = a1;
        HMFGetOSLogHandle();
        v203 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v203, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v204 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v202, "residentSelectionTakeOverInterval");
          v205 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v275 = v204;
          v276 = 2112;
          v277 = v205;
          v278 = 2112;
          v279 = v198;
          _os_log_impl(&dword_2218F0000, v203, OS_LOG_TYPE_INFO, "%{public}@Updating residentSelectionTakeOverInterval from %@ to %@", buf, 0x20u);

        }
        objc_autoreleasePoolPop(v201);
        objc_msgSend(v202, "setResidentSelectionTakeOverInterval:", v198);
        v168 = 1;
      }
    }

    -[HMDIDSServerBag serverBagNumberValueForKey:](a1, CFSTR("home-rs-tooicpinvj"));
    v206 = (void *)objc_claimAutoreleasedReturnValue();
    if (v206)
    {
      objc_msgSend(a1, "residentSelectionTakeOverOnlyIfCurrentPrimaryIsNotViableJitter");
      v207 = (void *)objc_claimAutoreleasedReturnValue();
      v208 = objc_msgSend(v207, "isEqual:", v206);

      if ((v208 & 1) == 0)
      {
        v209 = (void *)MEMORY[0x227676638]();
        v210 = a1;
        HMFGetOSLogHandle();
        v211 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v211, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v212 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v210, "residentSelectionTakeOverOnlyIfCurrentPrimaryIsNotViableJitter");
          v213 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v275 = v212;
          v276 = 2112;
          v277 = v213;
          v278 = 2112;
          v279 = v206;
          _os_log_impl(&dword_2218F0000, v211, OS_LOG_TYPE_INFO, "%{public}@Updating residentSelectionTakeOverOnlyIfCurrentPrimaryIsNotViableJitter from %@ to %@", buf, 0x20u);

        }
        objc_autoreleasePoolPop(v209);
        objc_msgSend(v210, "setResidentSelectionTakeOverOnlyIfCurrentPrimaryIsNotViableJitter:", v206);
        v168 = 1;
      }
    }

    -[HMDIDSServerBag serverBagNumberValueForKey:](a1, CFSTR("home-rs-plgsh"));
    v214 = (void *)objc_claimAutoreleasedReturnValue();
    if (v214)
    {
      objc_msgSend(a1, "residentSelectionPreferredListGenerationStartHour");
      v215 = (void *)objc_claimAutoreleasedReturnValue();
      v216 = objc_msgSend(v215, "isEqual:", v214);

      if ((v216 & 1) == 0)
      {
        v217 = (void *)MEMORY[0x227676638]();
        v218 = a1;
        HMFGetOSLogHandle();
        v219 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v219, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v220 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v218, "residentSelectionPreferredListGenerationStartHour");
          v221 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v275 = v220;
          v276 = 2112;
          v277 = v221;
          v278 = 2112;
          v279 = v214;
          _os_log_impl(&dword_2218F0000, v219, OS_LOG_TYPE_INFO, "%{public}@Updating residentSelectionPreferredListGenerationStartHour from %@ to %@", buf, 0x20u);

        }
        objc_autoreleasePoolPop(v217);
        objc_msgSend(v218, "setResidentSelectionPreferredListGenerationStartHour:", v214);
        v168 = 1;
      }
    }

    -[HMDIDSServerBag serverBagNumberValueForKey:](a1, CFSTR("home-rs-plgeh"));
    v222 = (void *)objc_claimAutoreleasedReturnValue();
    if (v222)
    {
      objc_msgSend(a1, "residentSelectionPreferredListGenerationEndHour");
      v223 = (void *)objc_claimAutoreleasedReturnValue();
      v224 = objc_msgSend(v223, "isEqual:", v222);

      if ((v224 & 1) == 0)
      {
        v225 = (void *)MEMORY[0x227676638]();
        v226 = a1;
        HMFGetOSLogHandle();
        v227 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v227, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v228 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v226, "residentSelectionPreferredListGenerationEndHour");
          v229 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v275 = v228;
          v276 = 2112;
          v277 = v229;
          v278 = 2112;
          v279 = v222;
          _os_log_impl(&dword_2218F0000, v227, OS_LOG_TYPE_INFO, "%{public}@Updating residentSelectionPreferredListGenerationEndHour from %@ to %@", buf, 0x20u);

        }
        objc_autoreleasePoolPop(v225);
        objc_msgSend(v226, "setResidentSelectionPreferredListGenerationEndHour:", v222);
        v168 = 1;
      }
    }

    -[HMDIDSServerBag serverBagHomeKitVersionForKey:](a1, CFSTR("home-rs-mhv"));
    v230 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "residentSelectionMinHomeKitVersion");
    v231 = (void *)objc_claimAutoreleasedReturnValue();
    if (v230 && (objc_msgSend(v230, "isEqualToVersion:", v231) & 1) == 0)
    {
      v232 = (void *)MEMORY[0x227676638]();
      v233 = a1;
      HMFGetOSLogHandle();
      v234 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v234, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v235 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v275 = v235;
        v276 = 2114;
        v277 = v231;
        v278 = 2114;
        v279 = v230;
        _os_log_impl(&dword_2218F0000, v234, OS_LOG_TYPE_INFO, "%{public}@Updating residentSelectionMinHomeKitVersion from %{public}@ to %{public}@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v232);
      objc_msgSend(v233, "setResidentSelectionMinHomeKitVersion:", v230);
      v168 = 1;
    }

    -[HMDIDSServerBag serverBagNumberValueForKey:](a1, CFSTR("home-rs-rnacd"));
    v236 = (void *)objc_claimAutoreleasedReturnValue();
    if (v236)
    {
      objc_msgSend(a1, "residentSelectionReachabilityNotificationAfterConnectivityDelay");
      v237 = (void *)objc_claimAutoreleasedReturnValue();
      v238 = objc_msgSend(v237, "isEqual:", v236);

      if ((v238 & 1) == 0)
      {
        v239 = (void *)MEMORY[0x227676638]();
        v240 = a1;
        HMFGetOSLogHandle();
        v241 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v241, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v242 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v240, "residentSelectionReachabilityNotificationAfterConnectivityDelay");
          v243 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v275 = v242;
          v276 = 2112;
          v277 = v243;
          v278 = 2112;
          v279 = v236;
          _os_log_impl(&dword_2218F0000, v241, OS_LOG_TYPE_INFO, "%{public}@Updating residentSelectionReachabilityNotificationAfterConnectivityDelay from %@ to %@", buf, 0x20u);

        }
        objc_autoreleasePoolPop(v239);
        objc_msgSend(v240, "setResidentSelectionReachabilityNotificationAfterConnectivityDelay:", v236);
        v168 = 1;
      }
    }

    -[HMDIDSServerBag serverBagNumberValueForKey:](a1, CFSTR("home-rs-uprnd"));
    v244 = (void *)objc_claimAutoreleasedReturnValue();
    if (v244)
    {
      objc_msgSend(a1, "residentSelectionUserPreferredReachabilityNotificationDelay");
      v245 = (void *)objc_claimAutoreleasedReturnValue();
      v246 = objc_msgSend(v245, "isEqual:", v244);

      if ((v246 & 1) == 0)
      {
        v247 = (void *)MEMORY[0x227676638]();
        v248 = a1;
        HMFGetOSLogHandle();
        v249 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v249, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v250 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v248, "residentSelectionUserPreferredReachabilityNotificationDelay");
          v251 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v275 = v250;
          v276 = 2112;
          v277 = v251;
          v278 = 2112;
          v279 = v244;
          _os_log_impl(&dword_2218F0000, v249, OS_LOG_TYPE_INFO, "%{public}@Updating residentSelectionUserPreferredReachabilityNotificationDelay from %@ to %@", buf, 0x20u);

        }
        objc_autoreleasePoolPop(v247);
        objc_msgSend(v248, "setResidentSelectionUserPreferredReachabilityNotificationDelay:", v244);
        v168 = 1;
      }
    }

    -[HMDIDSServerBag serverBagNumberValueForKey:](a1, CFSTR("home-rdm-bptd"));
    v252 = (void *)objc_claimAutoreleasedReturnValue();
    if (v252
      && (objc_msgSend(a1, "residentDeviceManagerBlockPrimaryTakeoverDurationSeconds"),
          v253 = (void *)objc_claimAutoreleasedReturnValue(),
          v254 = objc_msgSend(v253, "isEqual:", v252),
          v253,
          (v254 & 1) == 0))
    {
      v257 = (void *)MEMORY[0x227676638]();
      v258 = a1;
      HMFGetOSLogHandle();
      v259 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v259, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v260 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v258, "residentDeviceManagerBlockPrimaryTakeoverDurationSeconds");
        v261 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v275 = v260;
        v276 = 2112;
        v277 = v261;
        v278 = 2112;
        v279 = v252;
        _os_log_impl(&dword_2218F0000, v259, OS_LOG_TYPE_INFO, "%{public}@Updating residentDeviceManagerBlockPrimaryTakeoverDurationSeconds from %@ to %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v257);
      objc_msgSend(v258, "setResidentDeviceManagerBlockPrimaryTakeoverDurationSeconds:", v252);

      v256 = v267;
    }
    else
    {

      v255 = v168 | v140 | v269;
      v256 = v267;
      if (v255 != 1)
      {
LABEL_187:

        return;
      }
    }
    v262 = (void *)MEMORY[0x227676638]();
    v263 = a1;
    HMFGetOSLogHandle();
    v264 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v264, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v265 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v275 = v265;
      _os_log_impl(&dword_2218F0000, v264, OS_LOG_TYPE_INFO, "%{public}@Notifying delegate of server bag update", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v262);
    objc_msgSend(v263, "delegate");
    v266 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v266, "idsServerBagDidUpdate:", v263);

    goto LABEL_187;
  }
}

- (id)serverBagNumberValueForKey:(void *)a1
{
  void *v2;
  void *v3;
  id v4;

  -[HMDIDSServerBag serverBagValueForKey:](a1, a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

- (HMDHomeKitVersion)serverBagHomeKitVersionForKey:(void *)a1
{
  void *v2;
  void *v3;
  id v4;
  HMDHomeKitVersion *v5;

  -[HMDIDSServerBag serverBagValueForKey:](a1, a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  if (v4)
    v5 = -[HMDHomeKitVersion initWithVersionString:]([HMDHomeKitVersion alloc], "initWithVersionString:", v4);
  else
    v5 = 0;

  return v5;
}

- (id)serverBagValueForKey:(void *)a1
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  int v17;
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(a1, "keySuffix");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "length");

  if (v5)
  {
    objc_msgSend(a1, "keySuffix");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringByAppendingString:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1, "idsServerBag");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKey:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
      goto LABEL_6;
  }
  else
  {
    v7 = 0;
  }
  v10 = v3;

  objc_msgSend(a1, "idsServerBag");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKey:", v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = v10;
LABEL_6:
  v12 = (void *)MEMORY[0x227676638]();
  v13 = a1;
  HMFGetOSLogHandle();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 138543874;
    v18 = v15;
    v19 = 2112;
    v20 = v7;
    v21 = 2112;
    v22 = v9;
    _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_INFO, "%{public}@serverBagValueForKey %@ returned %@", (uint8_t *)&v17, 0x20u);

  }
  objc_autoreleasePoolPop(v12);

  return v9;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t38_128682 != -1)
    dispatch_once(&logCategory__hmf_once_t38_128682, &__block_literal_global_128683);
  return (id)logCategory__hmf_once_v39_128684;
}

void __30__HMDIDSServerBag_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v39_128684;
  logCategory__hmf_once_v39_128684 = v0;

}

@end
