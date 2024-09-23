@implementation HMDAccessoryFirmwareUpdateSession

- (HMDAccessoryFirmwareUpdateSession)init
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99768];
  v4 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ is unavailable"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v6, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v7);
}

- (HMDAccessoryFirmwareUpdateSession)initWithHAPAccessory:(id)a3 uarpAccessory:(id)a4 accessoryFirmwareUpdateManager:(id)a5 logEventManager:(id)a6
{
  return -[HMDAccessoryFirmwareUpdateSession initWithHAPAccessory:uarpAccessory:accessoryFirmwareUpdateManager:logEventManager:wingman:](self, "initWithHAPAccessory:uarpAccessory:accessoryFirmwareUpdateManager:logEventManager:wingman:", a3, a4, a5, a6, 0);
}

- (HMDAccessoryFirmwareUpdateSession)initWithHAPAccessory:(id)a3 uarpAccessory:(id)a4 accessoryFirmwareUpdateManager:(id)a5 logEventManager:(id)a6 wingman:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  HMDAccessoryFirmwareUpdateSessionWingman *v16;
  HMDAccessoryFirmwareUpdateSession *v17;
  HMDAccessoryFirmwareUpdateSessionWingman *v18;
  uint64_t v19;
  uint64_t v20;
  OS_dispatch_queue *workQueue;
  id registerFailureRetryTimerFactory;
  uint64_t v23;
  HMDAccessoryFirmwareUpdateScheduler *updateScheduler;
  objc_super v26;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = (HMDAccessoryFirmwareUpdateSessionWingman *)a7;
  v26.receiver = self;
  v26.super_class = (Class)HMDAccessoryFirmwareUpdateSession;
  v17 = -[HMDAccessoryFirmwareUpdateSession init](&v26, sel_init);
  if (v17)
  {
    v18 = v16;
    if (!v16)
      v18 = objc_alloc_init(HMDAccessoryFirmwareUpdateSessionWingman);
    objc_storeStrong((id *)&v17->_wingman, v18);
    if (!v16)

    objc_storeWeak((id *)&v17->_hapAccessory, v12);
    objc_storeStrong((id *)&v17->_uarpAccessory, a4);
    objc_storeWeak((id *)&v17->_accessoryFirmwareUpdateManager, v14);
    objc_storeWeak((id *)&v17->_logEventManager, v15);
    if (v16)
      v19 = -[HMDAccessoryFirmwareUpdateSessionWingman initialSessionState](v16, "initialSessionState");
    else
      v19 = 0;
    v17->_internalState = v19;
    v17->_lock._os_unfair_lock_opaque = 0;
    objc_msgSend(v12, "workQueue");
    v20 = objc_claimAutoreleasedReturnValue();
    workQueue = v17->_workQueue;
    v17->_workQueue = (OS_dispatch_queue *)v20;

    v17->_userInitiatedStaging = 0;
    v17->_userInitiatedInstall = 0;
    v17->_sessionEnded = 0;
    v17->_assetOfferedForCurrentDataStream = 0;
    v17->_applyHDSRetryCount = 0;
    v17->_currentAutomaticApplyRetriesCount = 0;
    v17->_currentCommunicationErrorCount = 0;
    v17->_dataStreamOpenInProgress = 0;
    v17->_isVerifyingUpdate = 0;
    v17->_remoteApplyInProgress = 0;
    v17->_matterFirmwareUpdateRetryCount = 0;
    v17->_currentRegisterFailureCount = 0;
    registerFailureRetryTimerFactory = v17->_registerFailureRetryTimerFactory;
    v17->_registerFailureRetryTimerFactory = &__block_literal_global_121253;

    v23 = -[HMDAccessoryFirmwareUpdateSessionWingman newSchedulerWithAccessory:firmwareUpdateSession:workQueue:](v17->_wingman, "newSchedulerWithAccessory:firmwareUpdateSession:workQueue:", v12, v17, v17->_workQueue);
    updateScheduler = v17->_updateScheduler;
    v17->_updateScheduler = (HMDAccessoryFirmwareUpdateScheduler *)v23;

    -[HMDAccessoryFirmwareUpdateScheduler configure](v17->_updateScheduler, "configure");
  }

  return v17;
}

- (void)configure
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  -[HMDAccessoryFirmwareUpdateSession hapAccessory](self, "hapAccessory");
  v18 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "home");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__handleAutomaticUpdateEnabledChanged_, CFSTR("HMDHomeAutomaticThirdPartyUpdateEnabledChangedNotification"), v4);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObserver:selector:name:object:", self, sel_handleAccessoryFirmwareVersionChangedNotification_, CFSTR("HMDAccessoryFirmwareVersionUpdatedNotification"), v18);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObserver:selector:name:object:", self, sel_handleAccessoryFirmwareVersionChangedNotification_, CFSTR("HMDAccessoryFirmwareDisplayableVersionUpdatedNotification"), v18);

  if ((_os_feature_enabled_impl() & 1) != 0
    || CFPreferencesGetAppBooleanValue(CFSTR("MatterOTA"), CFSTR("/Library/Managed Preferences/mobile/com.apple.homed.plist"), 0))
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObserver:selector:name:object:", self, sel_handleAccessoryFirmwareVersionNumberChangedNotification_, CFSTR("HMDAccessoryFirmwareUpdateMatterFirmwareRevisionNumberChangedNotification"), v18);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObserver:selector:name:object:", self, sel_handleAccessoryVIDPIDChangedNotification_, CFSTR("HMDAccessoryVendorIDProductIDUpdatedNotification"), v18);

  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "firmwareUpdateProfile");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObserver:selector:name:object:", self, sel_handleStagedFirmwareVersionChangedNotification_, CFSTR("HMDAccessoryStagedFirmwareVersionChangedNotification"), v10);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "firmwareUpdateProfile");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addObserver:selector:name:object:", self, sel_handleFirmwareUpdateStateChangedNotification_, CFSTR("HMDAccessoryFirmwareUpdateStateChangedNotification"), v12);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "firmwareUpdateProfile");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addObserver:selector:name:object:", self, sel_handleNotReadyReasonsChanged_, CFSTR("HMDAccessoryFirmwareUpdateStagingNotReadyReasonsChangedNotification"), v14);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "firmwareUpdateProfile");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addObserver:selector:name:object:", self, sel_handleNotReadyReasonsChanged_, CFSTR("HMDAccessoryFirmwareUpdateApplyNotReadyReasonsChangedNotification"), v16);

  objc_msgSend(v18, "firmwareUpdateProfile");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "monitorCharacteristics:", 1);

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[HMDDataStreamSocket close](self->_dataStreamSocket, "close");
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)HMDAccessoryFirmwareUpdateSession;
  -[HMDAccessoryFirmwareUpdateSession dealloc](&v4, sel_dealloc);
}

- (unint64_t)internalState
{
  os_unfair_lock_s *p_lock;
  unint64_t internalState;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  internalState = self->_internalState;
  os_unfair_lock_unlock(p_lock);
  return internalState;
}

- (void)setInternalState:(unint64_t)a3
{
  os_unfair_lock_s *p_lock;
  unint64_t internalState;
  void *v7;
  HMDAccessoryFirmwareUpdateSession *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  const __CFString *v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  const __CFString *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  internalState = self->_internalState;
  self->_internalState = a3;
  os_unfair_lock_unlock(p_lock);
  if (internalState != a3)
  {
    v7 = (void *)MEMORY[0x1D17BA0A0]();
    v8 = self;
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = (void *)v10;
      if (a3 - 1 > 4)
        v12 = CFSTR("Up To Date");
      else
        v12 = off_1E89B4FD8[a3 - 1];
      v13 = 138543618;
      v14 = v10;
      v15 = 2112;
      v16 = v12;
      _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@State changed to %@", (uint8_t *)&v13, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
  }
}

- (HMDDataStreamSocket)dataStreamSocket
{
  os_unfair_lock_s *p_lock;
  HMDDataStreamSocket *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_dataStreamSocket;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setDataStreamSocket:(id)a3
{
  HMDDataStreamSocket *v4;
  HMDDataStreamSocket *dataStreamSocket;

  v4 = (HMDDataStreamSocket *)a3;
  os_unfair_lock_lock_with_options();
  dataStreamSocket = self->_dataStreamSocket;
  self->_dataStreamSocket = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (BOOL)sessionEnded
{
  HMDAccessoryFirmwareUpdateSession *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_sessionEnded;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setSessionEnded:(BOOL)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_sessionEnded = a3;
  os_unfair_lock_unlock(p_lock);
}

- (unint64_t)sessionState
{
  unint64_t v2;

  v2 = -[HMDAccessoryFirmwareUpdateSession nextStateToSchedule](self, "nextStateToSchedule");
  if (v2 - 1 > 4)
    return 0;
  else
    return qword_1CDB8F6E8[v2 - 1];
}

- (BOOL)isUserInitiatedStaging
{
  HMDAccessoryFirmwareUpdateSession *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_userInitiatedStaging;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setUserInitiatedStaging:(BOOL)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_userInitiatedStaging = a3;
  os_unfair_lock_unlock(p_lock);
}

- (BOOL)isUserInitiatedInstall
{
  HMDAccessoryFirmwareUpdateSession *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_userInitiatedInstall;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setUserInitiatedInstall:(BOOL)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_userInitiatedInstall = a3;
  os_unfair_lock_unlock(p_lock);
}

- (HMFSoftwareVersion)accessoryVersion
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  HMFSoftwareVersion *v11;

  -[HMDAccessoryFirmwareUpdateSession hapAccessory](self, "hapAccessory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firmwareUpdateProfile");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentVersion");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "firmwareVersion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "supportsCHIP"))
  {
    objc_msgSend(v2, "firmwareUpdateProfile");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "matterFirmwareUpdateProfile");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "matterFirmwareRevisionNumber");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0D286A0]), "initWithMajorVersion:minorVersion:updateVersion:", objc_msgSend(v8, "unsignedLongValue"), 0, 0);
    v5 = (void *)v9;
  }
  if (objc_msgSend(v5, "isGreaterThanVersion:", v4))
    v10 = v5;
  else
    v10 = v4;
  v11 = v10;

  return v11;
}

- (BOOL)startManualUpdate:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  HMDAccessoryFirmwareUpdateSession *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  const char *v22;
  NSObject *v23;
  uint32_t v24;
  void *v25;
  HMDAccessoryFirmwareUpdateSession *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v35;
  NSObject *v36;
  void *v37;
  void *v38;
  HMDAccessoryFirmwareUpdateSession *v39;
  NSObject *v40;
  void *v41;
  const char *v42;
  NSObject *v43;
  os_log_type_t v44;
  int v45;
  void *v46;
  __int16 v47;
  void *v48;
  __int16 v49;
  void *v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[HMDAccessoryFirmwareUpdateSession workQueue](self, "workQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  objc_msgSend(v6, "version");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessoryFirmwareUpdateSession availableSoftwareVersion](self, "availableSoftwareVersion");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "isEqualToVersion:", v9);

  if ((v10 & 1) != 0)
  {
    -[HMDAccessoryFirmwareUpdateSession hapAccessory](self, "hapAccessory");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "firmwareUpdateProfile");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stagedFirmwareVersion");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    -[HMDAccessoryFirmwareUpdateSession availableSoftwareVersion](self, "availableSoftwareVersion");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v13, "isGreaterThanVersion:", v14);

    if (v15)
    {
      if (a4)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 3);
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
      v16 = (void *)MEMORY[0x1D17BA0A0]();
      v17 = self;
      HMFGetOSLogHandle();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDAccessoryFirmwareUpdateSession availableSoftwareVersion](v17, "availableSoftwareVersion");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "shortVersionString");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = 138543874;
        v46 = v19;
        v47 = 2112;
        v48 = v13;
        v49 = 2112;
        v50 = v21;
        v22 = "%{public}@Staged version %@ is different than available version %@";
        v23 = v18;
        v24 = 32;
        goto LABEL_17;
      }
    }
    else
    {
      objc_msgSend(v11, "firmwareUpdateProfile");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = objc_msgSend(v32, "updateNotReadyReasons");

      if (!v33)
      {
        v35 = (void *)MEMORY[0x1D17BA0A0]();
        v17 = self;
        HMFGetOSLogHandle();
        v36 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
        {
          HMFGetLogIdentifier();
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          v45 = 138543362;
          v46 = v37;
          _os_log_impl(&dword_1CD062000, v36, OS_LOG_TYPE_DEFAULT, "%{public}@Starting user-initiated update", (uint8_t *)&v45, 0xCu);

        }
        objc_autoreleasePoolPop(v35);
        -[HMDAccessoryFirmwareUpdateSession _syncStateWithAccessoryOnResume](v17, "_syncStateWithAccessoryOnResume");
        -[HMDAccessoryFirmwareUpdateSession setUserInitiatedInstall:](v17, "setUserInitiatedInstall:", 1);
        switch(-[HMDAccessoryFirmwareUpdateSession internalState](v17, "internalState"))
        {
          case 0uLL:
            v38 = (void *)MEMORY[0x1D17BA0A0]();
            v39 = v17;
            HMFGetOSLogHandle();
            v40 = objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
              goto LABEL_30;
            HMFGetLogIdentifier();
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            v45 = 138543362;
            v46 = v41;
            v42 = "%{public}@Already up to date";
            v43 = v40;
            v44 = OS_LOG_TYPE_ERROR;
            goto LABEL_29;
          case 1uLL:
            goto LABEL_32;
          case 2uLL:
          case 4uLL:
            v38 = (void *)MEMORY[0x1D17BA0A0]();
            v39 = v17;
            HMFGetOSLogHandle();
            v40 = objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
              goto LABEL_30;
            HMFGetLogIdentifier();
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            v45 = 138543362;
            v46 = v41;
            v42 = "%{public}@Already in progress";
            v43 = v40;
            v44 = OS_LOG_TYPE_DEFAULT;
LABEL_29:
            _os_log_impl(&dword_1CD062000, v43, v44, v42, (uint8_t *)&v45, 0xCu);

LABEL_30:
            objc_autoreleasePoolPop(v38);
            goto LABEL_33;
          case 3uLL:
            -[HMDAccessoryFirmwareUpdateSession updateAvailableSoftwareUpdateState:](v17, "updateAvailableSoftwareUpdateState:", 3);
LABEL_32:
            -[HMDAccessoryFirmwareUpdateSession _schedule](v17, "_schedule");
LABEL_33:
            LOBYTE(v17) = 1;
            break;
          case 5uLL:
            v16 = (void *)MEMORY[0x1D17BA0A0]();
            v17 = v17;
            HMFGetOSLogHandle();
            v18 = objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
              goto LABEL_19;
            HMFGetLogIdentifier();
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v45 = 138543362;
            v46 = v19;
            _os_log_impl(&dword_1CD062000, v18, OS_LOG_TYPE_ERROR, "%{public}@Cannot update while registration is in progress", (uint8_t *)&v45, 0xCu);
            goto LABEL_18;
          default:
            goto LABEL_20;
        }
        goto LABEL_20;
      }
      if (a4)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", -1);
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
      v16 = (void *)MEMORY[0x1D17BA0A0]();
      v17 = self;
      HMFGetOSLogHandle();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "firmwareUpdateProfile");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "updateNotReadyReasons");
        HAPUpdateNotReadyReasonsAsString();
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = 138543618;
        v46 = v19;
        v47 = 2114;
        v48 = v21;
        v22 = "%{public}@Update failed due to updateNotReadyReasons: %{public}@";
        v23 = v18;
        v24 = 22;
LABEL_17:
        _os_log_impl(&dword_1CD062000, v23, OS_LOG_TYPE_ERROR, v22, (uint8_t *)&v45, v24);

LABEL_18:
      }
    }
LABEL_19:

    objc_autoreleasePoolPop(v16);
    LOBYTE(v17) = 0;
LABEL_20:

    goto LABEL_21;
  }
  if (a4)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 3);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v25 = (void *)MEMORY[0x1D17BA0A0]();
  v26 = self;
  HMFGetOSLogHandle();
  v17 = (HMDAccessoryFirmwareUpdateSession *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(&v17->super.super, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "version");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "buildVersion");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDAccessoryFirmwareUpdateSession uarpAccessory](v26, "uarpAccessory");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "availableFirmwareVersion");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = 138543874;
    v46 = v27;
    v47 = 2112;
    v48 = v29;
    v49 = 2112;
    v50 = v31;
    _os_log_impl(&dword_1CD062000, &v17->super.super, OS_LOG_TYPE_ERROR, "%{public}@Requested install version %@ is different than available version %@", (uint8_t *)&v45, 0x20u);

  }
  objc_autoreleasePoolPop(v25);
  LOBYTE(v17) = 0;
LABEL_21:

  return v17 & 1;
}

- (id)availableSoftwareVersion
{
  void *v3;
  int v4;
  void *v5;
  void *v6;

  -[HMDAccessoryFirmwareUpdateSession hapAccessory](self, "hapAccessory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "supportsCHIP");

  if (v4)
  {
    -[HMDAccessoryFirmwareUpdateSession assetID](self, "assetID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "softwareVersion");
  }
  else
  {
    -[HMDAccessoryFirmwareUpdateSession uarpAccessory](self, "uarpAccessory");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "availableSoftwareVersion");
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)pause
{
  NSObject *v3;
  void *v4;
  int v5;
  uint64_t v6;
  HMDAccessoryFirmwareUpdateSession *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  uint64_t v13;
  HMDAccessoryFirmwareUpdateSession *v14;
  NSObject *v15;
  void *v16;
  id v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  const char *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  -[HMDAccessoryFirmwareUpdateSession workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[HMDAccessoryFirmwareUpdateSession _logDebugStates:](self, "_logDebugStates:", "-[HMDAccessoryFirmwareUpdateSession pause]");
  if ((_os_feature_enabled_impl() & 1) != 0
    || CFPreferencesGetAppBooleanValue(CFSTR("MatterOTA"), CFSTR("/Library/Managed Preferences/mobile/com.apple.homed.plist"), 0))
  {
    -[HMDAccessoryFirmwareUpdateSession hapAccessory](self, "hapAccessory");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "supportsCHIP");

    if (v5)
    {
      v6 = MEMORY[0x1D17BA0A0]();
      v7 = self;
      HMFGetOSLogHandle();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v19 = v9;
        v20 = 2080;
        v21 = "-[HMDAccessoryFirmwareUpdateSession pause]";
        _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_INFO, "%{public}@%s: called by the controller's scheduler. Only a Matter Accessory can pause a firmware staging/application. No action taken.", buf, 0x16u);

      }
      v10 = (void *)v6;
LABEL_11:
      objc_autoreleasePoolPop(v10);
      return;
    }
  }
  -[HMDAccessoryFirmwareUpdateSession dataStreamSocket](self, "dataStreamSocket");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isClosing");

  if (v12)
  {
    v13 = MEMORY[0x1D17BA0A0]();
    v14 = self;
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v19 = v16;
      _os_log_impl(&dword_1CD062000, v15, OS_LOG_TYPE_INFO, "%{public}@Pause ignored with socket in closing state", buf, 0xCu);

    }
    v10 = (void *)v13;
    goto LABEL_11;
  }
  -[HMDAccessoryFirmwareUpdateSession dataStreamSocket](self, "dataStreamSocket");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "close");

}

- (void)resumeWithState:(unint64_t)a3
{
  NSObject *v5;
  void *v6;
  HMDAccessoryFirmwareUpdateSession *v7;
  NSObject *v8;
  void *v9;
  unint64_t v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  int v18;
  void *v19;
  int v20;
  void *v21;
  HMDAccessoryFirmwareUpdateSession *v22;
  NSObject *v23;
  void *v24;
  const char *v25;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  void *v30;
  uint64_t v31;
  _QWORD v32[5];
  _QWORD v33[6];
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  const __CFString *v37;
  __int16 v38;
  uint64_t v39;
  __int16 v40;
  const __CFString *v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  -[HMDAccessoryFirmwareUpdateSession workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v6 = (void *)MEMORY[0x1D17BA0A0]();
  v7 = self;
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[HMDAccessoryFirmwareUpdateSession internalState](v7, "internalState") - 1;
    if (v10 > 4)
      v11 = CFSTR("Up To Date");
    else
      v11 = off_1E89B4FD8[v10];
    -[HMDAccessoryFirmwareUpdateSession hapAccessory](v7, "hapAccessory");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "firmwareUpdateProfile");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "updateState");
    HAPFirmwareUpdateStateAsString();
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = (void *)v14;
    if (a3 - 1 > 2)
      v16 = CFSTR("Up-To-Date");
    else
      v16 = off_1E89B4FC0[a3 - 1];
    *(_DWORD *)buf = 138544130;
    v35 = v9;
    v36 = 2112;
    v37 = v11;
    v38 = 2112;
    v39 = v14;
    v40 = 2112;
    v41 = v16;
    _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_INFO, "%{public}@Resume called with sessionState: %@ accessoryState %@ resumeState %@", buf, 0x2Au);

  }
  objc_autoreleasePoolPop(v6);
  if ((_os_feature_enabled_impl() & 1) != 0
    || CFPreferencesGetAppBooleanValue(CFSTR("MatterOTA"), CFSTR("/Library/Managed Preferences/mobile/com.apple.homed.plist"), 0))
  {
    -[HMDAccessoryFirmwareUpdateSession hapAccessory](v7, "hapAccessory");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "supportsCHIP");

    if (v18)
    {
      -[HMDAccessoryFirmwareUpdateSession _updateSoftwareUpdateStateForMatterAccessoryWithState:](v7, "_updateSoftwareUpdateStateForMatterAccessoryWithState:", a3);
      return;
    }
  }
  -[HMDAccessoryFirmwareUpdateSession _logDebugStates:](v7, "_logDebugStates:", "-[HMDAccessoryFirmwareUpdateSession resumeWithState:]");
  -[HMDAccessoryFirmwareUpdateSession dataStreamSocket](v7, "dataStreamSocket");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "isClosing");

  if (v20)
  {
    v21 = (void *)MEMORY[0x1D17BA0A0]();
    v22 = v7;
    HMFGetOSLogHandle();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v35 = v24;
      v25 = "%{public}@Resume ignored with socket in closing state";
LABEL_24:
      _os_log_impl(&dword_1CD062000, v23, OS_LOG_TYPE_INFO, v25, buf, 0xCu);

      goto LABEL_25;
    }
    goto LABEL_25;
  }
  if (a3 != 1)
  {
LABEL_21:
    v32[4] = v7;
    v33[0] = MEMORY[0x1E0C809B0];
    v33[1] = 3221225472;
    v33[2] = __53__HMDAccessoryFirmwareUpdateSession_resumeWithState___block_invoke;
    v33[3] = &unk_1E89B4DF0;
    v33[4] = v7;
    v33[5] = a3;
    v32[0] = MEMORY[0x1E0C809B0];
    v32[1] = 3221225472;
    v32[2] = __53__HMDAccessoryFirmwareUpdateSession_resumeWithState___block_invoke_71;
    v32[3] = &unk_1E89C2350;
    -[HMDAccessoryFirmwareUpdateSession _withOpenSocketDoBlock:error:](v7, "_withOpenSocketDoBlock:error:", v33, v32);
    return;
  }
  -[HMDAccessoryFirmwareUpdateSession lastStagedVersion](v7, "lastStagedVersion");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessoryFirmwareUpdateSession assetID](v7, "assetID");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "softwareVersion");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v26, "isEqualToVersion:", v28);

  if (!v29)
  {
    -[HMDAccessoryFirmwareUpdateSession assetID](v7, "assetID");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v30, "downloadStatus");

    if (v31 != 1)
    {
      v21 = (void *)MEMORY[0x1D17BA0A0]();
      v22 = v7;
      HMFGetOSLogHandle();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v35 = v24;
        v25 = "%{public}@Asset not ready to stage";
        goto LABEL_24;
      }
      goto LABEL_25;
    }
    goto LABEL_21;
  }
  v21 = (void *)MEMORY[0x1D17BA0A0](-[HMDAccessoryFirmwareUpdateSession setLastStagedVersion:](v7, "setLastStagedVersion:", 0));
  v22 = v7;
  HMFGetOSLogHandle();
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v35 = v24;
    v25 = "%{public}@Re-stage required. Waiting for asset update availability previously requested on the staged version "
          "change notification";
    goto LABEL_24;
  }
LABEL_25:

  objc_autoreleasePoolPop(v21);
}

- (void)_startSocketIdleTimer
{
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  HMDAccessoryFirmwareUpdateSession *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unsigned int v13;
  double v14;
  void *v15;
  HMDAccessoryFirmwareUpdateSession *v16;
  NSObject *v17;
  void *v18;
  char *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  __int16 v27;
  const char *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  -[HMDAccessoryFirmwareUpdateSession workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  if (((_os_feature_enabled_impl() & 1) != 0
     || CFPreferencesGetAppBooleanValue(CFSTR("MatterOTA"), CFSTR("/Library/Managed Preferences/mobile/com.apple.homed.plist"), 0))&& (-[HMDAccessoryFirmwareUpdateSession hapAccessory](self, "hapAccessory"), v4 = (void *)objc_claimAutoreleasedReturnValue(), v5 = objc_msgSend(v4, "supportsCHIP"), v4, v5))
  {
    v6 = (void *)MEMORY[0x1D17BA0A0]();
    v7 = self;
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 138543618;
      v26 = v9;
      v27 = 2080;
      v28 = "-[HMDAccessoryFirmwareUpdateSession _startSocketIdleTimer]";
      _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_INFO, "%{public}@%s: called to control Matter Accessory. No sockets used with Matter Accessories. No action taken.", (uint8_t *)&v25, 0x16u);

    }
    objc_autoreleasePoolPop(v6);
  }
  else
  {
    if (maxSocketIdleDuration_onceToken != -1)
      dispatch_once(&maxSocketIdleDuration_onceToken, &__block_literal_global_521);
    objc_msgSend(MEMORY[0x1E0D28678], "sharedPreferences");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (isInternalBuild())
    {
      objc_msgSend(v10, "preferenceForKey:", CFSTR("firmwareUpdateMaxSocketIdleDuration"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "numberValue");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "unsignedIntValue");

      v14 = (double)v13;
    }
    else
    {
      v14 = 60.0;
    }

    v15 = (void *)MEMORY[0x1D17BA0A0]();
    v16 = self;
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v14);
      v19 = (char *)objc_claimAutoreleasedReturnValue();
      v25 = 138543618;
      v26 = v18;
      v27 = 2112;
      v28 = v19;
      _os_log_impl(&dword_1CD062000, v17, OS_LOG_TYPE_DEBUG, "%{public}@Start socket idle timer for %@ seconds", (uint8_t *)&v25, 0x16u);

    }
    objc_autoreleasePoolPop(v15);
    v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D286C8]), "initWithTimeInterval:options:", 1, v14);
    -[HMDAccessoryFirmwareUpdateSession setSocketIdleTimer:](v16, "setSocketIdleTimer:", v20);

    -[HMDAccessoryFirmwareUpdateSession socketIdleTimer](v16, "socketIdleTimer");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setDelegate:", v16);

    -[HMDAccessoryFirmwareUpdateSession workQueue](v16, "workQueue");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDAccessoryFirmwareUpdateSession socketIdleTimer](v16, "socketIdleTimer");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setDelegateQueue:", v22);

    -[HMDAccessoryFirmwareUpdateSession socketIdleTimer](v16, "socketIdleTimer");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "resume");

  }
}

- (void)_resetSocketIdleTimer
{
  NSObject *v3;
  void *v4;
  HMDAccessoryFirmwareUpdateSession *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  HMDAccessoryFirmwareUpdateSession *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  const char *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  -[HMDAccessoryFirmwareUpdateSession workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  v4 = (void *)MEMORY[0x1D17BA0A0]();
  v5 = self;
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138543362;
    v16 = v7;
    _os_log_impl(&dword_1CD062000, v6, OS_LOG_TYPE_DEBUG, "%{public}@Reset socket idle timer", (uint8_t *)&v15, 0xCu);

  }
  objc_autoreleasePoolPop(v4);
  if (((_os_feature_enabled_impl() & 1) != 0
     || CFPreferencesGetAppBooleanValue(CFSTR("MatterOTA"), CFSTR("/Library/Managed Preferences/mobile/com.apple.homed.plist"), 0))&& (-[HMDAccessoryFirmwareUpdateSession hapAccessory](v5, "hapAccessory"), v8 = (void *)objc_claimAutoreleasedReturnValue(), v9 = objc_msgSend(v8, "supportsCHIP"), v8, v9))
  {
    v10 = (void *)MEMORY[0x1D17BA0A0]();
    v11 = v5;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543618;
      v16 = v13;
      v17 = 2080;
      v18 = "-[HMDAccessoryFirmwareUpdateSession _resetSocketIdleTimer]";
      _os_log_impl(&dword_1CD062000, v12, OS_LOG_TYPE_INFO, "%{public}@%s: called to control Matter Accessory. No sockets used with Matter Accessories. No action taken.", (uint8_t *)&v15, 0x16u);

    }
    objc_autoreleasePoolPop(v10);
  }
  else
  {
    -[HMDAccessoryFirmwareUpdateSession socketIdleTimer](v5, "socketIdleTimer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "resume");

  }
}

- (void)_cancelSocketIdleTimer
{
  NSObject *v3;
  void *v4;
  HMDAccessoryFirmwareUpdateSession *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  HMDAccessoryFirmwareUpdateSession *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  const char *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  -[HMDAccessoryFirmwareUpdateSession workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  v4 = (void *)MEMORY[0x1D17BA0A0]();
  v5 = self;
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138543362;
    v16 = v7;
    _os_log_impl(&dword_1CD062000, v6, OS_LOG_TYPE_DEBUG, "%{public}@Cancel socket idle timer", (uint8_t *)&v15, 0xCu);

  }
  objc_autoreleasePoolPop(v4);
  if (((_os_feature_enabled_impl() & 1) != 0
     || CFPreferencesGetAppBooleanValue(CFSTR("MatterOTA"), CFSTR("/Library/Managed Preferences/mobile/com.apple.homed.plist"), 0))&& (-[HMDAccessoryFirmwareUpdateSession hapAccessory](v5, "hapAccessory"), v8 = (void *)objc_claimAutoreleasedReturnValue(), v9 = objc_msgSend(v8, "supportsCHIP"), v8, v9))
  {
    v10 = (void *)MEMORY[0x1D17BA0A0]();
    v11 = v5;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543618;
      v16 = v13;
      v17 = 2080;
      v18 = "-[HMDAccessoryFirmwareUpdateSession _cancelSocketIdleTimer]";
      _os_log_impl(&dword_1CD062000, v12, OS_LOG_TYPE_INFO, "%{public}@%s: called to control Matter Accessory. No sockets used with Matter Accessories. No action taken.", (uint8_t *)&v15, 0x16u);

    }
    objc_autoreleasePoolPop(v10);
  }
  else
  {
    -[HMDAccessoryFirmwareUpdateSession socketIdleTimer](v5, "socketIdleTimer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "suspend");

    -[HMDAccessoryFirmwareUpdateSession setSocketIdleTimer:](v5, "setSocketIdleTimer:", 0);
  }
}

- (void)_handleSocketTimeout
{
  NSObject *v3;
  void *v4;
  HMDAccessoryFirmwareUpdateSession *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  HMDAccessoryFirmwareUpdateSession *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[HMDAccessoryFirmwareUpdateSession workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  v4 = (void *)MEMORY[0x1D17BA0A0]();
  v5 = self;
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138543362;
    v15 = v7;
    _os_log_impl(&dword_1CD062000, v6, OS_LOG_TYPE_DEBUG, "%{public}@Socket idle timeout", (uint8_t *)&v14, 0xCu);

  }
  objc_autoreleasePoolPop(v4);
  if ((_os_feature_enabled_impl() & 1) != 0
    || CFPreferencesGetAppBooleanValue(CFSTR("MatterOTA"), CFSTR("/Library/Managed Preferences/mobile/com.apple.homed.plist"), 0))
  {
    -[HMDAccessoryFirmwareUpdateSession hapAccessory](v5, "hapAccessory");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v8, "supportsCHIP") & 1) != 0)
    {
      v9 = (void *)MEMORY[0x1D17BA0A0]();
      v10 = v5;
      HMFGetOSLogHandle();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = 138543618;
        v15 = v12;
        v16 = 2080;
        v17 = "-[HMDAccessoryFirmwareUpdateSession _handleSocketTimeout]";
        _os_log_impl(&dword_1CD062000, v11, OS_LOG_TYPE_INFO, "%{public}@%s: called to control Matter Accessory. No sockets used with Matter Accessories. No action taken.", (uint8_t *)&v14, 0x16u);

      }
      objc_autoreleasePoolPop(v9);

      return;
    }

  }
  -[HMDAccessoryFirmwareUpdateSession _cancelSocketIdleTimer](v5, "_cancelSocketIdleTimer");
  -[HMDAccessoryFirmwareUpdateSession dataStreamSocket](v5, "dataStreamSocket");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "close");

  if (-[HMDAccessoryFirmwareUpdateSession internalState](v5, "internalState") == 2)
  {
    -[HMDAccessoryFirmwareUpdateSession setInternalState:](v5, "setInternalState:", 1);
  }
  else if (-[HMDAccessoryFirmwareUpdateSession internalState](v5, "internalState") == 5
         && -[HMDAccessoryFirmwareUpdateSession isFirmwareVersionUpToDate](v5, "isFirmwareVersionUpToDate"))
  {
    -[HMDAccessoryFirmwareUpdateSession setInternalState:](v5, "setInternalState:", 0);
    -[HMDAccessoryFirmwareUpdateSession _endSession](v5, "_endSession");
  }
}

- (void)_cancelQueryFirmwareUpdateResultTimer
{
  NSObject *v3;
  void *v4;
  HMDAccessoryFirmwareUpdateSession *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  -[HMDAccessoryFirmwareUpdateSession workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  v4 = (void *)MEMORY[0x1D17BA0A0]();
  v5 = self;
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543362;
    v10 = v7;
    _os_log_impl(&dword_1CD062000, v6, OS_LOG_TYPE_DEBUG, "%{public}@Cancel query firmware update result duration timer", (uint8_t *)&v9, 0xCu);

  }
  objc_autoreleasePoolPop(v4);
  -[HMDAccessoryFirmwareUpdateSession queryFirmwareUpdateResultDurationTimer](v5, "queryFirmwareUpdateResultDurationTimer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "suspend");

  -[HMDAccessoryFirmwareUpdateSession setQueryFirmwareUpdateResultDurationTimer:](v5, "setQueryFirmwareUpdateResultDurationTimer:", 0);
  -[HMDAccessoryFirmwareUpdateSession setIsVerifyingUpdate:](v5, "setIsVerifyingUpdate:", 0);
}

- (void)_handleQueryFirmwareUpdateResultTimeout
{
  NSObject *v3;
  void *v4;
  HMDAccessoryFirmwareUpdateSession *v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  -[HMDAccessoryFirmwareUpdateSession workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  v4 = (void *)MEMORY[0x1D17BA0A0]();
  v5 = self;
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543362;
    v9 = v7;
    _os_log_impl(&dword_1CD062000, v6, OS_LOG_TYPE_DEBUG, "%{public}@Query firmware update result duration timeout", (uint8_t *)&v8, 0xCu);

  }
  objc_autoreleasePoolPop(v4);
  -[HMDAccessoryFirmwareUpdateSession _cancelQueryFirmwareUpdateResultTimer](v5, "_cancelQueryFirmwareUpdateResultTimer");
  -[HMDAccessoryFirmwareUpdateSession _schedule](v5, "_schedule");
}

- (void)_cancelRegisterFailureRetryTimer
{
  NSObject *v3;
  void *v4;
  HMDAccessoryFirmwareUpdateSession *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  -[HMDAccessoryFirmwareUpdateSession workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  v4 = (void *)MEMORY[0x1D17BA0A0]();
  v5 = self;
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543362;
    v10 = v7;
    _os_log_impl(&dword_1CD062000, v6, OS_LOG_TYPE_DEBUG, "%{public}@Cancel register failure retry timer", (uint8_t *)&v9, 0xCu);

  }
  objc_autoreleasePoolPop(v4);
  -[HMDAccessoryFirmwareUpdateSession registerFailureRetryTimer](v5, "registerFailureRetryTimer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "suspend");

  -[HMDAccessoryFirmwareUpdateSession setRegisterFailureRetryTimer:](v5, "setRegisterFailureRetryTimer:", 0);
}

- (void)_handleRegisterFailureRetryTimeout
{
  NSObject *v3;
  void *v4;
  HMDAccessoryFirmwareUpdateSession *v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  -[HMDAccessoryFirmwareUpdateSession workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  v4 = (void *)MEMORY[0x1D17BA0A0]();
  v5 = self;
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543362;
    v9 = v7;
    _os_log_impl(&dword_1CD062000, v6, OS_LOG_TYPE_DEBUG, "%{public}@Register failure retry timeout", (uint8_t *)&v8, 0xCu);

  }
  objc_autoreleasePoolPop(v4);
  -[HMDAccessoryFirmwareUpdateSession _cancelRegisterFailureRetryTimer](v5, "_cancelRegisterFailureRetryTimer");
  -[HMDAccessoryFirmwareUpdateSession setCurrentRegisterFailureCount:](v5, "setCurrentRegisterFailureCount:", 0);
  -[HMDAccessoryFirmwareUpdateSession _schedule](v5, "_schedule");
}

- (void)_withOpenSocketDoBlock:(id)a3 error:(id)a4
{
  void (**v6)(id, _QWORD);
  void (**v7)(id, void *);
  NSObject *v8;
  void *v9;
  void *v10;
  HMDAccessoryFirmwareUpdateSession *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  HMDAccessoryFirmwareUpdateSession *v20;
  NSObject *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD v26[5];
  id v27;
  void (**v28)(id, void *);
  void (**v29)(id, _QWORD);
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  const char *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v6 = (void (**)(id, _QWORD))a3;
  v7 = (void (**)(id, void *))a4;
  -[HMDAccessoryFirmwareUpdateSession workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  -[HMDAccessoryFirmwareUpdateSession hapAccessory](self, "hapAccessory");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((_os_feature_enabled_impl() & 1) == 0
    && !CFPreferencesGetAppBooleanValue(CFSTR("MatterOTA"), CFSTR("/Library/Managed Preferences/mobile/com.apple.homed.plist"), 0)|| !objc_msgSend(v9, "supportsCHIP"))
  {
    if (-[HMDAccessoryFirmwareUpdateSession dataStreamOpenInProgress](self, "dataStreamOpenInProgress"))
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:description:reason:suggestion:", 15, 0, CFSTR("Socket open already in progress"), 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v7[2](v7, v14);
    }
    else
    {
      -[HMDAccessoryFirmwareUpdateSession dataStreamSocket](self, "dataStreamSocket");
      v15 = objc_claimAutoreleasedReturnValue();
      if (v15)
      {
        v16 = (void *)v15;
        -[HMDAccessoryFirmwareUpdateSession dataStreamSocket](self, "dataStreamSocket");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "isClosed");

        if (!v18)
        {
          v6[2](v6, 0);
          goto LABEL_20;
        }
      }
      objc_msgSend(v9, "dataStreamSocketController");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (void *)MEMORY[0x1D17BA0A0]();
      v20 = self;
      HMFGetOSLogHandle();
      v21 = objc_claimAutoreleasedReturnValue();
      v22 = v21;
      if (v14)
      {
        if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v31 = v23;
          _os_log_impl(&dword_1CD062000, v22, OS_LOG_TYPE_INFO, "%{public}@Opening HDS connection to accessory", buf, 0xCu);

        }
        objc_autoreleasePoolPop(v19);
        -[HMDAccessoryFirmwareUpdateSession setDataStreamOpenInProgress:](v20, "setDataStreamOpenInProgress:", 1);
        v26[0] = MEMORY[0x1E0C809B0];
        v26[1] = 3221225472;
        v26[2] = __66__HMDAccessoryFirmwareUpdateSession__withOpenSocketDoBlock_error___block_invoke;
        v26[3] = &unk_1E89B4E40;
        v26[4] = v20;
        v28 = v7;
        v27 = v9;
        v29 = v6;
        objc_msgSend(v14, "openStreamSocketWithApplicationProtocol:completion:", CFSTR("UARP"), v26);

      }
      else
      {
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v31 = v24;
          _os_log_impl(&dword_1CD062000, v22, OS_LOG_TYPE_ERROR, "%{public}@No dataStreamSocketController", buf, 0xCu);

        }
        objc_autoreleasePoolPop(v19);
        objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:description:reason:suggestion:", 54, 0, CFSTR("No dataStreamSocketController"), 0);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v7[2](v7, v25);

      }
    }

    goto LABEL_20;
  }
  v10 = (void *)MEMORY[0x1D17BA0A0]();
  v11 = self;
  HMFGetOSLogHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v31 = v13;
    v32 = 2080;
    v33 = "-[HMDAccessoryFirmwareUpdateSession _withOpenSocketDoBlock:error:]";
    _os_log_impl(&dword_1CD062000, v12, OS_LOG_TYPE_INFO, "%{public}@%s: called to control Matter Accessory. No sockets used with Matter Accessories. No action taken.", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v10);
LABEL_20:

}

- (void)_syncStateWithAccessoryOnResume
{
  NSObject *v3;
  void *v4;
  HMDAccessoryFirmwareUpdateSession *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  const __CFString *v9;
  int v10;
  void *v11;
  __int16 v12;
  const __CFString *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  -[HMDAccessoryFirmwareUpdateSession workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[HMDAccessoryFirmwareUpdateSession setInternalState:](self, "setInternalState:", -[HMDAccessoryFirmwareUpdateSession nextStateToSchedule](self, "nextStateToSchedule"));
  -[HMDAccessoryFirmwareUpdateSession _logDebugStates:](self, "_logDebugStates:", "-[HMDAccessoryFirmwareUpdateSession _syncStateWithAccessoryOnResume]");
  if (-[HMDAccessoryFirmwareUpdateSession internalState](self, "internalState"))
  {
    v4 = (void *)MEMORY[0x1D17BA0A0]();
    v5 = self;
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = -[HMDAccessoryFirmwareUpdateSession internalState](v5, "internalState");
      if ((unint64_t)(v8 - 1) > 4)
        v9 = CFSTR("Up To Date");
      else
        v9 = off_1E89B4FD8[v8 - 1];
      v10 = 138543618;
      v11 = v7;
      v12 = 2112;
      v13 = v9;
      _os_log_impl(&dword_1CD062000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@Synced state is: %@", (uint8_t *)&v10, 0x16u);

    }
    objc_autoreleasePoolPop(v4);
  }
  else
  {
    -[HMDAccessoryFirmwareUpdateSession _endSession](self, "_endSession");
  }
}

- (void)_evaluateHDSRetryForApplyFirmware
{
  void *v3;
  void *v4;
  HMDAccessoryFirmwareUpdateSession *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  HMDAccessoryFirmwareUpdateSession *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  HMDAccessoryFirmwareUpdateSession *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  dispatch_time_t v18;
  NSObject *v19;
  void *v20;
  HMDAccessoryFirmwareUpdateSession *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  char *v25;
  _QWORD block[5];
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  const char *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  -[HMDAccessoryFirmwareUpdateSession hapAccessory](self, "hapAccessory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (((_os_feature_enabled_impl() & 1) != 0
     || CFPreferencesGetAppBooleanValue(CFSTR("MatterOTA"), CFSTR("/Library/Managed Preferences/mobile/com.apple.homed.plist"), 0))&& objc_msgSend(v3, "supportsCHIP"))
  {
    v4 = (void *)MEMORY[0x1D17BA0A0]();
    v5 = self;
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v28 = v7;
      v29 = 2080;
      v30 = "-[HMDAccessoryFirmwareUpdateSession _evaluateHDSRetryForApplyFirmware]";
      _os_log_impl(&dword_1CD062000, v6, OS_LOG_TYPE_INFO, "%{public}@%s: called to control Matter Accessory. No sockets used with Matter Accessories. No action taken.", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v4);
    goto LABEL_24;
  }
  -[HMDAccessoryFirmwareUpdateSession allowedApplyDurationTimer](self, "allowedApplyDurationTimer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {

    goto LABEL_10;
  }
  if ((objc_msgSend(v3, "isReachable") & 1) != 0)
  {
LABEL_10:
    if (-[HMDAccessoryFirmwareUpdateSession applyHDSRetryCount](self, "applyHDSRetryCount") < 0xA)
    {
      v13 = (void *)MEMORY[0x1D17BA0A0](-[HMDAccessoryFirmwareUpdateSession setApplyHDSRetryCount:](self, "setApplyHDSRetryCount:", -[HMDAccessoryFirmwareUpdateSession applyHDSRetryCount](self, "applyHDSRetryCount") + 1));
      v14 = self;
      HMFGetOSLogHandle();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HMDAccessoryFirmwareUpdateSession applyHDSRetryCount](v14, "applyHDSRetryCount"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v28 = v16;
        v29 = 2112;
        v30 = (const char *)&unk_1E8B33D98;
        v31 = 2112;
        v32 = v17;
        _os_log_impl(&dword_1CD062000, v15, OS_LOG_TYPE_INFO, "%{public}@Rescheduling apply task after HDS failure in %@ sec for retry: %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v13);
      v18 = dispatch_time(0, 10000000000);
      -[HMDAccessoryFirmwareUpdateSession workQueue](v14, "workQueue");
      v19 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __70__HMDAccessoryFirmwareUpdateSession__evaluateHDSRetryForApplyFirmware__block_invoke;
      block[3] = &unk_1E89C2730;
      block[4] = v14;
      dispatch_after(v18, v19, block);

    }
    else
    {
      if (-[HMDAccessoryFirmwareUpdateSession internalState](self, "internalState") == 3)
      {
        v9 = (void *)MEMORY[0x1D17BA0A0]();
        v10 = self;
        HMFGetOSLogHandle();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v28 = v12;
          _os_log_impl(&dword_1CD062000, v11, OS_LOG_TYPE_INFO, "%{public}@Out of HDS retries for apply. Moving update back to downloaded.", buf, 0xCu);

        }
        objc_autoreleasePoolPop(v9);
        -[HMDAccessoryFirmwareUpdateSession _logDebugStates:](v10, "_logDebugStates:", "-[HMDAccessoryFirmwareUpdateSession _evaluateHDSRetryForApplyFirmware]");
        -[HMDAccessoryFirmwareUpdateSession updateAvailableSoftwareUpdateState:](v10, "updateAvailableSoftwareUpdateState:", 2);
      }
      if (-[HMDAccessoryFirmwareUpdateSession isUserInitiatedInstall](self, "isUserInitiatedInstall"))
      {
        -[HMDAccessoryFirmwareUpdateSession setApplyHDSRetryCount:](self, "setApplyHDSRetryCount:", 0);
        -[HMDAccessoryFirmwareUpdateSession setUserInitiatedInstall:](self, "setUserInitiatedInstall:", 0);
      }
      else
      {
        -[HMDAccessoryFirmwareUpdateSession _endSession](self, "_endSession");
      }
    }
    goto LABEL_24;
  }
  v20 = (void *)MEMORY[0x1D17BA0A0]();
  v21 = self;
  HMFGetOSLogHandle();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDAccessoryFirmwareUpdateSession hapAccessory](v21, "hapAccessory");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "name");
    v25 = (char *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v28 = v23;
    v29 = 2112;
    v30 = v25;
    _os_log_impl(&dword_1CD062000, v22, OS_LOG_TYPE_ERROR, "%{public}@Not performing HDS retries because firmware apply has not started and accessory %@ is unreachable", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v20);
  -[HMDAccessoryFirmwareUpdateSession updateAvailableSoftwareUpdateState:](v21, "updateAvailableSoftwareUpdateState:", 2);
  -[HMDAccessoryFirmwareUpdateSession setInternalState:](v21, "setInternalState:", 3);
LABEL_24:

}

- (BOOL)isStagedFirmwareVersionUpToDate
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[HMDAccessoryFirmwareUpdateSession hapAccessory](self, "hapAccessory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firmwareUpdateProfile");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stagedFirmwareVersion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMDAccessoryFirmwareUpdateSession availableSoftwareVersion](self, "availableSoftwareVersion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_msgSend(v5, "isAtLeastVersion:", v6);

  return (char)v3;
}

- (BOOL)isFirmwareVersionUpToDate
{
  void *v3;
  void *v4;
  char v5;

  -[HMDAccessoryFirmwareUpdateSession accessoryVersion](self, "accessoryVersion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessoryFirmwareUpdateSession availableSoftwareVersion](self, "availableSoftwareVersion");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isAtLeastVersion:", v4);

  return v5;
}

- (BOOL)isCurrentlyStaging
{
  return -[HMDAccessoryFirmwareUpdateSession internalState](self, "internalState") == 2;
}

- (BOOL)isReadyForStaging
{
  void *v3;
  void *v4;
  _BOOL4 v5;
  uint64_t v6;
  _BOOL4 v7;
  BOOL v8;
  void *v9;
  HMDAccessoryFirmwareUpdateSession *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  BOOL v15;
  void *v17;
  void *v18;
  void *v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  -[HMDAccessoryFirmwareUpdateSession hapAccessory](self, "hapAccessory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firmwareUpdateProfile");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = !objc_msgSend(v4, "updateState")
    || objc_msgSend(v4, "updateState") == 2
    || objc_msgSend(v4, "updateState") == 1
    || objc_msgSend(v4, "updateState") == 3;
  v6 = objc_msgSend(v4, "stagingNotReadyReasons");
  v7 = -[HMDAccessoryFirmwareUpdateSession isStagedFirmwareVersionUpToDate](self, "isStagedFirmwareVersionUpToDate");
  v8 = v7;
  if (!v6 && v5 && !v7)
    goto LABEL_12;
  v9 = (void *)MEMORY[0x1D17BA0A0]();
  v10 = self;
  HMFGetOSLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    HMFBooleanToString();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stagingNotReadyReasons");
    HAPStagingNotReadyReasonsAsString();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    HMFBooleanToString();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "updateState");
    HAPFirmwareUpdateStateAsString();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    HMFBooleanToString();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544642;
    v21 = v19;
    v22 = 2112;
    v23 = v18;
    v24 = 2114;
    v25 = v17;
    v26 = 2112;
    v27 = v12;
    v28 = 2114;
    v29 = v13;
    v30 = 2112;
    v31 = v14;
    _os_log_impl(&dword_1CD062000, v11, OS_LOG_TYPE_DEBUG, "%{public}@Not ready for staging - Not ready reasons: %@ (%{public}@), updateState %@ (%{public}@), isStagedFirmwareVersionUpToDate %@", buf, 0x3Eu);

  }
  objc_autoreleasePoolPop(v9);
  if (v6)
    v15 = 0;
  else
LABEL_12:
    v15 = v5 && !v8;

  return v15;
}

- (BOOL)isCurrentlyApplying
{
  return -[HMDAccessoryFirmwareUpdateSession internalState](self, "internalState") == 4;
}

- (BOOL)isCurrentUpdateLatest
{
  void *v3;
  void *v4;
  char v5;
  void *v6;
  HMDAccessoryFirmwareUpdateSession *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[HMDAccessoryFirmwareUpdateSession availableSoftwareVersion](self, "availableSoftwareVersion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[HMDAccessoryFirmwareUpdateSession accessoryVersion](self, "accessoryVersion");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v3, "isAtLeastVersion:", v4) & 1) != 0)
    {
      v5 = 1;
    }
    else
    {
      -[HMDAccessoryFirmwareUpdateSession hapAccessory](self, "hapAccessory");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "firmwareUpdateProfile");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "stagedFirmwareVersion");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v3, "isAtLeastVersion:", v12);

    }
  }
  else
  {
    v6 = (void *)MEMORY[0x1D17BA0A0]();
    v7 = self;
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543362;
      v15 = v9;
      _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_ERROR, "%{public}@No available version from UARP", (uint8_t *)&v14, 0xCu);

    }
    objc_autoreleasePoolPop(v6);
    v5 = 0;
  }

  return v5;
}

- (BOOL)isReadyToApplyUpdate
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  _BOOL4 v7;
  BOOL v8;
  void *v9;
  HMDAccessoryFirmwareUpdateSession *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  BOOL v15;
  void *v17;
  void *v18;
  void *v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  -[HMDAccessoryFirmwareUpdateSession hapAccessory](self, "hapAccessory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firmwareUpdateProfile");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "updateState");
  v6 = objc_msgSend(v4, "updateNotReadyReasons");
  v7 = -[HMDAccessoryFirmwareUpdateSession isFirmwareVersionUpToDate](self, "isFirmwareVersionUpToDate");
  v8 = v7;
  if (!v6 && v5 == 3 && !v7)
    goto LABEL_8;
  v9 = (void *)MEMORY[0x1D17BA0A0]();
  v10 = self;
  HMFGetOSLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    HMFBooleanToString();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "updateNotReadyReasons");
    HAPUpdateNotReadyReasonsAsString();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    HMFBooleanToString();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "updateState");
    HAPFirmwareUpdateStateAsString();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    HMFBooleanToString();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544642;
    v21 = v19;
    v22 = 2112;
    v23 = v18;
    v24 = 2114;
    v25 = v17;
    v26 = 2112;
    v27 = v12;
    v28 = 2112;
    v29 = v13;
    v30 = 2112;
    v31 = v14;
    _os_log_impl(&dword_1CD062000, v11, OS_LOG_TYPE_DEBUG, "%{public}@Not ready for applying update - Not ready reason: %@ (%{public}@), updateState %@ (%@), isFirmwareVersionUpToDate %@", buf, 0x3Eu);

  }
  objc_autoreleasePoolPop(v9);
  if (v6)
    v15 = 0;
  else
LABEL_8:
    v15 = v5 == 3 && !v8;

  return v15;
}

- (unint64_t)nextStateToSchedule
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _BOOL4 v8;
  unint64_t v9;
  void *v10;
  char v11;
  void *v13;
  HMDAccessoryFirmwareUpdateSession *v14;
  NSObject *v15;
  void *v16;
  int v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  -[HMDAccessoryFirmwareUpdateSession accessoryVersion](self, "accessoryVersion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessoryFirmwareUpdateSession hapAccessory](self, "hapAccessory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firmwareUpdateProfile");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stagedFirmwareVersion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMDAccessoryFirmwareUpdateSession availableSoftwareVersion](self, "availableSoftwareVersion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[HMDAccessoryFirmwareUpdateSession isFirmwareVersionUpToDate](self, "isFirmwareVersionUpToDate");
  if (-[HMDAccessoryFirmwareUpdateSession internalState](self, "internalState") == 5)
  {
    if (v8)
      v9 = 5;
    else
      v9 = 1;
    goto LABEL_22;
  }
  if (v8)
  {
LABEL_6:
    v9 = 0;
    goto LABEL_22;
  }
  if (!v6)
  {
    -[HMDAccessoryFirmwareUpdateSession lastStagedVersion](self, "lastStagedVersion");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v3, "isAtLeastVersion:", v10);

    if (-[HMDAccessoryFirmwareUpdateSession isCurrentlyApplying](self, "isCurrentlyApplying") && (v11 & 1) != 0
      || !-[HMDAccessoryFirmwareUpdateSession isCurrentlyStaging](self, "isCurrentlyStaging")
      && !-[HMDAccessoryFirmwareUpdateSession isCurrentlyApplying](self, "isCurrentlyApplying"))
    {
      goto LABEL_21;
    }
    goto LABEL_20;
  }
  if (!objc_msgSend(v6, "isAtLeastVersion:", v7)
    || !objc_msgSend(v6, "isGreaterThanVersion:", v3))
  {
    if (!objc_msgSend(v7, "isGreaterThanVersion:", v6))
    {
      v13 = (void *)MEMORY[0x1D17BA0A0]();
      v14 = self;
      HMFGetOSLogHandle();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = 138543362;
        v18 = v16;
        _os_log_impl(&dword_1CD062000, v15, OS_LOG_TYPE_ERROR, "%{public}@Unhandled version combination in nextStateToSchedule", (uint8_t *)&v17, 0xCu);

      }
      objc_autoreleasePoolPop(v13);
      goto LABEL_6;
    }
    if (!-[HMDAccessoryFirmwareUpdateSession isCurrentlyStaging](self, "isCurrentlyStaging"))
    {
LABEL_21:
      v9 = 1;
      goto LABEL_22;
    }
LABEL_20:
    v9 = -[HMDAccessoryFirmwareUpdateSession internalState](self, "internalState");
    goto LABEL_22;
  }
  if (-[HMDAccessoryFirmwareUpdateSession internalState](self, "internalState") == 4)
    v9 = 4;
  else
    v9 = 3;
LABEL_22:

  return v9;
}

- (void)stageFirmware
{
  NSObject *v3;
  void *v4;
  void *v5;
  HMDAccessoryFirmwareUpdateSession *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  _QWORD v10[5];
  _QWORD v11[5];
  id v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  const char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  -[HMDAccessoryFirmwareUpdateSession workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[HMDAccessoryFirmwareUpdateSession hapAccessory](self, "hapAccessory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (((_os_feature_enabled_impl() & 1) != 0
     || CFPreferencesGetAppBooleanValue(CFSTR("MatterOTA"), CFSTR("/Library/Managed Preferences/mobile/com.apple.homed.plist"), 0))&& objc_msgSend(v4, "supportsCHIP"))
  {
    v5 = (void *)MEMORY[0x1D17BA0A0]();
    v6 = self;
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v14 = v8;
      v15 = 2080;
      v16 = "-[HMDAccessoryFirmwareUpdateSession stageFirmware]";
      _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_INFO, "%{public}@%s: firmware has been downloaded for Matter Accessory. Matter Accessory responsible for staging firmware. No action taken.", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v5);
  }
  else
  {
    v9 = MEMORY[0x1E0C809B0];
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __50__HMDAccessoryFirmwareUpdateSession_stageFirmware__block_invoke;
    v11[3] = &unk_1E89B4E68;
    v11[4] = self;
    v12 = v4;
    v10[0] = v9;
    v10[1] = 3221225472;
    v10[2] = __50__HMDAccessoryFirmwareUpdateSession_stageFirmware__block_invoke_85;
    v10[3] = &unk_1E89C2350;
    v10[4] = self;
    -[HMDAccessoryFirmwareUpdateSession _withOpenSocketDoBlock:error:](self, "_withOpenSocketDoBlock:error:", v11, v10);

  }
}

- (void)stagingComplete
{
  NSObject *v3;
  void *v4;
  void *v5;
  HMDAccessoryFirmwareUpdateSession *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  HMDAccessoryFirmwareUpdateSession *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[HMDAccessoryFirmwareUpdateSession workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[HMDAccessoryFirmwareUpdateSession hapAccessory](self, "hapAccessory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (((_os_feature_enabled_impl() & 1) != 0
     || CFPreferencesGetAppBooleanValue(CFSTR("MatterOTA"), CFSTR("/Library/Managed Preferences/mobile/com.apple.homed.plist"), 0))&& objc_msgSend(v4, "supportsCHIP"))
  {
    v5 = (void *)MEMORY[0x1D17BA0A0]();
    v6 = self;
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543618;
      v15 = v8;
      v16 = 2080;
      v17 = "-[HMDAccessoryFirmwareUpdateSession stagingComplete]";
      _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_INFO, "%{public}@%s: Matter Accessory responsible for managing firmware staging. No action taken.", (uint8_t *)&v14, 0x16u);

    }
    objc_autoreleasePoolPop(v5);
  }
  else
  {
    -[HMDAccessoryFirmwareUpdateSession setInternalState:](self, "setInternalState:", -[HMDAccessoryFirmwareUpdateSession nextStateToSchedule](self, "nextStateToSchedule"));
    -[HMDAccessoryFirmwareUpdateSession _logDebugStates:](self, "_logDebugStates:", "-[HMDAccessoryFirmwareUpdateSession stagingComplete]");
    if ((objc_msgSend(v4, "isAutomaticThirdPartyAccessorySoftwareUpdateEnabled") & 1) != 0
      || -[HMDAccessoryFirmwareUpdateSession isUserInitiatedInstall](self, "isUserInitiatedInstall"))
    {
      v9 = (void *)MEMORY[0x1D17BA0A0]();
      v10 = self;
      HMFGetOSLogHandle();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = 138543362;
        v15 = v12;
        _os_log_impl(&dword_1CD062000, v11, OS_LOG_TYPE_INFO, "%{public}@Staging complete", (uint8_t *)&v14, 0xCu);

      }
      objc_autoreleasePoolPop(v9);
      -[HMDAccessoryFirmwareUpdateSession _schedule](v10, "_schedule");
    }
    else
    {
      objc_msgSend(v4, "home");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "reevaluateAccessoryInfo");

    }
  }

}

- (void)applyFirmware
{
  NSObject *v3;
  void *v4;
  void *v5;
  HMDAccessoryFirmwareUpdateSession *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  HMDAccessoryFirmwareUpdateSession *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  HMDAccessoryFirmwareUpdateSession *v21;
  NSObject *v22;
  void *v23;
  char *v24;
  _QWORD v25[5];
  _QWORD v26[5];
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  const char *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  -[HMDAccessoryFirmwareUpdateSession workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[HMDAccessoryFirmwareUpdateSession hapAccessory](self, "hapAccessory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (((_os_feature_enabled_impl() & 1) != 0
     || CFPreferencesGetAppBooleanValue(CFSTR("MatterOTA"), CFSTR("/Library/Managed Preferences/mobile/com.apple.homed.plist"), 0))&& objc_msgSend(v4, "supportsCHIP"))
  {
    v5 = (void *)MEMORY[0x1D17BA0A0]();
    v6 = self;
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v28 = v8;
      v29 = 2080;
      v30 = "-[HMDAccessoryFirmwareUpdateSession applyFirmware]";
      _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_INFO, "%{public}@%s: Matter Accessory responsible for managing firmware application. No action taken.", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v5);
  }
  else
  {
    objc_msgSend(v4, "home");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      if ((objc_msgSend(v4, "isAutomaticThirdPartyAccessorySoftwareUpdateEnabled") & 1) != 0
        || -[HMDAccessoryFirmwareUpdateSession isUserInitiatedInstall](self, "isUserInitiatedInstall"))
      {
        objc_msgSend(v4, "firmwareUpdateProfile");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "stagedFirmwareVersion");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        -[HMDAccessoryFirmwareUpdateSession availableSoftwareVersion](self, "availableSoftwareVersion");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v11, "isGreaterThanVersion:", v12);

        if (v13)
        {
          v14 = (void *)MEMORY[0x1D17BA0A0]();
          v15 = self;
          HMFGetOSLogHandle();
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            -[HMDAccessoryFirmwareUpdateSession availableSoftwareVersion](v15, "availableSoftwareVersion");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "shortVersionString");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v28 = v17;
            v29 = 2112;
            v30 = (const char *)v11;
            v31 = 2112;
            v32 = v19;
            _os_log_impl(&dword_1CD062000, v16, OS_LOG_TYPE_INFO, "%{public}@Staged version %@ is different then available version %@", buf, 0x20u);

          }
          objc_autoreleasePoolPop(v14);
          -[HMDAccessoryFirmwareUpdateSession setUserInitiatedInstall:](v15, "setUserInitiatedInstall:", 0);
        }
        else
        {
          v25[4] = self;
          v26[0] = MEMORY[0x1E0C809B0];
          v26[1] = 3221225472;
          v26[2] = __50__HMDAccessoryFirmwareUpdateSession_applyFirmware__block_invoke;
          v26[3] = &unk_1E89C02B8;
          v26[4] = self;
          v25[0] = MEMORY[0x1E0C809B0];
          v25[1] = 3221225472;
          v25[2] = __50__HMDAccessoryFirmwareUpdateSession_applyFirmware__block_invoke_2;
          v25[3] = &unk_1E89C2350;
          -[HMDAccessoryFirmwareUpdateSession _withOpenSocketDoBlock:error:](self, "_withOpenSocketDoBlock:error:", v26, v25);
        }

      }
      else
      {
        v20 = (void *)MEMORY[0x1D17BA0A0]();
        v21 = self;
        HMFGetOSLogHandle();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "isAutomaticThirdPartyAccessorySoftwareUpdateEnabled");
          HMFEnabledStatusToString();
          v24 = (char *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v28 = v23;
          v29 = 2112;
          v30 = v24;
          _os_log_impl(&dword_1CD062000, v22, OS_LOG_TYPE_INFO, "%{public}@Not auto applying firmware update because isAutomaticThirdPartyAccessorySoftwareUpdateEnabled = %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v20);
      }
    }

  }
}

- (void)_applyFirmware
{
  NSObject *v3;
  void *v4;
  void *v5;
  HMDAccessoryFirmwareUpdateSession *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  HMDAccessoryFirmwareUpdateSession *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  void *v19;
  void *v20;
  HMDAccessoryFirmwareUpdateSession *v21;
  NSObject *v22;
  void *v23;
  char *v24;
  void *v25;
  HMDAccessoryFirmwareUpdateSession *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  const char *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  -[HMDAccessoryFirmwareUpdateSession workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[HMDAccessoryFirmwareUpdateSession hapAccessory](self, "hapAccessory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (((_os_feature_enabled_impl() & 1) != 0
     || CFPreferencesGetAppBooleanValue(CFSTR("MatterOTA"), CFSTR("/Library/Managed Preferences/mobile/com.apple.homed.plist"), 0))&& objc_msgSend(v4, "supportsCHIP"))
  {
    v5 = (void *)MEMORY[0x1D17BA0A0]();
    v6 = self;
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v31 = v8;
      v32 = 2080;
      v33 = "-[HMDAccessoryFirmwareUpdateSession _applyFirmware]";
      _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_INFO, "%{public}@%s: Matter Accessory responsible for managing firmware application. No action taken.", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v5);
  }
  else
  {
    -[HMDAccessoryFirmwareUpdateSession accessoryFirmwareUpdateManager](self, "accessoryFirmwareUpdateManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "UARPControllerForAccessory:", v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = (void *)MEMORY[0x1D17BA0A0](-[HMDAccessoryFirmwareUpdateSession setInternalState:](self, "setInternalState:", 4));
    v12 = self;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v31 = v14;
      _os_log_impl(&dword_1CD062000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@telling uarpController to apply asset", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v11);
    -[HMDAccessoryFirmwareUpdateSession uarpAccessory](v12, "uarpAccessory");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v15;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v29, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v10, "applyFirmwareUpdateOnAccessoryList:withUserIntent:", v16, -[HMDAccessoryFirmwareUpdateSession isUserInitiatedInstall](v12, "isUserInitiatedInstall"));

    if ((v17 & 1) != 0)
    {
      objc_msgSend(v4, "softwareUpdate");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "updateLocalState:", 3);

      objc_msgSend(v4, "firmwareUpdateProfile");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (v19)
      {
        -[HMDAccessoryFirmwareUpdateSession startApplyDurationTimers](v12, "startApplyDurationTimers");
      }
      else
      {
        v25 = (void *)MEMORY[0x1D17BA0A0]();
        v26 = v12;
        HMFGetOSLogHandle();
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v31 = v28;
          v32 = 2112;
          v33 = (const char *)v4;
          _os_log_impl(&dword_1CD062000, v27, OS_LOG_TYPE_ERROR, "%{public}@No firmwareUpdateProfile for accessory: %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v25);
        -[HMDAccessoryFirmwareUpdateSession _endSession](v26, "_endSession");
      }

    }
    else
    {
      v20 = (void *)MEMORY[0x1D17BA0A0](-[HMDAccessoryFirmwareUpdateSession setUserInitiatedInstall:](v12, "setUserInitiatedInstall:", 0));
      v21 = v12;
      HMFGetOSLogHandle();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDAccessoryFirmwareUpdateSession uarpAccessory](v21, "uarpAccessory");
        v24 = (char *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v31 = v23;
        v32 = 2112;
        v33 = v24;
        _os_log_impl(&dword_1CD062000, v22, OS_LOG_TYPE_ERROR, "%{public}@applyFirmwareUpdateOnAccessoryList failed for %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v20);
    }

  }
}

- (void)startApplyDurationTimers
{
  double v3;
  double v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  HMDAccessoryFirmwareUpdateSession *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  -[HMDAccessoryFirmwareUpdateSession _allowedApplyDuration](self, "_allowedApplyDuration");
  v4 = v3;
  -[HMDAccessoryFirmwareUpdateSession allowedApplyDurationTimer](self, "allowedApplyDurationTimer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D286C8]), "initWithTimeInterval:options:", 1, v4);
    -[HMDAccessoryFirmwareUpdateSession setAllowedApplyDurationTimer:](self, "setAllowedApplyDurationTimer:", v6);

    -[HMDAccessoryFirmwareUpdateSession allowedApplyDurationTimer](self, "allowedApplyDurationTimer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setDelegate:", self);

    -[HMDAccessoryFirmwareUpdateSession workQueue](self, "workQueue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDAccessoryFirmwareUpdateSession allowedApplyDurationTimer](self, "allowedApplyDurationTimer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setDelegateQueue:", v8);

    v10 = objc_alloc(MEMORY[0x1E0D286C8]);
    -[HMDAccessoryFirmwareUpdateSession _expectedApplyDuration](self, "_expectedApplyDuration");
    v11 = (void *)objc_msgSend(v10, "initWithTimeInterval:options:", 1);
    -[HMDAccessoryFirmwareUpdateSession setExpectedApplyDurationTimer:](self, "setExpectedApplyDurationTimer:", v11);

    -[HMDAccessoryFirmwareUpdateSession expectedApplyDurationTimer](self, "expectedApplyDurationTimer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setDelegate:", self);

    -[HMDAccessoryFirmwareUpdateSession workQueue](self, "workQueue");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDAccessoryFirmwareUpdateSession expectedApplyDurationTimer](self, "expectedApplyDurationTimer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setDelegateQueue:", v13);

  }
  v15 = (void *)MEMORY[0x1D17BA0A0]();
  v16 = self;
  HMFGetOSLogHandle();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v4);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 138543618;
    v23 = v18;
    v24 = 2112;
    v25 = v19;
    _os_log_impl(&dword_1CD062000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@Waiting up to %@ seconds for accessory to apply update", (uint8_t *)&v22, 0x16u);

  }
  objc_autoreleasePoolPop(v15);
  -[HMDAccessoryFirmwareUpdateSession allowedApplyDurationTimer](v16, "allowedApplyDurationTimer");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "resume");

  -[HMDAccessoryFirmwareUpdateSession expectedApplyDurationTimer](v16, "expectedApplyDurationTimer");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "resume");

}

- (double)allowedApplyDuration
{
  NSObject *v3;
  double v4;
  _QWORD v6[6];
  uint64_t v7;
  double *v8;
  uint64_t v9;
  uint64_t v10;

  v7 = 0;
  v8 = (double *)&v7;
  v9 = 0x2020000000;
  v10 = 0;
  -[HMDAccessoryFirmwareUpdateSession workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __57__HMDAccessoryFirmwareUpdateSession_allowedApplyDuration__block_invoke;
  v6[3] = &unk_1E89C0800;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (double)expectedApplyDuration
{
  NSObject *v3;
  double v4;
  _QWORD v6[6];
  uint64_t v7;
  double *v8;
  uint64_t v9;
  uint64_t v10;

  v7 = 0;
  v8 = (double *)&v7;
  v9 = 0x2020000000;
  v10 = 0;
  -[HMDAccessoryFirmwareUpdateSession workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __58__HMDAccessoryFirmwareUpdateSession_expectedApplyDuration__block_invoke;
  v6[3] = &unk_1E89C0800;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (double)_allowedApplyDuration
{
  NSObject *v3;
  double v4;
  double v5;
  uint64_t v6;
  double v7;

  -[HMDAccessoryFirmwareUpdateSession workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[HMDAccessoryFirmwareUpdateSession _expectedApplyDuration](self, "_expectedApplyDuration");
  v5 = v4;
  v6 = minimumApplyDurationAllowance();
  if (v5 < (double)(unint64_t)v6)
    v5 = (double)(unint64_t)v6;
  -[HMDAccessoryFirmwareUpdateSession _expectedApplyDuration](self, "_expectedApplyDuration");
  return v7 + v5;
}

- (double)_expectedApplyDuration
{
  NSObject *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  HMDAccessoryFirmwareUpdateSession *v8;
  NSObject *v9;
  void *v10;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  -[HMDAccessoryFirmwareUpdateSession workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[HMDAccessoryFirmwareUpdateSession hapAccessory](self, "hapAccessory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firmwareUpdateProfile");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "updateDuration");

  if (!v6)
  {
    v7 = (void *)MEMORY[0x1D17BA0A0]();
    v8 = self;
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543362;
      v13 = v10;
      _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_DEBUG, "%{public}@Expected duration is not set - default to minimum apply duration", (uint8_t *)&v12, 0xCu);

    }
    objc_autoreleasePoolPop(v7);
    v6 = minimumApplyDurationAllowance();
  }
  return (double)(unint64_t)v6;
}

- (void)_handleAutomaticUpdateEnabledChanged:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  -[HMDAccessoryFirmwareUpdateSession workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __74__HMDAccessoryFirmwareUpdateSession__handleAutomaticUpdateEnabledChanged___block_invoke;
  block[3] = &unk_1E89BE218;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)_automaticUpdateEnabledChanged:(BOOL)a3
{
  if (a3 && -[HMDAccessoryFirmwareUpdateSession internalState](self, "internalState") == 3)
    -[HMDAccessoryFirmwareUpdateSession _schedule](self, "_schedule");
}

- (void)_stagingFailed
{
  NSObject *v3;
  void *v4;
  void *v5;
  HMDAccessoryFirmwareUpdateSession *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  HMDAccessoryFirmwareUpdateSession *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  HMDAccessoryFirmwareUpdateSession *v17;
  NSObject *v18;
  void *v19;
  int v20;
  void *v21;
  __int16 v22;
  const char *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  -[HMDAccessoryFirmwareUpdateSession workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[HMDAccessoryFirmwareUpdateSession hapAccessory](self, "hapAccessory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (((_os_feature_enabled_impl() & 1) != 0
     || CFPreferencesGetAppBooleanValue(CFSTR("MatterOTA"), CFSTR("/Library/Managed Preferences/mobile/com.apple.homed.plist"), 0))&& objc_msgSend(v4, "supportsCHIP"))
  {
    v5 = (void *)MEMORY[0x1D17BA0A0]();
    v6 = self;
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138543618;
      v21 = v8;
      v22 = 2080;
      v23 = "-[HMDAccessoryFirmwareUpdateSession _stagingFailed]";
      _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_INFO, "%{public}@%s: Matter Accessory responsible for managing firmware staging. No action taken.", (uint8_t *)&v20, 0x16u);

    }
    objc_autoreleasePoolPop(v5);
  }
  else
  {
    v9 = (void *)MEMORY[0x1D17BA0A0]();
    v10 = self;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138543362;
      v21 = v12;
      _os_log_impl(&dword_1CD062000, v11, OS_LOG_TYPE_ERROR, "%{public}@Staging failed", (uint8_t *)&v20, 0xCu);

    }
    objc_autoreleasePoolPop(v9);
    -[HMDAccessoryFirmwareUpdateSession _endSession](v10, "_endSession");
    -[HMDAccessoryFirmwareUpdateSession accessoryFirmwareUpdateManager](v10, "accessoryFirmwareUpdateManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDAccessoryFirmwareUpdateSession assetID](v10, "assetID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v13, "isFirmwareUpdateRetryAllowedForAccessory:forAsset:", v4, v14);

    if (v15)
    {
      objc_msgSend(v13, "checkForUpdateForAccessory:", v4);
    }
    else
    {
      v16 = (void *)MEMORY[0x1D17BA0A0]();
      v17 = v10;
      HMFGetOSLogHandle();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = 138543362;
        v21 = v19;
        _os_log_impl(&dword_1CD062000, v18, OS_LOG_TYPE_ERROR, "%{public}@No more staging retries for this accessory's firmware update session", (uint8_t *)&v20, 0xCu);

      }
      objc_autoreleasePoolPop(v16);
    }

  }
}

- (void)_applyFailed
{
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  HMDAccessoryFirmwareUpdateSession *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  HMDAccessoryFirmwareUpdateSession *v11;
  NSObject *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[HMDAccessoryFirmwareUpdateSession workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  if (((_os_feature_enabled_impl() & 1) != 0
     || CFPreferencesGetAppBooleanValue(CFSTR("MatterOTA"), CFSTR("/Library/Managed Preferences/mobile/com.apple.homed.plist"), 0))&& (-[HMDAccessoryFirmwareUpdateSession hapAccessory](self, "hapAccessory"), v4 = (void *)objc_claimAutoreleasedReturnValue(), v5 = objc_msgSend(v4, "supportsCHIP"), v4, v5))
  {
    v6 = (void *)MEMORY[0x1D17BA0A0]();
    v7 = self;
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543618;
      v15 = v9;
      v16 = 2080;
      v17 = "-[HMDAccessoryFirmwareUpdateSession _applyFailed]";
      _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_INFO, "%{public}@%s: Matter Accessory responsible for managing firmware application. No action taken.", (uint8_t *)&v14, 0x16u);

    }
    objc_autoreleasePoolPop(v6);
  }
  else
  {
    v10 = (void *)MEMORY[0x1D17BA0A0]();
    v11 = self;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543362;
      v15 = v13;
      _os_log_impl(&dword_1CD062000, v12, OS_LOG_TYPE_ERROR, "%{public}@Apply did not complete or failed in the accessory", (uint8_t *)&v14, 0xCu);

    }
    objc_autoreleasePoolPop(v10);
    if (-[HMDAccessoryFirmwareUpdateSession isStagedFirmwareVersionUpToDate](v11, "isStagedFirmwareVersionUpToDate"))
    {
      -[HMDAccessoryFirmwareUpdateSession setInternalState:](v11, "setInternalState:", 3);
      if (-[HMDAccessoryFirmwareUpdateSession isUserInitiatedInstall](v11, "isUserInitiatedInstall"))
      {
        -[HMDAccessoryFirmwareUpdateSession setUserInitiatedInstall:](v11, "setUserInitiatedInstall:", 0);
        -[HMDAccessoryFirmwareUpdateSession _updateAvailableSoftwareUpdate](v11, "_updateAvailableSoftwareUpdate");
      }
      else
      {
        -[HMDAccessoryFirmwareUpdateSession _evaluateHDSRetryForApplyFirmware](v11, "_evaluateHDSRetryForApplyFirmware");
      }
    }
    else
    {
      -[HMDAccessoryFirmwareUpdateSession _endSession](v11, "_endSession");
    }
  }
}

- (void)_schedule
{
  NSObject *v3;
  unint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  HMDAccessoryFirmwareUpdateSession *v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  const __CFString *v14;
  void *v15;
  HMDAccessoryFirmwareUpdateSession *v16;
  NSObject *v17;
  void *v18;
  const char *v19;
  NSObject *v20;
  os_log_type_t v21;
  void *v22;
  int v23;
  void *v24;
  __int16 v25;
  const __CFString *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  -[HMDAccessoryFirmwareUpdateSession workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  v4 = -[HMDAccessoryFirmwareUpdateSession internalState](self, "internalState");
  -[HMDAccessoryFirmwareUpdateSession hapAccessory](self, "hapAccessory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessoryFirmwareUpdateSession setInternalState:](self, "setInternalState:", -[HMDAccessoryFirmwareUpdateSession nextStateToSchedule](self, "nextStateToSchedule"));
  if (!-[HMDAccessoryFirmwareUpdateSession isVerifyingUpdate](self, "isVerifyingUpdate")
    && !-[HMDAccessoryFirmwareUpdateSession internalState](self, "internalState"))
  {
    v15 = (void *)MEMORY[0x1D17BA0A0]();
    v16 = self;
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 138543362;
      v24 = v18;
      v19 = "%{public}@Update successful";
      v20 = v17;
      v21 = OS_LOG_TYPE_INFO;
LABEL_21:
      _os_log_impl(&dword_1CD062000, v20, v21, v19, (uint8_t *)&v23, 0xCu);

    }
LABEL_22:

    objc_autoreleasePoolPop(v15);
    -[HMDAccessoryFirmwareUpdateSession _endSession](v16, "_endSession");
    goto LABEL_23;
  }
  if (v4 - 3 <= 1 && -[HMDAccessoryFirmwareUpdateSession internalState](self, "internalState") == 1)
  {
    -[HMDAccessoryFirmwareUpdateSession accessoryFirmwareUpdateManager](self, "accessoryFirmwareUpdateManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDAccessoryFirmwareUpdateSession assetID](self, "assetID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "isFirmwareUpdateRetryAllowedForAccessory:forAsset:", v5, v7);

    if ((v8 & 1) == 0)
    {
      v15 = (void *)MEMORY[0x1D17BA0A0]();
      v16 = self;
      HMFGetOSLogHandle();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = 138543362;
        v24 = v18;
        v19 = "%{public}@No more staging retries for this accessory's firmware update session";
        v20 = v17;
        v21 = OS_LOG_TYPE_ERROR;
        goto LABEL_21;
      }
      goto LABEL_22;
    }
  }
  if (((_os_feature_enabled_impl() & 1) != 0
     || CFPreferencesGetAppBooleanValue(CFSTR("MatterOTA"), CFSTR("/Library/Managed Preferences/mobile/com.apple.homed.plist"), 0))&& objc_msgSend(v5, "supportsCHIP")&& -[HMDAccessoryFirmwareUpdateSession internalState](self, "internalState") == 1)
  {
    -[HMDAccessoryFirmwareUpdateSession _updateSoftwareUpdateStateForMatterAccessoryWithState:](self, "_updateSoftwareUpdateStateForMatterAccessoryWithState:", 1);
  }
  else
  {
    v9 = (void *)MEMORY[0x1D17BA0A0]();
    v10 = self;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = -[HMDAccessoryFirmwareUpdateSession internalState](v10, "internalState");
      if ((unint64_t)(v13 - 1) > 4)
        v14 = CFSTR("Up To Date");
      else
        v14 = off_1E89B4FD8[v13 - 1];
      v23 = 138543618;
      v24 = v12;
      v25 = 2112;
      v26 = v14;
      _os_log_impl(&dword_1CD062000, v11, OS_LOG_TYPE_INFO, "%{public}@Scheduling next operation, state %@", (uint8_t *)&v23, 0x16u);

    }
    objc_autoreleasePoolPop(v9);
    -[HMDAccessoryFirmwareUpdateSession updateScheduler](v10, "updateScheduler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "scheduleWithDelay:", 1);

  }
LABEL_23:

}

- (void)_endSession
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  HMDAccessoryFirmwareUpdateSession *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  HMDAccessoryFirmwareUpdateSession *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  id WeakRetained;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  -[HMDAccessoryFirmwareUpdateSession workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[HMDAccessoryFirmwareUpdateSession _logDebugStates:](self, "_logDebugStates:", "-[HMDAccessoryFirmwareUpdateSession _endSession]");
  -[HMDAccessoryFirmwareUpdateSession hapAccessory](self, "hapAccessory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (((_os_feature_enabled_impl() & 1) != 0
     || CFPreferencesGetAppBooleanValue(CFSTR("MatterOTA"), CFSTR("/Library/Managed Preferences/mobile/com.apple.homed.plist"), 0))&& objc_msgSend(v4, "supportsCHIP"))
  {
    objc_msgSend(v4, "firmwareUpdateProfile");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "matterFirmwareUpdateProfile");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "matterSoftwareUpdateProviderDelegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(v7, "resetOTAProviderStateForHMDHAPAccessory:", v4);
    }
    else
    {
      v8 = (void *)MEMORY[0x1D17BA0A0]();
      v9 = self;
      HMFGetOSLogHandle();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = 138543362;
        v24 = v11;
        _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_INFO, "%{public}@Couldn't get a strong ref to the software update provider delegate", (uint8_t *)&v23, 0xCu);

      }
      objc_autoreleasePoolPop(v8);
    }
    -[HMDAccessoryFirmwareUpdateSession resetMatterFirmwareUpdateRetryCount](self, "resetMatterFirmwareUpdateRetryCount");

  }
  v12 = (void *)MEMORY[0x1D17BA0A0]();
  v13 = self;
  HMFGetOSLogHandle();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDAccessoryFirmwareUpdateSession sessionEnded](v13, "sessionEnded");
    HMFBooleanToString();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 138543618;
    v24 = v15;
    v25 = 2112;
    v26 = v16;
    _os_log_impl(&dword_1CD062000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@Session ended (already ended: %@)", (uint8_t *)&v23, 0x16u);

  }
  objc_autoreleasePoolPop(v12);
  if (!-[HMDAccessoryFirmwareUpdateSession sessionEnded](v13, "sessionEnded"))
  {
    -[HMDAccessoryFirmwareUpdateSession setSessionEnded:](v13, "setSessionEnded:", 1);
    WeakRetained = objc_loadWeakRetained((id *)&v13->_hapAccessory);
    objc_msgSend(WeakRetained, "firmwareUpdateProfile");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "monitorCharacteristics:", 0);

    -[HMDAccessoryFirmwareUpdateSession dataStreamSocket](v13, "dataStreamSocket");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "close");

    -[HMDAccessoryFirmwareUpdateSession setInternalState:](v13, "setInternalState:", 0);
    -[HMDAccessoryFirmwareUpdateSession _updateAvailableSoftwareUpdate](v13, "_updateAvailableSoftwareUpdate");
    -[HMDAccessoryFirmwareUpdateSession accessoryFirmwareUpdateManager](v13, "accessoryFirmwareUpdateManager");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDAccessoryFirmwareUpdateSession assetID](v13, "assetID");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "resetFirmwareUpdateAccessoryRetryTracking:forAsset:", v4, v21);

    objc_msgSend(v20, "removeSession:", v13);
    -[HMDAccessoryFirmwareUpdateSession updateScheduler](v13, "updateScheduler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "removeUpdatePolicy");

  }
}

- (void)_cancelApplyTimer
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  HMDAccessoryFirmwareUpdateSession *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  -[HMDAccessoryFirmwareUpdateSession workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[HMDAccessoryFirmwareUpdateSession allowedApplyDurationTimer](self, "allowedApplyDurationTimer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {

  }
  else
  {
    -[HMDAccessoryFirmwareUpdateSession expectedApplyDurationTimer](self, "expectedApplyDurationTimer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
      return;
  }
  v6 = (void *)MEMORY[0x1D17BA0A0]();
  v7 = self;
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138543362;
    v13 = v9;
    _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_INFO, "%{public}@Apply timer cancelled", (uint8_t *)&v12, 0xCu);

  }
  objc_autoreleasePoolPop(v6);
  -[HMDAccessoryFirmwareUpdateSession allowedApplyDurationTimer](v7, "allowedApplyDurationTimer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "suspend");

  -[HMDAccessoryFirmwareUpdateSession setAllowedApplyDurationTimer:](v7, "setAllowedApplyDurationTimer:", 0);
  -[HMDAccessoryFirmwareUpdateSession expectedApplyDurationTimer](v7, "expectedApplyDurationTimer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "suspend");

  -[HMDAccessoryFirmwareUpdateSession setExpectedApplyDurationTimer:](v7, "setExpectedApplyDurationTimer:", 0);
}

- (void)_updateSoftwareUpdateStateForMatterAccessoryWithState:(unint64_t)a3
{
  __CFString *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  HMDAccessoryFirmwareUpdateSession *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v15;
  HMDAccessoryFirmwareUpdateSession *v16;
  NSObject *v17;
  uint64_t v18;
  void *v19;
  __CFString *v20;
  __CFString *v21;
  void *v22;
  HMDAccessoryFirmwareUpdateSession *v23;
  NSObject *v24;
  void *v25;
  __CFString *v26;
  int v27;
  uint64_t v28;
  __int16 v29;
  __CFString *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  if (a3 == 1)
  {
    -[HMDAccessoryFirmwareUpdateSession hapAccessory](self, "hapAccessory");
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    -[__CFString softwareUpdate](v4, "softwareUpdate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDAccessoryFirmwareUpdateSession accessoryVersion](self, "accessoryVersion");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDAccessoryFirmwareUpdateSession availableSoftwareVersion](self, "availableSoftwareVersion");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isEqualToVersion:", v6))
    {
      v8 = (void *)MEMORY[0x1D17BA0A0]();
      v9 = self;
      HMFGetOSLogHandle();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDAccessoryFirmwareUpdateSession uarpAccessory](v9, "uarpAccessory");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = 138544130;
        v28 = (uint64_t)v11;
        v29 = 2112;
        v30 = v4;
        v31 = 2112;
        v32 = v12;
        v33 = 2112;
        v34 = v5;
        _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_INFO, "%{public}@Update is already installed for acc:%@ uarpAcc:%@ softwareUpdate:%@", (uint8_t *)&v27, 0x2Au);

      }
      objc_autoreleasePoolPop(v8);
      v13 = 4;
    }
    else
    {
      v13 = 2;
      if ((-[__CFString isAutomaticThirdPartyAccessorySoftwareUpdateEnabled](v4, "isAutomaticThirdPartyAccessorySoftwareUpdateEnabled") & 1) == 0&& v5)
      {
        if (((objc_msgSend(v5, "state") - 3) & 0xFFFFFFFFFFFFFFFDLL) != 0)
          v13 = 2;
        else
          v13 = 5;
      }
    }
    v22 = (void *)MEMORY[0x1D17BA0A0]();
    v23 = self;
    HMFGetOSLogHandle();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      HMSoftwareUpdateStateToString();
      v26 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v27 = 138543618;
      v28 = (uint64_t)v25;
      v29 = 2112;
      v30 = v26;
      _os_log_impl(&dword_1CD062000, v24, OS_LOG_TYPE_INFO, "%{public}@Marking Update as %@, matter accessory will trigger staging by itself.", (uint8_t *)&v27, 0x16u);

    }
    objc_autoreleasePoolPop(v22);
    -[HMDAccessoryFirmwareUpdateSession updateAvailableSoftwareUpdateState:](v23, "updateAvailableSoftwareUpdateState:", v13);

  }
  else
  {
    v15 = (void *)MEMORY[0x1D17BA0A0](self, a2);
    v16 = self;
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v18 = objc_claimAutoreleasedReturnValue();
      v19 = (void *)v18;
      v20 = CFSTR("Up-To-Date");
      if (a3 == 2)
        v20 = CFSTR("Needs Apply");
      if (a3 == 3)
        v20 = CFSTR("Needs Register");
      v27 = 138543618;
      v28 = v18;
      v29 = 2112;
      v30 = v20;
      v21 = v20;
      _os_log_impl(&dword_1CD062000, v17, OS_LOG_TYPE_ERROR, "%{public}@Unsupported state %@ for Matter Accessory, ignoring.", (uint8_t *)&v27, 0x16u);

    }
    objc_autoreleasePoolPop(v15);
  }
}

- (void)handleAccessoryFirmwareVersionNumberChangedNotification:(id)a3
{
  id v4;
  void *v5;
  HMDAccessoryFirmwareUpdateSession *v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1D17BA0A0]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543362;
    v10 = v8;
    _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_INFO, "%{public}@Received accessory firmware version number updated notification", (uint8_t *)&v9, 0xCu);

  }
  objc_autoreleasePoolPop(v5);
  -[HMDAccessoryFirmwareUpdateSession updateAccessoryFirmwareVersion](v6, "updateAccessoryFirmwareVersion");

}

- (void)handleAccessoryVIDPIDChangedNotification:(id)a3
{
  id v4;
  void *v5;
  HMDAccessoryFirmwareUpdateSession *v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1D17BA0A0]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543362;
    v10 = v8;
    _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_INFO, "%{public}@Received matter VID PID updated notification", (uint8_t *)&v9, 0xCu);

  }
  objc_autoreleasePoolPop(v5);
  -[HMDAccessoryFirmwareUpdateSession updateAccessoryVendorIDAndProductID](v6, "updateAccessoryVendorIDAndProductID");

}

- (void)handleAccessoryFirmwareVersionChangedNotification:(id)a3
{
  id v4;
  void *v5;
  HMDAccessoryFirmwareUpdateSession *v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1D17BA0A0]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543362;
    v10 = v8;
    _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_INFO, "%{public}@Received accessory firmware updated notification", (uint8_t *)&v9, 0xCu);

  }
  objc_autoreleasePoolPop(v5);
  -[HMDAccessoryFirmwareUpdateSession updateAccessoryFirmwareVersion](v6, "updateAccessoryFirmwareVersion");

}

- (BOOL)isAccessoryVersionInSyncWithAssetVersion:(id)a3 matterFirmwareRevisionNumber:(id)a4 assetVersionString:(id)a5 matterFirmwareRevisionString:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  char v15;
  void *v16;
  HMDAccessoryFirmwareUpdateSession *v17;
  NSObject *v18;
  void *v19;
  id v20;
  void *v21;
  char v22;
  void *v23;
  void *v24;
  HMDAccessoryFirmwareUpdateSession *v25;
  NSObject *v26;
  char v27;
  void *v28;
  char v29;
  id v30;
  void *v31;
  HMDAccessoryFirmwareUpdateSession *v32;
  NSObject *v33;
  void *v34;
  id v36;
  id v37;
  char v38;
  uint8_t buf[4];
  void *v40;
  __int16 v41;
  id v42;
  __int16 v43;
  id v44;
  __int16 v45;
  id v46;
  __int16 v47;
  id v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  objc_msgSend(v11, "stringValue");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    v15 = objc_msgSend(v10, "isEqualToValue:", v11);
    v38 = objc_msgSend(v12, "isEqualToString:", v13);
    v16 = (void *)MEMORY[0x1D17BA0A0]();
    v17 = self;
    HMFGetOSLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      HMFBooleanToString();
      v36 = v12;
      v37 = v13;
      v20 = v10;
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      HMFBooleanToString();
      v22 = v15;
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v40 = v19;
      v41 = 2112;
      v42 = v21;
      v43 = 2112;
      v44 = v23;
      _os_log_impl(&dword_1CD062000, v18, OS_LOG_TYPE_INFO, "%{public}@isAccessoryVersionInSyncWithAssetVersion: VersionNumberInSync : %@, VersionStringInSync: %@", buf, 0x20u);

      v15 = v22;
      v10 = v20;
      v12 = v36;
      v13 = v37;

    }
    objc_autoreleasePoolPop(v16);
    v24 = (void *)MEMORY[0x1D17BA0A0]();
    v25 = v17;
    HMFGetOSLogHandle();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v27 = v15;
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544386;
      v40 = v28;
      v41 = 2112;
      v42 = v10;
      v43 = 2112;
      v44 = v11;
      v45 = 2112;
      v46 = v12;
      v47 = 2112;
      v48 = v13;
      _os_log_impl(&dword_1CD062000, v26, OS_LOG_TYPE_INFO, "%{public}@isAccessoryVersionInSyncWithAssetVersion: AssetVersionNumber: %@, MatterFirmwareRevisionNumber: %@, AssetVersionString %@, FirmwareVersionString: %@", buf, 0x34u);

      v15 = v27;
    }

    objc_autoreleasePoolPop(v24);
    v29 = v15 & v38;
  }
  else
  {
    v30 = v10;
    v31 = (void *)MEMORY[0x1D17BA0A0]();
    v32 = self;
    HMFGetOSLogHandle();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v40 = v34;
      v41 = 2112;
      v42 = 0;
      _os_log_impl(&dword_1CD062000, v33, OS_LOG_TYPE_ERROR, "%{public}@Matter firmware version is invalid: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v31);
    v29 = 0;
    v10 = v30;
  }

  return v29;
}

- (void)updateAccessoryFirmwareVersion
{
  NSObject *v3;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  -[HMDAccessoryFirmwareUpdateSession workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __67__HMDAccessoryFirmwareUpdateSession_updateAccessoryFirmwareVersion__block_invoke;
  v4[3] = &unk_1E89BE3F8;
  objc_copyWeak(&v5, &location);
  dispatch_async(v3, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)updateAccessoryStagedFirmwareVersion
{
  NSObject *v3;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  -[HMDAccessoryFirmwareUpdateSession workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __73__HMDAccessoryFirmwareUpdateSession_updateAccessoryStagedFirmwareVersion__block_invoke;
  v4[3] = &unk_1E89BE3F8;
  objc_copyWeak(&v5, &location);
  dispatch_async(v3, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)handleFirmwareUpdateStateChangedNotification:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  -[HMDAccessoryFirmwareUpdateSession workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __82__HMDAccessoryFirmwareUpdateSession_handleFirmwareUpdateStateChangedNotification___block_invoke;
  block[3] = &unk_1E89BE218;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)handleNotReadyReasonsChanged:(id)a3
{
  id v4;
  NSObject *v5;
  _QWORD v6[4];
  id v7;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  -[HMDAccessoryFirmwareUpdateSession workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __66__HMDAccessoryFirmwareUpdateSession_handleNotReadyReasonsChanged___block_invoke;
  v6[3] = &unk_1E89BE3F8;
  objc_copyWeak(&v7, &location);
  dispatch_async(v5, v6);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);

}

- (void)_updateSoftwareUpdateNotReadyReasons
{
  NSObject *v3;
  void *v4;
  void *v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  HMDAccessoryFirmwareUpdateSession *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  uint8_t buf[4];
  void *v46;
  __int16 v47;
  void *v48;
  __int16 v49;
  void *v50;
  __int16 v51;
  void *v52;
  __int16 v53;
  void *v54;
  __int16 v55;
  void *v56;
  __int16 v57;
  void *v58;
  __int16 v59;
  void *v60;
  __int16 v61;
  void *v62;
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  -[HMDAccessoryFirmwareUpdateSession workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[HMDAccessoryFirmwareUpdateSession hapAccessory](self, "hapAccessory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firmwareUpdateProfile");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "softwareUpdate");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "stagingNotReadyReasons");
  v7 = 0;
  if (v6)
  {
    v8 = 1;
    v9 = v6;
    do
    {
      v10 = v9 & 0xFFFFFFFFFFFFFFFBLL;
      v11 = v7 | 4;
      v12 = v9 & 0xFFFFFFFFFFFFFFFDLL;
      v13 = v7 | 2;
      v14 = v9 & 0xFFFFFFFFFFFFFFFELL;
      v15 = v7 | 1;
      if (v8 != 1)
      {
        v15 = v7;
        v14 = v9;
      }
      if (v8 != 2)
      {
        v13 = v15;
        v12 = v14;
      }
      if (v8 != 4)
      {
        v11 = v13;
        v10 = v12;
      }
      if ((v8 & v6) != 0)
      {
        v7 = v11;
        v9 = v10;
      }
      v8 *= 2;
    }
    while (v8 - 1 < v6);
  }
  else
  {
    v9 = 0;
  }
  v16 = (void *)MEMORY[0x1D17BA0A0]();
  HMFGetOSLogHandle();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v9);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v46 = v18;
    v47 = 2112;
    v48 = v19;
    _os_log_impl(&dword_1CD062000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@Unknown stagingNotReadyReasons %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v16);
  v20 = objc_msgSend(v5, "updateNotReadyReasons");
  v21 = 0;
  if (v20)
  {
    v22 = 1;
    v23 = v20;
    do
    {
      if ((v22 & v20) != 0)
      {
        switch(v22)
        {
          case 1:
            v23 &= ~1uLL;
            v21 |= 1uLL;
            break;
          case 2:
            v23 &= ~2uLL;
            v21 |= 2uLL;
            break;
          case 4:
            v23 &= ~4uLL;
            break;
          case 8:
            v23 &= ~8uLL;
            v21 |= 8uLL;
            break;
          default:
            break;
        }
      }
      v22 *= 2;
    }
    while (v22 - 1 < v20);
  }
  else
  {
    v23 = 0;
  }
  v24 = (void *)MEMORY[0x1D17BA0A0]();
  HMFGetOSLogHandle();
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v23);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v46 = v26;
    v47 = 2112;
    v48 = v27;
    _os_log_impl(&dword_1CD062000, v25, OS_LOG_TYPE_DEFAULT, "%{public}@Unknown applyNotReadyReasons %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v24);
  objc_msgSend(v4, "softwareUpdate");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (v28)
  {
    v29 = v21 | v7;
    v30 = (void *)MEMORY[0x1D17BA0A0]();
    v31 = self;
    HMFGetOSLogHandle();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "needsAttentionReasons");
      HMSoftwareUpdateNeedsAttentionReasonsToString();
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = v30;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v44, "needsAttentionReasons"));
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      HMSoftwareUpdateNeedsAttentionReasonsToString();
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v29);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "stagingNotReadyReasons");
      HAPStagingNotReadyReasonsAsString();
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v5, "stagingNotReadyReasons"));
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "updateNotReadyReasons");
      HAPUpdateNotReadyReasonsAsString();
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v5, "updateNotReadyReasons"));
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138545410;
      v46 = v42;
      v47 = 2114;
      v48 = v41;
      v49 = 2114;
      v50 = v40;
      v51 = 2114;
      v52 = v38;
      v53 = 2114;
      v54 = v39;
      v55 = 2114;
      v56 = v37;
      v57 = 2114;
      v58 = v33;
      v59 = 2114;
      v60 = v34;
      v61 = 2114;
      v62 = v35;
      _os_log_impl(&dword_1CD062000, v32, OS_LOG_TYPE_INFO, "%{public}@SoftwareUpdate needsAttentionReasons changed - old %{public}@ (%{public}@) new %{public}@ (%{public}@) staging reasons %{public}@ (%{public}@) apply reasons %{public}@ (%{public}@)", buf, 0x5Cu);

      v30 = v43;
    }

    objc_autoreleasePoolPop(v30);
    objc_msgSend(v4, "softwareUpdate");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setNeedsAttentionReasons:", v29);

  }
}

- (void)updateAccessoryVendorIDAndProductID
{
  NSObject *v3;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  -[HMDAccessoryFirmwareUpdateSession workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __72__HMDAccessoryFirmwareUpdateSession_updateAccessoryVendorIDAndProductID__block_invoke;
  v4[3] = &unk_1E89BE3F8;
  objc_copyWeak(&v5, &location);
  dispatch_async(v3, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (BOOL)isMatterFirmwareUpdateRetryAllowed
{
  return -[HMDAccessoryFirmwareUpdateSession matterFirmwareUpdateRetryCount](self, "matterFirmwareUpdateRetryCount") < 0xA;
}

- (void)incrementMatterFirmwareUpdateRetryCount
{
  void *v3;
  HMDAccessoryFirmwareUpdateSession *v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (-[HMDAccessoryFirmwareUpdateSession isMatterFirmwareUpdateRetryAllowed](self, "isMatterFirmwareUpdateRetryAllowed"))
  {
    v3 = (void *)MEMORY[0x1D17BA0A0](-[HMDAccessoryFirmwareUpdateSession setMatterFirmwareUpdateRetryCount:](self, "setMatterFirmwareUpdateRetryCount:", -[HMDAccessoryFirmwareUpdateSession matterFirmwareUpdateRetryCount](self, "matterFirmwareUpdateRetryCount")+ 1));
    v4 = self;
    HMFGetOSLogHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 138543874;
      v8 = v6;
      v9 = 2048;
      v10 = -[HMDAccessoryFirmwareUpdateSession matterFirmwareUpdateRetryCount](v4, "matterFirmwareUpdateRetryCount");
      v11 = 2048;
      v12 = 10;
      _os_log_impl(&dword_1CD062000, v5, OS_LOG_TYPE_INFO, "%{public}@Matter firmware update retry attempt %lu of %lu", (uint8_t *)&v7, 0x20u);

    }
    objc_autoreleasePoolPop(v3);
  }
}

- (void)resetMatterFirmwareUpdateRetryCount
{
  -[HMDAccessoryFirmwareUpdateSession setMatterFirmwareUpdateRetryCount:](self, "setMatterFirmwareUpdateRetryCount:", 0);
}

- (void)updateAvailableSoftwareUpdate
{
  NSObject *v3;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  -[HMDAccessoryFirmwareUpdateSession workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __66__HMDAccessoryFirmwareUpdateSession_updateAvailableSoftwareUpdate__block_invoke;
  v4[3] = &unk_1E89BE3F8;
  objc_copyWeak(&v5, &location);
  dispatch_async(v3, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)_updateAvailableSoftwareUpdate
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  HMDAccessoryFirmwareUpdateSession *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  HMDAccessoryFirmwareUpdateSession *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  HMDAccessoryFirmwareUpdateSession *v26;
  NSObject *v27;
  void *v28;
  HMDAccessoryFirmwareUpdateSession *v29;
  uint64_t v30;
  void *v31;
  HMDAccessoryFirmwareUpdateSession *v32;
  NSObject *v33;
  void *v34;
  const char *v35;
  BOOL v36;
  uint64_t v37;
  BOOL v38;
  void *v39;
  void *v40;
  void *v41;
  uint8_t buf[4];
  void *v43;
  __int16 v44;
  void *v45;
  __int16 v46;
  void *v47;
  __int16 v48;
  void *v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  -[HMDAccessoryFirmwareUpdateSession workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[HMDAccessoryFirmwareUpdateSession _logDebugStates:](self, "_logDebugStates:", "-[HMDAccessoryFirmwareUpdateSession _updateAvailableSoftwareUpdate]");
  -[HMDAccessoryFirmwareUpdateSession availableSoftwareVersion](self, "availableSoftwareVersion");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessoryFirmwareUpdateSession hapAccessory](self, "hapAccessory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    objc_msgSend(v5, "firmwareUpdateProfile");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDAccessoryFirmwareUpdateSession accessoryVersion](self, "accessoryVersion");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stagedFirmwareVersion");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v8, "isGreaterThanVersion:", v4) & 1) != 0
      || objc_msgSend(v9, "isGreaterThanVersion:", v4))
    {
      v10 = (void *)MEMORY[0x1D17BA0A0]();
      v11 = self;
      HMFGetOSLogHandle();
      v12 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
LABEL_7:

        objc_autoreleasePoolPop(v10);
LABEL_8:

        goto LABEL_12;
      }
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDAccessoryFirmwareUpdateSession accessoryVersion](v11, "accessoryVersion");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v43 = v13;
      v44 = 2112;
      v45 = v4;
      v46 = 2112;
      v47 = v14;
      v48 = 2112;
      v49 = v9;
      _os_log_impl(&dword_1CD062000, v12, OS_LOG_TYPE_INFO, "%{public}@Session available firmware version (%@) is older than either current accessory version (%@) or the staged version (%@)", buf, 0x2Au);

LABEL_6:
      goto LABEL_7;
    }
    if (!objc_msgSend(v6, "supportsCHIP"))
      goto LABEL_39;
    -[HMDAccessoryFirmwareUpdateSession assetID](self, "assetID");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "assetVersionNumber");
    v40 = v7;
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v6, "firmwareVersion");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "numberWithUnsignedInteger:", objc_msgSend(v39, "majorVersion"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDAccessoryFirmwareUpdateSession assetID](self, "assetID");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "assetVersion");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "displayableFirmwareVersion");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = -[HMDAccessoryFirmwareUpdateSession isAccessoryVersionInSyncWithAssetVersion:matterFirmwareRevisionNumber:assetVersionString:matterFirmwareRevisionString:](self, "isAccessoryVersionInSyncWithAssetVersion:matterFirmwareRevisionNumber:assetVersionString:matterFirmwareRevisionString:", v19, v21, v23, v24);

    v7 = v40;
    if (!v38)
    {
      v10 = (void *)MEMORY[0x1D17BA0A0]();
      v11 = self;
      HMFGetOSLogHandle();
      v12 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        goto LABEL_7;
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v43 = v13;
      v35 = "%{public}@Updating Available Software Update: Waiting for version number and version string to be in sync before proceeding";
    }
    else
    {
LABEL_39:
      if (objc_msgSend(v4, "isEqualToVersion:", v8))
      {
        v25 = (void *)MEMORY[0x1D17BA0A0]();
        v26 = self;
        HMFGetOSLogHandle();
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v43 = v28;
          _os_log_impl(&dword_1CD062000, v27, OS_LOG_TYPE_INFO, "%{public}@Session available firmware version is the same as the current accessory version. Software Update has been installed.", buf, 0xCu);

        }
        objc_autoreleasePoolPop(v25);
        v29 = v26;
        v30 = 4;
LABEL_23:
        -[HMDAccessoryFirmwareUpdateSession updateAvailableSoftwareUpdateState:](v29, "updateAvailableSoftwareUpdateState:", v30);
        goto LABEL_8;
      }
      if (objc_msgSend(v4, "isEqualToVersion:", v9))
      {
        v31 = (void *)MEMORY[0x1D17BA0A0]();
        v32 = self;
        HMFGetOSLogHandle();
        v33 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v43 = v34;
          _os_log_impl(&dword_1CD062000, v33, OS_LOG_TYPE_INFO, "%{public}@Session available firmware version is staged on accessory. Software Update has been downloaded.", buf, 0xCu);

        }
        objc_autoreleasePoolPop(v31);
        v29 = v32;
        v30 = 2;
        goto LABEL_23;
      }
      if (v9)
        goto LABEL_8;
      if (!objc_msgSend(v6, "supportsCHIP"))
      {
        v36 = -[HMDAccessoryFirmwareUpdateSession internalState](self, "internalState") != 1
           && -[HMDAccessoryFirmwareUpdateSession internalState](self, "internalState") != 2;
        v37 = objc_msgSend(v7, "updateState");
        if (!v36 && v37 != 4)
          -[HMDAccessoryFirmwareUpdateSession _resetAvailableSoftwareUpdate](self, "_resetAvailableSoftwareUpdate");
        goto LABEL_8;
      }
      v10 = (void *)MEMORY[0x1D17BA0A0]();
      v11 = self;
      HMFGetOSLogHandle();
      v12 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        goto LABEL_7;
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v43 = v13;
      v35 = "%{public}@Not re-setting software update state for matter accessory";
    }
    _os_log_impl(&dword_1CD062000, v12, OS_LOG_TYPE_INFO, v35, buf, 0xCu);
    goto LABEL_6;
  }
  v15 = (void *)MEMORY[0x1D17BA0A0]();
  v16 = self;
  HMFGetOSLogHandle();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v43 = v18;
    _os_log_impl(&dword_1CD062000, v17, OS_LOG_TYPE_DEBUG, "%{public}@firmware version not available in UARP accessory", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v15);
LABEL_12:

}

- (void)_resetAvailableSoftwareUpdate
{
  NSObject *v3;
  void *v4;
  id v5;

  -[HMDAccessoryFirmwareUpdateSession workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[HMDAccessoryFirmwareUpdateSession hapAccessory](self, "hapAccessory");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "softwareUpdate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    objc_msgSend(v5, "updateSoftwareUpdate:completionHandler:", 0, &__block_literal_global_86_121104);

}

- (BOOL)documentationAvailable
{
  void *v2;
  void *v3;
  BOOL v4;

  -[HMDAccessoryFirmwareUpdateSession assetID](self, "assetID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "releaseNotesLocalURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (void)updateAvailableSoftwareUpdateState:(int64_t)a3
{
  NSObject *v5;
  _QWORD v6[6];

  -[HMDAccessoryFirmwareUpdateSession workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __72__HMDAccessoryFirmwareUpdateSession_updateAvailableSoftwareUpdateState___block_invoke;
  v6[3] = &unk_1E89C0B98;
  v6[4] = self;
  v6[5] = a3;
  dispatch_async(v5, v6);

}

- (void)_updateAvailableSoftwareUpdateState:(int64_t)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  HMDAccessoryFirmwareUpdateSession *v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  HMDAccessoryFirmwareUpdateSession *v19;
  NSObject *v20;
  void *v21;
  unint64_t v22;
  const __CFString *v23;
  uint64_t v24;
  HMDAccessoryFirmwareUpdateSession *v25;
  NSObject *v26;
  void *v27;
  unint64_t v28;
  const __CFString *v29;
  void *v30;
  HMDAccessoryFirmwareUpdateSession *v31;
  NSObject *v32;
  void *v33;
  __CFString *v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  int v39;
  void *v40;
  __int16 v41;
  const __CFString *v42;
  __int16 v43;
  void *v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  -[HMDAccessoryFirmwareUpdateSession workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[HMDAccessoryFirmwareUpdateSession hapAccessory](self, "hapAccessory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessoryFirmwareUpdateSession availableSoftwareVersion](self, "availableSoftwareVersion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    v24 = MEMORY[0x1D17BA0A0]();
    v25 = self;
    HMFGetOSLogHandle();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = -[HMDAccessoryFirmwareUpdateSession internalState](v25, "internalState") - 1;
      if (v28 > 4)
        v29 = CFSTR("Up To Date");
      else
        v29 = off_1E89B4FD8[v28];
      HMSoftwareUpdateStateToString();
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = 138543874;
      v40 = v27;
      v41 = 2112;
      v42 = v29;
      v43 = 2112;
      v44 = v36;
      _os_log_impl(&dword_1CD062000, v26, OS_LOG_TYPE_ERROR, "%{public}@Not updating state from %@ to %@ because update firmware version is not set by UARP", (uint8_t *)&v39, 0x20u);

    }
    v37 = (void *)v24;
    goto LABEL_24;
  }
  if (a3 == 2 && -[HMDAccessoryFirmwareUpdateSession isFirmwareVersionUpToDate](self, "isFirmwareVersionUpToDate"))
  {
    v8 = MEMORY[0x1D17BA0A0]();
    v9 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = -[HMDAccessoryFirmwareUpdateSession internalState](v9, "internalState");
      if ((unint64_t)(v12 - 1) > 4)
        v13 = CFSTR("Up To Date");
      else
        v13 = off_1E89B4FD8[v12 - 1];
      v39 = 138543618;
      v40 = v11;
      v41 = 2112;
      v42 = v13;
      _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_DEBUG, "%{public}@Not updating state from %@ to downloaded because firmware version is up to date", (uint8_t *)&v39, 0x16u);

    }
    v37 = (void *)v8;
LABEL_24:
    objc_autoreleasePoolPop(v37);
    goto LABEL_29;
  }
  objc_msgSend(v6, "softwareUpdate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v14
    && (objc_msgSend(v14, "version"),
        v16 = (void *)objc_claimAutoreleasedReturnValue(),
        v17 = objc_msgSend(v7, "isEqualToVersion:", v16),
        v16,
        v17))
  {
    v18 = (void *)MEMORY[0x1D17BA0A0]();
    v19 = self;
    HMFGetOSLogHandle();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = -[HMDAccessoryFirmwareUpdateSession internalState](v19, "internalState") - 1;
      if (v22 > 4)
        v23 = CFSTR("Up To Date");
      else
        v23 = off_1E89B4FD8[v22];
      HMSoftwareUpdateStateToString();
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = 138543874;
      v40 = v21;
      v41 = 2112;
      v42 = v23;
      v43 = 2112;
      v44 = v38;
      _os_log_impl(&dword_1CD062000, v20, OS_LOG_TYPE_INFO, "%{public}@Updating available software update state from %@ to %@", (uint8_t *)&v39, 0x20u);

    }
    objc_autoreleasePoolPop(v18);
    objc_msgSend(v15, "updateLocalState:", a3);
  }
  else
  {
    v30 = (void *)MEMORY[0x1D17BA0A0]();
    v31 = self;
    HMFGetOSLogHandle();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      HMSoftwareUpdateStateToString();
      v34 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v39 = 138543618;
      v40 = v33;
      v41 = 2112;
      v42 = v34;
      _os_log_impl(&dword_1CD062000, v32, OS_LOG_TYPE_INFO, "%{public}@New available software update with state %@", (uint8_t *)&v39, 0x16u);

    }
    objc_autoreleasePoolPop(v30);
    v35 = -[HMDAccessoryFirmwareUpdateSession newSoftwareUpdateWithState:](v31, "newSoftwareUpdateWithState:", a3);
    -[HMDAccessoryFirmwareUpdateSession _updateSoftwareUpdateNotReadyReasons](v31, "_updateSoftwareUpdateNotReadyReasons");
    objc_msgSend(v6, "updateSoftwareUpdate:completionHandler:", v35, &__block_literal_global_87_121102);

  }
LABEL_29:

}

- (void)_updateAvailableSoftwareUpdateDocumentation
{
  void *v3;
  void *v4;
  id v5;
  id v6;

  -[HMDAccessoryFirmwareUpdateSession hapAccessory](self, "hapAccessory");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "softwareUpdate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "documentationMetadata");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
LABEL_5:

      goto LABEL_6;
    }
    if (-[HMDAccessoryFirmwareUpdateSession documentationAvailable](self, "documentationAvailable"))
    {
      v5 = -[HMDAccessoryFirmwareUpdateSession newSoftwareUpdateWithState:](self, "newSoftwareUpdateWithState:", objc_msgSend(v4, "state"));
      -[HMDAccessoryFirmwareUpdateSession _updateSoftwareUpdateNotReadyReasons](self, "_updateSoftwareUpdateNotReadyReasons");
      objc_msgSend(v6, "updateSoftwareUpdate:completionHandler:", v5, &__block_literal_global_88);
      goto LABEL_5;
    }
  }
LABEL_6:

}

- (id)newSoftwareUpdateWithState:(int64_t)a3
{
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned int v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  HMDAccessoryFirmwareUpdateSession *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  HMDAccessoryFirmwareUpdateSession *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  int v34;
  void *v35;
  void *v36;
  HMDSoftwareUpdate *v37;
  void *v38;
  HMDSoftwareUpdate *v39;
  void *v41;
  void *v42;
  void *v43;
  int64_t v44;
  id v45;
  uint64_t v46;
  void *v47;
  void *v48;
  uint8_t buf[4];
  void *v50;
  __int16 v51;
  void *v52;
  __int16 v53;
  void *v54;
  __int16 v55;
  void *v56;
  __int16 v57;
  void *v58;
  __int16 v59;
  void *v60;
  __int16 v61;
  void *v62;
  __int16 v63;
  void *v64;
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  v45 = -[HMDAccessoryFirmwareUpdateSession newDocumentationMetadata](self, "newDocumentationMetadata");
  -[HMDAccessoryFirmwareUpdateSession availableSoftwareVersion](self, "availableSoftwareVersion");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessoryFirmwareUpdateSession hapAccessory](self, "hapAccessory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "supportsCHIP");

  if (v6)
  {
    -[HMDAccessoryFirmwareUpdateSession uarpAccessory](self, "uarpAccessory");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "availableFirmwareVersion");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }
  -[HMDAccessoryFirmwareUpdateSession uarpAccessory](self, "uarpAccessory");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "firmwareUpdateBytesTotal");
  if (v10 <= 1)
    v11 = 1;
  else
    v11 = v10;
  v46 = v11;

  -[HMDAccessoryFirmwareUpdateSession assetID](self, "assetID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "assetReleaseDate");
  v13 = objc_claimAutoreleasedReturnValue();

  v48 = (void *)v13;
  if (!v13)
  {
    v14 = (void *)MEMORY[0x1D17BA0A0]();
    v15 = self;
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDAccessoryFirmwareUpdateSession assetID](v15, "assetID");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v50 = v17;
      v51 = 2112;
      v52 = v18;
      _os_log_impl(&dword_1CD062000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@No release date set for asset, using current date - assetID %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v14);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v19 = (void *)MEMORY[0x1D17BA0A0]();
  v20 = self;
  HMFGetOSLogHandle();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    HMSoftwareUpdateStateToString();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v46);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = v19;
    v25 = (void *)MEMORY[0x1E0CB37E8];
    -[HMDAccessoryFirmwareUpdateSession uarpAccessory](v20, "uarpAccessory");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "numberWithUnsignedInt:", objc_msgSend(v41, "firmwareUpdateBytesTotal"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "URL");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = (void *)MEMORY[0x1E0CB37E8];
    -[HMDAccessoryFirmwareUpdateSession hapAccessory](v20, "hapAccessory");
    v44 = a3;
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "firmwareUpdateProfile");
    v42 = v8;
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "numberWithUnsignedInteger:", objc_msgSend(v30, "updateDuration"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138545154;
    v50 = v22;
    v51 = 2112;
    v52 = v47;
    v53 = 2112;
    v54 = v23;
    v55 = 2112;
    v56 = v24;
    v57 = 2112;
    v58 = v26;
    v59 = 2112;
    v60 = v27;
    v61 = 2112;
    v62 = v48;
    v63 = 2112;
    v64 = v31;
    _os_log_impl(&dword_1CD062000, v21, OS_LOG_TYPE_INFO, "%{public}@Creating SoftwareUpdate with version %@, state %@, downloadSize %@(uarpAccessory downloadSize %@), documentation %@, release date %@, duration %@", buf, 0x52u);

    v8 = v42;
    a3 = v44;

    v19 = v43;
  }

  objc_autoreleasePoolPop(v19);
  -[HMDAccessoryFirmwareUpdateSession hapAccessory](v20, "hapAccessory");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "home");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  if ((_os_feature_enabled_impl() & 1) != 0
    || CFPreferencesGetAppBooleanValue(CFSTR("MatterOTA"), CFSTR("/Library/Managed Preferences/mobile/com.apple.homed.plist"), 0))
  {
    v34 = objc_msgSend(v32, "supportsCHIP");
    if (a3 == 2 && v34 && objc_msgSend(v33, "isAutomaticThirdPartyAccessorySoftwareUpdateEnabled"))
    {
      objc_msgSend(v33, "homeManager");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "matterSoftwareUpdateProviderDelegate");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "notifyUpdateRequestedForHMDHAPAccessory:isUserTriggered:", v32, 0);

    }
  }
  v37 = [HMDSoftwareUpdate alloc];
  objc_msgSend(v32, "firmwareUpdateProfile");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = -[HMDSoftwareUpdate initWithVersion:displayableVersion:downloadSize:state:installDuration:documentationMetadata:releaseDate:](v37, "initWithVersion:displayableVersion:downloadSize:state:installDuration:documentationMetadata:releaseDate:", v47, v8, v46, a3, v45, v48, (double)(unint64_t)objc_msgSend(v38, "updateDuration"));

  return v39;
}

- (id)newDocumentationMetadata
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  HMDAccessoryFirmwareUpdateSession *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  HMDAccessoryFirmwareUpdateSession *v22;
  NSObject *v23;
  void *v24;
  id v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  if (-[HMDAccessoryFirmwareUpdateSession documentationAvailable](self, "documentationAvailable"))
  {
    -[HMDAccessoryFirmwareUpdateSession assetID](self, "assetID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "releaseNotesLocalURL");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    -[HMDAccessoryFirmwareUpdateSession assetID](self, "assetID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "releaseNotesRemoteURL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (documentationMaxSize_onceToken != -1)
      dispatch_once(&documentationMaxSize_onceToken, &__block_literal_global_523);
    objc_msgSend(MEMORY[0x1E0D28678], "sharedPreferences");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (isInternalBuild())
    {
      objc_msgSend(v7, "preferenceForKey:", CFSTR("firmwareUpdateDocumentationMaxSize"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "numberValue");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "unsignedIntValue");

    }
    else
    {
      v10 = 0x200000;
    }

    v26 = 0;
    +[HMDAccessoryFirmwareUpdateSession __calculateDigestDataFromFile:maxDataSize:error:](HMDAccessoryFirmwareUpdateSession, "__calculateDigestDataFromFile:maxDataSize:error:", v4, v10, &v26);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v26;
    if (v17)
    {
      v19 = objc_alloc(MEMORY[0x1E0CBA8B0]);
      v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D28568]), "initWithAlgorithm:value:", 2, v17);
      v16 = (void *)objc_msgSend(v19, "initWithURL:digest:", v6, v20);

    }
    else
    {
      v21 = (void *)MEMORY[0x1D17BA0A0]();
      v22 = self;
      HMFGetOSLogHandle();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v28 = v24;
        v29 = 2112;
        v30 = v4;
        v31 = 2112;
        v32 = v6;
        v33 = 2112;
        v34 = v18;
        _os_log_impl(&dword_1CD062000, v23, OS_LOG_TYPE_ERROR, "%{public}@Couldn't create digest for URLs local %@ remote: %@ error: %@", buf, 0x2Au);

      }
      objc_autoreleasePoolPop(v21);
      v16 = 0;
    }

  }
  else
  {
    v11 = (void *)MEMORY[0x1D17BA0A0]();
    v12 = self;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDAccessoryFirmwareUpdateSession uarpAccessory](v12, "uarpAccessory");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v28 = v14;
      v29 = 2112;
      v30 = v15;
      _os_log_impl(&dword_1CD062000, v13, OS_LOG_TYPE_DEBUG, "%{public}@No documentation available for %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v11);
    return 0;
  }
  return v16;
}

- (BOOL)sendMessageToAccessory:(id)a3 uarpMsg:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  HMDAccessoryFirmwareUpdateSession *v11;
  NSObject *v12;
  void *v13;
  char *v14;
  void *v15;
  int v16;
  void *v17;
  HMDAccessoryFirmwareUpdateSession *v18;
  NSObject *v19;
  void *v20;
  char v21;
  void *v22;
  void *v23;
  void *v24;
  HMDAccessoryFirmwareUpdateSession *v25;
  NSObject *v26;
  void *v27;
  NSObject *workQueue;
  _QWORD block[4];
  id v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  const char *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = (void *)MEMORY[0x1D17BA0A0]();
  v11 = self;
  HMFGetOSLogHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v9, "length"));
    v14 = (char *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v33 = v13;
    v34 = 2112;
    v35 = v14;
    _os_log_impl(&dword_1CD062000, v12, OS_LOG_TYPE_DEBUG, "%{public}@sendMessageToAccessory called with %@ bytes", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v10);
  if (((_os_feature_enabled_impl() & 1) != 0
     || CFPreferencesGetAppBooleanValue(CFSTR("MatterOTA"), CFSTR("/Library/Managed Preferences/mobile/com.apple.homed.plist"), 0))&& (-[HMDAccessoryFirmwareUpdateSession hapAccessory](v11, "hapAccessory"), v15 = (void *)objc_claimAutoreleasedReturnValue(), v16 = objc_msgSend(v15, "supportsCHIP"), v15, v16))
  {
    v17 = (void *)MEMORY[0x1D17BA0A0]();
    v18 = v11;
    HMFGetOSLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v33 = v20;
      v34 = 2080;
      v35 = "-[HMDAccessoryFirmwareUpdateSession sendMessageToAccessory:uarpMsg:error:]";
      _os_log_impl(&dword_1CD062000, v19, OS_LOG_TYPE_ERROR, "%{public}@%s: Matter accessory does not use this function", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v17);
    v21 = 0;
  }
  else
  {
    -[HMDAccessoryFirmwareUpdateSession dataStreamSocket](v11, "dataStreamSocket");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v22;
    if (v22 && !objc_msgSend(v22, "isClosed"))
    {
      objc_initWeak((id *)buf, v11);
      workQueue = v11->_workQueue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __74__HMDAccessoryFirmwareUpdateSession_sendMessageToAccessory_uarpMsg_error___block_invoke;
      block[3] = &unk_1E89BE3F8;
      objc_copyWeak(&v31, (id *)buf);
      dispatch_async(workQueue, block);
      v21 = objc_msgSend(v23, "writeData:error:", v9, a5);
      objc_destroyWeak(&v31);
      objc_destroyWeak((id *)buf);
    }
    else
    {
      if (a5)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:description:reason:suggestion:", 54, 0, CFSTR("Socket not open"), 0);
        *a5 = (id)objc_claimAutoreleasedReturnValue();
      }
      v24 = (void *)MEMORY[0x1D17BA0A0]();
      v25 = v11;
      HMFGetOSLogHandle();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v33 = v27;
        _os_log_impl(&dword_1CD062000, v26, OS_LOG_TYPE_ERROR, "%{public}@sendMessageToAccessory: Socket not open", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v24);
      v21 = 0;
    }

  }
  return v21;
}

- (void)socketDidReceiveData:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  HMDAccessoryFirmwareUpdateSession *v8;
  NSObject *v9;
  void *v10;
  NSObject *workQueue;
  _QWORD v12[4];
  id v13;
  id v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  const char *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (((_os_feature_enabled_impl() & 1) != 0
     || CFPreferencesGetAppBooleanValue(CFSTR("MatterOTA"), CFSTR("/Library/Managed Preferences/mobile/com.apple.homed.plist"), 0))&& (-[HMDAccessoryFirmwareUpdateSession hapAccessory](self, "hapAccessory"), v5 = (void *)objc_claimAutoreleasedReturnValue(), v6 = objc_msgSend(v5, "supportsCHIP"), v5, v6))
  {
    v7 = (void *)MEMORY[0x1D17BA0A0]();
    v8 = self;
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v16 = v10;
      v17 = 2080;
      v18 = "-[HMDAccessoryFirmwareUpdateSession socketDidReceiveData:]";
      _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_ERROR, "%{public}@%s: Matter accessory does not use this function", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
  }
  else
  {
    objc_initWeak((id *)buf, self);
    workQueue = self->_workQueue;
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __58__HMDAccessoryFirmwareUpdateSession_socketDidReceiveData___block_invoke;
    v12[3] = &unk_1E89BE218;
    objc_copyWeak(&v14, (id *)buf);
    v13 = v4;
    dispatch_async(workQueue, v12);

    objc_destroyWeak(&v14);
    objc_destroyWeak((id *)buf);
  }

}

- (void)registerAccessory
{
  NSObject *workQueue;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  workQueue = self->_workQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __54__HMDAccessoryFirmwareUpdateSession_registerAccessory__block_invoke;
  v4[3] = &unk_1E89BE3F8;
  objc_copyWeak(&v5, &location);
  dispatch_async(workQueue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)unregisterAccessory
{
  NSObject *workQueue;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  workQueue = self->_workQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __56__HMDAccessoryFirmwareUpdateSession_unregisterAccessory__block_invoke;
  v4[3] = &unk_1E89BE3F8;
  objc_copyWeak(&v5, &location);
  dispatch_async(workQueue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)_register
{
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  HMDAccessoryFirmwareUpdateSession *v7;
  NSObject *v8;
  void *v9;
  _QWORD v10[5];
  _QWORD v11[5];
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[HMDAccessoryFirmwareUpdateSession workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  if (((_os_feature_enabled_impl() & 1) != 0
     || CFPreferencesGetAppBooleanValue(CFSTR("MatterOTA"), CFSTR("/Library/Managed Preferences/mobile/com.apple.homed.plist"), 0))&& (-[HMDAccessoryFirmwareUpdateSession hapAccessory](self, "hapAccessory"), v4 = (void *)objc_claimAutoreleasedReturnValue(), v5 = objc_msgSend(v4, "supportsCHIP"), v4, v5))
  {
    v6 = (void *)MEMORY[0x1D17BA0A0]();
    v7 = self;
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v13 = v9;
      v14 = 2080;
      v15 = "-[HMDAccessoryFirmwareUpdateSession _register]";
      _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_ERROR, "%{public}@%s: called on accessory that supports Matter", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v6);
    -[HMDAccessoryFirmwareUpdateSession resetMatterFirmwareUpdateRetryCount](v7, "resetMatterFirmwareUpdateRetryCount");
  }
  else
  {
    v10[4] = self;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __46__HMDAccessoryFirmwareUpdateSession__register__block_invoke;
    v11[3] = &unk_1E89C02B8;
    v11[4] = self;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __46__HMDAccessoryFirmwareUpdateSession__register__block_invoke_2;
    v10[3] = &unk_1E89C2350;
    -[HMDAccessoryFirmwareUpdateSession _withOpenSocketDoBlock:error:](self, "_withOpenSocketDoBlock:error:", v11, v10);
  }
}

- (void)assetAvailablityUpdateForAccessory:(id)a3 assetID:(id)a4
{
  id v6;
  id v7;
  NSObject *workQueue;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  workQueue = self->_workQueue;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __80__HMDAccessoryFirmwareUpdateSession_assetAvailablityUpdateForAccessory_assetID___block_invoke;
  v11[3] = &unk_1E89BD988;
  objc_copyWeak(&v14, &location);
  v12 = v7;
  v13 = v6;
  v9 = v6;
  v10 = v7;
  dispatch_async(workQueue, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

- (void)firmwareStagingProgress:(id)a3 assetID:(id)a4 bytesSent:(unint64_t)a5 bytesTotal:(unint64_t)a6
{
  id v10;
  id v11;
  void *v12;
  HMDAccessoryFirmwareUpdateSession *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  __int16 v20;
  id v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = (void *)MEMORY[0x1D17BA0A0]();
  v13 = self;
  HMFGetOSLogHandle();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a5);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a6);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 138544130;
    v19 = v15;
    v20 = 2112;
    v21 = v10;
    v22 = 2112;
    v23 = v16;
    v24 = 2112;
    v25 = v17;
    _os_log_impl(&dword_1CD062000, v14, OS_LOG_TYPE_DEBUG, "%{public}@firmwareStagingProgress called for accessory %@ %@/%@ bytes sent", (uint8_t *)&v18, 0x2Au);

  }
  objc_autoreleasePoolPop(v12);

}

- (void)firmwareStagingComplete:(id)a3 assetID:(id)a4 withStatus:(unint64_t)a5
{
  id v8;
  id v9;
  void *v10;
  HMDAccessoryFirmwareUpdateSession *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  NSObject *workQueue;
  id v16;
  id v17;
  _QWORD block[4];
  id v19;
  id v20;
  id v21[2];
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = (void *)MEMORY[0x1D17BA0A0]();
  v11 = self;
  HMFGetOSLogHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), UARPFirmwareStagingCompletionStatusToString());
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v23 = v13;
    v24 = 2112;
    v25 = v14;
    _os_log_impl(&dword_1CD062000, v12, OS_LOG_TYPE_DEBUG, "%{public}@firmwareStagingComplete called with status %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v10);
  objc_initWeak((id *)buf, v11);
  workQueue = v11->_workQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __80__HMDAccessoryFirmwareUpdateSession_firmwareStagingComplete_assetID_withStatus___block_invoke;
  block[3] = &unk_1E89B4EF0;
  objc_copyWeak(v21, (id *)buf);
  v21[1] = (id)a5;
  v19 = v9;
  v20 = v8;
  v16 = v8;
  v17 = v9;
  dispatch_async(workQueue, block);

  objc_destroyWeak(v21);
  objc_destroyWeak((id *)buf);
}

- (void)firmwareUpdateResult:(id)a3 vendorSpecificStatus:(unsigned int)a4 error:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  unsigned int v15;
  id location;

  v8 = a3;
  v9 = a5;
  objc_initWeak(&location, self);
  -[HMDAccessoryFirmwareUpdateSession workQueue](self, "workQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __85__HMDAccessoryFirmwareUpdateSession_firmwareUpdateResult_vendorSpecificStatus_error___block_invoke;
  v12[3] = &unk_1E89B4F18;
  objc_copyWeak(&v14, &location);
  v13 = v8;
  v15 = a4;
  v11 = v8;
  dispatch_async(v10, v12);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

}

- (void)stagedFirmwareRescindComplete:(id)a3 withStatus:(unint64_t)a4
{
  id v6;
  void *v7;
  int v8;
  void *v9;
  HMDAccessoryFirmwareUpdateSession *v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  _QWORD block[4];
  id v15;
  id v16[2];
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  const char *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (((_os_feature_enabled_impl() & 1) != 0
     || CFPreferencesGetAppBooleanValue(CFSTR("MatterOTA"), CFSTR("/Library/Managed Preferences/mobile/com.apple.homed.plist"), 0))&& (-[HMDAccessoryFirmwareUpdateSession hapAccessory](self, "hapAccessory"), v7 = (void *)objc_claimAutoreleasedReturnValue(), v8 = objc_msgSend(v7, "supportsCHIP"), v7, v8))
  {
    v9 = (void *)MEMORY[0x1D17BA0A0]();
    v10 = self;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v18 = v12;
      v19 = 2080;
      v20 = "-[HMDAccessoryFirmwareUpdateSession stagedFirmwareRescindComplete:withStatus:]";
      _os_log_impl(&dword_1CD062000, v11, OS_LOG_TYPE_INFO, "%{public}@%s: Matter Accessory responsible for staging firmware. No action taken.", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v9);
  }
  else
  {
    objc_initWeak((id *)buf, self);
    -[HMDAccessoryFirmwareUpdateSession workQueue](self, "workQueue");
    v13 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __78__HMDAccessoryFirmwareUpdateSession_stagedFirmwareRescindComplete_withStatus___block_invoke;
    block[3] = &unk_1E89BD1B8;
    objc_copyWeak(v16, (id *)buf);
    v16[1] = (id)a4;
    v15 = v6;
    dispatch_async(v13, block);

    objc_destroyWeak(v16);
    objc_destroyWeak((id *)buf);
  }

}

- (void)timerDidFire:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  int v9;
  void *v10;
  int v11;
  void *v12;
  int v13;
  void *v14;
  int v15;
  void *v16;
  HMDAccessoryFirmwareUpdateSession *v17;
  NSObject *v18;
  void *v19;
  int v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDAccessoryFirmwareUpdateSession workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[HMDAccessoryFirmwareUpdateSession allowedApplyDurationTimer](self, "allowedApplyDurationTimer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "isEqual:", v6);

  if (v7)
  {
    -[HMDAccessoryFirmwareUpdateSession _logApplyEventWithStatus:](self, "_logApplyEventWithStatus:", 2);
    -[HMDAccessoryFirmwareUpdateSession _handleApplyTimerFired](self, "_handleApplyTimerFired");
  }
  else
  {
    -[HMDAccessoryFirmwareUpdateSession expectedApplyDurationTimer](self, "expectedApplyDurationTimer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v4, "isEqual:", v8);

    if (v9)
    {
      -[HMDAccessoryFirmwareUpdateSession _logApplyEventWithStatus:](self, "_logApplyEventWithStatus:", 1);
    }
    else
    {
      -[HMDAccessoryFirmwareUpdateSession socketIdleTimer](self, "socketIdleTimer");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v4, "isEqual:", v10);

      if (v11)
      {
        -[HMDAccessoryFirmwareUpdateSession _handleSocketTimeout](self, "_handleSocketTimeout");
      }
      else
      {
        -[HMDAccessoryFirmwareUpdateSession queryFirmwareUpdateResultDurationTimer](self, "queryFirmwareUpdateResultDurationTimer");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v4, "isEqual:", v12);

        if (v13)
        {
          -[HMDAccessoryFirmwareUpdateSession _handleQueryFirmwareUpdateResultTimeout](self, "_handleQueryFirmwareUpdateResultTimeout");
        }
        else
        {
          -[HMDAccessoryFirmwareUpdateSession registerFailureRetryTimer](self, "registerFailureRetryTimer");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v4, "isEqual:", v14);

          if (v15)
          {
            -[HMDAccessoryFirmwareUpdateSession _handleRegisterFailureRetryTimeout](self, "_handleRegisterFailureRetryTimeout");
          }
          else
          {
            v16 = (void *)MEMORY[0x1D17BA0A0]();
            v17 = self;
            HMFGetOSLogHandle();
            v18 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
            {
              HMFGetLogIdentifier();
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              v20 = 138543362;
              v21 = v19;
              _os_log_impl(&dword_1CD062000, v18, OS_LOG_TYPE_ERROR, "%{public}@Unknown timer", (uint8_t *)&v20, 0xCu);

            }
            objc_autoreleasePoolPop(v16);
          }
        }
      }
    }
  }

}

- (void)_logApplyEventWithStatus:(int64_t)a3
{
  NSObject *v5;
  double v6;
  unint64_t v7;
  double v8;
  unint64_t v9;
  HMDAccessoryMetricVendorDetails *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  -[HMDAccessoryFirmwareUpdateSession workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[HMDAccessoryFirmwareUpdateSession _expectedApplyDuration](self, "_expectedApplyDuration");
  v7 = (unint64_t)v6;
  -[HMDAccessoryFirmwareUpdateSession _allowedApplyDuration](self, "_allowedApplyDuration");
  v9 = (unint64_t)v8;
  -[HMDAccessoryFirmwareUpdateSession hapAccessory](self, "hapAccessory");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  v10 = -[HMDAccessoryMetricVendorDetails initWithAccessory:]([HMDAccessoryMetricVendorDetails alloc], "initWithAccessory:", v15);
  objc_msgSend(v15, "firmwareUpdateProfile");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stagedFirmwareVersion");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDAccessorySoftwareUpdateApplyEvent eventWithMetricVendorDetails:stagedVersion:advertisedDuration:totalAllowedDuration:status:](HMDAccessorySoftwareUpdateApplyEvent, "eventWithMetricVendorDetails:stagedVersion:advertisedDuration:totalAllowedDuration:status:", v10, v12, v7, v9, a3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  +[HMDMetricsManager sharedLogEventSubmitter](HMDMetricsManager, "sharedLogEventSubmitter");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "submitLogEvent:", v13);

}

- (void)_verifyUpdateComplete
{
  NSObject *v3;
  void *v4;
  HMDAccessoryFirmwareUpdateSession *v5;
  NSObject *v6;
  void *v7;
  const char *v8;
  _QWORD v9[5];
  _QWORD v10[5];
  uint8_t buf[4];
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  -[HMDAccessoryFirmwareUpdateSession workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  if (-[HMDAccessoryFirmwareUpdateSession isVerifyingUpdate](self, "isVerifyingUpdate"))
  {
    v4 = (void *)MEMORY[0x1D17BA0A0]();
    v5 = self;
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v12 = v7;
      v8 = "%{public}@Verification already in progress";
LABEL_4:
      _os_log_impl(&dword_1CD062000, v6, OS_LOG_TYPE_INFO, v8, buf, 0xCu);

    }
  }
  else
  {
    if (-[HMDAccessoryFirmwareUpdateSession internalState](self, "internalState") != 4)
    {
      -[HMDAccessoryFirmwareUpdateSession _schedule](self, "_schedule");
      return;
    }
    if (-[HMDAccessoryFirmwareUpdateSession isFirmwareVersionUpToDate](self, "isFirmwareVersionUpToDate"))
    {
      -[HMDAccessoryFirmwareUpdateSession setUserInitiatedInstall:](self, "setUserInitiatedInstall:", 0);
      -[HMDAccessoryFirmwareUpdateSession setIsVerifyingUpdate:](self, "setIsVerifyingUpdate:", 1);
      v9[4] = self;
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __58__HMDAccessoryFirmwareUpdateSession__verifyUpdateComplete__block_invoke;
      v10[3] = &unk_1E89C02B8;
      v10[4] = self;
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __58__HMDAccessoryFirmwareUpdateSession__verifyUpdateComplete__block_invoke_107;
      v9[3] = &unk_1E89C2350;
      -[HMDAccessoryFirmwareUpdateSession _withOpenSocketDoBlock:error:](self, "_withOpenSocketDoBlock:error:", v10, v9);
      return;
    }
    v4 = (void *)MEMORY[0x1D17BA0A0]();
    v5 = self;
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v12 = v7;
      v8 = "%{public}@Firmware is not up to date. Skipping update complete verification";
      goto LABEL_4;
    }
  }

  objc_autoreleasePoolPop(v4);
}

- (void)_handleApplyTimerFired
{
  NSObject *v3;
  _BOOL4 v4;
  void *v5;
  HMDAccessoryFirmwareUpdateSession *v6;
  NSObject *v7;
  void *v8;
  const __CFString *v9;
  _BOOL4 v10;
  const __CFString *v11;
  void *v12;
  HMDAccessoryFirmwareUpdateSession *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  BOOL v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  const __CFString *v24;
  __int16 v25;
  const __CFString *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  -[HMDAccessoryFirmwareUpdateSession workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  v4 = -[HMDAccessoryFirmwareUpdateSession isUserInitiatedInstall](self, "isUserInitiatedInstall");
  v5 = (void *)MEMORY[0x1D17BA0A0](-[HMDAccessoryFirmwareUpdateSession setUserInitiatedInstall:](self, "setUserInitiatedInstall:", 0));
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
      v9 = CFSTR("manual");
    else
      v9 = CFSTR("automatic");
    v10 = -[HMDAccessoryFirmwareUpdateSession remoteApplyInProgress](v6, "remoteApplyInProgress");
    v11 = CFSTR("local");
    *(_DWORD *)buf = 138543874;
    v22 = v8;
    v23 = 2112;
    if (v10)
      v11 = CFSTR("remote");
    v24 = v9;
    v25 = 2112;
    v26 = v11;
    _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@Apply timer fired for %@ %@ install", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v5);
  -[HMDAccessoryFirmwareUpdateSession _logDebugStates:](v6, "_logDebugStates:", "-[HMDAccessoryFirmwareUpdateSession _handleApplyTimerFired]");
  -[HMDAccessoryFirmwareUpdateSession _cancelApplyTimer](v6, "_cancelApplyTimer");
  if (-[HMDAccessoryFirmwareUpdateSession isFirmwareVersionUpToDate](v6, "isFirmwareVersionUpToDate"))
  {
    v12 = (void *)MEMORY[0x1D17BA0A0]();
    v13 = v6;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v22 = v15;
      _os_log_impl(&dword_1CD062000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@Firmware is up to date", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v12);
  }
  else
  {
    objc_initWeak((id *)buf, v6);
    -[HMDAccessoryFirmwareUpdateSession hapAccessory](v6, "hapAccessory");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "firmwareUpdateProfile");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __59__HMDAccessoryFirmwareUpdateSession__handleApplyTimerFired__block_invoke;
    v18[3] = &unk_1E89BCB70;
    objc_copyWeak(&v19, (id *)buf);
    v20 = v4;
    objc_msgSend(v17, "updateProfileWithCompletion:", v18);

    objc_destroyWeak(&v19);
    objc_destroyWeak((id *)buf);
  }
}

- (void)socketDidClose:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  HMDAccessoryFirmwareUpdateSession *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  HMDAccessoryFirmwareUpdateSession *v13;
  NSObject *v14;
  void *v15;
  unint64_t v16;
  const __CFString *v17;
  void *v18;
  const __CFString *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  char v26;
  void *v27;
  HMDAccessoryFirmwareUpdateSession *v28;
  NSObject *v29;
  NSObject *v30;
  void *v31;
  const char *v32;
  NSObject *v33;
  os_log_type_t v34;
  void *v35;
  void *v36;
  int v37;
  void *v38;
  HMDAccessoryFirmwareUpdateSession *v39;
  NSObject *v40;
  void *v41;
  _BYTE v42[22];
  __int16 v43;
  const __CFString *v44;
  __int16 v45;
  void *v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDAccessoryFirmwareUpdateSession workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  if ((_os_feature_enabled_impl() & 1) == 0
    && !CFPreferencesGetAppBooleanValue(CFSTR("MatterOTA"), CFSTR("/Library/Managed Preferences/mobile/com.apple.homed.plist"), 0)|| (-[HMDAccessoryFirmwareUpdateSession hapAccessory](self, "hapAccessory"), v6 = (void *)objc_claimAutoreleasedReturnValue(), v7 = objc_msgSend(v6, "supportsCHIP"), v6, !v7))
  {
    v12 = (void *)MEMORY[0x1D17BA0A0]();
    v13 = self;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = -[HMDAccessoryFirmwareUpdateSession internalState](v13, "internalState") - 1;
      if (v16 > 4)
        v17 = CFSTR("Up To Date");
      else
        v17 = off_1E89B4FD8[v16];
      -[HMDAccessoryFirmwareUpdateSession hapAccessory](v13, "hapAccessory");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v18, "isReachable"))
        v19 = &stru_1E89C3E38;
      else
        v19 = CFSTR("unreachable ");
      -[HMDAccessoryFirmwareUpdateSession hapAccessory](v13, "hapAccessory");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v42 = 138544130;
      *(_QWORD *)&v42[4] = v15;
      *(_WORD *)&v42[12] = 2112;
      *(_QWORD *)&v42[14] = v17;
      v43 = 2112;
      v44 = v19;
      v45 = 2112;
      v46 = v20;
      _os_log_impl(&dword_1CD062000, v14, OS_LOG_TYPE_INFO, "%{public}@HDS socket closed in state %@ for %@accessory %@", v42, 0x2Au);

    }
    objc_autoreleasePoolPop(v12);
    -[HMDAccessoryFirmwareUpdateSession _cancelSocketIdleTimer](v13, "_cancelSocketIdleTimer");
    -[HMDAccessoryFirmwareUpdateSession setDataStreamSocket:](v13, "setDataStreamSocket:", 0);
    -[HMDAccessoryFirmwareUpdateSession hapAccessory](v13, "hapAccessory");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    HAPStringFromAccessoryServerSession();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "deregisterFromSessionRestore:", v22);

    -[HMDAccessoryFirmwareUpdateSession accessoryFirmwareUpdateManager](v13, "accessoryFirmwareUpdateManager");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "UARPControllerForAccessory:", v21);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    -[HMDAccessoryFirmwareUpdateSession uarpAccessory](v13, "uarpAccessory");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v24, "accessoryUnreachable:", v25);

    v27 = (void *)MEMORY[0x1D17BA0A0]();
    v28 = v13;
    HMFGetOSLogHandle();
    v29 = objc_claimAutoreleasedReturnValue();
    v30 = v29;
    if ((v26 & 1) != 0)
    {
      if (!os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
        goto LABEL_21;
      HMFGetLogIdentifier();
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v42 = 138543362;
      *(_QWORD *)&v42[4] = v31;
      v32 = "%{public}@Notified UARP accessory unreacheable";
      v33 = v30;
      v34 = OS_LOG_TYPE_INFO;
    }
    else
    {
      if (!os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        goto LABEL_21;
      HMFGetLogIdentifier();
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v42 = 138543362;
      *(_QWORD *)&v42[4] = v31;
      v32 = "%{public}@Failed to notify about unreachable accessory to UARP controller";
      v33 = v30;
      v34 = OS_LOG_TYPE_ERROR;
    }
    _os_log_impl(&dword_1CD062000, v33, v34, v32, v42, 0xCu);

LABEL_21:
    objc_autoreleasePoolPop(v27);
    -[HMDAccessoryFirmwareUpdateSession logEventManager](v28, "logEventManager");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[HMDAccessoryFirmwareUpdateSession internalState](v28, "internalState") == 2)
    {
      objc_msgSend(v35, "stopStagingWithAccessory:", v21);
    }
    else if (-[HMDAccessoryFirmwareUpdateSession internalState](v28, "internalState") == 4)
    {
      -[HMDAccessoryFirmwareUpdateSession allowedApplyDurationTimer](v28, "allowedApplyDurationTimer");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = objc_msgSend(v36, "isRunning");

      if (v37)
      {
        objc_msgSend(v35, "stopApplyWithAccessory:", v21);
LABEL_32:

        goto LABEL_33;
      }
    }
    else if (-[HMDAccessoryFirmwareUpdateSession internalState](v28, "internalState") == 5
           && -[HMDAccessoryFirmwareUpdateSession isFirmwareVersionUpToDate](v28, "isFirmwareVersionUpToDate"))
    {
      v38 = (void *)MEMORY[0x1D17BA0A0]();
      v39 = v28;
      HMFGetOSLogHandle();
      v40 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v42 = 138543362;
        *(_QWORD *)&v42[4] = v41;
        _os_log_impl(&dword_1CD062000, v40, OS_LOG_TYPE_DEFAULT, "%{public}@Registration complete", v42, 0xCu);

      }
      objc_autoreleasePoolPop(v38);
      -[HMDAccessoryFirmwareUpdateSession _endSession](v39, "_endSession");
    }
    -[HMDAccessoryFirmwareUpdateSession _schedule](v28, "_schedule", *(_OWORD *)v42);
    goto LABEL_32;
  }
  v8 = (void *)MEMORY[0x1D17BA0A0]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v42 = 138543618;
    *(_QWORD *)&v42[4] = v11;
    *(_WORD *)&v42[12] = 2080;
    *(_QWORD *)&v42[14] = "-[HMDAccessoryFirmwareUpdateSession socketDidClose:]";
    _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_ERROR, "%{public}@%s: Matter accessory does not use this function", v42, 0x16u);

  }
  objc_autoreleasePoolPop(v8);
LABEL_33:

}

- (void)socket:(id)a3 didFailWithError:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMDAccessoryFirmwareUpdateSession *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  id v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1D17BA0A0]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "isClosed");
    HMFBooleanToString();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDAccessoryFirmwareUpdateSession hapAccessory](v9, "hapAccessory");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138544386;
    v15 = v11;
    v16 = 2112;
    v17 = v6;
    v18 = 2112;
    v19 = v12;
    v20 = 2112;
    v21 = v13;
    v22 = 2112;
    v23 = v7;
    _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_ERROR, "%{public}@HDS socket %@ closed: %@ failed for accessory %@ with error %@", (uint8_t *)&v14, 0x34u);

  }
  objc_autoreleasePoolPop(v8);
  if (v6 && objc_msgSend(v6, "isClosed"))
    -[HMDAccessoryFirmwareUpdateSession socketDidClose:](v9, "socketDidClose:", v6);
  else
    objc_msgSend(v6, "close");

}

- (void)logDebugStates
{
  NSObject *v3;
  _QWORD block[5];

  -[HMDAccessoryFirmwareUpdateSession workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__HMDAccessoryFirmwareUpdateSession_logDebugStates__block_invoke;
  block[3] = &unk_1E89C2730;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)_logDebugStates:(const char *)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  HMDAccessoryFirmwareUpdateSession *v14;
  NSObject *v15;
  uint64_t v16;
  const __CFString *v17;
  const __CFString *v18;
  void *v19;
  id v20;
  __CFString *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  const __CFString *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  const __CFString *v40;
  __int16 v41;
  uint64_t v42;
  __int16 v43;
  id v44;
  __int16 v45;
  __CFString *v46;
  __int16 v47;
  void *v48;
  __int16 v49;
  void *v50;
  __int16 v51;
  void *v52;
  __int16 v53;
  void *v54;
  __int16 v55;
  void *v56;
  __int16 v57;
  void *v58;
  __int16 v59;
  void *v60;
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  -[HMDAccessoryFirmwareUpdateSession workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[HMDAccessoryFirmwareUpdateSession hapAccessory](self, "hapAccessory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firmwareUpdateProfile");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessoryFirmwareUpdateSession accessoryVersion](self, "accessoryVersion");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firmwareUpdateProfile");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stagedFirmwareVersion");
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMDAccessoryFirmwareUpdateSession availableSoftwareVersion](self, "availableSoftwareVersion");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[HMDAccessoryFirmwareUpdateSession nextStateToSchedule](self, "nextStateToSchedule");
  objc_msgSend(v6, "softwareUpdate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessoryFirmwareUpdateSession assetID](self, "assetID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "assetVersion");
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)MEMORY[0x1D17BA0A0]();
  v14 = self;
  HMFGetOSLogHandle();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a3);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[HMDAccessoryFirmwareUpdateSession internalState](v14, "internalState");
    if ((unint64_t)(v16 - 1) > 4)
      v17 = CFSTR("Up To Date");
    else
      v17 = off_1E89B4FD8[v16 - 1];
    v26 = v17;
    v30 = v8;
    if (v10 - 1 > 4)
      v18 = CFSTR("Up To Date");
    else
      v18 = off_1E89B4FD8[v10 - 1];
    objc_msgSend(v6, "firmwareUpdateProfile", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "updateState");
    HAPFirmwareUpdateStateAsString();
    v20 = (id)objc_claimAutoreleasedReturnValue();
    v31 = v7;
    v27 = v13;
    if (v11)
    {
      objc_msgSend(v11, "state");
      HMSoftwareUpdateStateToString();
      v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v21 = CFSTR("NA");
    }
    -[HMDAccessoryFirmwareUpdateSession lastStagedVersion](v14, "lastStagedVersion");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "stagingNotReadyReasons");
    HAPStagingNotReadyReasonsAsString();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "updateNotReadyReasons");
    HAPUpdateNotReadyReasonsAsString();
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138546434;
    v36 = v29;
    v37 = 2112;
    v38 = v28;
    v39 = 2112;
    v40 = v26;
    v41 = 2112;
    v42 = v25;
    v43 = 2112;
    v44 = v20;
    v45 = 2112;
    v46 = v21;
    v47 = 2112;
    v48 = v33;
    v49 = 2112;
    v50 = v34;
    v51 = 2112;
    v52 = v22;
    v53 = 2112;
    v54 = v30;
    v55 = 2114;
    v56 = v32;
    v57 = 2114;
    v58 = v23;
    v59 = 2114;
    v60 = v24;
    _os_log_impl(&dword_1CD062000, v15, OS_LOG_TYPE_INFO, "%{public}@%@ States <Session internal %@, next %@, accessory %@, SU %@> Versions <available %@, staged %@ (last %@), accessory %@, asset %{public}@> Not Ready Reasons <Stage (%{public}@) Apply (%{public}@)>", buf, 0x84u);

    if (v11)
    v8 = v30;
    v7 = v31;
    v13 = v27;
  }

  objc_autoreleasePoolPop(v13);
}

- (id)logIdentifier
{
  void *v2;
  void *v3;

  -[HMDAccessoryFirmwareUpdateSession hapAccessory](self, "hapAccessory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "logIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSString)description
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[HMDAccessoryFirmwareUpdateSession hapAccessory](self, "hapAccessory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0CB3940];
  if (objc_msgSend(v2, "isAppleAccessory"))
    objc_msgSend(v2, "model");
  else
    objc_msgSend(v2, "productData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("Session for %@.%@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (id)privateDescription
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[HMDAccessoryFirmwareUpdateSession hapAccessory](self, "hapAccessory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  if (objc_msgSend(v2, "isAppleAccessory"))
    objc_msgSend(v2, "model");
  else
    objc_msgSend(v2, "productData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %@.%@>"), v4, v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)rescindStagedAsset:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  HMDAccessoryFirmwareUpdateSession *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  _QWORD v15[5];
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDAccessoryFirmwareUpdateSession workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[HMDAccessoryFirmwareUpdateSession _logDebugStates:](self, "_logDebugStates:", "-[HMDAccessoryFirmwareUpdateSession rescindStagedAsset:]");
  -[HMDAccessoryFirmwareUpdateSession hapAccessory](self, "hapAccessory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firmwareUpdateProfile");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stagedFirmwareVersion");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = MEMORY[0x1E0C809B0];
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __56__HMDAccessoryFirmwareUpdateSession_rescindStagedAsset___block_invoke;
    v17[3] = &unk_1E89B4F60;
    v17[4] = self;
    v18 = v6;
    v19 = v4;
    v15[0] = v9;
    v15[1] = 3221225472;
    v15[2] = __56__HMDAccessoryFirmwareUpdateSession_rescindStagedAsset___block_invoke_135;
    v15[3] = &unk_1E89BFC88;
    v15[4] = self;
    v16 = v19;
    -[HMDAccessoryFirmwareUpdateSession _withOpenSocketDoBlock:error:](self, "_withOpenSocketDoBlock:error:", v17, v15);

  }
  else
  {
    v10 = (void *)MEMORY[0x1D17BA0A0]();
    v11 = self;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v21 = v13;
      v22 = 2112;
      v23 = v6;
      _os_log_impl(&dword_1CD062000, v12, OS_LOG_TYPE_ERROR, "%{public}@No staged firmware in accessory %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v10);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:description:reason:suggestion:", 3, 0, CFSTR("No staged firmware in accessory"), 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v4 + 2))(v4, v14);

  }
}

- (HMFTimer)allowedApplyDurationTimer
{
  return self->_allowedApplyDurationTimer;
}

- (void)setAllowedApplyDurationTimer:(id)a3
{
  objc_storeStrong((id *)&self->_allowedApplyDurationTimer, a3);
}

- (BOOL)assetOfferedForCurrentDataStream
{
  return self->_assetOfferedForCurrentDataStream;
}

- (void)setAssetOfferedForCurrentDataStream:(BOOL)a3
{
  self->_assetOfferedForCurrentDataStream = a3;
}

- (HMFTimer)expectedApplyDurationTimer
{
  return self->_expectedApplyDurationTimer;
}

- (void)setExpectedApplyDurationTimer:(id)a3
{
  objc_storeStrong((id *)&self->_expectedApplyDurationTimer, a3);
}

- (HMDHAPAccessory)hapAccessory
{
  return (HMDHAPAccessory *)objc_loadWeakRetained((id *)&self->_hapAccessory);
}

- (HMFTimer)queryFirmwareUpdateResultDurationTimer
{
  return self->_queryFirmwareUpdateResultDurationTimer;
}

- (void)setQueryFirmwareUpdateResultDurationTimer:(id)a3
{
  objc_storeStrong((id *)&self->_queryFirmwareUpdateResultDurationTimer, a3);
}

- (HMFTimer)socketIdleTimer
{
  return self->_socketIdleTimer;
}

- (void)setSocketIdleTimer:(id)a3
{
  objc_storeStrong((id *)&self->_socketIdleTimer, a3);
}

- (HMDAccessoryFirmwareUpdateSessionWingman)wingman
{
  return (HMDAccessoryFirmwareUpdateSessionWingman *)objc_getProperty(self, a2, 80, 1);
}

- (BOOL)dataStreamOpenInProgress
{
  return self->_dataStreamOpenInProgress;
}

- (void)setDataStreamOpenInProgress:(BOOL)a3
{
  self->_dataStreamOpenInProgress = a3;
}

- (HMDAccessoryFirmwareUpdateManager)accessoryFirmwareUpdateManager
{
  return (HMDAccessoryFirmwareUpdateManager *)objc_loadWeakRetained((id *)&self->_accessoryFirmwareUpdateManager);
}

- (HMDAccessoryFirmwareUpdateConcurrencyLogEventManager)logEventManager
{
  return (HMDAccessoryFirmwareUpdateConcurrencyLogEventManager *)objc_loadWeakRetained((id *)&self->_logEventManager);
}

- (UARPAccessory)uarpAccessory
{
  return (UARPAccessory *)objc_getProperty(self, a2, 104, 1);
}

- (UARPAssetID)assetID
{
  return (UARPAssetID *)objc_getProperty(self, a2, 112, 1);
}

- (void)setAssetID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 112);
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 120, 1);
}

- (HMDAccessoryFirmwareUpdateScheduler)updateScheduler
{
  return self->_updateScheduler;
}

- (void)setUpdateScheduler:(id)a3
{
  objc_storeStrong((id *)&self->_updateScheduler, a3);
}

- (HMFTimer)registerFailureRetryTimer
{
  return self->_registerFailureRetryTimer;
}

- (void)setRegisterFailureRetryTimer:(id)a3
{
  objc_storeStrong((id *)&self->_registerFailureRetryTimer, a3);
}

- (BOOL)remoteApplyInProgress
{
  return self->_remoteApplyInProgress;
}

- (void)setRemoteApplyInProgress:(BOOL)a3
{
  self->_remoteApplyInProgress = a3;
}

- (BOOL)isVerifyingUpdate
{
  return self->_isVerifyingUpdate;
}

- (void)setIsVerifyingUpdate:(BOOL)a3
{
  self->_isVerifyingUpdate = a3;
}

- (unint64_t)currentAutomaticApplyRetriesCount
{
  return self->_currentAutomaticApplyRetriesCount;
}

- (void)setCurrentAutomaticApplyRetriesCount:(unint64_t)a3
{
  self->_currentAutomaticApplyRetriesCount = a3;
}

- (unint64_t)currentCommunicationErrorCount
{
  return self->_currentCommunicationErrorCount;
}

- (void)setCurrentCommunicationErrorCount:(unint64_t)a3
{
  self->_currentCommunicationErrorCount = a3;
}

- (HMFSoftwareVersion)lastStagedVersion
{
  return self->_lastStagedVersion;
}

- (void)setLastStagedVersion:(id)a3
{
  objc_storeStrong((id *)&self->_lastStagedVersion, a3);
}

- (unint64_t)matterFirmwareUpdateRetryCount
{
  return self->_matterFirmwareUpdateRetryCount;
}

- (void)setMatterFirmwareUpdateRetryCount:(unint64_t)a3
{
  self->_matterFirmwareUpdateRetryCount = a3;
}

- (unint64_t)applyHDSRetryCount
{
  return self->_applyHDSRetryCount;
}

- (void)setApplyHDSRetryCount:(unint64_t)a3
{
  self->_applyHDSRetryCount = a3;
}

- (unint64_t)currentRegisterFailureCount
{
  return self->_currentRegisterFailureCount;
}

- (void)setCurrentRegisterFailureCount:(unint64_t)a3
{
  self->_currentRegisterFailureCount = a3;
}

- (id)registerFailureRetryTimerFactory
{
  return objc_getProperty(self, a2, 192, 1);
}

- (void)setRegisterFailureRetryTimerFactory:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 192);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_registerFailureRetryTimerFactory, 0);
  objc_storeStrong((id *)&self->_lastStagedVersion, 0);
  objc_storeStrong((id *)&self->_registerFailureRetryTimer, 0);
  objc_storeStrong((id *)&self->_updateScheduler, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_assetID, 0);
  objc_storeStrong((id *)&self->_uarpAccessory, 0);
  objc_destroyWeak((id *)&self->_logEventManager);
  objc_destroyWeak((id *)&self->_accessoryFirmwareUpdateManager);
  objc_storeStrong((id *)&self->_wingman, 0);
  objc_storeStrong((id *)&self->_socketIdleTimer, 0);
  objc_storeStrong((id *)&self->_queryFirmwareUpdateResultDurationTimer, 0);
  objc_destroyWeak((id *)&self->_hapAccessory);
  objc_storeStrong((id *)&self->_expectedApplyDurationTimer, 0);
  objc_storeStrong((id *)&self->_dataStreamSocket, 0);
  objc_storeStrong((id *)&self->_allowedApplyDurationTimer, 0);
}

void __56__HMDAccessoryFirmwareUpdateSession_rescindStagedAsset___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "accessoryFirmwareUpdateManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "UARPAccessoryForHMDAccessory:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "UARPControllerForAccessory:", *(_QWORD *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "rescindStagedFirmwareOnAccessoryList:withUserIntent:", v5, 1);

  if ((v6 & 1) != 0)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    v7 = (void *)MEMORY[0x1D17BA0A0]();
    v8 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543618;
      v13 = v10;
      v14 = 2112;
      v15 = v3;
      _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_ERROR, "%{public}@Failed to rescind staged firmware for UARP accessory %@", (uint8_t *)&v12, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:description:reason:suggestion:", 58, 0, CFSTR("Failed to rescind staged firmware for UARP accessory %@"), 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

  }
}

void __56__HMDAccessoryFirmwareUpdateSession_rescindStagedAsset___block_invoke_135(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)MEMORY[0x1D17BA0A0]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543618;
    v9 = v7;
    v10 = 2112;
    v11 = v3;
    _os_log_impl(&dword_1CD062000, v6, OS_LOG_TYPE_ERROR, "%{public}@Error opening socket for UARP communication: %@", (uint8_t *)&v8, 0x16u);

  }
  objc_autoreleasePoolPop(v4);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

uint64_t __51__HMDAccessoryFirmwareUpdateSession_logDebugStates__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1D17BA0A0]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "hapAccessory");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "assetID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "hapAccessory");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "isAutomaticThirdPartyAccessorySoftwareUpdateEnabled");
    HMFBooleanToString();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138544130;
    v12 = v5;
    v13 = 2112;
    v14 = v6;
    v15 = 2112;
    v16 = v7;
    v17 = 2112;
    v18 = v9;
    _os_log_impl(&dword_1CD062000, v4, OS_LOG_TYPE_INFO, "%{public}@Accessory: %@, asset: %@, auto update: %@", (uint8_t *)&v11, 0x2Au);

  }
  objc_autoreleasePoolPop(v2);
  return objc_msgSend(*(id *)(a1 + 32), "_logDebugStates:", "\t");
}

void __59__HMDAccessoryFirmwareUpdateSession__handleApplyTimerFired__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  int v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  dispatch_time_t v14;
  NSObject *v15;
  _QWORD block[5];
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (objc_msgSend(WeakRetained, "isFirmwareVersionUpToDate"))
  {
    objc_msgSend(WeakRetained, "_verifyUpdateComplete");
LABEL_18:
    objc_msgSend(WeakRetained, "setRemoteApplyInProgress:", 0);
    goto LABEL_19;
  }
  if (*(_BYTE *)(a1 + 40))
  {
    if ((objc_msgSend(WeakRetained, "remoteApplyInProgress") & 1) == 0)
      objc_msgSend(WeakRetained, "setInternalState:", objc_msgSend(WeakRetained, "nextStateToSchedule"));
    if (*(_BYTE *)(a1 + 40))
      goto LABEL_8;
  }
  if (objc_msgSend(WeakRetained, "remoteApplyInProgress"))
  {
LABEL_8:
    objc_msgSend(WeakRetained, "hapAccessory");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isReachable");

    if (v4)
      objc_msgSend(WeakRetained, "_updateAvailableSoftwareUpdate");
    else
      objc_msgSend(WeakRetained, "_resetAvailableSoftwareUpdate");
    goto LABEL_18;
  }
  v5 = (void *)MEMORY[0x1D17BA0A0](objc_msgSend(WeakRetained, "setCurrentAutomaticApplyRetriesCount:", objc_msgSend(WeakRetained, "currentAutomaticApplyRetriesCount") + 1));
  v6 = WeakRetained;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v6, "currentAutomaticApplyRetriesCount"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v18 = v8;
    v19 = 2112;
    v20 = v9;
    _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_DEBUG, "%{public}@Firmware is still not applied after apply timer fired: retries count=%@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  if ((unint64_t)objc_msgSend(v6, "currentAutomaticApplyRetriesCount") < 0xB)
  {
    objc_msgSend(v6, "setInternalState:", 3);
    v14 = dispatch_time(0, 10000000000);
    objc_msgSend(v6, "workQueue");
    v15 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __59__HMDAccessoryFirmwareUpdateSession__handleApplyTimerFired__block_invoke_116;
    block[3] = &unk_1E89C2730;
    block[4] = v6;
    dispatch_after(v14, v15, block);

    goto LABEL_18;
  }
  v10 = (void *)MEMORY[0x1D17BA0A0]();
  v11 = v6;
  HMFGetOSLogHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v18 = v13;
    _os_log_impl(&dword_1CD062000, v12, OS_LOG_TYPE_ERROR, "%{public}@Out of retries for automatic apply", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v10);
  objc_msgSend(v11, "_endSession");
LABEL_19:

}

uint64_t __59__HMDAccessoryFirmwareUpdateSession__handleApplyTimerFired__block_invoke_116(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_schedule");
}

void __58__HMDAccessoryFirmwareUpdateSession__verifyUpdateComplete__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  unsigned int v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1D17BA0A0]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 138543362;
    v28 = v5;
    _os_log_impl(&dword_1CD062000, v4, OS_LOG_TYPE_INFO, "%{public}@Asking UARP for Apply Results", (uint8_t *)&v27, 0xCu);

  }
  objc_autoreleasePoolPop(v2);
  objc_msgSend(*(id *)(a1 + 32), "logEventManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "hapAccessory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "startApplyWithAccessory:", v7);
  objc_msgSend(*(id *)(a1 + 32), "queryFirmwareUpdateResultDurationTimer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    v9 = (void *)MEMORY[0x1D17BA0A0]();
    v10 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = 138543362;
      v28 = v12;
      _os_log_impl(&dword_1CD062000, v11, OS_LOG_TYPE_DEBUG, "%{public}@Start the timer for querying result", (uint8_t *)&v27, 0xCu);

    }
    objc_autoreleasePoolPop(v9);
    v13 = objc_alloc(MEMORY[0x1E0D286C8]);
    objc_msgSend(MEMORY[0x1E0D28678], "sharedPreferences");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "preferenceForKey:", CFSTR("firmwareUpdateQueryResultDurationAllowance"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "numberValue");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "unsignedIntValue");

    v18 = (void *)objc_msgSend(v13, "initWithTimeInterval:options:", 1, (double)v17);
    objc_msgSend(*(id *)(a1 + 32), "setQueryFirmwareUpdateResultDurationTimer:", v18);

    v19 = *(void **)(a1 + 32);
    objc_msgSend(v19, "queryFirmwareUpdateResultDurationTimer");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setDelegate:", v19);

    objc_msgSend(*(id *)(a1 + 32), "workQueue");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "queryFirmwareUpdateResultDurationTimer");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setDelegateQueue:", v21);

    objc_msgSend(*(id *)(a1 + 32), "queryFirmwareUpdateResultDurationTimer");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "resume");

  }
  objc_msgSend(*(id *)(a1 + 32), "accessoryFirmwareUpdateManager");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "UARPControllerForAccessory:", v7);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "uarpAccessory");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "queryFirmwareUpdateResultForAccessory:", v26);

}

void __58__HMDAccessoryFirmwareUpdateSession__verifyUpdateComplete__block_invoke_107(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    v4 = (void *)MEMORY[0x1D17BA0A0]();
    v5 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138543618;
      v9 = v7;
      v10 = 2112;
      v11 = v3;
      _os_log_impl(&dword_1CD062000, v6, OS_LOG_TYPE_ERROR, "%{public}@Error opening HDS socket: %@", (uint8_t *)&v8, 0x16u);

    }
    objc_autoreleasePoolPop(v4);
  }
  objc_msgSend(*(id *)(a1 + 32), "setIsVerifyingUpdate:", 0);
  objc_msgSend(*(id *)(a1 + 32), "_schedule");

}

void __78__HMDAccessoryFirmwareUpdateSession_stagedFirmwareRescindComplete_withStatus___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = (void *)MEMORY[0x1D17BA0A0]();
  v4 = WeakRetained;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 48));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1 + 32);
    v10 = 138543874;
    v11 = v6;
    v12 = 2112;
    v13 = v7;
    v14 = 2112;
    v15 = v8;
    _os_log_impl(&dword_1CD062000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@Staged firmware rescinded with status: %@ for accessory %@", (uint8_t *)&v10, 0x20u);

  }
  objc_autoreleasePoolPop(v3);
  objc_msgSend(v4, "dataStreamSocket");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "close");

}

void __85__HMDAccessoryFirmwareUpdateSession_firmwareUpdateResult_vendorSpecificStatus_error___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = (void *)MEMORY[0x1D17BA0A0]();
  v4 = WeakRetained;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 48));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138543874;
    v13 = v6;
    v14 = 2112;
    v15 = v7;
    v16 = 2112;
    v17 = v8;
    _os_log_impl(&dword_1CD062000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@Results from apply accessory %@ status %@", (uint8_t *)&v12, 0x20u);

  }
  objc_autoreleasePoolPop(v3);
  objc_msgSend(v4, "_cancelQueryFirmwareUpdateResultTimer");
  objc_msgSend(v4, "hapAccessory");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "firmwareUpdateProfile");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accessoryVersion");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_updateAccessoryFirmwareVersion:", v11);

  objc_msgSend(v4, "_schedule");
}

void __80__HMDAccessoryFirmwareUpdateSession_firmwareStagingComplete_assetID_withStatus___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  id v9;
  NSObject *v10;
  _BOOL4 v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  const __CFString *v16;
  void *v17;
  void *v18;
  id v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  NSObject *v26;
  void *v27;
  __CFString *v28;
  uint64_t v29;
  void *v30;
  const __CFString *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  id v35;
  NSObject *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  NSObject *v44;
  void *v45;
  const char *v46;
  uint8_t buf[4];
  uint64_t v48;
  __int16 v49;
  const __CFString *v50;
  __int16 v51;
  uint64_t v52;
  __int16 v53;
  void *v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "hapAccessory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  switch(*(_QWORD *)(a1 + 56))
  {
    case 0:
      v34 = (void *)MEMORY[0x1D17BA0A0]();
      v35 = WeakRetained;
      HMFGetOSLogHandle();
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v48 = (uint64_t)v37;
        _os_log_impl(&dword_1CD062000, v36, OS_LOG_TYPE_DEFAULT, "%{public}@Asset staging complete", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v34);
      objc_msgSend(v35, "setAssetOfferedForCurrentDataStream:", 0);
      objc_msgSend(*(id *)(a1 + 32), "softwareVersion");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "setLastStagedVersion:", v38);

      objc_msgSend(v35, "_logDebugStates:", "Updating profile due to firmwareStagingComplete:");
      objc_msgSend(v3, "firmwareUpdateProfile");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "softwareVersion");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "versionString");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "updateProfileWithStagedFirmwareVersion:", v41);

      goto LABEL_32;
    case 1:
      v42 = (void *)MEMORY[0x1D17BA0A0]();
      v43 = WeakRetained;
      HMFGetOSLogHandle();
      v44 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
        goto LABEL_29;
      HMFGetLogIdentifier();
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v48 = (uint64_t)v45;
      v46 = "%{public}@Update interrupted";
      goto LABEL_28;
    case 2:
    case 8:
      objc_msgSend(*(id *)(a1 + 32), "softwareVersion");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "assetID");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "softwareVersion");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v4, "isEqualToVersion:", v6);

      v8 = (void *)MEMORY[0x1D17BA0A0]();
      v9 = WeakRetained;
      HMFGetOSLogHandle();
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
      if ((v7 & 1) != 0)
      {
        if (v11)
        {
          HMFGetLogIdentifier();
          v12 = objc_claimAutoreleasedReturnValue();
          v13 = (void *)v12;
          v14 = *(_QWORD *)(a1 + 56);
          v15 = *(_QWORD *)(a1 + 32);
          *(_DWORD *)buf = 138543874;
          if (v14 == 2)
            v16 = CFSTR("failed");
          else
            v16 = CFSTR("rejected");
          v48 = v12;
          v49 = 2112;
          v50 = v16;
          v51 = 2112;
          v52 = v15;
          _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@Staging %@ for asset %@", buf, 0x20u);

        }
        objc_autoreleasePoolPop(v8);
        objc_msgSend(v9, "setAssetOfferedForCurrentDataStream:", 0);
        objc_msgSend(v9, "_stagingFailed");
        v17 = v9;
LABEL_31:
        objc_msgSend(v17, "setUserInitiatedInstall:", 0);
      }
      else
      {
        if (v11)
        {
          HMFGetLogIdentifier();
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          if (*(_QWORD *)(a1 + 56) == 2)
            v31 = CFSTR("failed");
          else
            v31 = CFSTR("rejected");
          v32 = *(_QWORD *)(a1 + 32);
          objc_msgSend(v9, "assetID");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544130;
          v48 = (uint64_t)v30;
          v49 = 2112;
          v50 = v31;
          v51 = 2112;
          v52 = v32;
          v53 = 2112;
          v54 = v33;
          _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@Ignoring Staging %@ for asset %@ with current asset %@", buf, 0x2Au);

        }
        objc_autoreleasePoolPop(v8);
      }
LABEL_32:

      return;
    case 3:
      v42 = (void *)MEMORY[0x1D17BA0A0]();
      v43 = WeakRetained;
      HMFGetOSLogHandle();
      v44 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v48 = (uint64_t)v45;
        v46 = "%{public}@Accessory disconnected";
LABEL_28:
        _os_log_impl(&dword_1CD062000, v44, OS_LOG_TYPE_DEFAULT, v46, buf, 0xCu);

      }
LABEL_29:

      objc_autoreleasePoolPop(v42);
      goto LABEL_30;
    case 4:
    case 5:
      v18 = (void *)MEMORY[0x1D17BA0A0]();
      v19 = WeakRetained;
      HMFGetOSLogHandle();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v48 = (uint64_t)v21;
        _os_log_impl(&dword_1CD062000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@Update canceled", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v18);
      objc_msgSend(v19, "accessoryFirmwareUpdateManager");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "assetID");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "resetFirmwareUpdateAccessoryRetryTracking:forAsset:", v3, v23);

LABEL_30:
      v17 = WeakRetained;
      goto LABEL_31;
    default:
      v24 = (void *)MEMORY[0x1D17BA0A0]();
      v25 = WeakRetained;
      HMFGetOSLogHandle();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), UARPFirmwareStagingCompletionStatusToString());
        v28 = (__CFString *)objc_claimAutoreleasedReturnValue();
        v29 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)buf = 138543874;
        v48 = (uint64_t)v27;
        v49 = 2112;
        v50 = v28;
        v51 = 2112;
        v52 = v29;
        _os_log_impl(&dword_1CD062000, v26, OS_LOG_TYPE_ERROR, "%{public}@Staging completion status %@ not handled for accessory %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v24);
      objc_msgSend(v25, "_endSession");
      goto LABEL_32;
  }
}

void __80__HMDAccessoryFirmwareUpdateSession_assetAvailablityUpdateForAccessory_assetID___block_invoke(id *a1)
{
  id WeakRetained;
  void *v3;
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  id v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  char v29;
  void *v30;
  id v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  NSObject *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  id v46;
  NSObject *v47;
  void *v48;
  uint64_t v49;
  void *v50;
  const char *v51;
  void *v52;
  id v53;
  NSObject *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  id v61;
  NSObject *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  const char *v67;
  NSObject *v68;
  os_log_type_t v69;
  uint64_t v70;
  id v71;
  NSObject *v72;
  void *v73;
  uint64_t v74;
  void *v75;
  const char *v76;
  void *v77;
  void *v78;
  id v79;
  NSObject *v80;
  void *v81;
  id v82;
  id v83;
  uint64_t v84;
  id v85;
  NSObject *v86;
  void *v87;
  id v88;
  id v89;
  uint64_t v90;
  id v91;
  NSObject *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  NSObject *v98;
  void *v99;
  void *v100;
  id v101;
  NSObject *v102;
  void *v103;
  void *v104;
  id v105;
  id v106;
  uint64_t v107;
  id v108;
  NSObject *v109;
  void *v110;
  id v111;
  id v112;
  void *v113;
  id v114;
  NSObject *v115;
  void *v116;
  void *v117;
  id v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *context;
  void *contexta;
  void *v128;
  void *v129;
  void *v130;
  uint8_t buf[4];
  void *v132;
  __int16 v133;
  void *v134;
  __int16 v135;
  void *v136;
  __int16 v137;
  uint64_t v138;
  __int16 v139;
  void *v140;
  __int16 v141;
  uint64_t v142;
  __int16 v143;
  id v144;
  uint64_t v145;

  v145 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained(a1 + 6);
  v3 = (void *)MEMORY[0x1D17BA0A0]();
  v4 = WeakRetained;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[4], "assetVersion");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[4], "updateAvailabilityStatus");
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), UARPFirmwareUpdateAvailabilityStatusToString());
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[4], "downloadStatus");
    v9 = UARPAssetDownloadStatusToString();
    objc_msgSend(a1[4], "releaseNotesAvailabilityStatus");
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), UARPFirmwareUpdateAvailabilityStatusToString());
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[4], "releaseNotesDownloadStatus");
    v11 = UARPAssetDownloadStatusToString();
    v12 = a1[4];
    *(_DWORD *)buf = 138544898;
    v132 = v6;
    v133 = 2114;
    v134 = v7;
    v135 = 2114;
    v136 = v8;
    v137 = 2082;
    v138 = v9;
    v139 = 2114;
    v140 = v10;
    v141 = 2082;
    v142 = v11;
    v143 = 2112;
    v144 = v12;
    _os_log_impl(&dword_1CD062000, v5, OS_LOG_TYPE_INFO, "%{public}@assetAvailabilityUpdate called with firmware %{public}@,  status: <%{public}@, %{public}s> releaseNotes status: <%{public}@, %{public}s> for asset %@", buf, 0x48u);

  }
  objc_autoreleasePoolPop(v3);
  objc_msgSend(v4, "_logDebugStates:", "-[HMDAccessoryFirmwareUpdateSession assetAvailablityUpdateForAccessory:assetID:]_block_invoke");
  objc_msgSend(v4, "hapAccessory");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accessoryVersion");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "firmwareUpdateProfile");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "stagedFirmwareVersion");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "availableSoftwareVersion");
  v130 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "supportsCHIP"))
  {
    objc_msgSend(a1[4], "softwareVersion");
    v17 = objc_claimAutoreleasedReturnValue();

    v130 = (void *)v17;
  }
  objc_msgSend(a1[4], "softwareVersion");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "assetID");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "softwareVersion");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "assetID");
  v21 = objc_claimAutoreleasedReturnValue();
  if (!v21)
    goto LABEL_15;
  v22 = (void *)v21;
  if ((objc_msgSend(v14, "isAtLeastVersion:", v18) & 1) != 0 || (objc_msgSend(v16, "isAtLeastVersion:", v18) & 1) != 0)
  {

    goto LABEL_9;
  }
  v29 = objc_msgSend(v20, "isGreaterThanVersion:", v18);

  if ((v29 & 1) == 0)
  {
LABEL_15:
    objc_msgSend(v4, "setAssetID:", a1[4]);
    if (objc_msgSend(v4, "internalState") == 5)
      objc_msgSend(v4, "setInternalState:", objc_msgSend(v4, "nextStateToSchedule"));
    if (objc_msgSend(a1[4], "downloadStatus") == 2)
    {
      v30 = (void *)MEMORY[0x1D17BA0A0]();
      v31 = v4;
      HMFGetOSLogHandle();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v33 = v20;
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v132 = v34;
        _os_log_impl(&dword_1CD062000, v32, OS_LOG_TYPE_ERROR, "%{public}@Firmware failed to download", buf, 0xCu);

        v20 = v33;
      }

      objc_autoreleasePoolPop(v30);
      v28 = v31;
      goto LABEL_21;
    }
    v128 = v20;
    objc_msgSend(v4, "accessoryFirmwareUpdateManager");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "UARPControllerForAccessory:", v13);
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    v37 = (void *)MEMORY[0x1D17BA0A0](objc_msgSend(v4, "setUserInitiatedStaging:", objc_msgSend(a1[5], "userInitiatedFirmwareStaging")));
    v38 = v4;
    HMFGetOSLogHandle();
    v39 = objc_claimAutoreleasedReturnValue();
    context = v18;
    v129 = v38;
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[5], "userInitiatedFirmwareStaging");
      HMFBooleanToString();
      v41 = v14;
      v42 = v36;
      v43 = v16;
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v132 = v40;
      v133 = 2112;
      v134 = v44;
      _os_log_impl(&dword_1CD062000, v39, OS_LOG_TYPE_DEBUG, "%{public}@userInitiatedFirmwareStaging: %@", buf, 0x16u);

      v16 = v43;
      v36 = v42;
      v14 = v41;
      v18 = context;

      v38 = v129;
    }

    objc_autoreleasePoolPop(v37);
    if (v16)
    {
      if (objc_msgSend(v130, "isGreaterThanVersion:", v16))
        goto LABEL_26;
    }
    else if ((objc_msgSend(v130, "isGreaterThanVersion:", v14) & 1) != 0)
    {
LABEL_26:
      switch(objc_msgSend(a1[4], "updateAvailabilityStatus"))
      {
        case 0:
        case 4:
        case 5:
          v45 = MEMORY[0x1D17BA0A0]();
          v46 = v129;
          HMFGetOSLogHandle();
          v47 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
            goto LABEL_37;
          HMFGetLogIdentifier();
          v120 = v16;
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(a1[4], "updateAvailabilityStatus");
          v118 = v46;
          v49 = v45;
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), UARPFirmwareUpdateAvailabilityStatusToString());
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v132 = v48;
          v133 = 2114;
          v134 = v50;
          v51 = "%{public}@Ignoring asset availability status %{public}@";
          goto LABEL_36;
        case 1:
          v122 = v16;
          v78 = (void *)MEMORY[0x1D17BA0A0]();
          v79 = v129;
          HMFGetOSLogHandle();
          v80 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v80, OS_LOG_TYPE_DEFAULT))
          {
            HMFGetLogIdentifier();
            v81 = (void *)objc_claimAutoreleasedReturnValue();
            v83 = a1[4];
            v82 = a1[5];
            *(_DWORD *)buf = 138543874;
            v132 = v81;
            v133 = 2112;
            v134 = v82;
            v135 = 2112;
            v136 = v83;
            _os_log_impl(&dword_1CD062000, v80, OS_LOG_TYPE_DEFAULT, "%{public}@telling uarpController to download asset for accessory:%@ assetID:%@", buf, 0x20u);

          }
          objc_autoreleasePoolPop(v78);
          v16 = v122;
          if ((objc_msgSend(v36, "downloadAvailableFirmwareUpdate:assetID:withUserIntent:", a1[5], a1[4], objc_msgSend(v79, "isUserInitiatedInstall")) & 1) != 0)break;
          v84 = MEMORY[0x1D17BA0A0](objc_msgSend(v79, "setUserInitiatedInstall:", 0));
          v85 = v79;
          HMFGetOSLogHandle();
          v86 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v86, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v87 = (void *)objc_claimAutoreleasedReturnValue();
            v89 = a1[4];
            v88 = a1[5];
            *(_DWORD *)buf = 138543874;
            v132 = v87;
            v133 = 2112;
            v134 = v88;
            v135 = 2112;
            v136 = v89;
            _os_log_impl(&dword_1CD062000, v86, OS_LOG_TYPE_ERROR, "%{public}@downloadAvailableFirmwareUpdate failed for accessory:%@ assetID:%@", buf, 0x20u);

            v16 = v122;
          }

          v59 = (void *)v84;
          goto LABEL_38;
        case 2:
          v90 = MEMORY[0x1D17BA0A0]();
          v91 = v129;
          HMFGetOSLogHandle();
          v92 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v92, OS_LOG_TYPE_DEFAULT))
          {
            HMFGetLogIdentifier();
            v93 = v14;
            v94 = v36;
            v95 = v16;
            v96 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v132 = v96;
            _os_log_impl(&dword_1CD062000, v92, OS_LOG_TYPE_DEFAULT, "%{public}@Firmware downloading", buf, 0xCu);

            v16 = v95;
            v36 = v94;
            v14 = v93;
            v18 = context;
          }

          v59 = (void *)v90;
          goto LABEL_38;
        case 3:
          v97 = (void *)MEMORY[0x1D17BA0A0]();
          v53 = v129;
          HMFGetOSLogHandle();
          v98 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v98, OS_LOG_TYPE_DEFAULT))
          {
            HMFGetLogIdentifier();
            v123 = v16;
            v99 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(a1[4], "localURL");
            v119 = v97;
            v100 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v132 = v99;
            v133 = 2114;
            v134 = v100;
            _os_log_impl(&dword_1CD062000, v98, OS_LOG_TYPE_DEFAULT, "%{public}@Firmware downloaded to %{public}@", buf, 0x16u);

            v97 = v119;
            v16 = v123;
          }

          objc_autoreleasePoolPop(v97);
          objc_msgSend(v53, "_updateAvailableSoftwareUpdate");
          goto LABEL_33;
        case 6:
        case 7:
        case 8:
          v45 = MEMORY[0x1D17BA0A0]();
          v46 = v129;
          HMFGetOSLogHandle();
          v47 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
            goto LABEL_37;
          HMFGetLogIdentifier();
          v120 = v16;
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(a1[4], "updateAvailabilityStatus");
          v118 = v46;
          v49 = v45;
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), UARPFirmwareUpdateAvailabilityStatusToString());
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v132 = v48;
          v133 = 2114;
          v134 = v50;
          v51 = "%{public}@Asset not found status, %{public}@";
LABEL_36:
          _os_log_impl(&dword_1CD062000, v47, OS_LOG_TYPE_ERROR, v51, buf, 0x16u);

          v45 = v49;
          v46 = v118;

          v16 = v120;
LABEL_37:

          v59 = (void *)v45;
LABEL_38:
          objc_autoreleasePoolPop(v59);
          break;
        default:
          break;
      }
LABEL_39:
      if (objc_msgSend(a1[4], "releaseNotesDownloadStatus") == 2)
      {
        v60 = (void *)MEMORY[0x1D17BA0A0]();
        v61 = v129;
        HMFGetOSLogHandle();
        v62 = objc_claimAutoreleasedReturnValue();
        v20 = v128;
        if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v63 = v14;
          v64 = v36;
          v65 = v16;
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v132 = v66;
          v67 = "%{public}@Release notes failed to download";
          v68 = v62;
          v69 = OS_LOG_TYPE_ERROR;
LABEL_42:
          _os_log_impl(&dword_1CD062000, v68, v69, v67, buf, 0xCu);

          v16 = v65;
          v36 = v64;
          v14 = v63;
          v18 = context;
        }
LABEL_43:

        objc_autoreleasePoolPop(v60);
      }
      else
      {
        v20 = v128;
        switch(objc_msgSend(a1[4], "releaseNotesAvailabilityStatus"))
        {
          case 0:
          case 4:
          case 5:
            v70 = MEMORY[0x1D17BA0A0]();
            v71 = v129;
            HMFGetOSLogHandle();
            v72 = objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(v72, OS_LOG_TYPE_ERROR))
              goto LABEL_50;
            HMFGetLogIdentifier();
            v121 = v16;
            v73 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(a1[4], "releaseNotesAvailabilityStatus");
            v74 = v70;
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), UARPFirmwareUpdateAvailabilityStatusToString());
            v75 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v132 = v73;
            v133 = 2114;
            v134 = v75;
            v76 = "%{public}@Ignoring release notes status: %{public}@";
            goto LABEL_49;
          case 1:
            contexta = (void *)MEMORY[0x1D17BA0A0]();
            v101 = v129;
            HMFGetOSLogHandle();
            v102 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v102, OS_LOG_TYPE_DEFAULT))
            {
              HMFGetLogIdentifier();
              v103 = v16;
              v104 = (void *)objc_claimAutoreleasedReturnValue();
              v106 = a1[4];
              v105 = a1[5];
              *(_DWORD *)buf = 138543874;
              v132 = v104;
              v133 = 2112;
              v134 = v105;
              v135 = 2112;
              v136 = v106;
              _os_log_impl(&dword_1CD062000, v102, OS_LOG_TYPE_DEFAULT, "%{public}@telling uarpController to download release notes for accessory:%@ assetID:%@", buf, 0x20u);

              v16 = v103;
              v20 = v128;
            }

            objc_autoreleasePoolPop(contexta);
            if ((objc_msgSend(v36, "downloadReleaseNotes:assetID:", a1[5], a1[4]) & 1) != 0)
              break;
            v107 = MEMORY[0x1D17BA0A0]();
            v108 = v101;
            HMFGetOSLogHandle();
            v109 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v109, OS_LOG_TYPE_ERROR))
            {
              HMFGetLogIdentifier();
              v124 = v16;
              v110 = (void *)objc_claimAutoreleasedReturnValue();
              v112 = a1[4];
              v111 = a1[5];
              *(_DWORD *)buf = 138543874;
              v132 = v110;
              v133 = 2112;
              v134 = v111;
              v135 = 2112;
              v136 = v112;
              _os_log_impl(&dword_1CD062000, v109, OS_LOG_TYPE_ERROR, "%{public}@Download of release notes failed for accessory:%@ assetID:%@", buf, 0x20u);

              v16 = v124;
            }

            v77 = (void *)v107;
            goto LABEL_51;
          case 2:
            v60 = (void *)MEMORY[0x1D17BA0A0]();
            v61 = v129;
            HMFGetOSLogHandle();
            v62 = objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
              goto LABEL_43;
            HMFGetLogIdentifier();
            v63 = v14;
            v64 = v36;
            v65 = v16;
            v66 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v132 = v66;
            v67 = "%{public}@Release notes downloading";
            v68 = v62;
            v69 = OS_LOG_TYPE_DEFAULT;
            goto LABEL_42;
          case 3:
            v113 = (void *)MEMORY[0x1D17BA0A0]();
            v114 = v129;
            HMFGetOSLogHandle();
            v115 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v115, OS_LOG_TYPE_DEFAULT))
            {
              HMFGetLogIdentifier();
              v125 = v16;
              v116 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(a1[4], "releaseNotesLocalURL");
              v117 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v132 = v116;
              v133 = 2114;
              v134 = v117;
              _os_log_impl(&dword_1CD062000, v115, OS_LOG_TYPE_DEFAULT, "%{public}@Release notes downloaded to %{public}@", buf, 0x16u);

              v16 = v125;
            }

            objc_autoreleasePoolPop(v113);
            objc_msgSend(v114, "_updateAvailableSoftwareUpdateDocumentation");
            goto LABEL_52;
          case 6:
          case 7:
          case 8:
            v70 = MEMORY[0x1D17BA0A0]();
            v71 = v129;
            HMFGetOSLogHandle();
            v72 = objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(v72, OS_LOG_TYPE_ERROR))
              goto LABEL_50;
            HMFGetLogIdentifier();
            v121 = v16;
            v73 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(a1[4], "updateAvailabilityStatus");
            v74 = v70;
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), UARPFirmwareUpdateAvailabilityStatusToString());
            v75 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v132 = v73;
            v133 = 2114;
            v134 = v75;
            v76 = "%{public}@Release notes not found, status %{public}@";
LABEL_49:
            _os_log_impl(&dword_1CD062000, v72, OS_LOG_TYPE_ERROR, v76, buf, 0x16u);

            v70 = v74;
            v16 = v121;
LABEL_50:

            v77 = (void *)v70;
LABEL_51:
            objc_autoreleasePoolPop(v77);
LABEL_52:
            v20 = v128;
            break;
          default:
            break;
        }
      }

      goto LABEL_54;
    }
    v52 = (void *)MEMORY[0x1D17BA0A0]();
    v53 = v38;
    HMFGetOSLogHandle();
    v54 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v55 = v14;
      v56 = v36;
      v57 = v16;
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v132 = v58;
      _os_log_impl(&dword_1CD062000, v54, OS_LOG_TYPE_DEFAULT, "%{public}@No asset download needed", buf, 0xCu);

      v16 = v57;
      v36 = v56;
      v14 = v55;
      v18 = context;
    }

    objc_autoreleasePoolPop(v52);
    objc_msgSend(v53, "_updateAvailableSoftwareUpdate");
    objc_msgSend(v53, "_logDebugStates:", "-[HMDAccessoryFirmwareUpdateSession assetAvailablityUpdateForAccessory:assetID:]_block_invoke");
LABEL_33:
    objc_msgSend(v53, "_schedule");
    goto LABEL_39;
  }
LABEL_9:
  v23 = (void *)MEMORY[0x1D17BA0A0]();
  v24 = v4;
  HMFGetOSLogHandle();
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v26 = v20;
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544386;
    v132 = v27;
    v133 = 2112;
    v134 = v18;
    v135 = 2112;
    v136 = v26;
    v137 = 2112;
    v138 = (uint64_t)v14;
    v139 = 2112;
    v140 = v16;
    _os_log_impl(&dword_1CD062000, v25, OS_LOG_TYPE_DEFAULT, "%{public}@Ignoring assetAvailability with asset version %@: current asset %@, accessory %@, staged %@", buf, 0x34u);

    v20 = v26;
  }

  objc_autoreleasePoolPop(v23);
  objc_msgSend(v24, "updateAvailableSoftwareUpdate");
  if (objc_msgSend(v14, "isAtLeastVersion:", v18) && objc_msgSend(v24, "internalState") != 4)
  {
    v28 = v24;
LABEL_21:
    objc_msgSend(v28, "_endSession");
  }
LABEL_54:

}

uint64_t __46__HMDAccessoryFirmwareUpdateSession__register__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setCurrentRegisterFailureCount:", 0);
}

void __46__HMDAccessoryFirmwareUpdateSession__register__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  dispatch_time_t v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  unsigned int v23;
  double v24;
  void *v25;
  id v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void (**v30)(_QWORD, _QWORD, double);
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  _QWORD block[5];
  uint8_t buf[4];
  void *v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  id v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)MEMORY[0x1D17BA0A0]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "uarpAccessory");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "uuid");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v39 = v7;
    v40 = 2112;
    v41 = v9;
    v42 = 2112;
    v43 = v3;
    _os_log_impl(&dword_1CD062000, v6, OS_LOG_TYPE_ERROR, "%{public}@Register accessory failed for %@ - couldn't open socket error:%@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v4);
  if ((unint64_t)objc_msgSend(*(id *)(a1 + 32), "currentRegisterFailureCount") < 0xA)
  {
    v15 = (void *)MEMORY[0x1D17BA0A0](objc_msgSend(*(id *)(a1 + 32), "setCurrentRegisterFailureCount:", objc_msgSend(*(id *)(a1 + 32), "currentRegisterFailureCount") + 1));
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v39 = v17;
      v40 = 2112;
      v41 = &unk_1E8B33D98;
      _os_log_impl(&dword_1CD062000, v16, OS_LOG_TYPE_INFO, "%{public}@Rescheduling register in %@ seconds", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v15);
    v18 = dispatch_time(0, 10000000000);
    objc_msgSend(*(id *)(a1 + 32), "workQueue");
    v19 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __46__HMDAccessoryFirmwareUpdateSession__register__block_invoke_98;
    block[3] = &unk_1E89C2730;
    block[4] = *(_QWORD *)(a1 + 32);
    dispatch_after(v18, v19, block);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "registerFailureRetryTimer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      v11 = (void *)MEMORY[0x1D17BA0A0]();
      v12 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        HMFGetLogIdentifier();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v39 = v14;
        _os_log_impl(&dword_1CD062000, v13, OS_LOG_TYPE_DEBUG, "%{public}@Register retry timer is active", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v11);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D28678], "sharedPreferences");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "preferenceForKey:", CFSTR("firmwareUpdateRegisterFailureRetryDuration"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "numberValue");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "unsignedIntValue");

      v24 = (double)v23;
      v25 = (void *)MEMORY[0x1D17BA0A0]();
      v26 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v24 / 3600.0);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v39 = v28;
        v40 = 2112;
        v41 = v29;
        _os_log_impl(&dword_1CD062000, v27, OS_LOG_TYPE_DEFAULT, "%{public}@Waiting up to %@ hours to retry registering accessory", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v25);
      objc_msgSend(*(id *)(a1 + 32), "registerFailureRetryTimerFactory");
      v30 = (void (**)(_QWORD, _QWORD, double))objc_claimAutoreleasedReturnValue();
      v30[2](v30, 1, v24);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "setRegisterFailureRetryTimer:", v31);

      v32 = *(void **)(a1 + 32);
      objc_msgSend(v32, "registerFailureRetryTimer");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "setDelegate:", v32);

      objc_msgSend(*(id *)(a1 + 32), "workQueue");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "registerFailureRetryTimer");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "setDelegateQueue:", v34);

      objc_msgSend(*(id *)(a1 + 32), "registerFailureRetryTimer");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "resume");

    }
  }

}

uint64_t __46__HMDAccessoryFirmwareUpdateSession__register__block_invoke_98(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_schedule");
}

void __56__HMDAccessoryFirmwareUpdateSession_unregisterAccessory__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_endSession");

}

void __54__HMDAccessoryFirmwareUpdateSession_registerAccessory__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setInternalState:", 5);
  objc_msgSend(WeakRetained, "_register");

}

void __58__HMDAccessoryFirmwareUpdateSession_socketDidReceiveData___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  uint64_t v5;
  __int128 v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  id v15;
  void *v16;
  id v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  uint64_t v23;
  void *v24;
  id v25;
  NSObject *v26;
  void *v27;
  __int128 v28;
  void *v29;
  id v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "accessoryFirmwareUpdateManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "hapAccessory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UARPControllerForAccessory:", v4);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "readData");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v7 = (void *)v5;
    *(_QWORD *)&v6 = 138543874;
    v28 = v6;
    while (1)
    {
      v8 = (void *)MEMORY[0x1D17BA0A0]();
      v9 = WeakRetained;
      HMFGetOSLogHandle();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        HMFGetLogIdentifier();
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v7, "length"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v32 = v11;
        v33 = 2112;
        v34 = v12;
        _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_DEBUG, "%{public}@HDS socket received %@ bytes", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v8);
      objc_msgSend(v9, "uarpAccessory");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = 0;
      v14 = objc_msgSend(v29, "recvDataFromAccessory:data:error:", v13, v7, &v30);
      v15 = v30;

      if ((v14 & 1) == 0)
      {
        v16 = (void *)MEMORY[0x1D17BA0A0]();
        v17 = v9;
        HMFGetOSLogHandle();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "uarpAccessory");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = v28;
          v32 = v19;
          v33 = 2112;
          v34 = v20;
          v35 = 2112;
          v36 = v15;
          _os_log_impl(&dword_1CD062000, v18, OS_LOG_TYPE_ERROR, "%{public}@Couldn't send data from accessory %@ to controller: %@", buf, 0x20u);

        }
        objc_autoreleasePoolPop(v16);
        objc_msgSend(v17, "dataStreamSocket");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v21, "isClosed");

        if (v22)
          break;
      }

      objc_msgSend(*(id *)(a1 + 32), "readData");
      v23 = objc_claimAutoreleasedReturnValue();

      v7 = (void *)v23;
      if (!v23)
        goto LABEL_14;
    }
    v24 = (void *)MEMORY[0x1D17BA0A0](objc_msgSend(v17, "setDataStreamSocket:", 0));
    v25 = v17;
    HMFGetOSLogHandle();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v32 = v27;
      _os_log_impl(&dword_1CD062000, v26, OS_LOG_TYPE_ERROR, "%{public}@Socket closed", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v24);

  }
LABEL_14:
  objc_msgSend(WeakRetained, "_resetSocketIdleTimer", v28);

}

void __74__HMDAccessoryFirmwareUpdateSession_sendMessageToAccessory_uarpMsg_error___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_resetSocketIdleTimer");

}

void __72__HMDAccessoryFirmwareUpdateSession_updateAvailableSoftwareUpdateState___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  NSObject *v5;
  void *v6;
  unint64_t v7;
  const __CFString *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  const __CFString *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "allowedApplyDurationTimer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    v3 = (void *)MEMORY[0x1D17BA0A0]();
    v4 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(*(id *)(a1 + 32), "internalState") - 1;
      if (v7 > 4)
        v8 = CFSTR("Up To Date");
      else
        v8 = off_1E89B4FD8[v7];
      HMSoftwareUpdateStateToString();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543874;
      v11 = v6;
      v12 = 2112;
      v13 = v8;
      v14 = 2112;
      v15 = v9;
      _os_log_impl(&dword_1CD062000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@Not updating available software update state from %@ to %@ because apply timer is active", (uint8_t *)&v10, 0x20u);

    }
    objc_autoreleasePoolPop(v3);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_updateAvailableSoftwareUpdateState:", *(_QWORD *)(a1 + 40));
  }
}

void __66__HMDAccessoryFirmwareUpdateSession_updateAvailableSoftwareUpdate__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_updateAvailableSoftwareUpdate");

}

void __72__HMDAccessoryFirmwareUpdateSession_updateAccessoryVendorIDAndProductID__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  id v19;
  NSObject *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "hapAccessory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "accessoryFirmwareUpdateManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UARPControllerForAccessory:", v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "matterVendorID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "uarpAccessory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v4, "updateProperty:value:forAccessory:", 7, v6, v7);

  v9 = (void *)MEMORY[0x1D17BA0A0]();
  v10 = WeakRetained;
  HMFGetOSLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if ((v8 & 1) == 0)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = 138543362;
      v27 = v24;
      _os_log_impl(&dword_1CD062000, v12, OS_LOG_TYPE_ERROR, "%{public}@Failed to update UARP accessory vendor ID property", (uint8_t *)&v26, 0xCu);

    }
    goto LABEL_14;
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "matterVendorID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = 138543618;
    v27 = v13;
    v28 = 2112;
    v29 = v14;
    _os_log_impl(&dword_1CD062000, v12, OS_LOG_TYPE_INFO, "%{public}@Accessory vendor ID updated to %@", (uint8_t *)&v26, 0x16u);

  }
  objc_autoreleasePoolPop(v9);
  objc_msgSend(v2, "matterProductID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "stringValue");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "uarpAccessory");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v4, "updateProperty:value:forAccessory:", 8, v16, v17);

  v9 = (void *)MEMORY[0x1D17BA0A0]();
  v19 = v10;
  HMFGetOSLogHandle();
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = v20;
  if ((v18 & 1) == 0)
  {
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = 138543362;
      v27 = v25;
      _os_log_impl(&dword_1CD062000, v21, OS_LOG_TYPE_ERROR, "%{public}@Failed to update UARP accessory product ID property", (uint8_t *)&v26, 0xCu);

    }
LABEL_14:
    objc_autoreleasePoolPop(v9);
    goto LABEL_15;
  }
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "matterProductID");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = 138543618;
    v27 = v22;
    v28 = 2112;
    v29 = v23;
    _os_log_impl(&dword_1CD062000, v21, OS_LOG_TYPE_INFO, "%{public}@Accessory product ID updated to %@", (uint8_t *)&v26, 0x16u);

  }
  objc_autoreleasePoolPop(v9);
  objc_msgSend(v19, "_cancelApplyTimer");
  objc_msgSend(v19, "_updateAvailableSoftwareUpdate");
LABEL_15:

}

void __66__HMDAccessoryFirmwareUpdateSession_handleNotReadyReasonsChanged___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_updateSoftwareUpdateNotReadyReasons");

}

void __82__HMDAccessoryFirmwareUpdateSession_handleFirmwareUpdateStateChangedNotification___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  int v18;
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "userInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hmf_numberForKey:", CFSTR("HMDAccessoryFirmwareUpdateStateKey"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)MEMORY[0x1D17BA0A0]();
  v6 = WeakRetained;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "longValue");
    HAPFirmwareUpdateStateAsString();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 138543618;
    v19 = v8;
    v20 = 2112;
    v21 = v9;
    _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_INFO, "%{public}@Accessory state changed to %@", (uint8_t *)&v18, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  if (objc_msgSend(v6, "internalState") == 2 && (!objc_msgSend(v4, "longValue") || objc_msgSend(v4, "longValue") == 2))
  {
    v10 = (void *)MEMORY[0x1D17BA0A0]();
    v11 = v6;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138543362;
      v19 = v13;
      _os_log_impl(&dword_1CD062000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@Restarting staging", (uint8_t *)&v18, 0xCu);

    }
    objc_autoreleasePoolPop(v10);
    objc_msgSend(v11, "_schedule");
  }
  else if (objc_msgSend(v6, "internalState") == 3 && objc_msgSend(v4, "longValue") == 4)
  {
    v14 = (void *)MEMORY[0x1D17BA0A0]();
    v15 = v6;
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138543362;
      v19 = v17;
      _os_log_impl(&dword_1CD062000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@Detected remote apply in progress", (uint8_t *)&v18, 0xCu);

    }
    objc_autoreleasePoolPop(v14);
    objc_msgSend(v15, "setRemoteApplyInProgress:", 1);
    objc_msgSend(v15, "_updateAvailableSoftwareUpdateState:", 3);
    objc_msgSend(v15, "startApplyDurationTimers");
  }
  else if (objc_msgSend(v6, "internalState") == 4
         && objc_msgSend(v4, "longValue") == 3
         && (objc_msgSend(v6, "isFirmwareVersionUpToDate") & 1) == 0)
  {
    if ((objc_msgSend(v6, "remoteApplyInProgress") & 1) == 0)
      objc_msgSend(v6, "_updateAvailableSoftwareUpdate");
    objc_msgSend(v6, "setRemoteApplyInProgress:", 0);
    objc_msgSend(v6, "_applyFailed");
  }
  else if ((objc_msgSend(v6, "internalState") == 2 || objc_msgSend(v6, "internalState") == 1)
         && objc_msgSend(v4, "longValue") == 3)
  {
    objc_msgSend(v6, "stagingComplete");
  }

}

void __73__HMDAccessoryFirmwareUpdateSession_updateAccessoryStagedFirmwareVersion__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  char v26;
  void *v27;
  id v28;
  NSObject *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  char v35;
  void *v36;
  int v37;
  void *v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  void *v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "hapAccessory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firmwareUpdateProfile");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stagedFirmwareVersion");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)MEMORY[0x1D17BA0A0]();
  v6 = WeakRetained;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "uarpAccessory");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stagedFirmwareVersion");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = 138543874;
    v38 = v8;
    v39 = 2112;
    v40 = v10;
    v41 = 2112;
    v42 = v4;
    _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_INFO, "%{public}@Staged firmware version changed from %@ to %@", (uint8_t *)&v37, 0x20u);

  }
  objc_autoreleasePoolPop(v5);
  objc_msgSend(v6, "_logDebugStates:", "-[HMDAccessoryFirmwareUpdateSession updateAccessoryStagedFirmwareVersion]_block_invoke");
  objc_msgSend(v6, "accessoryFirmwareUpdateManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "availableSoftwareVersion");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v4, "isGreaterThanVersion:", v12);

  if (!v13)
  {
    objc_msgSend(v11, "UARPControllerForAccessory:", v2);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "versionString");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "uarpAccessory");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v23, "updateProperty:value:forAccessory:", 5, v24, v25);

    v27 = (void *)MEMORY[0x1D17BA0A0]();
    v28 = v6;
    HMFGetOSLogHandle();
    v29 = objc_claimAutoreleasedReturnValue();
    v30 = v29;
    if ((v26 & 1) != 0)
    {
      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = 138543362;
        v38 = v31;
        _os_log_impl(&dword_1CD062000, v30, OS_LOG_TYPE_INFO, "%{public}@Updated UARP staged firmware version property", (uint8_t *)&v37, 0xCu);

      }
      objc_autoreleasePoolPop(v27);
      objc_msgSend(v28, "_updateAvailableSoftwareUpdate");
      if (v4)
      {
        objc_msgSend(v28, "setLastStagedVersion:", v4);
LABEL_19:

        goto LABEL_20;
      }
      objc_msgSend(v28, "availableSoftwareVersion");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      if (v33)
      {

        goto LABEL_19;
      }
      objc_msgSend(v28, "uarpAccessory");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = objc_msgSend(v23, "checkForUpdate:", v34);

      if ((v35 & 1) != 0)
        goto LABEL_19;
      v27 = (void *)MEMORY[0x1D17BA0A0]();
      v28 = v28;
      HMFGetOSLogHandle();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "uarpAccessory");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = 138543874;
        v38 = v32;
        v39 = 2112;
        v40 = v2;
        v41 = 2112;
        v42 = v36;
        _os_log_impl(&dword_1CD062000, v30, OS_LOG_TYPE_ERROR, "%{public}@checkForUpdate failed for accessory %@ %@", (uint8_t *)&v37, 0x20u);

        goto LABEL_17;
      }
    }
    else if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = 138543362;
      v38 = v32;
      _os_log_impl(&dword_1CD062000, v30, OS_LOG_TYPE_ERROR, "%{public}@Failed to update UARP staged firmware version property", (uint8_t *)&v37, 0xCu);
LABEL_17:

    }
    objc_autoreleasePoolPop(v27);
    goto LABEL_19;
  }
  v14 = (void *)MEMORY[0x1D17BA0A0]();
  v15 = v6;
  HMFGetOSLogHandle();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "availableSoftwareVersion");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = 138543618;
    v38 = v17;
    v39 = 2112;
    v40 = v18;
    _os_log_impl(&dword_1CD062000, v16, OS_LOG_TYPE_INFO, "%{public}@Staged firmware version newer than available version (%@)", (uint8_t *)&v37, 0x16u);

  }
  objc_autoreleasePoolPop(v14);
  if ((objc_msgSend(v11, "checkForUpdateForAccessory:", v2) & 1) == 0)
  {
    v19 = (void *)MEMORY[0x1D17BA0A0]();
    v20 = v15;
    HMFGetOSLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = 138543362;
      v38 = v22;
      _os_log_impl(&dword_1CD062000, v21, OS_LOG_TYPE_ERROR, "%{public}@Error request UARP to check for available updates", (uint8_t *)&v37, 0xCu);

    }
    objc_autoreleasePoolPop(v19);
  }
LABEL_20:

}

void __67__HMDAccessoryFirmwareUpdateSession_updateAccessoryFirmwareVersion__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  id v22;
  NSObject *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint8_t buf[4];
  void *v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  void *v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "hapAccessory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "accessoryFirmwareUpdateManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UARPControllerForAccessory:", v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "accessoryVersion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "versionString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v2, "supportsCHIP"))
  {
LABEL_4:
    objc_msgSend(WeakRetained, "uarpAccessory");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v4, "updateProperty:value:forAccessory:", 4, v6, v19);

    v21 = (void *)MEMORY[0x1D17BA0A0]();
    v22 = WeakRetained;
    HMFGetOSLogHandle();
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = v23;
    if ((v20 & 1) != 0)
    {
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "accessoryVersion");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v37 = v25;
        v38 = 2112;
        v39 = v2;
        v40 = 2112;
        v41 = v6;
        v42 = 2112;
        v43 = v26;
        _os_log_impl(&dword_1CD062000, v24, OS_LOG_TYPE_INFO, "%{public}@Accessory %@: UARP accessory firmware version property updated to %@ (accessoryVersion is %@)", buf, 0x2Au);

      }
      objc_autoreleasePoolPop(v21);
      objc_msgSend(v22, "_cancelApplyTimer");
      objc_msgSend(v22, "_updateAvailableSoftwareUpdate");
      objc_msgSend(v22, "_verifyUpdateComplete");
    }
    else
    {
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v37 = v27;
        _os_log_impl(&dword_1CD062000, v24, OS_LOG_TYPE_ERROR, "%{public}@Failed to update UARP accessory firmware version property", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v21);
    }
    goto LABEL_14;
  }
  v34 = v6;
  v35 = v4;
  objc_msgSend(WeakRetained, "assetID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "assetVersionNumber");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v2, "firmwareVersion");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "numberWithUnsignedInteger:", objc_msgSend(v10, "majorVersion"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "assetID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "assetVersion");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "displayableFirmwareVersion");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(WeakRetained, "isAccessoryVersionInSyncWithAssetVersion:matterFirmwareRevisionNumber:assetVersionString:matterFirmwareRevisionString:", v8, v11, v13, v14);

  if ((v15 & 1) != 0)
  {
    objc_msgSend(v2, "firmwareUpdateProfile");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "matterFirmwareUpdateProfile");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "matterFirmwareRevisionNumber");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v18, "stringValue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v4 = v35;
    goto LABEL_4;
  }
  v28 = (void *)MEMORY[0x1D17BA0A0]();
  v29 = WeakRetained;
  HMFGetOSLogHandle();
  v30 = objc_claimAutoreleasedReturnValue();
  v6 = v34;
  if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v37 = v31;
    _os_log_impl(&dword_1CD062000, v30, OS_LOG_TYPE_INFO, "%{public}@Waiting for version number and version string to be in sync before proceeding", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v28);
  objc_msgSend(v2, "firmwareUpdateProfile");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "matterFirmwareUpdateProfile");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "readMatterFirmwareUpdateCharacteristics");

  v4 = v35;
LABEL_14:

}

void __74__HMDAccessoryFirmwareUpdateSession__handleAutomaticUpdateEnabledChanged___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  char v9;
  uint8_t buf[4];
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v9 = 0;
  objc_msgSend(*(id *)(a1 + 32), "userInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hmf_BOOLForKey:isPresent:", CFSTR("kEnabledKey"), &v9);

  if (v9)
  {
    objc_msgSend(WeakRetained, "_automaticUpdateEnabledChanged:", v4);
  }
  else
  {
    v5 = (void *)MEMORY[0x1D17BA0A0]();
    v6 = WeakRetained;
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v11 = v8;
      _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_ERROR, "%{public}@Notification missing required key", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v5);
  }

}

uint64_t __58__HMDAccessoryFirmwareUpdateSession_expectedApplyDuration__block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;

  result = objc_msgSend(*(id *)(a1 + 32), "_expectedApplyDuration");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v3;
  return result;
}

uint64_t __57__HMDAccessoryFirmwareUpdateSession_allowedApplyDuration__block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;

  result = objc_msgSend(*(id *)(a1 + 32), "_allowedApplyDuration");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v3;
  return result;
}

void __50__HMDAccessoryFirmwareUpdateSession_applyFirmware__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "logEventManager");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "hapAccessory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "startApplyWithAccessory:", v2);

  objc_msgSend(*(id *)(a1 + 32), "_applyFirmware");
}

uint64_t __50__HMDAccessoryFirmwareUpdateSession_applyFirmware__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_evaluateHDSRetryForApplyFirmware");
}

void __50__HMDAccessoryFirmwareUpdateSession_stageFirmware__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "accessoryFirmwareUpdateManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "UARPControllerForAccessory:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "uarpAccessory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v3, "stageFirmwareUpdateOnAccessoryList:withUserIntent:", v5, objc_msgSend(*(id *)(a1 + 32), "isUserInitiatedInstall"));

  v7 = (void *)MEMORY[0x1D17BA0A0]();
  v8 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if ((v6 & 1) != 0)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543362;
      v15 = v11;
      _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_INFO, "%{public}@UARP initated asset staging", (uint8_t *)&v14, 0xCu);

    }
    objc_autoreleasePoolPop(v7);
    objc_msgSend(*(id *)(a1 + 32), "setInternalState:", 2);
    objc_msgSend(*(id *)(a1 + 32), "setAssetOfferedForCurrentDataStream:", 1);
    objc_msgSend(*(id *)(a1 + 32), "logEventManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "startStagingWithAccessory:", *(_QWORD *)(a1 + 40));

  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543362;
      v15 = v13;
      _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to initate asset staging in UARP controller", (uint8_t *)&v14, 0xCu);

    }
    objc_autoreleasePoolPop(v7);
  }

}

uint64_t __50__HMDAccessoryFirmwareUpdateSession_stageFirmware__block_invoke_85(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_schedule");
}

void __70__HMDAccessoryFirmwareUpdateSession__evaluateHDSRetryForApplyFirmware__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(*(id *)(a1 + 32), "sessionEnded") & 1) != 0)
  {
    v2 = (void *)MEMORY[0x1D17BA0A0]();
    v3 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = 138543362;
      v7 = v5;
      _os_log_impl(&dword_1CD062000, v4, OS_LOG_TYPE_DEBUG, "%{public}@Session has been ended, stop performing retries", (uint8_t *)&v6, 0xCu);

    }
    objc_autoreleasePoolPop(v2);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_schedule");
  }
}

void __66__HMDAccessoryFirmwareUpdateSession__withOpenSocketDoBlock_error___block_invoke(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  _QWORD block[4];
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id location;

  v5 = a2;
  v6 = a3;
  objc_initWeak(&location, a1[4]);
  objc_msgSend(a1[4], "workQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66__HMDAccessoryFirmwareUpdateSession__withOpenSocketDoBlock_error___block_invoke_2;
  block[3] = &unk_1E89B4E18;
  objc_copyWeak(&v16, &location);
  v11 = v5;
  v12 = v6;
  v14 = a1[6];
  v13 = a1[5];
  v15 = a1[7];
  v8 = v6;
  v9 = v5;
  dispatch_async(v7, block);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

void __66__HMDAccessoryFirmwareUpdateSession__withOpenSocketDoBlock_error___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  id v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  id v21;
  NSObject *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  int v28;
  void *v29;
  __int16 v30;
  uint64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "setDataStreamOpenInProgress:", 0);
    objc_msgSend(v3, "setDataStreamSocket:", *(_QWORD *)(a1 + 32));
    v4 = *(void **)(a1 + 32);
    if (v4)
    {
      objc_msgSend(v4, "setDelegate:", v3);
      objc_msgSend(v3, "setAssetOfferedForCurrentDataStream:", 0);
      v5 = (void *)MEMORY[0x1D17BA0A0](objc_msgSend(v3, "setApplyHDSRetryCount:", 0));
      v6 = v3;
      HMFGetOSLogHandle();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = 138543362;
        v29 = v8;
        _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_INFO, "%{public}@Opened HDS connection to accessory", (uint8_t *)&v28, 0xCu);

      }
      objc_autoreleasePoolPop(v5);
      objc_msgSend(v6, "_startSocketIdleTimer");
      v9 = *(void **)(a1 + 48);
      HAPStringFromAccessoryServerSession();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "registerForSessionRestore:", v10);

      objc_msgSend(v6, "accessoryFirmwareUpdateManager");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "UARPControllerForAccessory:", *(_QWORD *)(a1 + 48));
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v6, "uarpAccessory");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v12, "accessoryReachable:", v13);

      v15 = (void *)MEMORY[0x1D17BA0A0]();
      v16 = v6;
      HMFGetOSLogHandle();
      v17 = objc_claimAutoreleasedReturnValue();
      v18 = v17;
      if ((v14 & 1) != 0)
      {
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = 138543362;
          v29 = v19;
          _os_log_impl(&dword_1CD062000, v18, OS_LOG_TYPE_INFO, "%{public}@Notified UARP accessory is reachable", (uint8_t *)&v28, 0xCu);

        }
        objc_autoreleasePoolPop(v15);
        (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
      }
      else
      {
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = 138543362;
          v29 = v25;
          _os_log_impl(&dword_1CD062000, v18, OS_LOG_TYPE_ERROR, "%{public}@Failed to notify about reachable accessory to UARP", (uint8_t *)&v28, 0xCu);

        }
        objc_autoreleasePoolPop(v15);
        v26 = *(_QWORD *)(a1 + 56);
        objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:description:reason:suggestion:", 23, 0, CFSTR("UARP accessoryReachable failed"), 0);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, void *))(v26 + 16))(v26, v27);

      }
    }
    else
    {
      v20 = (void *)MEMORY[0x1D17BA0A0]();
      v21 = v3;
      HMFGetOSLogHandle();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = *(_QWORD *)(a1 + 40);
        v28 = 138543618;
        v29 = v23;
        v30 = 2112;
        v31 = v24;
        _os_log_impl(&dword_1CD062000, v22, OS_LOG_TYPE_ERROR, "%{public}@Couldn't open HDS connection to accessory error %@", (uint8_t *)&v28, 0x16u);

      }
      objc_autoreleasePoolPop(v20);
      (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    }
  }

}

void __53__HMDAccessoryFirmwareUpdateSession_resumeWithState___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  char v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  const char *v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  uint64_t v21;
  const __CFString *v22;
  void *v23;
  id v24;
  NSObject *v25;
  void *v26;
  int v27;
  void *v28;
  __int16 v29;
  const __CFString *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "setCurrentCommunicationErrorCount:", 0);
  objc_msgSend(*(id *)(a1 + 32), "_syncStateWithAccessoryOnResume");
  if ((objc_msgSend(*(id *)(a1 + 32), "internalState") == 1 || objc_msgSend(*(id *)(a1 + 32), "internalState") == 2)
    && *(_QWORD *)(a1 + 40) != 1
    || objc_msgSend(*(id *)(a1 + 32), "internalState") == 3 && *(_QWORD *)(a1 + 40) != 2
    || (objc_msgSend(*(id *)(a1 + 32), "updateScheduler"),
        v2 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v2, "currentTask"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v4 = objc_msgSend(v3, "shouldRun"),
        v3,
        v2,
        (v4 & 1) == 0))
  {
    objc_msgSend(*(id *)(a1 + 32), "_schedule");
  }
  else
  {
    switch(objc_msgSend(*(id *)(a1 + 32), "internalState"))
    {
      case 0:
        v5 = (void *)MEMORY[0x1D17BA0A0]();
        v6 = *(id *)(a1 + 32);
        HMFGetOSLogHandle();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
        {
          HMFGetLogIdentifier();
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = 138543362;
          v28 = v8;
          _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_DEBUG, "%{public}@Next action: -", (uint8_t *)&v27, 0xCu);

        }
        goto LABEL_31;
      case 1:
        v9 = (void *)MEMORY[0x1D17BA0A0]();
        v10 = *(id *)(a1 + 32);
        HMFGetOSLogHandle();
        v11 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
          goto LABEL_18;
        HMFGetLogIdentifier();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = 138543362;
        v28 = v12;
        v13 = "%{public}@Next action: stageFirmware";
        goto LABEL_17;
      case 2:
        if ((objc_msgSend(*(id *)(a1 + 32), "assetOfferedForCurrentDataStream") & 1) != 0)
          return;
        v9 = (void *)MEMORY[0x1D17BA0A0]();
        v10 = *(id *)(a1 + 32);
        HMFGetOSLogHandle();
        v11 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
          goto LABEL_18;
        HMFGetLogIdentifier();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = 138543362;
        v28 = v12;
        v13 = "%{public}@Next action: stageFirmware (recover)";
LABEL_17:
        _os_log_impl(&dword_1CD062000, v11, OS_LOG_TYPE_DEBUG, v13, (uint8_t *)&v27, 0xCu);

LABEL_18:
        objc_autoreleasePoolPop(v9);
        objc_msgSend(*(id *)(a1 + 32), "stageFirmware");
        break;
      case 3:
        v14 = (void *)MEMORY[0x1D17BA0A0]();
        v15 = *(id *)(a1 + 32);
        HMFGetOSLogHandle();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        {
          HMFGetLogIdentifier();
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = 138543362;
          v28 = v17;
          _os_log_impl(&dword_1CD062000, v16, OS_LOG_TYPE_DEBUG, "%{public}@Next action: applyFirmware", (uint8_t *)&v27, 0xCu);

        }
        objc_autoreleasePoolPop(v14);
        objc_msgSend(*(id *)(a1 + 32), "applyFirmware");
        return;
      case 4:
        v5 = (void *)MEMORY[0x1D17BA0A0]();
        v18 = *(id *)(a1 + 32);
        HMFGetOSLogHandle();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = objc_msgSend(*(id *)(a1 + 32), "internalState");
          if ((unint64_t)(v21 - 1) > 4)
            v22 = CFSTR("Up To Date");
          else
            v22 = off_1E89B4FD8[v21 - 1];
          v27 = 138543618;
          v28 = v20;
          v29 = 2112;
          v30 = v22;
          _os_log_impl(&dword_1CD062000, v19, OS_LOG_TYPE_ERROR, "%{public}@Ignoring resume in state %@", (uint8_t *)&v27, 0x16u);

        }
LABEL_31:
        objc_autoreleasePoolPop(v5);
        return;
      case 5:
        v23 = (void *)MEMORY[0x1D17BA0A0]();
        v24 = *(id *)(a1 + 32);
        HMFGetOSLogHandle();
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
        {
          HMFGetLogIdentifier();
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = 138543362;
          v28 = v26;
          _os_log_impl(&dword_1CD062000, v25, OS_LOG_TYPE_DEBUG, "%{public}@Next action: register", (uint8_t *)&v27, 0xCu);

        }
        objc_autoreleasePoolPop(v23);
        objc_msgSend(*(id *)(a1 + 32), "_register");
        return;
      default:
        return;
    }
  }
}

void __53__HMDAccessoryFirmwareUpdateSession_resumeWithState___block_invoke_71(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  int64_t v15;
  dispatch_time_t v16;
  NSObject *v17;
  _QWORD block[4];
  id v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "internalState") == 3)
  {
    objc_msgSend(*(id *)(a1 + 32), "_evaluateHDSRetryForApplyFirmware");
    goto LABEL_13;
  }
  if (!v3
    || (objc_msgSend(*(id *)(a1 + 32), "hapAccessory"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v5 = objc_msgSend(v4, "isReachable"),
        v4,
        !v5))
  {
    v15 = 0;
LABEL_12:
    objc_initWeak((id *)buf, *(id *)(a1 + 32));
    v16 = dispatch_time(0, v15);
    objc_msgSend(*(id *)(a1 + 32), "workQueue");
    v17 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __53__HMDAccessoryFirmwareUpdateSession_resumeWithState___block_invoke_73;
    block[3] = &unk_1E89BE3F8;
    objc_copyWeak(&v19, (id *)buf);
    dispatch_after(v16, v17, block);

    objc_destroyWeak(&v19);
    objc_destroyWeak((id *)buf);
    goto LABEL_13;
  }
  v6 = (void *)MEMORY[0x1D17BA0A0]();
  v7 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "currentCommunicationErrorCount"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v21 = v9;
    v22 = 2112;
    v23 = v10;
    v24 = 2112;
    v25 = v3;
    _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@HAP Communication Error occurrence: %@ error: %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v6);
  if ((unint64_t)objc_msgSend(*(id *)(a1 + 32), "currentCommunicationErrorCount") < 0xA)
  {
    objc_msgSend(*(id *)(a1 + 32), "setCurrentCommunicationErrorCount:", objc_msgSend(*(id *)(a1 + 32), "currentCommunicationErrorCount") + 1);
    v15 = 10000000000;
    goto LABEL_12;
  }
  v11 = (void *)MEMORY[0x1D17BA0A0]();
  v12 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v21 = v14;
    _os_log_impl(&dword_1CD062000, v13, OS_LOG_TYPE_ERROR, "%{public}@Out of retries for socket open", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v11);
  objc_msgSend(*(id *)(a1 + 32), "_endSession");
LABEL_13:

}

void __53__HMDAccessoryFirmwareUpdateSession_resumeWithState___block_invoke_73(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = (void *)MEMORY[0x1D17BA0A0]();
  v3 = WeakRetained;
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138543362;
    v7 = v5;
    _os_log_impl(&dword_1CD062000, v4, OS_LOG_TYPE_INFO, "%{public}@rescheduling task after socket open failed", (uint8_t *)&v6, 0xCu);

  }
  objc_autoreleasePoolPop(v2);
  objc_msgSend(v3, "_schedule");

}

id __127__HMDAccessoryFirmwareUpdateSession_initWithHAPAccessory_uarpAccessory_accessoryFirmwareUpdateManager_logEventManager_wingman___block_invoke(double a1, uint64_t a2, uint64_t a3)
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D286C8]), "initWithTimeInterval:options:", a3, a1);
}

+ (id)__calculateDigestDataFromFile:(id)a3 maxDataSize:(unint64_t)a4 error:(id *)a5
{
  uint64_t v5;
  _QWORD *v6;
  _QWORD *v7;
  unint64_t v8;
  unint64_t v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  unint64_t v15;
  BOOL v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  id v25;
  NSObject *v26;
  void *v27;
  void *v28;
  id v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  NSObject *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  NSObject *v40;
  void *v41;
  CC_SHA1_CTX v43;
  uint8_t buf[4];
  void *v45;
  __int16 v46;
  uint64_t v47;
  __int16 v48;
  id v49;
  int data;
  void *v51;
  __int16 v52;
  id v53;
  uint64_t v54;

  v5 = MEMORY[0x1E0C80A78](a1);
  v7 = v6;
  v9 = v8;
  v10 = (void *)v5;
  v54 = *MEMORY[0x1E0C80C00];
  v12 = v11;
  objc_msgSend(MEMORY[0x1E0C99DB0], "inputStreamWithURL:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v13)
  {
    v24 = (void *)MEMORY[0x1D17BA0A0]();
    v25 = v10;
    HMFGetOSLogHandle();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      data = 138543618;
      v51 = v27;
      v52 = 2112;
      v53 = v12;
      _os_log_impl(&dword_1CD062000, v26, OS_LOG_TYPE_DEFAULT, "%{public}@Couldn't open input stream for %@", (uint8_t *)&data, 0x16u);

    }
    objc_autoreleasePoolPop(v24);
LABEL_17:
    v23 = 0;
    goto LABEL_33;
  }
  memset(&v43, 0, sizeof(v43));
  CC_SHA1_Init(&v43);
  objc_msgSend(v13, "open");
  v14 = objc_msgSend(v13, "read:maxLength:", &data, 4096);
  if (v14 >= 1)
  {
    v15 = 0;
    while (1)
    {
      v16 = __CFADD__(v14, v15);
      v15 += v14;
      v17 = v16;
      v18 = v17 << 63 >> 63;
      if (v18 != v17 || v18 < 0 || v15 > v9)
        break;
      CC_SHA1_Update(&v43, &data, v14);
      v14 = objc_msgSend(v13, "read:maxLength:", &data, 4096);
      if (v14 <= 0)
        goto LABEL_11;
    }
    v28 = (void *)MEMORY[0x1D17BA0A0](objc_msgSend(v13, "close"));
    v29 = v10;
    HMFGetOSLogHandle();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v45 = v31;
      v46 = 2048;
      v47 = v9;
      v48 = 2112;
      v49 = v12;
      _os_log_impl(&dword_1CD062000, v30, OS_LOG_TYPE_ERROR, "%{public}@Data size is bigger than maximum %ld bytes on file %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v28);
    if (v7)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", -1);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_26:
      v23 = 0;
      *v7 = v32;
      goto LABEL_33;
    }
    goto LABEL_17;
  }
LABEL_11:
  v19 = objc_msgSend(v13, "close");
  if (v14 < 0)
  {
    v33 = (void *)MEMORY[0x1D17BA0A0](v19);
    v34 = v10;
    HMFGetOSLogHandle();
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "streamError");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v45 = v36;
      v46 = 2112;
      v47 = (uint64_t)v12;
      v48 = 2112;
      v49 = v37;
      _os_log_impl(&dword_1CD062000, v35, OS_LOG_TYPE_ERROR, "%{public}@Error reading documentation from %@: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v33);
    if (v7)
    {
      objc_msgSend(v13, "streamError");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_26;
    }
    goto LABEL_17;
  }
  objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", 20);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v20;
  if (v20)
  {
    v22 = objc_retainAutorelease(v20);
    CC_SHA1_Final((unsigned __int8 *)objc_msgSend(v22, "mutableBytes"), &v43);
    v23 = (void *)objc_msgSend(v22, "copy");
  }
  else
  {
    v38 = (void *)MEMORY[0x1D17BA0A0]();
    v39 = v10;
    HMFGetOSLogHandle();
    v40 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v45 = v41;
      v46 = 2048;
      v47 = 20;
      _os_log_impl(&dword_1CD062000, v40, OS_LOG_TYPE_ERROR, "%{public}@Failed to allocate %lu bytes to hold digest", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v38);
    if (v7)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", -1);
      v23 = 0;
      *v7 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v23 = 0;
    }
  }

LABEL_33:
  return v23;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t197 != -1)
    dispatch_once(&logCategory__hmf_once_t197, &__block_literal_global_124);
  return (id)logCategory__hmf_once_v198;
}

void __48__HMDAccessoryFirmwareUpdateSession_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v198;
  logCategory__hmf_once_v198 = v0;

}

@end
