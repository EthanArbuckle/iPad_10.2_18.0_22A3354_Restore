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
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v26 = objc_claimAutoreleasedReturnValue();
    stageErrorDict = v21->_stageErrorDict;
    v21->_stageErrorDict = (NSMutableDictionary *)v26;

    Property = (uint64_t (**)(void))objc_getProperty(v21, v28, 24, 1);
    v30 = Property[2]();
    -[HMDCurrentAccessorySetupMetricDispatcher _logWithoutStatesWithPrefix:stage:time:](v21, CFSTR("Begin stage"), v30);
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

  v8 = (void *)MEMORY[0x1E0C99EA0];
  v9 = a5;
  v10 = a4;
  v11 = a3;
  objc_msgSend(v8, "standardUserDefaults");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[HMDCurrentAccessorySetupMetricDispatcher initWithDataSource:setupLogEvent:logEventSubmitter:currentUpTicksFactory:submissionTimerFactory:userDefaults:](self, "initWithDataSource:setupLogEvent:logEventSubmitter:currentUpTicksFactory:submissionTimerFactory:userDefaults:", v11, v10, v9, &__block_literal_global_152719, &__block_literal_global_45_152720, v12);

  return v13;
}

- (void)markSetupBeginStage:(unint64_t)a3 error:(id)a4
{
  __CFString *v6;
  void *v7;
  HMDCurrentAccessorySetupMetricDispatcher *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  const __CFString *v12;
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
  int v36;
  uint64_t v37;
  __int16 v38;
  const __CFString *v39;
  __int16 v40;
  __CFString *v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v6 = (__CFString *)a4;
  v7 = (void *)MEMORY[0x1D17BA0A0]();
  v8 = self;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v10;
    if (a3 - 1 > 8)
      v12 = CFSTR("Unknown Setup Stage");
    else
      v12 = off_1E89BAFB0[a3 - 1];
    v36 = 138543874;
    v37 = v10;
    v38 = 2112;
    v39 = v12;
    v40 = 2112;
    v41 = v6;
    _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_DEBUG, "%{public}@Mark begin stage: %@ error: %@", (uint8_t *)&v36, 0x20u);

  }
  objc_autoreleasePoolPop(v7);
  switch(a3)
  {
    case 0uLL:
      v13 = (void *)MEMORY[0x1D17BA0A0]();
      v14 = v8;
      HMFGetOSLogHandle();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = 138543618;
        v37 = (uint64_t)v16;
        v38 = 2112;
        v39 = v6;
        _os_log_impl(&dword_1CD062000, v15, OS_LOG_TYPE_ERROR, "%{public}@Unknown setup stage with error: %@", (uint8_t *)&v36, 0x16u);

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
      goto LABEL_54;
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
      goto LABEL_54;
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
      goto LABEL_54;
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
      goto LABEL_54;
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
      goto LABEL_54;
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
      goto LABEL_54;
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
      goto LABEL_54;
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
      goto LABEL_54;
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
LABEL_54:

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
  uint64_t v10;
  void *v11;
  const __CFString *v12;
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
  int v39;
  uint64_t v40;
  __int16 v41;
  const __CFString *v42;
  __int16 v43;
  __CFString *v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v6 = (__CFString *)a4;
  v7 = (void *)MEMORY[0x1D17BA0A0]();
  v8 = self;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v10;
    if (a3 - 1 > 8)
      v12 = CFSTR("Unknown Setup Stage");
    else
      v12 = off_1E89BAFB0[a3 - 1];
    v39 = 138543874;
    v40 = v10;
    v41 = 2112;
    v42 = v12;
    v43 = 2112;
    v44 = v6;
    _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_DEBUG, "%{public}@Mark end stage: %@ error: %@", (uint8_t *)&v39, 0x20u);

  }
  objc_autoreleasePoolPop(v7);
  switch(a3)
  {
    case 0uLL:
      v13 = (void *)MEMORY[0x1D17BA0A0]();
      v14 = v8;
      HMFGetOSLogHandle();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = 138543618;
        v40 = (uint64_t)v16;
        v41 = 2112;
        v42 = v6;
        _os_log_impl(&dword_1CD062000, v15, OS_LOG_TYPE_ERROR, "%{public}@Unknown setup stage with error: %@", (uint8_t *)&v39, 0x16u);

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
      goto LABEL_81;
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
      goto LABEL_81;
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
      goto LABEL_81;
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
      goto LABEL_81;
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
      goto LABEL_81;
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
      goto LABEL_81;
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
      goto LABEL_81;
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
      goto LABEL_81;
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
          -[HMDCurrentAccessorySetupMetricDispatcher _logWithoutStatesWithPrefix:stage:time:](v8, CFSTR("End stage"), v38);

        }
        os_unfair_lock_unlock(&v8->_lock);
      }
LABEL_81:

      break;
    default:
      break;
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
  id WeakRetained;
  void *v54;
  HMDCurrentAccessorySetupMetricDispatcher *v55;
  NSObject *v56;
  id v57;
  void *v58;
  void *v59;
  SEL v60;
  id v61;
  SEL v62;
  id v63;
  const char *v64;
  void *v65;
  HMDCurrentAccessorySetupMetricDispatcher *v66;
  NSObject *v67;
  void *v68;
  id v69;
  uint8_t buf[4];
  id v71;
  __int16 v72;
  void *v73;
  __int16 v74;
  id v75;
  uint64_t v76;

  v76 = *MEMORY[0x1E0C80C00];
  v69 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  -[HMDCurrentAccessorySetupMetricDispatcher dataSource]((id *)&self->super.super.isa);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCurrentAccessorySetupMetricDispatcher setSubmissionTimer:](self, "setSubmissionTimer:", 0);
  if (-[HMDCurrentAccessorySetupMetricDispatcher allStagesSubmitted](self, "allStagesSubmitted"))
  {
    v6 = (void *)MEMORY[0x1D17BA0A0]();
    v7 = self;
    HMFGetOSLogHandle();
    v8 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v71 = v9;
      _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_INFO, "%{public}@Submission timer fired, but all stages are already submitted.", buf, 0xCu);

    }
LABEL_4:

    objc_autoreleasePoolPop(v6);
    objc_msgSend(v5, "removeCurrentAccessorySetupMetricDispatcherIfNeeded");
    goto LABEL_68;
  }
  if (!self)
  {
LABEL_13:
    v6 = (void *)MEMORY[0x1D17BA0A0]();
    v14 = self;
    HMFGetOSLogHandle();
    v8 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v71 = v15;
      _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_INFO, "%{public}@Not a valid log event and do not submit", buf, 0xCu);

    }
    goto LABEL_4;
  }
  os_unfair_lock_assert_owner(&self->_lock);
  if (-[HMDHomePodSetupLatencyLogEvent sessionSetupOpenMS_HH1](self->_setupLogEvent, "sessionSetupOpenMS_HH1") >= 1
    && -[HMDHomePodSetupLatencyLogEvent sessionSetupCloseMS_HH1](self->_setupLogEvent, "sessionSetupCloseMS_HH1") >= 1
    && (!-[HMDHomePodSetupLatencyLogEvent controllerKeyExchangeMS_HH1](self->_setupLogEvent, "controllerKeyExchangeMS_HH1")|| !-[HMDHomePodSetupLatencyLogEvent newAccessoryTransferMS_HH1](self->_setupLogEvent, "newAccessoryTransferMS_HH1")))
  {
    v10 = (void *)MEMORY[0x1D17BA0A0]();
    v11 = self;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v71 = v13;
      _os_log_impl(&dword_1CD062000, v12, OS_LOG_TYPE_INFO, "%{public}@Do not submit as this appears to be a device repair session.", buf, 0xCu);

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
  -[NSMutableDictionary objectForKeyedSubscript:](self->_stageErrorDict, "objectForKeyedSubscript:", CFSTR("Settings Creation"));
  v33 = objc_claimAutoreleasedReturnValue();
  v34 = (void *)v33;
  if (v33)
    v35 = (void *)v33;
  else
    v35 = v31;
  v36 = v35;

  if (!-[HMDHomePodSetupLatencyLogEvent settingsCreationMS_HH2](self->_setupLogEvent, "settingsCreationMS_HH2")
    || -[HMDHomePodSetupLatencyLogEvent settingsCreationMS_HH2](self->_setupLogEvent, "settingsCreationMS_HH2") == -1)
  {
    -[HMDHomePodSetupLatencyLogEvent setErrorStage_String:](self->_setupLogEvent, "setErrorStage_String:", CFSTR("Settings Creation"));
    v37 = v36;

    v17 = v37;
  }
  -[NSMutableDictionary objectForKeyedSubscript:](self->_stageErrorDict, "objectForKeyedSubscript:", CFSTR("Pairing Identity Creation"));
  v38 = objc_claimAutoreleasedReturnValue();
  v39 = (void *)v38;
  if (v38)
    v40 = (void *)v38;
  else
    v40 = v36;
  v41 = v40;

  if (!-[HMDHomePodSetupLatencyLogEvent pairingIdentityCreationMS_HH2](self->_setupLogEvent, "pairingIdentityCreationMS_HH2")|| -[HMDHomePodSetupLatencyLogEvent pairingIdentityCreationMS_HH2](self->_setupLogEvent, "pairingIdentityCreationMS_HH2") == -1)
  {
    -[HMDHomePodSetupLatencyLogEvent setErrorStage_String:](self->_setupLogEvent, "setErrorStage_String:", CFSTR("Pairing Identity Creation"));
    v42 = v41;

    v17 = v42;
  }
  -[NSMutableDictionary objectForKeyedSubscript:](self->_stageErrorDict, "objectForKeyedSubscript:", CFSTR("Accessory Add"));
  v43 = objc_claimAutoreleasedReturnValue();
  v44 = (void *)v43;
  if (v43)
    v45 = (void *)v43;
  else
    v45 = v41;
  v46 = v45;

  if (!-[HMDHomePodSetupLatencyLogEvent accessoryAddMS_HH2](self->_setupLogEvent, "accessoryAddMS_HH2")
    || -[HMDHomePodSetupLatencyLogEvent accessoryAddMS_HH2](self->_setupLogEvent, "accessoryAddMS_HH2") == -1)
  {
    -[HMDHomePodSetupLatencyLogEvent setErrorStage_String:](self->_setupLogEvent, "setErrorStage_String:", CFSTR("Accessory Add"));
    v47 = v46;

    v17 = v47;
  }
  -[NSMutableDictionary objectForKeyedSubscript:](self->_stageErrorDict, "objectForKeyedSubscript:", CFSTR("Siri Home Automation Ready"));
  v48 = objc_claimAutoreleasedReturnValue();
  v49 = (void *)v48;
  if (v48)
    v50 = (void *)v48;
  else
    v50 = v46;
  v51 = v50;

  if (!-[HMDHomePodSetupLatencyLogEvent siriReadyMS_HH2](self->_setupLogEvent, "siriReadyMS_HH2")
    || -[HMDHomePodSetupLatencyLogEvent siriReadyMS_HH2](self->_setupLogEvent, "siriReadyMS_HH2") == -1)
  {
    -[HMDHomePodSetupLatencyLogEvent setErrorStage_String:](self->_setupLogEvent, "setErrorStage_String:", CFSTR("Siri Home Automation Ready"));
    v52 = v51;

    v17 = v52;
  }

  if (!v17)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 13);
    v17 = (id)objc_claimAutoreleasedReturnValue();
  }
  -[HMDHomePodSetupLatencyLogEvent setSavedEventState:](self->_setupLogEvent, "setSavedEventState:", 3);
  -[HMDCurrentAccessorySetupMetricDispatcher _recordTotalDuration]((uint64_t)self);
  WeakRetained = objc_loadWeakRetained((id *)&self->_logEventSubmitter);
  objc_msgSend(WeakRetained, "submitLogEvent:error:", self->_setupLogEvent, v17);

  v54 = (void *)MEMORY[0x1D17BA0A0]();
  v55 = self;
  HMFGetOSLogHandle();
  v56 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v56, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v57 = (id)objc_claimAutoreleasedReturnValue();
    -[HMDHomePodSetupLatencyLogEvent coreAnalyticsEventDictionary](self->_setupLogEvent, "coreAnalyticsEventDictionary");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v71 = v57;
    v72 = 2112;
    v73 = v58;
    v74 = 2112;
    v75 = v17;
    _os_log_impl(&dword_1CD062000, v56, OS_LOG_TYPE_INFO, "%{public}@Submission timer fired and submitting the final metric log event: %@ with error %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v54);
  v59 = (void *)objc_opt_class();
  v61 = objc_getProperty(v55, v60, 56, 1);
  v63 = objc_getProperty(v55, v62, 48, 1);
  objc_msgSend(v59, "saveSetupLogEventIntoUserDefaults:setupLogEvent:", v61, v63);

  -[HMDCurrentAccessorySetupMetricDispatcher _markMetricDispatcherSubmission](v55, v64);
  v65 = (void *)MEMORY[0x1D17BA0A0]();
  v66 = v55;
  HMFGetOSLogHandle();
  v67 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v67, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v71 = v68;
    _os_log_impl(&dword_1CD062000, v67, OS_LOG_TYPE_INFO, "%{public}@Log event submitted during timeout, removing the metric dispatcher", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v65);
  objc_msgSend(v5, "removeCurrentAccessorySetupMetricDispatcherIfNeeded");

LABEL_68:
  os_unfair_lock_unlock(p_lock);

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

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1D17BA0A0]();
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
    _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_INFO, "%{public}@Setting controller setup session identifier %@ on the log event.", (uint8_t *)&v10, 0x16u);

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

  v17 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 8));
    Property = (uint64_t (**)(void))objc_getProperty((id)a1, v2, 24, 1);
    v4 = Property[2]();
    v5 = *(_QWORD *)(a1 + 80);
    if (v4 <= v5 || v5 == 0)
      v7 = -1;
    else
      v7 = v4 - v5;
    v8 = (void *)MEMORY[0x1D17BA0A0](objc_msgSend(*(id *)(a1 + 48), "setTotalDurationMS_HH1:", v7));
    v9 = (id *)(id)a1;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v9[6], "totalDurationMS_HH1");
      v13 = 138543618;
      v14 = v11;
      v15 = 2048;
      v16 = v12;
      _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_INFO, "%{public}@Total duration for HH1: %llu", (uint8_t *)&v13, 0x16u);

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
    -[HMDCurrentAccessorySetupMetricDispatcher _logWithoutStatesWithPrefix:stage:time:](a1, CFSTR("End stage"), v4);
  }
}

- (void)_logWithoutStatesWithPrefix:(void *)a1 stage:(void *)a2 time:(uint64_t)a3
{
  id v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  id v14;
  __int16 v15;
  const __CFString *v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = (void *)MEMORY[0x1D17BA0A0](CFSTR("Setup In HH1"));
  v7 = a1;
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    HMFBooleanToString();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138544386;
    v12 = v9;
    v13 = 2112;
    v14 = v5;
    v15 = 2112;
    v16 = CFSTR("Setup In HH1");
    v17 = 2048;
    v18 = a3;
    v19 = 2112;
    v20 = v10;
    _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_INFO, "%{public}@%@: %@, time: %llu, HH2 mode: %@.", (uint8_t *)&v11, 0x34u);

  }
  objc_autoreleasePoolPop(v6);

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

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 8));
  if (v6)
  {
    v7 = (void *)MEMORY[0x1D17BA0A0]();
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
      _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_INFO, "%{public}@Save error %@ for stage %@", (uint8_t *)&v18, 0x20u);

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
      v13 = (void *)MEMORY[0x1D17BA0A0]();
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
        _os_log_impl(&dword_1CD062000, v15, OS_LOG_TYPE_INFO, "%{public}@Clear stage %@ with previously saved error %@", (uint8_t *)&v18, 0x20u);

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
  __CFString *v25;
  id v26;
  uint64_t v27;
  void *v28;
  id *v29;
  NSObject *v30;
  void *v31;
  __CFString *v32;
  uint64_t v33;
  __CFString *v34;
  BOOL v35;
  const __CFString *v36;
  __CFString *v37;
  const char *v38;
  void *v39;
  void *v40;
  id *v41;
  NSObject *v42;
  void *v43;
  void *v44;
  SEL v45;
  id v46;
  SEL v47;
  __CFString *v48;
  void *context;
  int v51;
  id v52;
  void *v53;
  uint8_t buf[4];
  void *v55;
  __int16 v56;
  __CFString *v57;
  __int16 v58;
  __CFString *v59;
  __int16 v60;
  uint64_t v61;
  __int16 v62;
  void *v63;
  __int16 v64;
  id v65;
  __int16 v66;
  void *v67;
  __int16 v68;
  void *v69;
  __int16 v70;
  void *v71;
  __int16 v72;
  void *v73;
  uint64_t v74;

  v74 = *MEMORY[0x1E0C80C00];
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
  v53 = WeakRetained;
  objc_msgSend(*(id *)(a1 + 48), "setIDSRegistrationError_INT:", objc_msgSend(WeakRetained, "IDSAccountRegistrationError"));
  v51 = a2;
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
  context = (void *)MEMORY[0x1D17BA0A0]();
  v15 = (id)a1;
  HMFGetOSLogHandle();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v48 = v12;
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
    v55 = v17;
    v56 = 2112;
    v57 = v48;
    v58 = 2112;
    v59 = v18;
    v60 = 2048;
    v61 = a3;
    v62 = 2112;
    v63 = v19;
    v64 = 2112;
    v65 = v14;
    v66 = 2112;
    v67 = v20;
    v68 = 2112;
    v69 = v21;
    v70 = 2112;
    v71 = v22;
    v72 = 2112;
    v73 = v23;
    _os_log_impl(&dword_1CD062000, v16, OS_LOG_TYPE_INFO, "%{public}@%@: %@, time: %llu, HH2 mode: %@, error: %@. Current state info - Network: %@, Manatee: %@, iCloud: %@, IDS: %@.", buf, 0x66u);

    v13 = v18;
    v12 = v48;
  }

  objc_autoreleasePoolPop(context);
  v24 = v14;
  if (v51)
  {
    v25 = v13;
    if ((objc_msgSend(v15, "allStagesSubmitted") & 1) != 0
      || (os_unfair_lock_assert_owner((const os_unfair_lock *)v15 + 2),
          objc_msgSend(*((id *)v15 + 6), "sessionSetupOpenMS_HH1") < 1)
      || objc_msgSend(*((id *)v15 + 6), "controllerKeyExchangeMS_HH1") < 1
      || objc_msgSend(*((id *)v15 + 6), "newAccessoryTransferMS_HH1") < 1
      || objc_msgSend(*((id *)v15 + 6), "sessionSetupCloseMS_HH1") < 1
      || objc_msgSend(*((id *)v15 + 6), "accessoryAddMS_HH2") < 1
      || objc_msgSend(*((id *)v15 + 6), "settingsCreationMS_HH2") < 1
      || objc_msgSend(*((id *)v15 + 6), "pairingIdentityCreationMS_HH2") < 1
      || objc_msgSend(*((id *)v15 + 6), "siriReadyMS_HH2") < 1)
    {
LABEL_35:
      v44 = (void *)objc_opt_class();
      v46 = objc_getProperty(v15, v45, 56, 1);
      objc_msgSend(v44, "saveSetupLogEventIntoUserDefaults:setupLogEvent:", v46, objc_getProperty(v15, v47, 48, 1));

      v13 = v25;
      goto LABEL_36;
    }
    -[HMDCurrentAccessorySetupMetricDispatcher _recordTotalDuration]((uint64_t)v15);
    v26 = objc_loadWeakRetained((id *)v15 + 4);
    objc_msgSend(v26, "submitLogEvent:error:", *((_QWORD *)v15 + 6), v14);

    v27 = objc_msgSend(*((id *)v15 + 6), "setSavedEventState:", 3);
    *((_BYTE *)v15 + 12) = 1;
    v28 = (void *)MEMORY[0x1D17BA0A0](v27);
    v52 = v15;
    v29 = (id *)v15;
    HMFGetOSLogHandle();
    v30 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
    {
LABEL_32:

      objc_autoreleasePoolPop(v28);
      -[HMDCurrentAccessorySetupMetricDispatcher _markMetricDispatcherSubmission](v29, v38);
      objc_msgSend(v29, "submissionTimer");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "suspend");

      v40 = (void *)MEMORY[0x1D17BA0A0](objc_msgSend(v29, "setSubmissionTimer:", 0));
      v41 = v29;
      HMFGetOSLogHandle();
      v42 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v55 = v43;
        _os_log_impl(&dword_1CD062000, v42, OS_LOG_TYPE_INFO, "%{public}@Log event submitted for all stages, removing the metric dispatcher", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v40);
      objc_msgSend(v53, "removeCurrentAccessorySetupMetricDispatcherIfNeeded");
      v15 = v52;
      goto LABEL_35;
    }
    HMFGetLogIdentifier();
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29[6], "coreAnalyticsEventDictionary");
    v32 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v29[6], "savedEventState");
    v34 = CFSTR("HH1Initial");
    if (v33 > 2)
    {
      if (v33 != 3)
      {
        v35 = v33 == 0x10000;
        v36 = CFSTR("Unknown");
LABEL_26:
        if (v35)
          v34 = (__CFString *)v36;
        goto LABEL_31;
      }
      v34 = CFSTR("Submitted");
    }
    else
    {
      if (v33 != 1)
      {
        v35 = v33 == 2;
        v36 = CFSTR("HH2Initial");
        goto LABEL_26;
      }
      v34 = CFSTR("HH2SentinelFetched");
    }
LABEL_31:
    v37 = v34;
    *(_DWORD *)buf = 138543874;
    v55 = v31;
    v56 = 2112;
    v57 = v32;
    v58 = 2112;
    v59 = v37;
    _os_log_impl(&dword_1CD062000, v30, OS_LOG_TYPE_INFO, "%{public}@All stages completed and submitted the event: %@ final state: %@", buf, 0x20u);

    goto LABEL_32;
  }
LABEL_36:

}

id __95__HMDCurrentAccessorySetupMetricDispatcher_initWithDataSource_setupLogEvent_logEventSubmitter___block_invoke_2()
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D286C8]), "initWithTimeInterval:options:", 8, 900.0);
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
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBA220]), "initWithData:", v3);
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

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1D17BA0A0]();
  v6 = a1;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543362;
    v10 = v8;
    _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_INFO, "%{public}@Removing last accessory setup info", (uint8_t *)&v9, 0xCu);

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

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(a1, "readLastAccessorySetupInfo:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(a1, "homepodSetupLogEventFromProtoSetupInfo:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)MEMORY[0x1D17BA0A0]();
    v8 = a1;
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543362;
      v13 = v10;
      _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@Loaded setup log event", (uint8_t *)&v12, 0xCu);

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

  v34 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(MEMORY[0x1E0CBA220]);
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
  v26 = (void *)MEMORY[0x1D17BA0A0]();
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
      _os_log_impl(&dword_1CD062000, v29, OS_LOG_TYPE_DEFAULT, "%{public}@Saved HomePod setup latency log event", (uint8_t *)&v32, 0xCu);

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
      _os_log_impl(&dword_1CD062000, v29, OS_LOG_TYPE_ERROR, "%{public}@Error saving setup log event", (uint8_t *)&v32, 0xCu);

    }
    objc_autoreleasePoolPop(v26);
  }

}

+ (id)logCategory
{
  if (logCategory__hmf_once_t42_152734 != -1)
    dispatch_once(&logCategory__hmf_once_t42_152734, &__block_literal_global_54_152735);
  return (id)logCategory__hmf_once_v43_152736;
}

void __55__HMDCurrentAccessorySetupMetricDispatcher_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v43_152736;
  logCategory__hmf_once_v43_152736 = v0;

}

@end
