@implementation HMDCameraStreamControlMessageHandler

- (HMDCameraStreamControlMessageHandler)initWithWorkQueue:(id)a3 streamSnapshotHandler:(id)a4 accessory:(id)a5 streamManagementService:(id)a6 profileUniqueIdentifier:(id)a7 networkMonitor:(id)a8 residentMessageHandler:(id)a9 dataSource:(id)a10
{
  id v17;
  id v18;
  void *v19;
  id v20;
  HMDCameraStreamControlMessageHandler *v21;
  HMDCameraStreamControlMessageHandler *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  NSUUID *uniqueIdentifier;
  HMDCameraSupportedConfigurationCache *v30;
  HMDCameraSupportedConfigurationCache *supportedConfigCache;
  uint64_t v32;
  HMDDynamicActivityAttributionPublisher *dynamicActivityAttributionPublisher;
  id v35;
  id v36;
  id v37;
  id v38;
  id obj;
  objc_super v40;
  _QWORD v41[2];

  v41[1] = *MEMORY[0x1E0C80C00];
  v38 = a3;
  v37 = a4;
  obj = a5;
  v17 = a6;
  v18 = a7;
  v36 = a8;
  v35 = a9;
  v19 = v17;
  v20 = a10;
  v40.receiver = self;
  v40.super_class = (Class)HMDCameraStreamControlMessageHandler;
  v21 = -[HMDCameraStreamControlMessageHandler init](&v40, sel_init);
  v22 = v21;
  if (v21)
  {
    objc_storeStrong((id *)&v21->_workQueue, a3);
    objc_storeStrong((id *)&v22->_streamSnapshotHandler, a4);
    objc_storeWeak((id *)&v22->_accessory, obj);
    objc_storeStrong((id *)&v22->_profileUniqueIdentifier, a7);
    objc_storeStrong((id *)&v22->_streamManagementService, a6);
    objc_storeStrong((id *)&v22->_residentMessageHandler, a9);
    v23 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v19, "instanceID");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "stringWithFormat:", CFSTR("%@"), v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    v26 = (void *)MEMORY[0x1E0CB3A28];
    v41[0] = v25;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v41, 1);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "hm_deriveUUIDFromBaseUUID:withSalts:", v18, v27);
    v28 = objc_claimAutoreleasedReturnValue();
    uniqueIdentifier = v22->_uniqueIdentifier;
    v22->_uniqueIdentifier = (NSUUID *)v28;

    v30 = objc_alloc_init(HMDCameraSupportedConfigurationCache);
    supportedConfigCache = v22->_supportedConfigCache;
    v22->_supportedConfigCache = v30;

    objc_storeStrong((id *)&v22->_networkMonitor, a8);
    objc_msgSend(v20, "createDynamicActivityAttributionPublisher");
    v32 = objc_claimAutoreleasedReturnValue();
    dynamicActivityAttributionPublisher = v22->_dynamicActivityAttributionPublisher;
    v22->_dynamicActivityAttributionPublisher = (HMDDynamicActivityAttributionPublisher *)v32;

    objc_storeStrong((id *)&v22->_dataSource, a10);
  }

  return v22;
}

- (HMDCameraStreamControlMessageHandler)initWithWorkQueue:(id)a3 streamSnapshotHandler:(id)a4 accessory:(id)a5 streamManagementService:(id)a6 profileUniqueIdentifier:(id)a7 networkMonitor:(id)a8
{
  void *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  HMDCameraResidentMessageHandler *v24;
  HMDCameraStreamControlMessageHandlerDataSource *v25;
  HMDCameraStreamControlMessageHandler *v26;

  v14 = (void *)MEMORY[0x1E0CB3940];
  v15 = a8;
  v16 = a7;
  v17 = a6;
  v18 = a5;
  v19 = a4;
  v20 = a3;
  objc_msgSend(v18, "name");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "instanceID");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringWithFormat:", CFSTR("%@/%@"), v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = -[HMDCameraResidentMessageHandler initWithAccessory:logIdentifier:]([HMDCameraResidentMessageHandler alloc], "initWithAccessory:logIdentifier:", v18, v23);
  v25 = objc_alloc_init(HMDCameraStreamControlMessageHandlerDataSource);
  v26 = -[HMDCameraStreamControlMessageHandler initWithWorkQueue:streamSnapshotHandler:accessory:streamManagementService:profileUniqueIdentifier:networkMonitor:residentMessageHandler:dataSource:](self, "initWithWorkQueue:streamSnapshotHandler:accessory:streamManagementService:profileUniqueIdentifier:networkMonitor:residentMessageHandler:dataSource:", v20, v19, v18, v17, v16, v15, v24, v25);

  return v26;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB35C8], "hmInternalErrorWithCode:", 1039);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCameraStreamControlMessageHandler _stopStreamWithError:](self, "_stopStreamWithError:", v3);

  v4.receiver = self;
  v4.super_class = (Class)HMDCameraStreamControlMessageHandler;
  -[HMDCameraStreamControlMessageHandler dealloc](&v4, sel_dealloc);
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[HMDCameraStreamControlMessageHandler accessory](self, "accessory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCameraStreamControlMessageHandler streamManagementService](self, "streamManagementService");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "instanceID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@/%@"), v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (void)configureWithMessageDispatcher:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  -[HMDCameraStreamControlMessageHandler workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[HMDCameraStreamControlMessageHandler accessory](self, "accessory");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObserver:selector:name:object:", self, sel_handleAccessoryUnconfigured_, CFSTR("HMDAccessoryDisconnectedNotification"), v10);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObserver:selector:name:object:", self, sel_handleProcessStateChange_, CFSTR("HMDProcessInfoStateDidChangeNotification"), 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObserver:selector:name:object:", self, sel_handleConnectionDeactivatedNotification_, CFSTR("HMDXPCClientConnectionDidDeactivateNotification"), 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObserver:selector:name:object:", self, sel_handleCameraSettingsDidChangeNotification_, CFSTR("HMDCameraProfileSettingsDidChangeNotification"), v10);

  -[HMDCameraStreamControlMessageHandler setMessageDispatcher:](self, "setMessageDispatcher:", v4);
}

- (HMDCameraStreamManagerSession)streamSession
{
  return self->_streamSession;
}

- (void)setStreamSession:(id)a3
{
  void *v5;
  id v6;

  objc_storeStrong((id *)&self->_streamSession, a3);
  -[HMDCameraStreamControlMessageHandler streamSnapshotHandler](self, "streamSnapshotHandler");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[HMDCameraStreamControlMessageHandler streamManagementService](self, "streamManagementService");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setStreamSetupStatusForService:inProgress:", v5, a3 != 0);

}

- (void)updateStreamClientUsingMessage:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  HMDCameraStreamControlMessageHandler *v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  HMDCameraStreamControlMessageHandler *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  HMDCameraStreamControlMessageHandler *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  HMDCameraStreamControlMessageHandler *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  int v38;
  void *v39;
  __int16 v40;
  void *v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDCameraStreamControlMessageHandler workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[HMDCameraStreamControlMessageHandler streamSession](self, "streamSession");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "destinationID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    _HMFPreconditionFailure();
  objc_msgSend(v4, "proxyConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1D17BA0A0]();
  v10 = self;
  HMFGetOSLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v8)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "processInfo");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = 138543618;
      v39 = v13;
      v40 = 2112;
      v41 = v14;
      _os_log_impl(&dword_1CD062000, v12, OS_LOG_TYPE_INFO, "%{public}@Updating stream client process info: %@", (uint8_t *)&v38, 0x16u);

    }
    objc_autoreleasePoolPop(v9);
    -[HMDCameraStreamControlMessageHandler streamSession](v10, "streamSession");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "currentMessage");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      if (!-[HMDCameraStreamControlMessageHandler _isNegotiateMessage:](v10, "_isNegotiateMessage:", v16))
      {
        v33 = (void *)MEMORY[0x1D17BA0A0]();
        v34 = v10;
        HMFGetOSLogHandle();
        v35 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "shortDescription");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          v38 = 138543618;
          v39 = v36;
          v40 = 2112;
          v41 = v37;
          _os_log_impl(&dword_1CD062000, v35, OS_LOG_TYPE_ERROR, "%{public}@Cannot update stream client because stream is handling a non-negotiate message: %@", (uint8_t *)&v38, 0x16u);

        }
        objc_autoreleasePoolPop(v33);
        objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 23);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "respondWithError:", v32);
        goto LABEL_20;
      }
      -[HMDCameraStreamControlMessageHandler streamSession](v10, "streamSession");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setCurrentMessage:", v4);

      v18 = (void *)MEMORY[0x1D17BA0A0]();
      v19 = v10;
      HMFGetOSLogHandle();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "shortDescription");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = 138543618;
        v39 = v21;
        v40 = 2112;
        v41 = v22;
        _os_log_impl(&dword_1CD062000, v20, OS_LOG_TYPE_INFO, "%{public}@Responding with canceled error to existing current message: %@", (uint8_t *)&v38, 0x16u);

      }
      objc_autoreleasePoolPop(v18);
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 14);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "respondWithError:", v23);
    }
    else
    {
      v26 = (void *)MEMORY[0x1D17BA0A0]();
      v27 = v10;
      HMFGetOSLogHandle();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "shortDescription");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = 138543618;
        v39 = v29;
        v40 = 2112;
        v41 = v30;
        _os_log_impl(&dword_1CD062000, v28, OS_LOG_TYPE_INFO, "%{public}@Notifying existing stream client that stream has stopped and responding to new stream client message: %@", (uint8_t *)&v38, 0x16u);

      }
      objc_autoreleasePoolPop(v26);
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 14);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDCameraStreamControlMessageHandler _sendStreamStoppedMessageWithError:](v27, "_sendStreamStoppedMessageWithError:", v31);

      -[HMDCameraStreamControlMessageHandler _respondToLocalNegotiateStreamMessage:](v27, "_respondToLocalNegotiateStreamMessage:", v4);
      objc_msgSend(v8, "applicationBundleIdentifier");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDCameraStreamControlMessageHandler _attributeMicrophoneUsageToApplicationBundleIdentifier:](v27, "_attributeMicrophoneUsageToApplicationBundleIdentifier:", v23);
    }

    -[HMDCameraStreamControlMessageHandler streamSession](v10, "streamSession");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setStreamClientConnection:", v8);
LABEL_20:

    goto LABEL_21;
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "shortDescription");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = 138543618;
    v39 = v24;
    v40 = 2112;
    v41 = v25;
    _os_log_impl(&dword_1CD062000, v12, OS_LOG_TYPE_ERROR, "%{public}@Cannot find XPC client connection while updating stream using message: %@", (uint8_t *)&v38, 0x16u);

  }
  objc_autoreleasePoolPop(v9);
  objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 58);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "respondWithError:", v16);
LABEL_21:

}

- (BOOL)_isNegotiateMessage:(id)a3
{
  id v3;
  void *v4;
  char v5;
  void *v6;

  v3 = a3;
  objc_msgSend(v3, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("kNegotitateRemoteStreamRequestKey")) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    objc_msgSend(v3, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0CB8648]);

  }
  return v5;
}

- (BOOL)_isStartMessage:(id)a3
{
  void *v3;
  char v4;

  objc_msgSend(a3, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("kStartRemoteStreamRequestKey"));

  return v4;
}

- (BOOL)_isReconfigureMessage:(id)a3
{
  void *v3;
  char v4;

  objc_msgSend(a3, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("kReconfigureRemoteStreamRequestKey"));

  return v4;
}

- (BOOL)_isStopMessage:(id)a3
{
  id v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;

  v3 = a3;
  objc_msgSend(v3, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0CB8660]) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    objc_msgSend(v3, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v6, "isEqualToString:", CFSTR("kStopRemoteStreamRequestKey")) & 1) != 0)
    {
      v5 = 1;
    }
    else
    {
      objc_msgSend(v3, "name");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v7, "isEqualToString:", CFSTR("kStreamStoppedRemoteNotificationKey"));

    }
  }

  return v5;
}

- (BOOL)_isSetAudioStreamSettingMessage:(id)a3
{
  void *v3;
  char v4;

  objc_msgSend(a3, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0CB8650]);

  return v4;
}

- (BOOL)_isSetAudioVolumeMessage:(id)a3
{
  void *v3;
  char v4;

  objc_msgSend(a3, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0CB8658]);

  return v4;
}

- (BOOL)_isRemoteSetupMessage:(id)a3
{
  void *v3;
  char v4;

  objc_msgSend(a3, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("kStreamRemoteConnectionSetupNotificationKey"));

  return v4;
}

- (void)_stopStreamWithError:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  HMDCameraStreamControlMessageHandler *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDCameraStreamControlMessageHandler streamSession](self, "streamSession");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = (void *)MEMORY[0x1D17BA0A0]();
    v7 = self;
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDCameraStreamControlMessageHandler streamSession](v7, "streamSession");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138543874;
      v18 = v9;
      v19 = 2112;
      v20 = v10;
      v21 = 2112;
      v22 = v4;
      _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_ERROR, "%{public}@Failing stream session %@: %@", (uint8_t *)&v17, 0x20u);

    }
    objc_autoreleasePoolPop(v6);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCameraStreamControlMessageHandler streamSession](v7, "streamSession");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "sessionID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "sessionID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v14, CFSTR("kCameraSessionID"));

    if (v4)
    {
      objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v4, 1, 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setObject:forKeyedSubscript:", v15, CFSTR("kCameraSessionError"));

    }
    objc_msgSend(MEMORY[0x1E0D285D0], "messageWithName:messagePayload:", *MEMORY[0x1E0CB8660], v11);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCameraStreamControlMessageHandler _handleStopMessage:](v7, "_handleStopMessage:", v16);

  }
}

- (void)handleMessage:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  HMDCameraStreamControlMessageHandler *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  HMDCameraStreamControlMessageHandler *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDCameraStreamControlMessageHandler workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  objc_msgSend(v4, "stringForKey:", CFSTR("kCameraSessionID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    v7 = (void *)MEMORY[0x1D17BA0A0]();
    v8 = self;
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "shortDescription");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "messagePayload");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 138543874;
      v26 = v10;
      v27 = 2112;
      v28 = v11;
      v29 = 2112;
      v30 = v12;
      _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_ERROR, "%{public}@Session ID is not present in payload for message %@: %@", (uint8_t *)&v25, 0x20u);
LABEL_6:

    }
LABEL_7:

    objc_autoreleasePoolPop(v7);
    v13 = (void *)MEMORY[0x1E0CB35C8];
    v14 = 3;
LABEL_8:
    objc_msgSend(v13, "hmErrorWithCode:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "respondWithError:", v15);

    goto LABEL_15;
  }
  if (!-[HMDCameraStreamControlMessageHandler _isStopMessage:](self, "_isStopMessage:", v4))
  {
    if (-[HMDCameraStreamControlMessageHandler _isSetAudioStreamSettingMessage:](self, "_isSetAudioStreamSettingMessage:", v4))
    {
      -[HMDCameraStreamControlMessageHandler _handleSetAudioState:](self, "_handleSetAudioState:", v4);
      goto LABEL_15;
    }
    if (-[HMDCameraStreamControlMessageHandler _isSetAudioVolumeMessage:](self, "_isSetAudioVolumeMessage:", v4))
    {
      -[HMDCameraStreamControlMessageHandler _handleSetAudioVolume:](self, "_handleSetAudioVolume:", v4);
      goto LABEL_15;
    }
    if (-[HMDCameraStreamControlMessageHandler _isRemoteSetupMessage:](self, "_isRemoteSetupMessage:", v4))
    {
      -[HMDCameraStreamControlMessageHandler _handleRemoteSetupMessage:](self, "_handleRemoteSetupMessage:", v4);
      goto LABEL_15;
    }
    -[HMDCameraStreamControlMessageHandler streamSession](self, "streamSession");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "currentMessage");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v17)
    {
      if (-[HMDCameraStreamControlMessageHandler _isNegotiateMessage:](self, "_isNegotiateMessage:", v4))
      {
        -[HMDCameraStreamControlMessageHandler _handleNegotiateMessage:](self, "_handleNegotiateMessage:", v4);
        goto LABEL_15;
      }
      if (-[HMDCameraStreamControlMessageHandler _isStartMessage:](self, "_isStartMessage:", v4))
      {
        -[HMDCameraStreamControlMessageHandler _handleStartMessage:](self, "_handleStartMessage:", v4);
        goto LABEL_15;
      }
      if (-[HMDCameraStreamControlMessageHandler _isReconfigureMessage:](self, "_isReconfigureMessage:", v4))
      {
        -[HMDCameraStreamControlMessageHandler _handleReconfigureMessage:](self, "_handleReconfigureMessage:", v4);
        goto LABEL_15;
      }
      v20 = (void *)MEMORY[0x1D17BA0A0]();
      v21 = self;
      HMFGetOSLogHandle();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "name");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = 138543618;
        v26 = v23;
        v27 = 2112;
        v28 = v24;
        _os_log_impl(&dword_1CD062000, v22, OS_LOG_TYPE_ERROR, "%{public}@Unknown message type %@", (uint8_t *)&v25, 0x16u);

      }
      objc_autoreleasePoolPop(v20);
      v13 = (void *)MEMORY[0x1E0CB35C8];
      v14 = 2;
      goto LABEL_8;
    }
    v7 = (void *)MEMORY[0x1D17BA0A0]();
    v8 = self;
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDCameraStreamControlMessageHandler streamSession](v8, "streamSession");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "currentMessage");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "shortDescription");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "shortDescription");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 138543874;
      v26 = v10;
      v27 = 2112;
      v28 = v18;
      v29 = 2112;
      v30 = v19;
      _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_ERROR, "%{public}@Current message %@ is already being processed, rejecting message %@", (uint8_t *)&v25, 0x20u);

      goto LABEL_6;
    }
    goto LABEL_7;
  }
  -[HMDCameraStreamControlMessageHandler _handleStopMessage:](self, "_handleStopMessage:", v4);
LABEL_15:

}

- (BOOL)_shouldHandleNegotiateMessage:(id)a3 accessoryReachable:(BOOL)a4
{
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  HMDCameraStreamControlMessageHandler *v13;
  NSObject *v14;
  void *v15;
  const char *v16;
  void *v17;
  char v18;
  BOOL v19;
  HMDCameraStreamControlMessageHandler *v20;
  void *v21;
  int v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[HMDCameraStreamControlMessageHandler workQueue](self, "workQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  if (!a4)
  {
    objc_msgSend(v6, "remoteSourceDevice");
    v8 = objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = (void *)v8;
      -[HMDCameraStreamControlMessageHandler dataSource](self, "dataSource");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "isResidentCapable");

      if (v11)
      {
        v12 = (void *)MEMORY[0x1D17BA0A0]();
        v13 = self;
        HMFGetOSLogHandle();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = 138543362;
          v24 = v15;
          v16 = "%{public}@Failing remote negotiate message because accessory is unreachable and this is a resident capable device";
LABEL_10:
          _os_log_impl(&dword_1CD062000, v14, OS_LOG_TYPE_ERROR, v16, (uint8_t *)&v23, 0xCu);

          goto LABEL_11;
        }
        goto LABEL_11;
      }
    }
    -[HMDCameraStreamControlMessageHandler dataSource](self, "dataSource");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "supportsReceivingRemoteCameraStream");

    if ((v18 & 1) == 0)
    {
      v12 = (void *)MEMORY[0x1D17BA0A0]();
      v20 = self;
      HMFGetOSLogHandle();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = 138543362;
        v24 = v15;
        v16 = "%{public}@Failing negotiate message because accessory is unreachable and this device doesn't support recei"
              "ving remote streams";
        goto LABEL_10;
      }
LABEL_11:

      objc_autoreleasePoolPop(v12);
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 4);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "respondWithError:", v21);

      v19 = 0;
      goto LABEL_12;
    }
  }
  v19 = 1;
LABEL_12:

  return v19;
}

- (void)_handleNegotiateMessage:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  HMDCameraStreamControlMessageHandler *v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  HMDCameraStreamControlMessageHandler *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  HMDCameraStreamControlMessageHandler *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  id v32;
  void *v33;
  HMDCameraStreamControlMessageHandler *v34;
  NSObject *v35;
  void *v36;
  uint64_t v37;
  char v38;
  void *v39;
  HMDCameraStreamControlMessageHandler *v40;
  void *v41;
  HMDCameraStreamControlMessageHandler *v42;
  NSObject *v43;
  NSObject *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  HMDCameraStreamSessionID *v50;
  void *v51;
  HMDCameraStreamSessionID *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  uint64_t v61;
  void *v62;
  int v63;
  void *v64;
  HMDCameraStreamControlMessageHandler *v65;
  NSObject *v66;
  void *v67;
  void *v68;
  uint64_t v69;
  uint64_t v70;
  void *v71;
  void *v72;
  uint64_t v73;
  void *v74;
  void *v75;
  HMDCameraStreamSessionID *v76;
  uint64_t v77;
  void *v78;
  void *v79;
  double v80;
  int v81;
  void *v82;
  HMDCameraStreamControlMessageHandler *v83;
  NSObject *v84;
  NSObject *v85;
  void *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  void *v90;
  void *v91;
  uint64_t v92;
  void *v93;
  id v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  HMDCameraStreamControlMessageHandler *v106;
  NSObject *v107;
  void *v108;
  void *v109;
  void *v110;
  uint64_t v111;
  void *v112;
  HMDCameraStreamControlMessageHandler *v113;
  NSObject *v114;
  void *v115;
  void *v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  uint64_t v128;
  void *v129;
  HMDCameraStreamSessionID *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  id v135;
  id v136;
  uint8_t buf[4];
  void *v138;
  __int16 v139;
  id v140;
  __int16 v141;
  id v142;
  uint64_t v143;

  v143 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDCameraStreamControlMessageHandler workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  objc_msgSend(v4, "stringForKey:", CFSTR("kCameraSessionID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1D17BA0A0]();
  v8 = self;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v6)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "shortDescription");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v138 = v11;
      v139 = 2112;
      v140 = v6;
      v141 = 2112;
      v142 = v12;
      _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_INFO, "%{public}@[%@] Handling negotiation message: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v7);
    -[HMDCameraStreamControlMessageHandler accessory](v8, "accessory");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "isReachable");
    if (-[HMDCameraStreamControlMessageHandler _shouldHandleNegotiateMessage:accessoryReachable:](v8, "_shouldHandleNegotiateMessage:accessoryReachable:", v4, v14))
    {
      objc_msgSend(v13, "cameraProfiles");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "anyObject");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "currentSettings");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (v17)
      {
        objc_msgSend(v17, "currentAccessMode");
        if ((HMIsStreamingAllowedForCameraAccessMode() & 1) == 0)
        {
          v18 = (void *)MEMORY[0x1D17BA0A0]();
          v19 = v8;
          HMFGetOSLogHandle();
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "currentAccessMode");
            HMCameraAccessModeAsString();
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v138 = v21;
            v139 = 2112;
            v140 = v6;
            v141 = 2112;
            v142 = v22;
            _os_log_impl(&dword_1CD062000, v20, OS_LOG_TYPE_INFO, "%{public}@[%@] Streaming is disallowed for current access mode: %@", buf, 0x20u);

          }
          objc_autoreleasePoolPop(v18);
          objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 10);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "respondWithError:", v23);
          goto LABEL_59;
        }
      }
      else
      {
        v26 = (void *)MEMORY[0x1D17BA0A0]();
        v27 = v8;
        HMFGetOSLogHandle();
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v138 = v29;
          v139 = 2112;
          v140 = v6;
          _os_log_impl(&dword_1CD062000, v28, OS_LOG_TYPE_INFO, "%{public}@[%@] Camera profile settings are not initialized; skipping controller side checks to disallow stream request",
            buf,
            0x16u);

        }
        objc_autoreleasePoolPop(v26);
      }
      objc_msgSend(v4, "dataForKey:", CFSTR("kCameraSessionPreference"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = 0;
      v132 = v17;
      if (objc_msgSend(v4, "isEntitledForSPIAccess") && v30)
      {
        v136 = 0;
        objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v30, &v136);
        v31 = objc_claimAutoreleasedReturnValue();
        v32 = v136;
        if (!v31)
        {
          v125 = v30;
          v33 = (void *)MEMORY[0x1D17BA0A0]();
          v34 = v8;
          HMFGetOSLogHandle();
          v35 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v138 = v36;
            v139 = 2112;
            v140 = v6;
            v141 = 2112;
            v142 = v32;
            _os_log_impl(&dword_1CD062000, v35, OS_LOG_TYPE_ERROR, "%{public}@[%@] Failed to unarchive camera stream preferences from camera session preference message: %@", buf, 0x20u);

          }
          objc_autoreleasePoolPop(v33);
          v30 = v125;
          v31 = 0;
        }

      }
      v134 = (void *)v31;
      objc_msgSend(v4, "proxyConnection");
      v37 = objc_claimAutoreleasedReturnValue();
      v38 = objc_msgSend(v4, "isRemote");
      v39 = (void *)MEMORY[0x1D17BA0A0]();
      v40 = v8;
      v41 = (void *)v37;
      v42 = v40;
      HMFGetOSLogHandle();
      v43 = objc_claimAutoreleasedReturnValue();
      v44 = v43;
      v133 = v6;
      if ((v38 & 1) == 0 && !v41)
      {
        if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v138 = v45;
          v139 = 2112;
          v140 = v6;
          v141 = 2112;
          v142 = v4;
          _os_log_impl(&dword_1CD062000, v44, OS_LOG_TYPE_ERROR, "%{public}@[%@] Cannot find XPC client connection for negotiate stream message received over XPC: %@", buf, 0x20u);

        }
        objc_autoreleasePoolPop(v39);
        objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 58);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "respondWithError:", v46);
        v17 = v132;
        v23 = v134;
        goto LABEL_58;
      }
      v131 = v41;
      if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "processInfo");
        v48 = v30;
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v138 = v47;
        v139 = 2112;
        v140 = v6;
        v141 = 2112;
        v142 = v49;
        _os_log_impl(&dword_1CD062000, v44, OS_LOG_TYPE_INFO, "%{public}@[%@] Using stream client process info: %@", buf, 0x20u);

        v30 = v48;
        v41 = v131;

      }
      objc_autoreleasePoolPop(v39);
      v50 = [HMDCameraStreamSessionID alloc];
      -[HMDCameraStreamControlMessageHandler streamManagementService](v42, "streamManagementService");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = -[HMDCameraStreamSessionID initWithAccessory:service:sessionID:message:](v50, "initWithAccessory:service:sessionID:message:", v13, v51, v6, v4);

      -[HMDCameraStreamControlMessageHandler negotiationMilestone](v42, "negotiationMilestone");
      v53 = (void *)objc_claimAutoreleasedReturnValue();

      if (v53)
      {
        -[HMDCameraStreamControlMessageHandler negotiationMilestone](v42, "negotiationMilestone");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "key");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        v56 = (void *)MEMORY[0x1E0CB37E8];
        -[HMDCameraStreamControlMessageHandler negotiationMilestone](v42, "negotiationMilestone");
        v57 = v30;
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "numberWithInteger:", objc_msgSend(v58, "timestamp"));
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDCameraSessionID markMilestoneFor:withTimestamp:](v52, "markMilestoneFor:withTimestamp:", v55, v59);

        v30 = v57;
        v41 = v131;

      }
      v130 = v52;
      objc_msgSend(v4, "remoteSourceDevice");
      v128 = objc_claimAutoreleasedReturnValue();
      -[HMDCameraStreamControlMessageHandler residentMessageHandler](v42, "residentMessageHandler");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "remoteAccessDevice");
      v61 = objc_claimAutoreleasedReturnValue();

      -[HMDCameraStreamControlMessageHandler residentMessageHandler](v42, "residentMessageHandler");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      v63 = objc_msgSend(v62, "isRemoteAccessDeviceReachable");

      v129 = (void *)v61;
      if ((_DWORD)v14)
      {
        v64 = (void *)MEMORY[0x1D17BA0A0]();
        v65 = v42;
        HMFGetOSLogHandle();
        v66 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v66, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v138 = v67;
          v139 = 2112;
          v140 = v133;
          _os_log_impl(&dword_1CD062000, v66, OS_LOG_TYPE_INFO, "%{public}@[%@] Creating local stream control manager because accessory is reachable", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v64);
        -[HMDCameraStreamControlMessageHandler dataSource](v65, "dataSource");
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v68, "localNetworkConfig");
        v69 = objc_claimAutoreleasedReturnValue();

        v127 = (void *)v69;
        if (v69)
        {
          v126 = v30;
          -[HMDCameraStreamControlMessageHandler dataSource](v65, "dataSource");
          v124 = (void *)objc_claimAutoreleasedReturnValue();
          -[HMDCameraStreamControlMessageHandler workQueue](v65, "workQueue");
          v123 = (void *)objc_claimAutoreleasedReturnValue();
          -[HMDCameraStreamControlMessageHandler streamSnapshotHandler](v65, "streamSnapshotHandler");
          v70 = objc_claimAutoreleasedReturnValue();
          -[HMDCameraStreamControlMessageHandler networkMonitor](v65, "networkMonitor");
          v71 = (void *)objc_claimAutoreleasedReturnValue();
          v119 = objc_msgSend(v71, "reachabilityPath");
          -[HMDCameraStreamControlMessageHandler workQueue](v65, "workQueue");
          v72 = (void *)objc_claimAutoreleasedReturnValue();
          -[HMDCameraStreamControlMessageHandler streamManagementService](v65, "streamManagementService");
          v73 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "messagePayload");
          v74 = (void *)objc_claimAutoreleasedReturnValue();
          -[HMDCameraStreamControlMessageHandler supportedConfigCache](v65, "supportedConfigCache");
          v75 = (void *)objc_claimAutoreleasedReturnValue();
          v121 = (void *)v73;
          v122 = (void *)v70;
          v117 = v73;
          v76 = v130;
          v77 = v70;
          v78 = (void *)v128;
          objc_msgSend(v124, "createLocalStreamControlManagerWithSessionID:workQueue:streamSnapshotHandler:reachabilityPath:device:delegate:delegateQueue:accessory:streamManagementService:localNetworkConfig:remoteCapabilities:supportedConfigCache:streamPreference:", v130, v123, v77, v119, v128, v65, v72, v13, v117, v127, v74, v75, v134);
          v79 = (void *)objc_claimAutoreleasedReturnValue();
          v80 = 30.0;
LABEL_44:

          -[HMDCameraStreamControlMessageHandler dataSource](v42, "dataSource");
          v90 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v78, "remoteDestinationString");
          v91 = (void *)objc_claimAutoreleasedReturnValue();
          v41 = v131;
          objc_msgSend(v90, "createStreamManagerSessionWithSessionID:destinationID:streamClientConnection:streamControlManager:setupWaitPeriod:", v76, v91, v131, v79, v80);
          v92 = objc_claimAutoreleasedReturnValue();
          -[HMDCameraStreamControlMessageHandler setStreamSession:](v42, "setStreamSession:", v92);

          -[HMDCameraStreamControlMessageHandler streamSession](v42, "streamSession");
          v93 = (void *)objc_claimAutoreleasedReturnValue();
          v135 = 0;
          LOBYTE(v92) = objc_msgSend(v93, "canStartWithError:", &v135);
          v94 = v135;

          if ((v92 & 1) != 0)
          {
            -[HMDCameraStreamControlMessageHandler streamSession](v42, "streamSession");
            v95 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v95, "setCurrentMessage:", v4);

            -[HMDCameraStreamControlMessageHandler streamSession](v42, "streamSession");
            v96 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v96, "streamControlManager");
            v97 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v97, "negotiateStream");

            -[HMDCameraStreamControlMessageHandler streamSession](v42, "streamSession");
            v98 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v98, "streamSetupTimer");
            v99 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v99, "setDelegate:", v42);

            -[HMDCameraStreamControlMessageHandler workQueue](v42, "workQueue");
            v100 = (void *)objc_claimAutoreleasedReturnValue();
            -[HMDCameraStreamControlMessageHandler streamSession](v42, "streamSession");
            v101 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v101, "streamSetupTimer");
            v102 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v102, "setDelegateQueue:", v100);

            -[HMDCameraStreamControlMessageHandler streamSession](v42, "streamSession");
            v103 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v103, "streamSetupTimer");
            v104 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v104, "resume");

          }
          else
          {
            v105 = (void *)MEMORY[0x1D17BA0A0]();
            v106 = v42;
            HMFGetOSLogHandle();
            v107 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v107, OS_LOG_TYPE_ERROR))
            {
              HMFGetLogIdentifier();
              v108 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v138 = v108;
              v139 = 2112;
              v140 = v94;
              _os_log_impl(&dword_1CD062000, v107, OS_LOG_TYPE_ERROR, "%{public}@Cannot start stream session: %@", buf, 0x16u);

              v41 = v131;
            }

            objc_autoreleasePoolPop(v105);
            objc_msgSend(v4, "respondWithError:", v94);
          }
          v17 = v132;

          v30 = v126;
          goto LABEL_57;
        }
        v112 = (void *)MEMORY[0x1D17BA0A0]();
        v113 = v65;
        HMFGetOSLogHandle();
        v114 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v114, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v115 = v30;
          v116 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v138 = v116;
          v139 = 2112;
          v140 = v133;
          _os_log_impl(&dword_1CD062000, v114, OS_LOG_TYPE_ERROR, "%{public}@[%@] Failed to get the local network address config", buf, 0x16u);

          v30 = v115;
          v41 = v131;
        }

        objc_autoreleasePoolPop(v112);
        v110 = (void *)MEMORY[0x1E0CB35C8];
        v111 = -1;
      }
      else
      {
        if (v61)
          v81 = v63;
        else
          v81 = 0;
        v82 = (void *)MEMORY[0x1D17BA0A0]();
        v83 = v42;
        HMFGetOSLogHandle();
        v84 = objc_claimAutoreleasedReturnValue();
        v85 = v84;
        if (v81 == 1)
        {
          v126 = v30;
          if (os_log_type_enabled(v84, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v86 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v138 = v86;
            v139 = 2112;
            v140 = v133;
            _os_log_impl(&dword_1CD062000, v85, OS_LOG_TYPE_INFO, "%{public}@[%@] Creating remote stream control manager because accessory is not reachable", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v82);
          -[HMDCameraStreamControlMessageHandler dataSource](v83, "dataSource");
          v127 = (void *)objc_claimAutoreleasedReturnValue();
          -[HMDCameraStreamControlMessageHandler workQueue](v83, "workQueue");
          v124 = (void *)objc_claimAutoreleasedReturnValue();
          -[HMDCameraStreamControlMessageHandler streamSnapshotHandler](v83, "streamSnapshotHandler");
          v87 = objc_claimAutoreleasedReturnValue();
          -[HMDCameraStreamControlMessageHandler networkMonitor](v83, "networkMonitor");
          v122 = (void *)objc_claimAutoreleasedReturnValue();
          v120 = objc_msgSend(v122, "reachabilityPath");
          -[HMDCameraStreamControlMessageHandler workQueue](v83, "workQueue");
          v71 = (void *)objc_claimAutoreleasedReturnValue();
          -[HMDCameraStreamControlMessageHandler streamManagementService](v83, "streamManagementService");
          v72 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "messagePayload");
          v88 = objc_claimAutoreleasedReturnValue();
          -[HMDCameraStreamControlMessageHandler profileUniqueIdentifier](v83, "profileUniqueIdentifier");
          v74 = (void *)objc_claimAutoreleasedReturnValue();
          -[HMDCameraStreamControlMessageHandler residentMessageHandler](v83, "residentMessageHandler");
          v75 = (void *)objc_claimAutoreleasedReturnValue();
          v121 = (void *)v88;
          v118 = v88;
          v76 = v130;
          v123 = (void *)v87;
          v89 = v87;
          v78 = (void *)v128;
          objc_msgSend(v127, "createRemoteStreamControlManagerWithSessionID:workQueue:streamSnapshotHandler:reachabilityPath:device:delegate:delegateQueue:accessory:streamManagementService:remoteCapabilities:profileUniqueIdentifier:residentMessageHandler:remoteAccessDevice:streamPreference:", v130, v124, v89, v120, v128, v83, v71, v13, v72, v118, v74, v75, v129, v134);
          v79 = (void *)objc_claimAutoreleasedReturnValue();
          v80 = 60.0;
          goto LABEL_44;
        }
        if (os_log_type_enabled(v84, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v109 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v138 = v109;
          v139 = 2112;
          v140 = v133;
          _os_log_impl(&dword_1CD062000, v85, OS_LOG_TYPE_ERROR, "%{public}@[%@] Cannot create stream because accessory is unreachable and there is no reachable remote access device", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v82);
        v110 = (void *)MEMORY[0x1E0CB35C8];
        v111 = 4;
      }
      objc_msgSend(v110, "hmErrorWithCode:", v111);
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "respondWithError:", v79);
      v17 = v132;
      v78 = (void *)v128;
LABEL_57:

      v23 = v134;
      v46 = v130;
LABEL_58:

      v6 = v133;
LABEL_59:

    }
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "messagePayload");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v138 = v24;
      v139 = 2112;
      v140 = v25;
      _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_ERROR, "%{public}@Could not find session ID in negotiate message payload: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 20);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "respondWithError:", v13);
  }

}

- (void)_handleRemoteSetupMessage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  HMDCameraStreamControlMessageHandler *v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  __int16 v20;
  id v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "remoteSourceDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1D17BA0A0]();
  v7 = self;
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v5)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "identifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138543874;
      v19 = v10;
      v20 = 2112;
      v21 = v11;
      v22 = 2112;
      v23 = v5;
      _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_INFO, "%{public}@Handling remote setup message %@ from device: %@", (uint8_t *)&v18, 0x20u);

    }
    objc_autoreleasePoolPop(v6);
    -[HMDCameraStreamControlMessageHandler streamSession](v7, "streamSession");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "sessionID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "markMilestoneFor:", CFSTR("ReceivedConnectionSetup"));

    -[HMDCameraStreamControlMessageHandler streamSession](v7, "streamSession");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "streamControlManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setUpRemoteConnectionWithDevice:", v5);

    objc_msgSend(v4, "respondWithPayload:", 0);
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138543618;
      v19 = v16;
      v20 = 2112;
      v21 = v4;
      _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_ERROR, "%{public}@Could not find remote source device for remote setup message: %@", (uint8_t *)&v18, 0x16u);

    }
    objc_autoreleasePoolPop(v6);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", -1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "respondWithError:", v17);

  }
}

- (void)_handleStartMessage:(id)a3
{
  id v4;
  void *v5;
  HMDCameraStreamControlMessageHandler *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1D17BA0A0]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 138543618;
    v18 = v8;
    v19 = 2112;
    v20 = v9;
    _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_INFO, "%{public}@Handling start message with identifier: %@", (uint8_t *)&v17, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  objc_msgSend(v4, "applicationBundleIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCameraStreamControlMessageHandler _attributeMicrophoneUsageToApplicationBundleIdentifier:](v6, "_attributeMicrophoneUsageToApplicationBundleIdentifier:", v10);

  -[HMDCameraStreamControlMessageHandler streamSession](v6, "streamSession");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setCurrentMessage:", v4);

  -[HMDCameraStreamControlMessageHandler streamSession](v6, "streamSession");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "sessionID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "markMilestoneFor:", CFSTR("ReceivedStartRequest"));

  -[HMDCameraStreamControlMessageHandler streamSession](v6, "streamSession");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "streamControlManager");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "messagePayload");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "startStreamWithRemoteSettings:", v16);

}

- (void)_handleReconfigureMessage:(id)a3
{
  id v4;
  void *v5;
  HMDCameraStreamControlMessageHandler *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1D17BA0A0]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138543618;
    v15 = v8;
    v16 = 2112;
    v17 = v9;
    _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_INFO, "%{public}@Handling reconfigure message with identifier: %@", (uint8_t *)&v14, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  -[HMDCameraStreamControlMessageHandler streamSession](v6, "streamSession");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setCurrentMessage:", v4);

  -[HMDCameraStreamControlMessageHandler streamSession](v6, "streamSession");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "streamControlManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "messagePayload");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "reconfigureStream:", v13);

}

- (void)_handleStopMessage:(id)a3
{
  id v4;
  void *v5;
  HMDCameraStreamControlMessageHandler *v6;
  NSObject *v7;
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
  HMDCameraStreamControlMessageHandler *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  void *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1D17BA0A0]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = 138543618;
    v29 = v8;
    v30 = 2112;
    v31 = v9;
    _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_INFO, "%{public}@Handling stop message with identifier: %@", (uint8_t *)&v28, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  objc_msgSend(v4, "messagePayload");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "errorFromDataForKey:", CFSTR("kCameraSessionError"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[HMDCameraStreamControlMessageHandler streamSession](v6, "streamSession");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "streamControlManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "streamMetrics");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setError:", v11);

  }
  -[HMDCameraStreamControlMessageHandler streamSession](v6, "streamSession");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "streamControlManager");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "stopStreamWithError:", v11);

  -[HMDCameraStreamControlMessageHandler streamSession](v6, "streamSession");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "currentMessage");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    v19 = (void *)MEMORY[0x1D17BA0A0]();
    v20 = v6;
    HMFGetOSLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "shortDescription");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = 138543618;
      v29 = v22;
      v30 = 2112;
      v31 = v23;
      _os_log_impl(&dword_1CD062000, v21, OS_LOG_TYPE_INFO, "%{public}@Stop is being called before current message has been processed: %@", (uint8_t *)&v28, 0x16u);

    }
    objc_autoreleasePoolPop(v19);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "respondWithError:", v24);

    -[HMDCameraStreamControlMessageHandler streamSession](v20, "streamSession");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "streamSetupTimer");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "suspend");

  }
  -[HMDCameraStreamControlMessageHandler streamSession](v6, "streamSession");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setCurrentMessage:", v4);

}

- (void)_handleSetAudioVolume:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  HMDCameraStreamControlMessageHandler *v7;
  NSObject *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  uint8_t buf[4];
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((objc_msgSend(v4, "isEntitledForSPIAccess") & 1) != 0)
  {
    objc_msgSend(v4, "numberForKey:", *MEMORY[0x1E0CB8640]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __62__HMDCameraStreamControlMessageHandler__handleSetAudioVolume___block_invoke;
    v10[3] = &unk_1E89C2350;
    v11 = v4;
    -[HMDCameraStreamControlMessageHandler setAudioVolume:callback:](self, "setAudioVolume:callback:", v5, v10);

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
      *(_DWORD *)buf = 138543362;
      v13 = v9;
      _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_ERROR, "%{public}@Ignoring set audio volume message as it is not entitled for SPI access", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v6);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 48);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "respondWithError:", v5);
  }

}

- (void)setAudioVolume:(id)a3 callback:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  HMDCameraStreamControlMessageHandler *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  HMDCameraStreamControlMessageHandler *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  _QWORD v23[5];
  void (**v24)(id, void *);
  uint8_t buf[4];
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  -[HMDCameraStreamControlMessageHandler dataSource](self, "dataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "supportsChangingVolume");

  if ((v9 & 1) == 0)
  {
    v12 = (void *)MEMORY[0x1D17BA0A0]();
    v13 = self;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v26 = v15;
      _os_log_impl(&dword_1CD062000, v14, OS_LOG_TYPE_ERROR, "%{public}@Changing audio volume setting is not allowed on this device", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v12);
    v16 = (void *)MEMORY[0x1E0CB35C8];
    v17 = 48;
    goto LABEL_10;
  }
  if (!v6)
  {
    v18 = (void *)MEMORY[0x1D17BA0A0]();
    v19 = self;
    HMFGetOSLogHandle();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v26 = v21;
      _os_log_impl(&dword_1CD062000, v20, OS_LOG_TYPE_ERROR, "%{public}@Missing parameter to set the audio stream state", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v18);
    v16 = (void *)MEMORY[0x1E0CB35C8];
    v17 = 3;
LABEL_10:
    objc_msgSend(v16, "hmErrorWithCode:", v17);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, v22);

    goto LABEL_11;
  }
  -[HMDCameraStreamControlMessageHandler streamSession](self, "streamSession");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "streamControlManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __64__HMDCameraStreamControlMessageHandler_setAudioVolume_callback___block_invoke;
  v23[3] = &unk_1E89AD3C0;
  v23[4] = self;
  v24 = v7;
  objc_msgSend(v11, "updateAudioVolume:callback:", v6, v23);

LABEL_11:
}

- (void)_handleSetAudioState:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  HMDCameraStreamControlMessageHandler *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  HMDCameraStreamControlMessageHandler *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  HMDCameraStreamControlMessageHandler *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  HMDCameraStreamControlMessageHandler *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  uint64_t v40;
  __int16 v41;
  uint64_t v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "numberForKey:", CFSTR("kAudioStreamSetting"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
  {
    v13 = MEMORY[0x1D17BA0A0]();
    v14 = self;
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v38 = v16;
      _os_log_impl(&dword_1CD062000, v15, OS_LOG_TYPE_ERROR, "%{public}@Missing parameter to set the audio stream state", buf, 0xCu);

    }
    v17 = (void *)v13;
    goto LABEL_16;
  }
  v7 = objc_msgSend(v5, "unsignedIntegerValue");
  v8 = v7;
  if ((unint64_t)(v7 - 1) >= 2)
  {
    if (v7 == 3)
    {
      if ((objc_msgSend(v4, "isAuthorizedForMicrophoneAccess") & 1) != 0)
      {
        -[HMDCameraStreamControlMessageHandler dataSource](self, "dataSource");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "supportsBidirectionalAudioForCameraStreaming");

        if ((v19 & 1) != 0)
          goto LABEL_3;
        v20 = (void *)MEMORY[0x1D17BA0A0]();
        v21 = self;
        HMFGetOSLogHandle();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v38 = v23;
          _os_log_impl(&dword_1CD062000, v22, OS_LOG_TYPE_ERROR, "%{public}@Bi-directional audio is not supported on this device for camera streaming.", buf, 0xCu);

        }
        objc_autoreleasePoolPop(v20);
        v24 = (void *)MEMORY[0x1E0CB35C8];
        v25 = 48;
      }
      else
      {
        v30 = (void *)MEMORY[0x1D17BA0A0]();
        v31 = self;
        HMFGetOSLogHandle();
        v32 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "name");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v38 = v33;
          v39 = 2112;
          v40 = (uint64_t)v34;
          v41 = 2048;
          v42 = (int)objc_msgSend(v4, "sourcePid");
          _os_log_impl(&dword_1CD062000, v32, OS_LOG_TYPE_ERROR, "%{public}@Denying incoming message %@ for client pid %ld since the process is not authorized for microphone access", buf, 0x20u);

        }
        objc_autoreleasePoolPop(v30);
        v24 = (void *)MEMORY[0x1E0CB35C8];
        v25 = 89;
      }
LABEL_17:
      objc_msgSend(v24, "hmErrorWithCode:", v25);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "respondWithError:", v11);
      goto LABEL_18;
    }
    v26 = MEMORY[0x1D17BA0A0]();
    v27 = self;
    HMFGetOSLogHandle();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v38 = v29;
      v39 = 2048;
      v40 = v8;
      _os_log_impl(&dword_1CD062000, v28, OS_LOG_TYPE_ERROR, "%{public}@Invalid audio stream setting: %lu", buf, 0x16u);

    }
    v17 = (void *)v26;
LABEL_16:
    objc_autoreleasePoolPop(v17);
    v24 = (void *)MEMORY[0x1E0CB35C8];
    v25 = 3;
    goto LABEL_17;
  }
LABEL_3:
  -[HMDCameraStreamControlMessageHandler streamSession](self, "streamSession");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "streamControlManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "updateAudioSetting:", v8);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v8, CFSTR("kAudioStreamSetting"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v36, &v35, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "respondWithPayload:", v12);

LABEL_18:
}

- (NSString)streamSessionID
{
  void *v2;
  void *v3;
  void *v4;

  -[HMDCameraStreamControlMessageHandler streamSession](self, "streamSession");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sessionID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sessionID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (BOOL)isStreamingSessionInProgress
{
  void *v2;

  -[HMDCameraStreamControlMessageHandler streamSession](self, "streamSession");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2 != 0;
}

- (BOOL)_shouldStopStreamSessionForProcessInfo:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  int v8;

  v4 = a3;
  -[HMDCameraStreamControlMessageHandler workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v6 = objc_msgSend(v4, "state");
  if (v6 == -1)
  {
    v8 = objc_msgSend(v4, "isEntitledForSPIAccess") ^ 1;
  }
  else if (v6)
  {
    if (v6 == 2)
    {
      objc_msgSend(v4, "applicationInfo");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v8) = v7 != 0;

    }
    else
    {
      LOBYTE(v8) = 1;
    }
  }
  else
  {
    LOBYTE(v8) = 0;
  }

  return v8;
}

- (void)_attributeMicrophoneUsageToApplicationBundleIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  HMDCameraStreamControlMessageHandler *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    -[HMDCameraStreamControlMessageHandler streamSession](self, "streamSession");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "destinationID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      v7 = (void *)MEMORY[0x1D17BA0A0]();
      v8 = self;
      HMFGetOSLogHandle();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = 138543618;
        v13 = v10;
        v14 = 2112;
        v15 = v4;
        _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_INFO, "%{public}@Updating activity attribution with applicationBundleIdentifier: %@", (uint8_t *)&v12, 0x16u);

      }
      objc_autoreleasePoolPop(v7);
      -[HMDCameraStreamControlMessageHandler dynamicActivityAttributionPublisher](v8, "dynamicActivityAttributionPublisher");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setCurrentAttributionKey:andApp:", 0, v4);

    }
  }

}

- (void)_respondToLocalNegotiateStreamMessage:(id)a3
{
  id v4;
  NSObject *v5;
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
  HMDCameraStreamControlMessageHandler *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDCameraStreamControlMessageHandler workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCameraStreamControlMessageHandler streamSessionID](self, "streamSessionID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v7, CFSTR("kCameraSessionID"));

  -[HMDCameraStreamControlMessageHandler streamSession](self, "streamSession");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "streamControlManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "slotIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v10, *MEMORY[0x1E0CB9C50]);

  v11 = (void *)MEMORY[0x1E0CB37E8];
  -[HMDCameraStreamControlMessageHandler streamSession](self, "streamSession");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "streamControlManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "numberWithUnsignedInteger:", objc_msgSend(v13, "audioStreamSetting"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v14, CFSTR("kAudioStreamSetting"));

  -[HMDCameraStreamControlMessageHandler streamSession](self, "streamSession");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "streamControlManager");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "aspectRatio");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v17, *MEMORY[0x1E0CB9DA8]);

  v18 = (void *)MEMORY[0x1D17BA0A0]();
  v19 = self;
  HMFGetOSLogHandle();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "shortDescription");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 138543874;
    v25 = v21;
    v26 = 2112;
    v27 = v22;
    v28 = 2112;
    v29 = v6;
    _os_log_impl(&dword_1CD062000, v20, OS_LOG_TYPE_INFO, "%{public}@Responding to message %@ with payload %@", (uint8_t *)&v24, 0x20u);

  }
  objc_autoreleasePoolPop(v18);
  v23 = (void *)objc_msgSend(v6, "copy");
  objc_msgSend(v4, "respondWithPayload:", v23);

}

- (id)logIdentifier
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

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[HMDCameraStreamControlMessageHandler accessory](self, "accessory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCameraStreamControlMessageHandler streamManagementService](self, "streamManagementService");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "instanceID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCameraStreamControlMessageHandler streamSession](self, "streamSession");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sessionID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sessionID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@/%@/%@"), v5, v7, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)timerDidFire:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  void *v8;
  HMDCameraStreamControlMessageHandler *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDCameraStreamControlMessageHandler workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[HMDCameraStreamControlMessageHandler streamSession](self, "streamSession");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "streamSetupTimer");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7 == v4)
  {
    v8 = (void *)MEMORY[0x1D17BA0A0]();
    v9 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543362;
      v14 = v11;
      _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_ERROR, "%{public}@Stream setup timer fired", (uint8_t *)&v13, 0xCu);

    }
    objc_autoreleasePoolPop(v8);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCameraStreamControlMessageHandler _stopStreamWithError:](v9, "_stopStreamWithError:", v12);

  }
}

- (void)streamControlManager:(id)a3 didNegotiateStreamWithSelectedParameters:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  HMDCameraStreamControlMessageHandler *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  HMDCameraStreamControlMessageHandler *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  HMDCameraStreamControlMessageHandler *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  int v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  int v37;
  void *v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  id v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[HMDCameraStreamControlMessageHandler streamSession](self, "streamSession");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "streamControlManager");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  if (v9 == v6)
  {
    -[HMDCameraStreamControlMessageHandler streamSession](self, "streamSession");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "sessionID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "markMilestoneFor:", CFSTR("SentNegotiationResponse"));

    -[HMDCameraStreamControlMessageHandler streamSession](self, "streamSession");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "currentMessage");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      objc_msgSend(v19, "name");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "isEqualToString:", *MEMORY[0x1E0CB8648]);

      if (v21)
      {
        v22 = (void *)MEMORY[0x1D17BA0A0]();
        v23 = self;
        HMFGetOSLogHandle();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = 138543362;
          v38 = v25;
          _os_log_impl(&dword_1CD062000, v24, OS_LOG_TYPE_INFO, "%{public}@Handling did negotiate stream callback by starting stream", (uint8_t *)&v37, 0xCu);

        }
        objc_autoreleasePoolPop(v22);
        -[HMDCameraStreamControlMessageHandler _handleStartMessage:](v23, "_handleStartMessage:", v19);
        goto LABEL_20;
      }
      objc_msgSend(v19, "name");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_msgSend(v30, "isEqualToString:", CFSTR("kNegotitateRemoteStreamRequestKey"));

      v26 = (void *)MEMORY[0x1D17BA0A0]();
      v27 = self;
      HMFGetOSLogHandle();
      v32 = objc_claimAutoreleasedReturnValue();
      v28 = v32;
      if (v31)
      {
        if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "shortDescription");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = 138543618;
          v38 = v33;
          v39 = 2112;
          v40 = v34;
          _os_log_impl(&dword_1CD062000, v28, OS_LOG_TYPE_INFO, "%{public}@Handling did negotiate stream callback by responding to remote negotiate stream message: %@", (uint8_t *)&v37, 0x16u);

        }
        objc_autoreleasePoolPop(v26);
        objc_msgSend(v19, "respondWithPayload:", v7);
        -[HMDCameraStreamControlMessageHandler streamSession](v27, "streamSession");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "setCurrentMessage:", 0);

        goto LABEL_20;
      }
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "shortDescription");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = 138543618;
        v38 = v29;
        v39 = 2112;
        v40 = v36;
        _os_log_impl(&dword_1CD062000, v28, OS_LOG_TYPE_ERROR, "%{public}@Unexpected current message while handling did negotiate stream callback: %@", (uint8_t *)&v37, 0x16u);

        goto LABEL_18;
      }
    }
    else
    {
      v26 = (void *)MEMORY[0x1D17BA0A0]();
      v27 = self;
      HMFGetOSLogHandle();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = 138543362;
        v38 = v29;
        _os_log_impl(&dword_1CD062000, v28, OS_LOG_TYPE_ERROR, "%{public}@Received did negotiate stream without a current message", (uint8_t *)&v37, 0xCu);
LABEL_18:

      }
    }

    objc_autoreleasePoolPop(v26);
LABEL_20:

    goto LABEL_21;
  }
  v10 = (void *)MEMORY[0x1D17BA0A0]();
  v11 = self;
  HMFGetOSLogHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCameraStreamControlMessageHandler streamSession](v11, "streamSession");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "streamControlManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = 138543874;
    v38 = v13;
    v39 = 2112;
    v40 = v15;
    v41 = 2112;
    v42 = v6;
    _os_log_impl(&dword_1CD062000, v12, OS_LOG_TYPE_DEBUG, "%{public}@Ignoring did negotiate stream because our stream control manager %@ does not match the provided one: %@", (uint8_t *)&v37, 0x20u);

  }
  objc_autoreleasePoolPop(v10);
LABEL_21:

}

- (void)streamControlManagerDidSetUpRemoteConnection:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  HMDCameraStreamControlMessageHandler *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  HMDCameraStreamControlMessageHandler *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
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
  void *v34;
  HMDCameraStreamControlMessageHandler *v35;
  NSObject *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  uint8_t buf[4];
  void *v41;
  __int16 v42;
  void *v43;
  __int16 v44;
  id v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDCameraStreamControlMessageHandler streamSession](self, "streamSession");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "streamControlManager");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6 == v4)
  {
    -[HMDCameraStreamControlMessageHandler streamSession](self, "streamSession");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "sessionID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "markMilestoneFor:", CFSTR("SentConnectionSetup"));

    v15 = (void *)MEMORY[0x1D17BA0A0]();
    v16 = self;
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDCameraStreamControlMessageHandler streamSession](v16, "streamSession");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "destinationID");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v41 = v18;
      v42 = 2112;
      v43 = v20;
      _os_log_impl(&dword_1CD062000, v17, OS_LOG_TYPE_INFO, "%{public}@Sending stream remote setup notification to %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v15);
    -[HMDCameraStreamControlMessageHandler accessory](v16, "accessory");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "home");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "homeManager");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (v23)
    {
      -[HMDCameraStreamControlMessageHandler streamSession](v16, "streamSession", CFSTR("kCameraSessionID"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "sessionID");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "sessionID");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = v26;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v39, &v38, 1);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0D285F8], "internalMessageWithName:messagePayload:", CFSTR("kStreamRemoteConnectionSetupNotificationKey"), v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "setQualityOfService:", 33);
      v29 = (void *)objc_msgSend(v28, "copy");
      -[HMDCameraStreamControlMessageHandler profileUniqueIdentifier](v16, "profileUniqueIdentifier");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDCameraStreamControlMessageHandler streamSession](v16, "streamSession");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "destinationID");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDCameraStreamControlMessageHandler workQueue](v16, "workQueue");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "sendSecureMessage:target:userID:destination:responseQueue:responseHandler:", v29, v30, 0, v32, v33, 0);

    }
    else
    {
      v34 = (void *)MEMORY[0x1D17BA0A0]();
      v35 = v16;
      HMFGetOSLogHandle();
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v41 = v37;
        _os_log_impl(&dword_1CD062000, v36, OS_LOG_TYPE_INFO, "%{public}@No home manager", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v34);
    }

  }
  else
  {
    v7 = (void *)MEMORY[0x1D17BA0A0]();
    v8 = self;
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDCameraStreamControlMessageHandler streamSession](v8, "streamSession");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "streamControlManager");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v41 = v10;
      v42 = 2112;
      v43 = v12;
      v44 = 2112;
      v45 = v4;
      _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_DEBUG, "%{public}@Ignoring did set up remote connection because our stream control manager %@ does not match the provided one: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v7);
  }

}

- (void)streamControlManagerDidStartStream:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  HMDCameraStreamControlMessageHandler *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  int v20;
  void *v21;
  HMDCameraStreamControlMessageHandler *v22;
  NSObject *v23;
  NSObject *v24;
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
  __int16 v36;
  void *v37;
  __int16 v38;
  id v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDCameraStreamControlMessageHandler streamSession](self, "streamSession");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "streamControlManager");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6 == v4)
  {
    -[HMDCameraStreamControlMessageHandler streamSession](self, "streamSession");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "sessionID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "markMilestoneFor:", CFSTR("SentStartResponse"));

    -[HMDCameraStreamControlMessageHandler streamSession](self, "streamSession");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "currentMessage");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      objc_msgSend(v16, "name");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "isEqualToString:", *MEMORY[0x1E0CB8648]);

      if ((v18 & 1) != 0)
      {
LABEL_17:

        goto LABEL_18;
      }
      objc_msgSend(v16, "name");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "isEqualToString:", CFSTR("kStartRemoteStreamRequestKey"));

      v21 = (void *)MEMORY[0x1D17BA0A0]();
      v22 = self;
      HMFGetOSLogHandle();
      v23 = objc_claimAutoreleasedReturnValue();
      v24 = v23;
      if (v20)
      {
        if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "shortDescription");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = 138543618;
          v35 = v25;
          v36 = 2112;
          v37 = v26;
          _os_log_impl(&dword_1CD062000, v24, OS_LOG_TYPE_INFO, "%{public}@Handling did start stream callback by responding to remote start stream message: %@", (uint8_t *)&v34, 0x16u);

        }
        objc_autoreleasePoolPop(v21);
        objc_msgSend(v16, "respondWithSuccess");
        -[HMDCameraStreamControlMessageHandler streamSession](v22, "streamSession");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "setCurrentMessage:", 0);

        -[HMDCameraStreamControlMessageHandler streamSession](v22, "streamSession");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "streamSetupTimer");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "suspend");

        -[HMDCameraStreamControlMessageHandler streamSnapshotHandler](v22, "streamSnapshotHandler");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDCameraStreamControlMessageHandler streamManagementService](v22, "streamManagementService");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "setStreamSetupStatusForService:inProgress:", v31, 0);

        goto LABEL_17;
      }
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "shortDescription");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = 138543618;
        v35 = v32;
        v36 = 2112;
        v37 = v33;
        _os_log_impl(&dword_1CD062000, v24, OS_LOG_TYPE_ERROR, "%{public}@Unexpected current message while handling did start stream callback: %@", (uint8_t *)&v34, 0x16u);

        goto LABEL_15;
      }
    }
    else
    {
      v21 = (void *)MEMORY[0x1D17BA0A0]();
      v22 = self;
      HMFGetOSLogHandle();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = 138543362;
        v35 = v32;
        _os_log_impl(&dword_1CD062000, v24, OS_LOG_TYPE_ERROR, "%{public}@Received did start stream without a current message", (uint8_t *)&v34, 0xCu);
LABEL_15:

      }
    }

    objc_autoreleasePoolPop(v21);
    goto LABEL_17;
  }
  v7 = (void *)MEMORY[0x1D17BA0A0]();
  v8 = self;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCameraStreamControlMessageHandler streamSession](v8, "streamSession");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "streamControlManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = 138543874;
    v35 = v10;
    v36 = 2112;
    v37 = v12;
    v38 = 2112;
    v39 = v4;
    _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_DEBUG, "%{public}@Ignoring did start stream because our stream control manager %@ does not match the provided one: %@", (uint8_t *)&v34, 0x20u);

  }
  objc_autoreleasePoolPop(v7);
LABEL_18:

}

- (void)streamControlManagerDidReceiveFirstFrame:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  HMDCameraStreamControlMessageHandler *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDCameraStreamControlMessageHandler streamSession](self, "streamSession");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sessionID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "markMilestoneFor:", CFSTR("ReceivedFirstFrame"));

  -[HMDCameraStreamControlMessageHandler streamSession](self, "streamSession");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "currentMessage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "name");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0CB8648]);

  if ((v10 & 1) != 0)
  {
    -[HMDCameraStreamControlMessageHandler streamSnapshotHandler](self, "streamSnapshotHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCameraStreamControlMessageHandler streamManagementService](self, "streamManagementService");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setStreamSetupStatusForService:inProgress:", v12, 0);

    -[HMDCameraStreamControlMessageHandler _respondToLocalNegotiateStreamMessage:](self, "_respondToLocalNegotiateStreamMessage:", v8);
    -[HMDCameraStreamControlMessageHandler streamSession](self, "streamSession");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setCurrentMessage:", 0);

    -[HMDCameraStreamControlMessageHandler streamSession](self, "streamSession");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "streamSetupTimer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "suspend");

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
      objc_msgSend(v8, "shortDescription");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 138543618;
      v22 = v19;
      v23 = 2112;
      v24 = v20;
      _os_log_impl(&dword_1CD062000, v18, OS_LOG_TYPE_ERROR, "%{public}@Received did receive first frame with an unexpected current message: %@", (uint8_t *)&v21, 0x16u);

    }
    objc_autoreleasePoolPop(v16);
  }

}

- (void)streamControlManagerDidReconfigureStream:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  HMDCameraStreamControlMessageHandler *v12;
  NSObject *v13;
  _BOOL4 v14;
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
  void (**v26)(_QWORD, _QWORD, _QWORD);
  void *v27;
  void *v28;
  HMDCameraStreamControlMessageHandler *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  void *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDCameraStreamControlMessageHandler streamSession](self, "streamSession");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "streamControlManager");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6 == v4)
  {
    -[HMDCameraStreamControlMessageHandler streamSession](self, "streamSession");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "currentMessage");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "name");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("kReconfigureRemoteStreamRequestKey"));

    v11 = (void *)MEMORY[0x1D17BA0A0]();
    v12 = self;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = os_log_type_enabled(v13, OS_LOG_TYPE_INFO);
    if ((v10 & 1) != 0)
    {
      if (v14)
      {
        HMFGetLogIdentifier();
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDCameraStreamControlMessageHandler streamSession](v12, "streamSession");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "currentMessage");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "name");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDCameraStreamControlMessageHandler streamSession](v12, "streamSession");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "currentMessage");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "identifier");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "UUIDString");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v36 = v15;
        v37 = 2112;
        v38 = v16;
        v39 = 2112;
        v40 = v20;
        _os_log_impl(&dword_1CD062000, v13, OS_LOG_TYPE_INFO, "%{public}@Responding to %@ with identifier %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v11);
      -[HMDCameraStreamControlMessageHandler streamSession](v12, "streamSession");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "currentMessage");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "responseHandler");
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      if (v23)
      {
        -[HMDCameraStreamControlMessageHandler streamSession](v12, "streamSession");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "currentMessage");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "responseHandler");
        v26 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        v26[2](v26, 0, 0);

      }
      else
      {
        v28 = (void *)MEMORY[0x1D17BA0A0]();
        v29 = v12;
        HMFGetOSLogHandle();
        v30 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v36 = v31;
          _os_log_impl(&dword_1CD062000, v30, OS_LOG_TYPE_INFO, "%{public}@No response handler set for message", buf, 0xCu);

        }
        objc_autoreleasePoolPop(v28);
      }
      -[HMDCameraStreamControlMessageHandler streamSession](v12, "streamSession");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "setCurrentMessage:", 0);

    }
    else
    {
      if (v14)
      {
        HMFGetLogIdentifier();
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v36 = v27;
        _os_log_impl(&dword_1CD062000, v13, OS_LOG_TYPE_INFO, "%{public}@No pending reconfigure stream request", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v11);
    }
  }

}

- (void)streamControlManager:(id)a3 didStopStreamWithSessionID:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  HMDCameraStreamControlMessageHandler *v15;
  NSObject *v16;
  _BOOL4 v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  HMDCameraStreamControlMessageHandler *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  HMDCameraStreamControlMessageHandler *v29;
  NSObject *v30;
  _BOOL4 v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  int v37;
  void *v38;
  __int16 v39;
  id v40;
  __int16 v41;
  void *v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[HMDCameraStreamControlMessageHandler streamSession](self, "streamSession");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "sessionID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isEqual:", v9);

  v14 = (void *)MEMORY[0x1D17BA0A0]();
  v15 = self;
  HMFGetOSLogHandle();
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = os_log_type_enabled(v16, OS_LOG_TYPE_INFO);
  if ((v13 & 1) != 0)
  {
    if (v17)
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = 138543618;
      v38 = v18;
      v39 = 2114;
      v40 = v10;
      _os_log_impl(&dword_1CD062000, v16, OS_LOG_TYPE_INFO, "%{public}@Stream did stop with error: %{public}@", (uint8_t *)&v37, 0x16u);

    }
    objc_autoreleasePoolPop(v14);
    -[HMDCameraStreamControlMessageHandler streamSession](v15, "streamSession");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "currentMessage");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      v21 = (void *)MEMORY[0x1D17BA0A0]();
      v22 = v15;
      HMFGetOSLogHandle();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "shortDescription");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = 138543618;
        v38 = v24;
        v39 = 2112;
        v40 = v25;
        _os_log_impl(&dword_1CD062000, v23, OS_LOG_TYPE_INFO, "%{public}@Responding to the current message: %@", (uint8_t *)&v37, 0x16u);

      }
      objc_autoreleasePoolPop(v21);
      objc_msgSend(v20, "respondWithPayload:error:", 0, v10);
    }
    -[HMDCameraStreamControlMessageHandler streamSession](v15, "streamSession");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "destinationID");
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    v28 = (void *)MEMORY[0x1D17BA0A0]();
    v29 = v15;
    HMFGetOSLogHandle();
    v30 = objc_claimAutoreleasedReturnValue();
    v31 = os_log_type_enabled(v30, OS_LOG_TYPE_INFO);
    if (v27)
    {
      if (v31)
      {
        HMFGetLogIdentifier();
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = 138543362;
        v38 = v32;
        _os_log_impl(&dword_1CD062000, v30, OS_LOG_TYPE_INFO, "%{public}@This is a stream being relayed elsewhere so sending remote stream stopped message", (uint8_t *)&v37, 0xCu);

      }
      objc_autoreleasePoolPop(v28);
      -[HMDCameraStreamControlMessageHandler _sendStreamStoppedRemoteNotificationWithError:](v29, "_sendStreamStoppedRemoteNotificationWithError:", v10);
    }
    else
    {
      if (v31)
      {
        HMFGetLogIdentifier();
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = 138543362;
        v38 = v36;
        _os_log_impl(&dword_1CD062000, v30, OS_LOG_TYPE_INFO, "%{public}@This is a stream being shown locally so sending local stream stopped message", (uint8_t *)&v37, 0xCu);

      }
      objc_autoreleasePoolPop(v28);
      -[HMDCameraStreamControlMessageHandler _sendStreamStoppedMessageWithError:](v29, "_sendStreamStoppedMessageWithError:", v10);
    }
    -[HMDCameraStreamControlMessageHandler _resetStreamSession:](v29, "_resetStreamSession:", v10);

  }
  else
  {
    if (v17)
    {
      HMFGetLogIdentifier();
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDCameraStreamControlMessageHandler streamSession](v15, "streamSession");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "sessionID");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = 138543874;
      v38 = v33;
      v39 = 2112;
      v40 = v9;
      v41 = 2112;
      v42 = v35;
      _os_log_impl(&dword_1CD062000, v16, OS_LOG_TYPE_INFO, "%{public}@Ignoring did stop stream callback for session ID %@ because our session ID is %@", (uint8_t *)&v37, 0x20u);

    }
    objc_autoreleasePoolPop(v14);
  }

}

- (void)_sendStreamStoppedMessageWithError:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  HMDCameraStreamControlMessageHandler *v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDCameraStreamControlMessageHandler streamSession](self, "streamSession");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "streamClientConnection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x1D17BA0A0]();
  v8 = self;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v6)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 138543618;
      v25 = v11;
      v26 = 2112;
      v27 = v6;
      _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_INFO, "%{public}@Notifying client that stream has stopped: %@", (uint8_t *)&v24, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCameraStreamControlMessageHandler streamSessionID](v8, "streamSessionID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v13, CFSTR("kCameraSessionID"));

    if (v4)
    {
      objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v4, 1, 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setObject:forKeyedSubscript:", v14, CFSTR("kCameraSessionError"));
      -[HMDCameraStreamControlMessageHandler streamSession](v8, "streamSession");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "streamControlManager");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "streamMetrics");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setError:", v4);

    }
    v18 = objc_alloc(MEMORY[0x1E0D285D8]);
    -[HMDCameraStreamControlMessageHandler profileUniqueIdentifier](v8, "profileUniqueIdentifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_msgSend(v18, "initWithTarget:", v19);

    objc_msgSend(MEMORY[0x1E0D285F8], "messageWithName:destination:payload:", *MEMORY[0x1E0CB8668], v20, v12);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setTransport:", v6);
    -[HMDCameraStreamControlMessageHandler messageDispatcher](v8, "messageDispatcher");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "sendMessage:", v21);

  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 138543362;
      v25 = v23;
      _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_ERROR, "%{public}@Cannot send stream stopped message because XPC client connection doesn't exist", (uint8_t *)&v24, 0xCu);

    }
    objc_autoreleasePoolPop(v7);
  }

}

- (void)_sendStreamStoppedRemoteNotificationWithError:(id)a3
{
  id v4;
  void *v5;
  HMDCameraStreamControlMessageHandler *v6;
  NSObject *v7;
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
  HMDCameraStreamControlMessageHandler *v26;
  NSObject *v27;
  void *v28;
  int v29;
  void *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1D17BA0A0]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCameraStreamControlMessageHandler streamSession](v6, "streamSession");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "destinationID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = 138543618;
    v30 = v8;
    v31 = 2112;
    v32 = v10;
    _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_INFO, "%{public}@Sending stream stopped notification to %@", (uint8_t *)&v29, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  -[HMDCameraStreamControlMessageHandler accessory](v6, "accessory");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "home");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "homeManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCameraStreamControlMessageHandler streamSession](v6, "streamSession");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "sessionID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "sessionID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v17, CFSTR("kCameraSessionID"));

    if (v4)
    {
      objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v4, 1, 0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setObject:forKeyedSubscript:", v18, CFSTR("kCameraSessionError"));

    }
    objc_msgSend(MEMORY[0x1E0D285F8], "internalMessageWithName:messagePayload:", CFSTR("kStreamStoppedRemoteNotificationKey"), v14);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setQualityOfService:", 33);
    v20 = (void *)objc_msgSend(v19, "copy");
    -[HMDCameraStreamControlMessageHandler profileUniqueIdentifier](v6, "profileUniqueIdentifier");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCameraStreamControlMessageHandler streamSession](v6, "streamSession");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "destinationID");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCameraStreamControlMessageHandler workQueue](v6, "workQueue");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "sendSecureMessage:target:userID:destination:responseQueue:responseHandler:", v20, v21, 0, v23, v24, &__block_literal_global_52_59212);

  }
  else
  {
    v25 = (void *)MEMORY[0x1D17BA0A0]();
    v26 = v6;
    HMFGetOSLogHandle();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = 138543362;
      v30 = v28;
      _os_log_impl(&dword_1CD062000, v27, OS_LOG_TYPE_INFO, "%{public}@No home manager", (uint8_t *)&v29, 0xCu);

    }
    objc_autoreleasePoolPop(v25);
  }

}

- (void)_resetStreamSession:(id)a3
{
  id v4;
  void *v5;
  HMDCameraStreamControlMessageHandler *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1D17BA0A0]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138543618;
    v14 = v8;
    v15 = 2112;
    v16 = v4;
    _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_INFO, "%{public}@Resetting the current stream session with error: %@", (uint8_t *)&v13, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  -[HMDCameraStreamControlMessageHandler streamSession](v6, "streamSession");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "streamControlManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "streamMetrics");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setError:", v4);

  -[HMDCameraStreamControlMessageHandler setStreamSession:](v6, "setStreamSession:", 0);
  -[HMDCameraStreamControlMessageHandler dynamicActivityAttributionPublisher](v6, "dynamicActivityAttributionPublisher");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setCurrentAttributionKey:andApp:", 0, 0);

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  char v9;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;
  if (v6)
  {
    -[HMDCameraStreamControlMessageHandler uniqueIdentifier](self, "uniqueIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "uniqueIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "isEqual:", v8);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[HMDCameraStreamControlMessageHandler uniqueIdentifier](self, "uniqueIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (void)handleCameraSettingsDidChangeNotification:(id)a3
{
  NSObject *v4;
  _QWORD block[5];

  -[HMDCameraStreamControlMessageHandler workQueue](self, "workQueue", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __82__HMDCameraStreamControlMessageHandler_handleCameraSettingsDidChangeNotification___block_invoke;
  block[3] = &unk_1E89C2730;
  block[4] = self;
  dispatch_async(v4, block);

}

- (void)handleAccessoryUnconfigured:(id)a3
{
  NSObject *v4;
  _QWORD block[5];

  -[HMDCameraStreamControlMessageHandler workQueue](self, "workQueue", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __68__HMDCameraStreamControlMessageHandler_handleAccessoryUnconfigured___block_invoke;
  block[3] = &unk_1E89C2730;
  block[4] = self;
  dispatch_async(v4, block);

}

- (void)handleProcessStateChange:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  _QWORD v8[5];
  id v9;

  objc_msgSend(a3, "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  if (v6)
  {
    -[HMDCameraStreamControlMessageHandler workQueue](self, "workQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __65__HMDCameraStreamControlMessageHandler_handleProcessStateChange___block_invoke;
    v8[3] = &unk_1E89C2328;
    v8[4] = self;
    v9 = v6;
    dispatch_async(v7, v8);

  }
}

- (void)handleConnectionDeactivatedNotification:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  _QWORD v8[5];
  id v9;

  objc_msgSend(a3, "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  if (v6)
  {
    -[HMDCameraStreamControlMessageHandler workQueue](self, "workQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __80__HMDCameraStreamControlMessageHandler_handleConnectionDeactivatedNotification___block_invoke;
    v8[3] = &unk_1E89C2328;
    v8[4] = self;
    v9 = v6;
    dispatch_async(v7, v8);

  }
}

- (HMDService)streamManagementService
{
  return (HMDService *)objc_getProperty(self, a2, 16, 1);
}

- (HMDCameraMetricsMilestone)negotiationMilestone
{
  return (HMDCameraMetricsMilestone *)objc_getProperty(self, a2, 24, 1);
}

- (void)setNegotiationMilestone:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (HMDCameraResidentMessageHandler)residentMessageHandler
{
  return (HMDCameraResidentMessageHandler *)objc_getProperty(self, a2, 32, 1);
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 40, 1);
}

- (HMDHAPAccessory)accessory
{
  return (HMDHAPAccessory *)objc_loadWeakRetained((id *)&self->_accessory);
}

- (NSUUID)uniqueIdentifier
{
  return (NSUUID *)objc_getProperty(self, a2, 56, 1);
}

- (NSUUID)profileUniqueIdentifier
{
  return (NSUUID *)objc_getProperty(self, a2, 64, 1);
}

- (HMDCameraSupportedConfigurationCache)supportedConfigCache
{
  return (HMDCameraSupportedConfigurationCache *)objc_getProperty(self, a2, 72, 1);
}

- (HMDCameraStreamSnapshotHandler)streamSnapshotHandler
{
  return (HMDCameraStreamSnapshotHandler *)objc_getProperty(self, a2, 80, 1);
}

- (HMFNetMonitor)networkMonitor
{
  return (HMFNetMonitor *)objc_getProperty(self, a2, 88, 1);
}

- (HMFMessageDispatcher)messageDispatcher
{
  return (HMFMessageDispatcher *)objc_getProperty(self, a2, 96, 1);
}

- (void)setMessageDispatcher:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (HMDDynamicActivityAttributionPublisher)dynamicActivityAttributionPublisher
{
  return (HMDDynamicActivityAttributionPublisher *)objc_getProperty(self, a2, 104, 1);
}

- (HMDCameraStreamControlMessageHandlerDataSource)dataSource
{
  return (HMDCameraStreamControlMessageHandlerDataSource *)objc_getProperty(self, a2, 112, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_dynamicActivityAttributionPublisher, 0);
  objc_storeStrong((id *)&self->_messageDispatcher, 0);
  objc_storeStrong((id *)&self->_networkMonitor, 0);
  objc_storeStrong((id *)&self->_streamSnapshotHandler, 0);
  objc_storeStrong((id *)&self->_supportedConfigCache, 0);
  objc_storeStrong((id *)&self->_profileUniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
  objc_destroyWeak((id *)&self->_accessory);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_residentMessageHandler, 0);
  objc_storeStrong((id *)&self->_negotiationMilestone, 0);
  objc_storeStrong((id *)&self->_streamManagementService, 0);
  objc_storeStrong((id *)&self->_streamSession, 0);
}

void __80__HMDCameraStreamControlMessageHandler_handleConnectionDeactivatedNotification___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "streamSession");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "streamClientConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 40));

  if (v4)
  {
    v5 = (void *)MEMORY[0x1D17BA0A0]();
    v6 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543362;
      v12 = v8;
      _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_INFO, "%{public}@Stopping stream because client has deactivated", (uint8_t *)&v11, 0xCu);

    }
    objc_autoreleasePoolPop(v5);
    v9 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmInternalErrorWithCode:", 1048);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_stopStreamWithError:", v10);

  }
}

void __65__HMDCameraStreamControlMessageHandler_handleProcessStateChange___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  int v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "streamSession");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "streamClientConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "processInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqual:", *(_QWORD *)(a1 + 40));

  if (v5
    && objc_msgSend(*(id *)(a1 + 32), "_shouldStopStreamSessionForProcessInfo:", *(_QWORD *)(a1 + 40)))
  {
    v6 = (void *)MEMORY[0x1D17BA0A0]();
    v7 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543362;
      v13 = v9;
      _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_INFO, "%{public}@Stopping stream because client is no longer in foreground", (uint8_t *)&v12, 0xCu);

    }
    objc_autoreleasePoolPop(v6);
    v10 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmInternalErrorWithCode:", 1048);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_stopStreamWithError:", v11);

  }
}

void __68__HMDCameraStreamControlMessageHandler_handleAccessoryUnconfigured___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  char isKindOfClass;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "streamSession");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "streamControlManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    v5 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 4);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_stopStreamWithError:", v6);

  }
}

void __82__HMDCameraStreamControlMessageHandler_handleCameraSettingsDidChangeNotification___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
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

  v14 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "accessory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cameraProfiles");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "anyObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v5, "currentAccessMode");
    if ((HMIsStreamingAllowedForCameraAccessMode() & 1) == 0)
    {
      v6 = *(void **)(a1 + 32);
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 10);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "_stopStreamWithError:", v7);

    }
  }
  else
  {
    v8 = (void *)MEMORY[0x1D17BA0A0]();
    v9 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543362;
      v13 = v11;
      _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_INFO, "%{public}@Camera profile settings are not initialized, skipping cancelling pending stream requests", (uint8_t *)&v12, 0xCu);

    }
    objc_autoreleasePoolPop(v8);
  }

}

void __64__HMDCameraStreamControlMessageHandler_setAudioVolume_callback___block_invoke(uint64_t a1, char a2)
{
  NSObject *v4;
  _QWORD v5[4];
  id v6;
  char v7;

  objc_msgSend(*(id *)(a1 + 32), "workQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __64__HMDCameraStreamControlMessageHandler_setAudioVolume_callback___block_invoke_2;
  v5[3] = &unk_1E89AD398;
  v7 = a2;
  v6 = *(id *)(a1 + 40);
  dispatch_async(v4, v5);

}

void __64__HMDCameraStreamControlMessageHandler_setAudioVolume_callback___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(a1 + 40))
  {
    (*(void (**)(_QWORD, _QWORD))(v1 + 16))(*(_QWORD *)(a1 + 32), 0);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 43);
    v2 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

  }
}

uint64_t __62__HMDCameraStreamControlMessageHandler__handleSetAudioVolume___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "respondWithPayload:error:", 0, a2);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t38_59306 != -1)
    dispatch_once(&logCategory__hmf_once_t38_59306, &__block_literal_global_59307);
  return (id)logCategory__hmf_once_v39_59308;
}

void __51__HMDCameraStreamControlMessageHandler_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v39_59308;
  logCategory__hmf_once_v39_59308 = v0;

}

@end
