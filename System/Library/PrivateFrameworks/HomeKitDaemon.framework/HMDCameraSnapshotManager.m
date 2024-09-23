@implementation HMDCameraSnapshotManager

- (HMDCameraSnapshotManager)initWithAccessory:(id)a3 workQueue:(id)a4 streamSnapshotHandler:(id)a5 uniqueIdentifier:(id)a6 msgDispatcher:(id)a7 networkMonitor:(id)a8
{
  void *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  HMDSnapshotSlotManager *v27;
  HMDCameraSnapshotManagerDataSource *v28;
  HMDCameraResidentMessageHandler *v30;
  id v31;
  HMDCameraSnapshotManager *v33;

  v13 = (void *)MEMORY[0x24BDD17C8];
  v31 = a8;
  v14 = a7;
  v15 = a6;
  v16 = a5;
  v17 = a4;
  v18 = a3;
  objc_msgSend(v18, "home");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "name");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "name");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringWithFormat:", CFSTR("%@/%@/%@"), v20, v21, v15);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  getImagesPath();
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "uuid");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "UUIDString");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "stringByAppendingPathComponent:", v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  v30 = -[HMDCameraResidentMessageHandler initWithAccessory:logIdentifier:]([HMDCameraResidentMessageHandler alloc], "initWithAccessory:logIdentifier:", v18, v22);
  v27 = -[HMDSnapshotSlotManager initWithAccessory:workQueue:imageCacheDirectory:logID:uniqueIdentifier:msgDispatcher:]([HMDSnapshotSlotManager alloc], "initWithAccessory:workQueue:imageCacheDirectory:logID:uniqueIdentifier:msgDispatcher:", v18, v17, v26, v22, v15, v14);
  v28 = objc_alloc_init(HMDCameraSnapshotManagerDataSource);
  v33 = -[HMDCameraSnapshotManager initWithAccessory:workQueue:streamSnapshotHandler:uniqueIdentifier:msgDispatcher:networkMonitor:logIdentifier:imageCacheDirectory:residentMessageHandler:snapshotSlotManager:dataSource:](self, "initWithAccessory:workQueue:streamSnapshotHandler:uniqueIdentifier:msgDispatcher:networkMonitor:logIdentifier:imageCacheDirectory:residentMessageHandler:snapshotSlotManager:dataSource:", v18, v17, v16, v15, v14, v31, v22, v26, v30, v27, v28);

  return v33;
}

- (HMDCameraSnapshotManager)initWithAccessory:(id)a3 workQueue:(id)a4 streamSnapshotHandler:(id)a5 uniqueIdentifier:(id)a6 msgDispatcher:(id)a7 networkMonitor:(id)a8 logIdentifier:(id)a9 imageCacheDirectory:(id)a10 residentMessageHandler:(id)a11 snapshotSlotManager:(id)a12 dataSource:(id)a13
{
  id v18;
  id v19;
  id v20;
  id v21;
  HMDCameraSnapshotManager *v22;
  HMDCameraSnapshotManager *v23;
  uint64_t v24;
  NSUUID *uniqueIdentifier;
  uint64_t v26;
  NSMutableDictionary *currentRemoteSessions;
  id v28;
  uint64_t v29;
  NSString *logIdentifier;
  uint64_t v31;
  NSString *imageCacheDirectory;
  HMDCameraSnapshotMonitorEvents *v33;
  HMDCameraSnapshotMonitorEvents *monitorServicesManager;
  HMDSnapshotRequestHandler *v35;
  HMDSnapshotRequestHandler *snapshotRequestHandler;
  void *v37;
  int v38;
  HMDSnapshotCacheRequestHandler *v39;
  HMDSnapshotCacheRequestHandler *snapshotCacheRequestHandler;
  uint64_t v41;
  NSMutableArray *pendingSnapshotRequestDuringStreamSetup;
  uint64_t v43;
  NSMutableArray *pendingRemoteSnapshotRequestDuringStreamSetup;
  HMDCameraStreamSnapshotHandler *streamSnapshotHandler;
  void *v46;
  id v48;
  id v50;
  id v51;
  id v52;
  id v53;
  id v54;
  id v55;
  id v56;
  objc_super v57;

  v18 = a3;
  v56 = a4;
  v48 = a5;
  v55 = a5;
  v54 = a6;
  v53 = a7;
  v52 = a8;
  v19 = a9;
  v20 = a10;
  v51 = a11;
  v50 = a12;
  v21 = a13;
  v57.receiver = self;
  v57.super_class = (Class)HMDCameraSnapshotManager;
  v22 = -[HMDCameraSnapshotManager init](&v57, sel_init);
  v23 = v22;
  if (v22)
  {
    objc_storeStrong((id *)&v22->_workQueue, a4);
    objc_storeStrong((id *)&v23->_msgDispatcher, a7);
    objc_storeWeak((id *)&v23->_accessory, v18);
    v24 = objc_msgSend(v54, "copy");
    uniqueIdentifier = v23->_uniqueIdentifier;
    v23->_uniqueIdentifier = (NSUUID *)v24;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v26 = objc_claimAutoreleasedReturnValue();
    currentRemoteSessions = v23->_currentRemoteSessions;
    v23->_currentRemoteSessions = (NSMutableDictionary *)v26;

    objc_storeStrong((id *)&v23->_networkMonitor, a8);
    objc_storeStrong((id *)&v23->_residentMessageHandler, a11);
    objc_storeStrong((id *)&v23->_dataSource, a13);
    v28 = v19;
    v29 = objc_msgSend(v19, "copy");
    logIdentifier = v23->_logIdentifier;
    v23->_logIdentifier = (NSString *)v29;

    v31 = objc_msgSend(v20, "copy");
    imageCacheDirectory = v23->_imageCacheDirectory;
    v23->_imageCacheDirectory = (NSString *)v31;

    createDirectory(v23->_imageCacheDirectory);
    if (!isWatch())
    {
      v33 = -[HMDCameraSnapshotMonitorEvents initWithSnapshotManager:accessory:workQueue:msgDispatcher:]([HMDCameraSnapshotMonitorEvents alloc], "initWithSnapshotManager:accessory:workQueue:msgDispatcher:", v23, v18, v23->_workQueue, v53);
      monitorServicesManager = v23->_monitorServicesManager;
      v23->_monitorServicesManager = v33;

    }
    v35 = -[HMDSnapshotRequestHandler initWithAccessory:workQueue:streamSnapshotHandler:imageCacheDirectory:logID:]([HMDSnapshotRequestHandler alloc], "initWithAccessory:workQueue:streamSnapshotHandler:imageCacheDirectory:logID:", v18, v56, v55, v23->_imageCacheDirectory, v23->_logIdentifier);
    snapshotRequestHandler = v23->_snapshotRequestHandler;
    v23->_snapshotRequestHandler = v35;

    +[HMDDeviceCapabilities deviceCapabilities](HMDDeviceCapabilities, "deviceCapabilities");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = objc_msgSend(v37, "isResidentCapable");

    if (v38)
    {
      v39 = -[HMDSnapshotCacheRequestHandler initWithWorkQueue:logID:]([HMDSnapshotCacheRequestHandler alloc], "initWithWorkQueue:logID:", v56, v23->_logIdentifier);
      snapshotCacheRequestHandler = v23->_snapshotCacheRequestHandler;
      v23->_snapshotCacheRequestHandler = v39;

    }
    objc_storeStrong((id *)&v23->_snapshotSlotManager, a12);
    objc_storeStrong((id *)&v23->_streamSnapshotHandler, v48);
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v41 = objc_claimAutoreleasedReturnValue();
    pendingSnapshotRequestDuringStreamSetup = v23->_pendingSnapshotRequestDuringStreamSetup;
    v23->_pendingSnapshotRequestDuringStreamSetup = (NSMutableArray *)v41;

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v43 = objc_claimAutoreleasedReturnValue();
    pendingRemoteSnapshotRequestDuringStreamSetup = v23->_pendingRemoteSnapshotRequestDuringStreamSetup;
    v23->_pendingRemoteSnapshotRequestDuringStreamSetup = (NSMutableArray *)v43;

    streamSnapshotHandler = v23->_streamSnapshotHandler;
    -[HMDCameraSnapshotManager workQueue](v23, "workQueue");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCameraStreamSnapshotHandler addDelegate:delegateQueue:](streamSnapshotHandler, "addDelegate:delegateQueue:", v23, v46);

    v19 = v28;
  }

  return v23;
}

- (void)dealloc
{
  void *v3;
  HMFMessageDispatcher *msgDispatcher;
  objc_super v5;

  objc_msgSend(MEMORY[0x24BDD1540], "hmInternalErrorWithCode:", 1039);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCameraSnapshotManager _removeAllPendingRequests:]((uint64_t)self, v3);

  if (self)
    msgDispatcher = self->_msgDispatcher;
  else
    msgDispatcher = 0;
  -[HMFMessageDispatcher deregisterReceiver:](msgDispatcher, "deregisterReceiver:", self);
  v5.receiver = self;
  v5.super_class = (Class)HMDCameraSnapshotManager;
  -[HMDCameraSnapshotManager dealloc](&v5, sel_dealloc);
}

- (void)registerForMessages
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  HMFMessageDispatcher *msgDispatcher;
  void *v10;
  HMFMessageDispatcher *v11;
  void *v12;
  HMFMessageDispatcher *v13;
  void *v14;
  HMFMessageDispatcher *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  HMFMessageDispatcher *v19;
  void *v20;
  HMFMessageDispatcher *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  HMFMessageDispatcher *v25;
  uint64_t v26;
  void *v27;
  HMFMessageDispatcher *v28;
  void *v29;
  HMFMessageDispatcher *v30;
  uint64_t v31;
  void *v32;
  HMFMessageDispatcher *v33;
  void *v34;
  HMFMessageDispatcher *v35;
  uint64_t v36;
  void *v37;
  HMFMessageDispatcher *v38;
  void *v39;
  HMFMessageDispatcher *v40;
  uint64_t v41;
  void *v42;
  HMFMessageDispatcher *v43;
  void *v44;
  void *v45;
  void *v46;
  HMDSnapshotSlotManager *snapshotSlotManager;
  void *v48;
  _QWORD v49[2];
  _QWORD v50[2];
  _QWORD v51[2];
  _QWORD v52[2];
  _QWORD v53[2];
  _QWORD v54[2];
  uint64_t v55;
  void *v56;
  uint64_t v57;

  v57 = *MEMORY[0x24BDAC8D0];
  -[HMDCameraSnapshotManager accessory]((id *)&self->super.super.isa);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "home");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDUserMessagePolicy userMessagePolicyWithHome:userPrivilege:remoteAccessRequired:requiresCameraStreamingAccess:](HMDUserMessagePolicy, "userMessagePolicyWithHome:userPrivilege:remoteAccessRequired:requiresCameraStreamingAccess:", v4, 0, 1, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  +[HMDRemoteMessagePolicy defaultSecurePolicy](HMDMutableRemoteMessagePolicy, "defaultSecurePolicy");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setRoles:", objc_msgSend(v6, "roles") | 6);
  v7 = objc_msgSend(v6, "copy");
  v8 = (void *)v7;
  if (self)
  {
    msgDispatcher = self->_msgDispatcher;
    v55 = v7;
    v56 = v5;
    v10 = (void *)MEMORY[0x24BDBCE30];
    v11 = msgDispatcher;
    objc_msgSend(v10, "arrayWithObjects:count:", &v55, 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMFMessageDispatcher registerForMessage:receiver:policies:selector:](v11, "registerForMessage:receiver:policies:selector:", CFSTR("kTakeSnapshotRemoteRequestKey"), self, v12, sel__handleTakeRemoteSnapshotMessage_);

    v13 = self->_msgDispatcher;
  }
  else
  {
    v55 = v7;
    v56 = v5;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v55, 2);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(0, "registerForMessage:receiver:policies:selector:", CFSTR("kTakeSnapshotRemoteRequestKey"), 0, v48, sel__handleTakeRemoteSnapshotMessage_);

    v13 = 0;
  }
  v54[0] = v8;
  v54[1] = v5;
  v14 = (void *)MEMORY[0x24BDBCE30];
  v15 = v13;
  objc_msgSend(v14, "arrayWithObjects:count:", v54, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMFMessageDispatcher registerForMessage:receiver:policies:selector:](v15, "registerForMessage:receiver:policies:selector:", CFSTR("kTakeSnapshotRemoteReceivedKey"), self, v16, sel__handleRemoteSnapshotReceivedMessage_);

  +[HMDRemoteMessagePolicy defaultSecurePolicy](HMDRemoteMessagePolicy, "defaultSecurePolicy");
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = (void *)v17;
  if (self)
    v19 = self->_msgDispatcher;
  else
    v19 = 0;
  v53[0] = v17;
  v53[1] = v5;
  v20 = (void *)MEMORY[0x24BDBCE30];
  v21 = v19;
  objc_msgSend(v20, "arrayWithObjects:count:", v53, 2);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMFMessageDispatcher registerForMessage:receiver:policies:selector:](v21, "registerForMessage:receiver:policies:selector:", CFSTR("kTakeSnapshotSendFailedNotificationKey"), self, v22, sel__handleTakeRemoteSnapshotFailureMessage_);

  +[HMDXPCMessagePolicy policyWithEntitlements:](HMDXPCMessagePolicy, "policyWithEntitlements:", 1);
  v23 = objc_claimAutoreleasedReturnValue();
  v24 = (void *)v23;
  if (self)
    v25 = self->_msgDispatcher;
  else
    v25 = 0;
  v26 = *MEMORY[0x24BDD5620];
  v52[0] = v23;
  v52[1] = v5;
  v27 = (void *)MEMORY[0x24BDBCE30];
  v28 = v25;
  objc_msgSend(v27, "arrayWithObjects:count:", v52, 2);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMFMessageDispatcher registerForMessage:receiver:policies:selector:](v28, "registerForMessage:receiver:policies:selector:", v26, self, v29, sel__handleTakeSnapshotMessage_);

  if (self)
    v30 = self->_msgDispatcher;
  else
    v30 = 0;
  v31 = *MEMORY[0x24BDD5618];
  v51[0] = v24;
  v51[1] = v5;
  v32 = (void *)MEMORY[0x24BDBCE30];
  v33 = v30;
  objc_msgSend(v32, "arrayWithObjects:count:", v51, 2);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMFMessageDispatcher registerForMessage:receiver:policies:selector:](v33, "registerForMessage:receiver:policies:selector:", v31, self, v34, sel__handleReleaseSnapshotMessage_);

  if (self)
    v35 = self->_msgDispatcher;
  else
    v35 = 0;
  v36 = *MEMORY[0x24BDD5600];
  v50[0] = v24;
  v50[1] = v5;
  v37 = (void *)MEMORY[0x24BDBCE30];
  v38 = v35;
  objc_msgSend(v37, "arrayWithObjects:count:", v50, 2);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMFMessageDispatcher registerForMessage:receiver:policies:selector:](v38, "registerForMessage:receiver:policies:selector:", v36, self, v39, sel__handleFillSnapshotSlotMessage_);

  if (self)
    v40 = self->_msgDispatcher;
  else
    v40 = 0;
  v41 = *MEMORY[0x24BDD55F8];
  v49[0] = v24;
  v49[1] = v5;
  v42 = (void *)MEMORY[0x24BDBCE30];
  v43 = v40;
  objc_msgSend(v42, "arrayWithObjects:count:", v49, 2);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMFMessageDispatcher registerForMessage:receiver:policies:selector:](v43, "registerForMessage:receiver:policies:selector:", v41, self, v44, sel__handleCreateSnapshotFromBulletinContextMessage_);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "addObserver:selector:name:object:", self, sel_handleAccessoryUnconfigured_, CFSTR("HMDAccessoryDisconnectedNotification"), v3);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "addObserver:selector:name:object:", self, sel_handleCameraSettingsDidChangeNotification_, CFSTR("HMDCameraProfileSettingsDidChangeNotification"), v3);

  if (self)
  {
    -[HMDCameraSnapshotMonitorEvents registerForMessages](self->_monitorServicesManager, "registerForMessages");
    snapshotSlotManager = self->_snapshotSlotManager;
  }
  else
  {
    objc_msgSend(0, "registerForMessages");
    snapshotSlotManager = 0;
  }
  -[HMDSnapshotSlotManager registerForMessages](snapshotSlotManager, "registerForMessages");

}

- (void)takeSnapshot:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HMDCameraSnapshotManager workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __41__HMDCameraSnapshotManager_takeSnapshot___block_invoke;
  v7[3] = &unk_24E79C268;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)releaseSnapshotWithSlotIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  HMDCameraSnapshotManager *v9;

  v4 = a3;
  -[HMDCameraSnapshotManager workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __62__HMDCameraSnapshotManager_releaseSnapshotWithSlotIdentifier___block_invoke;
  v7[3] = &unk_24E79C268;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)handleAccessoryUnconfigured:(id)a3
{
  NSObject *v4;
  _QWORD block[5];

  -[HMDCameraSnapshotManager workQueue](self, "workQueue", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __56__HMDCameraSnapshotManager_handleAccessoryUnconfigured___block_invoke;
  block[3] = &unk_24E79C240;
  block[4] = self;
  dispatch_async(v4, block);

}

- (void)_handleFillSnapshotSlotMessage:(id)a3
{
  if (self)
    self = (HMDCameraSnapshotManager *)self->_snapshotSlotManager;
  -[HMDCameraSnapshotManager handleFillSnapshotSlot:](self, "handleFillSnapshotSlot:", a3);
}

- (void)_handleReleaseSnapshotMessage:(id)a3
{
  if (self)
    self = (HMDCameraSnapshotManager *)self->_snapshotSlotManager;
  -[HMDCameraSnapshotManager handleReleaseSnapshot:](self, "handleReleaseSnapshot:", a3);
}

- (void)_handleCreateSnapshotFromBulletinContextMessage:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  BOOL v10;
  HMDSnapshotFile *v11;
  NSString *imageCacheDirectory;
  HMDSnapshotFile *v13;
  HMDSnapshotSlotManager *snapshotSlotManager;
  void *v15;
  HMDSnapshotSlotManager *v16;
  void *v17;
  void *v18;
  void *v19;
  HMDCameraSnapshotManager *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  HMDCameraSnapshotManager *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  HMDCameraSnapshotManager *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  int v33;
  void *v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  void *v38;
  _QWORD v39[2];

  v39[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDCameraSnapshotManager workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  objc_msgSend(v4, "stringForKey:", CFSTR("kCameraSessionID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringForKey:", *MEMORY[0x24BDD7E28]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dateForKey:", *MEMORY[0x24BDD7E20]);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (!v6 || (v7 ? (v10 = v8 == 0) : (v10 = 1), v10))
  {
    v23 = (void *)MEMORY[0x227676638]();
    v24 = self;
    HMFGetOSLogHandle();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "messagePayload");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = 138543618;
      v34 = v26;
      v35 = 2112;
      v36 = v27;
      _os_log_impl(&dword_2218F0000, v25, OS_LOG_TYPE_ERROR, "%{public}@Snapshot session ID or path or capture date is not present in request: %@", (uint8_t *)&v33, 0x16u);

    }
    objc_autoreleasePoolPop(v23);
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 3);
    v13 = (HMDSnapshotFile *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "respondWithError:", v13);
  }
  else
  {
    v11 = [HMDSnapshotFile alloc];
    if (self)
      imageCacheDirectory = self->_imageCacheDirectory;
    else
      imageCacheDirectory = 0;
    v13 = -[HMDSnapshotFile initWithImageDirectory:externalFilePath:snapshotTimestamp:](v11, "initWithImageDirectory:externalFilePath:snapshotTimestamp:", imageCacheDirectory, v7, v9);
    if (v13)
    {
      if (self)
        snapshotSlotManager = self->_snapshotSlotManager;
      else
        snapshotSlotManager = 0;
      v39[0] = v4;
      v15 = (void *)MEMORY[0x24BDBCE30];
      v16 = snapshotSlotManager;
      objc_msgSend(v15, "arrayWithObjects:count:", v39, 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDSnapshotSlotManager createSlotForSnapshotFile:requestMessages:shouldNotifyClients:](v16, "createSlotForSnapshotFile:requestMessages:shouldNotifyClients:", v13, v17, 0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      v19 = (void *)MEMORY[0x227676638]();
      v20 = self;
      HMFGetOSLogHandle();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = 138543874;
        v34 = v22;
        v35 = 2112;
        v36 = v18;
        v37 = 2112;
        v38 = v7;
        _os_log_impl(&dword_2218F0000, v21, OS_LOG_TYPE_INFO, "%{public}@Created a slot %@ for the snapshot file %@", (uint8_t *)&v33, 0x20u);

      }
      objc_autoreleasePoolPop(v19);
      objc_msgSend(v4, "respondWithPayload:", v18);
    }
    else
    {
      v28 = (void *)MEMORY[0x227676638]();
      v29 = self;
      HMFGetOSLogHandle();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "messagePayload");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = 138543618;
        v34 = v31;
        v35 = 2112;
        v36 = v32;
        _os_log_impl(&dword_2218F0000, v30, OS_LOG_TYPE_ERROR, "%{public}@Failed to create snapshot file for request %@", (uint8_t *)&v33, 0x16u);

      }
      objc_autoreleasePoolPop(v28);
      objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 2);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "respondWithError:", v18);
    }

  }
}

- (NSDictionary)encodedMostRecentSnapshot
{
  HMDSnapshotSlotManager *snapshotSlotManager;
  HMDSnapshotSlotManager *v4;
  void *v5;
  void *v6;
  HMDCameraSnapshotManager *v7;
  NSObject *v8;
  void *v9;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  if (self)
    snapshotSlotManager = self->_snapshotSlotManager;
  else
    snapshotSlotManager = 0;
  v4 = snapshotSlotManager;
  -[HMDSnapshotSlotManager encodedMostRecentSnapshot](v4, "encodedMostRecentSnapshot");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x227676638]();
  v7 = self;
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543618;
    v12 = v9;
    v13 = 2112;
    v14 = v5;
    _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_INFO, "%{public}@Responding to most recent snapshot with payload: %@", (uint8_t *)&v11, 0x16u);

  }
  objc_autoreleasePoolPop(v6);
  return (NSDictionary *)v5;
}

- (void)_handleTakeSnapshotMessage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  HMDCameraSnapshotManager *v11;
  NSObject *v12;
  void *v13;
  HMDSnapshotLocalSession *currentLocalSession;
  void *v15;
  HMDCameraSnapshotManager *v16;
  NSObject *v17;
  void *v18;
  NSMutableArray *pendingSnapshotRequestDuringStreamSetup;
  HMDCameraStreamSnapshotHandler *streamSnapshotHandler;
  void *v21;
  HMDCameraSnapshotManager *v22;
  NSObject *v23;
  void *v24;
  id v25;
  void *v26;
  HMDCameraSnapshotManagerDataSource *v27;
  id WeakRetained;
  HMDCameraStreamSnapshotHandler *v29;
  HMFNetMonitor *v30;
  HMDCameraStreamSnapshotHandler *v31;
  uint64_t v32;
  HMDSnapshotLocalSession *v33;
  uint64_t v34;
  void *v35;
  void **v36;
  NSObject *v37;
  void *v38;
  HMDSnapshotLocalSession *v39;
  HMDSnapshotSlotManager *snapshotSlotManager;
  HMDSnapshotSlotManager *v41;
  HMDSnapshotLocalSession *v42;
  void *v43;
  HMDCameraSnapshotManager *v44;
  NSObject *v45;
  void *v46;
  void *v47;
  int v48;
  void *v49;
  HMDCameraSnapshotManager *v50;
  NSObject *v51;
  void *v52;
  id v53;
  id v54;
  void *v55;
  HMDCameraSnapshotManagerDataSource *v56;
  void *v57;
  void *v58;
  void *v59;
  HMDCameraSnapshotManagerDataSource *dataSource;
  HMFNetMonitor *v61;
  HMDCameraSnapshotManagerDataSource *v62;
  uint64_t v63;
  HMDSnapshotLocalSession *v64;
  uint64_t v65;
  void *v66;
  void **v67;
  NSObject *v68;
  void *v69;
  HMDSnapshotLocalSession *v70;
  HMDCameraSnapshotManagerDataSource *v71;
  HMDCameraSnapshotManagerDataSource *v72;
  HMDCameraResidentMessageHandler *residentMessageHandler;
  _BOOL4 v74;
  void *v75;
  HMDCameraSnapshotManager *v76;
  NSObject *v77;
  void *v78;
  void *v79;
  HMDCameraSnapshotManager *v80;
  NSObject *v81;
  void *v82;
  char v83;
  char v84;
  void *v85;
  HMDCameraSnapshotManager *v86;
  NSObject *v87;
  void *v88;
  void *v89;
  uint64_t v90;
  void *v91;
  char v92;
  void *v93;
  id v94;
  char v95;
  id v96;
  id v97;
  id v98;
  id v99;
  uint8_t buf[4];
  void *v101;
  __int16 v102;
  HMDSnapshotLocalSession *v103;
  uint64_t v104;

  v104 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BE3F138], "currentActivity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "markWithReason:", CFSTR("Snapshot Request"));

  v99 = 0;
  -[HMDCameraSnapshotManager _createSnapshotSessionIDWithMessage:error:]((id *)&self->super.super.isa, v4, &v99);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v99;
  if (v6)
  {
    objc_msgSend(v6, "snapshotCharacteristicEventUUID");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v8;
    if (self)
    {
      if (self->_currentLocalSession)
      {
        v10 = (void *)MEMORY[0x227676638]();
        v11 = self;
        HMFGetOSLogHandle();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          currentLocalSession = v11->_currentLocalSession;
          *(_DWORD *)buf = 138543618;
          v101 = v13;
          v102 = 2112;
          v103 = currentLocalSession;
          _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_INFO, "%{public}@There is already a local session %@ in progress, adding this request to that", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v10);
        -[HMDSnapshotLocalSession addMessage:](v11->_currentLocalSession, "addMessage:", v4);
        if (v9)
          -[HMDSnapshotCacheRequestHandler addSnapshotFileToCache:](v11->_snapshotCacheRequestHandler, "addSnapshotFileToCache:", v9);
LABEL_67:

        goto LABEL_68;
      }
      if (v8)
        goto LABEL_10;
      snapshotSlotManager = self->_snapshotSlotManager;
    }
    else
    {
      if (v8)
        goto LABEL_59;
      snapshotSlotManager = 0;
    }
    v41 = snapshotSlotManager;
    -[HMDSnapshotSlotManager encodedMostRecentSnapshotForMessage:](v41, "encodedMostRecentSnapshotForMessage:", v4);
    v42 = (HMDSnapshotLocalSession *)objc_claimAutoreleasedReturnValue();

    if (v42)
    {
      v43 = (void *)MEMORY[0x227676638]();
      v44 = self;
      HMFGetOSLogHandle();
      v45 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v101 = v46;
        v102 = 2112;
        v103 = v42;
        _os_log_impl(&dword_2218F0000, v45, OS_LOG_TYPE_INFO, "%{public}@Most recent snapshot is still valid, sending it with payload %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v43);
      objc_msgSend(v4, "respondWithPayload:", v42);

      goto LABEL_67;
    }
    if (self)
    {
LABEL_10:
      if (-[HMDCameraStreamSnapshotHandler isStreamSetupInProgress](self->_streamSnapshotHandler, "isStreamSetupInProgress"))
      {
LABEL_11:
        v15 = (void *)MEMORY[0x227676638]();
        v16 = self;
        HMFGetOSLogHandle();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v101 = v18;
          _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_INFO, "%{public}@Stream setup is in progress, adding this to pending request queue", buf, 0xCu);

        }
        objc_autoreleasePoolPop(v15);
        if (self)
          pendingSnapshotRequestDuringStreamSetup = v16->_pendingSnapshotRequestDuringStreamSetup;
        else
          pendingSnapshotRequestDuringStreamSetup = 0;
        -[NSMutableArray addObject:](pendingSnapshotRequestDuringStreamSetup, "addObject:", v4);
        goto LABEL_67;
      }
      streamSnapshotHandler = self->_streamSnapshotHandler;
LABEL_17:
      if (-[HMDCameraStreamSnapshotHandler isStreamAvailable](streamSnapshotHandler, "isStreamAvailable"))
      {
        v21 = (void *)MEMORY[0x227676638]();
        v22 = self;
        HMFGetOSLogHandle();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v101 = v24;
          _os_log_impl(&dword_2218F0000, v23, OS_LOG_TYPE_INFO, "%{public}@Taking snapshot through available camera stream", buf, 0xCu);

        }
        objc_autoreleasePoolPop(v21);
        v97 = v4;
        v25 = v6;
        if (self)
        {
          v26 = v25;
          objc_msgSend(v25, "snapshotCharacteristicEventUUID");
          v93 = (void *)objc_claimAutoreleasedReturnValue();
          v95 = objc_msgSend(v26, "isSnapshotRequestForBulletin");
          v27 = v22->_dataSource;
          WeakRetained = objc_loadWeakRetained((id *)&v22->_accessory);
          v29 = v22->_streamSnapshotHandler;
          v30 = v22->_networkMonitor;
          v31 = v29;
          LOBYTE(v90) = v95;
          -[HMDCameraSnapshotManagerDataSource createLocalSnapshotSessionWithID:accessory:snapshotGetter:message:waitPeriod:reachabilityPath:cameraLocallyReachable:snapshotForNotification:](v27, "createLocalSnapshotSessionWithID:accessory:snapshotGetter:message:waitPeriod:reachabilityPath:cameraLocallyReachable:snapshotForNotification:", v26, WeakRetained, v31, v97, -[HMFNetMonitor reachabilityPath](v30, "reachabilityPath"), 1, 30.0, v90);
          v32 = objc_claimAutoreleasedReturnValue();
          v33 = v22->_currentLocalSession;
          v22->_currentLocalSession = (HMDSnapshotLocalSession *)v32;

          if (v93)
            v34 = -[HMDSnapshotCacheRequestHandler addSnapshotFileToCache:](v22->_snapshotCacheRequestHandler, "addSnapshotFileToCache:", v93);
          v35 = (void *)MEMORY[0x227676638](v34);
          v36 = v22;
          HMFGetOSLogHandle();
          v37 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            v39 = (HMDSnapshotLocalSession *)v36[4];
            *(_DWORD *)buf = 138543618;
            v101 = v38;
            v102 = 2112;
            v103 = v39;
            _os_log_impl(&dword_2218F0000, v37, OS_LOG_TYPE_INFO, "%{public}@Creating a snapshot session %@ with HMDCameraStreamSnapshot", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v35);
          -[HMDCameraSnapshotManager _issueGetSnapshot:](v36, v36[4]);

          v25 = v26;
        }

        goto LABEL_67;
      }
      -[HMDCameraSnapshotManager accessory]((id *)&self->super.super.isa);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = objc_msgSend(v47, "isReachable");

      if (v48)
      {
        v49 = (void *)MEMORY[0x227676638]();
        v50 = self;
        HMFGetOSLogHandle();
        v51 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v101 = v52;
          _os_log_impl(&dword_2218F0000, v51, OS_LOG_TYPE_INFO, "%{public}@Taking local snapshot because accessory is reachable", buf, 0xCu);

        }
        objc_autoreleasePoolPop(v49);
        v53 = v4;
        v54 = v6;
        if (self)
        {
          v55 = v54;
          v98 = v54;
          v92 = objc_msgSend(v54, "isSnapshotRequestForBulletin");
          objc_msgSend(v55, "snapshotCharacteristicEventUUID");
          v91 = (void *)objc_claimAutoreleasedReturnValue();
          v94 = objc_loadWeakRetained((id *)&v50->_accessory);
          v56 = v50->_dataSource;
          -[HMDCameraSnapshotManager workQueue](v50, "workQueue");
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          -[HMDCameraSnapshotManager workQueue](v50, "workQueue");
          v96 = v53;
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          -[HMDCameraSnapshotManagerDataSource createSnapshotLocalWithSessionID:workQueue:accessory:delegate:delegateQueue:snapshotRequestHandler:](v56, "createSnapshotLocalWithSessionID:workQueue:accessory:delegate:delegateQueue:snapshotRequestHandler:", v98, v57, v94, v50, v58, v50->_snapshotRequestHandler);
          v59 = (void *)objc_claimAutoreleasedReturnValue();

          dataSource = v50->_dataSource;
          v61 = v50->_networkMonitor;
          v62 = dataSource;
          LOBYTE(v90) = v92;
          -[HMDCameraSnapshotManagerDataSource createLocalSnapshotSessionWithID:accessory:snapshotGetter:message:waitPeriod:reachabilityPath:cameraLocallyReachable:snapshotForNotification:](v62, "createLocalSnapshotSessionWithID:accessory:snapshotGetter:message:waitPeriod:reachabilityPath:cameraLocallyReachable:snapshotForNotification:", v98, v94, v59, v96, -[HMFNetMonitor reachabilityPath](v61, "reachabilityPath"), 1, 30.0, v90);
          v63 = objc_claimAutoreleasedReturnValue();
          v64 = v50->_currentLocalSession;
          v50->_currentLocalSession = (HMDSnapshotLocalSession *)v63;

          if (v91)
            v65 = -[HMDSnapshotCacheRequestHandler addSnapshotFileToCache:](v50->_snapshotCacheRequestHandler, "addSnapshotFileToCache:", v91);
          v66 = (void *)MEMORY[0x227676638](v65);
          v67 = v50;
          HMFGetOSLogHandle();
          v68 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v68, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v69 = (void *)objc_claimAutoreleasedReturnValue();
            v70 = (HMDSnapshotLocalSession *)v67[4];
            *(_DWORD *)buf = 138543618;
            v101 = v69;
            v102 = 2112;
            v103 = v70;
            _os_log_impl(&dword_2218F0000, v68, OS_LOG_TYPE_INFO, "%{public}@Creating a snapshot session %@ with HMDCameraSnapshotLocal", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v66);
          -[HMDCameraSnapshotManager _issueGetSnapshot:](v67, v67[4]);

          v53 = v96;
          v54 = v98;
        }

        goto LABEL_67;
      }
      if (self)
      {
        if (-[HMDCameraSnapshotManagerDataSource supportsCameraSnapshotRequestViaRelay](self->_dataSource, "supportsCameraSnapshotRequestViaRelay"))
        {
          v71 = self->_dataSource;
          goto LABEL_47;
        }
      }
      else
      {
        v84 = objc_msgSend(0, "supportsCameraSnapshotRequestViaRelay");
        v71 = 0;
        if ((v84 & 1) != 0)
        {
LABEL_47:
          v72 = v71;
          if (-[HMDCameraSnapshotManagerDataSource isWatchDevice](v72, "isWatchDevice"))
          {
            if (self)
              residentMessageHandler = self->_residentMessageHandler;
            else
              residentMessageHandler = 0;
            v74 = -[HMDCameraResidentMessageHandler isUsingCompanionForRemoteAccessDevice](residentMessageHandler, "isUsingCompanionForRemoteAccessDevice");

            if (v74)
            {
              v75 = (void *)MEMORY[0x227676638]();
              v76 = self;
              HMFGetOSLogHandle();
              v77 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v77, OS_LOG_TYPE_INFO))
              {
                HMFGetLogIdentifier();
                v78 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543362;
                v101 = v78;
                _os_log_impl(&dword_2218F0000, v77, OS_LOG_TYPE_INFO, "%{public}@Taking remote snapshot via stream because accessory is unreachable", buf, 0xCu);

              }
              objc_autoreleasePoolPop(v75);
              -[HMDCameraSnapshotManager _sendSnapshotRequestStreamReceiver:snapshotSessionID:](v76, v4, v6);
              goto LABEL_67;
            }
          }
          else
          {

          }
          v79 = (void *)MEMORY[0x227676638]();
          v80 = self;
          HMFGetOSLogHandle();
          v81 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v81, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v82 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v101 = v82;
            _os_log_impl(&dword_2218F0000, v81, OS_LOG_TYPE_INFO, "%{public}@Taking remote snapshot via relay because accessory is unreachable", buf, 0xCu);

          }
          objc_autoreleasePoolPop(v79);
          -[HMDCameraSnapshotManager _sendSnapshotRequestRelayReceiver:snapshotSessionID:](v80, v4, v6);
          goto LABEL_67;
        }
      }
      v85 = (void *)MEMORY[0x227676638]();
      v86 = self;
      HMFGetOSLogHandle();
      v87 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v87, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v88 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v101 = v88;
        _os_log_impl(&dword_2218F0000, v87, OS_LOG_TYPE_ERROR, "%{public}@Cannot take snapshot because accessory is unreachable remote and remote snapshots are unsupported", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v85);
      objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 4);
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "respondWithError:", v89);

      goto LABEL_67;
    }
LABEL_59:
    v83 = objc_msgSend(0, "isStreamSetupInProgress");
    streamSnapshotHandler = 0;
    if ((v83 & 1) != 0)
      goto LABEL_11;
    goto LABEL_17;
  }
  objc_msgSend(v4, "respondWithError:", v7);
LABEL_68:

}

- (void)_handleTakeRemoteSnapshotMessage:(id)a3
{
  id v4;
  void *v5;
  id v6;
  HMDCameraStreamSnapshotHandler *streamSnapshotHandler;
  void *v8;
  HMDCameraSnapshotManager *v9;
  NSObject *v10;
  void *v11;
  NSMutableArray *pendingRemoteSnapshotRequestDuringStreamSetup;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  int v17;
  void *v18;
  HMDCameraSnapshotManager *v19;
  NSObject *v20;
  NSObject *v21;
  void *v22;
  id v23;
  id v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  int *v28;
  id v29;
  id WeakRetained;
  HMDCameraSnapshotRemoteRelaySender *v31;
  void *v32;
  void *v33;
  void *v34;
  HMDCameraSnapshotRemoteRelaySender *v35;
  HMDSnapshotRemoteSession *v36;
  void *v37;
  id *v38;
  NSObject *v39;
  void *v40;
  int v41;
  void *v42;
  HMDCameraSnapshotManager *v43;
  NSObject *v44;
  _BOOL4 v45;
  void *v46;
  id v47;
  void *v48;
  uint64_t v49;
  id v50;
  HMDCameraSnapshotRemoteStreamSender *v51;
  void *v52;
  void *v53;
  void *v54;
  HMDSnapshotRemoteSession *v55;
  void *v56;
  id *v57;
  NSObject *v58;
  void *v59;
  void *v60;
  void *v61;
  uint64_t v62;
  void *v63;
  id v64;
  void *v65;
  id *v66;
  NSObject *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  id v73;
  id v74;
  HMDCameraSnapshotRemoteRelayStream *v75;
  uint64_t v76;
  void *v77;
  HMDSnapshotRemoteSession *v78;
  void *v79;
  id *v80;
  NSObject *v81;
  id v82;
  void *v83;
  void *v84;
  void *v85;
  id *v86;
  NSObject *v87;
  void *v88;
  id v89;
  id v90;
  HMDCameraSnapshotRemoteStreamSender *v91;
  void *v92;
  void *v93;
  HMDCameraSnapshotRemoteRelayStream *v94;
  void *v95;
  void *v96;
  void *v97;
  id v98;
  id v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  id v107;
  id v108;
  id v109;
  void *v110;
  id v111;
  uint8_t buf[4];
  void *v113;
  __int16 v114;
  HMDSnapshotRemoteSession *v115;
  uint64_t v116;

  v116 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v111 = 0;
  -[HMDCameraSnapshotManager _createSnapshotSessionIDWithMessage:error:]((id *)&self->super.super.isa, v4, &v111);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v111;
  if (!v5)
  {
    objc_msgSend(v4, "respondWithError:", v6);
    goto LABEL_38;
  }
  if (self)
    streamSnapshotHandler = self->_streamSnapshotHandler;
  else
    streamSnapshotHandler = 0;
  if (!-[HMDCameraStreamSnapshotHandler isStreamSetupInProgress](streamSnapshotHandler, "isStreamSetupInProgress"))
  {
    objc_msgSend(MEMORY[0x24BE3F138], "currentActivity");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "markWithReason:", CFSTR("Snapshot Remote Request"));

    -[HMDCameraSnapshotManager accessory]((id *)&self->super.super.isa);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMDDeviceCapabilities deviceCapabilities](HMDDeviceCapabilities, "deviceCapabilities");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "isResidentCapable");

    if (v16)
    {
      v17 = objc_msgSend(v14, "isReachable");
      v18 = (void *)MEMORY[0x227676638]();
      v19 = self;
      HMFGetOSLogHandle();
      v20 = objc_claimAutoreleasedReturnValue();
      v21 = v20;
      if (v17)
      {
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v113 = v22;
          _os_log_impl(&dword_2218F0000, v21, OS_LOG_TYPE_INFO, "%{public}@Accessory is reachable and this is remote gateway capable device", buf, 0xCu);

        }
        objc_autoreleasePoolPop(v18);
        v23 = v4;
        v24 = v5;
        v25 = v24;
        if (self)
        {
          v90 = v6;
          v99 = v24;
          v105 = v14;
          objc_msgSend(v23, "stringForKey:", CFSTR("kCameraProactiveSessionID"));
          v26 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "numberForKey:", CFSTR("kCameraStreamingTierType"));
          v102 = (void *)objc_claimAutoreleasedReturnValue();
          v108 = v23;
          objc_msgSend(v23, "remoteSourceDevice");
          v27 = objc_claimAutoreleasedReturnValue();
          if (!v26
            || (v28 = &OBJC_IVAR___HMDCameraSnapshotManager__snapshotCacheRequestHandler,
                !-[HMDSnapshotCacheRequestHandler isSnapshotPresentForCharacteristicEventUUID:](v19->_snapshotCacheRequestHandler, "isSnapshotPresentForCharacteristicEventUUID:", v26)))
          {
            v28 = &OBJC_IVAR___HMDCameraSnapshotManager__snapshotRequestHandler;
          }
          v96 = (void *)v26;
          v29 = *(id *)((char *)&v19->super.super.isa + *v28);
          WeakRetained = objc_loadWeakRetained((id *)&v19->_accessory);
          v31 = [HMDCameraSnapshotRemoteRelaySender alloc];
          -[HMDCameraSnapshotManager workQueue](v19, "workQueue");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          -[HMDCameraSnapshotManager workQueue](v19, "workQueue");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          -[HMDCameraSnapshotManager uniqueIdentifier](v19, "uniqueIdentifier");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v93 = (void *)v27;
          v35 = -[HMDCameraSnapshotRemoteRelaySender initWithSessionID:workQueue:device:accessory:delegate:delegateQueue:uniqueIdentifier:snapshotRequestHandler:](v31, "initWithSessionID:workQueue:device:accessory:delegate:delegateQueue:uniqueIdentifier:snapshotRequestHandler:", v99, v32, v27, WeakRetained, v19, v33, v34, v29);

          v25 = v99;
          v36 = -[HMDSnapshotRemoteSession initWithSessionID:accessory:snapshotGetter:message:waitPeriod:streamingTierType:cameraLocallyReachable:]([HMDSnapshotRemoteSession alloc], "initWithSessionID:accessory:snapshotGetter:message:waitPeriod:streamingTierType:cameraLocallyReachable:", v99, WeakRetained, v35, v108, objc_msgSend(v102, "unsignedIntegerValue"), 1, 40.0);
          v37 = (void *)MEMORY[0x227676638]();
          v38 = v19;
          HMFGetOSLogHandle();
          v39 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v113 = v40;
            v114 = 2112;
            v115 = v36;
            _os_log_impl(&dword_2218F0000, v39, OS_LOG_TYPE_INFO, "%{public}@Creating a snapshot session %@ with HMDCameraSnapshotRemoteRelaySender", buf, 0x16u);

            v25 = v99;
          }

          objc_autoreleasePoolPop(v37);
          objc_msgSend(v38[5], "setObject:forKeyedSubscript:", v36, v25);
          -[HMDCameraSnapshotManager _issueGetSnapshot:](v38, v36);

          v14 = v105;
          v23 = v108;
          v6 = v90;
        }

        goto LABEL_37;
      }
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v113 = v60;
        _os_log_impl(&dword_2218F0000, v21, OS_LOG_TYPE_ERROR, "%{public}@Accessory is not reachable and this is a remote gateway capable device", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v18);
      v61 = (void *)MEMORY[0x24BDD1540];
      v62 = 4;
    }
    else
    {
      if (isiOSDevice())
      {
        v41 = objc_msgSend(v14, "isReachable");
        v42 = (void *)MEMORY[0x227676638]();
        v43 = self;
        HMFGetOSLogHandle();
        v44 = objc_claimAutoreleasedReturnValue();
        v45 = os_log_type_enabled(v44, OS_LOG_TYPE_INFO);
        if (v41)
        {
          if (v45)
          {
            HMFGetLogIdentifier();
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v113 = v46;
            _os_log_impl(&dword_2218F0000, v44, OS_LOG_TYPE_INFO, "%{public}@Accessory is reachable and this is iOS device", buf, 0xCu);

          }
          v106 = v14;

          objc_autoreleasePoolPop(v42);
          v23 = v4;
          v47 = v5;
          v48 = v47;
          if (self)
          {
            objc_msgSend(v47, "streamingTier");
            v100 = v48;
            v103 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "remoteSourceDevice");
            v49 = objc_claimAutoreleasedReturnValue();
            v50 = objc_loadWeakRetained((id *)&v43->_accessory);
            v51 = [HMDCameraSnapshotRemoteStreamSender alloc];
            -[HMDCameraSnapshotManager workQueue](v43, "workQueue");
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            -[HMDCameraSnapshotManager workQueue](v43, "workQueue");
            v109 = v23;
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            -[HMDCameraSnapshotManager uniqueIdentifier](v43, "uniqueIdentifier");
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            v97 = (void *)v49;
            v91 = -[HMDCameraSnapshotRemoteStreamSender initWithSessionID:workQueue:device:accessory:delegate:delegateQueue:uniqueIdentifier:snapshotRequestHandler:](v51, "initWithSessionID:workQueue:device:accessory:delegate:delegateQueue:uniqueIdentifier:snapshotRequestHandler:", v100, v52, v49, v50, v43, v53, v54, v43->_snapshotRequestHandler);

            v48 = v100;
            v55 = -[HMDSnapshotRemoteSession initWithSessionID:accessory:snapshotGetter:message:waitPeriod:streamingTierType:cameraLocallyReachable:]([HMDSnapshotRemoteSession alloc], "initWithSessionID:accessory:snapshotGetter:message:waitPeriod:streamingTierType:cameraLocallyReachable:", v100, v50, v91, v109, objc_msgSend(v103, "unsignedIntegerValue"), 1, 40.0);
            v56 = (void *)MEMORY[0x227676638]();
            v57 = v43;
            HMFGetOSLogHandle();
            v58 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v58, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              v59 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v113 = v59;
              v114 = 2112;
              v115 = v55;
              _os_log_impl(&dword_2218F0000, v58, OS_LOG_TYPE_INFO, "%{public}@Creating a snapshot session %@ with HMDCameraSnapshotRemoteStreamSender", buf, 0x16u);

            }
            objc_autoreleasePoolPop(v56);
            objc_msgSend(v57[5], "setObject:forKeyedSubscript:", v55, v100);
            -[HMDCameraSnapshotManager _issueGetSnapshot:](v57, v55);

            v23 = v109;
          }

          v14 = v106;
        }
        else
        {
          if (v45)
          {
            HMFGetLogIdentifier();
            v63 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v113 = v63;
            _os_log_impl(&dword_2218F0000, v44, OS_LOG_TYPE_INFO, "%{public}@Accessory is not reachable and this is iOS device, ", buf, 0xCu);

          }
          objc_autoreleasePoolPop(v42);
          v23 = v4;
          v64 = v5;
          if (self)
          {
            v65 = (void *)MEMORY[0x227676638]();
            v66 = v43;
            HMFGetOSLogHandle();
            v67 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v67, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              v68 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543362;
              v113 = v68;
              _os_log_impl(&dword_2218F0000, v67, OS_LOG_TYPE_INFO, "%{public}@Creating a snapshot session with HMDCameraSnapshotRemoteRelayStream", buf, 0xCu);

            }
            objc_autoreleasePoolPop(v65);
            objc_msgSend(v64, "streamingTier");
            v104 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "remoteSourceDevice");
            v101 = (void *)objc_claimAutoreleasedReturnValue();
            v107 = objc_loadWeakRetained(v66 + 6);
            if (v107)
            {
              v110 = v23;
              objc_msgSend(v66[16], "remoteAccessDevice");
              v69 = (void *)objc_claimAutoreleasedReturnValue();
              if (v69)
              {
                v94 = [HMDCameraSnapshotRemoteRelayStream alloc];
                objc_msgSend(v66, "workQueue");
                v92 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v66, "workQueue");
                v70 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v66, "uniqueIdentifier");
                v98 = v64;
                v71 = (void *)objc_claimAutoreleasedReturnValue();
                v72 = v14;
                v73 = v66[16];
                v74 = v66[9];
                v89 = v73;
                v14 = v72;
                v75 = v94;
                v95 = v69;
                v76 = -[HMDCameraSnapshotRemoteRelayStream initWithSessionID:workQueue:sourceDevice:remoteDevice:accessory:delegate:delegateQueue:uniqueIdentifier:snapshotRequestHandler:residentMessageHandler:](v75, "initWithSessionID:workQueue:sourceDevice:remoteDevice:accessory:delegate:delegateQueue:uniqueIdentifier:snapshotRequestHandler:residentMessageHandler:", v98, v92, v101, v69, v107, v66, v70, v71, v74, v89);

                v64 = v98;
                v77 = (void *)v76;
                v23 = v110;
                v69 = v95;
                v78 = -[HMDSnapshotRemoteSession initWithSessionID:accessory:snapshotGetter:message:waitPeriod:streamingTierType:cameraLocallyReachable:]([HMDSnapshotRemoteSession alloc], "initWithSessionID:accessory:snapshotGetter:message:waitPeriod:streamingTierType:cameraLocallyReachable:", v98, v107, v77, v110, objc_msgSend(v104, "unsignedIntegerValue"), 0, 60.0);
                objc_msgSend(v66[5], "setObject:forKeyedSubscript:", v78, v98);
                -[HMDCameraSnapshotManager _issueGetSnapshot:](v66, v78);

              }
              else
              {
                v85 = (void *)MEMORY[0x227676638]();
                v86 = v66;
                HMFGetOSLogHandle();
                v87 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v87, OS_LOG_TYPE_ERROR))
                {
                  HMFGetLogIdentifier();
                  v88 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138543362;
                  v113 = v88;
                  _os_log_impl(&dword_2218F0000, v87, OS_LOG_TYPE_ERROR, "%{public}@Failed to create snapshot session with HMDCameraSnapshotRemoteRelayStream: no remote access device", buf, 0xCu);

                }
                objc_autoreleasePoolPop(v85);
                objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 91);
                v77 = (void *)objc_claimAutoreleasedReturnValue();
                v23 = v110;
                objc_msgSend(v110, "respondWithError:", v77);
              }

            }
            else
            {
              v79 = (void *)MEMORY[0x227676638]();
              v80 = v66;
              HMFGetOSLogHandle();
              v81 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v81, OS_LOG_TYPE_ERROR))
              {
                HMFGetLogIdentifier();
                v82 = v64;
                v83 = v14;
                v84 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543362;
                v113 = v84;
                _os_log_impl(&dword_2218F0000, v81, OS_LOG_TYPE_ERROR, "%{public}@Failed to create snapshot session with HMDCameraSnapshotRemoteRelayStream: accessory reference is nil", buf, 0xCu);

                v14 = v83;
                v64 = v82;
              }

              objc_autoreleasePoolPop(v79);
              objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 20);
              v69 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v23, "respondWithError:", v69);
            }

          }
        }
        goto LABEL_37;
      }
      v61 = (void *)MEMORY[0x24BDD1540];
      v62 = 3;
    }
    objc_msgSend(v61, "hmErrorWithCode:", v62);
    v23 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "respondWithError:", v23);
LABEL_37:

    goto LABEL_38;
  }
  v8 = (void *)MEMORY[0x227676638]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v113 = v11;
    _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Stream setup is in progress, adding this to remote pending request queue", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v8);
  if (self)
    pendingRemoteSnapshotRequestDuringStreamSetup = v9->_pendingRemoteSnapshotRequestDuringStreamSetup;
  else
    pendingRemoteSnapshotRequestDuringStreamSetup = 0;
  -[NSMutableArray addObject:](pendingRemoteSnapshotRequestDuringStreamSetup, "addObject:", v4);
LABEL_38:

}

- (void)timerDidFire:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  HMDCameraSnapshotManager *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDCameraSnapshotManager workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v6 = v4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;
  v8 = v7;

  if (v8)
  {
    objc_msgSend(v8, "snapshotSession");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
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
        v16 = 138543618;
        v17 = v13;
        v18 = 2112;
        v19 = v9;
        _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_INFO, "%{public}@%@ has timed out", (uint8_t *)&v16, 0x16u);

      }
      objc_autoreleasePoolPop(v10);
      objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 8);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "sessionID");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDCameraSnapshotManager _sendResponse:error:sessionID:]((uint64_t)v11, 0, v14, v15);

    }
  }

}

- (void)_handleRemoteSnapshotReceivedMessage:(id)a3
{
  HMDCameraSnapshotSessionID *v4;
  HMDCameraSnapshotSessionID *v5;
  void *v6;
  HMDCameraSnapshotSessionID *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  HMDCameraSnapshotManager *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  HMDCameraSnapshotManager *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  HMDCameraSnapshotManager *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  __int16 v29;
  HMDCameraSnapshotSessionID *v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v4 = (HMDCameraSnapshotSessionID *)a3;
  v5 = [HMDCameraSnapshotSessionID alloc];
  -[HMDCameraSnapshotManager accessory]((id *)&self->super.super.isa);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HMDCameraSnapshotSessionID initWithAccessory:message:](v5, "initWithAccessory:message:", v6, v4);

  if (v7)
  {
    -[HMDCameraSnapshotManager _sessionWithID:]((id *)&self->super.super.isa, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = v8;
      objc_msgSend(v8, "snapshotGetter");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "conformsToProtocol:", &unk_2557A0D10);

      if (v11)
      {
        objc_msgSend(v9, "snapshotGetter");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = (void *)MEMORY[0x227676638]();
        v14 = self;
        HMFGetOSLogHandle();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = 138543362;
          v28 = v16;
          _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_INFO, "%{public}@Sending snapshot received confirmation to the sender", (uint8_t *)&v27, 0xCu);

        }
        objc_autoreleasePoolPop(v13);
        objc_msgSend(v12, "snapShotTransferComplete");

      }
      objc_msgSend(MEMORY[0x24BE3F138], "currentActivity");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "markWithReason:", CFSTR("Snapshot Received"));

      -[HMDCameraSnapshotSessionID respondWithSuccess](v4, "respondWithSuccess");
    }
    else
    {
      v22 = (void *)MEMORY[0x227676638]();
      v23 = self;
      HMFGetOSLogHandle();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = 138543618;
        v28 = v25;
        v29 = 2112;
        v30 = v7;
        _os_log_impl(&dword_2218F0000, v24, OS_LOG_TYPE_ERROR, "%{public}@Cannot handle remote snapshot received for unknown session ID: %@", (uint8_t *)&v27, 0x16u);

      }
      objc_autoreleasePoolPop(v22);
      objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 3);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDCameraSnapshotSessionID respondWithError:](v4, "respondWithError:", v26);

      v9 = 0;
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
      v27 = 138543618;
      v28 = v21;
      v29 = 2112;
      v30 = v4;
      _os_log_impl(&dword_2218F0000, v20, OS_LOG_TYPE_ERROR, "%{public}@Failed to create snapshot session ID from remote snapshot received message: %@", (uint8_t *)&v27, 0x16u);

    }
    objc_autoreleasePoolPop(v18);
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCameraSnapshotSessionID respondWithError:](v4, "respondWithError:", v9);
  }

}

- (void)_handleTakeRemoteSnapshotFailureMessage:(id)a3
{
  HMDCameraSnapshotSessionID *v4;
  HMDCameraSnapshotSessionID *v5;
  void *v6;
  HMDCameraSnapshotSessionID *v7;
  void *v8;
  HMDCameraSnapshotManager *v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  HMDCameraSnapshotSessionID *v19;
  void *v20;
  HMDCameraSnapshotManager *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  HMDCameraSnapshotManager *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  HMDCameraSnapshotManager *v30;
  NSObject *v31;
  void *v32;
  int v33;
  void *v34;
  __int16 v35;
  HMDCameraSnapshotSessionID *v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v4 = (HMDCameraSnapshotSessionID *)a3;
  v5 = [HMDCameraSnapshotSessionID alloc];
  -[HMDCameraSnapshotManager accessory]((id *)&self->super.super.isa);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HMDCameraSnapshotSessionID initWithAccessory:message:](v5, "initWithAccessory:message:", v6, v4);

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
      v33 = 138543618;
      v34 = v12;
      v35 = 2112;
      v36 = v7;
      _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_INFO, "%{public}@Received message that remote snapshot failed for session ID: %@", (uint8_t *)&v33, 0x16u);

    }
    objc_autoreleasePoolPop(v8);
    -[HMDCameraSnapshotManager _sessionWithID:]((id *)&v9->super.super.isa, v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13)
    {
      objc_msgSend(v13, "snapshotGetter");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v15, "conformsToProtocol:", &unk_255818288))
        v16 = v15;
      else
        v16 = 0;
      v17 = v16;

      if (v17)
      {
        -[HMDCameraSnapshotSessionID messagePayload](v4, "messagePayload");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "errorFromDataForKey:", CFSTR("kCameraSessionError"));
        v19 = (HMDCameraSnapshotSessionID *)objc_claimAutoreleasedReturnValue();

        v20 = (void *)MEMORY[0x227676638]();
        v21 = v9;
        HMFGetOSLogHandle();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = 138543618;
          v34 = v23;
          v35 = 2112;
          v36 = v19;
          _os_log_impl(&dword_2218F0000, v22, OS_LOG_TYPE_ERROR, "%{public}@Handling remote snapshot failure: %@", (uint8_t *)&v33, 0x16u);

        }
        objc_autoreleasePoolPop(v20);
        objc_msgSend(v17, "snapShotSendFailed:", v19);
        -[HMDCameraSnapshotSessionID respondWithSuccess](v4, "respondWithSuccess");
      }
      else
      {
        v29 = (void *)MEMORY[0x227676638]();
        v30 = v9;
        HMFGetOSLogHandle();
        v31 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = 138543362;
          v34 = v32;
          _os_log_impl(&dword_2218F0000, v31, OS_LOG_TYPE_ERROR, "%{public}@Cannot handle remote snapshot failure for session without a receiver", (uint8_t *)&v33, 0xCu);

        }
        objc_autoreleasePoolPop(v29);
        objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 48);
        v19 = (HMDCameraSnapshotSessionID *)objc_claimAutoreleasedReturnValue();
        -[HMDCameraSnapshotSessionID respondWithError:](v4, "respondWithError:", v19);
      }

    }
    else
    {
      v25 = (void *)MEMORY[0x227676638]();
      v26 = v9;
      HMFGetOSLogHandle();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = 138543618;
        v34 = v28;
        v35 = 2112;
        v36 = v7;
        _os_log_impl(&dword_2218F0000, v27, OS_LOG_TYPE_ERROR, "%{public}@Cannot handle remote snapshot failure for unknown session ID: %@", (uint8_t *)&v33, 0x16u);

      }
      objc_autoreleasePoolPop(v25);
      objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 2);
      v17 = (id)objc_claimAutoreleasedReturnValue();
      -[HMDCameraSnapshotSessionID respondWithError:](v4, "respondWithError:", v17);
    }

  }
  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = 138543618;
      v34 = v24;
      v35 = 2112;
      v36 = v4;
      _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_ERROR, "%{public}@Failed to create snapshot session ID from remote snapshot failure message: %@", (uint8_t *)&v33, 0x16u);

    }
    objc_autoreleasePoolPop(v8);
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDCameraSnapshotSessionID respondWithError:](v4, "respondWithError:", v14);
  }

}

- (NSSet)messageReceiverChildren
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (self && self->_monitorServicesManager)
    objc_msgSend(v3, "addObject:");
  v5 = (void *)objc_msgSend(v4, "copy");

  return (NSSet *)v5;
}

- (void)snapshotLocal:(id)a3 didSaveSnapshotFile:(id)a4 error:(id)a5 sessionID:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  HMDCameraSnapshotManager *v15;
  NSObject *v16;
  void *v17;
  int v18;
  void *v19;
  __int16 v20;
  id v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = (void *)MEMORY[0x227676638]();
  v15 = self;
  HMFGetOSLogHandle();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 138543874;
    v19 = v17;
    v20 = 2112;
    v21 = v13;
    v22 = 2112;
    v23 = v12;
    _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_INFO, "%{public}@%@ Received HMDCameraSnapshotLocalDelegate call back that the image has been saved %@", (uint8_t *)&v18, 0x20u);

  }
  objc_autoreleasePoolPop(v14);
  -[HMDCameraSnapshotManager _sendResponse:error:sessionID:]((uint64_t)v15, v11, v12, v13);

}

- (void)snapshotRelayReceiver:(id)a3 didStartGettingImage:(id)a4 sessionID:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  HMDCameraSnapshotManager *v12;
  NSObject *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)MEMORY[0x227676638]();
  v12 = self;
  HMFGetOSLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138543874;
    v16 = v14;
    v17 = 2112;
    v18 = v10;
    v19 = 2112;
    v20 = v9;
    _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_INFO, "%{public}@%@ Received HMDCameraSnapshotRemoteRelayReceiverDelegate call back that the image get has started after relay with error %@", (uint8_t *)&v15, 0x20u);

  }
  objc_autoreleasePoolPop(v11);

}

- (void)snapshotRelayReceiver:(id)a3 didSaveSnapshotFile:(id)a4 error:(id)a5 sessionID:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  HMDCameraSnapshotManager *v15;
  NSObject *v16;
  void *v17;
  int v18;
  void *v19;
  __int16 v20;
  id v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = (void *)MEMORY[0x227676638]();
  v15 = self;
  HMFGetOSLogHandle();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 138543874;
    v19 = v17;
    v20 = 2112;
    v21 = v13;
    v22 = 2112;
    v23 = v12;
    _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_INFO, "%{public}@%@ Received HMDCameraSnapshotRemoteRelayReceiverDelegate call back that the image has been saved after relay with error %@", (uint8_t *)&v18, 0x20u);

  }
  objc_autoreleasePoolPop(v14);
  -[HMDCameraSnapshotManager _sendResponse:error:sessionID:]((uint64_t)v15, v11, v12, v13);

}

- (void)snapshotRelaySender:(id)a3 didStartCaptureImage:(id)a4 sessionID:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  HMDCameraSnapshotManager *v12;
  NSObject *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)MEMORY[0x227676638]();
  v12 = self;
  HMFGetOSLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138543874;
    v16 = v14;
    v17 = 2112;
    v18 = v10;
    v19 = 2112;
    v20 = v9;
    _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_INFO, "%{public}@%@ Received HMDCameraSnapshotRemoteRelaySenderDelegate call back that the image transfer has started with error %@", (uint8_t *)&v15, 0x20u);

  }
  objc_autoreleasePoolPop(v11);
  -[HMDCameraSnapshotManager _sendRemoteResponse:sessionID:]((id *)&v12->super.super.isa, v9, v10);

}

- (void)snapshotRelaySender:(id)a3 didCompleteSendImage:(id)a4 sessionID:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  HMDCameraSnapshotManager *v12;
  NSObject *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)MEMORY[0x227676638]();
  v12 = self;
  HMFGetOSLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138543874;
    v16 = v14;
    v17 = 2112;
    v18 = v10;
    v19 = 2112;
    v20 = v9;
    _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_INFO, "%{public}@%@ Received HMDCameraSnapshotRemoteRelaySenderDelegate call back that the image transfer has completed with error %@", (uint8_t *)&v15, 0x20u);

  }
  objc_autoreleasePoolPop(v11);
  -[HMDCameraSnapshotManager _endSession:error:]((id *)&v12->super.super.isa, v10, v9);

}

- (void)snapshotRelaySender:(id)a3 didSaveSnapshotFile:(id)a4 sessionID:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  HMDCameraSnapshotManager *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  HMDSnapshotCacheRequestHandler *snapshotCacheRequestHandler;
  HMDSnapshotCacheRequestHandler *v18;
  void *v19;
  int v20;
  void *v21;
  __int16 v22;
  id v23;
  __int16 v24;
  id v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)MEMORY[0x227676638]();
  v12 = self;
  HMFGetOSLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "snapshotCharacteristicEventUUID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 138544130;
    v21 = v14;
    v22 = 2112;
    v23 = v10;
    v24 = 2112;
    v25 = v9;
    v26 = 2112;
    v27 = v15;
    _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_INFO, "%{public}@%@ Received HMDCameraSnapshotRemoteRelaySenderDelegate call back that snapshotFile:%@ has been saved for snapshotCharacteristicEventUUID:%@", (uint8_t *)&v20, 0x2Au);

  }
  objc_autoreleasePoolPop(v11);
  objc_msgSend(v10, "snapshotCharacteristicEventUUID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    if (v12)
      snapshotCacheRequestHandler = v12->_snapshotCacheRequestHandler;
    else
      snapshotCacheRequestHandler = 0;
    v18 = snapshotCacheRequestHandler;
    objc_msgSend(v10, "snapshotCharacteristicEventUUID");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDSnapshotCacheRequestHandler setSnapshotFileToCache:snapshotCharacteristicEventUUID:](v18, "setSnapshotFileToCache:snapshotCharacteristicEventUUID:", v9, v19);

  }
}

- (void)snapshotStreamReceiver:(id)a3 didStartGettingImage:(id)a4 sessionID:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  HMDCameraSnapshotManager *v12;
  NSObject *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)MEMORY[0x227676638]();
  v12 = self;
  HMFGetOSLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138543874;
    v16 = v14;
    v17 = 2112;
    v18 = v10;
    v19 = 2112;
    v20 = v9;
    _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_INFO, "%{public}@%@ Received HMDCameraSnapshotRemoteStreamReceiverDelegate call back that the image get has started after relay with error %@", (uint8_t *)&v15, 0x20u);

  }
  objc_autoreleasePoolPop(v11);

}

- (void)snapshotStreamReceiver:(id)a3 didSaveSnapshotFile:(id)a4 error:(id)a5 sessionID:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  HMDCameraSnapshotManager *v15;
  NSObject *v16;
  void *v17;
  int v18;
  void *v19;
  __int16 v20;
  id v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = (void *)MEMORY[0x227676638]();
  v15 = self;
  HMFGetOSLogHandle();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 138543874;
    v19 = v17;
    v20 = 2112;
    v21 = v13;
    v22 = 2112;
    v23 = v12;
    _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_INFO, "%{public}@%@ Received HMDCameraSnapshotRemoteStreamReceiverDelegate call back that the image has been saved after relay with error %@", (uint8_t *)&v18, 0x20u);

  }
  objc_autoreleasePoolPop(v14);
  -[HMDCameraSnapshotManager _sendResponse:error:sessionID:]((uint64_t)v15, v11, v12, v13);

}

- (void)snapshotStreamSender:(id)a3 didStartCaptureImage:(id)a4 sessionID:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  HMDCameraSnapshotManager *v12;
  NSObject *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)MEMORY[0x227676638]();
  v12 = self;
  HMFGetOSLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138543874;
    v16 = v14;
    v17 = 2112;
    v18 = v10;
    v19 = 2112;
    v20 = v9;
    _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_INFO, "%{public}@%@ Received HMDCameraSnapshotRemoteStreamSenderDelegate call back that the image transfer has started with error %@", (uint8_t *)&v15, 0x20u);

  }
  objc_autoreleasePoolPop(v11);
  -[HMDCameraSnapshotManager _sendRemoteResponse:sessionID:]((id *)&v12->super.super.isa, v9, v10);

}

- (void)snapshotStreamSender:(id)a3 didCompleteSendImage:(id)a4 sessionID:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  HMDCameraSnapshotManager *v12;
  NSObject *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)MEMORY[0x227676638]();
  v12 = self;
  HMFGetOSLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138543874;
    v16 = v14;
    v17 = 2112;
    v18 = v10;
    v19 = 2112;
    v20 = v9;
    _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_INFO, "%{public}@%@ Received HMDCameraSnapshotRemoteStreamSenderDelegate call back that the image transfer has completed with error %@", (uint8_t *)&v15, 0x20u);

  }
  objc_autoreleasePoolPop(v11);
  -[HMDCameraSnapshotManager _endSession:error:]((id *)&v12->super.super.isa, v10, v9);

}

- (void)snapshotRelayStream:(id)a3 didStartCaptureImage:(id)a4 sessionID:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  HMDCameraSnapshotManager *v12;
  NSObject *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)MEMORY[0x227676638]();
  v12 = self;
  HMFGetOSLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138543874;
    v16 = v14;
    v17 = 2112;
    v18 = v10;
    v19 = 2112;
    v20 = v9;
    _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_INFO, "%{public}@%@ Received HMDCameraSnapshotRemoteRelayStreamDelegate call back that the image transfer has started with error %@", (uint8_t *)&v15, 0x20u);

  }
  objc_autoreleasePoolPop(v11);
  -[HMDCameraSnapshotManager _sendRemoteResponse:sessionID:]((id *)&v12->super.super.isa, v9, v10);

}

- (void)snapshotRelayStream:(id)a3 didCompleteSendImage:(id)a4 sessionID:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  HMDCameraSnapshotManager *v12;
  NSObject *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)MEMORY[0x227676638]();
  v12 = self;
  HMFGetOSLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138543874;
    v16 = v14;
    v17 = 2112;
    v18 = v10;
    v19 = 2112;
    v20 = v9;
    _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_INFO, "%{public}@%@ Received HMDCameraSnapshotRemoteRelayStreamDelegate call back that the image transfer has completed with error %@", (uint8_t *)&v15, 0x20u);

  }
  objc_autoreleasePoolPop(v11);
  -[HMDCameraSnapshotManager _endSession:error:]((id *)&v12->super.super.isa, v10, v9);

}

- (void)streamSnapshotHandler:(id)a3 didGetNewSnapshot:(id)a4
{
  id v6;
  id v7;
  HMDSnapshotFile *v8;
  NSString *imageCacheDirectory;
  HMDSnapshotFile *v10;
  void *v11;
  HMDCameraSnapshotManager *v12;
  NSObject *v13;
  _BOOL4 v14;
  void *v15;
  HMDSnapshotLocalSession *currentLocalSession;
  HMDSnapshotLocalSession *v17;
  HMDSnapshotLocalSession *v18;
  uint64_t v19;
  HMDSnapshotFile *v20;
  HMDSnapshotLocalSession *v21;
  HMDSnapshotLocalSession *v22;
  void *v23;
  HMDSnapshotLocalSession *v24;
  int v25;
  void *v26;
  __int16 v27;
  HMDSnapshotFile *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = [HMDSnapshotFile alloc];
  if (self)
    imageCacheDirectory = self->_imageCacheDirectory;
  else
    imageCacheDirectory = 0;
  v10 = -[HMDSnapshotFile initWithImageDirectory:snapshotData:](v8, "initWithImageDirectory:snapshotData:", imageCacheDirectory, v7);
  v11 = (void *)MEMORY[0x227676638]();
  v12 = self;
  HMFGetOSLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = os_log_type_enabled(v13, OS_LOG_TYPE_INFO);
  if (v10)
  {
    if (v14)
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 138543618;
      v26 = v15;
      v27 = 2112;
      v28 = v10;
      _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_INFO, "%{public}@Received a new snapshot from stream %@", (uint8_t *)&v25, 0x16u);

    }
    objc_autoreleasePoolPop(v11);
    if (self)
      currentLocalSession = v12->_currentLocalSession;
    else
      currentLocalSession = 0;
    v17 = currentLocalSession;
    -[HMDSnapshotSession sessionID](v17, "sessionID");
    v18 = (HMDSnapshotLocalSession *)objc_claimAutoreleasedReturnValue();
    v19 = (uint64_t)v12;
    v20 = v10;
    v21 = 0;
    v22 = v18;
  }
  else
  {
    if (v14)
    {
      HMFGetLogIdentifier();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 138543362;
      v26 = v23;
      _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_INFO, "%{public}@New snapshot capture has resulted in failure", (uint8_t *)&v25, 0xCu);

    }
    objc_autoreleasePoolPop(v11);
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 52);
    v18 = (HMDSnapshotLocalSession *)objc_claimAutoreleasedReturnValue();
    if (self)
      v24 = v12->_currentLocalSession;
    else
      v24 = 0;
    -[HMDSnapshotSession sessionID](v24, "sessionID");
    v17 = (HMDSnapshotLocalSession *)objc_claimAutoreleasedReturnValue();
    v19 = (uint64_t)v12;
    v20 = 0;
    v21 = v18;
    v22 = v17;
  }
  -[HMDCameraSnapshotManager _sendResponse:error:sessionID:](v19, v20, v21, v22);

}

- (void)streamSnapshotHandler:(id)a3 didGetLastSnapshot:(id)a4
{
  id v6;
  id v7;
  HMDSnapshotFile *v8;
  NSString *imageCacheDirectory;
  HMDSnapshotFile *v10;
  void *v11;
  HMDCameraSnapshotManager *v12;
  NSObject *v13;
  void *v14;
  HMDSnapshotSlotManager *snapshotSlotManager;
  id v16;
  int v17;
  void *v18;
  __int16 v19;
  HMDSnapshotFile *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = [HMDSnapshotFile alloc];
  if (self)
    imageCacheDirectory = self->_imageCacheDirectory;
  else
    imageCacheDirectory = 0;
  v10 = -[HMDSnapshotFile initWithImageDirectory:snapshotData:](v8, "initWithImageDirectory:snapshotData:", imageCacheDirectory, v7);
  if (v10)
  {
    v11 = (void *)MEMORY[0x227676638]();
    v12 = self;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138543618;
      v18 = v14;
      v19 = 2112;
      v20 = v10;
      _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_INFO, "%{public}@Received the last snapshot from stream %@", (uint8_t *)&v17, 0x16u);

    }
    objc_autoreleasePoolPop(v11);
    if (self)
      snapshotSlotManager = v12->_snapshotSlotManager;
    else
      snapshotSlotManager = 0;
    v16 = -[HMDSnapshotSlotManager createSlotForSnapshotFile:requestMessages:shouldNotifyClients:](snapshotSlotManager, "createSlotForSnapshotFile:requestMessages:shouldNotifyClients:", v10, MEMORY[0x24BDBD1A8], 1);
  }

}

- (void)streamSnapshotHandler:(id)a3 didChangeStreamSetupInProgress:(BOOL)a4
{
  id v6;
  void *v7;
  HMDCameraSnapshotManager *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  NSMutableArray *pendingSnapshotRequestDuringStreamSetup;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  NSMutableArray *pendingRemoteSnapshotRequestDuringStreamSetup;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint8_t v34[128];
  uint8_t buf[4];
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  if (!a4)
  {
    v7 = (void *)MEMORY[0x227676638]();
    v8 = self;
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v36 = v10;
      _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@Received call back that stream setup is not in progress anymore", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v7);
    if (v8)
    {
      v11 = (void *)-[NSMutableArray copy](v8->_pendingSnapshotRequestDuringStreamSetup, "copy");
      pendingSnapshotRequestDuringStreamSetup = v8->_pendingSnapshotRequestDuringStreamSetup;
    }
    else
    {
      v11 = (void *)objc_msgSend(0, "copy");
      pendingSnapshotRequestDuringStreamSetup = 0;
    }
    -[NSMutableArray removeAllObjects](pendingSnapshotRequestDuringStreamSetup, "removeAllObjects");
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    v13 = v11;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v30;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v30 != v16)
            objc_enumerationMutation(v13);
          -[HMDCameraSnapshotManager _handleTakeSnapshotMessage:](v8, "_handleTakeSnapshotMessage:", *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * i));
        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
      }
      while (v15);
    }

    if (v8)
    {
      v18 = (void *)-[NSMutableArray copy](v8->_pendingRemoteSnapshotRequestDuringStreamSetup, "copy");
      pendingRemoteSnapshotRequestDuringStreamSetup = v8->_pendingRemoteSnapshotRequestDuringStreamSetup;
    }
    else
    {
      v18 = (void *)objc_msgSend(0, "copy");
      pendingRemoteSnapshotRequestDuringStreamSetup = 0;
    }
    -[NSMutableArray removeAllObjects](pendingRemoteSnapshotRequestDuringStreamSetup, "removeAllObjects");
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v20 = v18;
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v26;
      do
      {
        for (j = 0; j != v22; ++j)
        {
          if (*(_QWORD *)v26 != v23)
            objc_enumerationMutation(v20);
          -[HMDCameraSnapshotManager _handleTakeRemoteSnapshotMessage:](v8, "_handleTakeRemoteSnapshotMessage:", *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * j), (_QWORD)v25);
        }
        v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
      }
      while (v22);
    }

  }
}

- (void)handleCameraSettingsDidChangeNotification:(id)a3
{
  NSObject *v4;
  _QWORD block[5];

  -[HMDCameraSnapshotManager workQueue](self, "workQueue", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __70__HMDCameraSnapshotManager_handleCameraSettingsDidChangeNotification___block_invoke;
  block[3] = &unk_24E79C240;
  block[4] = self;
  dispatch_async(v4, block);

}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (NSUUID)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (NSString)logIdentifier
{
  return self->_logIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logIdentifier, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_residentMessageHandler, 0);
  objc_storeStrong((id *)&self->_networkMonitor, 0);
  objc_storeStrong((id *)&self->_pendingRemoteSnapshotRequestDuringStreamSetup, 0);
  objc_storeStrong((id *)&self->_pendingSnapshotRequestDuringStreamSetup, 0);
  objc_storeStrong((id *)&self->_streamSnapshotHandler, 0);
  objc_storeStrong((id *)&self->_snapshotSlotManager, 0);
  objc_storeStrong((id *)&self->_snapshotCacheRequestHandler, 0);
  objc_storeStrong((id *)&self->_snapshotRequestHandler, 0);
  objc_storeStrong((id *)&self->_monitorServicesManager, 0);
  objc_storeStrong((id *)&self->_imageCacheDirectory, 0);
  objc_destroyWeak((id *)&self->_accessory);
  objc_storeStrong((id *)&self->_currentRemoteSessions, 0);
  objc_storeStrong((id *)&self->_currentLocalSession, 0);
  objc_storeStrong((id *)&self->_msgDispatcher, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
}

void __70__HMDCameraSnapshotManager_handleCameraSettingsDidChangeNotification___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  -[HMDCameraSnapshotManager accessory](*(id **)(a1 + 32));
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
    if ((HMAreSnapshotsAllowedForCameraAccessMode() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 10);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDCameraSnapshotManager _removeAllPendingRequests:](*(_QWORD *)(a1 + 32), v6);

    }
  }
  else
  {
    v7 = (void *)MEMORY[0x227676638]();
    v8 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543362;
      v12 = v10;
      _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@Camera profile settings are not initialized, skipping cancelling pending snapshot requests", (uint8_t *)&v11, 0xCu);

    }
    objc_autoreleasePoolPop(v7);
  }

}

- (id)accessory
{
  if (WeakRetained)
    WeakRetained = (id *)objc_loadWeakRetained(WeakRetained + 6);
  return WeakRetained;
}

- (void)_removeAllPendingRequests:(uint64_t)a1
{
  id v3;
  void *v4;
  id *v5;
  NSObject *v6;
  void *v7;
  id v8;
  void *v9;
  id *v10;
  NSObject *v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  uint64_t v19;
  id v20;
  void *v21;
  void *v22;
  id *v23;
  NSObject *v24;
  void *v25;
  id v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t j;
  void *v32;
  void *v33;
  void (**v34)(_QWORD, _QWORD, _QWORD);
  void *v35;
  id *v36;
  NSObject *v37;
  void *v38;
  id v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t k;
  void *v45;
  void *v46;
  void (**v47)(_QWORD, _QWORD, _QWORD);
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  _BYTE v60[128];
  _BYTE v61[128];
  uint8_t v62[128];
  uint8_t buf[4];
  void *v64;
  __int16 v65;
  id v66;
  __int16 v67;
  id v68;
  uint64_t v69;

  v69 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (a1)
  {
    if (*(_QWORD *)(a1 + 32))
    {
      v4 = (void *)MEMORY[0x227676638]();
      v5 = (id *)(id)a1;
      HMFGetOSLogHandle();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = v5[4];
        *(_DWORD *)buf = 138543874;
        v64 = v7;
        v65 = 2112;
        v66 = v8;
        v67 = 2112;
        v68 = v3;
        _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_ERROR, "%{public}@Failing current local session %@:%@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v4);
      objc_msgSend(v5[4], "respond:payload:", v3, 0);
      objc_storeStrong(v5 + 4, 0);
    }
    if (objc_msgSend(*(id *)(a1 + 40), "count"))
    {
      v9 = (void *)MEMORY[0x227676638]();
      v10 = (id *)(id)a1;
      HMFGetOSLogHandle();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v10[5];
        *(_DWORD *)buf = 138543874;
        v64 = v12;
        v65 = 2112;
        v66 = v13;
        v67 = 2112;
        v68 = v3;
        _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_ERROR, "%{public}@Failing current remote sessions %@:%@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v9);
      v58 = 0u;
      v59 = 0u;
      v56 = 0u;
      v57 = 0u;
      v14 = v10[5];
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v56, v62, 16);
      if (v15)
      {
        v16 = v15;
        v17 = *(_QWORD *)v57;
        do
        {
          for (i = 0; i != v16; ++i)
          {
            if (*(_QWORD *)v57 != v17)
              objc_enumerationMutation(v14);
            v19 = *(_QWORD *)(*((_QWORD *)&v56 + 1) + 8 * i);
            v20 = v10[5];
            objc_msgSend(v20, "objectForKeyedSubscript:", v19);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "respond:payload:", v3, 0);

          }
          v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v56, v62, 16);
        }
        while (v16);
      }

      objc_msgSend(v10[5], "removeAllObjects");
    }
    if (objc_msgSend(*(id *)(a1 + 104), "count"))
    {
      v22 = (void *)MEMORY[0x227676638]();
      v23 = (id *)(id)a1;
      HMFGetOSLogHandle();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = v23[13];
        *(_DWORD *)buf = 138543874;
        v64 = v25;
        v65 = 2112;
        v66 = v26;
        v67 = 2112;
        v68 = v3;
        _os_log_impl(&dword_2218F0000, v24, OS_LOG_TYPE_ERROR, "%{public}@Failing pending snapshot request during stream set up %@:%@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v22);
      v54 = 0u;
      v55 = 0u;
      v52 = 0u;
      v53 = 0u;
      v27 = v23[13];
      v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v52, v61, 16);
      if (v28)
      {
        v29 = v28;
        v30 = *(_QWORD *)v53;
        do
        {
          for (j = 0; j != v29; ++j)
          {
            if (*(_QWORD *)v53 != v30)
              objc_enumerationMutation(v27);
            v32 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * j);
            objc_msgSend(v32, "responseHandler");
            v33 = (void *)objc_claimAutoreleasedReturnValue();

            if (v33)
            {
              objc_msgSend(v32, "responseHandler");
              v34 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
              ((void (**)(_QWORD, id, _QWORD))v34)[2](v34, v3, 0);

            }
          }
          v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v52, v61, 16);
        }
        while (v29);
      }

      objc_msgSend(v23[13], "removeAllObjects");
    }
    if (objc_msgSend(*(id *)(a1 + 112), "count"))
    {
      v35 = (void *)MEMORY[0x227676638]();
      v36 = (id *)(id)a1;
      HMFGetOSLogHandle();
      v37 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = v36[14];
        *(_DWORD *)buf = 138543874;
        v64 = v38;
        v65 = 2112;
        v66 = v39;
        v67 = 2112;
        v68 = v3;
        _os_log_impl(&dword_2218F0000, v37, OS_LOG_TYPE_ERROR, "%{public}@Failing pending remote snapshot request during stream set up %@:%@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v35);
      v50 = 0u;
      v51 = 0u;
      v48 = 0u;
      v49 = 0u;
      v40 = v36[14];
      v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v48, v60, 16);
      if (v41)
      {
        v42 = v41;
        v43 = *(_QWORD *)v49;
        do
        {
          for (k = 0; k != v42; ++k)
          {
            if (*(_QWORD *)v49 != v43)
              objc_enumerationMutation(v40);
            v45 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * k);
            objc_msgSend(v45, "responseHandler", (_QWORD)v48);
            v46 = (void *)objc_claimAutoreleasedReturnValue();

            if (v46)
            {
              objc_msgSend(v45, "responseHandler");
              v47 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
              ((void (**)(_QWORD, id, _QWORD))v47)[2](v47, v3, 0);

            }
          }
          v42 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v48, v60, 16);
        }
        while (v42);
      }

      objc_msgSend(v36[14], "removeAllObjects");
    }
  }

}

- (void)_sendResponse:(void *)a3 error:(void *)a4 sessionID:
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  id *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  NSObject *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint8_t v35[128];
  uint8_t buf[4];
  void *v37;
  __int16 v38;
  id v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (a1)
  {
    -[HMDCameraSnapshotManager _sessionWithID:]((id *)a1, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
    {
      v29 = v10;
      v30 = v9;
      v33 = 0u;
      v34 = 0u;
      v31 = 0u;
      v32 = 0u;
      objc_msgSend(v10, "sessionMessages");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
      if (v13)
      {
        v14 = v13;
        v15 = *(_QWORD *)v32;
        do
        {
          for (i = 0; i != v14; ++i)
          {
            if (*(_QWORD *)v32 != v15)
              objc_enumerationMutation(v12);
            objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * i), "stringForKey:", CFSTR("kCameraProactiveSessionID"));
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            if (v17)
            {
              v18 = *(void **)(a1 + 80);
              if (v8)
                objc_msgSend(v18, "removeSnapshotFileToCache:error:", v17, v8);
              else
                objc_msgSend(v18, "setSnapshotFileToCache:snapshotCharacteristicEventUUID:", v7, v17);
            }

          }
          v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
        }
        while (v14);
      }

      if (v8)
      {
        v11 = v29;
        objc_msgSend(v29, "respond:payload:", v8, 0);
        v19 = (id *)a1;
        v9 = v30;
        v20 = v30;
        v21 = v8;
      }
      else
      {
        v26 = *(id *)(a1 + 88);
        v11 = v29;
        objc_msgSend(v29, "sessionMessages");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "createSlotForSnapshotFile:requestMessages:shouldNotifyClients:", v7, v27, 1);
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v29, "respond:payload:", 0, v28);
        v19 = (id *)a1;
        v9 = v30;
        v20 = v30;
        v21 = 0;
      }
      -[HMDCameraSnapshotManager _endSession:error:](v19, v20, v21);
    }
    else
    {
      v22 = (void *)MEMORY[0x227676638]();
      v23 = (id)a1;
      HMFGetOSLogHandle();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v37 = v25;
        v38 = 2112;
        v39 = v9;
        _os_log_impl(&dword_2218F0000, v24, OS_LOG_TYPE_ERROR, "%{public}@Received a delegate call back for an unknown session ID: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v22);
    }

  }
}

- (id)_sessionWithID:(id *)a1
{
  id v3;
  void *v4;
  int v5;
  id *v6;

  v3 = a2;
  if (a1)
  {
    objc_msgSend(a1[4], "sessionID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isEqual:", v3);

    if (v5)
    {
      v6 = (id *)a1[4];
    }
    else
    {
      objc_msgSend(a1[5], "objectForKeyedSubscript:", v3);
      v6 = (id *)objc_claimAutoreleasedReturnValue();
    }
    a1 = v6;
  }

  return a1;
}

- (void)_endSession:(void *)a3 error:
{
  id v5;
  id v6;
  id v7;
  void *v8;
  int v9;
  void *v10;
  id *v11;
  NSObject *v12;
  _BOOL4 v13;
  void *v14;
  id v15;
  void *v16;
  int v17;
  void *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (a1)
  {
    v7 = a1[4];
    objc_msgSend(v7, "sessionID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isEqual:", v5);

    v10 = (void *)MEMORY[0x227676638]();
    v11 = a1;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = os_log_type_enabled(v12, OS_LOG_TYPE_INFO);
    if (v9)
    {
      if (v13)
      {
        HMFGetLogIdentifier();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = 138543618;
        v18 = v14;
        v19 = 2112;
        v20 = v5;
        _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_INFO, "%{public}@Resetting local session %@", (uint8_t *)&v17, 0x16u);

      }
      objc_autoreleasePoolPop(v10);
      objc_msgSend(v11[4], "respond:payload:", v6, 0);
      v15 = v11[4];
      v11[4] = 0;
    }
    else
    {
      if (v13)
      {
        HMFGetLogIdentifier();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = 138543618;
        v18 = v16;
        v19 = 2112;
        v20 = v5;
        _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_INFO, "%{public}@Resetting remote session %@", (uint8_t *)&v17, 0x16u);

      }
      objc_autoreleasePoolPop(v10);
      objc_msgSend(v11[5], "objectForKeyedSubscript:", v5);
      v15 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "respond:payload:", v6, 0);
      objc_msgSend(v11[5], "removeObjectForKey:", v5);
    }

  }
}

- (void)_sendRemoteResponse:(void *)a3 sessionID:
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id *v9;
  NSObject *v10;
  void *v11;
  const char *v12;
  NSObject *v13;
  uint32_t v14;
  int v15;
  void *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (a1)
  {
    -[HMDCameraSnapshotManager _sessionWithID:](a1, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v7, "respond:payload:", 0, 0);
        if (v5)
          -[HMDCameraSnapshotManager _endSession:error:](a1, v6, v5);
        goto LABEL_12;
      }
      v8 = (void *)MEMORY[0x227676638]();
      v9 = a1;
      HMFGetOSLogHandle();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = 138543874;
        v16 = v11;
        v17 = 2112;
        v18 = v6;
        v19 = 2112;
        v20 = objc_opt_class();
        v12 = "%{public}@Received a delegate call back for an unknown session snapshot session of unexpected type: %@ (class: %@)";
        v13 = v10;
        v14 = 32;
        goto LABEL_10;
      }
    }
    else
    {
      v8 = (void *)MEMORY[0x227676638]();
      v9 = a1;
      HMFGetOSLogHandle();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = 138543618;
        v16 = v11;
        v17 = 2112;
        v18 = v6;
        v12 = "%{public}@Received a delegate call back for an unknown session ID: %@";
        v13 = v10;
        v14 = 22;
LABEL_10:
        _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_ERROR, v12, (uint8_t *)&v15, v14);

      }
    }

    objc_autoreleasePoolPop(v8);
LABEL_12:

  }
}

- (id)_createSnapshotSessionIDWithMessage:(_QWORD *)a3 error:
{
  id v5;
  id WeakRetained;
  HMDCameraSnapshotSessionID *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  id *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  id *v21;
  NSObject *v22;
  void *v23;
  int v25;
  void *v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  if (a1)
  {
    WeakRetained = objc_loadWeakRetained(a1 + 6);
    v7 = -[HMDCameraSnapshotSessionID initWithAccessory:message:]([HMDCameraSnapshotSessionID alloc], "initWithAccessory:message:", WeakRetained, v5);
    if (!v7)
    {
      v16 = (void *)MEMORY[0x227676638]();
      v17 = a1;
      HMFGetOSLogHandle();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = 138543618;
        v26 = v19;
        v27 = 2112;
        v28 = v5;
        _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_ERROR, "%{public}@Unable to create snapshot session identifier for: %@", (uint8_t *)&v25, 0x16u);

      }
      objc_autoreleasePoolPop(v16);
      if (a3)
      {
        objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 3);
        a1 = 0;
        *a3 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        a1 = 0;
      }
      goto LABEL_18;
    }
    objc_msgSend(WeakRetained, "cameraProfiles");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "anyObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "currentSettings");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v10, "currentAccessMode");
      if ((HMAreSnapshotsAllowedForCameraAccessMode() & 1) == 0)
      {
        v11 = (void *)MEMORY[0x227676638]();
        v12 = a1;
        HMFGetOSLogHandle();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          HMCameraAccessModeAsString();
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = 138543618;
          v26 = v14;
          v27 = 2112;
          v28 = v15;
          _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_INFO, "%{public}@Snapshots are not allowed for camera access mode: %@", (uint8_t *)&v25, 0x16u);

        }
        objc_autoreleasePoolPop(v11);
        if (a3)
        {
          objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 10);
          a1 = 0;
          *a3 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          a1 = 0;
        }
        goto LABEL_17;
      }
    }
    else
    {
      v20 = (void *)MEMORY[0x227676638]();
      v21 = a1;
      HMFGetOSLogHandle();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = 138543362;
        v26 = v23;
        _os_log_impl(&dword_2218F0000, v22, OS_LOG_TYPE_INFO, "%{public}@Camera profile settings is not initialized, skipping controller side checks to disallow snapshot requests", (uint8_t *)&v25, 0xCu);

      }
      objc_autoreleasePoolPop(v20);
    }
    a1 = v7;
LABEL_17:

LABEL_18:
  }

  return a1;
}

- (void)_issueGetSnapshot:(void *)a1
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  __CFString *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(v3, "sessionID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "markMilestoneFor:", CFSTR("ReceivedSnapshotRequest"));

  v5 = (void *)MEMORY[0x227676638]();
  v6 = a1;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "sessionID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "snapshotReason");
    if (v10 == 1)
    {
      v11 = CFSTR("HMDCameraSnapshotReasonEvent");
    }
    else if (v10)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Unknown snapshot reason: %lu"), v10);
      v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = CFSTR("HMDCameraSnapshotReasonPeriodic");
    }
    *(_DWORD *)buf = 138543618;
    v18 = v8;
    v19 = 2112;
    v20 = v11;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Issuing get snapshot request for reason: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  objc_msgSend(v3, "snapshotGetter");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "getSnapshot:", objc_msgSend(v3, "streamingTierType"));

  objc_msgSend(v3, "snapshotCompletionTimer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setDelegate:", v6);

  objc_msgSend(v6, "workQueue");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "snapshotCompletionTimer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setDelegateQueue:", v14);

  objc_msgSend(v3, "snapshotCompletionTimer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "resume");

}

- (void)_sendSnapshotRequestStreamReceiver:(void *)a3 snapshotSessionID:
{
  id v5;
  id v6;
  void *v7;
  id *v8;
  NSObject *v9;
  void *v10;
  id WeakRetained;
  void *v12;
  HMDCameraSnapshotRemoteStreamReceiver *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  HMDCameraSnapshotRemoteStreamReceiver *v19;
  id v20;
  id v21;
  id v22;
  uint64_t v23;
  void *v24;
  void *v25;
  id *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  id *v30;
  NSObject *v31;
  void *v32;
  uint64_t v33;
  id v34;
  uint8_t buf[4];
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (a1)
  {
    v7 = (void *)MEMORY[0x227676638]();
    v8 = a1;
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v36 = v10;
      _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@Creating a snapshot session with HMDCameraSnapshotRemoteStreamReceiver", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v7);
    WeakRetained = objc_loadWeakRetained(v8 + 6);
    if (WeakRetained)
    {
      v34 = v5;
      objc_msgSend(v8[16], "remoteAccessDevice");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        v13 = [HMDCameraSnapshotRemoteStreamReceiver alloc];
        objc_msgSend(v8, "workQueue");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "workQueue");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "uniqueIdentifier");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = v8[16];
        v18 = v8[9];
        v19 = -[HMDCameraSnapshotRemoteStreamReceiver initWithSessionID:workQueue:accessory:delegate:delegateQueue:uniqueIdentifier:snapshotRequestHandler:residentMessageHandler:remoteDevice:](v13, "initWithSessionID:workQueue:accessory:delegate:delegateQueue:uniqueIdentifier:snapshotRequestHandler:residentMessageHandler:remoteDevice:", v6, v14, WeakRetained, v8, v15, v16, v18, v17, v12);

        v20 = v8[17];
        v21 = v8[15];
        v22 = v20;
        v23 = objc_msgSend(v21, "reachabilityPath");
        LOBYTE(v33) = objc_msgSend(v6, "isSnapshotRequestForBulletin");
        v5 = v34;
        objc_msgSend(v22, "createLocalSnapshotSessionWithID:accessory:snapshotGetter:message:waitPeriod:reachabilityPath:cameraLocallyReachable:snapshotForNotification:", v6, WeakRetained, v19, v34, v23, 0, 60.0, v33);
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        objc_storeStrong(v8 + 4, v24);
        -[HMDCameraSnapshotManager _issueGetSnapshot:](v8, v8[4]);
      }
      else
      {
        v29 = (void *)MEMORY[0x227676638]();
        v30 = v8;
        HMFGetOSLogHandle();
        v31 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v36 = v32;
          _os_log_impl(&dword_2218F0000, v31, OS_LOG_TYPE_ERROR, "%{public}@Failed to create snapshot session with HMDCameraSnapshotRemoteStreamReceiver: no remote access device", buf, 0xCu);

        }
        objc_autoreleasePoolPop(v29);
        objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 91);
        v19 = (HMDCameraSnapshotRemoteStreamReceiver *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "respondWithError:", v19);
      }

    }
    else
    {
      v25 = (void *)MEMORY[0x227676638]();
      v26 = v8;
      HMFGetOSLogHandle();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v36 = v28;
        _os_log_impl(&dword_2218F0000, v27, OS_LOG_TYPE_ERROR, "%{public}@Failed to create snapshot session with HMDCameraSnapshotRemoteStreamReceiver: accessory reference is nil", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v25);
      objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 20);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "respondWithError:", v12);
    }

  }
}

- (void)_sendSnapshotRequestRelayReceiver:(void *)a3 snapshotSessionID:
{
  id v5;
  id v6;
  void *v7;
  id *v8;
  NSObject *v9;
  void *v10;
  id WeakRetained;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  id v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void **v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  id *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  id *v38;
  NSObject *v39;
  void *v40;
  uint64_t v41;
  id v42;
  uint8_t buf[4];
  void *v44;
  __int16 v45;
  void *v46;
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (a1)
  {
    v7 = (void *)MEMORY[0x227676638]();
    v8 = a1;
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v44 = v10;
      _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@Creating a snapshot session with HMDCameraSnapshotRemoteRelayReceiver", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v7);
    WeakRetained = objc_loadWeakRetained(v8 + 6);
    if (WeakRetained)
    {
      objc_msgSend(v8[16], "remoteAccessDevice");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        v13 = v8[17];
        objc_msgSend(v8, "workQueue");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "workQueue");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "uniqueIdentifier");
        v42 = WeakRetained;
        v16 = v6;
        v17 = v5;
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = v8[16];
        v20 = v8[9];
        objc_msgSend(v13, "createSnapshotRemoteRelayReceiverWithSessionID:workQueue:accessory:delegate:delegateQueue:uniqueIdentifier:snapshotRequestHandler:residentMessageHandler:remoteDevice:", v16, v14, v42, v8, v15, v18, v20, v19, v12);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        v5 = v17;
        v22 = v8[17];
        v23 = v8[15];
        v24 = v22;
        v6 = v16;
        WeakRetained = v42;
        v25 = v24;
        v26 = objc_msgSend(v23, "reachabilityPath");
        LOBYTE(v41) = objc_msgSend(v6, "isSnapshotRequestForBulletin");
        objc_msgSend(v25, "createLocalSnapshotSessionWithID:accessory:snapshotGetter:message:waitPeriod:reachabilityPath:cameraLocallyReachable:snapshotForNotification:", v6, v42, v21, v5, v26, 0, 60.0, v41);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_storeStrong(v8 + 4, v27);

        v28 = (void *)MEMORY[0x227676638]();
        v29 = v8;
        HMFGetOSLogHandle();
        v30 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = v29[4];
          *(_DWORD *)buf = 138543618;
          v44 = v31;
          v45 = 2112;
          v46 = v32;
          _os_log_impl(&dword_2218F0000, v30, OS_LOG_TYPE_INFO, "%{public}@Creating a snapshot session %@ with HMDCameraSnapshotRemoteRelayReceiver", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v28);
        -[HMDCameraSnapshotManager _issueGetSnapshot:](v29, v29[4]);
      }
      else
      {
        v37 = (void *)MEMORY[0x227676638]();
        v38 = v8;
        HMFGetOSLogHandle();
        v39 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v44 = v40;
          _os_log_impl(&dword_2218F0000, v39, OS_LOG_TYPE_ERROR, "%{public}@Failed to create snapshot session with HMDCameraSnapshotRemoteRelayReceiver: no remote access device", buf, 0xCu);

        }
        objc_autoreleasePoolPop(v37);
        objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 91);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "respondWithError:", v21);
      }

    }
    else
    {
      v33 = (void *)MEMORY[0x227676638]();
      v34 = v8;
      HMFGetOSLogHandle();
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v44 = v36;
        _os_log_impl(&dword_2218F0000, v35, OS_LOG_TYPE_ERROR, "%{public}@Failed to create snapshot session with HMDCameraSnapshotRemoteRelayReceiver: accessory reference is nil", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v33);
      objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 20);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "respondWithError:", v12);
    }

  }
}

void __56__HMDCameraSnapshotManager_handleAccessoryUnconfigured___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 4);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  -[HMDCameraSnapshotManager _removeAllPendingRequests:](v1, v2);

}

void __62__HMDCameraSnapshotManager_releaseSnapshotWithSlotIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 32);
  v5 = *MEMORY[0x24BDD6DC0];
  v6[0] = v2;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE3F1B0], "messageWithName:messagePayload:responseHandler:", *MEMORY[0x24BDD5618], v3, &__block_literal_global_44_143659);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "_handleReleaseSnapshotMessage:", v4);

}

uint64_t __41__HMDCameraSnapshotManager_takeSnapshot___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleTakeSnapshotMessage:", *(_QWORD *)(a1 + 40));
}

+ (void)cleanStaleSnapshotDirectoriesUsingCurrentAccessories:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  id v19;
  void *v20;
  id v21;
  NSObject *v22;
  NSObject *v23;
  void *v24;
  NSObject *v25;
  os_log_type_t v26;
  const char *v27;
  uint32_t v28;
  id v29;
  id obj;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  id v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = (void *)MEMORY[0x24BDBCF20];
  v29 = v3;
  objc_msgSend(v3, "na_map:", &__block_literal_global_143699);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWithArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  getImagesPath();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "contentsOfDirectoryAtPath:error:", v8, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  obj = v9;
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v43, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v34;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v34 != v12)
          objc_enumerationMutation(obj);
        v14 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * i);
        if ((objc_msgSend(v6, "containsObject:", v14) & 1) == 0)
        {
          getImagesPath();
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "stringByAppendingPathComponent:", v14);
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = 0;
          v18 = objc_msgSend(v17, "removeItemAtPath:error:", v16, &v32);
          v19 = v32;

          v20 = (void *)MEMORY[0x227676638]();
          v21 = a1;
          HMFGetOSLogHandle();
          v22 = objc_claimAutoreleasedReturnValue();
          v23 = v22;
          if (v18)
          {
            if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v38 = v24;
              v39 = 2112;
              v40 = v16;
              v25 = v23;
              v26 = OS_LOG_TYPE_INFO;
              v27 = "%{public}@Removed snapshot directory at path: %@";
              v28 = 22;
              goto LABEL_12;
            }
          }
          else if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v38 = v24;
            v39 = 2112;
            v40 = v16;
            v41 = 2112;
            v42 = v19;
            v25 = v23;
            v26 = OS_LOG_TYPE_ERROR;
            v27 = "%{public}@Failed to remove snapshot directory at path %@: %@";
            v28 = 32;
LABEL_12:
            _os_log_impl(&dword_2218F0000, v25, v26, v27, buf, v28);

          }
          objc_autoreleasePoolPop(v20);

          continue;
        }
      }
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v43, 16);
    }
    while (v11);
  }

}

+ (BOOL)hasMessageReceiverChildren
{
  return 1;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t74 != -1)
    dispatch_once(&logCategory__hmf_once_t74, &__block_literal_global_108_143695);
  return (id)logCategory__hmf_once_v75;
}

void __39__HMDCameraSnapshotManager_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v75;
  logCategory__hmf_once_v75 = v0;

}

id __81__HMDCameraSnapshotManager_cleanStaleSnapshotDirectoriesUsingCurrentAccessories___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "uuid");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
