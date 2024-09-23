@implementation HMDCurrentAccessorySetupMetricDispatcher

- (HMDCurrentAccessorySetupMetricDispatcher)initWithDataSource:(id)a3 setupLogEvent:(id)a4 logEventSubmitter:(id)a5 currentUpTicksFactory:(id)a6 submissionTimerFactory:(id)a7 userDefaults:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  HMDCurrentAccessorySetupMetricDispatcher *v20;
  HMDCurrentAccessorySetupMetricDispatcher *v21;
  void *v22;
  id currentUpTicksFactory;
  void *v24;
  id submissionTimerFactory;
  uint64_t v26;
  NSMutableDictionary *stageErrorDict;
  SEL v28;
  uint64_t (**Property)(void);
  uint64_t v30;
  objc_super v32;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v32.receiver = self;
  v32.super_class = (Class)HMDCurrentAccessorySetupMetricDispatcher;
  v20 = -[HMDCurrentAccessorySetupMetricDispatcher init](&v32, sel_init);
  v21 = v20;
  if (v20)
  {
    objc_storeWeak((id *)&v20->_dataSource, v14);
    objc_storeStrong((id *)&v21->_setupLogEvent, a4);
    v22 = _Block_copy(v17);
    currentUpTicksFactory = v21->_currentUpTicksFactory;
    v21->_currentUpTicksFactory = v22;

    objc_storeWeak((id *)&v21->_logEventSubmitter, v16);
    v24 = _Block_copy(v18);
    submissionTimerFactory = v21->_submissionTimerFactory;
    v21->_submissionTimerFactory = v24;

    objc_storeStrong((id *)&v21->_userDefaults, a8);
    v21->_lock._os_unfair_lock_opaque = 0;
    v21->_allStagesSubmitted = 0;
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v26 = objc_claimAutoreleasedReturnValue();
    stageErrorDict = v21->_stageErrorDict;
    v21->_stageErrorDict = (NSMutableDictionary *)v26;

    Property = (uint64_t (**)(void))objc_getProperty(v21, v28, 24, 1);
    v30 = Property[2]();
    -[HMDCurrentAccessorySetupMetricDispatcher _logWithoutStatesWithPrefix:stage:time:](v21, CFSTR("Begin stage"), CFSTR("Setup In HH2"), v30);
  }

  return v21;
}

- (HMDCurrentAccessorySetupMetricDispatcher)initWithDataSource:(id)a3 setupLogEvent:(id)a4 logEventSubmitter:(id)a5
{
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  HMDCurrentAccessorySetupMetricDispatcher *v13;

  v8 = (void *)MEMORY[0x24BDBCF50];
  v9 = a5;
  v10 = a4;
  v11 = a3;
  objc_msgSend(v8, "standardUserDefaults");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[HMDCurrentAccessorySetupMetricDispatcher initWithDataSource:setupLogEvent:logEventSubmitter:currentUpTicksFactory:submissionTimerFactory:userDefaults:](self, "initWithDataSource:setupLogEvent:logEventSubmitter:currentUpTicksFactory:submissionTimerFactory:userDefaults:", v11, v10, v9, &__block_literal_global_183499, &__block_literal_global_45_183500, v12);

  return v13;
}

- (void)markSetupBeginStage:(unint64_t)a3 error:(id)a4
{
  __CFString *v6;
  void *v7;
  HMDCurrentAccessorySetupMetricDispatcher *v8;
  NSObject *v9;
  void *v10;
  __CFString *v11;
  __CFString *v12;
  void *v13;
  HMDCurrentAccessorySetupMetricDispatcher *v14;
  NSObject *v15;
  void *v16;
  __CFString *v17;
  const char *v18;
  uint64_t (**v19)(void);
  const char *v20;
  uint64_t (**v21)(void);
  const char *v22;
  uint64_t (**v23)(void);
  const char *v24;
  uint64_t (**v25)(void);
  const char *v26;
  uint64_t (**v27)(void);
  const char *v28;
  uint64_t (**v29)(void);
  const char *v30;
  uint64_t (**v31)(void);
  const char *v32;
  uint64_t (**v33)(void);
  const char *v34;
  uint64_t (**v35)(void);
  const char *v36;
  uint64_t (**v37)(void);
  const char *v38;
  uint64_t (**v39)(void);
  __CFString *v40;
  const char *v41;
  uint64_t (**v42)(void);
  const char *v43;
  uint64_t (**v44)(void);
  const char *v45;
  uint64_t (**v46)(void);
  const char *v47;
  uint64_t (**v48)(void);
  const char *v49;
  uint64_t (**v50)(void);
  int v51;
  void *v52;
  __int16 v53;
  __CFString *v54;
  __int16 v55;
  __CFString *v56;
  uint64_t v57;

  v57 = *MEMORY[0x24BDAC8D0];
  v6 = (__CFString *)a4;
  v7 = (void *)MEMORY[0x227676638]();
  v8 = self;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (a3 - 1 > 0xF)
      v11 = CFSTR("Unknown Setup Stage");
    else
      v11 = off_24E78E2E0[a3 - 1];
    v12 = v11;
    v51 = 138543874;
    v52 = v10;
    v53 = 2112;
    v54 = v12;
    v55 = 2112;
    v56 = v6;
    _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_DEBUG, "%{public}@Mark begin stage: %@ error: %@", (uint8_t *)&v51, 0x20u);

  }
  objc_autoreleasePoolPop(v7);
  switch(a3)
  {
    case 0uLL:
      v13 = (void *)MEMORY[0x227676638]();
      v14 = v8;
      HMFGetOSLogHandle();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v51 = 138543618;
        v52 = v16;
        v53 = 2112;
        v54 = v6;
        _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_ERROR, "%{public}@Unknown setup stage with error: %@", (uint8_t *)&v51, 0x16u);

      }
      objc_autoreleasePoolPop(v13);
      break;
    case 1uLL:
      v17 = v6;
      if (v8)
      {
        os_unfair_lock_lock_with_options();
        if (!v8->_setupSessionOpenBeginTime)
        {
          v19 = (uint64_t (**)(void))objc_getProperty(v8, v18, 24, 1);
          v8->_setupSessionOpenBeginTime = v19[2]();

          -[HMDHomePodSetupLatencyLogEvent setSessionSetupOpenMS_HH1:](v8->_setupLogEvent, "setSessionSetupOpenMS_HH1:", -1);
          -[HMDCurrentAccessorySetupMetricDispatcher _handleErrorAndSaveStage:stageTime:stageString:error:]((uint64_t)v8, 0, v8->_setupSessionOpenBeginTime, CFSTR("Setup Session Open"), v17);
        }
        os_unfair_lock_unlock(&v8->_lock);
      }
      goto LABEL_89;
    case 2uLL:
      v17 = v6;
      if (v8)
      {
        os_unfair_lock_lock_with_options();
        if (!v8->_setupSessionCloseBeginTime)
        {
          v21 = (uint64_t (**)(void))objc_getProperty(v8, v20, 24, 1);
          v8->_setupSessionCloseBeginTime = v21[2]();

          -[HMDHomePodSetupLatencyLogEvent setSessionSetupCloseMS_HH1:](v8->_setupLogEvent, "setSessionSetupCloseMS_HH1:", -1);
          -[HMDCurrentAccessorySetupMetricDispatcher _handleErrorAndSaveStage:stageTime:stageString:error:]((uint64_t)v8, 0, v8->_setupSessionCloseBeginTime, CFSTR("Setup Session Close"), v17);
        }
        os_unfair_lock_unlock(&v8->_lock);
      }
      goto LABEL_89;
    case 3uLL:
      v17 = v6;
      if (v8)
      {
        os_unfair_lock_lock_with_options();
        if (!v8->_receiveControllerKeyBeginTime)
        {
          v23 = (uint64_t (**)(void))objc_getProperty(v8, v22, 24, 1);
          v8->_receiveControllerKeyBeginTime = v23[2]();

          -[HMDHomePodSetupLatencyLogEvent setControllerKeyExchangeMS_HH1:](v8->_setupLogEvent, "setControllerKeyExchangeMS_HH1:", -1);
          -[HMDCurrentAccessorySetupMetricDispatcher _handleErrorAndSaveStage:stageTime:stageString:error:]((uint64_t)v8, 0, v8->_receiveControllerKeyBeginTime, CFSTR("Controller Key Exchange"), v17);
        }
        os_unfair_lock_unlock(&v8->_lock);
      }
      goto LABEL_89;
    case 4uLL:
      v17 = v6;
      if (v8)
      {
        os_unfair_lock_lock_with_options();
        if (!v8->_sentUnassociatedMediaAccessoryBeginTime)
        {
          v25 = (uint64_t (**)(void))objc_getProperty(v8, v24, 24, 1);
          v8->_sentUnassociatedMediaAccessoryBeginTime = v25[2]();

          -[HMDHomePodSetupLatencyLogEvent setNewAccessoryTransferMS_HH1:](v8->_setupLogEvent, "setNewAccessoryTransferMS_HH1:", -1);
          -[HMDCurrentAccessorySetupMetricDispatcher _handleErrorAndSaveStage:stageTime:stageString:error:]((uint64_t)v8, 0, v8->_sentUnassociatedMediaAccessoryBeginTime, CFSTR("New Accessory Transfer"), v17);
        }
        os_unfair_lock_unlock(&v8->_lock);
      }
      goto LABEL_89;
    case 5uLL:
      v17 = v6;
      if (v8)
      {
        os_unfair_lock_lock_with_options();
        if (!v8->_settingsCreationBeginTime)
        {
          v27 = (uint64_t (**)(void))objc_getProperty(v8, v26, 24, 1);
          v8->_settingsCreationBeginTime = v27[2]();

          -[HMDHomePodSetupLatencyLogEvent setSettingsCreationMS_HH2:](v8->_setupLogEvent, "setSettingsCreationMS_HH2:", -1);
          -[HMDCurrentAccessorySetupMetricDispatcher _handleErrorAndSaveStage:stageTime:stageString:error:]((uint64_t)v8, 0, v8->_settingsCreationBeginTime, CFSTR("Settings Creation"), v17);
        }
        os_unfair_lock_unlock(&v8->_lock);
      }
      goto LABEL_89;
    case 6uLL:
      v17 = v6;
      if (v8)
      {
        os_unfair_lock_lock_with_options();
        if (!v8->_pairingIdentityCreationBeginTime)
        {
          v29 = (uint64_t (**)(void))objc_getProperty(v8, v28, 24, 1);
          v8->_pairingIdentityCreationBeginTime = v29[2]();

          -[HMDHomePodSetupLatencyLogEvent setPairingIdentityCreationMS_HH2:](v8->_setupLogEvent, "setPairingIdentityCreationMS_HH2:", -1);
          -[HMDCurrentAccessorySetupMetricDispatcher _handleErrorAndSaveStage:stageTime:stageString:error:]((uint64_t)v8, 0, v8->_pairingIdentityCreationBeginTime, CFSTR("Pairing Identity Creation"), v17);
        }
        os_unfair_lock_unlock(&v8->_lock);
      }
      goto LABEL_89;
    case 7uLL:
      v17 = v6;
      if (v8)
      {
        os_unfair_lock_lock_with_options();
        if (!v8->_addAccessoryBeginTime)
        {
          v31 = (uint64_t (**)(void))objc_getProperty(v8, v30, 24, 1);
          v8->_addAccessoryBeginTime = v31[2]();

          -[HMDHomePodSetupLatencyLogEvent setAccessoryAddMS_HH2:](v8->_setupLogEvent, "setAccessoryAddMS_HH2:", -1);
          -[HMDCurrentAccessorySetupMetricDispatcher _handleErrorAndSaveStage:stageTime:stageString:error:]((uint64_t)v8, 0, v8->_addAccessoryBeginTime, CFSTR("Accessory Add"), v17);
        }
        os_unfair_lock_unlock(&v8->_lock);
      }
      goto LABEL_89;
    case 8uLL:
      v17 = v6;
      if (v8)
      {
        os_unfair_lock_lock_with_options();
        if (!v8->_siriReadyBeginTime)
        {
          v33 = (uint64_t (**)(void))objc_getProperty(v8, v32, 24, 1);
          v8->_siriReadyBeginTime = v33[2]();

          -[HMDHomePodSetupLatencyLogEvent setSiriReadyMS_HH2:](v8->_setupLogEvent, "setSiriReadyMS_HH2:", -1);
          -[HMDCurrentAccessorySetupMetricDispatcher _handleErrorAndSaveStage:stageTime:stageString:error:]((uint64_t)v8, 0, v8->_siriReadyBeginTime, CFSTR("Siri Home Automation Ready"), v17);
        }
        os_unfair_lock_unlock(&v8->_lock);
      }
      goto LABEL_89;
    case 9uLL:
      v17 = v6;
      if (v8)
      {
        os_unfair_lock_lock_with_options();
        if (!v8->_hh2SentinelZoneFetchBeginTime)
        {
          v35 = (uint64_t (**)(void))objc_getProperty(v8, v34, 24, 1);
          v8->_hh2SentinelZoneFetchBeginTime = v35[2]();

          -[HMDHomePodSetupLatencyLogEvent setSentinelZoneFetchMS_HH1:](v8->_setupLogEvent, "setSentinelZoneFetchMS_HH1:", -1);
          -[HMDCurrentAccessorySetupMetricDispatcher _handleErrorAndSaveStage:stageTime:stageString:error:]((uint64_t)v8, 0, v8->_hh2SentinelZoneFetchBeginTime, CFSTR("HH2 sentinel zone fetched"), v17);
        }
        os_unfair_lock_unlock(&v8->_lock);
      }
      goto LABEL_89;
    case 0xAuLL:
      v17 = v6;
      if (v8)
      {
        os_unfair_lock_lock_with_options();
        if (!v8->_appleAccountSettledBeginTime)
        {
          v37 = (uint64_t (**)(void))objc_getProperty(v8, v36, 24, 1);
          v8->_appleAccountSettledBeginTime = v37[2]();

          -[HMDHomePodSetupLatencyLogEvent setAccountSettleWaitMS_HH2:](v8->_setupLogEvent, "setAccountSettleWaitMS_HH2:", -1);
          -[HMDCurrentAccessorySetupMetricDispatcher _handleErrorAndSaveStage:stageTime:stageString:error:]((uint64_t)v8, 0, v8->_appleAccountSettledBeginTime, CFSTR("Apple account settled"), v17);
        }
        os_unfair_lock_unlock(&v8->_lock);
      }
      goto LABEL_89;
    case 0xBuLL:
      v17 = v6;
      if (v8)
      {
        os_unfair_lock_lock_with_options();
        if (!v8->_currentIDSDeviceSettledBeginTime)
        {
          v39 = (uint64_t (**)(void))objc_getProperty(v8, v38, 24, 1);
          v8->_currentIDSDeviceSettledBeginTime = v39[2]();

          -[HMDHomePodSetupLatencyLogEvent setCurrentDeviceIDSWaitMS_HH2:](v8->_setupLogEvent, "setCurrentDeviceIDSWaitMS_HH2:", -1);
          -[HMDCurrentAccessorySetupMetricDispatcher _handleErrorAndSaveStage:stageTime:stageString:error:]((uint64_t)v8, 0, v8->_currentIDSDeviceSettledBeginTime, CFSTR("Current device settled"), v17);
        }
        os_unfair_lock_unlock(&v8->_lock);
      }
      goto LABEL_89;
    case 0xCuLL:
      v40 = v6;
      if (v8)
      {
        os_unfair_lock_lock_with_options();
        if (!v8->_homeManagerInitBeginTime)
        {
          v42 = (uint64_t (**)(void))objc_getProperty(v8, v41, 24, 1);
          v8->_homeManagerInitBeginTime = v42[2]();

          -[HMDHomePodSetupLatencyLogEvent setHomeManagerReadyMS_HH2:](v8->_setupLogEvent, "setHomeManagerReadyMS_HH2:", -1);
          -[HMDCurrentAccessorySetupMetricDispatcher _handleErrorAndSaveStage:stageTime:stageString:error:]((uint64_t)v8, 0, v8->_homeManagerInitBeginTime, CFSTR("Home Manager Initialized"), v40);
        }
        os_unfair_lock_unlock(&v8->_lock);
      }

      goto LABEL_70;
    case 0xDuLL:
LABEL_70:
      v17 = v6;
      if (v8)
      {
        os_unfair_lock_lock_with_options();
        if (!v8->_coreDataFirstCloudImportBeginTime)
        {
          v44 = (uint64_t (**)(void))objc_getProperty(v8, v43, 24, 1);
          v8->_coreDataFirstCloudImportBeginTime = v44[2]();

          -[HMDHomePodSetupLatencyLogEvent setFirstCoreDataImportMS_HH2:](v8->_setupLogEvent, "setFirstCoreDataImportMS_HH2:", -1);
          -[HMDHomePodSetupLatencyLogEvent setSavedEventState:](v8->_setupLogEvent, "setSavedEventState:", 2);
          -[HMDCurrentAccessorySetupMetricDispatcher _handleErrorAndSaveStage:stageTime:stageString:error:]((uint64_t)v8, 0, v8->_coreDataFirstCloudImportBeginTime, CFSTR("First CoreData Import"), v17);
        }
        os_unfair_lock_unlock(&v8->_lock);
      }
      goto LABEL_89;
    case 0xEuLL:
      v17 = v6;
      if (v8)
      {
        os_unfair_lock_lock_with_options();
        if (!v8->_firstPrimaryResidentElectionBeginTime)
        {
          v46 = (uint64_t (**)(void))objc_getProperty(v8, v45, 24, 1);
          v8->_firstPrimaryResidentElectionBeginTime = v46[2]();

          -[HMDHomePodSetupLatencyLogEvent setPrimaryResidentElectionMS_HH2:](v8->_setupLogEvent, "setPrimaryResidentElectionMS_HH2:", -1);
          -[HMDHomePodSetupLatencyLogEvent setPrimaryResidentElectionPeerDeviceFutureResolvedMS_HH2:](v8->_setupLogEvent, "setPrimaryResidentElectionPeerDeviceFutureResolvedMS_HH2:", -1);
          -[HMDHomePodSetupLatencyLogEvent setPrimaryResidentElectionFirstCloudKitImportFutureResolvedMS_HH2:](v8->_setupLogEvent, "setPrimaryResidentElectionFirstCloudKitImportFutureResolvedMS_HH2:", -1);
          -[HMDHomePodSetupLatencyLogEvent setPrimaryResidentElectionModernTransportStartedFutureResolvedMS_HH2:](v8->_setupLogEvent, "setPrimaryResidentElectionModernTransportStartedFutureResolvedMS_HH2:", -1);
          -[HMDHomePodSetupLatencyLogEvent setPrimaryResidentSelectionConnectedToStatusKitFutureResolvedMS_HH2:](v8->_setupLogEvent, "setPrimaryResidentSelectionConnectedToStatusKitFutureResolvedMS_HH2:", -1);
          -[HMDCurrentAccessorySetupMetricDispatcher _handleErrorAndSaveStage:stageTime:stageString:error:]((uint64_t)v8, 0, v8->_firstPrimaryResidentElectionBeginTime, CFSTR("First Primary Resident Election"), v17);
        }
        os_unfair_lock_unlock(&v8->_lock);
      }
      goto LABEL_89;
    case 0xFuLL:
      v17 = v6;
      if (v8)
      {
        os_unfair_lock_lock_with_options();
        if (!v8->_eventRouterServerConnectBeginTime)
        {
          v48 = (uint64_t (**)(void))objc_getProperty(v8, v47, 24, 1);
          v8->_eventRouterServerConnectBeginTime = v48[2]();

          -[HMDHomePodSetupLatencyLogEvent setEventRouterServerConnectionMS_HH2:](v8->_setupLogEvent, "setEventRouterServerConnectionMS_HH2:", -1);
          -[HMDCurrentAccessorySetupMetricDispatcher _handleErrorAndSaveStage:stageTime:stageString:error:]((uint64_t)v8, 0, v8->_eventRouterServerConnectBeginTime, CFSTR("First Event Router Server Connection"), v17);
        }
        os_unfair_lock_unlock(&v8->_lock);
      }
      goto LABEL_89;
    case 0x10uLL:
      v17 = v6;
      if (v8)
      {
        os_unfair_lock_lock_with_options();
        if (!v8->_firstServerEventSentBeginTime)
        {
          v50 = (uint64_t (**)(void))objc_getProperty(v8, v49, 24, 1);
          v8->_firstServerEventSentBeginTime = v50[2]();

          -[HMDHomePodSetupLatencyLogEvent setEventRouterFirstEventPushMS_HH2:](v8->_setupLogEvent, "setEventRouterFirstEventPushMS_HH2:", -1);
          -[HMDCurrentAccessorySetupMetricDispatcher _handleErrorAndSaveStage:stageTime:stageString:error:]((uint64_t)v8, 0, v8->_firstServerEventSentBeginTime, CFSTR("First Event Push"), v17);
        }
        os_unfair_lock_unlock(&v8->_lock);
      }
LABEL_89:

      break;
    default:
      break;
  }

}

- (void)markSetupEndStage:(unint64_t)a3 error:(id)a4
{
  __CFString *v6;
  void *v7;
  HMDCurrentAccessorySetupMetricDispatcher *v8;
  NSObject *v9;
  void *v10;
  __CFString *v11;
  __CFString *v12;
  void *v13;
  HMDCurrentAccessorySetupMetricDispatcher *v14;
  NSObject *v15;
  void *v16;
  __CFString *v17;
  SEL v18;
  uint64_t (**v19)(void);
  SEL v20;
  uint64_t (**v21)(void);
  SEL v22;
  uint64_t (**v23)(void);
  SEL v24;
  uint64_t (**v25)(void);
  SEL v26;
  uint64_t (**v27)(void);
  SEL v28;
  uint64_t (**v29)(void);
  SEL v30;
  uint64_t (**v31)(void);
  SEL v32;
  uint64_t (**v33)(void);
  SEL v34;
  uint64_t (**v35)(void);
  SEL v36;
  uint64_t (**v37)(void);
  uint64_t v38;
  SEL v39;
  uint64_t (**v40)(void);
  SEL v41;
  uint64_t (**v42)(void);
  SEL v43;
  uint64_t (**v44)(void);
  SEL v45;
  uint64_t (**v46)(void);
  SEL v47;
  uint64_t (**v48)(void);
  SEL v49;
  uint64_t (**v50)(void);
  SEL v51;
  uint64_t (**v52)(void);
  int v53;
  void *v54;
  __int16 v55;
  __CFString *v56;
  __int16 v57;
  __CFString *v58;
  uint64_t v59;

  v59 = *MEMORY[0x24BDAC8D0];
  v6 = (__CFString *)a4;
  v7 = (void *)MEMORY[0x227676638]();
  v8 = self;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (a3 - 1 > 0xF)
      v11 = CFSTR("Unknown Setup Stage");
    else
      v11 = off_24E78E2E0[a3 - 1];
    v12 = v11;
    v53 = 138543874;
    v54 = v10;
    v55 = 2112;
    v56 = v12;
    v57 = 2112;
    v58 = v6;
    _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_DEBUG, "%{public}@Mark end stage: %@ error: %@", (uint8_t *)&v53, 0x20u);

  }
  objc_autoreleasePoolPop(v7);
  switch(a3)
  {
    case 0uLL:
      v13 = (void *)MEMORY[0x227676638]();
      v14 = v8;
      HMFGetOSLogHandle();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v53 = 138543618;
        v54 = v16;
        v55 = 2112;
        v56 = v6;
        _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_ERROR, "%{public}@Unknown setup stage with error: %@", (uint8_t *)&v53, 0x16u);

      }
      objc_autoreleasePoolPop(v13);
      break;
    case 1uLL:
      v17 = v6;
      if (v8)
      {
        os_unfair_lock_lock_with_options();
        if (v8->_setupSessionOpenBeginTime && !v8->_setupSessionOpenEndTime)
        {
          -[HMDCurrentAccessorySetupMetricDispatcher _shouldEndStage:error:]((uint64_t)v8, CFSTR("Setup Session Open"), v17);
          v19 = (uint64_t (**)(void))objc_getProperty(v8, v18, 24, 1);
          v8->_setupSessionOpenEndTime = v19[2]();

          -[HMDHomePodSetupLatencyLogEvent setSessionSetupOpenMS_HH1:](v8->_setupLogEvent, "setSessionSetupOpenMS_HH1:", v8->_setupSessionOpenEndTime - v8->_setupSessionOpenBeginTime);
          if (!-[HMDHomePodSetupLatencyLogEvent sessionSetupOpenMS_HH1](v8->_setupLogEvent, "sessionSetupOpenMS_HH1"))
            -[HMDHomePodSetupLatencyLogEvent setSessionSetupOpenMS_HH1:](v8->_setupLogEvent, "setSessionSetupOpenMS_HH1:", 1);
          -[HMDCurrentAccessorySetupMetricDispatcher _handleErrorAndSaveStage:stageTime:stageString:error:]((uint64_t)v8, 1, v8->_setupSessionOpenEndTime, CFSTR("Setup Session Open"), v17);
        }
        os_unfair_lock_unlock(&v8->_lock);
      }
      goto LABEL_141;
    case 2uLL:
      v17 = v6;
      if (v8)
      {
        os_unfair_lock_lock_with_options();
        if (v8->_setupSessionCloseBeginTime && !v8->_setupSessionCloseEndTime)
        {
          -[HMDCurrentAccessorySetupMetricDispatcher _shouldEndStage:error:]((uint64_t)v8, CFSTR("Setup Session Close"), v17);
          v21 = (uint64_t (**)(void))objc_getProperty(v8, v20, 24, 1);
          v8->_setupSessionCloseEndTime = v21[2]();

          -[HMDHomePodSetupLatencyLogEvent setSessionSetupCloseMS_HH1:](v8->_setupLogEvent, "setSessionSetupCloseMS_HH1:", v8->_setupSessionCloseEndTime - v8->_setupSessionCloseBeginTime);
          if (!-[HMDHomePodSetupLatencyLogEvent sessionSetupCloseMS_HH1](v8->_setupLogEvent, "sessionSetupCloseMS_HH1"))
            -[HMDHomePodSetupLatencyLogEvent setSessionSetupCloseMS_HH1:](v8->_setupLogEvent, "setSessionSetupCloseMS_HH1:", 1);
          -[HMDCurrentAccessorySetupMetricDispatcher _handleErrorAndSaveStage:stageTime:stageString:error:]((uint64_t)v8, 1, v8->_setupSessionCloseEndTime, CFSTR("Setup Session Close"), v17);
        }
        os_unfair_lock_unlock(&v8->_lock);
      }
      goto LABEL_141;
    case 3uLL:
      v17 = v6;
      if (v8)
      {
        os_unfair_lock_lock_with_options();
        if (v8->_receiveControllerKeyBeginTime && !v8->_receiveControllerKeyEndTime)
        {
          -[HMDCurrentAccessorySetupMetricDispatcher _shouldEndStage:error:]((uint64_t)v8, CFSTR("Controller Key Exchange"), v17);
          v23 = (uint64_t (**)(void))objc_getProperty(v8, v22, 24, 1);
          v8->_receiveControllerKeyEndTime = v23[2]();

          -[HMDHomePodSetupLatencyLogEvent setControllerKeyExchangeMS_HH1:](v8->_setupLogEvent, "setControllerKeyExchangeMS_HH1:", v8->_receiveControllerKeyEndTime - v8->_receiveControllerKeyBeginTime);
          if (!-[HMDHomePodSetupLatencyLogEvent sessionSetupCloseMS_HH1](v8->_setupLogEvent, "sessionSetupCloseMS_HH1"))
            -[HMDHomePodSetupLatencyLogEvent setSessionSetupCloseMS_HH1:](v8->_setupLogEvent, "setSessionSetupCloseMS_HH1:", 1);
          -[HMDCurrentAccessorySetupMetricDispatcher _handleErrorAndSaveStage:stageTime:stageString:error:]((uint64_t)v8, 1, v8->_receiveControllerKeyEndTime, CFSTR("Controller Key Exchange"), v17);
        }
        os_unfair_lock_unlock(&v8->_lock);
      }
      goto LABEL_141;
    case 4uLL:
      v17 = v6;
      if (v8)
      {
        os_unfair_lock_lock_with_options();
        if (v8->_sentUnassociatedMediaAccessoryBeginTime && !v8->_sentUnassociatedMediaAccessoryEndTime)
        {
          -[HMDCurrentAccessorySetupMetricDispatcher _shouldEndStage:error:]((uint64_t)v8, CFSTR("New Accessory Transfer"), v17);
          v25 = (uint64_t (**)(void))objc_getProperty(v8, v24, 24, 1);
          v8->_sentUnassociatedMediaAccessoryEndTime = v25[2]();

          -[HMDHomePodSetupLatencyLogEvent setNewAccessoryTransferMS_HH1:](v8->_setupLogEvent, "setNewAccessoryTransferMS_HH1:", v8->_sentUnassociatedMediaAccessoryEndTime - v8->_sentUnassociatedMediaAccessoryBeginTime);
          if (!-[HMDHomePodSetupLatencyLogEvent newAccessoryTransferMS_HH1](v8->_setupLogEvent, "newAccessoryTransferMS_HH1"))-[HMDHomePodSetupLatencyLogEvent setNewAccessoryTransferMS_HH1:](v8->_setupLogEvent, "setNewAccessoryTransferMS_HH1:", 1);
          -[HMDCurrentAccessorySetupMetricDispatcher _handleErrorAndSaveStage:stageTime:stageString:error:]((uint64_t)v8, 1, v8->_sentUnassociatedMediaAccessoryEndTime, CFSTR("New Accessory Transfer"), v17);
        }
        os_unfair_lock_unlock(&v8->_lock);
      }
      goto LABEL_141;
    case 5uLL:
      v17 = v6;
      if (v8)
      {
        os_unfair_lock_lock_with_options();
        if (v8->_settingsCreationBeginTime && !v8->_settingsCreationEndTime)
        {
          -[HMDCurrentAccessorySetupMetricDispatcher _shouldEndStage:error:]((uint64_t)v8, CFSTR("Settings Creation"), v17);
          v27 = (uint64_t (**)(void))objc_getProperty(v8, v26, 24, 1);
          v8->_settingsCreationEndTime = v27[2]();

          -[HMDHomePodSetupLatencyLogEvent setSettingsCreationMS_HH2:](v8->_setupLogEvent, "setSettingsCreationMS_HH2:", v8->_settingsCreationEndTime - v8->_settingsCreationBeginTime);
          if (!-[HMDHomePodSetupLatencyLogEvent settingsCreationMS_HH2](v8->_setupLogEvent, "settingsCreationMS_HH2"))
            -[HMDHomePodSetupLatencyLogEvent setSettingsCreationMS_HH2:](v8->_setupLogEvent, "setSettingsCreationMS_HH2:", 1);
          -[HMDCurrentAccessorySetupMetricDispatcher _handleErrorAndSaveStage:stageTime:stageString:error:]((uint64_t)v8, 1, v8->_settingsCreationEndTime, CFSTR("Settings Creation"), v17);
        }
        os_unfair_lock_unlock(&v8->_lock);
      }
      goto LABEL_141;
    case 6uLL:
      v17 = v6;
      if (v8)
      {
        os_unfair_lock_lock_with_options();
        if (v8->_pairingIdentityCreationBeginTime && !v8->_pairingIdentityCreationEndTime)
        {
          -[HMDCurrentAccessorySetupMetricDispatcher _shouldEndStage:error:]((uint64_t)v8, CFSTR("Pairing Identity Creation"), v17);
          v29 = (uint64_t (**)(void))objc_getProperty(v8, v28, 24, 1);
          v8->_pairingIdentityCreationEndTime = v29[2]();

          -[HMDHomePodSetupLatencyLogEvent setPairingIdentityCreationMS_HH2:](v8->_setupLogEvent, "setPairingIdentityCreationMS_HH2:", v8->_pairingIdentityCreationEndTime - v8->_pairingIdentityCreationBeginTime);
          if (!-[HMDHomePodSetupLatencyLogEvent pairingIdentityCreationMS_HH2](v8->_setupLogEvent, "pairingIdentityCreationMS_HH2"))-[HMDHomePodSetupLatencyLogEvent setPairingIdentityCreationMS_HH2:](v8->_setupLogEvent, "setPairingIdentityCreationMS_HH2:", 1);
          -[HMDCurrentAccessorySetupMetricDispatcher _handleErrorAndSaveStage:stageTime:stageString:error:]((uint64_t)v8, 1, v8->_pairingIdentityCreationEndTime, CFSTR("Pairing Identity Creation"), v17);
        }
        os_unfair_lock_unlock(&v8->_lock);
      }
      goto LABEL_141;
    case 7uLL:
      v17 = v6;
      if (v8)
      {
        os_unfair_lock_lock_with_options();
        if (v8->_addAccessoryBeginTime && !v8->_addAccessoryEndTime)
        {
          -[HMDCurrentAccessorySetupMetricDispatcher _shouldEndStage:error:]((uint64_t)v8, CFSTR("Accessory Add"), v17);
          v31 = (uint64_t (**)(void))objc_getProperty(v8, v30, 24, 1);
          v8->_addAccessoryEndTime = v31[2]();

          -[HMDHomePodSetupLatencyLogEvent setAccessoryAddMS_HH2:](v8->_setupLogEvent, "setAccessoryAddMS_HH2:", v8->_addAccessoryEndTime - v8->_addAccessoryBeginTime);
          if (!-[HMDHomePodSetupLatencyLogEvent accessoryAddMS_HH2](v8->_setupLogEvent, "accessoryAddMS_HH2"))
            -[HMDHomePodSetupLatencyLogEvent setAccessoryAddMS_HH2:](v8->_setupLogEvent, "setAccessoryAddMS_HH2:", 1);
          -[HMDCurrentAccessorySetupMetricDispatcher _handleErrorAndSaveStage:stageTime:stageString:error:]((uint64_t)v8, 1, v8->_addAccessoryEndTime, CFSTR("Accessory Add"), v17);
        }
        os_unfair_lock_unlock(&v8->_lock);
      }
      goto LABEL_141;
    case 8uLL:
      v17 = v6;
      if (v8)
      {
        os_unfair_lock_lock_with_options();
        if (v8->_siriReadyBeginTime && !v8->_siriReadyEndTime)
        {
          -[HMDCurrentAccessorySetupMetricDispatcher _shouldEndStage:error:]((uint64_t)v8, CFSTR("Siri Home Automation Ready"), v17);
          v33 = (uint64_t (**)(void))objc_getProperty(v8, v32, 24, 1);
          v8->_siriReadyEndTime = v33[2]();

          -[HMDHomePodSetupLatencyLogEvent setSiriReadyMS_HH2:](v8->_setupLogEvent, "setSiriReadyMS_HH2:", v8->_siriReadyEndTime - v8->_siriReadyBeginTime);
          if (!-[HMDHomePodSetupLatencyLogEvent siriReadyMS_HH2](v8->_setupLogEvent, "siriReadyMS_HH2"))
            -[HMDHomePodSetupLatencyLogEvent setSiriReadyMS_HH2:](v8->_setupLogEvent, "setSiriReadyMS_HH2:", 1);
          -[HMDCurrentAccessorySetupMetricDispatcher _handleErrorAndSaveStage:stageTime:stageString:error:]((uint64_t)v8, 1, v8->_siriReadyEndTime, CFSTR("Siri Home Automation Ready"), v17);
        }
        os_unfair_lock_unlock(&v8->_lock);
      }
      goto LABEL_141;
    case 9uLL:
      v17 = v6;
      if (v8)
      {
        os_unfair_lock_lock_with_options();
        if (v8->_hh2SentinelZoneFetchBeginTime && !v8->_hh2SentinelZoneFetchEndTime)
        {
          -[HMDCurrentAccessorySetupMetricDispatcher _shouldEndStage:error:]((uint64_t)v8, CFSTR("HH2 sentinel zone fetched"), v17);
          v35 = (uint64_t (**)(void))objc_getProperty(v8, v34, 24, 1);
          v8->_hh2SentinelZoneFetchEndTime = v35[2]();

          -[HMDHomePodSetupLatencyLogEvent setSentinelZoneFetchMS_HH1:](v8->_setupLogEvent, "setSentinelZoneFetchMS_HH1:", v8->_hh2SentinelZoneFetchEndTime - v8->_hh2SentinelZoneFetchBeginTime);
          if (!-[HMDHomePodSetupLatencyLogEvent sentinelZoneFetchMS_HH1](v8->_setupLogEvent, "sentinelZoneFetchMS_HH1"))
            -[HMDHomePodSetupLatencyLogEvent setSentinelZoneFetchMS_HH1:](v8->_setupLogEvent, "setSentinelZoneFetchMS_HH1:", 1);
          -[HMDHomePodSetupLatencyLogEvent setSavedEventState:](v8->_setupLogEvent, "setSavedEventState:", 1);
          -[HMDCurrentAccessorySetupMetricDispatcher _recordTotalDuration]((uint64_t)v8);
          -[HMDCurrentAccessorySetupMetricDispatcher _handleErrorAndSaveStage:stageTime:stageString:error:]((uint64_t)v8, 1, v8->_hh2SentinelZoneFetchEndTime, CFSTR("HH2 sentinel zone fetched"), v17);
          v37 = (uint64_t (**)(void))objc_getProperty(v8, v36, 24, 1);
          v38 = v37[2]();
          -[HMDCurrentAccessorySetupMetricDispatcher _logWithoutStatesWithPrefix:stage:time:](v8, CFSTR("End stage"), CFSTR("Setup In HH1"), v38);

        }
        os_unfair_lock_unlock(&v8->_lock);
      }
      goto LABEL_141;
    case 0xAuLL:
      v17 = v6;
      if (v8)
      {
        os_unfair_lock_lock_with_options();
        if (v8->_appleAccountSettledBeginTime && !v8->_appleAccountSettledEndTime)
        {
          -[HMDCurrentAccessorySetupMetricDispatcher _shouldEndStage:error:]((uint64_t)v8, CFSTR("Apple account settled"), v17);
          v40 = (uint64_t (**)(void))objc_getProperty(v8, v39, 24, 1);
          v8->_appleAccountSettledEndTime = v40[2]();

          -[HMDHomePodSetupLatencyLogEvent setAccountSettleWaitMS_HH2:](v8->_setupLogEvent, "setAccountSettleWaitMS_HH2:", v8->_appleAccountSettledEndTime - v8->_appleAccountSettledBeginTime);
          if (!-[HMDHomePodSetupLatencyLogEvent accountSettleWaitMS_HH2](v8->_setupLogEvent, "accountSettleWaitMS_HH2"))
            -[HMDHomePodSetupLatencyLogEvent setAccountSettleWaitMS_HH2:](v8->_setupLogEvent, "setAccountSettleWaitMS_HH2:", 1);
          -[HMDCurrentAccessorySetupMetricDispatcher _handleErrorAndSaveStage:stageTime:stageString:error:]((uint64_t)v8, 1, v8->_appleAccountSettledEndTime, CFSTR("Apple account settled"), v17);
        }
        os_unfair_lock_unlock(&v8->_lock);
      }
      goto LABEL_141;
    case 0xBuLL:
      v17 = v6;
      if (v8)
      {
        os_unfair_lock_lock_with_options();
        if (v8->_currentIDSDeviceSettledBeginTime && !v8->_currentIDSDeviceSettledEndTime)
        {
          -[HMDCurrentAccessorySetupMetricDispatcher _shouldEndStage:error:]((uint64_t)v8, CFSTR("Current device settled"), v17);
          v42 = (uint64_t (**)(void))objc_getProperty(v8, v41, 24, 1);
          v8->_currentIDSDeviceSettledEndTime = v42[2]();

          -[HMDHomePodSetupLatencyLogEvent setCurrentDeviceIDSWaitMS_HH2:](v8->_setupLogEvent, "setCurrentDeviceIDSWaitMS_HH2:", v8->_currentIDSDeviceSettledEndTime - v8->_currentIDSDeviceSettledBeginTime);
          if (!-[HMDHomePodSetupLatencyLogEvent currentDeviceIDSWaitMS_HH2](v8->_setupLogEvent, "currentDeviceIDSWaitMS_HH2"))-[HMDHomePodSetupLatencyLogEvent setCurrentDeviceIDSWaitMS_HH2:](v8->_setupLogEvent, "setCurrentDeviceIDSWaitMS_HH2:", 1);
          -[HMDCurrentAccessorySetupMetricDispatcher _handleErrorAndSaveStage:stageTime:stageString:error:]((uint64_t)v8, 1, v8->_currentIDSDeviceSettledEndTime, CFSTR("Current device settled"), v17);
        }
        os_unfair_lock_unlock(&v8->_lock);
      }
      goto LABEL_141;
    case 0xCuLL:
      v17 = v6;
      if (v8)
      {
        os_unfair_lock_lock_with_options();
        if (v8->_homeManagerInitBeginTime && !v8->_homeManagerInitEndTime)
        {
          -[HMDCurrentAccessorySetupMetricDispatcher _shouldEndStage:error:]((uint64_t)v8, CFSTR("Home Manager Initialized"), v17);
          v44 = (uint64_t (**)(void))objc_getProperty(v8, v43, 24, 1);
          v8->_homeManagerInitEndTime = v44[2]();

          -[HMDHomePodSetupLatencyLogEvent setHomeManagerReadyMS_HH2:](v8->_setupLogEvent, "setHomeManagerReadyMS_HH2:", v8->_homeManagerInitEndTime - v8->_homeManagerInitBeginTime);
          if (!-[HMDHomePodSetupLatencyLogEvent homeManagerReadyMS_HH2](v8->_setupLogEvent, "homeManagerReadyMS_HH2"))
            -[HMDHomePodSetupLatencyLogEvent setHomeManagerReadyMS_HH2:](v8->_setupLogEvent, "setHomeManagerReadyMS_HH2:", 1);
          -[HMDCurrentAccessorySetupMetricDispatcher _handleErrorAndSaveStage:stageTime:stageString:error:]((uint64_t)v8, 1, v8->_homeManagerInitEndTime, CFSTR("Home Manager Initialized"), v17);
        }
        os_unfair_lock_unlock(&v8->_lock);
      }
      goto LABEL_141;
    case 0xDuLL:
      v17 = v6;
      if (v8)
      {
        os_unfair_lock_lock_with_options();
        if (v8->_coreDataFirstCloudImportBeginTime && !v8->_coreDataFirstCloudImportEndTime)
        {
          -[HMDCurrentAccessorySetupMetricDispatcher _shouldEndStage:error:]((uint64_t)v8, CFSTR("First CoreData Import"), v17);
          v46 = (uint64_t (**)(void))objc_getProperty(v8, v45, 24, 1);
          v8->_coreDataFirstCloudImportEndTime = v46[2]();

          -[HMDHomePodSetupLatencyLogEvent setFirstCoreDataImportMS_HH2:](v8->_setupLogEvent, "setFirstCoreDataImportMS_HH2:", v8->_coreDataFirstCloudImportEndTime - v8->_coreDataFirstCloudImportBeginTime);
          if (!-[HMDHomePodSetupLatencyLogEvent firstCoreDataImportMS_HH2](v8->_setupLogEvent, "firstCoreDataImportMS_HH2"))-[HMDHomePodSetupLatencyLogEvent setFirstCoreDataImportMS_HH2:](v8->_setupLogEvent, "setFirstCoreDataImportMS_HH2:", 1);
          -[HMDCurrentAccessorySetupMetricDispatcher _handleErrorAndSaveStage:stageTime:stageString:error:]((uint64_t)v8, 1, v8->_coreDataFirstCloudImportEndTime, CFSTR("First CoreData Import"), v17);
        }
        os_unfair_lock_unlock(&v8->_lock);
      }
      goto LABEL_141;
    case 0xEuLL:
      v17 = v6;
      if (v8)
      {
        os_unfair_lock_lock_with_options();
        -[HMDHomePodSetupLatencyLogEvent setNumberOfTimesPrimaryResidentChanged_HH2:](v8->_setupLogEvent, "setNumberOfTimesPrimaryResidentChanged_HH2:", -[HMDHomePodSetupLatencyLogEvent numberOfTimesPrimaryResidentChanged_HH2](v8->_setupLogEvent, "numberOfTimesPrimaryResidentChanged_HH2")+ 1);
        if (v8->_firstPrimaryResidentElectionBeginTime && !v8->_firstPrimaryResidentElectionEndTime)
        {
          -[HMDCurrentAccessorySetupMetricDispatcher _shouldEndStage:error:]((uint64_t)v8, CFSTR("First Primary Resident Election"), v17);
          v48 = (uint64_t (**)(void))objc_getProperty(v8, v47, 24, 1);
          v8->_firstPrimaryResidentElectionEndTime = v48[2]();

          -[HMDHomePodSetupLatencyLogEvent setPrimaryResidentElectionMS_HH2:](v8->_setupLogEvent, "setPrimaryResidentElectionMS_HH2:", v8->_firstPrimaryResidentElectionEndTime - v8->_firstPrimaryResidentElectionBeginTime);
          if (!-[HMDHomePodSetupLatencyLogEvent primaryResidentElectionMS_HH2](v8->_setupLogEvent, "primaryResidentElectionMS_HH2"))-[HMDHomePodSetupLatencyLogEvent setPrimaryResidentElectionMS_HH2:](v8->_setupLogEvent, "setPrimaryResidentElectionMS_HH2:", 1);
          if (v8->_firstCurrentDeviceJoinMeshBeginTime)
          {
            if (-[HMDHomePodSetupLatencyLogEvent primaryResidentElectionJoinMeshMS_HH2](v8->_setupLogEvent, "primaryResidentElectionJoinMeshMS_HH2") == -1)
            {
              -[HMDHomePodSetupLatencyLogEvent setPrimaryResidentElectionJoinMeshMS_HH2:](v8->_setupLogEvent, "setPrimaryResidentElectionJoinMeshMS_HH2:", v8->_firstPrimaryResidentElectionEndTime - v8->_firstCurrentDeviceJoinMeshBeginTime);
              if (!-[HMDHomePodSetupLatencyLogEvent primaryResidentElectionJoinMeshMS_HH2](v8->_setupLogEvent, "primaryResidentElectionJoinMeshMS_HH2"))-[HMDHomePodSetupLatencyLogEvent setPrimaryResidentElectionJoinMeshMS_HH2:](v8->_setupLogEvent, "setPrimaryResidentElectionJoinMeshMS_HH2:", 1);
            }
          }
          -[HMDCurrentAccessorySetupMetricDispatcher _handleErrorAndSaveStage:stageTime:stageString:error:]((uint64_t)v8, 1, v8->_firstPrimaryResidentElectionEndTime, CFSTR("First Primary Resident Election"), v17);
        }
        os_unfair_lock_unlock(&v8->_lock);
      }
      goto LABEL_141;
    case 0xFuLL:
      v17 = v6;
      if (v8)
      {
        os_unfair_lock_lock_with_options();
        if (v8->_eventRouterServerConnectBeginTime && !v8->_eventRouterServerConnectEndTime)
        {
          -[HMDCurrentAccessorySetupMetricDispatcher _shouldEndStage:error:]((uint64_t)v8, CFSTR("First Event Router Server Connection"), v17);
          v50 = (uint64_t (**)(void))objc_getProperty(v8, v49, 24, 1);
          v8->_eventRouterServerConnectEndTime = v50[2]();

          -[HMDHomePodSetupLatencyLogEvent setEventRouterServerConnectionMS_HH2:](v8->_setupLogEvent, "setEventRouterServerConnectionMS_HH2:", v8->_eventRouterServerConnectEndTime - v8->_eventRouterServerConnectBeginTime);
          if (!-[HMDHomePodSetupLatencyLogEvent eventRouterServerConnectionMS_HH2](v8->_setupLogEvent, "eventRouterServerConnectionMS_HH2"))-[HMDHomePodSetupLatencyLogEvent setEventRouterServerConnectionMS_HH2:](v8->_setupLogEvent, "setEventRouterServerConnectionMS_HH2:", 1);
          -[HMDCurrentAccessorySetupMetricDispatcher _handleErrorAndSaveStage:stageTime:stageString:error:]((uint64_t)v8, 1, v8->_eventRouterServerConnectEndTime, CFSTR("First Event Router Server Connection"), v17);
        }
        os_unfair_lock_unlock(&v8->_lock);
      }
      goto LABEL_141;
    case 0x10uLL:
      v17 = v6;
      if (v8)
      {
        os_unfair_lock_lock_with_options();
        if (v8->_firstServerEventSentBeginTime && !v8->_firstServerEventSentEndTime)
        {
          -[HMDCurrentAccessorySetupMetricDispatcher _shouldEndStage:error:]((uint64_t)v8, CFSTR("First Event Push"), v17);
          v52 = (uint64_t (**)(void))objc_getProperty(v8, v51, 24, 1);
          v8->_firstServerEventSentEndTime = v52[2]();

          -[HMDHomePodSetupLatencyLogEvent setEventRouterFirstEventPushMS_HH2:](v8->_setupLogEvent, "setEventRouterFirstEventPushMS_HH2:", v8->_firstServerEventSentEndTime - v8->_firstServerEventSentBeginTime);
          if (!-[HMDHomePodSetupLatencyLogEvent eventRouterFirstEventPushMS_HH2](v8->_setupLogEvent, "eventRouterFirstEventPushMS_HH2"))-[HMDHomePodSetupLatencyLogEvent setEventRouterFirstEventPushMS_HH2:](v8->_setupLogEvent, "setEventRouterFirstEventPushMS_HH2:", 1);
          -[HMDCurrentAccessorySetupMetricDispatcher _handleErrorAndSaveStage:stageTime:stageString:error:]((uint64_t)v8, 1, v8->_firstServerEventSentEndTime, CFSTR("First Event Push"), v17);
        }
        os_unfair_lock_unlock(&v8->_lock);
      }
LABEL_141:

      break;
    default:
      break;
  }

}

- (void)markEventRouterPrimaryClientConnectStatusChanged:(BOOL)a3
{
  _BOOL4 v3;
  os_unfair_lock_s *p_lock;
  const char *v6;
  uint64_t (**v7)(void);
  void *v8;
  HMDCurrentAccessorySetupMetricDispatcher *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  HMDCurrentAccessorySetupMetricDispatcher *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v3 = a3;
  v21 = *MEMORY[0x24BDAC8D0];
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  if (-[HMDHomePodSetupLatencyLogEvent primaryResidentElectionMS_HH2](self->_setupLogEvent, "primaryResidentElectionMS_HH2"))
  {
    if (v3)
    {
      v7 = (uint64_t (**)(void))objc_getProperty(self, v6, 24, 1);
      -[HMDHomePodSetupLatencyLogEvent setLastPrimaryClientConnectedTime_HH2:](self->_setupLogEvent, "setLastPrimaryClientConnectedTime_HH2:", v7[2]() - self->_firstPrimaryResidentElectionEndTime);

      -[HMDHomePodSetupLatencyLogEvent setNumberOfTimesPrimaryClientConnected_HH2:](self->_setupLogEvent, "setNumberOfTimesPrimaryClientConnected_HH2:", -[HMDHomePodSetupLatencyLogEvent numberOfTimesPrimaryClientConnected_HH2](self->_setupLogEvent, "numberOfTimesPrimaryClientConnected_HH2")+ 1);
    }
    else
    {
      -[HMDHomePodSetupLatencyLogEvent setNumberOfTimesPrimaryClientDisconnected_HH2:](self->_setupLogEvent, "setNumberOfTimesPrimaryClientDisconnected_HH2:", -[HMDHomePodSetupLatencyLogEvent numberOfTimesPrimaryClientDisconnected_HH2](self->_setupLogEvent, "numberOfTimesPrimaryClientDisconnected_HH2")+ 1);
    }
    os_unfair_lock_unlock(p_lock);
    v12 = (void *)MEMORY[0x227676638]();
    v13 = self;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      HMFBooleanToString();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138543618;
      v18 = v15;
      v19 = 2112;
      v20 = v16;
      _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_INFO, "%{public}@Marking event router primary client did change connection: %@", (uint8_t *)&v17, 0x16u);

    }
    objc_autoreleasePoolPop(v12);
  }
  else
  {
    v8 = (void *)MEMORY[0x227676638]();
    v9 = self;
    HMFGetOSLogHandle();
    v10 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138543362;
      v18 = v11;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_DEBUG, "%{public}@Ignoring primary client connection change before primary resident is established", (uint8_t *)&v17, 0xCu);

    }
    objc_autoreleasePoolPop(v8);
    os_unfair_lock_unlock(p_lock);
  }
}

- (void)markEventRouterPrimaryClientConnectMessageFailedWithError:(id)a3
{
  id v4;
  os_unfair_lock_s *p_lock;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  HMDCurrentAccessorySetupMetricDispatcher *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  HMDCurrentAccessorySetupMetricDispatcher *v18;
  NSObject *v19;
  void *v20;
  int v21;
  void *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  if (-[HMDHomePodSetupLatencyLogEvent primaryResidentElectionMS_HH2](self->_setupLogEvent, "primaryResidentElectionMS_HH2"))
  {
    -[HMDHomePodSetupLatencyLogEvent setNumberOfTimesPrimaryClientConnectMessageFailed_HH2:](self->_setupLogEvent, "setNumberOfTimesPrimaryClientConnectMessageFailed_HH2:", -[HMDHomePodSetupLatencyLogEvent numberOfTimesPrimaryClientConnectMessageFailed_HH2](self->_setupLogEvent, "numberOfTimesPrimaryClientConnectMessageFailed_HH2")+ 1);
    if (v4)
    {
      -[HMDHomePodSetupLatencyLogEvent setLastPrimaryClientConnectMessageFailErrorCode_HH2:](self->_setupLogEvent, "setLastPrimaryClientConnectMessageFailErrorCode_HH2:", objc_msgSend(v4, "code"));
      objc_msgSend(v4, "domain");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDHomePodSetupLatencyLogEvent setLastPrimaryClientConnectMessageFailErrorDomain_HH2:](self->_setupLogEvent, "setLastPrimaryClientConnectMessageFailErrorDomain_HH2:", v6);

      objc_msgSend(v4, "underlyingErrors");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "firstObject");
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = (void *)v8;
      if (v8)
        v10 = (void *)v8;
      else
        v10 = v4;
      v11 = v10;

      -[HMDHomePodSetupLatencyLogEvent setLastPrimaryClientConnectMessageFailUnderlyingErrorCode_HH2:](self->_setupLogEvent, "setLastPrimaryClientConnectMessageFailUnderlyingErrorCode_HH2:", objc_msgSend(v11, "code"));
      objc_msgSend(v11, "domain");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDHomePodSetupLatencyLogEvent setLastPrimaryClientConnectMessageFailUnderlyingErrorDomain_HH2:](self->_setupLogEvent, "setLastPrimaryClientConnectMessageFailUnderlyingErrorDomain_HH2:", v12);

    }
    os_unfair_lock_unlock(&self->_lock);
    v13 = (void *)MEMORY[0x227676638]();
    v14 = self;
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 138543618;
      v22 = v16;
      v23 = 2112;
      v24 = v4;
      _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_INFO, "%{public}@Marking event router primary client connection message fail with error: %@", (uint8_t *)&v21, 0x16u);

    }
    objc_autoreleasePoolPop(v13);
  }
  else
  {
    v17 = (void *)MEMORY[0x227676638]();
    v18 = self;
    HMFGetOSLogHandle();
    v19 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 138543362;
      v22 = v20;
      _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_DEBUG, "%{public}@Ignoring primary client connect message failures before primary resident is established", (uint8_t *)&v21, 0xCu);

    }
    objc_autoreleasePoolPop(v17);
    os_unfair_lock_unlock(p_lock);
  }

}

- (void)markCurrentDeviceConfirmedPrimaryResidentStatusDidChange:(BOOL)a3
{
  _BOOL8 v3;
  os_unfair_lock_s *p_lock;
  void *v6;
  HMDCurrentAccessorySetupMetricDispatcher *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v3 = a3;
  v15 = *MEMORY[0x24BDAC8D0];
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  if (-[HMDHomePodSetupLatencyLogEvent currentDeviceConfirmedPrimaryResident_INT](self->_setupLogEvent, "currentDeviceConfirmedPrimaryResident_INT") == v3)
  {
    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    -[HMDHomePodSetupLatencyLogEvent setCurrentDeviceConfirmedPrimaryResident_INT:](self->_setupLogEvent, "setCurrentDeviceConfirmedPrimaryResident_INT:", v3);
    os_unfair_lock_unlock(p_lock);
    v6 = (void *)MEMORY[0x227676638]();
    v7 = self;
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      HMFBooleanToString();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543618;
      v12 = v9;
      v13 = 2112;
      v14 = v10;
      _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_INFO, "%{public}@Marking current device confirmed primary resident status did change: %@", (uint8_t *)&v11, 0x16u);

    }
    objc_autoreleasePoolPop(v6);
  }
}

- (void)markControllerHH2Mode:(BOOL)a3 controllerHH2SentinelExists:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  os_unfair_lock_s *p_lock;

  v4 = a4;
  v5 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  -[HMDHomePodSetupLatencyLogEvent setControllerInHH2_INT:](self->_setupLogEvent, "setControllerInHH2_INT:", v5);
  -[HMDHomePodSetupLatencyLogEvent setControllerHasSentinelZone_INT:](self->_setupLogEvent, "setControllerHasSentinelZone_INT:", v4);
  os_unfair_lock_unlock(p_lock);
}

- (void)startFinalSubmissionTimer
{
  HMDCurrentAccessorySetupMetricDispatcher *v2;
  void *v3;
  void *v4;
  id v5;

  v2 = self;
  if (self)
    self = (HMDCurrentAccessorySetupMetricDispatcher *)objc_getProperty(self, a2, 40, 1);
  ((void (*)(HMDCurrentAccessorySetupMetricDispatcher *, SEL))self->_dataSource)(self, a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCurrentAccessorySetupMetricDispatcher setSubmissionTimer:](v2, "setSubmissionTimer:", v3);

  -[HMDCurrentAccessorySetupMetricDispatcher submissionTimer](v2, "submissionTimer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDelegate:", v2);

  -[HMDCurrentAccessorySetupMetricDispatcher submissionTimer](v2, "submissionTimer");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "resume");

}

- (void)markPrimaryResidentElectionPeerDeviceFutureResolved
{
  os_unfair_lock_s *p_lock;
  const char *v4;
  uint64_t (**v5)(void);

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  if (self->_firstPrimaryResidentElectionBeginTime)
  {
    if (-[HMDHomePodSetupLatencyLogEvent primaryResidentElectionPeerDeviceFutureResolvedMS_HH2](self->_setupLogEvent, "primaryResidentElectionPeerDeviceFutureResolvedMS_HH2") == -1)
    {
      v5 = (uint64_t (**)(void))objc_getProperty(self, v4, 24, 1);
      -[HMDHomePodSetupLatencyLogEvent setPrimaryResidentElectionPeerDeviceFutureResolvedMS_HH2:](self->_setupLogEvent, "setPrimaryResidentElectionPeerDeviceFutureResolvedMS_HH2:", v5[2]() - self->_firstPrimaryResidentElectionBeginTime);

      if (!-[HMDHomePodSetupLatencyLogEvent primaryResidentElectionPeerDeviceFutureResolvedMS_HH2](self->_setupLogEvent, "primaryResidentElectionPeerDeviceFutureResolvedMS_HH2"))-[HMDHomePodSetupLatencyLogEvent setPrimaryResidentElectionPeerDeviceFutureResolvedMS_HH2:](self->_setupLogEvent, "setPrimaryResidentElectionPeerDeviceFutureResolvedMS_HH2:", 1);
    }
  }
  os_unfair_lock_unlock(p_lock);
}

- (void)markPrimaryResidentElectionFirstCloudKitImportFutureResolved
{
  os_unfair_lock_s *p_lock;
  const char *v4;
  uint64_t (**v5)(void);

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  if (self->_firstPrimaryResidentElectionBeginTime)
  {
    if (-[HMDHomePodSetupLatencyLogEvent primaryResidentElectionFirstCloudKitImportFutureResolvedMS_HH2](self->_setupLogEvent, "primaryResidentElectionFirstCloudKitImportFutureResolvedMS_HH2") == -1)
    {
      v5 = (uint64_t (**)(void))objc_getProperty(self, v4, 24, 1);
      -[HMDHomePodSetupLatencyLogEvent setPrimaryResidentElectionFirstCloudKitImportFutureResolvedMS_HH2:](self->_setupLogEvent, "setPrimaryResidentElectionFirstCloudKitImportFutureResolvedMS_HH2:", v5[2]() - self->_firstPrimaryResidentElectionBeginTime);

      if (!-[HMDHomePodSetupLatencyLogEvent primaryResidentElectionFirstCloudKitImportFutureResolvedMS_HH2](self->_setupLogEvent, "primaryResidentElectionFirstCloudKitImportFutureResolvedMS_HH2"))-[HMDHomePodSetupLatencyLogEvent setPrimaryResidentElectionFirstCloudKitImportFutureResolvedMS_HH2:](self->_setupLogEvent, "setPrimaryResidentElectionFirstCloudKitImportFutureResolvedMS_HH2:", 1);
    }
  }
  os_unfair_lock_unlock(p_lock);
}

- (void)markPrimaryResidentElectionModernTransportStartedFutureResolved
{
  os_unfair_lock_s *p_lock;
  const char *v4;
  uint64_t (**v5)(void);

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  if (self->_firstPrimaryResidentElectionBeginTime)
  {
    if (-[HMDHomePodSetupLatencyLogEvent primaryResidentElectionModernTransportStartedFutureResolvedMS_HH2](self->_setupLogEvent, "primaryResidentElectionModernTransportStartedFutureResolvedMS_HH2") == -1)
    {
      v5 = (uint64_t (**)(void))objc_getProperty(self, v4, 24, 1);
      -[HMDHomePodSetupLatencyLogEvent setPrimaryResidentElectionModernTransportStartedFutureResolvedMS_HH2:](self->_setupLogEvent, "setPrimaryResidentElectionModernTransportStartedFutureResolvedMS_HH2:", v5[2]() - self->_firstPrimaryResidentElectionBeginTime);

      if (!-[HMDHomePodSetupLatencyLogEvent primaryResidentElectionModernTransportStartedFutureResolvedMS_HH2](self->_setupLogEvent, "primaryResidentElectionModernTransportStartedFutureResolvedMS_HH2"))-[HMDHomePodSetupLatencyLogEvent setPrimaryResidentElectionModernTransportStartedFutureResolvedMS_HH2:](self->_setupLogEvent, "setPrimaryResidentElectionModernTransportStartedFutureResolvedMS_HH2:", 1);
    }
  }
  os_unfair_lock_unlock(p_lock);
}

- (void)markPrimaryResidentSelectionConnectedToStatusKitFutureResolved
{
  os_unfair_lock_s *p_lock;
  const char *v4;
  uint64_t (**v5)(void);

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  if (self->_firstPrimaryResidentElectionBeginTime)
  {
    if (-[HMDHomePodSetupLatencyLogEvent primaryResidentSelectionConnectedToStatusKitFutureResolvedMS_HH2](self->_setupLogEvent, "primaryResidentSelectionConnectedToStatusKitFutureResolvedMS_HH2") == -1)
    {
      v5 = (uint64_t (**)(void))objc_getProperty(self, v4, 24, 1);
      -[HMDHomePodSetupLatencyLogEvent setPrimaryResidentSelectionConnectedToStatusKitFutureResolvedMS_HH2:](self->_setupLogEvent, "setPrimaryResidentSelectionConnectedToStatusKitFutureResolvedMS_HH2:", v5[2]() - self->_firstPrimaryResidentElectionBeginTime);

      if (!-[HMDHomePodSetupLatencyLogEvent primaryResidentSelectionConnectedToStatusKitFutureResolvedMS_HH2](self->_setupLogEvent, "primaryResidentSelectionConnectedToStatusKitFutureResolvedMS_HH2"))-[HMDHomePodSetupLatencyLogEvent setPrimaryResidentSelectionConnectedToStatusKitFutureResolvedMS_HH2:](self->_setupLogEvent, "setPrimaryResidentSelectionConnectedToStatusKitFutureResolvedMS_HH2:", 1);
    }
  }
  os_unfair_lock_unlock(p_lock);
}

- (void)markPrimaryResidentElectionJoinMesh
{
  os_unfair_lock_s *p_lock;
  const char *v4;
  uint64_t (**v5)(void);

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  if (self->_firstPrimaryResidentElectionBeginTime && !self->_firstCurrentDeviceJoinMeshBeginTime)
  {
    v5 = (uint64_t (**)(void))objc_getProperty(self, v4, 24, 1);
    self->_firstCurrentDeviceJoinMeshBeginTime = v5[2]();

    -[HMDHomePodSetupLatencyLogEvent setPrimaryResidentElectionJoinMeshMS_HH2:](self->_setupLogEvent, "setPrimaryResidentElectionJoinMeshMS_HH2:", -1);
  }
  os_unfair_lock_unlock(p_lock);
}

- (void)timerDidFire:(id)a3
{
  os_unfair_lock_s *p_lock;
  void *v5;
  void *v6;
  HMDCurrentAccessorySetupMetricDispatcher *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  HMDCurrentAccessorySetupMetricDispatcher *v11;
  NSObject *v12;
  void *v13;
  HMDCurrentAccessorySetupMetricDispatcher *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  uint64_t v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  uint64_t v28;
  void *v29;
  void *v30;
  id v31;
  id v32;
  uint64_t v33;
  void *v34;
  void *v35;
  id v36;
  id v37;
  uint64_t v38;
  void *v39;
  void *v40;
  id v41;
  id v42;
  uint64_t v43;
  void *v44;
  void *v45;
  id v46;
  id v47;
  uint64_t v48;
  void *v49;
  void *v50;
  id v51;
  id v52;
  uint64_t v53;
  void *v54;
  void *v55;
  id v56;
  id v57;
  uint64_t v58;
  void *v59;
  void *v60;
  id v61;
  id v62;
  uint64_t v63;
  void *v64;
  void *v65;
  id v66;
  id v67;
  uint64_t v68;
  void *v69;
  void *v70;
  id v71;
  id v72;
  uint64_t v73;
  void *v74;
  void *v75;
  id v76;
  id v77;
  uint64_t v78;
  void *v79;
  void *v80;
  id v81;
  id v82;
  uint64_t v83;
  void *v84;
  void *v85;
  id v86;
  id v87;
  id WeakRetained;
  void *v89;
  HMDCurrentAccessorySetupMetricDispatcher *v90;
  NSObject *v91;
  id v92;
  void *v93;
  void *v94;
  SEL v95;
  id v96;
  SEL v97;
  id v98;
  const char *v99;
  void *v100;
  HMDCurrentAccessorySetupMetricDispatcher *v101;
  NSObject *v102;
  void *v103;
  id v104;
  uint8_t buf[4];
  id v106;
  __int16 v107;
  void *v108;
  __int16 v109;
  id v110;
  uint64_t v111;

  v111 = *MEMORY[0x24BDAC8D0];
  v104 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  -[HMDCurrentAccessorySetupMetricDispatcher dataSource]((id *)&self->super.super.isa);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCurrentAccessorySetupMetricDispatcher setSubmissionTimer:](self, "setSubmissionTimer:", 0);
  if (-[HMDCurrentAccessorySetupMetricDispatcher allStagesSubmitted](self, "allStagesSubmitted"))
  {
    v6 = (void *)MEMORY[0x227676638]();
    v7 = self;
    HMFGetOSLogHandle();
    v8 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v106 = v9;
      _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_INFO, "%{public}@Submission timer fired, but all stages are already submitted.", buf, 0xCu);

    }
LABEL_4:

    objc_autoreleasePoolPop(v6);
    objc_msgSend(v5, "removeCurrentAccessorySetupMetricDispatcherIfNeeded");
    goto LABEL_110;
  }
  if (!self)
  {
LABEL_13:
    v6 = (void *)MEMORY[0x227676638]();
    v14 = self;
    HMFGetOSLogHandle();
    v8 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v106 = v15;
      _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_INFO, "%{public}@Not a valid log event and do not submit", buf, 0xCu);

    }
    goto LABEL_4;
  }
  os_unfair_lock_assert_owner(&self->_lock);
  if (-[HMDHomePodSetupLatencyLogEvent sessionSetupOpenMS_HH1](self->_setupLogEvent, "sessionSetupOpenMS_HH1") >= 1
    && -[HMDHomePodSetupLatencyLogEvent sessionSetupCloseMS_HH1](self->_setupLogEvent, "sessionSetupCloseMS_HH1") >= 1
    && (!-[HMDHomePodSetupLatencyLogEvent controllerKeyExchangeMS_HH1](self->_setupLogEvent, "controllerKeyExchangeMS_HH1")|| !-[HMDHomePodSetupLatencyLogEvent newAccessoryTransferMS_HH1](self->_setupLogEvent, "newAccessoryTransferMS_HH1")))
  {
    v10 = (void *)MEMORY[0x227676638]();
    v11 = self;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v106 = v13;
      _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_INFO, "%{public}@Do not submit as this appears to be a device repair session.", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v10);
    goto LABEL_13;
  }
  -[HMDHomePodSetupLatencyLogEvent setNetworkAvailable_INT:](self->_setupLogEvent, "setNetworkAvailable_INT:", objc_msgSend(v5, "hasValidNetwork"));
  -[HMDHomePodSetupLatencyLogEvent setManateeAvailable_INT:](self->_setupLogEvent, "setManateeAvailable_INT:", objc_msgSend(v5, "hasManatee"));
  -[HMDHomePodSetupLatencyLogEvent setICloudAvailable_INT:](self->_setupLogEvent, "setICloudAvailable_INT:", objc_msgSend(v5, "isSignedIntoiCloud"));
  -[HMDHomePodSetupLatencyLogEvent setIDSAvailable_INT:](self->_setupLogEvent, "setIDSAvailable_INT:", objc_msgSend(v5, "isIdsServiceActive"));
  -[HMDHomePodSetupLatencyLogEvent setIDSRegistrationStatus_INT:](self->_setupLogEvent, "setIDSRegistrationStatus_INT:", objc_msgSend(v5, "IDSAccountRegistrationStatus"));
  -[HMDHomePodSetupLatencyLogEvent setIDSRegistrationError_INT:](self->_setupLogEvent, "setIDSRegistrationError_INT:", objc_msgSend(v5, "IDSAccountRegistrationError"));
  self->_allStagesSubmitted = 1;
  os_unfair_lock_assert_owner(&self->_lock);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_stageErrorDict, "objectForKeyedSubscript:", CFSTR("Setup Session Open"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[HMDHomePodSetupLatencyLogEvent sessionSetupOpenMS_HH1](self->_setupLogEvent, "sessionSetupOpenMS_HH1")
    || -[HMDHomePodSetupLatencyLogEvent sessionSetupOpenMS_HH1](self->_setupLogEvent, "sessionSetupOpenMS_HH1") == -1)
  {
    -[HMDHomePodSetupLatencyLogEvent setErrorStage_String:](self->_setupLogEvent, "setErrorStage_String:", CFSTR("Setup Session Open"));
    v17 = v16;
  }
  else
  {
    v17 = 0;
  }
  -[NSMutableDictionary objectForKeyedSubscript:](self->_stageErrorDict, "objectForKeyedSubscript:", CFSTR("Controller Key Exchange"));
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = (void *)v18;
  if (v18)
    v20 = (void *)v18;
  else
    v20 = v16;
  v21 = v20;

  if (!-[HMDHomePodSetupLatencyLogEvent controllerKeyExchangeMS_HH1](self->_setupLogEvent, "controllerKeyExchangeMS_HH1")|| -[HMDHomePodSetupLatencyLogEvent controllerKeyExchangeMS_HH1](self->_setupLogEvent, "controllerKeyExchangeMS_HH1") == -1)
  {
    -[HMDHomePodSetupLatencyLogEvent setErrorStage_String:](self->_setupLogEvent, "setErrorStage_String:", CFSTR("Controller Key Exchange"));
    v22 = v21;

    v17 = v22;
  }
  -[NSMutableDictionary objectForKeyedSubscript:](self->_stageErrorDict, "objectForKeyedSubscript:", CFSTR("New Accessory Transfer"));
  v23 = objc_claimAutoreleasedReturnValue();
  v24 = (void *)v23;
  if (v23)
    v25 = (void *)v23;
  else
    v25 = v21;
  v26 = v25;

  if (!-[HMDHomePodSetupLatencyLogEvent newAccessoryTransferMS_HH1](self->_setupLogEvent, "newAccessoryTransferMS_HH1")
    || -[HMDHomePodSetupLatencyLogEvent newAccessoryTransferMS_HH1](self->_setupLogEvent, "newAccessoryTransferMS_HH1") == -1)
  {
    -[HMDHomePodSetupLatencyLogEvent setErrorStage_String:](self->_setupLogEvent, "setErrorStage_String:", CFSTR("New Accessory Transfer"));
    v27 = v26;

    v17 = v27;
  }
  -[NSMutableDictionary objectForKeyedSubscript:](self->_stageErrorDict, "objectForKeyedSubscript:", CFSTR("Setup Session Close"));
  v28 = objc_claimAutoreleasedReturnValue();
  v29 = (void *)v28;
  if (v28)
    v30 = (void *)v28;
  else
    v30 = v26;
  v31 = v30;

  if (!-[HMDHomePodSetupLatencyLogEvent sessionSetupCloseMS_HH1](self->_setupLogEvent, "sessionSetupCloseMS_HH1")
    || -[HMDHomePodSetupLatencyLogEvent sessionSetupCloseMS_HH1](self->_setupLogEvent, "sessionSetupCloseMS_HH1") == -1)
  {
    -[HMDHomePodSetupLatencyLogEvent setErrorStage_String:](self->_setupLogEvent, "setErrorStage_String:", CFSTR("Setup Session Close"));
    v32 = v31;

    v17 = v32;
  }
  -[NSMutableDictionary objectForKeyedSubscript:](self->_stageErrorDict, "objectForKeyedSubscript:", CFSTR("Apple account settled"));
  v33 = objc_claimAutoreleasedReturnValue();
  v34 = (void *)v33;
  if (v33)
    v35 = (void *)v33;
  else
    v35 = v31;
  v36 = v35;

  if (!-[HMDHomePodSetupLatencyLogEvent accountSettleWaitMS_HH2](self->_setupLogEvent, "accountSettleWaitMS_HH2")
    || -[HMDHomePodSetupLatencyLogEvent accountSettleWaitMS_HH2](self->_setupLogEvent, "accountSettleWaitMS_HH2") == -1)
  {
    -[HMDHomePodSetupLatencyLogEvent setErrorStage_String:](self->_setupLogEvent, "setErrorStage_String:", CFSTR("Apple account settled"));
    v37 = v36;

    v17 = v37;
  }
  -[NSMutableDictionary objectForKeyedSubscript:](self->_stageErrorDict, "objectForKeyedSubscript:", CFSTR("Current device settled"));
  v38 = objc_claimAutoreleasedReturnValue();
  v39 = (void *)v38;
  if (v38)
    v40 = (void *)v38;
  else
    v40 = v36;
  v41 = v40;

  if (!-[HMDHomePodSetupLatencyLogEvent currentDeviceIDSWaitMS_HH2](self->_setupLogEvent, "currentDeviceIDSWaitMS_HH2")
    || -[HMDHomePodSetupLatencyLogEvent currentDeviceIDSWaitMS_HH2](self->_setupLogEvent, "currentDeviceIDSWaitMS_HH2") == -1)
  {
    -[HMDHomePodSetupLatencyLogEvent setErrorStage_String:](self->_setupLogEvent, "setErrorStage_String:", CFSTR("Current device settled"));
    v42 = v41;

    v17 = v42;
  }
  -[NSMutableDictionary objectForKeyedSubscript:](self->_stageErrorDict, "objectForKeyedSubscript:", CFSTR("Home Manager Initialized"));
  v43 = objc_claimAutoreleasedReturnValue();
  v44 = (void *)v43;
  if (v43)
    v45 = (void *)v43;
  else
    v45 = v41;
  v46 = v45;

  if (!-[HMDHomePodSetupLatencyLogEvent homeManagerReadyMS_HH2](self->_setupLogEvent, "homeManagerReadyMS_HH2")
    || -[HMDHomePodSetupLatencyLogEvent homeManagerReadyMS_HH2](self->_setupLogEvent, "homeManagerReadyMS_HH2") == -1)
  {
    -[HMDHomePodSetupLatencyLogEvent setErrorStage_String:](self->_setupLogEvent, "setErrorStage_String:", CFSTR("Home Manager Initialized"));
    v47 = v46;

    v17 = v47;
  }
  -[NSMutableDictionary objectForKeyedSubscript:](self->_stageErrorDict, "objectForKeyedSubscript:", CFSTR("First CoreData Import"));
  v48 = objc_claimAutoreleasedReturnValue();
  v49 = (void *)v48;
  if (v48)
    v50 = (void *)v48;
  else
    v50 = v46;
  v51 = v50;

  if (!-[HMDHomePodSetupLatencyLogEvent firstCoreDataImportMS_HH2](self->_setupLogEvent, "firstCoreDataImportMS_HH2")
    || -[HMDHomePodSetupLatencyLogEvent firstCoreDataImportMS_HH2](self->_setupLogEvent, "firstCoreDataImportMS_HH2") == -1)
  {
    -[HMDHomePodSetupLatencyLogEvent setErrorStage_String:](self->_setupLogEvent, "setErrorStage_String:", CFSTR("First CoreData Import"));
    v52 = v51;

    v17 = v52;
  }
  -[NSMutableDictionary objectForKeyedSubscript:](self->_stageErrorDict, "objectForKeyedSubscript:", CFSTR("Settings Creation"));
  v53 = objc_claimAutoreleasedReturnValue();
  v54 = (void *)v53;
  if (v53)
    v55 = (void *)v53;
  else
    v55 = v51;
  v56 = v55;

  if (!-[HMDHomePodSetupLatencyLogEvent settingsCreationMS_HH2](self->_setupLogEvent, "settingsCreationMS_HH2")
    || -[HMDHomePodSetupLatencyLogEvent settingsCreationMS_HH2](self->_setupLogEvent, "settingsCreationMS_HH2") == -1)
  {
    -[HMDHomePodSetupLatencyLogEvent setErrorStage_String:](self->_setupLogEvent, "setErrorStage_String:", CFSTR("Settings Creation"));
    v57 = v56;

    v17 = v57;
  }
  -[NSMutableDictionary objectForKeyedSubscript:](self->_stageErrorDict, "objectForKeyedSubscript:", CFSTR("Pairing Identity Creation"));
  v58 = objc_claimAutoreleasedReturnValue();
  v59 = (void *)v58;
  if (v58)
    v60 = (void *)v58;
  else
    v60 = v56;
  v61 = v60;

  if (!-[HMDHomePodSetupLatencyLogEvent pairingIdentityCreationMS_HH2](self->_setupLogEvent, "pairingIdentityCreationMS_HH2")|| -[HMDHomePodSetupLatencyLogEvent pairingIdentityCreationMS_HH2](self->_setupLogEvent, "pairingIdentityCreationMS_HH2") == -1)
  {
    -[HMDHomePodSetupLatencyLogEvent setErrorStage_String:](self->_setupLogEvent, "setErrorStage_String:", CFSTR("Pairing Identity Creation"));
    v62 = v61;

    v17 = v62;
  }
  -[NSMutableDictionary objectForKeyedSubscript:](self->_stageErrorDict, "objectForKeyedSubscript:", CFSTR("Accessory Add"));
  v63 = objc_claimAutoreleasedReturnValue();
  v64 = (void *)v63;
  if (v63)
    v65 = (void *)v63;
  else
    v65 = v61;
  v66 = v65;

  if (!-[HMDHomePodSetupLatencyLogEvent accessoryAddMS_HH2](self->_setupLogEvent, "accessoryAddMS_HH2")
    || -[HMDHomePodSetupLatencyLogEvent accessoryAddMS_HH2](self->_setupLogEvent, "accessoryAddMS_HH2") == -1)
  {
    -[HMDHomePodSetupLatencyLogEvent setErrorStage_String:](self->_setupLogEvent, "setErrorStage_String:", CFSTR("Accessory Add"));
    v67 = v66;

    v17 = v67;
  }
  -[NSMutableDictionary objectForKeyedSubscript:](self->_stageErrorDict, "objectForKeyedSubscript:", CFSTR("Siri Home Automation Ready"));
  v68 = objc_claimAutoreleasedReturnValue();
  v69 = (void *)v68;
  if (v68)
    v70 = (void *)v68;
  else
    v70 = v66;
  v71 = v70;

  if (!-[HMDHomePodSetupLatencyLogEvent siriReadyMS_HH2](self->_setupLogEvent, "siriReadyMS_HH2")
    || -[HMDHomePodSetupLatencyLogEvent siriReadyMS_HH2](self->_setupLogEvent, "siriReadyMS_HH2") == -1)
  {
    -[HMDHomePodSetupLatencyLogEvent setErrorStage_String:](self->_setupLogEvent, "setErrorStage_String:", CFSTR("Siri Home Automation Ready"));
    v72 = v71;

    v17 = v72;
  }
  -[NSMutableDictionary objectForKeyedSubscript:](self->_stageErrorDict, "objectForKeyedSubscript:", CFSTR("First Primary Resident Election"));
  v73 = objc_claimAutoreleasedReturnValue();
  v74 = (void *)v73;
  if (v73)
    v75 = (void *)v73;
  else
    v75 = v71;
  v76 = v75;

  if (!-[HMDHomePodSetupLatencyLogEvent primaryResidentElectionMS_HH2](self->_setupLogEvent, "primaryResidentElectionMS_HH2")|| -[HMDHomePodSetupLatencyLogEvent primaryResidentElectionMS_HH2](self->_setupLogEvent, "primaryResidentElectionMS_HH2") == -1)
  {
    -[HMDHomePodSetupLatencyLogEvent setErrorStage_String:](self->_setupLogEvent, "setErrorStage_String:", CFSTR("First Primary Resident Election"));
    v77 = v76;

    v17 = v77;
  }
  -[NSMutableDictionary objectForKeyedSubscript:](self->_stageErrorDict, "objectForKeyedSubscript:", CFSTR("First Event Router Server Connection"));
  v78 = objc_claimAutoreleasedReturnValue();
  v79 = (void *)v78;
  if (v78)
    v80 = (void *)v78;
  else
    v80 = v76;
  v81 = v80;

  if (!-[HMDHomePodSetupLatencyLogEvent eventRouterServerConnectionMS_HH2](self->_setupLogEvent, "eventRouterServerConnectionMS_HH2")|| -[HMDHomePodSetupLatencyLogEvent eventRouterServerConnectionMS_HH2](self->_setupLogEvent, "eventRouterServerConnectionMS_HH2") == -1)
  {
    -[HMDHomePodSetupLatencyLogEvent setErrorStage_String:](self->_setupLogEvent, "setErrorStage_String:", CFSTR("First Event Router Server Connection"));
    v82 = v81;

    v17 = v82;
  }
  -[NSMutableDictionary objectForKeyedSubscript:](self->_stageErrorDict, "objectForKeyedSubscript:", CFSTR("First Event Push"));
  v83 = objc_claimAutoreleasedReturnValue();
  v84 = (void *)v83;
  if (v83)
    v85 = (void *)v83;
  else
    v85 = v81;
  v86 = v85;

  if (!-[HMDHomePodSetupLatencyLogEvent eventRouterFirstEventPushMS_HH2](self->_setupLogEvent, "eventRouterFirstEventPushMS_HH2")|| -[HMDHomePodSetupLatencyLogEvent eventRouterFirstEventPushMS_HH2](self->_setupLogEvent, "eventRouterFirstEventPushMS_HH2") == -1)
  {
    -[HMDHomePodSetupLatencyLogEvent setErrorStage_String:](self->_setupLogEvent, "setErrorStage_String:", CFSTR("First Event Push"));
    v87 = v86;

    v17 = v87;
  }

  if (!v17)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:", 13);
    v17 = (id)objc_claimAutoreleasedReturnValue();
  }
  -[HMDHomePodSetupLatencyLogEvent setSavedEventState:](self->_setupLogEvent, "setSavedEventState:", 3);
  -[HMDCurrentAccessorySetupMetricDispatcher _recordTotalDuration]((uint64_t)self);
  WeakRetained = objc_loadWeakRetained((id *)&self->_logEventSubmitter);
  objc_msgSend(WeakRetained, "submitLogEvent:error:", self->_setupLogEvent, v17);

  v89 = (void *)MEMORY[0x227676638]();
  v90 = self;
  HMFGetOSLogHandle();
  v91 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v91, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v92 = (id)objc_claimAutoreleasedReturnValue();
    -[HMDHomePodSetupLatencyLogEvent coreAnalyticsEventDictionary](self->_setupLogEvent, "coreAnalyticsEventDictionary");
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v106 = v92;
    v107 = 2112;
    v108 = v93;
    v109 = 2112;
    v110 = v17;
    _os_log_impl(&dword_2218F0000, v91, OS_LOG_TYPE_INFO, "%{public}@Submission timer fired and submitting the final metric log event: %@ with error %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v89);
  v94 = (void *)objc_opt_class();
  v96 = objc_getProperty(v90, v95, 56, 1);
  v98 = objc_getProperty(v90, v97, 48, 1);
  objc_msgSend(v94, "saveSetupLogEventIntoUserDefaults:setupLogEvent:", v96, v98);

  -[HMDCurrentAccessorySetupMetricDispatcher _markMetricDispatcherSubmission](v90, v99);
  v100 = (void *)MEMORY[0x227676638]();
  v101 = v90;
  HMFGetOSLogHandle();
  v102 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v102, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v106 = v103;
    _os_log_impl(&dword_2218F0000, v102, OS_LOG_TYPE_INFO, "%{public}@Log event submitted during timeout, removing the metric dispatcher", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v100);
  objc_msgSend(v5, "removeCurrentAccessorySetupMetricDispatcherIfNeeded");

LABEL_110:
  os_unfair_lock_unlock(p_lock);

}

- (void)markFirstCoreDataContainerSetupDuration:(double)a3 error:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;

  v12 = a4;
  os_unfair_lock_lock_with_options();
  if (!-[HMDHomePodSetupLatencyLogEvent firstCoreDataContainerSetupDurationMS_HH2](self->_setupLogEvent, "firstCoreDataContainerSetupDurationMS_HH2"))
  {
    -[HMDHomePodSetupLatencyLogEvent setFirstCoreDataContainerSetupDurationMS_HH2:](self->_setupLogEvent, "setFirstCoreDataContainerSetupDurationMS_HH2:", (uint64_t)(a3 * 1000.0));
    if (v12)
    {
      -[HMDHomePodSetupLatencyLogEvent setFirstCoreDataContainerSetupErrorCode_HH2:](self->_setupLogEvent, "setFirstCoreDataContainerSetupErrorCode_HH2:", objc_msgSend(v12, "code"));
      objc_msgSend(v12, "domain");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDHomePodSetupLatencyLogEvent setFirstCoreDataContainerSetupErrorDomain_HH2:](self->_setupLogEvent, "setFirstCoreDataContainerSetupErrorDomain_HH2:", v6);

      objc_msgSend(v12, "underlyingErrors");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "firstObject");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
        v9 = v8;
      else
        v9 = v12;
      v10 = v9;

      -[HMDHomePodSetupLatencyLogEvent setFirstCoreDataContainerSetupUnderlyingErrorCode_HH2:](self->_setupLogEvent, "setFirstCoreDataContainerSetupUnderlyingErrorCode_HH2:", objc_msgSend(v10, "code"));
      objc_msgSend(v10, "domain");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDHomePodSetupLatencyLogEvent setFirstCoreDataContainerSetupUnderlyingErrorDomain_HH2:](self->_setupLogEvent, "setFirstCoreDataContainerSetupUnderlyingErrorDomain_HH2:", v11);

    }
  }
  os_unfair_lock_unlock(&self->_lock);

}

- (NSString)setupSessionIdentifier
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  -[HMDHomePodSetupLatencyLogEvent setupSessionIdentifier](self->_setupLogEvent, "setupSessionIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);
  return (NSString *)v4;
}

- (void)setControllerSetupSessionIdentifier:(id)a3
{
  id v4;
  void *v5;
  HMDCurrentAccessorySetupMetricDispatcher *v6;
  NSObject *v7;
  void *v8;
  void *v9;
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
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Setting controller setup session identifier %@ on the log event.", (uint8_t *)&v10, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  os_unfair_lock_lock_with_options();
  v9 = (void *)objc_msgSend(v4, "copy");
  -[HMDHomePodSetupLatencyLogEvent setSetupSessionIdentifier:](v6->_setupLogEvent, "setSetupSessionIdentifier:", v9);

  os_unfair_lock_unlock(&v6->_lock);
}

- (BOOL)allStagesSubmitted
{
  return self->_allStagesSubmitted;
}

- (HMFTimer)submissionTimer
{
  return (HMFTimer *)objc_getProperty(self, a2, 72, 1);
}

- (void)setSubmissionTimer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (unint64_t)setupSessionOpenBeginTime
{
  return self->_setupSessionOpenBeginTime;
}

- (unint64_t)setupSessionOpenEndTime
{
  return self->_setupSessionOpenEndTime;
}

- (unint64_t)setupSessionCloseBeginTime
{
  return self->_setupSessionCloseBeginTime;
}

- (unint64_t)setupSessionCloseEndTime
{
  return self->_setupSessionCloseEndTime;
}

- (unint64_t)receiveControllerKeyBeginTime
{
  return self->_receiveControllerKeyBeginTime;
}

- (unint64_t)receiveControllerKeyEndTime
{
  return self->_receiveControllerKeyEndTime;
}

- (unint64_t)sentUnassociatedMediaAccessoryBeginTime
{
  return self->_sentUnassociatedMediaAccessoryBeginTime;
}

- (unint64_t)sentUnassociatedMediaAccessoryEndTime
{
  return self->_sentUnassociatedMediaAccessoryEndTime;
}

- (unint64_t)pairingIdentityCreationBeginTime
{
  return self->_pairingIdentityCreationBeginTime;
}

- (unint64_t)pairingIdentityCreationEndTime
{
  return self->_pairingIdentityCreationEndTime;
}

- (unint64_t)settingsCreationBeginTime
{
  return self->_settingsCreationBeginTime;
}

- (unint64_t)settingsCreationEndTime
{
  return self->_settingsCreationEndTime;
}

- (unint64_t)addAccessoryBeginTime
{
  return self->_addAccessoryBeginTime;
}

- (unint64_t)addAccessoryEndTime
{
  return self->_addAccessoryEndTime;
}

- (unint64_t)hh2SentinelZoneFetchBeginTime
{
  return self->_hh2SentinelZoneFetchBeginTime;
}

- (unint64_t)hh2SentinelZoneFetchEndTime
{
  return self->_hh2SentinelZoneFetchEndTime;
}

- (unint64_t)coreDataFirstCloudImportBeginTime
{
  return self->_coreDataFirstCloudImportBeginTime;
}

- (unint64_t)coreDataFirstCloudImportEndTime
{
  return self->_coreDataFirstCloudImportEndTime;
}

- (unint64_t)appleAccountSettledBeginTime
{
  return self->_appleAccountSettledBeginTime;
}

- (unint64_t)appleAccountSettledEndTime
{
  return self->_appleAccountSettledEndTime;
}

- (unint64_t)currentIDSDeviceSettledBeginTime
{
  return self->_currentIDSDeviceSettledBeginTime;
}

- (unint64_t)currentIDSDeviceSettledEndTime
{
  return self->_currentIDSDeviceSettledEndTime;
}

- (unint64_t)homeManagerInitBeginTime
{
  return self->_homeManagerInitBeginTime;
}

- (unint64_t)homeManagerInitEndTime
{
  return self->_homeManagerInitEndTime;
}

- (unint64_t)eventRouterServerConnectBeginTime
{
  return self->_eventRouterServerConnectBeginTime;
}

- (unint64_t)eventRouterServerConnectEndTime
{
  return self->_eventRouterServerConnectEndTime;
}

- (unint64_t)firstServerEventSentBeginTime
{
  return self->_firstServerEventSentBeginTime;
}

- (unint64_t)firstServerEventSentEndTime
{
  return self->_firstServerEventSentEndTime;
}

- (unint64_t)firstPrimaryResidentElectionBeginTime
{
  return self->_firstPrimaryResidentElectionBeginTime;
}

- (unint64_t)firstPrimaryResidentElectionEndTime
{
  return self->_firstPrimaryResidentElectionEndTime;
}

- (unint64_t)firstCurrentDeviceJoinMeshBeginTime
{
  return self->_firstCurrentDeviceJoinMeshBeginTime;
}

- (unint64_t)siriReadyBeginTime
{
  return self->_siriReadyBeginTime;
}

- (unint64_t)siriReadyEndTime
{
  return self->_siriReadyEndTime;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_submissionTimer, 0);
  objc_storeStrong((id *)&self->_stageErrorDict, 0);
  objc_storeStrong((id *)&self->_userDefaults, 0);
  objc_storeStrong((id *)&self->_setupLogEvent, 0);
  objc_storeStrong(&self->_submissionTimerFactory, 0);
  objc_destroyWeak((id *)&self->_logEventSubmitter);
  objc_storeStrong(&self->_currentUpTicksFactory, 0);
  objc_destroyWeak((id *)&self->_dataSource);
}

- (id)dataSource
{
  if (WeakRetained)
    WeakRetained = (id *)objc_loadWeakRetained(WeakRetained + 2);
  return WeakRetained;
}

- (void)_recordTotalDuration
{
  SEL v2;
  uint64_t (**Property)(void);
  unint64_t v4;
  unint64_t v5;
  uint64_t v7;
  void *v8;
  id *v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  int v13;
  void *v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  if (a1)
  {
    os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 8));
    Property = (uint64_t (**)(void))objc_getProperty((id)a1, v2, 24, 1);
    v4 = Property[2]();
    v5 = *(_QWORD *)(a1 + 208);
    if (v4 <= v5 || v5 == 0)
      v7 = -1;
    else
      v7 = v4 - v5;
    v8 = (void *)MEMORY[0x227676638](objc_msgSend(*(id *)(a1 + 48), "setTotalDurationMS_HH2:", v7));
    v9 = (id *)(id)a1;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v9[6], "totalDurationMS_HH2");
      v13 = 138543618;
      v14 = v11;
      v15 = 2048;
      v16 = v12;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Total duration for HH2: %llu", (uint8_t *)&v13, 0x16u);

    }
    objc_autoreleasePoolPop(v8);
  }
}

- (void)_markMetricDispatcherSubmission
{
  uint64_t (**Property)(void);
  uint64_t v4;

  if (a1)
  {
    Property = (uint64_t (**)(void))objc_getProperty(a1, a2, 24, 1);
    v4 = Property[2]();
    -[HMDCurrentAccessorySetupMetricDispatcher _logWithoutStatesWithPrefix:stage:time:](a1, CFSTR("End stage"), CFSTR("Setup In HH2"), v4);
  }
}

- (void)_logWithoutStatesWithPrefix:(void *)a3 stage:(uint64_t)a4 time:
{
  id v7;
  id v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  id v17;
  __int16 v18;
  id v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  v9 = (void *)MEMORY[0x227676638]();
  v10 = a1;
  HMFGetOSLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    HMFBooleanToString();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138544386;
    v15 = v12;
    v16 = 2112;
    v17 = v7;
    v18 = 2112;
    v19 = v8;
    v20 = 2048;
    v21 = a4;
    v22 = 2112;
    v23 = v13;
    _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_INFO, "%{public}@%@: %@, time: %llu, HH2 mode: %@.", (uint8_t *)&v14, 0x34u);

  }
  objc_autoreleasePoolPop(v9);

}

- (void)_shouldEndStage:(void *)a3 error:
{
  id v5;
  id v6;
  void *v7;
  id *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  __int16 v20;
  id v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 8));
  if (v6)
  {
    v7 = (void *)MEMORY[0x227676638]();
    v8 = (id *)(id)a1;
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138543874;
      v19 = v10;
      v20 = 2112;
      v21 = v6;
      v22 = 2112;
      v23 = v5;
      _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@Save error %@ for stage %@", (uint8_t *)&v18, 0x20u);

    }
    objc_autoreleasePoolPop(v7);
    v11 = (void *)objc_msgSend(v6, "copy");
    objc_msgSend(v8[8], "setObject:forKeyedSubscript:", v11, v5);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 64), "objectForKeyedSubscript:", v5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      v13 = (void *)MEMORY[0x227676638]();
      v14 = (id *)(id)a1;
      HMFGetOSLogHandle();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14[8], "objectForKeyedSubscript:", v5);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = 138543874;
        v19 = v16;
        v20 = 2112;
        v21 = v5;
        v22 = 2112;
        v23 = v17;
        _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_INFO, "%{public}@Clear stage %@ with previously saved error %@", (uint8_t *)&v18, 0x20u);

      }
      objc_autoreleasePoolPop(v13);
      objc_msgSend(v14[8], "removeObjectForKey:", v5);
    }
  }

}

- (void)_handleErrorAndSaveStage:(uint64_t)a3 stageTime:(void *)a4 stageString:(void *)a5 error:
{
  id v8;
  id v9;
  id WeakRetained;
  __CFString *v11;
  __CFString *v12;
  __CFString *v13;
  id v14;
  id v15;
  NSObject *v16;
  void *v17;
  __CFString *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  __CFString *v26;
  id v27;
  uint64_t v28;
  void *v29;
  id *v30;
  NSObject *v31;
  void *v32;
  __CFString *v33;
  uint64_t v34;
  __CFString *v35;
  BOOL v36;
  const __CFString *v37;
  __CFString *v38;
  const char *v39;
  void *v40;
  void *v41;
  id *v42;
  NSObject *v43;
  void *v44;
  void *v45;
  SEL v46;
  id v47;
  SEL v48;
  __CFString *v49;
  void *context;
  int v52;
  id v53;
  id v54;
  uint8_t buf[4];
  void *v56;
  __int16 v57;
  __CFString *v58;
  __int16 v59;
  __CFString *v60;
  __int16 v61;
  uint64_t v62;
  __int16 v63;
  void *v64;
  __int16 v65;
  id v66;
  __int16 v67;
  void *v68;
  __int16 v69;
  void *v70;
  __int16 v71;
  void *v72;
  __int16 v73;
  void *v74;
  uint64_t v75;

  v75 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  v9 = a5;
  os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 8));
  if (v9)
  {
    objc_msgSend(*(id *)(a1 + 48), "setError:", v9);
    objc_msgSend(*(id *)(a1 + 48), "setErrorStage_String:", v8);
LABEL_4:
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 16));
    goto LABEL_5;
  }
  if (a1)
    goto LABEL_4;
  WeakRetained = 0;
LABEL_5:
  objc_msgSend(*(id *)(a1 + 48), "setNetworkAvailable_INT:", objc_msgSend(WeakRetained, "hasValidNetwork"));
  objc_msgSend(*(id *)(a1 + 48), "setManateeAvailable_INT:", objc_msgSend(WeakRetained, "hasManatee"));
  objc_msgSend(*(id *)(a1 + 48), "setICloudAvailable_INT:", objc_msgSend(WeakRetained, "isSignedIntoiCloud"));
  objc_msgSend(*(id *)(a1 + 48), "setIDSAvailable_INT:", objc_msgSend(WeakRetained, "isIdsServiceActive"));
  objc_msgSend(*(id *)(a1 + 48), "setIDSRegistrationStatus_INT:", objc_msgSend(WeakRetained, "IDSAccountRegistrationStatus"));
  v54 = WeakRetained;
  objc_msgSend(*(id *)(a1 + 48), "setIDSRegistrationError_INT:", objc_msgSend(WeakRetained, "IDSAccountRegistrationError"));
  v52 = a2;
  if (a2)
    v11 = CFSTR("End stage");
  else
    v11 = CFSTR("Begin stage");
  objc_msgSend(*(id *)(a1 + 48), "networkAvailable_INT");
  objc_msgSend(*(id *)(a1 + 48), "manateeAvailable_INT");
  objc_msgSend(*(id *)(a1 + 48), "iCloudAvailable_INT");
  objc_msgSend(*(id *)(a1 + 48), "IDSAvailable_INT");
  v12 = v11;
  v13 = (__CFString *)v8;
  v14 = v9;
  context = (void *)MEMORY[0x227676638]();
  v15 = (id)a1;
  HMFGetOSLogHandle();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v49 = v12;
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    HMFBooleanToString();
    v18 = v13;
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    HMFBooleanToString();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    HMFBooleanToString();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    HMFBooleanToString();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    HMFBooleanToString();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138545666;
    v56 = v17;
    v57 = 2112;
    v58 = v49;
    v59 = 2112;
    v60 = v18;
    v61 = 2048;
    v62 = a3;
    v63 = 2112;
    v64 = v19;
    v65 = 2112;
    v66 = v14;
    v67 = 2112;
    v68 = v20;
    v69 = 2112;
    v70 = v21;
    v71 = 2112;
    v72 = v22;
    v73 = 2112;
    v74 = v23;
    _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_INFO, "%{public}@%@: %@, time: %llu, HH2 mode: %@, error: %@. Current state info - Network: %@, Manatee: %@, iCloud: %@, IDS: %@.", buf, 0x66u);

    v13 = v18;
    v12 = v49;
  }

  objc_autoreleasePoolPop(context);
  v24 = v54;
  v25 = v14;
  if (v52)
  {
    v26 = v13;
    if ((objc_msgSend(v15, "allStagesSubmitted") & 1) != 0
      || (os_unfair_lock_assert_owner((const os_unfair_lock *)v15 + 2),
          objc_msgSend(*((id *)v15 + 6), "sessionSetupOpenMS_HH1") < 1)
      || objc_msgSend(*((id *)v15 + 6), "controllerKeyExchangeMS_HH1") < 1
      || objc_msgSend(*((id *)v15 + 6), "newAccessoryTransferMS_HH1") < 1
      || objc_msgSend(*((id *)v15 + 6), "sessionSetupCloseMS_HH1") < 1
      || objc_msgSend(*((id *)v15 + 6), "accessoryAddMS_HH2") < 1
      || objc_msgSend(*((id *)v15 + 6), "settingsCreationMS_HH2") < 1
      || objc_msgSend(*((id *)v15 + 6), "pairingIdentityCreationMS_HH2") < 1
      || objc_msgSend(*((id *)v15 + 6), "siriReadyMS_HH2") < 1
      || objc_msgSend(*((id *)v15 + 6), "accountSettleWaitMS_HH2") < 1
      || objc_msgSend(*((id *)v15 + 6), "currentDeviceIDSWaitMS_HH2") < 1
      || objc_msgSend(*((id *)v15 + 6), "homeManagerReadyMS_HH2") < 1
      || objc_msgSend(*((id *)v15 + 6), "firstCoreDataImportMS_HH2") < 1
      || objc_msgSend(*((id *)v15 + 6), "eventRouterServerConnectionMS_HH2") < 1
      || objc_msgSend(*((id *)v15 + 6), "primaryResidentElectionMS_HH2") < 1
      || objc_msgSend(*((id *)v15 + 6), "eventRouterFirstEventPushMS_HH2") < 1)
    {
LABEL_42:
      v45 = (void *)objc_opt_class();
      v47 = objc_getProperty(v15, v46, 56, 1);
      objc_msgSend(v45, "saveSetupLogEventIntoUserDefaults:setupLogEvent:", v47, objc_getProperty(v15, v48, 48, 1));

      v13 = v26;
      goto LABEL_43;
    }
    -[HMDCurrentAccessorySetupMetricDispatcher _recordTotalDuration]((uint64_t)v15);
    v27 = objc_loadWeakRetained((id *)v15 + 4);
    objc_msgSend(v27, "submitLogEvent:error:", *((_QWORD *)v15 + 6), v14);

    v28 = objc_msgSend(*((id *)v15 + 6), "setSavedEventState:", 3);
    *((_BYTE *)v15 + 12) = 1;
    v29 = (void *)MEMORY[0x227676638](v28);
    v53 = v15;
    v30 = (id *)v15;
    HMFGetOSLogHandle();
    v31 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
    {
LABEL_39:

      objc_autoreleasePoolPop(v29);
      -[HMDCurrentAccessorySetupMetricDispatcher _markMetricDispatcherSubmission](v30, v39);
      objc_msgSend(v30, "submissionTimer");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "suspend");

      v41 = (void *)MEMORY[0x227676638](objc_msgSend(v30, "setSubmissionTimer:", 0));
      v42 = v30;
      HMFGetOSLogHandle();
      v43 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v56 = v44;
        _os_log_impl(&dword_2218F0000, v43, OS_LOG_TYPE_INFO, "%{public}@Log event submitted for all stages, removing the metric dispatcher", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v41);
      objc_msgSend(v24, "removeCurrentAccessorySetupMetricDispatcherIfNeeded");
      v15 = v53;
      goto LABEL_42;
    }
    HMFGetLogIdentifier();
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30[6], "coreAnalyticsEventDictionary");
    v33 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend(v30[6], "savedEventState");
    v35 = CFSTR("HH1Initial");
    if (v34 > 2)
    {
      if (v34 != 3)
      {
        v36 = v34 == 0x10000;
        v37 = CFSTR("Unknown");
LABEL_33:
        if (v36)
          v35 = (__CFString *)v37;
        goto LABEL_38;
      }
      v35 = CFSTR("Submitted");
    }
    else
    {
      if (v34 != 1)
      {
        v36 = v34 == 2;
        v37 = CFSTR("HH2Initial");
        goto LABEL_33;
      }
      v35 = CFSTR("HH2SentinelFetched");
    }
LABEL_38:
    v38 = v35;
    *(_DWORD *)buf = 138543874;
    v56 = v32;
    v57 = 2112;
    v58 = v33;
    v59 = 2112;
    v60 = v38;
    _os_log_impl(&dword_2218F0000, v31, OS_LOG_TYPE_INFO, "%{public}@All stages completed and submitted the event: %@ final state: %@", buf, 0x20u);

    v24 = v54;
    goto LABEL_39;
  }
LABEL_43:

}

id __95__HMDCurrentAccessorySetupMetricDispatcher_initWithDataSource_setupLogEvent_logEventSubmitter___block_invoke_2()
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x24BE3F298]), "initWithTimeInterval:options:", 8, 900.0);
}

__uint64_t __95__HMDCurrentAccessorySetupMetricDispatcher_initWithDataSource_setupLogEvent_logEventSubmitter___block_invoke()
{
  return clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW) / 0xF4240;
}

+ (id)readLastAccessorySetupInfo:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "dataForKey:", CFSTR("accessorysetup.latencylogevent"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD7380]), "initWithData:", v3);
  else
    v4 = 0;

  return v4;
}

+ (void)removeLastAccessorySetupInfoFromUserDefaults:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x227676638]();
  v6 = a1;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543362;
    v10 = v8;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Removing last accessory setup info", (uint8_t *)&v9, 0xCu);

  }
  objc_autoreleasePoolPop(v5);
  objc_msgSend(v4, "removeObjectForKey:", CFSTR("accessorysetup.latencylogevent"));

}

+ (id)homepodSetupLogEventFromProtoSetupInfo:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  HMDHomePodSetupLatencyLogEvent *v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  BOOL v23;
  uint64_t v24;
  int v25;
  unsigned int v26;
  unsigned int v27;
  uint64_t v28;
  int v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  BOOL v36;
  BOOL v37;
  BOOL v38;
  BOOL v39;
  BOOL v40;
  BOOL v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  HMDHomePodSetupLatencyLogEvent *v60;

  v3 = a3;
  v60 = [HMDHomePodSetupLatencyLogEvent alloc];
  v59 = objc_msgSend(v3, "sessionSetupOpenMSHH1");
  v58 = objc_msgSend(v3, "controllerKeyExchangeMSHH1");
  v57 = objc_msgSend(v3, "newAccessoryTransferMSHH1");
  v56 = objc_msgSend(v3, "sessionSetupCloseMSHH1");
  v55 = objc_msgSend(v3, "sentinelZoneFetchMSHH1");
  v54 = objc_msgSend(v3, "totalDurationMSHH1");
  v53 = objc_msgSend(v3, "accountSettleWaitMSHH2");
  v52 = objc_msgSend(v3, "currentDeviceIDSWaitMSHH2");
  v51 = objc_msgSend(v3, "homeManagerReadyMSHH2");
  v50 = objc_msgSend(v3, "firstCoreDataImportMSHH2");
  v49 = objc_msgSend(v3, "accessoryAddMSHH2");
  v48 = objc_msgSend(v3, "settingsCreationMSHH2");
  v47 = objc_msgSend(v3, "pairingIdentityCreationMSHH2");
  v46 = objc_msgSend(v3, "siriReadyMSHH2");
  v45 = objc_msgSend(v3, "eventRouterServerConnectionMSHH2");
  v44 = objc_msgSend(v3, "primaryResidentElectionMSHH2");
  v43 = objc_msgSend(v3, "eventRouterFirstEventPushMSHH2");
  v42 = objc_msgSend(v3, "totalDurationMSHH2");
  v41 = objc_msgSend(v3, "iCloudAvailableINT") == 1;
  v40 = objc_msgSend(v3, "iDSAvailableINT") == 1;
  v39 = objc_msgSend(v3, "manateeAvailableINT") == 1;
  v38 = objc_msgSend(v3, "networkAvailableINT") == 1;
  v37 = objc_msgSend(v3, "lastKnownControllerHH2Mode") == 2;
  v36 = objc_msgSend(v3, "lastKnownControllerSentinelZoneExistence") == 1;
  v35 = objc_msgSend(v3, "lastKnownStageErrorCode");
  objc_msgSend(v3, "lastKnownStageErrorDomain");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend(v3, "lastKnownStageUnderlyingErrorCode");
  objc_msgSend(v3, "lastKnownStageUnderlyingErrorDomain");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lastKnownStageErrorString");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "controllerSetupSessionIdentifier");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v3, "numberOfTimesPrimaryResidentChangedHH2");
  v28 = objc_msgSend(v3, "lastPrimaryClientConnectedTimeHH2");
  v27 = objc_msgSend(v3, "numberOfTimesPrimaryClientConnectedHH2");
  v26 = objc_msgSend(v3, "numberOfTimesPrimaryClientDisconnectedHH2");
  v25 = objc_msgSend(v3, "numberOfTimesPrimaryClientConnectMessageFailedHH2");
  v23 = objc_msgSend(v3, "currentDeviceConfirmedPrimaryResidentINT") == 1;
  v24 = objc_msgSend(v3, "lastPrimaryClientConnectMessageFailErrorCodeHH2");
  objc_msgSend(v3, "lastPrimaryClientConnectMessageFailErrorDomainHH2");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v3, "lastPrimaryClientConnectMessageFailUnderlyingErrorCodeHH2");
  objc_msgSend(v3, "lastPrimaryClientConnectMessageFailUnderlyingErrorDomainHH2");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v3, "primaryResidentElectionPeerDeviceFutureResolvedMSHH2");
  v18 = objc_msgSend(v3, "primaryResidentElectionFirstCloudKitImportFutureResolvedMSHH2");
  v4 = objc_msgSend(v3, "primaryResidentElectionModernTransportStartedFutureResolvedMSHH2");
  v5 = objc_msgSend(v3, "primaryResidentSelectionConnectedToStatusKitFutureResolvedMSHH2");
  v6 = objc_msgSend(v3, "primaryResidentElectionJoinMeshMSHH2");
  v7 = objc_msgSend(v3, "firstCoreDataContainerSetupDurationMSHH2");
  v8 = objc_msgSend(v3, "firstCoreDataContainerSetupErrorCodeHH2");
  objc_msgSend(v3, "firstCoreDataContainerSetupErrorDomainHH2");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v3, "firstCoreDataContainerSetupUnderlyingErrorCodeHH2");
  objc_msgSend(v3, "firstCoreDataContainerSetupUnderlyingErrorDomainHH2");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v3, "savedEventState");

  BYTE4(v17) = v23;
  LODWORD(v17) = v25;
  LODWORD(v16) = v29;
  BYTE5(v15) = v36;
  BYTE4(v15) = v37;
  BYTE3(v15) = v38;
  BYTE2(v15) = v39;
  BYTE1(v15) = v40;
  LOBYTE(v15) = v41;
  v13 = -[HMDHomePodSetupLatencyLogEvent initWithSessionSetupOpenMS_HH1:controllerKeyExchangeMS_HH1:newAccessoryTransferMS_HH1:sessionSetupCloseMS_HH1:sentinelZoneFetchMS_HH1:totalDurationMS_HH1:accountSettleWaitMS_HH2:currentDeviceIDSWaitMS_HH2:homeManagerReadyMS_HH2:firstCoreDataImportMS_HH2:accessoryAddMS_HH2:settingsCreationMS_HH2:pairingIdentityCreationMS_HH2:siriReadyMS_HH2:eventRouterServerConnectionMS_HH2:primaryResidentElectionMS_HH2:eventRouterFirstEventPushMS_HH2:totalDurationMS_HH2:iCloudAvailable_INT:IDSAvailable_INT:manateeAvailable_INT:networkAvailable_INT:controllerInHH2_INT:controllerHasSentinelZone_INT:errorCode:errorDomain:underlyingErrorCode:underlyingErrorDomain:errorStage_String:setupSessionIdentifier:numberOfTimesPrimaryResidentChanged_HH2:lastPrimaryClientConnectedTime_HH2:numberOfTimesPrimaryClientConnected_HH2:numberOfTimesPrimaryClientDisconnected_HH2:numberOfTimesPrimaryClientConnectMessageFailed_HH2:currentDeviceConfirmedPrimaryResident_INT:lastPrimaryClientConnectMessageFailErrorCode_HH2:lastPrimaryClientConnectMessageFailErrorDomain_HH2:lastPrimaryClientConnectMessageFailUnderlyingErrorCode_HH2:lastPrimaryClientConnectMessageFailUnderlyingErrorDomain_HH2:primaryResidentElectionPeerDeviceFutureResolvedMS_HH2:primaryResidentElectionFirstCloudKitImportFutureResolvedMS_HH2:primaryResidentElectionModernTransportStartedFutureResolvedMS_HH2:primaryResidentSelectionConnectedToStatusKitFutureResolvedMS_HH2:primaryResidentElectionJoinMeshMS_HH2:firstCoreDataContainerSetupDurationMS_HH2:firstCoreDataContainerSetupErrorCode_HH2:firstCoreDataContainerSetupErrorDomain_HH2:firstCoreDataContainerSetupUnderlyingErrorCode_HH2:firstCoreDataContainerSetupUnderlyingErrorDomain_HH2:savedEventState:](v60, "initWithSessionSetupOpenMS_HH1:controllerKeyExchangeMS_HH1:newAccessoryTransferMS_HH1:sessionSetupCloseMS_HH1:sentinelZoneFetchMS_HH1:totalDurationMS_HH1:accountSettleWaitMS_HH2:currentDeviceIDSWaitMS_HH2:homeManagerReadyMS_HH2:firstCoreDataImportMS_HH2:accessoryAddMS_HH2:settingsCreationMS_HH2:pairingIdentityCreationMS_HH2:siriReadyMS_HH2:eventRouterServerConnectionMS_HH2:primaryResidentElectionMS_HH2:eventRouterFirstEventPushMS_HH2:totalDurationMS_HH2:iCloudAvailable_INT:IDSAvailable_INT:manateeAvailable_INT:networkAvailable_INT:controllerInHH2_INT:controllerHasSentinelZone_INT:errorCode:errorDomain:underlyingErrorCode:underlyingErrorDomain:errorStage_String:setupSessionIdentifier:numberOfTimesPrimaryResidentChanged_HH2:lastPrimaryClientConnectedTime_HH2:numberOfTimesPrimaryClientConnected_HH2:numberOfTimesPrimaryClientDisconnected_HH2:numberOfTimesPrimaryClientConnectMessageFailed_HH2:currentDeviceConfirmedPrimaryResident_INT:lastPrimaryClientConnectMessageFailErrorCode_HH2:lastPrimaryClientConnectMessageFailErrorDomain_HH2:lastPrimaryClientConnectMessageFailUnderlyingErrorCode_HH2:lastPrimaryClientConnectMessageFailUnderlyingErrorDomain_HH2:primaryResidentElectionPeerDeviceFutureResolvedMS_HH2:primaryResidentElectionFirstCloudKitImportFutureResolvedMS_HH2:primaryResidentElectionModernTransportStartedFutureResolvedMS_HH2:primaryResidentSelectionConnectedToStatusKitFutureResolvedMS_HH2:primaryResidentElectionJoinMeshMS_HH2:firstCoreDataContainerSetupDurationMS_HH2:firstCoreDataContainerSetupErrorCode_HH2:firstCoreDataContainerSetupErrorDomain_HH2:firstCoreDataContainerSetupUnderlyingErrorCode_HH2:firstCoreDataContainerSetupUnderlyingErrorDomain_HH2:savedEventState:", v59, v58,
          v57,
          v56,
          v55,
          v54,
          v53,
          v52,
          v51,
          v50,
          v49,
          v48,
          v47,
          v46,
          v45,
          v44,
          v43,
          v42,
          v15,
          v35,
          v34,
          v33,
          v32,
          v31,
          v30,
          v16,
          v28,
          __PAIR64__(v26, v27),
          v17,
          v24,
          v22,
          v21,
          v20,
          v19,
          v18,
          v4,
          v5,
          v6,
          v7,
          v8,
          v9,
          v10,
          v11,
          v12);

  return v13;
}

+ (id)readSetupLogEventFromUserDefaults:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(a1, "readLastAccessorySetupInfo:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(a1, "homepodSetupLogEventFromProtoSetupInfo:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)MEMORY[0x227676638]();
    v8 = a1;
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543362;
      v13 = v10;
      _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@Loaded setup log event", (uint8_t *)&v12, 0xCu);

    }
    objc_autoreleasePoolPop(v7);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (void)saveSetupLogEventIntoUserDefaults:(id)a3 setupLogEvent:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  NSObject *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  int v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(MEMORY[0x24BDD7380]);
  objc_msgSend(v7, "error");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");

  objc_msgSend(v8, "setSessionSetupOpenMSHH1:", objc_msgSend(v7, "sessionSetupOpenMS_HH1"));
  objc_msgSend(v8, "setControllerKeyExchangeMSHH1:", objc_msgSend(v7, "controllerKeyExchangeMS_HH1"));
  objc_msgSend(v8, "setNewAccessoryTransferMSHH1:", objc_msgSend(v7, "newAccessoryTransferMS_HH1"));
  objc_msgSend(v8, "setSessionSetupCloseMSHH1:", objc_msgSend(v7, "sessionSetupCloseMS_HH1"));
  objc_msgSend(v8, "setTotalDurationMSHH1:", objc_msgSend(v7, "totalDurationMS_HH1"));
  objc_msgSend(v8, "setSentinelZoneFetchMSHH1:", objc_msgSend(v7, "sentinelZoneFetchMS_HH1"));
  objc_msgSend(v8, "setAccountSettleWaitMSHH2:", objc_msgSend(v7, "accountSettleWaitMS_HH2"));
  objc_msgSend(v8, "setCurrentDeviceIDSWaitMSHH2:", objc_msgSend(v7, "currentDeviceIDSWaitMS_HH2"));
  objc_msgSend(v8, "setHomeManagerReadyMSHH2:", objc_msgSend(v7, "homeManagerReadyMS_HH2"));
  objc_msgSend(v8, "setFirstCoreDataImportMSHH2:", objc_msgSend(v7, "firstCoreDataImportMS_HH2"));
  objc_msgSend(v8, "setAccessoryAddMSHH2:", objc_msgSend(v7, "accessoryAddMS_HH2"));
  objc_msgSend(v8, "setSettingsCreationMSHH2:", objc_msgSend(v7, "settingsCreationMS_HH2"));
  objc_msgSend(v8, "setPairingIdentityCreationMSHH2:", objc_msgSend(v7, "pairingIdentityCreationMS_HH2"));
  objc_msgSend(v8, "setSiriReadyMSHH2:", objc_msgSend(v7, "siriReadyMS_HH2"));
  objc_msgSend(v8, "setEventRouterServerConnectionMSHH2:", objc_msgSend(v7, "eventRouterServerConnectionMS_HH2"));
  objc_msgSend(v8, "setPrimaryResidentElectionMSHH2:", objc_msgSend(v7, "primaryResidentElectionMS_HH2"));
  objc_msgSend(v8, "setEventRouterFirstEventPushMSHH2:", objc_msgSend(v7, "eventRouterFirstEventPushMS_HH2"));
  objc_msgSend(v8, "setTotalDurationMSHH2:", objc_msgSend(v7, "totalDurationMS_HH2"));
  objc_msgSend(v8, "setICloudAvailableINT:", objc_msgSend(v7, "iCloudAvailable_INT"));
  objc_msgSend(v8, "setIDSAvailableINT:", objc_msgSend(v7, "IDSAvailable_INT"));
  objc_msgSend(v8, "setManateeAvailableINT:", objc_msgSend(v7, "manateeAvailable_INT"));
  objc_msgSend(v8, "setNetworkAvailableINT:", objc_msgSend(v7, "networkAvailable_INT"));
  if (objc_msgSend(v7, "controllerInHH2_INT"))
    v11 = 2;
  else
    v11 = 1;
  objc_msgSend(v8, "setLastKnownControllerHH2Mode:", v11);
  objc_msgSend(v8, "setLastKnownControllerSentinelZoneExistence:", objc_msgSend(v7, "controllerHasSentinelZone_INT"));
  if (v10)
  {
    objc_msgSend(v8, "setLastKnownStageErrorCode:", objc_msgSend(v10, "code"));
    objc_msgSend(v10, "domain");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setLastKnownStageErrorDomain:", v12);

    objc_msgSend(v10, "underlyingErrors");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "firstObject");
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = (void *)v14;
    if (v14)
      v16 = (void *)v14;
    else
      v16 = v10;
    v17 = v16;

    objc_msgSend(v8, "setLastKnownStageUnderlyingErrorCode:", objc_msgSend(v17, "code"));
    objc_msgSend(v17, "domain");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "setLastKnownStageUnderlyingErrorDomain:", v18);
  }
  objc_msgSend(v7, "errorStage_String");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setLastKnownStageErrorString:", v19);

  objc_msgSend(v7, "setupSessionIdentifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setControllerSetupSessionIdentifier:", v20);

  objc_msgSend(v8, "setNumberOfTimesPrimaryResidentChangedHH2:", objc_msgSend(v7, "numberOfTimesPrimaryResidentChanged_HH2"));
  objc_msgSend(v8, "setLastPrimaryClientConnectedTimeHH2:", objc_msgSend(v7, "lastPrimaryClientConnectedTime_HH2"));
  objc_msgSend(v8, "setNumberOfTimesPrimaryClientConnectedHH2:", objc_msgSend(v7, "numberOfTimesPrimaryClientConnected_HH2"));
  objc_msgSend(v8, "setNumberOfTimesPrimaryClientDisconnectedHH2:", objc_msgSend(v7, "numberOfTimesPrimaryClientDisconnected_HH2"));
  objc_msgSend(v8, "setNumberOfTimesPrimaryClientConnectMessageFailedHH2:", objc_msgSend(v7, "numberOfTimesPrimaryClientConnectMessageFailed_HH2"));
  objc_msgSend(v8, "setCurrentDeviceConfirmedPrimaryResidentINT:", objc_msgSend(v7, "currentDeviceConfirmedPrimaryResident_INT"));
  objc_msgSend(v8, "setLastPrimaryClientConnectMessageFailErrorCodeHH2:", objc_msgSend(v7, "lastPrimaryClientConnectMessageFailErrorCode_HH2"));
  objc_msgSend(v7, "lastPrimaryClientConnectMessageFailErrorDomain_HH2");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setLastPrimaryClientConnectMessageFailErrorDomainHH2:", v21);

  objc_msgSend(v8, "setLastPrimaryClientConnectMessageFailUnderlyingErrorCodeHH2:", objc_msgSend(v7, "lastPrimaryClientConnectMessageFailUnderlyingErrorCode_HH2"));
  objc_msgSend(v7, "lastPrimaryClientConnectMessageFailUnderlyingErrorDomain_HH2");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setLastPrimaryClientConnectMessageFailUnderlyingErrorDomainHH2:", v22);

  objc_msgSend(v8, "setPrimaryResidentElectionPeerDeviceFutureResolvedMSHH2:", objc_msgSend(v7, "primaryResidentElectionPeerDeviceFutureResolvedMS_HH2"));
  objc_msgSend(v8, "setPrimaryResidentElectionFirstCloudKitImportFutureResolvedMSHH2:", objc_msgSend(v7, "primaryResidentElectionFirstCloudKitImportFutureResolvedMS_HH2"));
  objc_msgSend(v8, "setPrimaryResidentElectionModernTransportStartedFutureResolvedMSHH2:", objc_msgSend(v7, "primaryResidentElectionModernTransportStartedFutureResolvedMS_HH2"));
  objc_msgSend(v8, "setPrimaryResidentSelectionConnectedToStatusKitFutureResolvedMSHH2:", objc_msgSend(v7, "primaryResidentSelectionConnectedToStatusKitFutureResolvedMS_HH2"));
  objc_msgSend(v8, "setPrimaryResidentElectionJoinMeshMSHH2:", objc_msgSend(v7, "primaryResidentElectionJoinMeshMS_HH2"));
  objc_msgSend(v8, "setFirstCoreDataContainerSetupDurationMSHH2:", objc_msgSend(v7, "firstCoreDataContainerSetupDurationMS_HH2"));
  objc_msgSend(v8, "setFirstCoreDataContainerSetupErrorCodeHH2:", objc_msgSend(v7, "firstCoreDataContainerSetupErrorCode_HH2"));
  objc_msgSend(v7, "firstCoreDataContainerSetupErrorDomain_HH2");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setFirstCoreDataContainerSetupErrorDomainHH2:", v23);

  objc_msgSend(v8, "setFirstCoreDataContainerSetupUnderlyingErrorCodeHH2:", objc_msgSend(v7, "firstCoreDataContainerSetupUnderlyingErrorCode_HH2"));
  objc_msgSend(v7, "firstCoreDataContainerSetupUnderlyingErrorDomain_HH2");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setFirstCoreDataContainerSetupUnderlyingErrorDomainHH2:", v24);

  objc_msgSend(v8, "setSavedEventState:", objc_msgSend(v7, "savedEventState"));
  objc_msgSend(v8, "data");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (void *)MEMORY[0x227676638]();
  v27 = a1;
  HMFGetOSLogHandle();
  v28 = objc_claimAutoreleasedReturnValue();
  v29 = v28;
  if (v25)
  {
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = 138543362;
      v33 = v30;
      _os_log_impl(&dword_2218F0000, v29, OS_LOG_TYPE_DEFAULT, "%{public}@Saved HomePod setup latency log event", (uint8_t *)&v32, 0xCu);

    }
    objc_autoreleasePoolPop(v26);
    objc_msgSend(v6, "setObject:forKey:", v25, CFSTR("accessorysetup.latencylogevent"));
  }
  else
  {
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = 138543362;
      v33 = v31;
      _os_log_impl(&dword_2218F0000, v29, OS_LOG_TYPE_ERROR, "%{public}@Error saving setup log event", (uint8_t *)&v32, 0xCu);

    }
    objc_autoreleasePoolPop(v26);
  }

}

+ (id)logCategory
{
  if (logCategory__hmf_once_t71 != -1)
    dispatch_once(&logCategory__hmf_once_t71, &__block_literal_global_54_183514);
  return (id)logCategory__hmf_once_v72;
}

void __55__HMDCurrentAccessorySetupMetricDispatcher_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v72;
  logCategory__hmf_once_v72 = v0;

}

@end
