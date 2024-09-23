@implementation HMDAccessorySetupMetricDispatcher

- (id)networkMetricWithDiscoveryController:(id)a3 networkInfoController:(id)a4 sessionID:(id)a5 idsIdentifierString:(id)a6 currentWiFiInfo:(id)a7 currentWiFiNetworkRSSI:(int)a8 numResidents:(int64_t)a9 numAppleMediaAccessories:(int64_t)a10 accessoryDiagnosticInfo:(id)a11 primaryResidentIdsIdentifierString:(id)a12 primaryResidentDiagnosticInfo:(id)a13 homeUUID:(id)a14 primaryResidentDiagnosticInfoFetched:(BOOL)a15
{
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  HMDAccessorySetupMetricDispatcher *v30;
  id v31;
  uint64_t v33;
  uint64_t v34;
  id v35;
  HMDAccessorySetupMetricDispatcher *v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  _BOOL4 v40;
  char *v41;
  uint64_t v42;
  int v43;
  uint64_t v44;
  uint64_t v45;

  v43 = a8;
  v35 = a7;
  v36 = self;
  v40 = a15;
  v39 = a10;
  v37 = a13;
  v38 = a9;
  v17 = sub_1CDAB822C();
  v44 = *(_QWORD *)(v17 - 8);
  v45 = v17;
  MEMORY[0x1E0C80A78](v17);
  v19 = (char *)&v33 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v34 = sub_1CDAB84C0();
  v42 = v20;
  v33 = sub_1CDAB84C0();
  v41 = v21;
  if (a12)
  {
    v22 = sub_1CDAB84C0();
    v24 = v23;
  }
  else
  {
    v22 = 0;
    v24 = 0;
  }
  sub_1CDAB8214();
  v25 = a3;
  v26 = a4;
  v27 = v35;
  v35 = a11;
  v28 = v37;
  v29 = v37;
  v30 = v36;
  v31 = sub_1CD0D3990(v25, v26, v34, v42, v33, v41, v27, v43, v38, v39, a11, v22, v24, v28, (uint64_t)v19, v40);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v44 + 8))(v19, v45);
  return v31;
}

- (id)obtainDiscoveryAssertion
{
  return (id)_sSo17HMDSymptomManagerC19HomeKitDaemonLegacyE24obtainDiscoveryAssertionyXlyF_0();
}

- (void)releaseDiscoveryAssertionWithAssertionHandle:(id)a3
{
  HMDAccessorySetupMetricDispatcher *v4;

  swift_unknownObjectRetain();
  v4 = self;
  _sSo33HMDAccessorySetupMetricDispatcherC19HomeKitDaemonLegacyE25releaseDiscoveryAssertion15assertionHandleyyXl_tF_0();
  swift_unknownObjectRelease();

}

- (HMDAccessorySetupMetricDispatcher)initWithQueue:(id)a3 discoveryController:(id)a4 networkInfoController:(id)a5 trackingInfo:(id)a6 setupSessionIdentifier:(id)a7 homeManager:(id)a8 logEventSubmitter:(id)a9 radarInitiator:(id)a10 timerFactory:(id)a11
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void (**v22)(id, HMDAccessorySetupMetricDispatcher *);
  HMDAccessorySetupMetricDispatcher *v23;
  uint64_t v24;
  OS_os_log *logger;
  void *v26;
  uint64_t v27;
  id discoveryController;
  void *v29;
  uint64_t v30;
  id networkInfoController;
  uint64_t v32;
  HMFTimer *timer;
  uint64_t v34;
  NSUUID *setupSessionIdentifier;
  objc_super v37;

  v16 = a3;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v20 = a9;
  v21 = a10;
  v22 = (void (**)(id, HMDAccessorySetupMetricDispatcher *))a11;
  v37.receiver = self;
  v37.super_class = (Class)HMDAccessorySetupMetricDispatcher;
  v23 = -[HMDAccessorySetupMetricDispatcher init](&v37, sel_init);
  if (v23)
  {
    HMFGetOSLogHandle();
    v24 = objc_claimAutoreleasedReturnValue();
    logger = v23->_logger;
    v23->_logger = (OS_os_log *)v24;

    objc_storeStrong((id *)&v23->_queue, a3);
    +[HMDMainDriver driver](HMDMainDriver, "driver");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "discoveryController");
    v27 = objc_claimAutoreleasedReturnValue();
    discoveryController = v23->_discoveryController;
    v23->_discoveryController = (id)v27;

    +[HMDMainDriver driver](HMDMainDriver, "driver");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "networkInfoController");
    v30 = objc_claimAutoreleasedReturnValue();
    networkInfoController = v23->_networkInfoController;
    v23->_networkInfoController = (id)v30;

    objc_storeStrong((id *)&v23->_trackingInfo, a6);
    objc_storeWeak((id *)&v23->_submitter, v20);
    v22[2](v22, v23);
    v32 = objc_claimAutoreleasedReturnValue();
    timer = v23->_timer;
    v23->_timer = (HMFTimer *)v32;

    v34 = objc_msgSend(v18, "copy");
    setupSessionIdentifier = v23->_setupSessionIdentifier;
    v23->_setupSessionIdentifier = (NSUUID *)v34;

    v23->_lock._os_unfair_lock_opaque = 0;
    objc_storeWeak((id *)&v23->_homeManager, v19);
    objc_storeWeak((id *)&v23->_radarInitiator, v21);
  }

  return v23;
}

- (HMDAccessorySetupMetricDispatcher)initWithQueue:(id)a3 trackingInfo:(id)a4 setupSessionIdentifier:(id)a5 homeManager:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  HMDAccessorySetupMetricDispatcher *v18;
  void *v20;
  void *v22;

  v9 = a6;
  v10 = a5;
  v11 = a4;
  v12 = a3;
  +[HMDMainDriver driver](HMDMainDriver, "driver");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "discoveryController");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDMainDriver driver](HMDMainDriver, "driver");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "networkInfoController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDMetricsManager sharedLogEventSubmitter](HMDMetricsManager, "sharedLogEventSubmitter");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "metricsManager");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "radarInitiator");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[HMDAccessorySetupMetricDispatcher initWithQueue:discoveryController:networkInfoController:trackingInfo:setupSessionIdentifier:homeManager:logEventSubmitter:radarInitiator:timerFactory:](self, "initWithQueue:discoveryController:networkInfoController:trackingInfo:setupSessionIdentifier:homeManager:logEventSubmitter:radarInitiator:timerFactory:", v12, v20, v14, v11, v10, v9, v15, v17, &__block_literal_global_179119);

  return v18;
}

- (void)updateTrackingInfo:(id)a3
{
  id v5;

  v5 = a3;
  if (self)
  {
    os_unfair_lock_lock_with_options();
    objc_storeStrong((id *)&self->_trackingInfo, a3);
    os_unfair_lock_unlock(&self->_lock);
  }

}

- (HMDDeviceSetupTrackingInfo)trackingInfo
{
  os_unfair_lock_s *p_lock;
  HMDDeviceSetupTrackingInfo *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_trackingInfo;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)didReceiveEvent:(id)a3 topic:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  HMDAccessorySetupMetricDispatcher *v15;
  NSObject *v16;
  id v17;
  void *v18;
  const char *v19;
  void *v20;
  HMDAccessorySetupMetricDispatcher *v21;
  NSObject *v22;
  void *v23;
  id v24;
  void *v25;
  HMDAccessorySetupMetricDispatcher *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  int v30;
  id v31;
  id v32;
  id v33;
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  id v37;
  __int16 v38;
  id v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0CBA4C8], "decodeTopic:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "asAccessorySettingTopic");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = v6;
    v11 = v9;
    if (!self)
    {
LABEL_19:

      goto LABEL_20;
    }
    v33 = 0;
    objc_msgSend(MEMORY[0x1E0CBA588], "decodeSettingFromEvent:error:", v10, &v33);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v33;
    if (!v12)
    {
      v24 = v11;
      v25 = (void *)MEMORY[0x1D17BA0A0]();
      v26 = self;
      HMFGetOSLogHandle();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v32 = v13;
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v35 = v28;
        v36 = 2112;
        v37 = v10;
        v38 = 2112;
        v39 = v24;
        _os_log_impl(&dword_1CD062000, v27, OS_LOG_TYPE_ERROR, "%{public}@Nil settings value for settings update event: %@ topic: %@", buf, 0x20u);

        v13 = v32;
      }

      objc_autoreleasePoolPop(v25);
      v11 = v24;
      goto LABEL_18;
    }
    if (-[HMDAccessorySetupMetricDispatcher submitted](self, "submitted"))
    {
      v31 = v11;
      v14 = (void *)MEMORY[0x1D17BA0A0]();
      v15 = self;
      HMFGetOSLogHandle();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v17 = v13;
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v35 = v18;
        v19 = "%{public}@Setup metric already submitted, will unsubscribe from settings events";
LABEL_16:
        _os_log_impl(&dword_1CD062000, v16, OS_LOG_TYPE_INFO, v19, buf, 0xCu);

        v13 = v17;
      }
    }
    else
    {
      -[HMDAccessorySetupMetricDispatcher markFirstSettingObserved](self, "markFirstSettingObserved");
      objc_msgSend(v12, "keyPath");
      v17 = v13;
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v29, "isEqual:", CFSTR("root.siri.language"));

      v13 = v17;
      if (!v30)
      {
LABEL_18:

        goto LABEL_19;
      }
      v31 = v11;
      -[HMDAccessorySetupMetricDispatcher markLanguageSettingObserved](self, "markLanguageSettingObserved");
      v14 = (void *)MEMORY[0x1D17BA0A0](-[HMDAccessorySetupMetricDispatcher submit](self, "submit"));
      v15 = self;
      HMFGetOSLogHandle();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v35 = v18;
        v19 = "%{public}@Setup metric submitted, will unsubscribe from settings events";
        goto LABEL_16;
      }
    }

    objc_autoreleasePoolPop(v14);
    -[HMDAccessorySetupMetricDispatcher subscribeToSettingsEvents:]((id *)&v15->super.super.isa);
    v11 = v31;
    goto LABEL_18;
  }
  v20 = (void *)MEMORY[0x1D17BA0A0]();
  v21 = self;
  HMFGetOSLogHandle();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v35 = v23;
    v36 = 2112;
    v37 = v7;
    _os_log_impl(&dword_1CD062000, v22, OS_LOG_TYPE_INFO, "%{public}@Do not handle topic: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v20);
LABEL_20:

}

- (void)timerDidFire:(id)a3
{
  const char *v4;
  HMDAccessorySetupMetricDispatcher *v5;
  id Property;
  HMDAccessorySetupMetricDispatcher *v7;
  const char *v8;
  HMDAccessorySetupMetricDispatcher *v9;
  id v11;
  void *v12;
  HMDAccessorySetupMetricDispatcher *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  HMDAccessorySetupMetricDispatcher *v17;
  NSObject *v18;
  const char *v19;
  void *v20;
  id v21;
  void *v22;
  id WeakRetained;
  void *v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  HMDAccessorySetupMetricDispatcher *v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = (HMDAccessorySetupMetricDispatcher *)a3;
  if (self)
    Property = objc_getProperty(self, v4, 72, 1);
  else
    Property = 0;
  v7 = (HMDAccessorySetupMetricDispatcher *)Property;
  if (v5 != 0 && v7 == v5)
    v9 = v5;
  else
    v9 = v7;
  if (v5 == 0 || v7 != v5 || self == 0)
  {

  }
  else
  {
    v11 = objc_getProperty(self, v8, 72, 1);

    if (v11)
    {
      v12 = (void *)MEMORY[0x1D17BA0A0]();
      v13 = self;
      HMFGetOSLogHandle();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v26 = v15;
        v27 = 2112;
        v28 = v13;
        _os_log_impl(&dword_1CD062000, v14, OS_LOG_TYPE_INFO, "%{public}@Timer did fire for setup metric dispatcher:%@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v12);
      if (-[HMDAccessorySetupMetricDispatcher languageSettingTime](v13, "languageSettingTime"))
      {
        -[HMDAccessorySetupMetricDispatcher submit](v13, "submit");
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "hmPrivateErrorWithCode:", 2030);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDAccessorySetupMetricDispatcher _queryRemoteAndSubmitWithConfigurationError:]((uint64_t)v13, v22);
        WeakRetained = objc_loadWeakRetained((id *)&v13->_radarInitiator);
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@, %@"), CFSTR("HomePod Database Sync Timed Out"), v22);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(WeakRetained, "requestRadarWithDisplayReason:radarTitle:componentName:componentVersion:componentID:", CFSTR("HomePod Database Sync Timed Out"), v24, CFSTR("HomeKit"), CFSTR("HomeKit Device Setup"), 1364036);

      }
      goto LABEL_22;
    }
  }
  v16 = (void *)MEMORY[0x1D17BA0A0]();
  v17 = self;
  HMFGetOSLogHandle();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (self)
      v21 = objc_getProperty(v17, v19, 72, 1);
    else
      v21 = 0;
    *(_DWORD *)buf = 138543874;
    v26 = v20;
    v27 = 2112;
    v28 = v5;
    v29 = 2112;
    v30 = v21;
    _os_log_impl(&dword_1CD062000, v18, OS_LOG_TYPE_ERROR, "%{public}@Unexpected delegate callback from timer:%@, expected:%@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v16);
LABEL_22:

}

- (void)submit
{
  -[HMDAccessorySetupMetricDispatcher _queryRemoteAndSubmitWithConfigurationError:]((uint64_t)self, 0);
}

- (void)markRepairSessionComplete
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_isRepairSession = 1;
  os_unfair_lock_unlock(p_lock);
}

- (void)markAccessoryAddCompleted
{
  os_unfair_lock_s *p_lock;
  void *v4;
  HMDAccessorySetupMetricDispatcher *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_addAccessoryFinishTime = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW) / 0x3B9ACA00;
  os_unfair_lock_unlock(p_lock);
  v4 = (void *)MEMORY[0x1D17BA0A0]();
  v5 = self;
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDAccessorySetupMetricDispatcher trackingInfo](v5, "trackingInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "accessoryUUID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543618;
    v11 = v7;
    v12 = 2112;
    v13 = v9;
    _os_log_impl(&dword_1CD062000, v6, OS_LOG_TYPE_INFO, "%{public}@Marked accessory add (%@)", (uint8_t *)&v10, 0x16u);

  }
  objc_autoreleasePoolPop(v4);
}

- (void)markAccessoryRemoved
{
  os_unfair_lock_s *p_lock;
  void *v4;
  HMDAccessorySetupMetricDispatcher *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_accessoryRemovedTime = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW) / 0x3B9ACA00;
  os_unfair_lock_unlock(p_lock);
  v4 = (void *)MEMORY[0x1D17BA0A0]();
  v5 = self;
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDAccessorySetupMetricDispatcher trackingInfo](v5, "trackingInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "accessoryUUID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543618;
    v12 = v7;
    v13 = 2112;
    v14 = v9;
    _os_log_impl(&dword_1CD062000, v6, OS_LOG_TYPE_INFO, "%{public}@No longer tracking accessory (%@) setup time as it was removed", (uint8_t *)&v11, 0x16u);

  }
  objc_autoreleasePoolPop(v4);
  objc_msgSend(MEMORY[0x1E0CB35C8], "hmPrivateErrorWithCode:", 2029);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessorySetupMetricDispatcher _queryRemoteAndSubmitWithConfigurationError:]((uint64_t)v5, v10);

}

- (void)markFirstSettingObserved
{
  os_unfair_lock_s *p_lock;
  void *v4;
  HMDAccessorySetupMetricDispatcher *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *logger;
  NSObject *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  if (self->_firstSettingTime)
  {
    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    self->_firstSettingTime = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW) / 0x3B9ACA00;
    os_unfair_lock_unlock(p_lock);
    v4 = (void *)MEMORY[0x1D17BA0A0]();
    v5 = self;
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDAccessorySetupMetricDispatcher trackingInfo](v5, "trackingInfo");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "accessoryUUID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543618;
      v15 = v7;
      v16 = 2112;
      v17 = v9;
      _os_log_impl(&dword_1CD062000, v6, OS_LOG_TYPE_INFO, "%{public}@Marked first setting observed (%@)", (uint8_t *)&v14, 0x16u);

    }
    objc_autoreleasePoolPop(v4);
    logger = v5->_logger;
    if (os_signpost_enabled(logger))
    {
      v11 = logger;
      -[HMDAccessorySetupMetricDispatcher trackingInfo](v5, "trackingInfo");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "accessoryUUID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138412290;
      v15 = v13;
      _os_signpost_emit_with_name_impl(&dword_1CD062000, v11, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "FirstAccessorySettingObserved", "accessoryUUID=%{signpost.description:attribute}@ ", (uint8_t *)&v14, 0xCu);

    }
  }
}

- (void)markLanguageSettingObserved
{
  os_unfair_lock_s *p_lock;
  void *v4;
  HMDAccessorySetupMetricDispatcher *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  if (self->_languageSettingTime)
  {
    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    self->_languageSettingTime = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW) / 0x3B9ACA00;
    os_unfair_lock_unlock(p_lock);
    v4 = (void *)MEMORY[0x1D17BA0A0]();
    v5 = self;
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDAccessorySetupMetricDispatcher trackingInfo](v5, "trackingInfo");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "accessoryUUID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543618;
      v11 = v7;
      v12 = 2112;
      v13 = v9;
      _os_log_impl(&dword_1CD062000, v6, OS_LOG_TYPE_INFO, "%{public}@Marked language setting observed (%@)", (uint8_t *)&v10, 0x16u);

    }
    objc_autoreleasePoolPop(v4);
  }
}

- (BOOL)submitted
{
  HMDAccessorySetupMetricDispatcher *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_submitted;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)addHome:(id)a3
{
  if (self)
    objc_storeWeak((id *)&self->_home, a3);
}

- (BOOL)hasHome:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HMDAccessorySetupMetricDispatcher home]((id *)&self->super.super.isa);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  return v5 == v4;
}

- (id)logIdentifier
{
  void *v2;
  void *v3;
  void *v4;

  -[HMDAccessorySetupMetricDispatcher trackingInfo](self, "trackingInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (HMDAccessorySetupMetricDispatcherDelegate)delegate
{
  return (HMDAccessorySetupMetricDispatcherDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSUUID)setupSessionIdentifier
{
  return self->_setupSessionIdentifier;
}

- (BOOL)isRepairSession
{
  return self->_isRepairSession;
}

- (unint64_t)firstSettingTime
{
  return self->_firstSettingTime;
}

- (unint64_t)languageSettingTime
{
  return self->_languageSettingTime;
}

- (unint64_t)addAccessoryFinishTime
{
  return self->_addAccessoryFinishTime;
}

- (unint64_t)accessoryRemovedTime
{
  return self->_accessoryRemovedTime;
}

- (unint64_t)lastPrimaryResidentAvailableTime
{
  return self->_lastPrimaryResidentAvailableTime;
}

- (unsigned)numberOfTimesPrimaryResidentChanged
{
  return self->_numberOfTimesPrimaryResidentChanged;
}

- (unint64_t)lastPrimaryClientConnectedTime
{
  return self->_lastPrimaryClientConnectedTime;
}

- (unsigned)numberOfTimesPrimaryClientConnected
{
  return self->_numberOfTimesPrimaryClientConnected;
}

- (unsigned)numberOfTimesPrimaryClientDisconnected
{
  return self->_numberOfTimesPrimaryClientDisconnected;
}

- (unsigned)numberOfTimesPrimaryClientConnectMessageFailed
{
  return self->_numberOfTimesPrimaryClientConnectMessageFailed;
}

- (NSError)lastPrimaryClientConnectMessageFailError
{
  return (NSError *)objc_getProperty(self, a2, 224, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastPrimaryClientConnectMessageFailError, 0);
  objc_storeStrong((id *)&self->_setupSessionIdentifier, 0);
  objc_storeStrong(&self->_discoveryAssertion, 0);
  objc_storeStrong((id *)&self->_primaryResidentDiagnosticInfoFetchError, 0);
  objc_storeStrong((id *)&self->_primaryResidentDiagnosticInfo, 0);
  objc_storeStrong((id *)&self->_accessoryDiagnosticInfoFetchError, 0);
  objc_storeStrong((id *)&self->_accessoryDiagnosticInfo, 0);
  objc_destroyWeak((id *)&self->_home);
  objc_storeStrong(&self->_networkInfoController, 0);
  objc_storeStrong(&self->_discoveryController, 0);
  objc_destroyWeak((id *)&self->_homeManager);
  objc_destroyWeak((id *)&self->_radarInitiator);
  objc_destroyWeak((id *)&self->_submitter);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_trackingInfo, 0);
  objc_storeStrong((id *)&self->_logger, 0);
}

- (id)home
{
  if (WeakRetained)
    WeakRetained = (id *)objc_loadWeakRetained(WeakRetained + 15);
  return WeakRetained;
}

- (void)_queryRemoteAndSubmitWithConfigurationError:(uint64_t)a1
{
  id v3;
  void *v4;
  NSObject *v5;
  id WeakRetained;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  const char *v20;
  void *v21;
  SEL v22;
  NSObject *Property;
  void *v24;
  _QWORD block[5];
  id v26;
  _QWORD v27[5];
  NSObject *v28;
  _QWORD v29[5];
  NSObject *v30;
  _QWORD v31[4];
  id v32;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    v24 = v3;
    v5 = dispatch_group_create();
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 120));
    objc_msgSend((id)a1, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "residentDeviceManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "primaryResidentDevice");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend((id)a1, "obtainDiscoveryAssertion");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = *(void **)(a1 + 160);
    *(_QWORD *)(a1 + 160) = v10;

    objc_msgSend(WeakRetained, "appleMediaAccessories");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = MEMORY[0x1E0C809B0];
    v31[0] = MEMORY[0x1E0C809B0];
    v31[1] = 3221225472;
    v31[2] = __81__HMDAccessorySetupMetricDispatcher__queryRemoteAndSubmitWithConfigurationError___block_invoke;
    v31[3] = &unk_1E89C1088;
    v14 = v9;
    v32 = v14;
    objc_msgSend(v12, "na_firstObjectPassingTest:", v31);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    dispatch_group_enter(v5);
    objc_msgSend((id)a1, "trackingInfo");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "accessoryUUID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = v13;
    v29[1] = 3221225472;
    v29[2] = __81__HMDAccessorySetupMetricDispatcher__queryRemoteAndSubmitWithConfigurationError___block_invoke_2;
    v29[3] = &unk_1E89C10B0;
    v29[4] = a1;
    v18 = v5;
    v30 = v18;
    objc_msgSend(v7, "querySetupDiagnosticStateForAccessoryUUID:completion:", v17, v29);

    if (v15)
    {
      dispatch_group_enter(v18);
      objc_msgSend(v15, "uuid");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v27[0] = v13;
      v27[1] = 3221225472;
      v27[2] = __81__HMDAccessorySetupMetricDispatcher__queryRemoteAndSubmitWithConfigurationError___block_invoke_3;
      v27[3] = &unk_1E89C10B0;
      v27[4] = a1;
      v28 = v18;
      objc_msgSend(v7, "querySetupDiagnosticStateForAccessoryUUID:completion:", v19, v27);

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmPrivateErrorWithCode:", 2032);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_setProperty_atomic((id)a1, v22, v21, 152);

    }
    Property = objc_getProperty((id)a1, v20, 64, 1);
    block[0] = v13;
    block[1] = 3221225472;
    block[2] = __81__HMDAccessorySetupMetricDispatcher__queryRemoteAndSubmitWithConfigurationError___block_invoke_4;
    block[3] = &unk_1E89C2328;
    block[4] = a1;
    v4 = v24;
    v26 = v24;
    dispatch_group_notify(v18, Property, block);

  }
}

uint64_t __81__HMDAccessorySetupMetricDispatcher__queryRemoteAndSubmitWithConfigurationError___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  objc_msgSend(a2, "idsIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "device");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "idsIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v3, "isEqual:", v5);

  return v6;
}

void __81__HMDAccessorySetupMetricDispatcher__queryRemoteAndSubmitWithConfigurationError___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  const char *v5;
  id v6;
  void *v7;
  const char *v8;
  void *v9;
  id newValue;

  newValue = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 32);
  if (v7)
  {
    objc_setProperty_atomic(v7, v5, newValue, 128);
    v9 = *(void **)(a1 + 32);
    if (v9)
      objc_setProperty_atomic(v9, v8, v6, 136);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));

}

void __81__HMDAccessorySetupMetricDispatcher__queryRemoteAndSubmitWithConfigurationError___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  const char *v5;
  id v6;
  void *v7;
  const char *v8;
  void *v9;
  id newValue;

  newValue = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 32);
  if (v7)
  {
    objc_setProperty_atomic(v7, v5, newValue, 144);
    v9 = *(void **)(a1 + 32);
    if (v9)
      objc_setProperty_atomic(v9, v8, v6, 152);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));

}

void __81__HMDAccessorySetupMetricDispatcher__queryRemoteAndSubmitWithConfigurationError___block_invoke_4(uint64_t a1)
{
  uint64_t v1;
  int v2;
  void *v3;
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  id v8;
  id WeakRetained;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  id *v19;
  NSObject *v20;
  void *v21;
  id *v22;
  void *v23;
  int v24;
  uint64_t v25;
  unsigned int v26;
  unsigned int v27;
  int v28;
  void *v29;
  SEL v30;
  id v31;
  SEL v32;
  void *v33;
  id v34;
  NSObject *v35;
  void *v36;
  id *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  const char *v42;
  void *v43;
  id v44;
  NSObject *v45;
  void *v46;
  SEL v47;
  id v48;
  void *v49;
  void *v50;
  id v51;
  NSObject *v52;
  void *v53;
  uint64_t v54;
  void *v55;
  uint64_t v56;
  SEL v57;
  id v58;
  void *v59;
  void *v60;
  void *v61;
  SEL v62;
  id v63;
  void *v64;
  SEL v65;
  void *v66;
  void *v67;
  void *v68;
  int v69;
  id v70;
  void *v71;
  SEL v72;
  const char *v73;
  void *v74;
  id v75;
  void *v76;
  void *v77;
  void *v78;
  id v79;
  NSObject *v80;
  void *v81;
  SEL v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  id v87;
  NSObject *v88;
  void *v89;
  void *v90;
  int v91;
  void *v92;
  void *v93;
  id *v94;
  NSObject *v95;
  void *v96;
  id v97;
  void *v98;
  void *v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  char v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  id v110;
  void *v111;
  unsigned int v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  char v117;
  void *v118;
  void *v119;
  void *v120;
  __uint64_t v121;
  void *v122;
  uint64_t v123;
  void *v124;
  uint64_t v125;
  void *v126;
  uint64_t v127;
  void *v128;
  uint64_t v129;
  void *v130;
  uint64_t v131;
  id v132;
  HMDAppleMediaAccessorySetupLogEvent *v133;
  HMDAppleMediaAccessorySetupLogEvent *v134;
  void *v135;
  __CFString *v136;
  void *v137;
  id v138;
  void *v139;
  id v140;
  id v141;
  id v142;
  uint8_t buf[4];
  void *v144;
  __int16 v145;
  id *v146;
  __int16 v147;
  void *v148;
  __int16 v149;
  id v150;
  uint64_t v151;

  v151 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  v142 = *(id *)(a1 + 40);
  if (!v1)
    goto LABEL_54;
  os_unfair_lock_lock_with_options();
  v2 = *(unsigned __int8 *)(v1 + 24);
  *(_BYTE *)(v1 + 24) = 1;
  os_unfair_lock_unlock((os_unfair_lock_t)(v1 + 8));
  if (v2)
  {
    v3 = (void *)MEMORY[0x1D17BA0A0]();
    v4 = (id)v1;
    HMFGetOSLogHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v144 = v6;
      _os_log_impl(&dword_1CD062000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@Can't submit the metric twice", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v3);
    goto LABEL_54;
  }
  objc_msgSend((id)v1, "trackingInfo");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v133 = [HMDAppleMediaAccessorySetupLogEvent alloc];
  v131 = objc_msgSend(v7, "role");
  v129 = objc_msgSend(v7, "startTime");
  v127 = objc_msgSend(v7, "endTime");
  v125 = objc_msgSend((id)v1, "addAccessoryFinishTime");
  v123 = objc_msgSend((id)v1, "accessoryRemovedTime");
  v121 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
  objc_msgSend(v7, "sessionError");
  v135 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v1, "setupSessionIdentifier");
  v139 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v139, "UUIDString");
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  v117 = objc_msgSend((id)v1, "isRepairSession");
  objc_msgSend(v7, "accessoryCategory");
  v137 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v137, "categoryType");
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  WeakRetained = objc_loadWeakRetained((id *)(v1 + 120));
  objc_msgSend(v8, "accessoryUUID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "accessoryWithUUID:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v12 = v11;
  else
    v12 = 0;
  v13 = v12;

  objc_msgSend(v13, "softwareVersion");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "versionString");
  v113 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setupClientBundleID");
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  v110 = objc_loadWeakRetained((id *)(v1 + 96));
  v109 = objc_msgSend(v110, "homepodSetupRetryCount");
  v108 = objc_msgSend((id)v1, "firstSettingTime");
  v107 = objc_msgSend((id)v1, "languageSettingTime");
  v141 = v8;
  v15 = objc_loadWeakRetained((id *)(v1 + 120));
  if (v15
    && (objc_msgSend(v141, "accessoryUUID"), v16 = (void *)objc_claimAutoreleasedReturnValue(), v16, v16))
  {
    objc_msgSend(v141, "accessoryUUID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v106 = objc_msgSend(v15, "defaultRoomContainsAccessoryWithUUID:", v17);

  }
  else
  {
    v18 = (void *)MEMORY[0x1D17BA0A0]();
    v19 = (id *)(id)v1;
    HMFGetOSLogHandle();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = (id *)objc_loadWeakRetained(v19 + 15);
      objc_msgSend(v141, "accessoryUUID");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v144 = v21;
      v145 = 2112;
      v146 = v22;
      v147 = 2112;
      v148 = v23;
      _os_log_impl(&dword_1CD062000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@Either home: %@ or accessory UUID: %@ is nil", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v18);
    v106 = 0;
  }

  v105 = objc_msgSend((id)v1, "lastPrimaryResidentAvailableTime");
  v24 = objc_msgSend((id)v1, "numberOfTimesPrimaryResidentChanged");
  v25 = objc_msgSend((id)v1, "lastPrimaryClientConnectedTime");
  v26 = objc_msgSend((id)v1, "numberOfTimesPrimaryClientConnected");
  v27 = objc_msgSend((id)v1, "numberOfTimesPrimaryClientDisconnected");
  v28 = objc_msgSend((id)v1, "numberOfTimesPrimaryClientConnectMessageFailed");
  objc_msgSend((id)v1, "lastPrimaryClientConnectMessageFailError");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_getProperty((id)v1, v30, 136, 1);
  LODWORD(v104) = v28;
  LODWORD(v103) = v24;
  LOBYTE(v102) = v106;
  LOBYTE(v100) = v117;
  v134 = -[HMDAppleMediaAccessorySetupLogEvent initWithRole:setupStartTime:setupEndTime:accessoryAddEndTime:accessoryRemoveTime:configurationEndTime:setupSessionError:setupSessionIdentifier:isRepairSession:category:accessorySoftwareVersion:setupClientBundleID:retryCount:firstSettingTime:languageSettingTime:accessoryInDefaultRoom:lastPrimaryResidentAvailableTime:numberOfTimesPrimaryResidentChanged:lastPrimaryClientConnectedTime:numberOfTimesPrimaryClientConnected:numberOfTimesPrimaryClientDisconnected:numberOfTimesPrimaryClientConnectMessageFailed:lastPrimaryClientConnectMessageFailError:accessoryDiagnosticInfoFetchError:primaryResidentDiagnosticInfoFetchError:](v133, "initWithRole:setupStartTime:setupEndTime:accessoryAddEndTime:accessoryRemoveTime:configurationEndTime:setupSessionError:setupSessionIdentifier:isRepairSession:category:accessorySoftwareVersion:setupClientBundleID:retryCount:firstSettingTime:languageSettingTime:accessoryInDefaultRoom:lastPrimaryResidentAvailableTime:numberOfTimesPrimaryResidentChanged:lastPrimaryClientConnectedTime:numberOfTimesPrimaryClientConnected:numberOfTimesPrimaryClientDisconnected:numberOfTimesPrimaryClientConnectMessageFailed:lastPrimaryClientConnectMessageFailError:accessoryDiagnosticInfoFetchError:primaryResidentDiagnosticInfoFetchError:", v131, v129, v127, v125, v123, v121 / 0x3B9ACA00, v135, v119, v100, v115, v113, v111,
           v109,
           v108,
           v107,
           v102,
           v105,
           v103,
           v25,
           __PAIR64__(v27, v26),
           v104,
           v29,
           v31,
           objc_getProperty((id)v1, v32, 152, 1));

  v138 = objc_loadWeakRetained((id *)(v1 + 80));
  v33 = (void *)MEMORY[0x1D17BA0A0]();
  v34 = (id)v1;
  HMFGetOSLogHandle();
  v35 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v141, "accessoryUUID");
    v37 = (id *)objc_claimAutoreleasedReturnValue();
    -[HMDAppleMediaAccessorySetupLogEvent coreAnalyticsEventDictionary](v134, "coreAnalyticsEventDictionary");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v144 = v36;
    v145 = 2112;
    v146 = v37;
    v147 = 2112;
    v148 = v38;
    v149 = 2112;
    v150 = v142;
    _os_log_impl(&dword_1CD062000, v35, OS_LOG_TYPE_INFO, "%{public}@Submitting accessory (%@) setup log event:%@ with error:%@", buf, 0x2Au);

  }
  objc_autoreleasePoolPop(v33);
  objc_msgSend(v138, "submitLogEvent:error:", v134, v142);
  v140 = objc_loadWeakRetained((id *)v34 + 15);
  objc_msgSend(v140, "currentDevice");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "idsIdentifier");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "UUIDString");
  v136 = (__CFString *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v140, "residentDeviceManager");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "primaryResidentDevice");
  v130 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v136)
  {
    v43 = (void *)MEMORY[0x1D17BA0A0]();
    v44 = v34;
    HMFGetOSLogHandle();
    v45 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v144 = v46;
      _os_log_impl(&dword_1CD062000, v45, OS_LOG_TYPE_ERROR, "%{public}@Could not get idsIdentifier of current device", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v43);
    v136 = CFSTR("Unknown");
  }
  v132 = objc_getProperty(v34, v42, 104, 1);
  v48 = objc_getProperty(v34, v47, 112, 1);
  v128 = v48;
  if (v140 && v132 && v48)
  {
    +[HMDMainDriver driver](HMDMainDriver, "driver");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "currentWiFiNetworkRSSI");
    v126 = (void *)objc_claimAutoreleasedReturnValue();

    if (v126)
      v112 = objc_msgSend(v126, "intValue");
    else
      v112 = 0;
    objc_msgSend(v34, "setupSessionIdentifier");
    v124 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v124, "UUIDString");
    v116 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMDMainDriver driver](HMDMainDriver, "driver");
    v122 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v122, "currentWiFiNetworkInfo");
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v140, "residentDeviceManager");
    v120 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v120, "residentDevices");
    v118 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = objc_msgSend(v118, "count");
    objc_msgSend(v140, "appleMediaAccessories");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = objc_msgSend(v55, "count");
    v58 = objc_getProperty(v34, v57, 128, 1);
    objc_msgSend(v130, "device");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "idsIdentifier");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "UUIDString");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v63 = objc_getProperty(v34, v62, 144, 1);
    objc_msgSend(v140, "uuid");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v101) = objc_msgSend(objc_getProperty(v34, v65, 152, 1), "code") == 2032;
    objc_msgSend(v34, "networkMetricWithDiscoveryController:networkInfoController:sessionID:idsIdentifierString:currentWiFiInfo:currentWiFiNetworkRSSI:numResidents:numAppleMediaAccessories:accessoryDiagnosticInfo:primaryResidentIdsIdentifierString:primaryResidentDiagnosticInfo:homeUUID:primaryResidentDiagnosticInfoFetched:", v132, v128, v116, v136, v114, v112, v54, v56, v58, v61, v63, v64, v101);
    v66 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v138, "submitLogEvent:error:", v66, v142);
  }
  else
  {
    v50 = (void *)MEMORY[0x1D17BA0A0]();
    v51 = v34;
    HMFGetOSLogHandle();
    v52 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v144 = v53;
      _os_log_impl(&dword_1CD062000, v52, OS_LOG_TYPE_ERROR, "%{public}@Did not find valid controllers to get network information", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v50);
  }
  objc_msgSend(v34, "releaseDiscoveryAssertionWithAssertionHandle:", *((_QWORD *)v34 + 20));
  objc_storeStrong((id *)v34 + 20, 0);
  objc_msgSend(v141, "accessoryCategory");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "categoryType");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  v69 = objc_msgSend(v68, "isEqualToString:", *MEMORY[0x1E0CB7A58]);

  v70 = objc_loadWeakRetained((id *)v34 + 12);
  v71 = v70;
  if (v69)
  {
    objc_msgSend(v70, "setHomepodSetupRetryCount:", objc_msgSend(v70, "homepodSetupRetryCount") + 1);
    if (objc_msgSend(objc_getProperty(v34, v72, 128, 1), "hasLastSetupInfo"))
    {
      objc_msgSend(objc_getProperty(v34, v73, 128, 1), "lastSetupInfo");
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      +[HMDCurrentAccessorySetupMetricDispatcher homepodSetupLogEventFromProtoSetupInfo:](HMDCurrentAccessorySetupMetricDispatcher, "homepodSetupLogEventFromProtoSetupInfo:", v74);
      v75 = (id)objc_claimAutoreleasedReturnValue();

      if (v75)
      {
        objc_msgSend(v34, "setupSessionIdentifier");
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v76, "UUIDString");
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v75, "setSetupSessionIdentifier:", v77);

      }
      v78 = (void *)MEMORY[0x1D17BA0A0](objc_msgSend(v138, "submitLogEvent:", v75));
      v79 = v34;
      HMFGetOSLogHandle();
      v80 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v80, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v144 = v81;
        _os_log_impl(&dword_1CD062000, v80, OS_LOG_TYPE_DEFAULT, "%{public}@Submitted retrieved homepod log event.", buf, 0xCu);

      }
    }
    else
    {
      if (!objc_getProperty(v34, v73, 136, 1))
      {
        v86 = (void *)MEMORY[0x1D17BA0A0]();
        v87 = v34;
        HMFGetOSLogHandle();
        v88 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v88, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v89 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v144 = v89;
          _os_log_impl(&dword_1CD062000, v88, OS_LOG_TYPE_ERROR, "%{public}@No homepod setup log event found.", buf, 0xCu);

        }
        objc_autoreleasePoolPop(v86);
        goto LABEL_45;
      }
      v75 = -[HMDHomePodSetupLatencyLogEvent initLogEventWithInitialState:]([HMDHomePodSetupLatencyLogEvent alloc], "initLogEventWithInitialState:", 0x10000);
      objc_msgSend(v75, "setError:", objc_getProperty(v34, v82, 136, 1));
      objc_msgSend(v34, "setupSessionIdentifier");
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v83, "UUIDString");
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v75, "setSetupSessionIdentifier:", v84);

      v78 = (void *)MEMORY[0x1D17BA0A0](objc_msgSend(v138, "submitLogEvent:", v75));
      v79 = v34;
      HMFGetOSLogHandle();
      v80 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v80, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v85 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v144 = v85;
        _os_log_impl(&dword_1CD062000, v80, OS_LOG_TYPE_DEFAULT, "%{public}@Submitted homepod log event with fetch error.", buf, 0xCu);

      }
    }

    objc_autoreleasePoolPop(v78);
  }
LABEL_45:
  if (!v142)
  {
    objc_msgSend(v141, "sessionError");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    v91 = v90 ? 0 : v69;

    if (v91)
      objc_msgSend(v71, "setHomepodSetupRetryCount:", 0);
  }
  os_unfair_lock_lock_with_options();
  objc_msgSend(*((id *)v34 + 9), "suspend");
  v92 = (void *)*((_QWORD *)v34 + 9);
  *((_QWORD *)v34 + 9) = 0;

  os_unfair_lock_unlock((os_unfair_lock_t)v34 + 2);
  v93 = (void *)MEMORY[0x1D17BA0A0]();
  v94 = (id *)v34;
  HMFGetOSLogHandle();
  v95 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v95, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v144 = v96;
    v145 = 2112;
    v146 = v94;
    _os_log_impl(&dword_1CD062000, v95, OS_LOG_TYPE_INFO, "%{public}@Removing setup metric dispatcher:%@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v93);
  v97 = objc_loadWeakRetained(v94 + 12);
  objc_msgSend(v94, "trackingInfo");
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v98, "accessoryUUID");
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v97, "removeAccessorySetupMetricDispatcherForAccessoryUUID:", v99);

LABEL_54:
}

- (void)subscribeToSettingsEvents:(id *)a1
{
  id WeakRetained;
  void *v3;
  uint64_t v4;
  _QWORD *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  id *v17;
  NSObject *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  id *v24;
  NSObject *v25;
  void *v26;
  _QWORD v27[5];
  _QWORD v28[4];
  id v29;
  id v30;
  __int128 buf;
  void (*v32)();
  void *v33;
  id v34;
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained(a1 + 15);
  objc_msgSend(WeakRetained, "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = MEMORY[0x1E0C809B0];
  v5 = &unk_1CDB8E000;
  if (v3)
  {
    objc_msgSend(a1, "trackingInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "accessoryUUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(MEMORY[0x1E0CBA2D0], "defaultSettingsAllKeyPaths");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_QWORD *)&buf = v4;
      *((_QWORD *)&buf + 1) = 3221225472;
      v32 = __60__HMDAccessorySetupMetricDispatcher_accessorySettingsTopics__block_invoke;
      v33 = &unk_1E89C1058;
      v9 = v3;
      v34 = v9;
      v10 = v7;
      v35 = v10;
      objc_msgSend(v8, "na_map:", &buf);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CBA2D0], "languageKeyPaths");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v28[0] = v4;
      v28[1] = 3221225472;
      v28[2] = __60__HMDAccessorySetupMetricDispatcher_accessorySettingsTopics__block_invoke_2;
      v28[3] = &unk_1E89C1058;
      v29 = v9;
      v30 = v10;
      objc_msgSend(v12, "na_map:", v28);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "arrayByAddingObjectsFromArray:", v11);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      v5 = (_QWORD *)&unk_1CDB8E000;
    }
    else
    {
      v14 = (void *)MEMORY[0x1E0C9AA60];
    }

  }
  else
  {
    v14 = (void *)MEMORY[0x1E0C9AA60];
  }

  if (objc_msgSend(v14, "count"))
  {
    v15 = v14;
    v16 = (void *)MEMORY[0x1D17BA0A0]();
    v17 = a1;
    HMFGetOSLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf) = 138543362;
      *(_QWORD *)((char *)&buf + 4) = v19;
      _os_log_impl(&dword_1CD062000, v18, OS_LOG_TYPE_INFO, "%{public}@Unsubscribing to accessory settings to generate setup time metric", (uint8_t *)&buf, 0xCu);

    }
    objc_autoreleasePoolPop(v16);
    v20 = objc_loadWeakRetained(v17 + 12);
    objc_msgSend(v20, "localAndRemoteSubscriptionProvider");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = v4;
    v27[1] = v5[202];
    v27[2] = __63__HMDAccessorySetupMetricDispatcher_subscribeToSettingsEvents___block_invoke;
    v27[3] = &unk_1E89C1030;
    v27[4] = v17;
    v22 = (void *)MEMORY[0x1E0C9AA60];
    objc_msgSend(v21, "changeRegistrationsForConsumer:topicFilterAdditions:topicFilterRemovals:completion:", v17, MEMORY[0x1E0C9AA60], v15, v27);

  }
  else
  {
    v23 = (void *)MEMORY[0x1D17BA0A0]();
    v24 = a1;
    HMFGetOSLogHandle();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf) = 138543362;
      *(_QWORD *)((char *)&buf + 4) = v26;
      _os_log_impl(&dword_1CD062000, v25, OS_LOG_TYPE_ERROR, "%{public}@No settings topics", (uint8_t *)&buf, 0xCu);

    }
    objc_autoreleasePoolPop(v23);
  }

}

void __63__HMDAccessorySetupMetricDispatcher_subscribeToSettingsEvents___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  const char *v12;
  NSObject *v13;
  os_log_type_t v14;
  uint32_t v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  NSObject *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint8_t v36[128];
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  id v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = (void *)MEMORY[0x1D17BA0A0]();
  v8 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v6)
  {
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      goto LABEL_7;
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v38 = v11;
    v39 = 2112;
    v40 = v6;
    v12 = "%{public}@Subscription to settings resulted in error: %@";
    v13 = v10;
    v14 = OS_LOG_TYPE_ERROR;
    v15 = 22;
  }
  else
  {
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      goto LABEL_7;
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v38 = v11;
    v12 = "%{public}@Subscription to settings topics was successful";
    v13 = v10;
    v14 = OS_LOG_TYPE_INFO;
    v15 = 12;
  }
  _os_log_impl(&dword_1CD062000, v13, v14, v12, buf, v15);

LABEL_7:
  v30 = v6;

  objc_autoreleasePoolPop(v7);
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v16 = v5;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v33;
    v31 = v16;
    do
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v33 != v19)
          objc_enumerationMutation(v16);
        v21 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
        objc_msgSend(v16, "objectForKeyedSubscript:", v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = (void *)MEMORY[0x1D17BA0A0]();
        v24 = *(id *)(a1 + 32);
        HMFGetOSLogHandle();
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v26 = v18;
          v27 = a1;
          v28 = v19;
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v38 = v29;
          v39 = 2112;
          v40 = v21;
          _os_log_impl(&dword_1CD062000, v25, OS_LOG_TYPE_INFO, "%{public}@Received cached event on settings topic: %@ during subscription", buf, 0x16u);

          v19 = v28;
          a1 = v27;
          v18 = v26;
          v16 = v31;
        }

        objc_autoreleasePoolPop(v23);
        objc_msgSend(*(id *)(a1 + 32), "didReceiveEvent:topic:", v22, v21);

      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    }
    while (v18);
  }

}

void __60__HMDAccessorySetupMetricDispatcher_accessorySettingsTopics__block_invoke()
{
  JUMPOUT(0x1D17B8E58);
}

void __60__HMDAccessorySetupMetricDispatcher_accessorySettingsTopics__block_invoke_2()
{
  JUMPOUT(0x1D17B8E58);
}

id __99__HMDAccessorySetupMetricDispatcher_initWithQueue_trackingInfo_setupSessionIdentifier_homeManager___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  void *v4;

  v2 = (objc_class *)MEMORY[0x1E0D286C8];
  v3 = a2;
  v4 = (void *)objc_msgSend([v2 alloc], "initWithTimeInterval:options:", 8, 900.0);
  objc_msgSend(v4, "setDelegate:", v3);

  objc_msgSend(v4, "resume");
  return v4;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t39_179126 != -1)
    dispatch_once(&logCategory__hmf_once_t39_179126, &__block_literal_global_92);
  return (id)logCategory__hmf_once_v40_179127;
}

void __48__HMDAccessorySetupMetricDispatcher_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v40_179127;
  logCategory__hmf_once_v40_179127 = v0;

}

@end
