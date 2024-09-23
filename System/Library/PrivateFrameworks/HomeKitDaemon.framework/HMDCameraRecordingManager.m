@implementation HMDCameraRecordingManager

- (HMDCameraRecordingManager)initWithCamera:(id)a3 recordingManagementService:(id)a4
{
  id v6;
  id v7;
  id v8;
  const char *v9;
  NSObject *v10;
  dispatch_queue_t v11;
  HMDCameraRecordingManagerDependencyFactory *v12;
  void *v13;
  HMDCameraRecordingManager *v14;

  v6 = a4;
  v7 = a3;
  HMDispatchQueueNameString();
  v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v9 = (const char *)objc_msgSend(v8, "UTF8String");
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = dispatch_queue_create(v9, v10);
  v12 = objc_alloc_init(HMDCameraRecordingManagerDependencyFactory);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[HMDCameraRecordingManager initWithCamera:recordingManagementService:workQueue:dependencyFactory:notificationCenter:](self, "initWithCamera:recordingManagementService:workQueue:dependencyFactory:notificationCenter:", v7, v6, v11, v12, v13);

  return v14;
}

- (HMDCameraRecordingManager)initWithCamera:(id)a3 recordingManagementService:(id)a4 workQueue:(id)a5 dependencyFactory:(id)a6 notificationCenter:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  HMDCameraRecordingManager *v17;
  void *v18;
  uint64_t v19;
  NSUUID *cameraUUID;
  uint64_t v21;
  HMFMessageDispatcher *msgDispatcher;
  uint64_t v23;
  NSUUID *messageTargetUUID;
  void *v25;
  void *v26;
  uint64_t v27;
  HMDCameraRecordingLoadBalancer *cameraLoadBalancer;
  uint64_t v29;
  HMDCameraRecordingSessionNotificationTrigger *notificationTrigger;
  uint64_t v31;
  HMDCameraRecordingSettingsControl *recordingSettingsControl;
  uint64_t v33;
  HMDCameraRecordingBulkSendSessionInitiator *bulkSendSessionInitiator;
  uint64_t v35;
  NSMutableSet *activeRecordingSessions;
  uint64_t v37;
  HMDFeaturesDataSource *featuresDataSource;
  uint64_t v39;
  HMMLogEventSubmitting *logEventSubmitter;
  objc_super v42;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v42.receiver = self;
  v42.super_class = (Class)HMDCameraRecordingManager;
  v17 = -[HMDCameraRecordingManager init](&v42, sel_init);
  if (v17)
  {
    objc_msgSend(v12, "hapAccessory");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "uniqueIdentifier");
    v19 = objc_claimAutoreleasedReturnValue();
    cameraUUID = v17->_cameraUUID;
    v17->_cameraUUID = (NSUUID *)v19;

    objc_storeStrong((id *)&v17->_dependencyFactory, a6);
    objc_storeStrong((id *)&v17->_notificationCenter, a7);
    objc_storeWeak((id *)&v17->_accessory, v18);
    objc_msgSend(v12, "msgDispatcher");
    v21 = objc_claimAutoreleasedReturnValue();
    msgDispatcher = v17->_msgDispatcher;
    v17->_msgDispatcher = (HMFMessageDispatcher *)v21;

    objc_storeWeak((id *)&v17->_camera, v12);
    objc_msgSend(v12, "messageTargetUUID");
    v23 = objc_claimAutoreleasedReturnValue();
    messageTargetUUID = v17->_messageTargetUUID;
    v17->_messageTargetUUID = (NSUUID *)v23;

    objc_msgSend(v18, "home");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "homeManager");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "cameraLoadBalancer");
    v27 = objc_claimAutoreleasedReturnValue();
    cameraLoadBalancer = v17->_cameraLoadBalancer;
    v17->_cameraLoadBalancer = (HMDCameraRecordingLoadBalancer *)v27;

    objc_storeStrong((id *)&v17->_workQueue, a5);
    objc_msgSend(v15, "createSessionNotificationTrigger:workQueue:", v12, v14);
    v29 = objc_claimAutoreleasedReturnValue();
    notificationTrigger = v17->_notificationTrigger;
    v17->_notificationTrigger = (HMDCameraRecordingSessionNotificationTrigger *)v29;

    objc_msgSend(v15, "createSettingsControl:accessory:managementService:", v14, v18, v13);
    v31 = objc_claimAutoreleasedReturnValue();
    recordingSettingsControl = v17->_recordingSettingsControl;
    v17->_recordingSettingsControl = (HMDCameraRecordingSettingsControl *)v31;

    objc_msgSend(v15, "createBulkSendSessionInitiatorWithWorkQueue:accessory:", v14, v18);
    v33 = objc_claimAutoreleasedReturnValue();
    bulkSendSessionInitiator = v17->_bulkSendSessionInitiator;
    v17->_bulkSendSessionInitiator = (HMDCameraRecordingBulkSendSessionInitiator *)v33;

    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v35 = objc_claimAutoreleasedReturnValue();
    activeRecordingSessions = v17->_activeRecordingSessions;
    v17->_activeRecordingSessions = (NSMutableSet *)v35;

    objc_msgSend(v15, "featuresDataSource");
    v37 = objc_claimAutoreleasedReturnValue();
    featuresDataSource = v17->_featuresDataSource;
    v17->_featuresDataSource = (HMDFeaturesDataSource *)v37;

    objc_msgSend(v15, "logEventSubmitter");
    v39 = objc_claimAutoreleasedReturnValue();
    logEventSubmitter = v17->_logEventSubmitter;
    v17->_logEventSubmitter = (HMMLogEventSubmitting *)v39;

  }
  return v17;
}

- (void)dealloc
{
  void *v3;
  HMDCameraRecordingManager *v4;
  NSObject *v5;
  void *v6;
  objc_super v7;
  uint8_t buf[4];
  void *v9;
  __int16 v10;
  HMDCameraRecordingManager *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x227676638](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v9 = v6;
    v10 = 2048;
    v11 = v4;
    _os_log_impl(&dword_2218F0000, v5, OS_LOG_TYPE_INFO, "%{public}@Camera recording manager: %p destroyed", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v3);
  -[HMDCameraRecordingLoadBalancer removeDataForCameraWithUUID:](v4->_cameraLoadBalancer, "removeDataForCameraWithUUID:", v4->_cameraUUID);
  v7.receiver = v4;
  v7.super_class = (Class)HMDCameraRecordingManager;
  -[HMDCameraRecordingManager dealloc](&v7, sel_dealloc);
}

- (void)start
{
  NSObject *v3;
  _QWORD block[5];

  -[HMDCameraRecordingManager workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __34__HMDCameraRecordingManager_start__block_invoke;
  block[3] = &unk_24E79C240;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)shutDown
{
  NSObject *v3;
  _QWORD block[5];

  -[HMDCameraRecordingManager workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __37__HMDCameraRecordingManager_shutDown__block_invoke;
  block[3] = &unk_24E79C240;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)notificationTrigger:(id)a3 didObserveTriggerType:(unint64_t)a4 changeToActive:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  NSObject *v9;
  void *v10;
  HMDCameraRecordingManager *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  HMDCameraRecordingManager *v21;
  NSObject *v22;
  void *v23;
  int v24;
  void *v25;
  __int16 v26;
  unint64_t v27;
  uint64_t v28;

  v5 = a5;
  v28 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  -[HMDCameraRecordingManager workQueue](self, "workQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v9);

  if (!-[HMDCameraRecordingManager didShutDown](self, "didShutDown"))
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (a4 == 1)
    {
      if (!v5)
      {
LABEL_15:

        goto LABEL_16;
      }
      -[HMDCameraRecordingManager currentRecordingSession](self, "currentRecordingSession");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "timelineManager");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "handleDoorbellDidActivateAtDate:", v14);

    }
    else
    {
      if (!a4)
      {
        -[HMDCameraRecordingManager setMotionActive:](self, "setMotionActive:", v5);
        -[HMDCameraRecordingManager currentRecordingSession](self, "currentRecordingSession");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "timelineManager");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "handleMotionActive:didChangeAtDate:", v5, v14);

        -[HMDCameraRecordingManager currentRecordingSession](self, "currentRecordingSession");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "handleMotionActive:", v5);

      }
      if (!v5)
        goto LABEL_15;
    }
    v20 = (void *)MEMORY[0x227676638](-[HMDCameraRecordingManager _resetRetryContextWithReason:](self, "_resetRetryContextWithReason:", CFSTR("Received recording session trigger from accessory")));
    v21 = self;
    HMFGetOSLogHandle();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 138543618;
      v25 = v23;
      v26 = 2048;
      v27 = a4;
      _os_log_impl(&dword_2218F0000, v22, OS_LOG_TYPE_INFO, "%{public}@Coordinating recording session for active trigger of type %lu", (uint8_t *)&v24, 0x16u);

    }
    objc_autoreleasePoolPop(v20);
    -[HMDCameraRecordingManager _coordinateRecordingSessionForTrigger:](v21, "_coordinateRecordingSessionForTrigger:", a4);
    goto LABEL_15;
  }
  v10 = (void *)MEMORY[0x227676638]();
  v11 = self;
  HMFGetOSLogHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 138543362;
    v25 = v13;
    _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_INFO, "%{public}@Ignoring notificationTrigger:didObserveTriggerType:changeToActive: because recording manager was shut down", (uint8_t *)&v24, 0xCu);

  }
  objc_autoreleasePoolPop(v10);
LABEL_16:

}

- (void)clipManagerDidStartUpCloudZone:(id)a3
{
  NSObject *v4;
  _QWORD block[5];

  -[HMDCameraRecordingManager workQueue](self, "workQueue", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __60__HMDCameraRecordingManager_clipManagerDidStartUpCloudZone___block_invoke;
  block[3] = &unk_24E79C240;
  block[4] = self;
  dispatch_async(v4, block);

}

- (void)clipManagerDidStop:(id)a3
{
  NSObject *v4;
  _QWORD block[5];

  -[HMDCameraRecordingManager workQueue](self, "workQueue", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __48__HMDCameraRecordingManager_clipManagerDidStop___block_invoke;
  block[3] = &unk_24E79C240;
  block[4] = self;
  dispatch_async(v4, block);

}

- (void)recordingSettingsControlDidConfigure:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  HMDCameraRecordingManager *v7;
  NSObject *v8;
  void *v9;
  _BOOL4 v10;
  void *v11;
  HMDCameraRecordingManager *v12;
  NSObject *v13;
  _BOOL4 v14;
  void *v15;
  void *v16;
  void *v17;
  HMDCameraRecordingManager *v18;
  NSObject *v19;
  void *v20;
  int v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDCameraRecordingManager workQueue](self, "workQueue");
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
    v21 = 138543362;
    v22 = v9;
    _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_INFO, "%{public}@Recording settings control did configure", (uint8_t *)&v21, 0xCu);

  }
  objc_autoreleasePoolPop(v6);
  v10 = -[HMDCameraRecordingManager didShutDown](v7, "didShutDown");
  v11 = (void *)MEMORY[0x227676638]();
  v12 = v7;
  HMFGetOSLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = os_log_type_enabled(v13, OS_LOG_TYPE_INFO);
  if (v10)
  {
    if (v14)
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 138543362;
      v22 = v15;
      _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_INFO, "%{public}@Ignoring recordingSettingsControlDidConfigure: because recording manager was shut down", (uint8_t *)&v21, 0xCu);

    }
    objc_autoreleasePoolPop(v11);
  }
  else
  {
    if (v14)
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 138543362;
      v22 = v16;
      _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_INFO, "%{public}@Closing current session if one exists because recording settings have been configured", (uint8_t *)&v21, 0xCu);

    }
    objc_autoreleasePoolPop(v11);
    -[HMDCameraRecordingManager _closeCurrentSessionsWithReason:](v12, "_closeCurrentSessionsWithReason:", 0);
    if (-[HMDCameraRecordingManager isMotionActive](v12, "isMotionActive"))
    {
      v17 = (void *)MEMORY[0x227676638]();
      v18 = v12;
      HMFGetOSLogHandle();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = 138543362;
        v22 = v20;
        _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_INFO, "%{public}@Motion is active and camera did configure successfully, attempting to coordinate a recording session", (uint8_t *)&v21, 0xCu);

      }
      objc_autoreleasePoolPop(v17);
      -[HMDCameraRecordingManager _coordinateRecordingSessionForTrigger:](v18, "_coordinateRecordingSessionForTrigger:", 0);
    }
  }

}

- (void)_start
{
  NSObject *v3;
  void *v4;
  HMDCameraRecordingManager *v5;
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
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v27[5];
  _QWORD v28[2];
  uint8_t buf[4];
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  -[HMDCameraRecordingManager workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  if (-[HMDCameraRecordingManager didShutDown](self, "didShutDown"))
    _HMFPreconditionFailure();
  v4 = (void *)MEMORY[0x227676638]();
  v5 = self;
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v30 = v7;
    _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_INFO, "%{public}@Starting", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v4);
  -[HMDCameraRecordingManager cameraLoadBalancer](v5, "cameraLoadBalancer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCameraRecordingManager cameraUUID](v5, "cameraUUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setReadyToRecord:forCameraWithUUID:", 0, v9);

  -[HMDCameraRecordingManager accessory](v5, "accessory");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "home");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "residentDeviceManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addDataSource:", v5);
  v27[0] = MEMORY[0x24BDAC760];
  v27[1] = 3221225472;
  v27[2] = __35__HMDCameraRecordingManager__start__block_invoke;
  v27[3] = &unk_24E79BD80;
  v27[4] = v5;
  objc_msgSend(v12, "confirmWithCompletionHandler:", v27);
  -[HMDCameraRecordingManager recordingSettingsControl](v5, "recordingSettingsControl");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setDelegate:", v5);

  -[HMDCameraRecordingManager recordingSettingsControl](v5, "recordingSettingsControl");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "start");

  -[HMDCameraRecordingManager bulkSendSessionInitiator](v5, "bulkSendSessionInitiator");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "configure");

  -[HMDCameraRecordingManager notificationTrigger](v5, "notificationTrigger");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setDelegate:", v5);

  -[HMDCameraRecordingManager notificationTrigger](v5, "notificationTrigger");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "start");

  +[HMDUserMessagePolicy userMessagePolicyWithHome:userPrivilege:remoteAccessRequired:](HMDUserMessagePolicy, "userMessagePolicyWithHome:userPrivilege:remoteAccessRequired:", v11, 0, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDRemoteMessagePolicy defaultSecurePolicy](HMDMutableRemoteMessagePolicy, "defaultSecurePolicy");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setRoles:", objc_msgSend(v19, "roles") | 4);
  v20 = (void *)objc_msgSend(v19, "copy");
  -[HMDCameraRecordingManager camera](v5, "camera");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCameraRecordingManager msgDispatcher](v5, "msgDispatcher");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v18;
  v28[1] = v20;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v28, 2);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "registerForMessage:receiver:policies:selector:", CFSTR("kStartRecordingSessionRequestKey"), v5, v23, sel_handleStartRecordingSessionRequest_);

  -[HMDCameraRecordingManager notificationCenter](v5, "notificationCenter");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "accessory");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "addObserver:selector:name:object:", v5, sel_handleCameraSettingsDidChangeNotification_, CFSTR("HMDCameraProfileSettingsDidChangeNotification"), v25);

  objc_msgSend(v21, "clipManager");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v23) = objc_msgSend(v26, "hasStartedUpCloudZone");

  if ((_DWORD)v23)
    -[HMDCameraRecordingManager _clipManagerDidStartUpCloudZone](v5, "_clipManagerDidStartUpCloudZone");

}

- (void)_shutDown
{
  NSObject *v3;
  void *v4;
  HMDCameraRecordingManager *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  if (-[HMDCameraRecordingManager didShutDown](self, "didShutDown"))
    _HMFPreconditionFailure();
  -[HMDCameraRecordingManager workQueue](self, "workQueue");
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
    v10 = 138543362;
    v11 = v7;
    _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_INFO, "%{public}@Shutting down", (uint8_t *)&v10, 0xCu);

  }
  objc_autoreleasePoolPop(v4);
  -[HMDCameraRecordingManager setDidShutDown:](v5, "setDidShutDown:", 1);
  -[HMDCameraRecordingManager cameraLoadBalancer](v5, "cameraLoadBalancer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCameraRecordingManager cameraUUID](v5, "cameraUUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setReadyToRecord:forCameraWithUUID:", 0, v9);

  -[HMDCameraRecordingManager _closeCurrentSessionsWithReason:](v5, "_closeCurrentSessionsWithReason:", 3);
}

- (void)_clipManagerDidStartUpCloudZone
{
  NSObject *v3;
  void *v4;
  HMDCameraRecordingManager *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  HMDCameraRecordingManager *v11;
  NSObject *v12;
  void *v13;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  -[HMDCameraRecordingManager workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  if (-[HMDCameraRecordingManager didShutDown](self, "didShutDown"))
  {
    v4 = (void *)MEMORY[0x227676638]();
    v5 = self;
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543362;
      v15 = v7;
      _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_INFO, "%{public}@Ignoring clipManagerDidStartUpCloudZone because recording manager was shut down", (uint8_t *)&v14, 0xCu);

    }
    objc_autoreleasePoolPop(v4);
  }
  else
  {
    -[HMDCameraRecordingManager cameraLoadBalancer](self, "cameraLoadBalancer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCameraRecordingManager cameraUUID](self, "cameraUUID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setReadyToRecord:forCameraWithUUID:", 1, v9);

    -[HMDCameraRecordingManager _resetRetryContextWithReason:](self, "_resetRetryContextWithReason:", CFSTR("Clip manager started up cloud zone"));
    if (-[HMDCameraRecordingManager isMotionActive](self, "isMotionActive"))
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
        _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_INFO, "%{public}@Clip manager started up cloud zone and motion is active, attempting to coordinate a recording session", (uint8_t *)&v14, 0xCu);

      }
      objc_autoreleasePoolPop(v10);
      -[HMDCameraRecordingManager _coordinateRecordingSessionForTrigger:](v11, "_coordinateRecordingSessionForTrigger:", 0);
    }
  }
}

- (void)_coordinateRecordingSessionForTrigger:(unint64_t)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  HMDCameraRecordingManager *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  HMDCameraRecordingManager *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  HMDCameraRecordingManager *v24;
  NSObject *v25;
  void *v26;
  const char *v27;
  NSObject *v28;
  os_log_type_t v29;
  void *v30;
  void *v31;
  void *v32;
  HMDCameraRecordingManager *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  _QWORD v37[6];
  uint8_t buf[4];
  void *v39;
  __int16 v40;
  void *v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  -[HMDCameraRecordingManager workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[HMDCameraRecordingManager camera](self, "camera");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "hapAccessory");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (!v8)
    {
      v19 = (void *)MEMORY[0x227676638]();
      v20 = self;
      HMFGetOSLogHandle();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v39 = v22;
        _os_log_impl(&dword_2218F0000, v21, OS_LOG_TYPE_ERROR, "%{public}@Cannot coordinate recording session because accessory reference is nil", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v19);
      goto LABEL_21;
    }
    objc_msgSend(v8, "home");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
    {
      if ((objc_msgSend(v10, "isCurrentDeviceConfirmedPrimaryResident") & 1) != 0)
      {
        objc_msgSend(v7, "currentSettings");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "currentAccessMode");

        if ((HMIsRecordingAllowedForCameraAccessMode() & 1) != 0)
        {
          -[HMDCameraRecordingManager recordingSettingsControl](self, "recordingSettingsControl");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "isCameraConfiguredForRecording");

          if ((v14 & 1) != 0)
          {
            -[HMDCameraRecordingManager _loadBalanceRecordingSessionForTrigger:](self, "_loadBalanceRecordingSessionForTrigger:", a3);
          }
          else
          {
            v32 = (void *)MEMORY[0x227676638]();
            v33 = self;
            HMFGetOSLogHandle();
            v34 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543362;
              v39 = v35;
              _os_log_impl(&dword_2218F0000, v34, OS_LOG_TYPE_INFO, "%{public}@Synchronizing settings with camera because settings have recording enabled, but camera is not configured for recording", buf, 0xCu);

            }
            objc_autoreleasePoolPop(v32);
            objc_msgSend(v9, "cameraProfileSettingsManager");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            v37[0] = MEMORY[0x24BDAC760];
            v37[1] = 3221225472;
            v37[2] = __67__HMDCameraRecordingManager__coordinateRecordingSessionForTrigger___block_invoke;
            v37[3] = &unk_24E79BC78;
            v37[4] = v33;
            v37[5] = a3;
            objc_msgSend(v36, "synchronizeSettingsToCameraWithCompletion:", v37);

          }
          goto LABEL_20;
        }
        v23 = (void *)MEMORY[0x227676638]();
        v24 = self;
        HMFGetOSLogHandle();
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          HMCameraAccessModeAsString();
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v39 = v30;
          v40 = 2112;
          v41 = v31;
          _os_log_impl(&dword_2218F0000, v25, OS_LOG_TYPE_INFO, "%{public}@Current access mode does not allow recording: %@", buf, 0x16u);

        }
LABEL_19:

        objc_autoreleasePoolPop(v23);
LABEL_20:

LABEL_21:
        goto LABEL_22;
      }
      v23 = (void *)MEMORY[0x227676638]();
      v24 = self;
      HMFGetOSLogHandle();
      v25 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
        goto LABEL_19;
      HMFGetLogIdentifier();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v39 = v26;
      v27 = "%{public}@Current device is not the primary resident, not coordinating recording session";
      v28 = v25;
      v29 = OS_LOG_TYPE_INFO;
    }
    else
    {
      v23 = (void *)MEMORY[0x227676638]();
      v24 = self;
      HMFGetOSLogHandle();
      v25 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        goto LABEL_19;
      HMFGetLogIdentifier();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v39 = v26;
      v27 = "%{public}@Cannot coordinate recording session because home reference is nil";
      v28 = v25;
      v29 = OS_LOG_TYPE_ERROR;
    }
    _os_log_impl(&dword_2218F0000, v28, v29, v27, buf, 0xCu);

    goto LABEL_19;
  }
  v15 = (void *)MEMORY[0x227676638]();
  v16 = self;
  HMFGetOSLogHandle();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v39 = v18;
    _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_ERROR, "%{public}@Cannot coordinate recording session because camera reference is nil", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v15);
LABEL_22:

}

- (void)_loadBalanceRecordingSessionForTrigger:(unint64_t)a3
{
  HMDCameraRecordingSessionCoordinationLogEvent *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  HMDCameraRecordingManager *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  HMDCameraRecordingManager *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD aBlock[5];
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v5 = objc_alloc_init(HMDCameraRecordingSessionCoordinationLogEvent);
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __68__HMDCameraRecordingManager__loadBalanceRecordingSessionForTrigger___block_invoke;
  aBlock[3] = &unk_24E7953A8;
  aBlock[4] = self;
  v6 = _Block_copy(aBlock);
  -[HMDCameraRecordingManager camera](self, "camera");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[HMDCameraRecordingManager cameraLoadBalancer](self, "cameraLoadBalancer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "loadBalancingDecisionForCamera:deviceFilter:", v7, v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "analysisNode");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      -[HMDCameraRecordingManager _forwardRecordingSessionForTrigger:withLoadBalancerDecision:deviceFilter:sessionCoordinationLogEvent:retryAttemptNumber:](self, "_forwardRecordingSessionForTrigger:withLoadBalancerDecision:deviceFilter:sessionCoordinationLogEvent:retryAttemptNumber:", a3, v9, v6, v5, 0);
    }
    else
    {
      v17 = (void *)MEMORY[0x227676638]();
      v18 = self;
      HMFGetOSLogHandle();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v25 = v20;
        _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_INFO, "%{public}@No device found for recording session, optimistically trying self", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v17);
      -[HMDCameraRecordingManager logEventSubmitter](v18, "logEventSubmitter");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "submitLogEvent:", v5);

      -[HMDCameraRecordingManager homePresenceByPairingIdentity](v18, "homePresenceByPairingIdentity");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDCameraRecordingManager _prepareRecordingSessionForTrigger:homePresenceByPairingIdentity:reason:](v18, "_prepareRecordingSessionForTrigger:homePresenceByPairingIdentity:reason:", a3, v22, CFSTR("primary resident picked itself"));

    }
  }
  else
  {
    v11 = (void *)MEMORY[0x227676638]();
    v12 = self;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDCameraRecordingManager cameraUUID](v12, "cameraUUID");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v25 = v14;
      v26 = 2112;
      v27 = v15;
      _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_ERROR, "%{public}@Camera object with UUID:%@ is nil", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v11);
    -[HMDCameraRecordingManager logEventSubmitter](v12, "logEventSubmitter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 20);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "submitLogEvent:error:", v5, v16);

  }
}

- (id)homePresenceByPairingIdentity
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  -[HMDCameraRecordingManager workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[HMDCameraRecordingManager accessory](self, "accessory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "presenceMonitor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "currentHomePresence");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "serializedIdentifierDictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    v9 = v8;
  else
    v9 = (id)MEMORY[0x24BDBD1B8];

  return v9;
}

- (id)messagePayloadForStartRecordingSessionWithTriggerType:(unint64_t)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  HMDCameraRecordingManager *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  HMDCameraRecordingManager *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  int v23;
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v5 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, CFSTR("notificationTriggerType"));

  -[HMDCameraRecordingManager homePresenceByPairingIdentity](self, "homePresenceByPairingIdentity");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, CFSTR("HMDCameraRecordingHomePresenceByPairingIdentity"));

  -[HMDCameraRecordingManager accessory](self, "accessory");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "socketInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = (void *)MEMORY[0x227676638]();
    v11 = self;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "dictionaryRepresentation");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 138543618;
      v24 = v13;
      v25 = 2112;
      v26 = v14;
      _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_DEBUG, "%{public}@Adding socket info to outgoing start recording message payload: %@", (uint8_t *)&v23, 0x16u);

    }
    objc_autoreleasePoolPop(v10);
    objc_msgSend(v9, "dictionaryRepresentation");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v15, CFSTR("HMDCameraRecordingAccessorySocketInfo"));

  }
  objc_msgSend(v8, "bonjourDeviceInfo");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    v17 = (void *)MEMORY[0x227676638]();
    v18 = self;
    HMFGetOSLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 138543618;
      v24 = v20;
      v25 = 2112;
      v26 = v16;
      _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_DEBUG, "%{public}@Adding bonjour device info to outgoing start recording message: %@", (uint8_t *)&v23, 0x16u);

    }
    objc_autoreleasePoolPop(v17);
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v16, CFSTR("HMDCameraRecordingAccessoryBonjourDeviceInfo"));
  }
  v21 = (void *)objc_msgSend(v5, "copy");

  return v21;
}

- (void)_forwardRecordingSessionForTrigger:(unint64_t)a3 withLoadBalancerDecision:(id)a4 deviceFilter:(id)a5 sessionCoordinationLogEvent:(id)a6 retryAttemptNumber:(int64_t)a7
{
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  void *v16;
  unint64_t v17;
  void *v18;
  HMDCameraRecordingManager *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  HMDRemoteDeviceMessageDestination *v23;
  void *v24;
  void *v25;
  HMDRemoteDeviceMessageDestination *v26;
  void *v27;
  unint64_t v28;
  void *v29;
  HMDCameraRecordingManager *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  void *v41;
  HMDRemoteMessage *v42;
  void *v43;
  void *v44;
  void *v45;
  _QWORD v46[5];
  id v47;
  id v48;
  id v49;
  id v50;
  id v51;
  int64_t v52;
  unint64_t v53;
  uint8_t buf[4];
  void *v55;
  __int16 v56;
  void *v57;
  __int16 v58;
  void *v59;
  uint64_t v60;

  v60 = *MEMORY[0x24BDAC8D0];
  v12 = a4;
  v13 = a5;
  v14 = a6;
  -[HMDCameraRecordingManager workQueue](self, "workQueue");
  v15 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v15);

  if (a7 >= 4)
    _HMFPreconditionFailure();
  objc_msgSend(v14, "setRetryCount:", a7);
  objc_msgSend(v12, "analysisNode");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "residentDevice");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "device");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = v14;
  if (objc_msgSend(v16, "isCurrentDevice"))
  {
    v17 = a3;
    v18 = (void *)MEMORY[0x227676638]();
    v19 = self;
    HMFGetOSLogHandle();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v55 = v21;
      _os_log_impl(&dword_2218F0000, v20, OS_LOG_TYPE_INFO, "%{public}@We are the best device for recording session, starting locally", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v18);
    -[HMDCameraRecordingManager homePresenceByPairingIdentity](v19, "homePresenceByPairingIdentity");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCameraRecordingManager _prepareRecordingSessionForTrigger:homePresenceByPairingIdentity:reason:](v19, "_prepareRecordingSessionForTrigger:homePresenceByPairingIdentity:reason:", v17, v22, CFSTR("current device picked itself"));

    -[HMDCameraRecordingManager _submitLoadBalancingEventWithDecision:numberOfRetries:](v19, "_submitLoadBalancingEventWithDecision:numberOfRetries:", v12, a7);
    -[HMDCameraRecordingManager logEventSubmitter](v19, "logEventSubmitter");
    v23 = (HMDRemoteDeviceMessageDestination *)objc_claimAutoreleasedReturnValue();
    v24 = v43;
    -[HMDRemoteDeviceMessageDestination submitLogEvent:](v23, "submitLogEvent:", v43);
    v25 = v44;
  }
  else
  {
    v41 = v13;
    objc_msgSend(v14, "setUsingRemoteDeviceAnalysisNode:", 1);
    v26 = [HMDRemoteDeviceMessageDestination alloc];
    -[HMDCameraRecordingManager messageTargetUUID](self, "messageTargetUUID");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = -[HMDRemoteDeviceMessageDestination initWithTarget:device:](v26, "initWithTarget:device:", v27, v16);

    v28 = a3;
    -[HMDCameraRecordingManager messagePayloadForStartRecordingSessionWithTriggerType:](self, "messagePayloadForStartRecordingSessionWithTriggerType:", a3);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = -[HMDRemoteMessage initWithName:qualityOfService:destination:payload:type:timeout:secure:]([HMDRemoteMessage alloc], "initWithName:qualityOfService:destination:payload:type:timeout:secure:", CFSTR("kStartRecordingSessionRequestKey"), 25, v23, v40, 0, 1, 120.0);
    v29 = (void *)MEMORY[0x227676638]();
    v30 = self;
    HMFGetOSLogHandle();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "shortDescription");
      v39 = v12;
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMFObject shortDescription](v42, "shortDescription");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v55 = v32;
      v56 = 2114;
      v57 = v33;
      v58 = 2114;
      v59 = v34;
      _os_log_impl(&dword_2218F0000, v31, OS_LOG_TYPE_INFO, "%{public}@Forwarding recording session to %{public}@ via message: %{public}@", buf, 0x20u);

      v12 = v39;
    }

    objc_autoreleasePoolPop(v29);
    -[HMDCameraRecordingManager dependencyFactory](v30, "dependencyFactory");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCameraRecordingManager logIdentifier](v30, "logIdentifier");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "createLoadBalancingAttemptWithLocalResponseTimeout:logIdentifier:", v36, 2.0);
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    -[HMDCameraRecordingManager msgDispatcher](v30, "msgDispatcher");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v46[0] = MEMORY[0x24BDAC760];
    v46[1] = 3221225472;
    v46[2] = __149__HMDCameraRecordingManager__forwardRecordingSessionForTrigger_withLoadBalancerDecision_deviceFilter_sessionCoordinationLogEvent_retryAttemptNumber___block_invoke;
    v46[3] = &unk_24E773820;
    v46[4] = v30;
    v47 = v16;
    v48 = v43;
    v49 = v12;
    v52 = a7;
    v25 = v44;
    v50 = v44;
    v13 = v41;
    v51 = v41;
    v53 = v28;
    v24 = v43;
    objc_msgSend(v37, "startWithMessage:messageDispatcher:completion:", v42, v38, v46);

  }
}

- (void)_submitLoadBalancingEventWithDecision:(id)a3 numberOfRetries:(unint64_t)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  HMDCameraRecordingLoadBalancerLogEvent *v29;
  void *v30;
  BOOL v31;
  HMDCameraRecordingLoadBalancerLogEvent *v32;
  void *v33;
  void *v35;

  v5 = a3;
  objc_msgSend(v5, "analysisNode");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "metrics");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hmf_dictionaryForKey:", CFSTR("recordingSessionSummaries"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "cameraUUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "UUIDString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = v9 != 0;

  v29 = [HMDCameraRecordingLoadBalancerLogEvent alloc];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v5, "numberOfAvailableDevices"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a4);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v5, "totalNumberOfJobSlots"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x24BDD16E0];
  v11 = objc_msgSend(v5, "remainingNumberOfJobSlots");

  objc_msgSend(v10, "numberWithInteger:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "residentDevice");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "device");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "productInfo");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "productClass");
  HMFProductClassToString();
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "metrics");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("numberOfActiveRecordingSessions"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "metrics");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("systemResourceUsageLevel"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "metrics");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("numberOfFullJobSlots"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "metrics");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("numberOfPartialJobSlots"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v20) = v31;
  v32 = -[HMDCameraRecordingLoadBalancerLogEvent initWithNumberOfResidents:numberOfRetries:totalNumberOfJobSlots:remainingNumberOfJobSlots:selectedResidentDeviceType:selectedResidentNumberOfActiveStreams:selectedResidentSystemResourceUsageLevel:selectedResidentJobSlots:selectedResidentPartialJobSlots:selectedResidentHasActiveSessionWithCamera:](v29, "initWithNumberOfResidents:numberOfRetries:totalNumberOfJobSlots:remainingNumberOfJobSlots:selectedResidentDeviceType:selectedResidentNumberOfActiveStreams:selectedResidentSystemResourceUsageLevel:selectedResidentJobSlots:selectedResidentPartialJobSlots:selectedResidentHasActiveSessionWithCamera:", v23, v26, v25, v12, v21, v13, v14, v16, v18, v20);

  -[HMDCameraRecordingManager logEventSubmitter](self, "logEventSubmitter");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "submitLogEvent:", v32);

}

- (id)_createRecordingSessionWithHomePresenceByPairingIdentity:(id)a3 selectedConfiguration:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
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
  double v19;
  double v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  HMDCameraRecordingManager *v35;
  NSObject *v36;
  id v37;
  void *v38;
  id v40;
  id v41;
  void *v42;
  uint8_t buf[4];
  void *v44;
  __int16 v45;
  void *v46;
  __int16 v47;
  void *v48;
  __int16 v49;
  void *v50;
  __int16 v51;
  void *v52;
  uint64_t v53;

  v53 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[HMDCameraRecordingManager workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  -[HMDCameraRecordingManager camera](self, "camera");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "hapAccessory");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "home");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "clipManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "localZone");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9 && v10 && v11 && v13)
  {
    objc_msgSend(v7, "generalConfiguration");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "mediaContainerConfigurations");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "firstObject");
    v41 = v6;
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "parameters");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "fragmentLength");
    v42 = v11;
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "doubleValue");
    v20 = v19 / 1000.0;

    objc_msgSend(v7, "generalConfiguration");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "prebufferLength");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "doubleValue");
    v24 = v23;

    objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceNow:", v24 / -1000.0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCameraRecordingManager dependencyFactory](self, "dependencyFactory");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCameraRecordingManager workQueue](self, "workQueue");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "uniqueIdentifier");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "UUIDString");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "createTimelineManagerWithWorkQueue:fragmentDuration:fragmentCreationReferenceDate:logIdentifier:", v27, v25, v29, v20);
    v40 = v7;
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = v41;
    -[HMDCameraRecordingManager dependencyFactory](self, "dependencyFactory");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCameraRecordingManager workQueue](self, "workQueue");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "createRecordingSessionWithWorkQueue:camera:hapAccessory:home:localZone:configuredFragmentDuration:timelineManager:homePresenceByPairingIdentity:", v32, v9, v10, v42, v13, v30, v20, v41);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = v42;
    v7 = v40;

  }
  else
  {
    v34 = (void *)MEMORY[0x227676638]();
    v35 = self;
    HMFGetOSLogHandle();
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v37 = v6;
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544386;
      v44 = v38;
      v45 = 2112;
      v46 = v9;
      v47 = 2112;
      v48 = v10;
      v49 = 2112;
      v50 = v11;
      v51 = 2112;
      v52 = v13;
      _os_log_impl(&dword_2218F0000, v36, OS_LOG_TYPE_ERROR, "%{public}@Cannot start recording session because camera=%@ accessory=%@ home=%@ localZone=%@", buf, 0x34u);

      v6 = v37;
    }

    objc_autoreleasePoolPop(v34);
    v33 = 0;
  }

  return v33;
}

- (void)_configureRecordingSession:(id)a3 withTrigger:(unint64_t)a4
{
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _BOOL8 v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  -[HMDCameraRecordingManager workQueue](self, "workQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  objc_msgSend(v14, "setDelegate:", self);
  objc_msgSend(v14, "configure");
  objc_msgSend(v14, "timelineManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "creationDateForFragmentAtTimeOffset:", 0.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (a4 == 1)
  {
    objc_msgSend(v14, "timelineManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleDoorbellDidActivateAtDate:", v8);
    goto LABEL_5;
  }
  if (!a4)
  {
    objc_msgSend(v14, "timelineManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleMotionActive:didChangeAtDate:", 1, v8);

    objc_msgSend(v14, "timelineManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[HMDCameraRecordingManager isMotionActive](self, "isMotionActive");
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleMotionActive:didChangeAtDate:", v11, v12);

    -[HMDCameraRecordingManager currentRecordingSession](self, "currentRecordingSession");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleMotionActive:", -[HMDCameraRecordingManager isMotionActive](self, "isMotionActive"));
LABEL_5:

  }
}

- (void)assignAccessoryConnectionInfoUsingMessagePayload:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  HMDCameraRecordingManager *v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  HMDCameraRecordingManager *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  HMDCameraRecordingManager *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "hmf_dictionaryForKey:", CFSTR("HMDCameraRecordingAccessorySocketInfo"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE1BBD8]), "initWithDictionary:", v5);
    if (v6)
    {
      objc_msgSend(v4, "hmf_dictionaryForKey:", CFSTR("HMDCameraRecordingAccessoryBonjourDeviceInfo"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (void *)MEMORY[0x227676638]();
      v9 = self;
      HMFGetOSLogHandle();
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = v10;
      if (v7)
      {
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = 138543362;
          v24 = v12;
          _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_INFO, "%{public}@Assigning connection info to accessory", (uint8_t *)&v23, 0xCu);

        }
        objc_autoreleasePoolPop(v8);
        -[HMDCameraRecordingManager accessory](v9, "accessory");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "assignBonjourDeviceInfo:socketInfo:", v7, v6);

      }
      else
      {
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        {
          HMFGetLogIdentifier();
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = 138543362;
          v24 = v22;
          _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_DEBUG, "%{public}@No bonjour device info received for start recording session request", (uint8_t *)&v23, 0xCu);

        }
        objc_autoreleasePoolPop(v8);
      }

    }
    else
    {
      v18 = (void *)MEMORY[0x227676638]();
      v19 = self;
      HMFGetOSLogHandle();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = 138543618;
        v24 = v21;
        v25 = 2112;
        v26 = v5;
        _os_log_impl(&dword_2218F0000, v20, OS_LOG_TYPE_ERROR, "%{public}@Failed to create HAPSocketInfo for start recording request with dictionary: %@", (uint8_t *)&v23, 0x16u);

      }
      objc_autoreleasePoolPop(v18);
    }

  }
  else
  {
    v14 = (void *)MEMORY[0x227676638]();
    v15 = self;
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 138543362;
      v24 = v17;
      _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_DEBUG, "%{public}@No socket info received for start recording session request", (uint8_t *)&v23, 0xCu);

    }
    objc_autoreleasePoolPop(v14);
  }

}

- (void)handleStartRecordingSessionRequest:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  HMDCameraRecordingManager *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  HMDCameraRecordingBulkSessionStartLogEvent *v14;
  void *v15;
  void *v16;
  HMDCameraRecordingBulkSessionStartLogEvent *v17;
  uint64_t v18;
  HMDCameraRecordingBulkSessionStartLogEvent *v19;
  void *v20;
  HMDCameraRecordingManager *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  _QWORD v25[5];
  HMDCameraRecordingBulkSessionStartLogEvent *v26;
  id v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDCameraRecordingManager workQueue](self, "workQueue");
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
    objc_msgSend(v4, "shortDescription");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v29 = v9;
    v30 = 2112;
    v31 = v10;
    _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_INFO, "%{public}@Received message to handle recording session: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v6);
  objc_msgSend(v4, "messagePayload");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCameraRecordingManager assignAccessoryConnectionInfoUsingMessagePayload:](v7, "assignAccessoryConnectionInfoUsingMessagePayload:", v11);

  objc_msgSend(v4, "messagePayload");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "hmf_numberForKey:", CFSTR("notificationTriggerType"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[HMDCameraRecordingManager _resetRetryContextWithReason:](v7, "_resetRetryContextWithReason:", CFSTR("Received recording session trigger from primary resident"));
    v14 = [HMDCameraRecordingBulkSessionStartLogEvent alloc];
    -[HMDCameraRecordingManager accessory](v7, "accessory");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "identifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[HMDCameraRecordingBulkSessionStartLogEvent initWithAccessoryIdentifier:](v14, "initWithAccessoryIdentifier:", v16);

    v18 = objc_msgSend(v13, "integerValue");
    v25[0] = MEMORY[0x24BDAC760];
    v25[1] = 3221225472;
    v25[2] = __64__HMDCameraRecordingManager_handleStartRecordingSessionRequest___block_invoke;
    v25[3] = &unk_24E799FD0;
    v25[4] = v7;
    v26 = v17;
    v27 = v4;
    v19 = v17;
    -[HMDCameraRecordingManager _prepareRecordingSessionForTrigger:homePresenceByPairingIdentity:reason:completionCallback:](v7, "_prepareRecordingSessionForTrigger:homePresenceByPairingIdentity:reason:completionCallback:", v18, MEMORY[0x24BDBD1B8], CFSTR("request from primary resident"), v25);

  }
  else
  {
    v20 = (void *)MEMORY[0x227676638]();
    v21 = v7;
    HMFGetOSLogHandle();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "messagePayload");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v29 = v23;
      v30 = 2112;
      v31 = v24;
      _os_log_impl(&dword_2218F0000, v22, OS_LOG_TYPE_ERROR, "%{public}@Could not find trigger in message payload: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v20);
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 48);
    v19 = (HMDCameraRecordingBulkSessionStartLogEvent *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "respondWithError:", v19);
  }

}

- (void)_submitBulkSessionStartLogEvent:(id)a3 error:(id)a4
{
  id v6;
  int v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a4;
  v6 = a3;
  v7 = objc_msgSend((id)objc_opt_class(), "_isSessionAlreadyInProgressError:", v10);
  -[HMDCameraRecordingManager logEventSubmitter](self, "logEventSubmitter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v7)
    objc_msgSend(v8, "submitLogEvent:", v6);
  else
    objc_msgSend(v8, "submitLogEvent:error:", v6, v10);

}

- (void)_prepareRecordingSessionForTrigger:(unint64_t)a3 homePresenceByPairingIdentity:(id)a4 reason:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  HMDCameraRecordingBulkSessionStartLogEvent *v11;
  void *v12;
  void *v13;
  HMDCameraRecordingBulkSessionStartLogEvent *v14;
  HMDCameraRecordingBulkSessionStartLogEvent *v15;
  _QWORD v16[5];
  HMDCameraRecordingBulkSessionStartLogEvent *v17;

  v8 = a5;
  v9 = a4;
  -[HMDCameraRecordingManager workQueue](self, "workQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v10);

  v11 = [HMDCameraRecordingBulkSessionStartLogEvent alloc];
  -[HMDCameraRecordingManager accessory](self, "accessory");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "identifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[HMDCameraRecordingBulkSessionStartLogEvent initWithAccessoryIdentifier:](v11, "initWithAccessoryIdentifier:", v13);

  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __101__HMDCameraRecordingManager__prepareRecordingSessionForTrigger_homePresenceByPairingIdentity_reason___block_invoke;
  v16[3] = &unk_24E79BCC8;
  v16[4] = self;
  v17 = v14;
  v15 = v14;
  -[HMDCameraRecordingManager _prepareRecordingSessionForTrigger:homePresenceByPairingIdentity:reason:completionCallback:](self, "_prepareRecordingSessionForTrigger:homePresenceByPairingIdentity:reason:completionCallback:", a3, v9, v8, v16);

}

- (void)_prepareRecordingSessionForTrigger:(unint64_t)a3 homePresenceByPairingIdentity:(id)a4 reason:(id)a5 completionCallback:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  HMDCameraRecordingManager *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  _QWORD v21[5];
  id v22;
  id v23;
  id v24;
  unint64_t v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = (void *)MEMORY[0x227676638]();
  v14 = self;
  HMFGetOSLogHandle();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v27 = v16;
    v28 = 2112;
    v29 = v11;
    _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_INFO, "%{public}@Configuring recording session with reason: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v13);
  -[HMDCameraRecordingManager recordingSettingsControl](v14, "recordingSettingsControl");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __120__HMDCameraRecordingManager__prepareRecordingSessionForTrigger_homePresenceByPairingIdentity_reason_completionCallback___block_invoke;
  v21[3] = &unk_24E773848;
  v24 = v12;
  v25 = a3;
  v21[4] = v14;
  v22 = v10;
  v23 = v11;
  v18 = v11;
  v19 = v10;
  v20 = v12;
  objc_msgSend(v17, "configureCameraRecordingSettingsWithCompletion:", v21);

}

- (void)_startRecordingSessionForTrigger:(unint64_t)a3 homePresenceByPairingIdentity:(id)a4 reason:(id)a5 selectedConfiguration:(id)a6 completionCallback:(id)a7
{
  id v12;
  id v13;
  id v14;
  void (**v15)(id, _QWORD);
  NSObject *v16;
  void *v17;
  HMDCameraRecordingManager *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  HMDCameraRecordingManager *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  char v30;
  void *v31;
  void *v32;
  HMDCameraRecordingManager *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  HMDCameraRecordingManager *v39;
  NSObject *v40;
  void *v41;
  void *v42;
  void *v43;
  int v44;
  void *v45;
  HMDCameraRecordingManager *v46;
  NSObject *v47;
  _BOOL4 v48;
  void *v49;
  void *v50;
  void *v51;
  _QWORD v52[5];
  id v53;
  id v54;
  void (**v55)(id, _QWORD);
  unint64_t v56;
  uint8_t buf[4];
  void *v58;
  __int16 v59;
  id v60;
  uint64_t v61;

  v61 = *MEMORY[0x24BDAC8D0];
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = (void (**)(id, _QWORD))a7;
  -[HMDCameraRecordingManager workQueue](self, "workQueue");
  v16 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v16);

  v17 = (void *)MEMORY[0x227676638]();
  v18 = self;
  HMFGetOSLogHandle();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v58 = v20;
    v59 = 2112;
    v60 = v13;
    _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_INFO, "%{public}@Starting recording session with reason: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v17);
  -[HMDCameraRecordingManager sessionRetryTimer](v18, "sessionRetryTimer");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    v22 = (void *)MEMORY[0x227676638]();
    v23 = v18;
    HMFGetOSLogHandle();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDCameraRecordingManager sessionRetryTimer](v23, "sessionRetryTimer");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "timeInterval");
      *(_DWORD *)buf = 138543618;
      v58 = v25;
      v59 = 2048;
      v60 = v27;
      _os_log_impl(&dword_2218F0000, v24, OS_LOG_TYPE_INFO, "%{public}@Waiting for retry timer with duration: %f to expire", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v22);
    v15[2](v15, 0);
    goto LABEL_16;
  }
  -[HMDCameraRecordingManager cameraLoadBalancer](v18, "cameraLoadBalancer");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCameraRecordingManager cameraUUID](v18, "cameraUUID");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v28, "isReadyToRecordForCameraWithUUID:", v29);

  if ((v30 & 1) == 0)
  {
    v38 = (void *)MEMORY[0x227676638]();
    v39 = v18;
    HMFGetOSLogHandle();
    v40 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v58 = v41;
      _os_log_impl(&dword_2218F0000, v40, OS_LOG_TYPE_ERROR, "%{public}@Unable to start recording session, no backing store available", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v38);
    v36 = (void *)MEMORY[0x24BDD1540];
    v37 = 3302;
    goto LABEL_15;
  }
  -[HMDCameraRecordingManager currentBulkSendSessionReader](v18, "currentBulkSendSessionReader");
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  if (v31)
  {
    v32 = (void *)MEMORY[0x227676638]();
    v33 = v18;
    HMFGetOSLogHandle();
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v58 = v35;
      _os_log_impl(&dword_2218F0000, v34, OS_LOG_TYPE_INFO, "%{public}@A bulk send session is already opened", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v32);
    v36 = (void *)MEMORY[0x24BDD1540];
    v37 = 3303;
LABEL_15:
    objc_msgSend(v36, "hmInternalErrorWithCode:", v37);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, void *))v15)[2](v15, v42);

    goto LABEL_16;
  }
  -[HMDCameraRecordingManager bulkSendSessionInitiator](v18, "bulkSendSessionInitiator");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = objc_msgSend(v43, "isSessionOpenInProgress");

  v45 = (void *)MEMORY[0x227676638]();
  v46 = v18;
  HMFGetOSLogHandle();
  v47 = objc_claimAutoreleasedReturnValue();
  v48 = os_log_type_enabled(v47, OS_LOG_TYPE_INFO);
  if (v44)
  {
    if (v48)
    {
      HMFGetLogIdentifier();
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v58 = v49;
      _os_log_impl(&dword_2218F0000, v47, OS_LOG_TYPE_INFO, "%{public}@A bulk send session open is already in progress", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v45);
    v36 = (void *)MEMORY[0x24BDD1540];
    v37 = 3304;
    goto LABEL_15;
  }
  if (v48)
  {
    HMFGetLogIdentifier();
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v58 = v50;
    _os_log_impl(&dword_2218F0000, v47, OS_LOG_TYPE_INFO, "%{public}@Opening new bulk send session", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v45);
  -[HMDCameraRecordingManager bulkSendSessionInitiator](v46, "bulkSendSessionInitiator");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v52[0] = MEMORY[0x24BDAC760];
  v52[1] = 3221225472;
  v52[2] = __140__HMDCameraRecordingManager__startRecordingSessionForTrigger_homePresenceByPairingIdentity_reason_selectedConfiguration_completionCallback___block_invoke;
  v52[3] = &unk_24E773870;
  v52[4] = v46;
  v55 = v15;
  v53 = v12;
  v54 = v14;
  v56 = a3;
  objc_msgSend(v51, "openNewSessionWithCallback:", v52);

LABEL_16:
}

- (void)_handleBulkSendSessionCreated:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  HMDCameraRecordingManager *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDCameraRecordingManager workQueue](self, "workQueue");
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
    v24 = 138543618;
    v25 = v9;
    v26 = 2112;
    v27 = v4;
    _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_INFO, "%{public}@Created bulk send session: %@", (uint8_t *)&v24, 0x16u);

  }
  objc_autoreleasePoolPop(v6);
  -[HMDCameraRecordingManager dependencyFactory](v7, "dependencyFactory");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "preferences");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "preferenceForKey:", CFSTR("bulkSendSessionReadTimeoutFactor"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "numberValue");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v13, "integerValue") < 1)
    v14 = 2.0;
  else
    v14 = (double)objc_msgSend(v13, "integerValue");
  -[HMDCameraRecordingManager currentRecordingSession](v7, "currentRecordingSession");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "configuredFragmentDuration");
  v17 = v14 * v16;

  -[HMDCameraRecordingManager dependencyFactory](v7, "dependencyFactory");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCameraRecordingManager workQueue](v7, "workQueue");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCameraRecordingManager logIdentifier](v7, "logIdentifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "createBulkSendSessionReaderWithWorkQueue:session:readTimeout:logIdentifier:", v19, v4, v20, v17);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCameraRecordingManager setCurrentBulkSendSessionReader:](v7, "setCurrentBulkSendSessionReader:", v21);

  -[HMDCameraRecordingManager currentBulkSendSessionReader](v7, "currentBulkSendSessionReader");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setDelegate:", v7);

  -[HMDCameraRecordingManager currentBulkSendSessionReader](v7, "currentBulkSendSessionReader");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "start");

}

- (void)timerDidFire:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  HMDCameraRecordingManager *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDCameraRecordingManager workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[HMDCameraRecordingManager sessionRetryTimer](self, "sessionRetryTimer");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6 == v4)
  {
    -[HMDCameraRecordingManager setSessionRetryTimer:](self, "setSessionRetryTimer:", 0);
    if (-[HMDCameraRecordingManager isMotionActive](self, "isMotionActive"))
    {
      v7 = (void *)MEMORY[0x227676638]();
      v8 = self;
      HMFGetOSLogHandle();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = 138543362;
        v14 = v10;
        _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@Starting recording session after session retry timer has expired", (uint8_t *)&v13, 0xCu);

      }
      objc_autoreleasePoolPop(v7);
      -[HMDCameraRecordingManager sessionRetryContext](v8, "sessionRetryContext");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "homePresenceByPairingIdentity");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDCameraRecordingManager _prepareRecordingSessionForTrigger:homePresenceByPairingIdentity:reason:](v8, "_prepareRecordingSessionForTrigger:homePresenceByPairingIdentity:reason:", 0, v12, CFSTR("Retry timer expired"));

    }
  }

}

- (unsigned)_closeEventReasonForRecordingSessionError:(id)a3
{
  id v4;
  NSObject *v5;
  unsigned __int16 v6;

  v4 = a3;
  -[HMDCameraRecordingManager workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  if (v4)
  {
    if (objc_msgSend(v4, "code") == 1)
      v6 = 8;
    else
      v6 = 5;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)_closeCurrentSessionsWithReason:(unsigned __int16)a3
{
  -[HMDCameraRecordingManager _closeCurrentSessionsWithReason:error:](self, "_closeCurrentSessionsWithReason:error:", a3, 0);
}

- (void)_closeCurrentSessionsWithReason:(unsigned __int16)a3 error:(id)a4
{
  uint64_t v4;
  NSObject *v6;
  void *v7;
  HMDCameraRecordingBulkSessionEndLogEvent *v8;
  void *v9;
  void *v10;
  HMDCameraRecordingBulkSessionEndLogEvent *v11;
  void *v12;
  void *v13;
  id v14;

  v4 = a3;
  v14 = a4;
  -[HMDCameraRecordingManager workQueue](self, "workQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  -[HMDCameraRecordingManager currentBulkSendSessionReader](self, "currentBulkSendSessionReader");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCameraRecordingManager setCurrentBulkSendSessionReader:](self, "setCurrentBulkSendSessionReader:", 0);
  objc_msgSend(v7, "stopWithReason:", v4);
  v8 = [HMDCameraRecordingBulkSessionEndLogEvent alloc];
  -[HMDCameraRecordingManager accessory](self, "accessory");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[HMDCameraRecordingBulkSessionEndLogEvent initWithAccessoryIdentifier:](v8, "initWithAccessoryIdentifier:", v10);

  if ((_DWORD)v4)
  {
    if (v14)
    {
      -[HMDCameraRecordingManager logEventSubmitter](self, "logEventSubmitter");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "submitLogEvent:error:", v11, v14);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 52);
      v14 = (id)objc_claimAutoreleasedReturnValue();
      -[HMDCameraRecordingManager logEventSubmitter](self, "logEventSubmitter");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("HMDCameraRecordingBulkSessionCloseReason"), v4, 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "submitLogEvent:error:", v11, v13);

    }
  }
  else
  {
    -[HMDCameraRecordingManager logEventSubmitter](self, "logEventSubmitter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "submitLogEvent:", v11);
  }

  -[HMDCameraRecordingManager _resetCurrentRecordingSession:](self, "_resetCurrentRecordingSession:", v14);
}

- (void)_resetRetryContextWithReason:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  HMDCameraRecordingManager *v8;
  NSObject *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDCameraRecordingManager workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[HMDCameraRecordingManager sessionRetryContext](self, "sessionRetryContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = (void *)MEMORY[0x227676638]();
    v8 = self;
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543618;
      v12 = v10;
      v13 = 2112;
      v14 = v4;
      _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@Resetting session retry context with reason: %@", (uint8_t *)&v11, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
    -[HMDCameraRecordingManager setSessionRetryTimer:](v8, "setSessionRetryTimer:", 0);
    -[HMDCameraRecordingManager setSessionRetryContext:](v8, "setSessionRetryContext:", 0);
  }

}

- (void)_startSessionRetryTimer
{
  NSObject *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  HMDCameraRecordingManager *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  __int16 v21;
  double v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  -[HMDCameraRecordingManager workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[HMDCameraRecordingManager sessionRetryTimer](self, "sessionRetryTimer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    _HMFPreconditionFailure();
  -[HMDCameraRecordingManager sessionRetryContext](self, "sessionRetryContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "retryInterval");
  v7 = v6;

  -[HMDCameraRecordingManager sessionRetryContext](self, "sessionRetryContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "computeNextRetryInterval");

  v9 = (void *)MEMORY[0x227676638]();
  v10 = self;
  HMFGetOSLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 138543618;
    v20 = v12;
    v21 = 2048;
    v22 = v7;
    _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_INFO, "%{public}@Starting session retry timer with interval: %f", (uint8_t *)&v19, 0x16u);

  }
  objc_autoreleasePoolPop(v9);
  -[HMDCameraRecordingManager dependencyFactory](v10, "dependencyFactory");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "createTimerWithTimeInterval:", v7);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCameraRecordingManager setSessionRetryTimer:](v10, "setSessionRetryTimer:", v14);

  -[HMDCameraRecordingManager sessionRetryTimer](v10, "sessionRetryTimer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setDelegate:", v10);

  -[HMDCameraRecordingManager workQueue](v10, "workQueue");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCameraRecordingManager sessionRetryTimer](v10, "sessionRetryTimer");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setDelegateQueue:", v16);

  -[HMDCameraRecordingManager sessionRetryTimer](v10, "sessionRetryTimer");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "resume");

}

- (void)_resetCurrentRecordingSession:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _BOOL4 v10;
  _BOOL4 v11;
  void *v12;
  void *v13;
  HMDCameraRecordingManager *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  HMDCameraRecordingManager *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  HMDCameraRecordingManager *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  id v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDCameraRecordingManager workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[HMDCameraRecordingManager currentRecordingSession](self, "currentRecordingSession");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[HMDCameraRecordingManager bulkSendSessionInitiator](self, "bulkSendSessionInitiator");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stop");

    -[HMDCameraRecordingManager currentRecordingSession](self, "currentRecordingSession");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCameraRecordingManager setCurrentRecordingSession:](self, "setCurrentRecordingSession:", 0);
    objc_msgSend(v8, "handleNoMoreFragmentsAvailable");
    objc_msgSend(v8, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[HMDCameraRecordingManager isMotionActive](self, "isMotionActive");
    if (v4)
    {
      v11 = v10;
      if (objc_msgSend(v4, "code") != 14)
      {
        if (objc_msgSend(v4, "code") == 21)
        {
          -[HMDCameraRecordingManager recordingSettingsControl](self, "recordingSettingsControl");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "handleAccessoryIsNotConfiguredError");
LABEL_7:

          goto LABEL_8;
        }
        if (v11)
        {
          v18 = (void *)MEMORY[0x227676638]();
          v19 = self;
          HMFGetOSLogHandle();
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            -[HMDCameraRecordingManager isMotionActive](v19, "isMotionActive");
            HMFBooleanToString();
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138544130;
            v33 = v21;
            v34 = 2112;
            v35 = v9;
            v36 = 2112;
            v37 = v22;
            v38 = 2112;
            v39 = v4;
            _os_log_impl(&dword_2218F0000, v20, OS_LOG_TYPE_INFO, "%{public}@Retrying session with identifier: %@ because motion active: %@, error: %@", buf, 0x2Au);

          }
          objc_autoreleasePoolPop(v18);
          -[HMDCameraRecordingManager sessionRetryContext](v19, "sessionRetryContext");
          v23 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v23)
          {
            v24 = (void *)MEMORY[0x227676638]();
            v25 = v19;
            HMFGetOSLogHandle();
            v26 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543362;
              v33 = v27;
              _os_log_impl(&dword_2218F0000, v26, OS_LOG_TYPE_INFO, "%{public}@Creating session retry context", buf, 0xCu);

            }
            objc_autoreleasePoolPop(v24);
            -[HMDCameraRecordingManager dependencyFactory](v25, "dependencyFactory");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            -[HMDCameraRecordingManager workQueue](v25, "workQueue");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "homePresenceByPairingIdentity");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "createRecordingSessionRetryContextWithWorkQueue:homePresenceByPairingIdentity:", v29, v30);
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            -[HMDCameraRecordingManager setSessionRetryContext:](v25, "setSessionRetryContext:", v31);

          }
          -[HMDCameraRecordingManager _startSessionRetryTimer](v19, "_startSessionRetryTimer");
          goto LABEL_11;
        }
      }
LABEL_8:
      v13 = (void *)MEMORY[0x227676638]();
      v14 = self;
      HMFGetOSLogHandle();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDCameraRecordingManager isMotionActive](v14, "isMotionActive");
        HMFBooleanToString();
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v33 = v16;
        v34 = 2112;
        v35 = v9;
        v36 = 2112;
        v37 = v17;
        v38 = 2112;
        v39 = v4;
        _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_INFO, "%{public}@Not retrying session with identifier: %@ because motion active: %@, error: %@", buf, 0x2Au);

      }
      objc_autoreleasePoolPop(v13);
LABEL_11:

      goto LABEL_12;
    }
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Session with identifier: %@ succeeded"), v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCameraRecordingManager _resetRetryContextWithReason:](self, "_resetRetryContextWithReason:", v12);
    goto LABEL_7;
  }
LABEL_12:

}

- (void)bulkSendSessionReader:(id)a3 didReadFragment:(id)a4
{
  id v5;
  NSObject *v6;
  id v7;

  v5 = a4;
  -[HMDCameraRecordingManager workQueue](self, "workQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  -[HMDCameraRecordingManager currentRecordingSession](self, "currentRecordingSession");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "handleFragment:", v5);

}

- (void)bulkSendSessionReader:(id)a3 didFinishWithReason:(unsigned __int16)a4
{
  uint64_t v4;
  NSObject *v6;

  v4 = a4;
  -[HMDCameraRecordingManager workQueue](self, "workQueue", a3);
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  -[HMDCameraRecordingManager _closeCurrentSessionsWithReason:](self, "_closeCurrentSessionsWithReason:", v4);
}

- (id)logIdentifier
{
  void *v2;
  void *v3;

  -[HMDCameraRecordingManager camera](self, "camera");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "logIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)session:(id)a3 didEndWithError:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  HMDCameraRecordingManager *v10;
  NSObject *v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  HMDCameraRecordingManager *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  __int16 v24;
  int v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[HMDCameraRecordingManager workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  if (-[HMDCameraRecordingManager didShutDown](self, "didShutDown"))
  {
    v9 = (void *)MEMORY[0x227676638]();
    v10 = self;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 138543362;
      v23 = v12;
      _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_INFO, "%{public}@Ignoring closeSession:withError: delegate callback because recording manager was shut down", (uint8_t *)&v22, 0xCu);

    }
    objc_autoreleasePoolPop(v9);
  }
  else
  {
    -[HMDCameraRecordingManager currentRecordingSession](self, "currentRecordingSession");
    v13 = (id)objc_claimAutoreleasedReturnValue();

    if (v13 == v6)
    {
      v14 = -[HMDCameraRecordingManager _closeEventReasonForRecordingSessionError:](self, "_closeEventReasonForRecordingSessionError:", v7);
      v15 = (void *)MEMORY[0x227676638]();
      v16 = self;
      HMFGetOSLogHandle();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = 138543618;
        v23 = v18;
        v24 = 1024;
        v25 = v14;
        _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_INFO, "%{public}@Closing current session with reason: %d", (uint8_t *)&v22, 0x12u);

      }
      objc_autoreleasePoolPop(v15);
      -[HMDCameraRecordingManager _closeCurrentSessionsWithReason:error:](v16, "_closeCurrentSessionsWithReason:error:", v14, v7);
    }
    -[HMDCameraRecordingManager activeRecordingSessions](self, "activeRecordingSessions");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "removeObject:", v6);

    -[HMDCameraRecordingManager cameraLoadBalancer](self, "cameraLoadBalancer");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCameraRecordingManager cameraUUID](self, "cameraUUID");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "recordingDidEndForCameraWithUUID:", v21);

  }
}

- (void)handleCameraSettingsDidChangeNotification:(id)a3
{
  NSObject *v4;
  _QWORD block[5];

  -[HMDCameraRecordingManager workQueue](self, "workQueue", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __71__HMDCameraRecordingManager_handleCameraSettingsDidChangeNotification___block_invoke;
  block[3] = &unk_24E79C240;
  block[4] = self;
  dispatch_async(v4, block);

}

- (BOOL)supportsDeviceWithCapabilities:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  if (objc_msgSend(v3, "supportsCameraRecording")
    && objc_msgSend(v3, "supportsFaceClassification"))
  {
    v4 = objc_msgSend(v3, "supportsCameraPackageDetection");
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (NSUUID)messageTargetUUID
{
  return self->_messageTargetUUID;
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 24, 1);
}

- (HMFMessageDispatcher)msgDispatcher
{
  return (HMFMessageDispatcher *)objc_getProperty(self, a2, 32, 1);
}

- (HMDCameraRecordingLoadBalancer)cameraLoadBalancer
{
  return (HMDCameraRecordingLoadBalancer *)objc_getProperty(self, a2, 40, 1);
}

- (HMDFeaturesDataSource)featuresDataSource
{
  return (HMDFeaturesDataSource *)objc_getProperty(self, a2, 48, 1);
}

- (NSUUID)cameraUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 56, 1);
}

- (NSNotificationCenter)notificationCenter
{
  return (NSNotificationCenter *)objc_getProperty(self, a2, 64, 1);
}

- (HMMLogEventSubmitting)logEventSubmitter
{
  return (HMMLogEventSubmitting *)objc_getProperty(self, a2, 72, 1);
}

- (NSMutableSet)activeRecordingSessions
{
  return (NSMutableSet *)objc_getProperty(self, a2, 80, 1);
}

- (HMDCameraRecordingSessionNotificationTrigger)notificationTrigger
{
  return (HMDCameraRecordingSessionNotificationTrigger *)objc_getProperty(self, a2, 88, 1);
}

- (HMDCameraRecordingSettingsControl)recordingSettingsControl
{
  return (HMDCameraRecordingSettingsControl *)objc_getProperty(self, a2, 96, 1);
}

- (HMDCameraRecordingManagerDependencyFactory)dependencyFactory
{
  return (HMDCameraRecordingManagerDependencyFactory *)objc_getProperty(self, a2, 104, 1);
}

- (HMDCameraRecordingBulkSendSessionInitiator)bulkSendSessionInitiator
{
  return (HMDCameraRecordingBulkSendSessionInitiator *)objc_getProperty(self, a2, 112, 1);
}

- (HMDHAPAccessory)accessory
{
  return (HMDHAPAccessory *)objc_loadWeakRetained((id *)&self->_accessory);
}

- (void)setAccessory:(id)a3
{
  objc_storeWeak((id *)&self->_accessory, a3);
}

- (HMDCameraProfile)camera
{
  return (HMDCameraProfile *)objc_loadWeakRetained((id *)&self->_camera);
}

- (void)setCamera:(id)a3
{
  objc_storeWeak((id *)&self->_camera, a3);
}

- (HMDCameraRecordingSession)currentRecordingSession
{
  return (HMDCameraRecordingSession *)objc_getProperty(self, a2, 136, 1);
}

- (void)setCurrentRecordingSession:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 136);
}

- (HMDCameraRecordingBulkSendSessionReader)currentBulkSendSessionReader
{
  return (HMDCameraRecordingBulkSendSessionReader *)objc_getProperty(self, a2, 144, 1);
}

- (void)setCurrentBulkSendSessionReader:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 144);
}

- (HMFTimer)sessionRetryTimer
{
  return (HMFTimer *)objc_getProperty(self, a2, 152, 1);
}

- (void)setSessionRetryTimer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 152);
}

- (HMDCameraRecordingSessionRetryContext)sessionRetryContext
{
  return (HMDCameraRecordingSessionRetryContext *)objc_getProperty(self, a2, 160, 1);
}

- (void)setSessionRetryContext:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 160);
}

- (BOOL)didShutDown
{
  return self->_didShutDown;
}

- (void)setDidShutDown:(BOOL)a3
{
  self->_didShutDown = a3;
}

- (BOOL)isMotionActive
{
  return self->_motionActive;
}

- (void)setMotionActive:(BOOL)a3
{
  self->_motionActive = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionRetryContext, 0);
  objc_storeStrong((id *)&self->_sessionRetryTimer, 0);
  objc_storeStrong((id *)&self->_currentBulkSendSessionReader, 0);
  objc_storeStrong((id *)&self->_currentRecordingSession, 0);
  objc_destroyWeak((id *)&self->_camera);
  objc_destroyWeak((id *)&self->_accessory);
  objc_storeStrong((id *)&self->_bulkSendSessionInitiator, 0);
  objc_storeStrong((id *)&self->_dependencyFactory, 0);
  objc_storeStrong((id *)&self->_recordingSettingsControl, 0);
  objc_storeStrong((id *)&self->_notificationTrigger, 0);
  objc_storeStrong((id *)&self->_activeRecordingSessions, 0);
  objc_storeStrong((id *)&self->_logEventSubmitter, 0);
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_storeStrong((id *)&self->_cameraUUID, 0);
  objc_storeStrong((id *)&self->_featuresDataSource, 0);
  objc_storeStrong((id *)&self->_cameraLoadBalancer, 0);
  objc_storeStrong((id *)&self->_msgDispatcher, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_messageTargetUUID, 0);
}

void __71__HMDCameraRecordingManager_handleCameraSettingsDidChangeNotification___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend(*(id *)(a1 + 32), "didShutDown"))
  {
    v2 = (void *)MEMORY[0x227676638]();
    v3 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138543362;
      v18 = v5;
      _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_INFO, "%{public}@Ignoring handleCameraSettingsDidChangeNotification: because recording manager was shut down", (uint8_t *)&v17, 0xCu);

    }
    objc_autoreleasePoolPop(v2);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "camera");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "currentSettings");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "currentAccessMode");

    if (HMIsRecordingAllowedForCameraAccessMode())
    {
      if (objc_msgSend(*(id *)(a1 + 32), "isMotionActive"))
      {
        v8 = (void *)MEMORY[0x227676638](objc_msgSend(*(id *)(a1 + 32), "_resetRetryContextWithReason:", CFSTR("Settings changed to allow recording")));
        v9 = *(id *)(a1 + 32);
        HMFGetOSLogHandle();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = 138543362;
          v18 = v11;
          _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Motion is active and settings changed to allow recording, attempting to coordinate a recording session", (uint8_t *)&v17, 0xCu);

        }
        objc_autoreleasePoolPop(v8);
        objc_msgSend(*(id *)(a1 + 32), "_coordinateRecordingSessionForTrigger:", 0);
      }
    }
    else
    {
      v12 = (void *)MEMORY[0x227676638]();
      v13 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        HMCameraAccessModeAsString();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = 138543618;
        v18 = v15;
        v19 = 2112;
        v20 = v16;
        _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_INFO, "%{public}@Closing current session because current access mode is: %@", (uint8_t *)&v17, 0x16u);

      }
      objc_autoreleasePoolPop(v12);
      objc_msgSend(*(id *)(a1 + 32), "_closeCurrentSessionsWithReason:", 3);
    }
  }
}

void __140__HMDCameraRecordingManager__startRecordingSessionForTrigger_homePresenceByPairingIdentity_reason_selectedConfiguration_completionCallback___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  NSObject *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  int v24;
  void *v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "workQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "_createRecordingSessionWithHomePresenceByPairingIdentity:selectedConfiguration:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = (void *)MEMORY[0x227676638]();
      v10 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = 138543618;
        v25 = v12;
        v26 = 2112;
        v27 = v8;
        _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_INFO, "%{public}@Created recording session: %@", (uint8_t *)&v24, 0x16u);

      }
      objc_autoreleasePoolPop(v9);
      objc_msgSend(*(id *)(a1 + 32), "setCurrentRecordingSession:", v8);
      objc_msgSend(*(id *)(a1 + 32), "activeRecordingSessions");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "addObject:", v8);

      objc_msgSend(*(id *)(a1 + 32), "_configureRecordingSession:withTrigger:", v8, *(_QWORD *)(a1 + 64));
      v14 = *(void **)(a1 + 32);
      objc_msgSend(v5, "session");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "_handleBulkSendSessionCreated:", v15);

      objc_msgSend(*(id *)(a1 + 32), "cameraLoadBalancer");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "cameraUUID");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "recordingDidStartForCameraWithUUID:", v17);

      (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    }
    else
    {
      v22 = *(_QWORD *)(a1 + 56);
      objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 23);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *))(v22 + 16))(v22, v23);

    }
  }
  else
  {
    v18 = (void *)MEMORY[0x227676638]();
    v19 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 138543618;
      v25 = v21;
      v26 = 2112;
      v27 = v6;
      _os_log_impl(&dword_2218F0000, v20, OS_LOG_TYPE_ERROR, "%{public}@Failed to open bulk send session: %@", (uint8_t *)&v24, 0x16u);

    }
    objc_autoreleasePoolPop(v18);
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }

}

void __120__HMDCameraRecordingManager__prepareRecordingSessionForTrigger_homePresenceByPairingIdentity_reason_completionCallback___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "_startRecordingSessionForTrigger:homePresenceByPairingIdentity:reason:selectedConfiguration:completionCallback:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), v5, *(_QWORD *)(a1 + 56));
  }
  else
  {
    v7 = (void *)MEMORY[0x227676638]();
    v8 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543618;
      v12 = v10;
      v13 = 2112;
      v14 = v6;
      _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_ERROR, "%{public}@Failed to configure camera recording settings: %@", (uint8_t *)&v11, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }

}

uint64_t __101__HMDCameraRecordingManager__prepareRecordingSessionForTrigger_homePresenceByPairingIdentity_reason___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_submitBulkSessionStartLogEvent:error:", *(_QWORD *)(a1 + 40), a2);
}

void __64__HMDCameraRecordingManager_handleStartRecordingSessionRequest___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  id v5;
  void (**v6)(id, id, _QWORD);

  v3 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5 = a2;
  objc_msgSend(v3, "_submitBulkSessionStartLogEvent:error:", v4, v5);
  objc_msgSend(*(id *)(a1 + 48), "responseHandler");
  v6 = (void (**)(id, id, _QWORD))objc_claimAutoreleasedReturnValue();
  v6[2](v6, v5, 0);

}

void __149__HMDCameraRecordingManager__forwardRecordingSessionForTrigger_withLoadBalancerDecision_deviceFilter_sessionCoordinationLogEvent_retryAttemptNumber___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  const char *v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  void *v19;
  id v20;
  NSObject *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  HMDCameraRecordingSessionCoordinationLogEvent *v30;
  HMDCameraRecordingSessionCoordinationLogEvent *v31;
  void *v32;
  uint64_t v33;
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
  uint64_t v44;
  void *v45;
  id v46;
  NSObject *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  NSObject *v52;
  uint64_t v53;
  HMDCameraRecordingSessionCoordinationLogEvent *v54;
  uint64_t v55;
  void *v56;
  id v57;
  NSObject *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  HMDCameraRecordingSessionCoordinationLogEvent *v63;
  _QWORD v64[5];
  id v65;
  HMDCameraRecordingSessionCoordinationLogEvent *v66;
  id v67;
  uint64_t v68;
  uint64_t v69;
  _QWORD aBlock[4];
  id v71;
  id v72;
  _QWORD block[5];
  uint8_t buf[4];
  void *v75;
  __int16 v76;
  void *v77;
  __int16 v78;
  id v79;
  uint64_t v80;

  v80 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (v3)
  {
    if (objc_msgSend((id)objc_opt_class(), "_isSessionAlreadyInProgressError:", v3))
    {
      v4 = (void *)MEMORY[0x227676638]();
      v5 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "shortDescription");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v75 = v7;
        v76 = 2114;
        v77 = v8;
        v78 = 2112;
        v79 = v3;
        v9 = "%{public}@Received error that a session is already in progress on device %{public}@: %@";
LABEL_11:
        _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_INFO, v9, buf, 0x20u);

        goto LABEL_12;
      }
      goto LABEL_12;
    }
    if (objc_msgSend(v3, "code") == 14)
    {
      v4 = (void *)MEMORY[0x227676638]();
      v5 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "shortDescription");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v75 = v7;
        v76 = 2114;
        v77 = v8;
        v78 = 2112;
        v79 = v3;
        v9 = "%{public}@Received error that accessory is already in a recording session from device %{public}@: %@";
        goto LABEL_11;
      }
LABEL_12:

      objc_autoreleasePoolPop(v4);
      objc_msgSend(*(id *)(a1 + 32), "logEventSubmitter");
      v17 = objc_claimAutoreleasedReturnValue();
      -[NSObject submitLogEvent:](v17, "submitLogEvent:", *(_QWORD *)(a1 + 48));
LABEL_13:

      goto LABEL_14;
    }
    v18 = objc_msgSend(v3, "code");
    v19 = (void *)MEMORY[0x227676638]();
    v20 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = v21;
    if (v18 == 21)
    {
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "shortDescription");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v75 = v23;
        v76 = 2114;
        v77 = v24;
        v78 = 2112;
        v79 = v3;
        _os_log_impl(&dword_2218F0000, v22, OS_LOG_TYPE_INFO, "%{public}@Received error that accessory is not configured from device %{public}@: %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v19);
      objc_msgSend(*(id *)(a1 + 32), "logEventSubmitter");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "submitLogEvent:error:", *(_QWORD *)(a1 + 48), v3);

      objc_msgSend(*(id *)(a1 + 32), "workQueue");
      v17 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __149__HMDCameraRecordingManager__forwardRecordingSessionForTrigger_withLoadBalancerDecision_deviceFilter_sessionCoordinationLogEvent_retryAttemptNumber___block_invoke_50;
      block[3] = &unk_24E79C240;
      block[4] = *(_QWORD *)(a1 + 32);
      dispatch_async(v17, block);
      goto LABEL_13;
    }
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "shortDescription");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v75 = v26;
      v76 = 2114;
      v77 = v27;
      v78 = 2112;
      v79 = v3;
      _os_log_impl(&dword_2218F0000, v22, OS_LOG_TYPE_ERROR, "%{public}@Failed to forward recording session to device %{public}@: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v19);
    objc_msgSend(*(id *)(a1 + 32), "logEventSubmitter");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "submitLogEvent:error:", *(_QWORD *)(a1 + 48), v3);

    objc_msgSend(*(id *)(a1 + 32), "cameraLoadBalancer");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "handleRecordingSessionForwardingFailureForDecision:", *(_QWORD *)(a1 + 56));

    v30 = [HMDCameraRecordingSessionCoordinationLogEvent alloc];
    objc_msgSend(*(id *)(a1 + 48), "startTime");
    v31 = -[HMMLogEvent initWithStartTime:](v30, "initWithStartTime:");
    objc_msgSend(*(id *)(a1 + 32), "camera");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v32)
    {
      v45 = (void *)MEMORY[0x227676638]();
      v46 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v47 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v75 = v48;
        _os_log_impl(&dword_2218F0000, v47, OS_LOG_TYPE_ERROR, "%{public}@Camera reference is nil", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v45);
      objc_msgSend(*(id *)(a1 + 32), "logEventSubmitter");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 20);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "submitLogEvent:error:", v31, v50);

      goto LABEL_36;
    }
    v33 = MEMORY[0x24BDAC760];
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 3221225472;
    aBlock[2] = __149__HMDCameraRecordingManager__forwardRecordingSessionForTrigger_withLoadBalancerDecision_deviceFilter_sessionCoordinationLogEvent_retryAttemptNumber___block_invoke_51;
    aBlock[3] = &unk_24E7737D0;
    v71 = *(id *)(a1 + 64);
    v72 = *(id *)(a1 + 72);
    v34 = _Block_copy(aBlock);
    objc_msgSend(*(id *)(a1 + 32), "cameraLoadBalancer");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "loadBalancingDecisionForCamera:deviceFilter:", v32, v34);
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    if (*(uint64_t *)(a1 + 80) < 3)
    {
      objc_msgSend(v36, "analysisNode");
      v51 = (void *)objc_claimAutoreleasedReturnValue();

      if (v51)
      {
        objc_msgSend(*(id *)(a1 + 32), "workQueue");
        v52 = objc_claimAutoreleasedReturnValue();
        v64[0] = v33;
        v64[1] = 3221225472;
        v64[2] = __149__HMDCameraRecordingManager__forwardRecordingSessionForTrigger_withLoadBalancerDecision_deviceFilter_sessionCoordinationLogEvent_retryAttemptNumber___block_invoke_52;
        v64[3] = &unk_24E7737F8;
        v53 = *(_QWORD *)(a1 + 88);
        v64[4] = *(_QWORD *)(a1 + 32);
        v68 = v53;
        v65 = v36;
        v67 = v34;
        v54 = v31;
        v55 = *(_QWORD *)(a1 + 80);
        v66 = v54;
        v69 = v55;
        dispatch_async(v52, v64);

LABEL_35:
        v49 = v71;
LABEL_36:

        goto LABEL_14;
      }
      v62 = v36;
      v63 = v31;
      v56 = (void *)MEMORY[0x227676638]();
      v57 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v58 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "accessory");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v75 = v59;
        v76 = 2112;
        v77 = v60;
        _os_log_impl(&dword_2218F0000, v58, OS_LOG_TYPE_ERROR, "%{public}@Exhausted devices, failed to start recording session for accessory %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v56);
      objc_msgSend(*(id *)(a1 + 32), "logEventSubmitter");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = (void *)MEMORY[0x24BDD1540];
      v44 = 3301;
    }
    else
    {
      v62 = v36;
      v63 = v31;
      v37 = (void *)MEMORY[0x227676638]();
      v38 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v39 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "accessory");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v75 = v40;
        v76 = 2112;
        v77 = v41;
        _os_log_impl(&dword_2218F0000, v39, OS_LOG_TYPE_ERROR, "%{public}@Reached retry limit, failed to start recording session for accessory %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v37);
      objc_msgSend(*(id *)(a1 + 32), "logEventSubmitter");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = (void *)MEMORY[0x24BDD1540];
      v44 = 3300;
    }
    objc_msgSend(v43, "hmInternalErrorWithCode:", v44);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = v63;
    objc_msgSend(v42, "submitLogEvent:error:", v63, v61);

    v36 = v62;
    goto LABEL_35;
  }
  v10 = (void *)MEMORY[0x227676638]();
  v11 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "shortDescription");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v75 = v13;
    v76 = 2114;
    v77 = v14;
    _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_INFO, "%{public}@Successfully forwarded recording session to %{public}@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v10);
  objc_msgSend(*(id *)(a1 + 32), "logEventSubmitter");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "submitLogEvent:", *(_QWORD *)(a1 + 48));

  objc_msgSend(*(id *)(a1 + 32), "cameraLoadBalancer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "handleRecordingSessionForwardingSuccessForDecision:", *(_QWORD *)(a1 + 56));

  objc_msgSend(*(id *)(a1 + 32), "_submitLoadBalancingEventWithDecision:numberOfRetries:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 80));
LABEL_14:

}

void __149__HMDCameraRecordingManager__forwardRecordingSessionForTrigger_withLoadBalancerDecision_deviceFilter_sessionCoordinationLogEvent_retryAttemptNumber___block_invoke_50(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "recordingSettingsControl");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleAccessoryIsNotConfiguredError");

}

uint64_t __149__HMDCameraRecordingManager__forwardRecordingSessionForTrigger_withLoadBalancerDecision_deviceFilter_sessionCoordinationLogEvent_retryAttemptNumber___block_invoke_51(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;

  v3 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "isEqual:", v3) & 1) != 0)
    v4 = 0;
  else
    v4 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  return v4;
}

uint64_t __149__HMDCameraRecordingManager__forwardRecordingSessionForTrigger_withLoadBalancerDecision_deviceFilter_sessionCoordinationLogEvent_retryAttemptNumber___block_invoke_52(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_forwardRecordingSessionForTrigger:withLoadBalancerDecision:deviceFilter:sessionCoordinationLogEvent:retryAttemptNumber:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 72) + 1);
}

uint64_t __68__HMDCameraRecordingManager__loadBalanceRecordingSessionForTrigger___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  id v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  int v31;
  void *v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "camera");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "activityZones");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count"))
  {
    objc_msgSend(v3, "capabilities");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "supportsCameraActivityZones");

    if (!v8)
      goto LABEL_18;
  }
  else
  {

  }
  objc_msgSend(v4, "hapAccessory");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "home");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "personManagerSettings");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v11, "isFaceClassificationEnabled") & 1) != 0)
  {
    objc_msgSend(v3, "capabilities");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "supportsFaceClassification");

    if (!v13)
      goto LABEL_18;
  }
  else
  {

  }
  objc_msgSend(v4, "currentSettings");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v14, "recordingEventTriggers") & 0x10) != 0)
  {
    objc_msgSend(v3, "capabilities");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "supportsCameraPackageDetection");

    if (!v16)
      goto LABEL_18;
  }
  else
  {

  }
  objc_msgSend(MEMORY[0x24BE3F248], "sharedPreferences");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "preferenceForKey:", CFSTR("HMDCameraRecordingManagerExcludePrimaryResident"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "BOOLValue");

  if (!v19
    || !objc_msgSend(v3, "isCurrentDevice")
    || (objc_msgSend(*(id *)(a1 + 32), "accessory"),
        v20 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v20, "home"),
        v21 = (void *)objc_claimAutoreleasedReturnValue(),
        v22 = objc_msgSend(v21, "isCurrentDeviceConfirmedPrimaryResident"),
        v21,
        v20,
        !v22))
  {
    v29 = 1;
    goto LABEL_20;
  }
  v23 = (void *)MEMORY[0x227676638]();
  v24 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "device");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "shortDescription");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = 138543618;
    v32 = v26;
    v33 = 2112;
    v34 = v28;
    _os_log_impl(&dword_2218F0000, v25, OS_LOG_TYPE_INFO, "%{public}@Excluding current device from camera recording load balancing because it is the primary resident: %@", (uint8_t *)&v31, 0x16u);

  }
  objc_autoreleasePoolPop(v23);
LABEL_18:
  v29 = 0;
LABEL_20:

  return v29;
}

void __67__HMDCameraRecordingManager__coordinateRecordingSessionForTrigger___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  _QWORD v10[6];
  uint8_t buf[4];
  void *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (v3)
  {
    v4 = (void *)MEMORY[0x227676638]();
    v5 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v12 = v7;
      v13 = 2112;
      v14 = v3;
      _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_ERROR, "%{public}@Failed to synchronize settings with camera while coordinating recording session: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v4);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "workQueue");
    v8 = objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __67__HMDCameraRecordingManager__coordinateRecordingSessionForTrigger___block_invoke_35;
    v10[3] = &unk_24E797C10;
    v9 = *(_QWORD *)(a1 + 40);
    v10[4] = *(_QWORD *)(a1 + 32);
    v10[5] = v9;
    dispatch_async(v8, v10);

  }
}

uint64_t __67__HMDCameraRecordingManager__coordinateRecordingSessionForTrigger___block_invoke_35(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x227676638]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543362;
    v8 = v5;
    _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_INFO, "%{public}@Successfully synchronized settings with camera while coordinating recording session", (uint8_t *)&v7, 0xCu);

  }
  objc_autoreleasePoolPop(v2);
  return objc_msgSend(*(id *)(a1 + 32), "_loadBalanceRecordingSessionForTrigger:", *(_QWORD *)(a1 + 40));
}

void __35__HMDCameraRecordingManager__start__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  const char *v9;
  NSObject *v10;
  os_log_type_t v11;
  uint32_t v12;
  int v13;
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x227676638]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v3)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543618;
      v14 = v8;
      v15 = 2112;
      v16 = v3;
      v9 = "%{public}@Failed to confirm primary resident with error: %@";
      v10 = v7;
      v11 = OS_LOG_TYPE_ERROR;
      v12 = 22;
LABEL_6:
      _os_log_impl(&dword_2218F0000, v10, v11, v9, (uint8_t *)&v13, v12);

    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138543362;
    v14 = v8;
    v9 = "%{public}@Successfully confirmed primary resident";
    v10 = v7;
    v11 = OS_LOG_TYPE_INFO;
    v12 = 12;
    goto LABEL_6;
  }

  objc_autoreleasePoolPop(v4);
}

void __48__HMDCameraRecordingManager_clipManagerDidStop___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend(*(id *)(a1 + 32), "didShutDown"))
  {
    v2 = (void *)MEMORY[0x227676638]();
    v3 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543362;
      v13 = v5;
      _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_INFO, "%{public}@Ignoring clipManagerDidStop: because recording manager was shut down", (uint8_t *)&v12, 0xCu);

    }
    objc_autoreleasePoolPop(v2);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "cameraLoadBalancer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "cameraUUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setReadyToRecord:forCameraWithUUID:", 0, v7);

    v8 = (void *)MEMORY[0x227676638]();
    v9 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543362;
      v13 = v11;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_ERROR, "%{public}@Closing current session because clip manager became unavailable", (uint8_t *)&v12, 0xCu);

    }
    objc_autoreleasePoolPop(v8);
    objc_msgSend(*(id *)(a1 + 32), "_closeCurrentSessionsWithReason:", 3);
  }
}

uint64_t __60__HMDCameraRecordingManager_clipManagerDidStartUpCloudZone___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_clipManagerDidStartUpCloudZone");
}

uint64_t __37__HMDCameraRecordingManager_shutDown__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_shutDown");
}

uint64_t __34__HMDCameraRecordingManager_start__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_start");
}

+ (BOOL)_isSessionAlreadyInProgressError:(id)a3
{
  id v3;
  void *v4;
  BOOL v5;

  v3 = a3;
  objc_msgSend(v3, "domain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BDD5BD8]))
    v5 = objc_msgSend(v3, "code") == 15 || objc_msgSend(v3, "code") == 3303 || objc_msgSend(v3, "code") == 3304;
  else
    v5 = 0;

  return v5;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t62 != -1)
    dispatch_once(&logCategory__hmf_once_t62, &__block_literal_global_2128);
  return (id)logCategory__hmf_once_v63;
}

void __40__HMDCameraRecordingManager_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v63;
  logCategory__hmf_once_v63 = v0;

}

@end
