@implementation HMDAccessoryFirmwareUpdateScheduler

- (NSString)description
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[HMDAccessoryFirmwareUpdateScheduler accessory](self, "accessory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v2, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "uniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("Accessory Firmware Update Scheduler %@, %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (id)privateDescription
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  -[HMDAccessoryFirmwareUpdateScheduler accessory](self, "accessory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %@>"), v4, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)logIdentifier
{
  void *v2;
  void *v3;

  -[HMDAccessoryFirmwareUpdateScheduler accessory](self, "accessory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "logIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[NSBackgroundActivityScheduler invalidate](self->_backgroundScheduler, "invalidate");
  -[HMDAccessoryFirmwareUpdateSchedulerWingman notificationCenter](self->_wingman, "notificationCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)HMDAccessoryFirmwareUpdateScheduler;
  -[HMDAccessoryFirmwareUpdateScheduler dealloc](&v4, sel_dealloc);
}

- (HMDAccessoryFirmwareUpdateScheduler)initWithAccessory:(id)a3 firmwareUpdateSession:(id)a4 workQueue:(id)a5
{
  return -[HMDAccessoryFirmwareUpdateScheduler initWithAccessory:firmwareUpdateSession:wingman:workQueue:](self, "initWithAccessory:firmwareUpdateSession:wingman:workQueue:", a3, a4, 0, a5);
}

- (HMDAccessoryFirmwareUpdateScheduler)initWithAccessory:(id)a3 firmwareUpdateSession:(id)a4 wingman:(id)a5 workQueue:(id)a6
{
  id v10;
  id v11;
  HMDAccessoryFirmwareUpdateSchedulerWingman *v12;
  id v13;
  HMDAccessoryFirmwareUpdateScheduler *v14;
  HMDAccessoryFirmwareUpdateScheduler *v15;
  HMDAccessoryFirmwareUpdateSchedulerWingman *v16;
  objc_super v18;

  v10 = a3;
  v11 = a4;
  v12 = (HMDAccessoryFirmwareUpdateSchedulerWingman *)a5;
  v13 = a6;
  v18.receiver = self;
  v18.super_class = (Class)HMDAccessoryFirmwareUpdateScheduler;
  v14 = -[HMDAccessoryFirmwareUpdateScheduler init](&v18, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeWeak((id *)&v14->_accessory, v10);
    objc_storeWeak((id *)&v15->_updateSession, v11);
    v16 = v12;
    if (!v12)
      v16 = objc_alloc_init(HMDAccessoryFirmwareUpdateSchedulerWingman);
    objc_storeStrong((id *)&v15->_wingman, v16);
    if (!v12)

    objc_storeStrong((id *)&v15->_workQueue, a6);
    v15->_currentState = 0;
  }

  return v15;
}

- (HMDAccessoryFirmwareUpdateProfile)updateProfile
{
  void *v2;
  void *v3;

  -[HMDAccessoryFirmwareUpdateScheduler accessory](self, "accessory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firmwareUpdateProfile");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (HMDAccessoryFirmwareUpdateProfile *)v3;
}

- (void)_registerForNotifications
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
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;

  -[HMDAccessoryFirmwareUpdateScheduler accessory](self, "accessory");
  v24 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "firmwareUpdateProfile");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[HMDAccessoryFirmwareUpdateScheduler wingman](self, "wingman");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "notificationCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserver:selector:name:object:", self, sel_handleUpdateStateChanged_, CFSTR("HMDAccessoryFirmwareUpdateStateChangedNotification"), v3);

    -[HMDAccessoryFirmwareUpdateScheduler wingman](self, "wingman");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "notificationCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObserver:selector:name:object:", self, sel_handleStagingNotReadyReasonsChanged_, CFSTR("HMDAccessoryFirmwareUpdateStagingNotReadyReasonsChangedNotification"), v3);

    -[HMDAccessoryFirmwareUpdateScheduler wingman](self, "wingman");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "notificationCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObserver:selector:name:object:", self, sel_handleApplyNotReadyReasonsChanged_, CFSTR("HMDAccessoryFirmwareUpdateApplyNotReadyReasonsChangedNotification"), v3);

    -[HMDAccessoryFirmwareUpdateScheduler wingman](self, "wingman");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "notificationCenter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObserver:selector:name:object:", self, sel_handleAccessoryReachabilityChanged_, CFSTR("HMDAccessoryIsReachableNotification"), v24);

    -[HMDAccessoryFirmwareUpdateScheduler wingman](self, "wingman");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "notificationCenter");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObserver:selector:name:object:", self, sel_handleAccessoryReachabilityChanged_, CFSTR("HMDAccessoryIsNotReachableNotification"), v24);

  }
  -[HMDAccessoryFirmwareUpdateScheduler wingman](self, "wingman");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "notificationCenter");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "home");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "residentDeviceManager");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addObserver:selector:name:object:", self, sel_handlePrimaryResidentChanged_, CFSTR("HMDResidentDeviceManagerUpdatePrimaryResidentNotification"), v17);

  -[HMDAccessoryFirmwareUpdateScheduler wingman](self, "wingman");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "notificationCenter");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "addObserver:selector:name:object:", self, sel_handlePrimaryResidentChanged_, CFSTR("HMDResidentDeviceConfirmedStateChangedNotification"), 0);

  -[HMDAccessoryFirmwareUpdateScheduler wingman](self, "wingman");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "notificationCenter");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "addObserver:selector:name:object:", self, sel_handleBridgeUpdate_, CFSTR("HMDAccessoryBridgedAccessoryAddedNotification"), v24);

  -[HMDAccessoryFirmwareUpdateScheduler wingman](self, "wingman");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "notificationCenter");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "addObserver:selector:name:object:", self, sel_handleBridgeUpdate_, CFSTR("HMDAccessoryBridgedAccessoryRemovedNotification"), v24);

}

- (void)handleAccessoryReachabilityChanged:(id)a3
{
  NSObject *v4;
  _QWORD block[5];

  -[HMDAccessoryFirmwareUpdateScheduler workQueue](self, "workQueue", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __74__HMDAccessoryFirmwareUpdateScheduler_handleAccessoryReachabilityChanged___block_invoke;
  block[3] = &unk_24E79C240;
  block[4] = self;
  dispatch_async(v4, block);

}

- (void)handleUpdateStateChanged:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  HMDAccessoryFirmwareUpdateScheduler *v9;

  v4 = a3;
  -[HMDAccessoryFirmwareUpdateScheduler workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __64__HMDAccessoryFirmwareUpdateScheduler_handleUpdateStateChanged___block_invoke;
  v7[3] = &unk_24E79C268;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)handleStagingNotReadyReasonsChanged:(id)a3
{
  NSObject *v4;
  _QWORD block[5];

  -[HMDAccessoryFirmwareUpdateScheduler workQueue](self, "workQueue", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __75__HMDAccessoryFirmwareUpdateScheduler_handleStagingNotReadyReasonsChanged___block_invoke;
  block[3] = &unk_24E79C240;
  block[4] = self;
  dispatch_async(v4, block);

}

- (void)handleApplyNotReadyReasonsChanged:(id)a3
{
  NSObject *v4;
  _QWORD block[5];

  -[HMDAccessoryFirmwareUpdateScheduler workQueue](self, "workQueue", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __73__HMDAccessoryFirmwareUpdateScheduler_handleApplyNotReadyReasonsChanged___block_invoke;
  block[3] = &unk_24E79C240;
  block[4] = self;
  dispatch_async(v4, block);

}

- (void)handlePrimaryResidentChanged:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  HMDAccessoryFirmwareUpdateScheduler *v9;

  v4 = a3;
  -[HMDAccessoryFirmwareUpdateScheduler workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __68__HMDAccessoryFirmwareUpdateScheduler_handlePrimaryResidentChanged___block_invoke;
  v7[3] = &unk_24E79C268;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)_handleSchedulingConditionChanged
{
  NSObject *v3;

  -[HMDAccessoryFirmwareUpdateScheduler workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[HMDAccessoryFirmwareUpdateScheduler _logDebugStates:](self, "_logDebugStates:", "-[HMDAccessoryFirmwareUpdateScheduler _handleSchedulingConditionChanged]");
  if (-[HMDAccessoryFirmwareUpdateScheduler needsToStop](self, "needsToStop"))
  {
    -[HMDAccessoryFirmwareUpdateScheduler _stop](self, "_stop");
  }
  else if (-[HMDAccessoryFirmwareUpdateScheduler needsToScheduleApply](self, "needsToScheduleApply")
         || -[HMDAccessoryFirmwareUpdateScheduler needsToScheduleStaging](self, "needsToScheduleStaging")
         || -[HMDAccessoryFirmwareUpdateScheduler needsToScheduleRegister](self, "needsToScheduleRegister"))
  {
    -[HMDAccessoryFirmwareUpdateScheduler scheduleWithDelay:](self, "scheduleWithDelay:", 0);
  }
}

- (void)scheduleWithDelay:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  void *v6;
  HMDAccessoryFirmwareUpdateScheduler *v7;
  NSObject *v8;
  void *v9;
  HMDAccessoryFirmwareUpdateStagingTask *v10;
  void *v11;
  uint64_t v12;
  HMDAccessoryFirmwareUpdateStagingTask *v13;
  HMDAccessoryFirmwareUpdateStagingTask *v14;
  void *v15;
  void *v16;
  char v17;
  int v18;
  void *v19;
  int v20;
  void *v21;
  HMDAccessoryFirmwareUpdateScheduler *v22;
  NSObject *v23;
  void *v24;
  HMDAccessoryFirmwareUpdateStagingTask *v25;
  void *v26;
  HMDAccessoryFirmwareUpdateRegisterTask *v27;
  void *v28;
  void *v29;
  HMDAccessoryFirmwareUpdateScheduler *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  void *v34;
  HMDAccessoryFirmwareUpdateScheduler *v35;
  NSObject *v36;
  void *v37;
  HMDAccessoryFirmwareUpdateApplyTask *v38;
  void *v39;
  void *v40;
  BOOL v41;
  void *v42;
  HMDAccessoryFirmwareUpdateScheduler *v43;
  NSObject *v44;
  _BOOL4 v45;
  void *v46;
  void *v47;
  int v48;
  void *v49;
  __int16 v50;
  HMDAccessoryFirmwareUpdateStagingTask *v51;
  __int16 v52;
  void *v53;
  uint64_t v54;

  v3 = a3;
  v54 = *MEMORY[0x24BDAC8D0];
  -[HMDAccessoryFirmwareUpdateScheduler workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v6 = (void *)MEMORY[0x227676638]();
  v7 = self;
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    HMFBooleanToString();
    v10 = (HMDAccessoryFirmwareUpdateStagingTask *)objc_claimAutoreleasedReturnValue();
    v48 = 138543618;
    v49 = v9;
    v50 = 2112;
    v51 = v10;
    _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_INFO, "%{public}@scheduleWithDelay: %@", (uint8_t *)&v48, 0x16u);

  }
  objc_autoreleasePoolPop(v6);
  -[HMDAccessoryFirmwareUpdateScheduler _invalidateExistingScheduling](v7, "_invalidateExistingScheduling");
  -[HMDAccessoryFirmwareUpdateScheduler updateSession](v7, "updateSession");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  switch(objc_msgSend(v11, "sessionState"))
  {
    case 0:
      -[HMDAccessoryFirmwareUpdateScheduler _removeUpdatePolicy](v7, "_removeUpdatePolicy");
      goto LABEL_5;
    case 1:
      v14 = [HMDAccessoryFirmwareUpdateStagingTask alloc];
      -[HMDAccessoryFirmwareUpdateScheduler updateProfile](v7, "updateProfile");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = -[HMDAccessoryFirmwareUpdateStagingTask initWithSession:profile:userInitiated:delay:](v14, "initWithSession:profile:userInitiated:delay:", v11, v15, objc_msgSend(v11, "isUserInitiatedStaging"), v3);

      -[HMDAccessoryFirmwareUpdateScheduler _removeUpdatePolicy](v7, "_removeUpdatePolicy");
      v12 = 1;
      break;
    case 2:
      -[HMDAccessoryFirmwareUpdateScheduler accessory](v7, "accessory");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v11, "isUserInitiatedInstall");
      v18 = objc_msgSend(v16, "isAutomaticThirdPartyAccessorySoftwareUpdateEnabled");
      objc_msgSend(v16, "home");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "isCurrentDeviceConfirmedPrimaryResident");

      if ((v17 & 1) != 0 || (v18 & v20 & 1) != 0)
      {
        if (objc_msgSend(v11, "isUserInitiatedInstall"))
        {
          v29 = (void *)MEMORY[0x227676638]();
          v30 = v7;
          HMFGetOSLogHandle();
          v31 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            v48 = 138543362;
            v49 = v32;
            _os_log_impl(&dword_2218F0000, v31, OS_LOG_TYPE_INFO, "%{public}@User initiated install; removing policy...",
              (uint8_t *)&v48,
              0xCu);

          }
          objc_autoreleasePoolPop(v29);
          -[HMDAccessoryFirmwareUpdateScheduler _removeUpdatePolicy](v30, "_removeUpdatePolicy");
        }
        else
        {
          -[HMDAccessoryFirmwareUpdateScheduler updatePolicy](v7, "updatePolicy");
          v33 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v33)
          {
            v34 = (void *)MEMORY[0x227676638]();
            v35 = v7;
            HMFGetOSLogHandle();
            v36 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
            {
              HMFGetLogIdentifier();
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              v48 = 138543362;
              v49 = v37;
              _os_log_impl(&dword_2218F0000, v36, OS_LOG_TYPE_DEBUG, "%{public}@Auto install; creating policy...",
                (uint8_t *)&v48,
                0xCu);

            }
            objc_autoreleasePoolPop(v34);
            -[HMDAccessoryFirmwareUpdateScheduler _createUpdatePolicy](v35, "_createUpdatePolicy");
          }
        }
        v38 = [HMDAccessoryFirmwareUpdateApplyTask alloc];
        -[HMDAccessoryFirmwareUpdateScheduler updateProfile](v7, "updateProfile");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDAccessoryFirmwareUpdateScheduler updatePolicy](v7, "updatePolicy");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = -[HMDAccessoryFirmwareUpdateApplyTask initWithSession:profile:policy:userInitiated:delay:](v38, "initWithSession:profile:policy:userInitiated:delay:", v11, v39, v40, objc_msgSend(v11, "isUserInitiatedInstall"), v3);

        v12 = 2;
      }
      else
      {
        v21 = (void *)MEMORY[0x227676638]();
        v22 = v7;
        HMFGetOSLogHandle();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          HMFBooleanToString();
          v25 = (HMDAccessoryFirmwareUpdateStagingTask *)objc_claimAutoreleasedReturnValue();
          HMFBooleanToString();
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v48 = 138543874;
          v49 = v24;
          v50 = 2112;
          v51 = v25;
          v52 = 2112;
          v53 = v26;
          _os_log_impl(&dword_2218F0000, v23, OS_LOG_TYPE_INFO, "%{public}@Automatic update not allowed in current device: allowed=%@, current device is resident=%@", (uint8_t *)&v48, 0x20u);

        }
        objc_autoreleasePoolPop(v21);
        -[HMDAccessoryFirmwareUpdateScheduler _removeUpdatePolicy](v22, "_removeUpdatePolicy");
        v12 = 0;
        v13 = 0;
      }

      break;
    case 3:
      v27 = [HMDAccessoryFirmwareUpdateRegisterTask alloc];
      -[HMDAccessoryFirmwareUpdateScheduler updateProfile](v7, "updateProfile");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = -[HMDAccessoryFirmwareUpdateRegisterTask initWithSession:profile:initialDelay:](v27, "initWithSession:profile:initialDelay:", v11, v28, 0.0);

      v12 = 3;
      break;
    default:
LABEL_5:
      v12 = 0;
      v13 = 0;
      break;
  }
  -[HMDAccessoryFirmwareUpdateScheduler _logDebugStates:](v7, "_logDebugStates:", "-[HMDAccessoryFirmwareUpdateScheduler scheduleWithDelay:]");
  v41 = -[HMDAccessoryFirmwareUpdateStagingTask shouldRun](v13, "shouldRun");
  v42 = (void *)MEMORY[0x227676638]();
  v43 = v7;
  HMFGetOSLogHandle();
  v44 = objc_claimAutoreleasedReturnValue();
  v45 = os_log_type_enabled(v44, OS_LOG_TYPE_INFO);
  if (v41)
  {
    if (v45)
    {
      HMFGetLogIdentifier();
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = 138543618;
      v49 = v46;
      v50 = 2112;
      v51 = v13;
      _os_log_impl(&dword_2218F0000, v44, OS_LOG_TYPE_INFO, "%{public}@Scheduling new task %@", (uint8_t *)&v48, 0x16u);

    }
    objc_autoreleasePoolPop(v42);
    -[HMDAccessoryFirmwareUpdateScheduler setCurrentState:](v43, "setCurrentState:", v12);
    -[HMDAccessoryFirmwareUpdateScheduler setCurrentTask:](v43, "setCurrentTask:", v13);
    -[HMDAccessoryFirmwareUpdateScheduler _scheduleCurrentTask](v43, "_scheduleCurrentTask");
  }
  else
  {
    if (v45)
    {
      HMFGetLogIdentifier();
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = 138543618;
      v49 = v47;
      v50 = 2112;
      v51 = v13;
      _os_log_impl(&dword_2218F0000, v44, OS_LOG_TYPE_INFO, "%{public}@Skip scheduling unready task %@", (uint8_t *)&v48, 0x16u);

    }
    objc_autoreleasePoolPop(v42);
    -[HMDAccessoryFirmwareUpdateScheduler setCurrentState:](v43, "setCurrentState:", 0);
    if (objc_msgSend(v11, "isUserInitiatedInstall"))
      objc_msgSend(v11, "updateAvailableSoftwareUpdateState:", 2);
  }

}

- (BOOL)needsToStop
{
  void *v3;
  int v4;
  void *v5;
  _BOOL4 v6;
  void *v7;
  void *v8;
  int v9;
  int v10;
  void *v11;
  HMDAccessoryFirmwareUpdateScheduler *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  -[HMDAccessoryFirmwareUpdateScheduler accessory](self, "accessory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isReachable") & 1) != 0)
    v4 = 0;
  else
    v4 = !-[HMDAccessoryFirmwareUpdateScheduler isIdle](self, "isIdle");

  -[HMDAccessoryFirmwareUpdateScheduler updateProfile](self, "updateProfile");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "stagingNotReadyReasons"))
    v6 = -[HMDAccessoryFirmwareUpdateScheduler isStagingInProgress](self, "isStagingInProgress");
  else
    v6 = 0;

  -[HMDAccessoryFirmwareUpdateScheduler currentTask](self, "currentTask");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[HMDAccessoryFirmwareUpdateScheduler currentTask](self, "currentTask");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "shouldRun") ^ 1;

  }
  else
  {
    v9 = 0;
  }

  v10 = v4 | v6 | v9;
  if (v10 == 1)
  {
    v11 = (void *)MEMORY[0x227676638]();
    v12 = self;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDAccessoryFirmwareUpdateScheduler currentTask](v12, "currentTask");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      HMFBooleanToString();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      HMFBooleanToString();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDAccessoryFirmwareUpdateScheduler updateProfile](v12, "updateProfile");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "stagingNotReadyReasons");
      HAPStagingNotReadyReasonsAsString();
      v22 = v11;
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      HMFBooleanToString();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v24 = v14;
      v25 = 2112;
      v26 = v15;
      v27 = 2112;
      v28 = v16;
      v29 = 2114;
      v30 = v17;
      v31 = 2112;
      v32 = v19;
      v33 = 2112;
      v34 = v20;
      _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_INFO, "%{public}@Task %@ needs to stop - notReachable %@, StagingNotReady %{public}@ (%@), shouldn't run %@", buf, 0x3Eu);

      v11 = v22;
    }

    objc_autoreleasePoolPop(v11);
  }
  return v10;
}

- (BOOL)needsToScheduleRegister
{
  NSObject *v3;
  void *v4;
  BOOL v5;

  -[HMDAccessoryFirmwareUpdateScheduler workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[HMDAccessoryFirmwareUpdateScheduler updateSession](self, "updateSession");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "sessionState") == 3
    && -[HMDAccessoryFirmwareUpdateScheduler currentState](self, "currentState") == 0;

  return v5;
}

- (BOOL)needsToScheduleStaging
{
  NSObject *v3;
  void *v4;
  BOOL v5;

  -[HMDAccessoryFirmwareUpdateScheduler workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[HMDAccessoryFirmwareUpdateScheduler updateSession](self, "updateSession");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "sessionState") == 1
    && -[HMDAccessoryFirmwareUpdateScheduler currentState](self, "currentState") == 0;

  return v5;
}

- (BOOL)needsToScheduleApply
{
  NSObject *v3;
  void *v4;
  char v5;
  void *v7;

  -[HMDAccessoryFirmwareUpdateScheduler workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[HMDAccessoryFirmwareUpdateScheduler updateSession](self, "updateSession");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "sessionState") == 2
    && !-[HMDAccessoryFirmwareUpdateScheduler currentState](self, "currentState"))
  {
    if ((objc_msgSend(v4, "isUserInitiatedInstall") & 1) != 0)
    {
      v5 = 1;
    }
    else
    {
      -[HMDAccessoryFirmwareUpdateScheduler accessory](self, "accessory");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v7, "isAutomaticThirdPartyAccessorySoftwareUpdateEnabled");

    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)isIdle
{
  NSObject *v3;

  -[HMDAccessoryFirmwareUpdateScheduler workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  return -[HMDAccessoryFirmwareUpdateScheduler currentState](self, "currentState") == 0;
}

- (BOOL)isStagingInProgress
{
  NSObject *v3;

  -[HMDAccessoryFirmwareUpdateScheduler workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  return -[HMDAccessoryFirmwareUpdateScheduler currentState](self, "currentState") == 1;
}

- (void)_invalidateExistingScheduling
{
  NSObject *v3;
  void *v4;

  -[HMDAccessoryFirmwareUpdateScheduler workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[HMDAccessoryFirmwareUpdateScheduler backgroundScheduler](self, "backgroundScheduler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "invalidate");

  -[HMDAccessoryFirmwareUpdateScheduler setBackgroundScheduler:](self, "setBackgroundScheduler:", 0);
  -[HMDAccessoryFirmwareUpdateScheduler setActivityCompletion:](self, "setActivityCompletion:", 0);
  -[HMDAccessoryFirmwareUpdateScheduler setCurrentTask:](self, "setCurrentTask:", 0);
  -[HMDAccessoryFirmwareUpdateScheduler _stopInitialDelayTimer](self, "_stopInitialDelayTimer");
  -[HMDAccessoryFirmwareUpdateScheduler _stopDeferCheckTimer](self, "_stopDeferCheckTimer");
}

- (void)_scheduleCurrentTask
{
  NSObject *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  NSObject *v8;
  _QWORD block[5];

  -[HMDAccessoryFirmwareUpdateScheduler workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[HMDAccessoryFirmwareUpdateScheduler currentTask](self, "currentTask");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isUserInitiated"))
  {

LABEL_4:
    -[HMDAccessoryFirmwareUpdateScheduler workQueue](self, "workQueue");
    v8 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __59__HMDAccessoryFirmwareUpdateScheduler__scheduleCurrentTask__block_invoke;
    block[3] = &unk_24E79C240;
    block[4] = self;
    dispatch_async(v8, block);

    return;
  }
  -[HMDAccessoryFirmwareUpdateScheduler currentTask](self, "currentTask");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "initialDelay");
  v7 = v6;

  if (v7 == 0.0)
    goto LABEL_4;
  -[HMDAccessoryFirmwareUpdateScheduler _startTaskInitialDelayTimer](self, "_startTaskInitialDelayTimer");
}

- (void)_scheduleCurrentTaskBackgroundRun
{
  NSObject *v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id inited;
  void *v16;
  HMDAccessoryFirmwareUpdateScheduler *v17;
  NSObject *v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  HMDAccessoryFirmwareUpdateScheduler *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  _QWORD v28[4];
  id v29;
  id v30;
  id location;
  uint8_t buf[4];
  id v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  -[HMDAccessoryFirmwareUpdateScheduler workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[HMDAccessoryFirmwareUpdateScheduler currentTask](self, "currentTask");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "shouldRun");

  if ((v5 & 1) != 0)
  {
    -[HMDAccessoryFirmwareUpdateScheduler currentTask](self, "currentTask");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDAccessoryFirmwareUpdateScheduler _invalidateExistingScheduling](self, "_invalidateExistingScheduling");
    -[HMDAccessoryFirmwareUpdateScheduler setCurrentTask:](self, "setCurrentTask:", v6);
    -[HMDAccessoryFirmwareUpdateScheduler accessory](self, "accessory");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "uniqueIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(CFSTR("com.apple.homed.firmwareUpdate.scheduler."), "stringByAppendingString:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[HMDAccessoryFirmwareUpdateScheduler wingman](self, "wingman");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v10, "newBackgroundSchedulerWithIdentifier:", v9);
    -[HMDAccessoryFirmwareUpdateScheduler setBackgroundScheduler:](self, "setBackgroundScheduler:", v11);

    -[HMDAccessoryFirmwareUpdateScheduler backgroundScheduler](self, "backgroundScheduler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDAccessoryFirmwareUpdateScheduler currentTask](self, "currentTask");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "criteria");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "_setAdditionalXPCActivityProperties:", v14);

    inited = objc_initWeak(&location, self);
    v16 = (void *)MEMORY[0x227676638](inited);
    v17 = self;
    HMFGetOSLogHandle();
    v18 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v19 = (id)objc_claimAutoreleasedReturnValue();
      -[HMDAccessoryFirmwareUpdateScheduler currentTask](v17, "currentTask");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v33 = v19;
      v34 = 2112;
      v35 = v9;
      v36 = 2112;
      v37 = v20;
      _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_INFO, "%{public}@Scheduling background task %@ %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v16);
    -[HMDAccessoryFirmwareUpdateScheduler backgroundScheduler](v17, "backgroundScheduler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = MEMORY[0x24BDAC760];
    v28[1] = 3221225472;
    v28[2] = __72__HMDAccessoryFirmwareUpdateScheduler__scheduleCurrentTaskBackgroundRun__block_invoke;
    v28[3] = &unk_24E782570;
    objc_copyWeak(&v30, &location);
    v22 = v9;
    v29 = v22;
    objc_msgSend(v21, "scheduleWithBlock:", v28);

    objc_destroyWeak(&v30);
    objc_destroyWeak(&location);

  }
  else
  {
    v23 = (void *)MEMORY[0x227676638]();
    v24 = self;
    HMFGetOSLogHandle();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDAccessoryFirmwareUpdateScheduler currentTask](v24, "currentTask");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v33 = v26;
      v34 = 2112;
      v35 = v27;
      _os_log_impl(&dword_2218F0000, v25, OS_LOG_TYPE_INFO, "%{public}@Aborting task %@ after initial delay because required conditions are no longer satisfied", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v23);
    -[HMDAccessoryFirmwareUpdateScheduler _stop](v24, "_stop");
  }
}

- (void)_stop
{
  NSObject *v3;
  void *v4;
  HMDAccessoryFirmwareUpdateScheduler *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  HMDAccessoryFirmwareUpdateScheduler *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void (**v13)(_QWORD, _QWORD);
  void *v14;
  int v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  -[HMDAccessoryFirmwareUpdateScheduler workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  v4 = (void *)MEMORY[0x227676638]();
  v5 = self;
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138543362;
    v16 = v7;
    _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_INFO, "%{public}@Stopping current task", (uint8_t *)&v15, 0xCu);

  }
  objc_autoreleasePoolPop(v4);
  -[HMDAccessoryFirmwareUpdateScheduler _logDebugStates:](v5, "_logDebugStates:", "-[HMDAccessoryFirmwareUpdateScheduler _stop]");
  if (-[HMDAccessoryFirmwareUpdateScheduler currentState](v5, "currentState"))
  {
    v8 = (void *)MEMORY[0x227676638]();
    v9 = v5;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543362;
      v16 = v11;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_DEBUG, "%{public}@Stopping active task", (uint8_t *)&v15, 0xCu);

    }
    objc_autoreleasePoolPop(v8);
    -[HMDAccessoryFirmwareUpdateScheduler activityCompletion](v9, "activityCompletion");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      -[HMDAccessoryFirmwareUpdateScheduler activityCompletion](v9, "activityCompletion");
      v13 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      v13[2](v13, 1);

    }
    -[HMDAccessoryFirmwareUpdateScheduler _invalidateExistingScheduling](v9, "_invalidateExistingScheduling");
    -[HMDAccessoryFirmwareUpdateScheduler setCurrentState:](v9, "setCurrentState:", 0);
    -[HMDAccessoryFirmwareUpdateScheduler updateSession](v9, "updateSession");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "pause");

  }
}

- (void)_defer
{
  NSObject *v3;
  void *v4;
  HMDAccessoryFirmwareUpdateScheduler *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void (**v12)(_QWORD, _QWORD);
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  -[HMDAccessoryFirmwareUpdateScheduler workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  v4 = (void *)MEMORY[0x227676638]();
  v5 = self;
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDAccessoryFirmwareUpdateScheduler activityCompletion](v5, "activityCompletion");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    HMFBooleanToString();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138543618;
    v14 = v7;
    v15 = 2112;
    v16 = v9;
    _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_DEBUG, "%{public}@Deferring active task, activityCompletion %@", (uint8_t *)&v13, 0x16u);

  }
  objc_autoreleasePoolPop(v4);
  -[HMDAccessoryFirmwareUpdateScheduler _logDebugStates:](v5, "_logDebugStates:", "-[HMDAccessoryFirmwareUpdateScheduler _defer]");
  -[HMDAccessoryFirmwareUpdateScheduler updateSession](v5, "updateSession");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "pause");

  -[HMDAccessoryFirmwareUpdateScheduler activityCompletion](v5, "activityCompletion");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[HMDAccessoryFirmwareUpdateScheduler activityCompletion](v5, "activityCompletion");
    v12 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v12[2](v12, 2);

  }
}

- (void)_taskCanRunInCurrentDevice:(id)a3
{
  void (**v4)(id, uint64_t);
  NSObject *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  int v12;
  int v13;
  void *v14;
  HMDAccessoryFirmwareUpdateScheduler *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  char v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v27[5];
  void (**v28)(id, uint64_t);
  void *v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, uint64_t))a3;
  -[HMDAccessoryFirmwareUpdateScheduler workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[HMDAccessoryFirmwareUpdateScheduler currentTask](self, "currentTask");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "shouldRun");

  if ((v7 & 1) != 0)
  {
    -[HMDAccessoryFirmwareUpdateScheduler accessory](self, "accessory");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "home");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "primaryResident");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "capabilities");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "supportsResidentFirmwareUpdate");

    v12 = objc_msgSend(v9, "isResidentSupported") & v11;
    v13 = objc_msgSend(v9, "isCurrentDeviceConfirmedPrimaryResident");
    v14 = (void *)MEMORY[0x227676638]();
    v15 = self;
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v25 = v8;
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      HMFBooleanToString();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "isResidentSupported");
      HMFBooleanToString();
      v24 = v14;
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      HMFBooleanToString();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v31 = v17;
      v32 = 2112;
      v33 = v18;
      v34 = 2112;
      v35 = v19;
      v36 = 2112;
      v37 = v20;
      _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_DEBUG, "%{public}@Resident parameters: supports AFU=%@, enabled=%@, current device is resident=%@", buf, 0x2Au);

      v14 = v24;
      v8 = v25;
    }

    objc_autoreleasePoolPop(v14);
    if (((v12 ^ 1 | v13) & 1) != 0
      || (-[HMDAccessoryFirmwareUpdateScheduler updateSession](v15, "updateSession"),
          v21 = (void *)objc_claimAutoreleasedReturnValue(),
          v22 = objc_msgSend(v21, "isUserInitiatedInstall"),
          v21,
          (v22 & 1) != 0))
    {
      v4[2](v4, 1);
    }
    else
    {
      v29 = v8;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v29, 1);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v27[0] = MEMORY[0x24BDAC760];
      v27[1] = 3221225472;
      v27[2] = __66__HMDAccessoryFirmwareUpdateScheduler__taskCanRunInCurrentDevice___block_invoke;
      v27[3] = &unk_24E793210;
      v27[4] = v15;
      v28 = v4;
      objc_msgSend(v9, "queryPrimaryResidentReachabilityForAccessories:completion:", v23, v27);

    }
  }
  else
  {
    v4[2](v4, 0);
  }

}

- (void)_logDebugStates:(const char *)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  HMDAccessoryFirmwareUpdateScheduler *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  __CFString *v16;
  __CFString *v17;
  uint64_t v18;
  const __CFString *v19;
  void *v20;
  HMDAccessoryFirmwareUpdateScheduler *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  const char *v32;
  void *v33;
  void *v34;
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  void *v42;
  __int16 v43;
  void *v44;
  __int16 v45;
  __CFString *v46;
  __int16 v47;
  const __CFString *v48;
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  -[HMDAccessoryFirmwareUpdateScheduler workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[HMDAccessoryFirmwareUpdateScheduler updateProfile](self, "updateProfile");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x227676638]();
  v8 = self;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  v34 = v6;
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = a3;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stagingNotReadyReasons");
    HAPStagingNotReadyReasonsAsString();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "updateNotReadyReasons");
    HAPUpdateNotReadyReasonsAsString();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "updateState");
    HAPFirmwareUpdateStateAsString();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDAccessoryFirmwareUpdateScheduler updateSession](v8, "updateSession");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "sessionState");
    if ((unint64_t)(v15 - 1) > 2)
      v16 = CFSTR("Up-To-Date");
    else
      v16 = off_24E78BBD8[v15 - 1];
    v17 = v16;
    v18 = -[HMDAccessoryFirmwareUpdateScheduler currentState](v8, "currentState");
    if ((unint64_t)(v18 - 1) > 2)
      v19 = CFSTR("Idle");
    else
      v19 = off_24E782590[v18 - 1];
    *(_DWORD *)buf = 138544898;
    v36 = v31;
    v37 = 2112;
    v38 = v10;
    v39 = 2114;
    v40 = v11;
    v41 = 2114;
    v42 = v12;
    v43 = 2112;
    v44 = v13;
    v45 = 2112;
    v46 = v17;
    v47 = 2112;
    v48 = v19;
    _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_DEBUG, "%{public}@%@: Staging Not Ready Reasons = %{public}@, Apply Not Ready Reasons = %{public}@, Accessory State = %@, Session State = %@, Scheduler State = %@", buf, 0x48u);

    a3 = v32;
    v6 = v34;
  }

  objc_autoreleasePoolPop(v7);
  v20 = (void *)MEMORY[0x227676638]();
  v21 = v8;
  HMFGetOSLogHandle();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", a3);
    v33 = v20;
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDAccessoryFirmwareUpdateScheduler accessory](v21, "accessory");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "isReachable");
    HMFBooleanToString();
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDAccessoryFirmwareUpdateScheduler updateSession](v21, "updateSession");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "isUserInitiatedInstall");
    HMFBooleanToString();
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDAccessoryFirmwareUpdateScheduler accessory](v21, "accessory");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "isAutomaticThirdPartyAccessorySoftwareUpdateEnabled");
    HMFBooleanToString();
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544386;
    v36 = v23;
    v37 = 2112;
    v38 = v24;
    v39 = 2112;
    v40 = v26;
    v41 = 2112;
    v42 = v28;
    v43 = 2112;
    v44 = v30;
    _os_log_impl(&dword_2218F0000, v22, OS_LOG_TYPE_DEBUG, "%{public}@%@: Accessory Locally Reachable = %@, User Initiated Install = %@, Automatic Update = %@", buf, 0x34u);

    v20 = v33;
    v6 = v34;

  }
  objc_autoreleasePoolPop(v20);

}

- (void)_startDeferCheckTimer
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[HMDAccessoryFirmwareUpdateScheduler workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE3F298]), "initWithTimeInterval:options:", 5, 10000.0);
  -[HMDAccessoryFirmwareUpdateScheduler setDeferCheckTimer:](self, "setDeferCheckTimer:", v4);

  -[HMDAccessoryFirmwareUpdateScheduler deferCheckTimer](self, "deferCheckTimer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDelegate:", self);

  -[HMDAccessoryFirmwareUpdateScheduler workQueue](self, "workQueue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessoryFirmwareUpdateScheduler deferCheckTimer](self, "deferCheckTimer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDelegateQueue:", v6);

  -[HMDAccessoryFirmwareUpdateScheduler deferCheckTimer](self, "deferCheckTimer");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "resume");

}

- (void)_stopDeferCheckTimer
{
  NSObject *v3;
  void *v4;

  -[HMDAccessoryFirmwareUpdateScheduler workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[HMDAccessoryFirmwareUpdateScheduler deferCheckTimer](self, "deferCheckTimer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "suspend");

  -[HMDAccessoryFirmwareUpdateScheduler setDeferCheckTimer:](self, "setDeferCheckTimer:", 0);
}

- (void)_startTaskInitialDelayTimer
{
  NSObject *v3;
  void *v4;
  HMDAccessoryFirmwareUpdateScheduler *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  -[HMDAccessoryFirmwareUpdateScheduler workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  v4 = (void *)MEMORY[0x227676638]();
  v5 = self;
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDAccessoryFirmwareUpdateScheduler currentTask](v5, "currentTask");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 138543618;
    v17 = v7;
    v18 = 2112;
    v19 = v8;
    _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_INFO, "%{public}@Starting initial delay timer for task %@", (uint8_t *)&v16, 0x16u);

  }
  objc_autoreleasePoolPop(v4);
  -[HMDAccessoryFirmwareUpdateScheduler wingman](v5, "wingman");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessoryFirmwareUpdateScheduler currentTask](v5, "currentTask");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "initialDelay");
  v11 = (void *)objc_msgSend(v9, "newInitialDelayTimerWithDelay:options:", 1);
  -[HMDAccessoryFirmwareUpdateScheduler setInitialDelayTimer:](v5, "setInitialDelayTimer:", v11);

  -[HMDAccessoryFirmwareUpdateScheduler initialDelayTimer](v5, "initialDelayTimer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setDelegate:", v5);

  -[HMDAccessoryFirmwareUpdateScheduler workQueue](v5, "workQueue");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessoryFirmwareUpdateScheduler initialDelayTimer](v5, "initialDelayTimer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setDelegateQueue:", v13);

  -[HMDAccessoryFirmwareUpdateScheduler initialDelayTimer](v5, "initialDelayTimer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "resume");

}

- (void)_stopInitialDelayTimer
{
  NSObject *v3;
  void *v4;

  -[HMDAccessoryFirmwareUpdateScheduler workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[HMDAccessoryFirmwareUpdateScheduler initialDelayTimer](self, "initialDelayTimer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "suspend");

  -[HMDAccessoryFirmwareUpdateScheduler setInitialDelayTimer:](self, "setInitialDelayTimer:", 0);
}

- (void)timerDidFire:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  id v7;
  void *v8;
  int v9;
  void *v10;
  HMDAccessoryFirmwareUpdateScheduler *v11;
  NSObject *v12;
  void *v13;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDAccessoryFirmwareUpdateScheduler workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[HMDAccessoryFirmwareUpdateScheduler initialDelayTimer](self, "initialDelayTimer");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6 == v4)
  {
    -[HMDAccessoryFirmwareUpdateScheduler _scheduleCurrentTaskBackgroundRun](self, "_scheduleCurrentTaskBackgroundRun");
  }
  else
  {
    -[HMDAccessoryFirmwareUpdateScheduler deferCheckTimer](self, "deferCheckTimer");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    if (v7 == v4)
    {
      -[HMDAccessoryFirmwareUpdateScheduler backgroundScheduler](self, "backgroundScheduler");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "shouldDefer");

      if (v9)
      {
        v10 = (void *)MEMORY[0x227676638]();
        v11 = self;
        HMFGetOSLogHandle();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = 138543362;
          v15 = v13;
          _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_INFO, "%{public}@System condition is no longer conducive to running scheduled task", (uint8_t *)&v14, 0xCu);

        }
        objc_autoreleasePoolPop(v10);
        -[HMDAccessoryFirmwareUpdateScheduler _defer](v11, "_defer");
      }
    }
    else
    {

    }
  }

}

- (void)removeUpdatePolicy
{
  NSObject *v3;
  _QWORD block[5];

  -[HMDAccessoryFirmwareUpdateScheduler workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __57__HMDAccessoryFirmwareUpdateScheduler_removeUpdatePolicy__block_invoke;
  block[3] = &unk_24E79C240;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)handlePolicyStatusChange:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  HMDAccessoryFirmwareUpdateScheduler *v9;

  v4 = a3;
  -[HMDAccessoryFirmwareUpdateScheduler workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __64__HMDAccessoryFirmwareUpdateScheduler_handlePolicyStatusChange___block_invoke;
  v7[3] = &unk_24E79C268;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)_createUpdatePolicy
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  -[HMDAccessoryFirmwareUpdateScheduler _removeUpdatePolicy](self, "_removeUpdatePolicy");
  -[HMDAccessoryFirmwareUpdateScheduler wingman](self, "wingman");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessoryFirmwareUpdateScheduler accessory](self, "accessory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessoryFirmwareUpdateScheduler updateSession](self, "updateSession");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "sessionState");
  -[HMDAccessoryFirmwareUpdateScheduler workQueue](self, "workQueue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "policyForAccessory:sessionState:workQueue:", v4, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessoryFirmwareUpdateScheduler setUpdatePolicy:](self, "setUpdatePolicy:", v8);

  -[HMDAccessoryFirmwareUpdateScheduler updatePolicy](self, "updatePolicy");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[HMDAccessoryFirmwareUpdateScheduler wingman](self, "wingman");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "notificationCenter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDAccessoryFirmwareUpdateScheduler updatePolicy](self, "updatePolicy");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObserver:selector:name:object:", self, sel_handlePolicyStatusChange_, CFSTR("HMDAccessoryFirmwareUpdatePolicyStatusChangedNotification"), v11);

  }
}

- (void)_removeUpdatePolicy
{
  void *v3;
  void *v4;
  void *v5;

  -[HMDAccessoryFirmwareUpdateScheduler updatePolicy](self, "updatePolicy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[HMDAccessoryFirmwareUpdateScheduler wingman](self, "wingman");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "notificationCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeObserver:name:object:", self, CFSTR("HMDAccessoryFirmwareUpdatePolicyStatusChangedNotification"), 0);

    -[HMDAccessoryFirmwareUpdateScheduler setUpdatePolicy:](self, "setUpdatePolicy:", 0);
  }
}

- (void)handleBridgeUpdate:(id)a3
{
  NSObject *v4;
  _QWORD block[5];

  -[HMDAccessoryFirmwareUpdateScheduler workQueue](self, "workQueue", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __58__HMDAccessoryFirmwareUpdateScheduler_handleBridgeUpdate___block_invoke;
  block[3] = &unk_24E79C240;
  block[4] = self;
  dispatch_async(v4, block);

}

- (HMDAccessoryFirmwareUpdateTask)currentTask
{
  return self->_currentTask;
}

- (void)setCurrentTask:(id)a3
{
  objc_storeStrong((id *)&self->_currentTask, a3);
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 16, 1);
}

- (HMDHAPAccessory)accessory
{
  return (HMDHAPAccessory *)objc_loadWeakRetained((id *)&self->_accessory);
}

- (HMDAccessoryFirmwareUpdateSession)updateSession
{
  return (HMDAccessoryFirmwareUpdateSession *)objc_loadWeakRetained((id *)&self->_updateSession);
}

- (HMDAccessoryFirmwareUpdateSchedulerWingman)wingman
{
  return (HMDAccessoryFirmwareUpdateSchedulerWingman *)objc_getProperty(self, a2, 40, 1);
}

- (HMFTimer)initialDelayTimer
{
  return self->_initialDelayTimer;
}

- (void)setInitialDelayTimer:(id)a3
{
  objc_storeStrong((id *)&self->_initialDelayTimer, a3);
}

- (NSBackgroundActivityScheduler)backgroundScheduler
{
  return self->_backgroundScheduler;
}

- (void)setBackgroundScheduler:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundScheduler, a3);
}

- (id)activityCompletion
{
  return self->_activityCompletion;
}

- (void)setActivityCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (HMFTimer)deferCheckTimer
{
  return self->_deferCheckTimer;
}

- (void)setDeferCheckTimer:(id)a3
{
  objc_storeStrong((id *)&self->_deferCheckTimer, a3);
}

- (int64_t)currentState
{
  return self->_currentState;
}

- (void)setCurrentState:(int64_t)a3
{
  self->_currentState = a3;
}

- (HMDAccessoryFirmwareUpdatePolicy)updatePolicy
{
  return self->_updatePolicy;
}

- (void)setUpdatePolicy:(id)a3
{
  objc_storeStrong((id *)&self->_updatePolicy, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updatePolicy, 0);
  objc_storeStrong((id *)&self->_deferCheckTimer, 0);
  objc_storeStrong(&self->_activityCompletion, 0);
  objc_storeStrong((id *)&self->_backgroundScheduler, 0);
  objc_storeStrong((id *)&self->_initialDelayTimer, 0);
  objc_storeStrong((id *)&self->_wingman, 0);
  objc_destroyWeak((id *)&self->_updateSession);
  objc_destroyWeak((id *)&self->_accessory);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_currentTask, 0);
}

void __58__HMDAccessoryFirmwareUpdateScheduler_handleBridgeUpdate___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "updateSession");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "sessionState");

  if (v3 == 2)
  {
    v4 = (void *)MEMORY[0x227676638]();
    v5 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138543362;
      v9 = v7;
      _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_INFO, "%{public}@Bridge update received; rescheduling...",
        (uint8_t *)&v8,
        0xCu);

    }
    objc_autoreleasePoolPop(v4);
    objc_msgSend(*(id *)(a1 + 32), "_removeUpdatePolicy");
    objc_msgSend(*(id *)(a1 + 32), "scheduleWithDelay:", 0);
  }
}

void __64__HMDAccessoryFirmwareUpdateScheduler_handlePolicyStatusChange___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  __CFString *v10;
  __CFString *v11;
  void *v12;
  uint64_t v13;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  __CFString *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hmf_BOOLForKey:", CFSTR("HMDAccessoryFirmwareUpdatePolicyStatusChangedKey"));

  v3 = (void *)MEMORY[0x227676638]();
  v4 = *(id *)(a1 + 40);
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    HMFBooleanToString();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "updateSession");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "sessionState");
    if ((unint64_t)(v9 - 1) > 2)
      v10 = CFSTR("Up-To-Date");
    else
      v10 = off_24E78BBD8[v9 - 1];
    v11 = v10;
    v14 = 138543874;
    v15 = v6;
    v16 = 2112;
    v17 = v7;
    v18 = 2112;
    v19 = v11;
    _os_log_impl(&dword_2218F0000, v5, OS_LOG_TYPE_DEBUG, "%{public}@Policy status - %@, Session State - %@", (uint8_t *)&v14, 0x20u);

  }
  objc_autoreleasePoolPop(v3);
  objc_msgSend(*(id *)(a1 + 40), "updateSession");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "sessionState") == 2)
  {
    v13 = objc_msgSend(*(id *)(a1 + 40), "currentState");

    if (!v13)
      objc_msgSend(*(id *)(a1 + 40), "scheduleWithDelay:", 0);
  }
  else
  {

  }
}

uint64_t __57__HMDAccessoryFirmwareUpdateScheduler_removeUpdatePolicy__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_removeUpdatePolicy");
}

void __66__HMDAccessoryFirmwareUpdateScheduler__taskCanRunInCurrentDevice___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id v9;
  id location;

  v3 = a2;
  objc_initWeak(&location, *(id *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 32), "workQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __66__HMDAccessoryFirmwareUpdateScheduler__taskCanRunInCurrentDevice___block_invoke_2;
  v6[3] = &unk_24E78C1B0;
  objc_copyWeak(&v9, &location);
  v7 = v3;
  v8 = *(id *)(a1 + 40);
  v5 = v3;
  dispatch_async(v4, v6);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __66__HMDAccessoryFirmwareUpdateScheduler__taskCanRunInCurrentDevice___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  int v4;
  void *v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  const __CFString *v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  const __CFString *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (objc_msgSend(*(id *)(a1 + 32), "count") == 1)
  {
    objc_msgSend(*(id *)(a1 + 32), "firstObject");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "hmf_BOOLForKey:", CFSTR("kAccessoryIsReachableKey"));

  }
  else
  {
    v4 = 0;
  }
  v5 = (void *)MEMORY[0x227676638]();
  v6 = WeakRetained;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v8;
    v10 = CFSTR("unreachable");
    if (v4)
      v10 = CFSTR("reachable");
    v11 = 138543618;
    v12 = v8;
    v13 = 2112;
    v14 = v10;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_DEBUG, "%{public}@Accessory is %@ from the resident", (uint8_t *)&v11, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __72__HMDAccessoryFirmwareUpdateScheduler__scheduleCurrentTaskBackgroundRun__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  NSObject *v6;
  _QWORD block[5];
  id v8;
  id v9;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "workQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __72__HMDAccessoryFirmwareUpdateScheduler__scheduleCurrentTaskBackgroundRun__block_invoke_2;
    block[3] = &unk_24E79B440;
    block[4] = v5;
    v8 = *(id *)(a1 + 32);
    v9 = v3;
    dispatch_async(v6, block);

  }
  else
  {
    (*((void (**)(id, uint64_t))v3 + 2))(v3, 1);
  }

}

uint64_t __72__HMDAccessoryFirmwareUpdateScheduler__scheduleCurrentTaskBackgroundRun__block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  _QWORD v10[5];
  uint8_t buf[4];
  void *v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x227676638]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "currentTask");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v12 = v5;
    v13 = 2112;
    v14 = v6;
    v15 = 2112;
    v16 = v7;
    _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_INFO, "%{public}@Running background task %@ %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v2);
  objc_msgSend(*(id *)(a1 + 32), "setActivityCompletion:", *(_QWORD *)(a1 + 48));
  v8 = *(void **)(a1 + 32);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __72__HMDAccessoryFirmwareUpdateScheduler__scheduleCurrentTaskBackgroundRun__block_invoke_45;
  v10[3] = &unk_24E791780;
  v10[4] = v8;
  return objc_msgSend(v8, "_taskCanRunInCurrentDevice:", v10);
}

uint64_t __72__HMDAccessoryFirmwareUpdateScheduler__scheduleCurrentTaskBackgroundRun__block_invoke_45(uint64_t a1, char a2)
{
  void *v4;
  id v5;
  NSObject *v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  void *v10;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = (void *)MEMORY[0x227676638]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_INFO);
  if ((a2 & 1) != 0)
  {
    if (v7)
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "currentTask");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543618;
      v15 = v8;
      v16 = 2112;
      v17 = v9;
      _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_INFO, "%{public}@Running task %@", (uint8_t *)&v14, 0x16u);

    }
    objc_autoreleasePoolPop(v4);
    objc_msgSend(*(id *)(a1 + 32), "currentTask");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "run");

    return objc_msgSend(*(id *)(a1 + 32), "_startDeferCheckTimer");
  }
  else
  {
    if (v7)
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "currentTask");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543618;
      v15 = v12;
      v16 = 2112;
      v17 = v13;
      _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_INFO, "%{public}@Aborting background running because required conditions are no longer satisfied for task=%@", (uint8_t *)&v14, 0x16u);

    }
    objc_autoreleasePoolPop(v4);
    return objc_msgSend(*(id *)(a1 + 32), "_stop");
  }
}

uint64_t __59__HMDAccessoryFirmwareUpdateScheduler__scheduleCurrentTask__block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v3[5];

  v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __59__HMDAccessoryFirmwareUpdateScheduler__scheduleCurrentTask__block_invoke_2;
  v3[3] = &unk_24E791780;
  v3[4] = v1;
  return objc_msgSend(v1, "_taskCanRunInCurrentDevice:", v3);
}

void __59__HMDAccessoryFirmwareUpdateScheduler__scheduleCurrentTask__block_invoke_2(uint64_t a1, char a2)
{
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  if ((a2 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "currentTask");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    v4 = (void *)MEMORY[0x227676638]();
    v5 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG);
    if (v3)
    {
      if (v7)
      {
        HMFGetLogIdentifier();
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "currentTask");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = 138543618;
        v18 = v8;
        v19 = 2112;
        v20 = v9;
        _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_DEBUG, "%{public}@Running current task now %@", (uint8_t *)&v17, 0x16u);

      }
      objc_autoreleasePoolPop(v4);
      objc_msgSend(*(id *)(a1 + 32), "currentTask");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "run");

    }
    else
    {
      if (v7)
      {
        HMFGetLogIdentifier();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = 138543362;
        v18 = v16;
        _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_DEBUG, "%{public}@Task was invalidated", (uint8_t *)&v17, 0xCu);

      }
      objc_autoreleasePoolPop(v4);
    }
  }
  else
  {
    v11 = (void *)MEMORY[0x227676638]();
    v12 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "currentTask");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138543618;
      v18 = v14;
      v19 = 2112;
      v20 = v15;
      _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_INFO, "%{public}@Aborting background run of task %@ because required conditions are no longer satisfied", (uint8_t *)&v17, 0x16u);

    }
    objc_autoreleasePoolPop(v11);
    objc_msgSend(*(id *)(a1 + 32), "_stop");
  }
}

void __68__HMDAccessoryFirmwareUpdateScheduler_handlePrimaryResidentChanged___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("HMDResidentDeviceManagerResidentDeviceNotificationKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (void *)MEMORY[0x227676638]();
  v5 = *(id *)(a1 + 40);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543618;
    v9 = v7;
    v10 = 2112;
    v11 = v3;
    _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_INFO, "%{public}@Primary resident changed to %@", (uint8_t *)&v8, 0x16u);

  }
  objc_autoreleasePoolPop(v4);
  objc_msgSend(*(id *)(a1 + 40), "_handleSchedulingConditionChanged");

}

uint64_t __73__HMDAccessoryFirmwareUpdateScheduler_handleApplyNotReadyReasonsChanged___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x227676638]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "updateProfile");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "updateNotReadyReasons");
    HAPUpdateNotReadyReasonsAsString();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543618;
    v10 = v5;
    v11 = 2114;
    v12 = v7;
    _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_INFO, "%{public}@Accessory apply not ready reasons changed to %{public}@", (uint8_t *)&v9, 0x16u);

  }
  objc_autoreleasePoolPop(v2);
  return objc_msgSend(*(id *)(a1 + 32), "_handleSchedulingConditionChanged");
}

uint64_t __75__HMDAccessoryFirmwareUpdateScheduler_handleStagingNotReadyReasonsChanged___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x227676638]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "updateProfile");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stagingNotReadyReasons");
    HAPStagingNotReadyReasonsAsString();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543618;
    v10 = v5;
    v11 = 2114;
    v12 = v7;
    _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_INFO, "%{public}@Accessory staging not ready reasons changed to %{public}@", (uint8_t *)&v9, 0x16u);

  }
  objc_autoreleasePoolPop(v2);
  return objc_msgSend(*(id *)(a1 + 32), "_handleSchedulingConditionChanged");
}

void __64__HMDAccessoryFirmwareUpdateScheduler_handleUpdateStateChanged___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hmf_numberForKey:", CFSTR("HMDAccessoryFirmwareUpdateStateKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (void *)MEMORY[0x227676638]();
  v5 = *(id *)(a1 + 40);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "unsignedIntegerValue");
    HAPFirmwareUpdateStateAsString();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543618;
    v10 = v7;
    v11 = 2112;
    v12 = v8;
    _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_INFO, "%{public}@Accessory firmware update status changed to %@", (uint8_t *)&v9, 0x16u);

  }
  objc_autoreleasePoolPop(v4);
  objc_msgSend(*(id *)(a1 + 40), "_handleSchedulingConditionChanged");

}

uint64_t __74__HMDAccessoryFirmwareUpdateScheduler_handleAccessoryReachabilityChanged___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x227676638]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "accessory");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "isReachable");
    HMFBooleanToString();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543618;
    v10 = v5;
    v11 = 2112;
    v12 = v7;
    _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_INFO, "%{public}@Accessory reachability changes to %@", (uint8_t *)&v9, 0x16u);

  }
  objc_autoreleasePoolPop(v2);
  return objc_msgSend(*(id *)(a1 + 32), "_handleSchedulingConditionChanged");
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t0_94032 != -1)
    dispatch_once(&logCategory__hmf_once_t0_94032, &__block_literal_global_94033);
  return (id)logCategory__hmf_once_v1_94034;
}

void __50__HMDAccessoryFirmwareUpdateScheduler_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v1_94034;
  logCategory__hmf_once_v1_94034 = v0;

}

@end
