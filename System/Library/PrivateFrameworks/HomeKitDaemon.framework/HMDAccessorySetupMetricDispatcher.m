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
  v17 = sub_222596678();
  v44 = *(_QWORD *)(v17 - 8);
  v45 = v17;
  MEMORY[0x24BDAC7A8](v17);
  v19 = (char *)&v33 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v34 = sub_222596CF0();
  v42 = v20;
  v33 = sub_222596CF0();
  v41 = v21;
  if (a12)
  {
    v22 = sub_222596CF0();
    v24 = v23;
  }
  else
  {
    v22 = 0;
    v24 = 0;
  }
  sub_222596648();
  v25 = a3;
  v26 = a4;
  v27 = v35;
  v35 = a11;
  v28 = v37;
  v29 = v37;
  v30 = v36;
  v31 = sub_221924F10(v25, v26, v34, v42, v33, v41, v27, v43, v38, v39, a11, v22, v24, v28, (uint64_t)v19, v40);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v44 + 8))(v19, v45);
  return v31;
}

- (id)obtainDiscoveryAssertion
{
  return (id)_sSo33HMDAccessorySetupMetricDispatcherC13HomeKitDaemonE24obtainDiscoveryAssertionyXlyF_0();
}

- (void)releaseDiscoveryAssertionWithAssertionHandle:(id)a3
{
  HMDAccessorySetupMetricDispatcher *v4;

  swift_unknownObjectRetain();
  v4 = self;
  _sSo33HMDAccessorySetupMetricDispatcherC13HomeKitDaemonE25releaseDiscoveryAssertion15assertionHandleyyXl_tF_0();
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
  v18 = -[HMDAccessorySetupMetricDispatcher initWithQueue:discoveryController:networkInfoController:trackingInfo:setupSessionIdentifier:homeManager:logEventSubmitter:radarInitiator:timerFactory:](self, "initWithQueue:discoveryController:networkInfoController:trackingInfo:setupSessionIdentifier:homeManager:logEventSubmitter:radarInitiator:timerFactory:", v12, v20, v14, v11, v10, v9, v15, v17, &__block_literal_global_245638);

  return v18;
}

- (void)addRemoteEventRouterAssertion:(id)a3
{
  id v4;
  void *v5;
  HMDAccessorySetupMetricDispatcher *v6;
  NSObject *v7;
  void *v8;
  const char *v9;
  int v10;
  void *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x227676638]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543618;
    v11 = v8;
    v12 = 2112;
    v13 = v4;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Setting remote event router assertion for setup metric collection: %@", (uint8_t *)&v10, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  if (v6)
    objc_setProperty_atomic(v6, v9, v4, 160);

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

  v40 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x24BDD7640], "decodeTopic:", v7);
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
    objc_msgSend(MEMORY[0x24BDD7708], "decodeSettingFromEvent:error:", v10, &v33);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v33;
    if (!v12)
    {
      v24 = v11;
      v25 = (void *)MEMORY[0x227676638]();
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
        _os_log_impl(&dword_2218F0000, v27, OS_LOG_TYPE_ERROR, "%{public}@Nil settings value for settings update event: %@ topic: %@", buf, 0x20u);

        v13 = v32;
      }

      objc_autoreleasePoolPop(v25);
      v11 = v24;
      goto LABEL_18;
    }
    if (-[HMDAccessorySetupMetricDispatcher submitted](self, "submitted"))
    {
      v31 = v11;
      v14 = (void *)MEMORY[0x227676638]();
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
        _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_INFO, v19, buf, 0xCu);

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
      v14 = (void *)MEMORY[0x227676638](-[HMDAccessorySetupMetricDispatcher submit](self, "submit"));
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
    -[HMDAccessorySetupMetricDispatcher subscribeToSettingsEvents:]((id *)&v15->super.super.isa, 0);
    v11 = v31;
    goto LABEL_18;
  }
  v20 = (void *)MEMORY[0x227676638]();
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
    _os_log_impl(&dword_2218F0000, v22, OS_LOG_TYPE_INFO, "%{public}@Do not handle topic: %@", buf, 0x16u);

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

  v31 = *MEMORY[0x24BDAC8D0];
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
      v12 = (void *)MEMORY[0x227676638]();
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
        _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_INFO, "%{public}@Timer did fire for setup metric dispatcher:%@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v12);
      if (-[HMDAccessorySetupMetricDispatcher languageSettingTime](v13, "languageSettingTime"))
      {
        -[HMDAccessorySetupMetricDispatcher submit](v13, "submit");
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDD1540], "hmPrivateErrorWithCode:", 2030);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDAccessorySetupMetricDispatcher _queryRemoteAndSubmitWithConfigurationError:]((uint64_t)v13, v22);
        WeakRetained = objc_loadWeakRetained((id *)&v13->_radarInitiator);
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@, %@"), CFSTR("HomePod Database Sync Timed Out"), v22);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(WeakRetained, "requestRadarWithDisplayReason:radarTitle:componentName:componentVersion:componentID:", CFSTR("HomePod Database Sync Timed Out"), v24, CFSTR("HomeKit"), CFSTR("HomeKit Device Setup"), 1364036);

      }
      goto LABEL_22;
    }
  }
  v16 = (void *)MEMORY[0x227676638]();
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
    _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_ERROR, "%{public}@Unexpected delegate callback from timer:%@, expected:%@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v16);
LABEL_22:

}

- (void)submit
{
  -[HMDAccessorySetupMetricDispatcher _queryRemoteAndSubmitWithConfigurationError:]((uint64_t)self, 0);
}

- (void)markPrimaryResidentChanged
{
  os_unfair_lock_s *p_lock;
  void *v4;
  HMDAccessorySetupMetricDispatcher *v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  ++self->_numberOfTimesPrimaryResidentChanged;
  if (!self->_lastPrimaryResidentAvailableTime)
    self->_lastPrimaryResidentAvailableTime = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW) / 0x3B9ACA00;
  os_unfair_lock_unlock(p_lock);
  v4 = (void *)MEMORY[0x227676638]();
  v5 = self;
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543362;
    v9 = v7;
    _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_INFO, "%{public}@Marked primary resident is available", (uint8_t *)&v8, 0xCu);

  }
  objc_autoreleasePoolPop(v4);
}

- (void)markEventRouterPrimaryClientConnectStatusChanged:(BOOL)a3
{
  _BOOL4 v3;
  os_unfair_lock_s *p_lock;
  int *v6;
  void *v7;
  HMDAccessorySetupMetricDispatcher *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v3 = a3;
  v16 = *MEMORY[0x24BDAC8D0];
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  if (self->_lastPrimaryResidentAvailableTime)
  {
    if (v3)
    {
      self->_lastPrimaryClientConnectedTime = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW) / 0x3B9ACA00;
      v6 = &OBJC_IVAR___HMDAccessorySetupMetricDispatcher__numberOfTimesPrimaryClientConnected;
    }
    else
    {
      v6 = &OBJC_IVAR___HMDAccessorySetupMetricDispatcher__numberOfTimesPrimaryClientDisconnected;
    }
    ++*(_DWORD *)((char *)&self->super.super.isa + *v6);
    os_unfair_lock_unlock(p_lock);
    v7 = (void *)MEMORY[0x227676638]();
    v8 = self;
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      HMFBooleanToString();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543618;
      v13 = v10;
      v14 = 2112;
      v15 = v11;
      _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@Marked primary client connection status changed: %@", (uint8_t *)&v12, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
  }
  else
  {
    os_unfair_lock_unlock(p_lock);
  }
}

- (void)markEventRouterPrimaryClientConnectMessageFailedWithError:(id)a3
{
  id v5;
  void *v6;
  HMDAccessorySetupMetricDispatcher *v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  os_unfair_lock_lock_with_options();
  if (self->_lastPrimaryResidentAvailableTime)
  {
    ++self->_numberOfTimesPrimaryClientConnectMessageFailed;
    objc_storeStrong((id *)&self->_lastPrimaryClientConnectMessageFailError, a3);
    os_unfair_lock_unlock(&self->_lock);
    v6 = (void *)MEMORY[0x227676638]();
    v7 = self;
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543618;
      v11 = v9;
      v12 = 2112;
      v13 = v5;
      _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_INFO, "%{public}@Marked primary client connect message failed with error: %@", (uint8_t *)&v10, 0x16u);

    }
    objc_autoreleasePoolPop(v6);
  }
  else
  {
    os_unfair_lock_unlock(&self->_lock);
  }

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

  v14 = *MEMORY[0x24BDAC8D0];
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_addAccessoryFinishTime = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW) / 0x3B9ACA00;
  os_unfair_lock_unlock(p_lock);
  v4 = (void *)MEMORY[0x227676638]();
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
    _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_INFO, "%{public}@Marked accessory add (%@)", (uint8_t *)&v10, 0x16u);

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

  v15 = *MEMORY[0x24BDAC8D0];
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_accessoryRemovedTime = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW) / 0x3B9ACA00;
  os_unfair_lock_unlock(p_lock);
  v4 = (void *)MEMORY[0x227676638]();
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
    _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_INFO, "%{public}@No longer tracking accessory (%@) setup time as it was removed", (uint8_t *)&v11, 0x16u);

  }
  objc_autoreleasePoolPop(v4);
  objc_msgSend(MEMORY[0x24BDD1540], "hmPrivateErrorWithCode:", 2029);
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

  v18 = *MEMORY[0x24BDAC8D0];
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
    v4 = (void *)MEMORY[0x227676638]();
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
      _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_INFO, "%{public}@Marked first setting observed (%@)", (uint8_t *)&v14, 0x16u);

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
      _os_signpost_emit_with_name_impl(&dword_2218F0000, v11, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "FirstAccessorySettingObserved", "accessoryUUID=%{signpost.description:attribute}@ ", (uint8_t *)&v14, 0xCu);

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

  v14 = *MEMORY[0x24BDAC8D0];
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
    v4 = (void *)MEMORY[0x227676638]();
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
      _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_INFO, "%{public}@Marked language setting observed (%@)", (uint8_t *)&v10, 0x16u);

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
  id v4;
  BOOL v5;
  id v6;

  v4 = a3;
  if (self)
  {
    v6 = v4;
    objc_storeWeak((id *)&self->_home, v4);
    v5 = -[HMDAccessorySetupMetricDispatcher submitted](self, "submitted");
    v4 = v6;
    if (!v5)
    {
      -[HMDAccessorySetupMetricDispatcher subscribeToSettingsEvents:]((id *)&self->super.super.isa, 1);
      v4 = v6;
    }
  }

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
  return (NSError *)objc_getProperty(self, a2, 232, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastPrimaryClientConnectMessageFailError, 0);
  objc_storeStrong((id *)&self->_setupSessionIdentifier, 0);
  objc_storeStrong(&self->_discoveryAssertion, 0);
  objc_storeStrong((id *)&self->_remoteEventRouterAssertion, 0);
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

- (void)subscribeToSettingsEvents:(id *)a1
{
  id WeakRetained;
  void *v5;
  uint64_t v6;
  _QWORD *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  id *v19;
  NSObject *v20;
  _BOOL4 v21;
  void *v22;
  void *v23;
  void *v24;
  id *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  _QWORD v31[5];
  _QWORD v32[4];
  id v33;
  id v34;
  __int128 buf;
  void (*v36)();
  void *v37;
  id v38;
  id v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained(a1 + 15);
  objc_msgSend(WeakRetained, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = MEMORY[0x24BDAC760];
  v7 = &unk_22269F000;
  if (v5)
  {
    objc_msgSend(a1, "trackingInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "accessoryUUID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(MEMORY[0x24BDD7418], "defaultSettingsAllKeyPaths");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_QWORD *)&buf = v6;
      *((_QWORD *)&buf + 1) = 3221225472;
      v36 = __60__HMDAccessorySetupMetricDispatcher_accessorySettingsTopics__block_invoke;
      v37 = &unk_24E79A8E8;
      v11 = v5;
      v38 = v11;
      v12 = v9;
      v39 = v12;
      objc_msgSend(v10, "na_map:", &buf);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDD7418], "languageKeyPaths");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v32[0] = v6;
      v32[1] = 3221225472;
      v32[2] = __60__HMDAccessorySetupMetricDispatcher_accessorySettingsTopics__block_invoke_2;
      v32[3] = &unk_24E79A8E8;
      v33 = v11;
      v34 = v12;
      objc_msgSend(v14, "na_map:", v32);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "arrayByAddingObjectsFromArray:", v13);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      v7 = (_QWORD *)&unk_22269F000;
    }
    else
    {
      v16 = (void *)MEMORY[0x24BDBD1A8];
    }

  }
  else
  {
    v16 = (void *)MEMORY[0x24BDBD1A8];
  }

  if (objc_msgSend(v16, "count"))
  {
    v17 = v16;
    v18 = (void *)MEMORY[0x227676638]();
    v19 = a1;
    HMFGetOSLogHandle();
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = os_log_type_enabled(v20, OS_LOG_TYPE_INFO);
    if (a2)
    {
      if (v21)
      {
        HMFGetLogIdentifier();
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(buf) = 138543362;
        *(_QWORD *)((char *)&buf + 4) = v22;
        _os_log_impl(&dword_2218F0000, v20, OS_LOG_TYPE_INFO, "%{public}@Subscribing to accessory settings to generate setup time metric", (uint8_t *)&buf, 0xCu);

      }
      v23 = (void *)MEMORY[0x24BDBD1A8];
    }
    else
    {
      if (v21)
      {
        HMFGetLogIdentifier();
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(buf) = 138543362;
        *(_QWORD *)((char *)&buf + 4) = v28;
        _os_log_impl(&dword_2218F0000, v20, OS_LOG_TYPE_INFO, "%{public}@Unsubscribing to accessory settings to generate setup time metric", (uint8_t *)&buf, 0xCu);

      }
      v23 = v17;
      v17 = (id)MEMORY[0x24BDBD1A8];
    }

    objc_autoreleasePoolPop(v18);
    v29 = objc_loadWeakRetained(v19 + 12);
    objc_msgSend(v29, "localAndRemoteSubscriptionProvider");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31[0] = v6;
    v31[1] = v7[398];
    v31[2] = __63__HMDAccessorySetupMetricDispatcher_subscribeToSettingsEvents___block_invoke;
    v31[3] = &unk_24E79A980;
    v31[4] = v19;
    objc_msgSend(v30, "changeRegistrationsForConsumer:topicFilterAdditions:topicFilterRemovals:completion:", v19, v17, v23, v31);

  }
  else
  {
    v24 = (void *)MEMORY[0x227676638]();
    v25 = a1;
    HMFGetOSLogHandle();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf) = 138543362;
      *(_QWORD *)((char *)&buf + 4) = v27;
      _os_log_impl(&dword_2218F0000, v26, OS_LOG_TYPE_ERROR, "%{public}@No settings topics", (uint8_t *)&buf, 0xCu);

    }
    objc_autoreleasePoolPop(v24);
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

  v41 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = (void *)MEMORY[0x227676638]();
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
  _os_log_impl(&dword_2218F0000, v13, v14, v12, buf, v15);

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
        v23 = (void *)MEMORY[0x227676638]();
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
          _os_log_impl(&dword_2218F0000, v25, OS_LOG_TYPE_INFO, "%{public}@Received cached event on settings topic: %@ during subscription", buf, 0x16u);

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
  JUMPOUT(0x2276752E8);
}

void __60__HMDAccessorySetupMetricDispatcher_accessorySettingsTopics__block_invoke_2()
{
  JUMPOUT(0x2276752E8);
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
    v11 = *(void **)(a1 + 168);
    *(_QWORD *)(a1 + 168) = v10;

    objc_msgSend(WeakRetained, "appleMediaAccessories");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = MEMORY[0x24BDAC760];
    v31[0] = MEMORY[0x24BDAC760];
    v31[1] = 3221225472;
    v31[2] = __81__HMDAccessorySetupMetricDispatcher__queryRemoteAndSubmitWithConfigurationError___block_invoke;
    v31[3] = &unk_24E79A558;
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
    v29[3] = &unk_24E79A580;
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
      v27[3] = &unk_24E79A580;
      v27[4] = a1;
      v28 = v18;
      objc_msgSend(v7, "querySetupDiagnosticStateForAccessoryUUID:completion:", v19, v27);

    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1540], "hmPrivateErrorWithCode:", 2032);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_setProperty_atomic((id)a1, v22, v21, 152);

    }
    Property = objc_getProperty((id)a1, v20, 64, 1);
    block[0] = v13;
    block[1] = 3221225472;
    block[2] = __81__HMDAccessorySetupMetricDispatcher__queryRemoteAndSubmitWithConfigurationError___block_invoke_4;
    block[3] = &unk_24E79C268;
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
  objc_msgSend(*(id *)(a1 + 32), "messageAddress");
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
  const char *v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  id v8;
  id v9;
  id WeakRetained;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  id *v20;
  NSObject *v21;
  void *v22;
  id *v23;
  void *v24;
  int v25;
  uint64_t v26;
  unsigned int v27;
  unsigned int v28;
  int v29;
  void *v30;
  SEL v31;
  id v32;
  SEL v33;
  void *v34;
  id v35;
  NSObject *v36;
  void *v37;
  id *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  const char *v43;
  void *v44;
  id v45;
  NSObject *v46;
  void *v47;
  SEL v48;
  id v49;
  void *v50;
  void *v51;
  id v52;
  NSObject *v53;
  void *v54;
  uint64_t v55;
  void *v56;
  uint64_t v57;
  SEL v58;
  id v59;
  void *v60;
  void *v61;
  void *v62;
  SEL v63;
  id v64;
  void *v65;
  SEL v66;
  void *v67;
  void *v68;
  void *v69;
  int v70;
  id v71;
  void *v72;
  SEL v73;
  const char *v74;
  void *v75;
  id v76;
  void *v77;
  void *v78;
  void *v79;
  id v80;
  NSObject *v81;
  void *v82;
  SEL v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  id v88;
  NSObject *v89;
  void *v90;
  void *v91;
  int v92;
  void *v93;
  void *v94;
  id *v95;
  NSObject *v96;
  void *v97;
  id v98;
  void *v99;
  void *v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  char v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  id v111;
  void *v112;
  unsigned int v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  char v118;
  void *v119;
  void *v120;
  void *v121;
  __uint64_t v122;
  void *v123;
  uint64_t v124;
  void *v125;
  uint64_t v126;
  void *v127;
  uint64_t v128;
  void *v129;
  uint64_t v130;
  void *v131;
  uint64_t v132;
  id v133;
  HMDAppleMediaAccessorySetupLogEvent *v134;
  HMDAppleMediaAccessorySetupLogEvent *v135;
  void *v136;
  __CFString *v137;
  void *v138;
  id v139;
  void *v140;
  id v141;
  id v142;
  id v143;
  uint8_t buf[4];
  void *v145;
  __int16 v146;
  id *v147;
  __int16 v148;
  void *v149;
  __int16 v150;
  id v151;
  uint64_t v152;

  v152 = *MEMORY[0x24BDAC8D0];
  v1 = *(_QWORD *)(a1 + 32);
  v143 = *(id *)(a1 + 40);
  if (!v1)
    goto LABEL_54;
  os_unfair_lock_lock_with_options();
  v2 = *(unsigned __int8 *)(v1 + 24);
  *(_BYTE *)(v1 + 24) = 1;
  os_unfair_lock_unlock((os_unfair_lock_t)(v1 + 8));
  if (v2)
  {
    v4 = (void *)MEMORY[0x227676638]();
    v5 = (id)v1;
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v145 = v7;
      _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@Can't submit the metric twice", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v4);
    goto LABEL_54;
  }
  objc_msgSend(objc_getProperty((id)v1, v3, 160, 1), "cancel");
  objc_msgSend((id)v1, "trackingInfo");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v134 = [HMDAppleMediaAccessorySetupLogEvent alloc];
  v132 = objc_msgSend(v8, "role");
  v130 = objc_msgSend(v8, "startTime");
  v128 = objc_msgSend(v8, "endTime");
  v126 = objc_msgSend((id)v1, "addAccessoryFinishTime");
  v124 = objc_msgSend((id)v1, "accessoryRemovedTime");
  v122 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
  objc_msgSend(v8, "sessionError");
  v136 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v1, "setupSessionIdentifier");
  v140 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v140, "UUIDString");
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  v118 = objc_msgSend((id)v1, "isRepairSession");
  objc_msgSend(v8, "accessoryCategory");
  v138 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v138, "categoryType");
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  WeakRetained = objc_loadWeakRetained((id *)(v1 + 120));
  objc_msgSend(v9, "accessoryUUID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "accessoryWithUUID:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v13 = v12;
  else
    v13 = 0;
  v14 = v13;

  objc_msgSend(v14, "softwareVersion");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "versionString");
  v114 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setupClientBundleID");
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  v111 = objc_loadWeakRetained((id *)(v1 + 96));
  v110 = objc_msgSend(v111, "homepodSetupRetryCount");
  v109 = objc_msgSend((id)v1, "firstSettingTime");
  v108 = objc_msgSend((id)v1, "languageSettingTime");
  v142 = v9;
  v16 = objc_loadWeakRetained((id *)(v1 + 120));
  if (v16
    && (objc_msgSend(v142, "accessoryUUID"), v17 = (void *)objc_claimAutoreleasedReturnValue(), v17, v17))
  {
    objc_msgSend(v142, "accessoryUUID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v107 = objc_msgSend(v16, "defaultRoomContainsAccessoryWithUUID:", v18);

  }
  else
  {
    v19 = (void *)MEMORY[0x227676638]();
    v20 = (id *)(id)v1;
    HMFGetOSLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = (id *)objc_loadWeakRetained(v20 + 15);
      objc_msgSend(v142, "accessoryUUID");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v145 = v22;
      v146 = 2112;
      v147 = v23;
      v148 = 2112;
      v149 = v24;
      _os_log_impl(&dword_2218F0000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@Either home: %@ or accessory UUID: %@ is nil", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v19);
    v107 = 0;
  }

  v106 = objc_msgSend((id)v1, "lastPrimaryResidentAvailableTime");
  v25 = objc_msgSend((id)v1, "numberOfTimesPrimaryResidentChanged");
  v26 = objc_msgSend((id)v1, "lastPrimaryClientConnectedTime");
  v27 = objc_msgSend((id)v1, "numberOfTimesPrimaryClientConnected");
  v28 = objc_msgSend((id)v1, "numberOfTimesPrimaryClientDisconnected");
  v29 = objc_msgSend((id)v1, "numberOfTimesPrimaryClientConnectMessageFailed");
  objc_msgSend((id)v1, "lastPrimaryClientConnectMessageFailError");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_getProperty((id)v1, v31, 136, 1);
  LODWORD(v105) = v29;
  LODWORD(v104) = v25;
  LOBYTE(v103) = v107;
  LOBYTE(v101) = v118;
  v135 = -[HMDAppleMediaAccessorySetupLogEvent initWithRole:setupStartTime:setupEndTime:accessoryAddEndTime:accessoryRemoveTime:configurationEndTime:setupSessionError:setupSessionIdentifier:isRepairSession:category:accessorySoftwareVersion:setupClientBundleID:retryCount:firstSettingTime:languageSettingTime:accessoryInDefaultRoom:lastPrimaryResidentAvailableTime:numberOfTimesPrimaryResidentChanged:lastPrimaryClientConnectedTime:numberOfTimesPrimaryClientConnected:numberOfTimesPrimaryClientDisconnected:numberOfTimesPrimaryClientConnectMessageFailed:lastPrimaryClientConnectMessageFailError:accessoryDiagnosticInfoFetchError:primaryResidentDiagnosticInfoFetchError:](v134, "initWithRole:setupStartTime:setupEndTime:accessoryAddEndTime:accessoryRemoveTime:configurationEndTime:setupSessionError:setupSessionIdentifier:isRepairSession:category:accessorySoftwareVersion:setupClientBundleID:retryCount:firstSettingTime:languageSettingTime:accessoryInDefaultRoom:lastPrimaryResidentAvailableTime:numberOfTimesPrimaryResidentChanged:lastPrimaryClientConnectedTime:numberOfTimesPrimaryClientConnected:numberOfTimesPrimaryClientDisconnected:numberOfTimesPrimaryClientConnectMessageFailed:lastPrimaryClientConnectMessageFailError:accessoryDiagnosticInfoFetchError:primaryResidentDiagnosticInfoFetchError:", v132, v130, v128, v126, v124, v122 / 0x3B9ACA00, v136, v120, v101, v116, v114, v112,
           v110,
           v109,
           v108,
           v103,
           v106,
           v104,
           v26,
           __PAIR64__(v28, v27),
           v105,
           v30,
           v32,
           objc_getProperty((id)v1, v33, 152, 1));

  v139 = objc_loadWeakRetained((id *)(v1 + 80));
  v34 = (void *)MEMORY[0x227676638]();
  v35 = (id)v1;
  HMFGetOSLogHandle();
  v36 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v142, "accessoryUUID");
    v38 = (id *)objc_claimAutoreleasedReturnValue();
    -[HMDAppleMediaAccessorySetupLogEvent coreAnalyticsEventDictionary](v135, "coreAnalyticsEventDictionary");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v145 = v37;
    v146 = 2112;
    v147 = v38;
    v148 = 2112;
    v149 = v39;
    v150 = 2112;
    v151 = v143;
    _os_log_impl(&dword_2218F0000, v36, OS_LOG_TYPE_INFO, "%{public}@Submitting accessory (%@) setup log event:%@ with error:%@", buf, 0x2Au);

  }
  objc_autoreleasePoolPop(v34);
  objc_msgSend(v139, "submitLogEvent:error:", v135, v143);
  v141 = objc_loadWeakRetained((id *)v35 + 15);
  objc_msgSend(v141, "currentDevice");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "idsIdentifier");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "UUIDString");
  v137 = (__CFString *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v141, "residentDeviceManager");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "primaryResidentDevice");
  v131 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v137)
  {
    v44 = (void *)MEMORY[0x227676638]();
    v45 = v35;
    HMFGetOSLogHandle();
    v46 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v145 = v47;
      _os_log_impl(&dword_2218F0000, v46, OS_LOG_TYPE_ERROR, "%{public}@Could not get idsIdentifier of current device", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v44);
    v137 = CFSTR("Unknown");
  }
  v133 = objc_getProperty(v35, v43, 104, 1);
  v49 = objc_getProperty(v35, v48, 112, 1);
  v129 = v49;
  if (v141 && v133 && v49)
  {
    +[HMDMainDriver driver](HMDMainDriver, "driver");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "currentWiFiNetworkRSSI");
    v127 = (void *)objc_claimAutoreleasedReturnValue();

    if (v127)
      v113 = objc_msgSend(v127, "intValue");
    else
      v113 = 0;
    objc_msgSend(v35, "setupSessionIdentifier");
    v125 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v125, "UUIDString");
    v117 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMDMainDriver driver](HMDMainDriver, "driver");
    v123 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v123, "currentWiFiNetworkInfo");
    v115 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v141, "residentDeviceManager");
    v121 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v121, "residentDevices");
    v119 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = objc_msgSend(v119, "count");
    objc_msgSend(v141, "appleMediaAccessories");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = objc_msgSend(v56, "count");
    v59 = objc_getProperty(v35, v58, 128, 1);
    objc_msgSend(v131, "device");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "idsIdentifier");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "UUIDString");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v64 = objc_getProperty(v35, v63, 144, 1);
    objc_msgSend(v141, "uuid");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v102) = objc_msgSend(objc_getProperty(v35, v66, 152, 1), "code") == 2032;
    objc_msgSend(v35, "networkMetricWithDiscoveryController:networkInfoController:sessionID:idsIdentifierString:currentWiFiInfo:currentWiFiNetworkRSSI:numResidents:numAppleMediaAccessories:accessoryDiagnosticInfo:primaryResidentIdsIdentifierString:primaryResidentDiagnosticInfo:homeUUID:primaryResidentDiagnosticInfoFetched:", v133, v129, v117, v137, v115, v113, v55, v57, v59, v62, v64, v65, v102);
    v67 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v139, "submitLogEvent:error:", v67, v143);
  }
  else
  {
    v51 = (void *)MEMORY[0x227676638]();
    v52 = v35;
    HMFGetOSLogHandle();
    v53 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v145 = v54;
      _os_log_impl(&dword_2218F0000, v53, OS_LOG_TYPE_ERROR, "%{public}@Did not find valid controllers to get network information", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v51);
  }
  objc_msgSend(v35, "releaseDiscoveryAssertionWithAssertionHandle:", *((_QWORD *)v35 + 21));
  objc_storeStrong((id *)v35 + 21, 0);
  objc_msgSend(v142, "accessoryCategory");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "categoryType");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v70 = objc_msgSend(v69, "isEqualToString:", *MEMORY[0x24BDD49E0]);

  v71 = objc_loadWeakRetained((id *)v35 + 12);
  v72 = v71;
  if (v70)
  {
    objc_msgSend(v71, "setHomepodSetupRetryCount:", objc_msgSend(v71, "homepodSetupRetryCount") + 1);
    if (objc_msgSend(objc_getProperty(v35, v73, 128, 1), "hasLastSetupInfo"))
    {
      objc_msgSend(objc_getProperty(v35, v74, 128, 1), "lastSetupInfo");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      +[HMDCurrentAccessorySetupMetricDispatcher homepodSetupLogEventFromProtoSetupInfo:](HMDCurrentAccessorySetupMetricDispatcher, "homepodSetupLogEventFromProtoSetupInfo:", v75);
      v76 = (id)objc_claimAutoreleasedReturnValue();

      if (v76)
      {
        objc_msgSend(v35, "setupSessionIdentifier");
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v77, "UUIDString");
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v76, "setSetupSessionIdentifier:", v78);

      }
      v79 = (void *)MEMORY[0x227676638](objc_msgSend(v139, "submitLogEvent:", v76));
      v80 = v35;
      HMFGetOSLogHandle();
      v81 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v81, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v145 = v82;
        _os_log_impl(&dword_2218F0000, v81, OS_LOG_TYPE_DEFAULT, "%{public}@Submitted retrieved homepod log event.", buf, 0xCu);

      }
    }
    else
    {
      if (!objc_getProperty(v35, v74, 136, 1))
      {
        v87 = (void *)MEMORY[0x227676638]();
        v88 = v35;
        HMFGetOSLogHandle();
        v89 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v89, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v90 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v145 = v90;
          _os_log_impl(&dword_2218F0000, v89, OS_LOG_TYPE_ERROR, "%{public}@No homepod setup log event found.", buf, 0xCu);

        }
        objc_autoreleasePoolPop(v87);
        goto LABEL_45;
      }
      v76 = -[HMDHomePodSetupLatencyLogEvent initLogEventWithInitialState:]([HMDHomePodSetupLatencyLogEvent alloc], "initLogEventWithInitialState:", 0x10000);
      objc_msgSend(v76, "setError:", objc_getProperty(v35, v83, 136, 1));
      objc_msgSend(v35, "setupSessionIdentifier");
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v84, "UUIDString");
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v76, "setSetupSessionIdentifier:", v85);

      v79 = (void *)MEMORY[0x227676638](objc_msgSend(v139, "submitLogEvent:", v76));
      v80 = v35;
      HMFGetOSLogHandle();
      v81 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v81, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v86 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v145 = v86;
        _os_log_impl(&dword_2218F0000, v81, OS_LOG_TYPE_DEFAULT, "%{public}@Submitted homepod log event with fetch error.", buf, 0xCu);

      }
    }

    objc_autoreleasePoolPop(v79);
  }
LABEL_45:
  if (!v143)
  {
    objc_msgSend(v142, "sessionError");
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    v92 = v91 ? 0 : v70;

    if (v92)
      objc_msgSend(v72, "setHomepodSetupRetryCount:", 0);
  }
  os_unfair_lock_lock_with_options();
  objc_msgSend(*((id *)v35 + 9), "suspend");
  v93 = (void *)*((_QWORD *)v35 + 9);
  *((_QWORD *)v35 + 9) = 0;

  os_unfair_lock_unlock((os_unfair_lock_t)v35 + 2);
  v94 = (void *)MEMORY[0x227676638]();
  v95 = (id *)v35;
  HMFGetOSLogHandle();
  v96 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v96, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v145 = v97;
    v146 = 2112;
    v147 = v95;
    _os_log_impl(&dword_2218F0000, v96, OS_LOG_TYPE_INFO, "%{public}@Removing setup metric dispatcher:%@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v94);
  v98 = objc_loadWeakRetained(v95 + 12);
  objc_msgSend(v95, "trackingInfo");
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v99, "accessoryUUID");
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v98, "removeAccessorySetupMetricDispatcherForAccessoryUUID:", v100);

LABEL_54:
}

id __99__HMDAccessorySetupMetricDispatcher_initWithQueue_trackingInfo_setupSessionIdentifier_homeManager___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  void *v4;

  v2 = (objc_class *)MEMORY[0x24BE3F298];
  v3 = a2;
  v4 = (void *)objc_msgSend([v2 alloc], "initWithTimeInterval:options:", 8, 900.0);
  objc_msgSend(v4, "setDelegate:", v3);

  objc_msgSend(v4, "resume");
  return v4;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t46_245645 != -1)
    dispatch_once(&logCategory__hmf_once_t46_245645, &__block_literal_global_92_245646);
  return (id)logCategory__hmf_once_v47_245647;
}

void __48__HMDAccessorySetupMetricDispatcher_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v47_245647;
  logCategory__hmf_once_v47_245647 = v0;

}

@end
