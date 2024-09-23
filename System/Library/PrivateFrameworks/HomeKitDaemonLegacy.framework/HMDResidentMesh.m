@implementation HMDResidentMesh

- (HMDResidentMesh)initWithHomeManager:(id)a3 residentEnabled:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  HMDResidentMesh *v7;
  uint64_t v8;
  NSMutableArray *residents;
  uint64_t v10;
  NSMutableArray *reachableAccessories;
  uint64_t v12;
  NSMutableDictionary *loadMetrics;
  uint64_t v14;
  NSUUID *uuid;
  uint64_t v16;
  NSSet *primaryResidentForHomes;
  id v18;
  const char *v19;
  NSObject *v20;
  dispatch_queue_t v21;
  OS_dispatch_queue *workQueue;
  void *v23;
  NSObject *v24;
  HMDResidentMesh *v25;
  uint64_t v26;
  HMFTimer *devicesChangedTimer;
  uint64_t v28;
  HMFTimer *startupTimer;
  uint64_t v30;
  HMFTimer *linkQualityMonitorTimer;
  void *v32;
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
  void *v45;
  void *v46;
  void *v47;
  _QWORD block[4];
  HMDResidentMesh *v50;
  BOOL v51;
  objc_super v52;
  void *v53;
  _QWORD v54[2];

  v4 = a4;
  v54[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v52.receiver = self;
  v52.super_class = (Class)HMDResidentMesh;
  v7 = -[HMDResidentMesh init](&v52, sel_init);
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v8 = objc_claimAutoreleasedReturnValue();
    residents = v7->_residents;
    v7->_residents = (NSMutableArray *)v8;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v10 = objc_claimAutoreleasedReturnValue();
    reachableAccessories = v7->_reachableAccessories;
    v7->_reachableAccessories = (NSMutableArray *)v10;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v12 = objc_claimAutoreleasedReturnValue();
    loadMetrics = v7->_loadMetrics;
    v7->_loadMetrics = (NSMutableDictionary *)v12;

    objc_storeWeak((id *)&v7->_homeManager, v6);
    v14 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", CFSTR("82455554-35AB-4772-B3A4-DCA0F933F5D3"));
    uuid = v7->_uuid;
    v7->_uuid = (NSUUID *)v14;

    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v16 = objc_claimAutoreleasedReturnValue();
    primaryResidentForHomes = v7->_primaryResidentForHomes;
    v7->_primaryResidentForHomes = (NSSet *)v16;

    HMDispatchQueueNameString();
    v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v19 = (const char *)objc_msgSend(v18, "UTF8String");
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = dispatch_queue_create(v19, v20);
    workQueue = v7->_workQueue;
    v7->_workQueue = (OS_dispatch_queue *)v21;

    objc_storeWeak((id *)&v7->_resident, 0);
    objc_msgSend(v6, "messageDispatcher");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)&v7->_messageDispatcher, v23);
    v24 = v7->_workQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __55__HMDResidentMesh_initWithHomeManager_residentEnabled___block_invoke;
    block[3] = &unk_1E89C2758;
    v25 = v7;
    v50 = v25;
    v51 = v4;
    dispatch_sync(v24, block);
    v26 = objc_msgSend(objc_alloc(MEMORY[0x1E0D286C8]), "initWithTimeInterval:options:", 1, 2.0);
    devicesChangedTimer = v25->_devicesChangedTimer;
    v25->_devicesChangedTimer = (HMFTimer *)v26;

    -[HMFTimer setDelegate:](v25->_devicesChangedTimer, "setDelegate:", v25);
    -[HMFTimer setDelegateQueue:](v25->_devicesChangedTimer, "setDelegateQueue:", v7->_workQueue);
    if (v4)
    {
      v25->_startupTickCount = 0;
      v28 = objc_msgSend(objc_alloc(MEMORY[0x1E0D286C8]), "initWithTimeInterval:options:", 1, 30.0);
      startupTimer = v25->_startupTimer;
      v25->_startupTimer = (HMFTimer *)v28;

      -[HMFTimer setDelegate:](v25->_startupTimer, "setDelegate:", v25);
      -[HMFTimer setDelegateQueue:](v25->_startupTimer, "setDelegateQueue:", v7->_workQueue);
      -[HMFTimer fire](v25->_startupTimer, "fire");
    }
    v30 = objc_msgSend(objc_alloc(MEMORY[0x1E0D286C8]), "initWithTimeInterval:options:", 4, 600.0);
    linkQualityMonitorTimer = v25->_linkQualityMonitorTimer;
    v25->_linkQualityMonitorTimer = (HMFTimer *)v30;

    -[HMFTimer setDelegate:](v25->_linkQualityMonitorTimer, "setDelegate:", v25);
    -[HMFTimer setDelegateQueue:](v25->_linkQualityMonitorTimer, "setDelegateQueue:", v7->_workQueue);
    -[HMFTimer resume](v25->_linkQualityMonitorTimer, "resume");
    -[HMFTimer fire](v25->_linkQualityMonitorTimer, "fire");
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "addObserver:selector:name:object:", v25, sel___accessoryIsReachable_, CFSTR("HMDAccessoryIsReachableNotification"), 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "addObserver:selector:name:object:", v25, sel___accessoryIsNotReachable_, CFSTR("HMDAccessoryIsNotReachableNotification"), 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "addObserver:selector:name:object:", v25, sel___accessoryDidUpdateSuspendedState_, CFSTR("HMDHAPAccessoryUpdatedSuspendedState"), 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "addObserver:selector:name:object:", v25, sel___residentDeviceAddedOrUpdatedNotification_, CFSTR("HMDResidentDeviceManagerAddResidentNotification"), 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "addObserver:selector:name:object:", v25, sel___residentDeviceAddedOrUpdatedNotification_, CFSTR("HMDResidentDeviceManagerUpdateResidentNotification"), 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "addObserver:selector:name:object:", v25, sel___residentDeviceRemovedNotification_, CFSTR("HMDResidentDeviceManagerRemoveResidentNotification"), 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "addObserver:selector:name:object:", v25, sel___rebuildResidents_, CFSTR("HMDAccountAddedDeviceNotification"), 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "addObserver:selector:name:object:", v25, sel___rebuildResidents_, CFSTR("HMDDeviceUpdatedNotification"), 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "addObserver:selector:name:object:", v25, sel___rebuildResidents_, CFSTR("HMDAccountRemovedDeviceNotification"), 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "addObserver:selector:name:object:", v25, sel___deviceResidentChanged_, CFSTR("HMDHomeManagerResidentEnabledChangedNotification"), 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "addObserver:selector:name:object:", v25, sel___deviceIsNotReachable_, CFSTR("HMDRemoteDeviceIsNotReachableNotification"), 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "addObserver:selector:name:object:", v25, sel___deviceIsReachable_, CFSTR("HMDRemoteDeviceIsReachableNotification"), 0);

    +[HMDRemoteMessagePolicy defaultPolicy](HMDMutableRemoteMessagePolicy, "defaultPolicy");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "setRequiresAccountMessage:", 1);
    objc_msgSend(v44, "setRequiresSecureMessage:", 1);
    objc_msgSend(v44, "setTransportRestriction:", -1);
    v45 = (void *)objc_msgSend(v44, "copy");
    v54[0] = v45;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v54, 1);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "registerForMessage:receiver:policies:selector:", CFSTR("kDeviceMeshUpdateRequestKey"), v25, v46, sel__handleMeshUpdateRequestMessage_);

    v53 = v45;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v53, 1);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "registerForMessage:receiver:policies:selector:", CFSTR("kDeviceMeshUpdateKey"), v25, v47, sel__handleMeshUpdateMessage_);

  }
  return v7;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  -[HMDResidentMesh messageDispatcher](self, "messageDispatcher");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "deregisterReceiver:", self);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:", self);

  v5.receiver = self;
  v5.super_class = (Class)HMDResidentMesh;
  -[HMDResidentMesh dealloc](&v5, sel_dealloc);
}

- (void)__accessoryIsReachable:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  HMDResidentMesh *v9;

  v4 = a3;
  -[HMDResidentMesh workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __42__HMDResidentMesh___accessoryIsReachable___block_invoke;
  v7[3] = &unk_1E89C2328;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)__accessoryIsNotReachable:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  HMDResidentMesh *v9;

  v4 = a3;
  -[HMDResidentMesh workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __45__HMDResidentMesh___accessoryIsNotReachable___block_invoke;
  v7[3] = &unk_1E89C2328;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)__accessoryDidUpdateSuspendedState:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  HMDResidentMesh *v9;

  v4 = a3;
  -[HMDResidentMesh workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __54__HMDResidentMesh___accessoryDidUpdateSuspendedState___block_invoke;
  v7[3] = &unk_1E89C2328;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)__deviceIsReachable:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  HMDResidentMesh *v9;

  v4 = a3;
  -[HMDResidentMesh workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __39__HMDResidentMesh___deviceIsReachable___block_invoke;
  v7[3] = &unk_1E89C2328;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)__deviceIsNotReachable:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  HMDResidentMesh *v9;

  v4 = a3;
  -[HMDResidentMesh workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __42__HMDResidentMesh___deviceIsNotReachable___block_invoke;
  v7[3] = &unk_1E89C2328;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)__residentDeviceRemovedNotification:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  HMDResidentMesh *v9;

  v4 = a3;
  -[HMDResidentMesh workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __55__HMDResidentMesh___residentDeviceRemovedNotification___block_invoke;
  v7[3] = &unk_1E89C2328;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)__residentDeviceAddedOrUpdatedNotification:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  HMDResidentMesh *v9;

  v4 = a3;
  -[HMDResidentMesh workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __62__HMDResidentMesh___residentDeviceAddedOrUpdatedNotification___block_invoke;
  v7[3] = &unk_1E89C2328;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)__rebuildResidents:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  HMDResidentMesh *v9;

  v4 = a3;
  -[HMDResidentMesh workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __38__HMDResidentMesh___rebuildResidents___block_invoke;
  v7[3] = &unk_1E89C2328;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)__deviceResidentChanged:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  HMDResidentMesh *v9;

  v4 = a3;
  -[HMDResidentMesh workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __43__HMDResidentMesh___deviceResidentChanged___block_invoke;
  v7[3] = &unk_1E89C2328;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)timerDidFire:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  id v7;
  id v8;
  unint64_t v9;
  void *v10;
  HMDResidentMesh *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t v26[128];
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  uint64_t v30;
  __int16 v31;
  uint64_t v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDResidentMesh workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[HMDResidentMesh devicesChangedTimer](self, "devicesChangedTimer");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6 == v4)
  {
    -[HMDResidentMesh _buildResidentsWithElection:device:](self, "_buildResidentsWithElection:device:", CFSTR("HMDResidentDeviceManagerAddResidentNotification"), 0);
  }
  else
  {
    -[HMDResidentMesh startupTimer](self, "startupTimer");
    v7 = (id)objc_claimAutoreleasedReturnValue();

    if (v7 == v4)
    {
      if (-[HMDResidentMesh _checkReachabilityWithTimerActivation:](self, "_checkReachabilityWithTimerActivation:", 0)&& (v9 = -[HMDResidentMesh startupTickCount](self, "startupTickCount"), -[HMDResidentMesh setStartupTickCount:](self, "setStartupTickCount:", v9 + 1), v9 < 4))
      {
        objc_msgSend(v4, "resume");
      }
      else
      {
        v10 = (void *)MEMORY[0x1D17BA0A0]();
        v11 = self;
        HMFGetOSLogHandle();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v28 = v13;
          v29 = 2048;
          v30 = -[HMDResidentMesh startupTickCount](v11, "startupTickCount");
          v31 = 2048;
          v32 = 4;
          _os_log_impl(&dword_1CD062000, v12, OS_LOG_TYPE_INFO, "%{public}@Can connect with all accessories (or we've timed out if %lu > %lu), broadcasting out.", buf, 0x20u);

        }
        objc_autoreleasePoolPop(v10);
        v24 = 0u;
        v25 = 0u;
        v22 = 0u;
        v23 = 0u;
        -[HMDResidentMesh reachableAccessories](v11, "reachableAccessories", 0);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
        if (v15)
        {
          v16 = v15;
          v17 = *(_QWORD *)v23;
          do
          {
            for (i = 0; i != v16; ++i)
            {
              if (*(_QWORD *)v23 != v17)
                objc_enumerationMutation(v14);
              v19 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
              objc_msgSend(v19, "accessoryUUIDs");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              v21 = objc_msgSend(v20, "count");

              if (v21)
                objc_msgSend(v19, "_transmitStatus:", 1);
            }
            v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
          }
          while (v16);
        }

      }
    }
    else
    {
      -[HMDResidentMesh linkQualityMonitorTimer](self, "linkQualityMonitorTimer");
      v8 = (id)objc_claimAutoreleasedReturnValue();

      if (v8 == v4)
        -[HMDResidentMesh _updateAccessoryLinkQuality](self, "_updateAccessoryLinkQuality");
    }
  }

}

- (void)_updateAccessoryLinkQuality
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  int v25;
  uint64_t v26;
  uint64_t v27;
  id obj;
  uint64_t v29;
  void *v30;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  -[HMDResidentMesh homeManager](self, "homeManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "homes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v4;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v37;
    v26 = *(_QWORD *)v37;
    do
    {
      v8 = 0;
      v27 = v6;
      do
      {
        if (*(_QWORD *)v37 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * v8);
        if (objc_msgSend(v9, "isCurrentDeviceAvailableResident", v26))
        {
          objc_msgSend(v9, "primaryResident");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          if (v30)
          {
            v29 = v8;
            v34 = 0u;
            v35 = 0u;
            v32 = 0u;
            v33 = 0u;
            objc_msgSend(v9, "accessories");
            v31 = (id)objc_claimAutoreleasedReturnValue();
            v10 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
            if (v10)
            {
              v11 = v10;
              v12 = *(_QWORD *)v33;
              do
              {
                for (i = 0; i != v11; ++i)
                {
                  if (*(_QWORD *)v33 != v12)
                    objc_enumerationMutation(v31);
                  v14 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
                  -[HMDResidentMesh resident](self, "resident");
                  v15 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v15, "accessoryListWithLinkQuality");
                  v16 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v16, "allKeys");
                  v17 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v14, "identifier");
                  v18 = (void *)objc_claimAutoreleasedReturnValue();
                  v19 = objc_msgSend(v17, "containsObject:", v18);

                  if (v19)
                  {
                    -[HMDResidentMesh _addResidentStorageResidentDevice:](self, "_addResidentStorageResidentDevice:", v30);
                    v20 = (void *)objc_claimAutoreleasedReturnValue();
                    v21 = v14;
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) != 0)
                      v22 = v21;
                    else
                      v22 = 0;
                    v23 = v22;

                    if (objc_msgSend(v23, "hasBTLELink"))
                    {
                      objc_msgSend(v20, "accessoryListWithLinkQuality");
                      v24 = (void *)objc_claimAutoreleasedReturnValue();
                      v25 = objc_msgSend(v20, "_addAccessoryWithLinkQuality:toList:", v23, v24);

                      if (v25)
                        objc_msgSend(v20, "_transmitAfter:", 10.0);
                    }

                  }
                }
                v11 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
              }
              while (v11);
            }

            v7 = v26;
            v6 = v27;
            v8 = v29;
          }

        }
        ++v8;
      }
      while (v8 != v6);
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
    }
    while (v6);
  }

}

- (void)_handleAddUpdateOrReachabilityChangeForDevice:(id)a3
{
  id v3;

  -[HMDResidentMesh devicesChangedTimer](self, "devicesChangedTimer", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "resume");

}

- (void)_deviceIsNotReachable:(id)a3
{
  id v4;
  void *v5;
  HMDResidentMesh *v6;
  NSObject *v7;
  void *v8;
  dispatch_time_t v9;
  NSObject *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  HMDResidentMesh *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t j;
  void *v33;
  void *v34;
  void *v35;
  int v36;
  void *v37;
  HMDResidentMesh *v38;
  NSObject *v39;
  void *v40;
  void *v41;
  void *v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _QWORD block[5];
  uint8_t v52[128];
  uint8_t buf[4];
  void *v54;
  __int16 v55;
  void *v56;
  _BYTE v57[128];
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "isCurrentDevice"))
  {
    v5 = (void *)MEMORY[0x1D17BA0A0]();
    v6 = self;
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v54 = v8;
      _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_INFO, "%{public}@Our device lost visibility to the rest of the world. Setting timeout before pulling the plug.", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v5);
    v9 = dispatch_time(0, 10000000000);
    -[HMDResidentMesh workQueue](v6, "workQueue");
    v10 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __41__HMDResidentMesh__deviceIsNotReachable___block_invoke;
    block[3] = &unk_1E89C2730;
    block[4] = v6;
    dispatch_after(v9, v10, block);

  }
  else
  {
    v49 = 0u;
    v50 = 0u;
    v47 = 0u;
    v48 = 0u;
    -[HMDResidentMesh reachableAccessories](self, "reachableAccessories");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v11, "copy");

    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v47, v57, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v48;
      while (2)
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v48 != v15)
            objc_enumerationMutation(v12);
          v17 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * i);
          objc_msgSend(v17, "residentDevice");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "device");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v4, "isEqual:", v19);

          if (v20)
          {
            v21 = (void *)MEMORY[0x1D17BA0A0]();
            v22 = self;
            HMFGetOSLogHandle();
            v23 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v4, "shortDescription");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v54 = v24;
              v55 = 2114;
              v56 = v25;
              _os_log_impl(&dword_1CD062000, v23, OS_LOG_TYPE_INFO, "%{public}@Removed device %{public}@ from resident storage", buf, 0x16u);

            }
            objc_autoreleasePoolPop(v21);
            -[HMDResidentMesh reachableAccessories](v22, "reachableAccessories");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "removeObject:", v17);

            goto LABEL_17;
          }
        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v47, v57, 16);
        if (v14)
          continue;
        break;
      }
    }
LABEL_17:

    v45 = 0u;
    v46 = 0u;
    v43 = 0u;
    v44 = 0u;
    -[HMDResidentMesh residents](self, "residents", 0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = (void *)objc_msgSend(v27, "copy");

    v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v43, v52, 16);
    if (v29)
    {
      v30 = v29;
      v31 = *(_QWORD *)v44;
      while (2)
      {
        for (j = 0; j != v30; ++j)
        {
          if (*(_QWORD *)v44 != v31)
            objc_enumerationMutation(v28);
          v33 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * j);
          objc_msgSend(v33, "residentDevice");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "device");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v36 = objc_msgSend(v4, "isEqual:", v35);

          if (v36)
          {
            v37 = (void *)MEMORY[0x1D17BA0A0]();
            v38 = self;
            HMFGetOSLogHandle();
            v39 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v4, "shortDescription");
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v54 = v40;
              v55 = 2114;
              v56 = v41;
              _os_log_impl(&dword_1CD062000, v39, OS_LOG_TYPE_INFO, "%{public}@Removed device %{public}@ from mesh storage", buf, 0x16u);

            }
            objc_autoreleasePoolPop(v37);
            -[HMDResidentMesh residents](v38, "residents");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v42, "removeObject:", v33);

            goto LABEL_29;
          }
        }
        v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v43, v52, 16);
        if (v30)
          continue;
        break;
      }
    }
LABEL_29:

  }
}

- (void)_buildResidentsWithElection:(id)a3 device:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  HMDResidentMesh *v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  int v32;
  uint64_t v33;
  void *v34;
  HMDResidentMesh *v35;
  NSObject *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  void *v43;
  char v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t i;
  void *v52;
  void *v53;
  char v54;
  void *v55;
  int v56;
  void *v57;
  void *v58;
  int v59;
  void *v60;
  HMDResidentMesh *v61;
  NSObject *v62;
  void *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  void *v69;
  HMDResidentMesh *v70;
  NSObject *v71;
  void *v72;
  HMDResidentMesh *v73;
  void *v74;
  void *v75;
  int v76;
  const char *v77;
  void *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t j;
  void *v83;
  void *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t k;
  void *v89;
  void *v90;
  HMDResidentMesh *v91;
  NSObject *v92;
  void *v93;
  void *v94;
  id v95;
  void *v96;
  void *v97;
  id v98;
  void *v99;
  id v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  uint64_t v105;
  uint64_t obj;
  id obja;
  id v108;
  HMDResidentMesh *v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  _QWORD v130[5];
  id v131;
  id v132;
  id v133;
  id v134;
  _QWORD v135[4];
  id v136;
  id v137;
  HMDResidentMesh *v138;
  _QWORD v139[4];
  id v140;
  HMDResidentMesh *v141;
  _QWORD v142[4];
  id v143;
  id v144;
  _BYTE v145[128];
  uint8_t v146[128];
  uint8_t buf[4];
  void *v148;
  __int16 v149;
  void *v150;
  __int16 v151;
  const char *v152;
  _BYTE v153[128];
  _BYTE v154[128];
  _BYTE v155[128];
  uint64_t v156;

  v156 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[HMDResidentMesh workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDResidentMesh homeManager](self, "homeManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "homes");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = MEMORY[0x1E0C809B0];
  v142[0] = MEMORY[0x1E0C809B0];
  v142[1] = 3221225472;
  v142[2] = __54__HMDResidentMesh__buildResidentsWithElection_device___block_invoke;
  v142[3] = &unk_1E89B2920;
  v14 = v9;
  v143 = v14;
  v15 = v10;
  v144 = v15;
  objc_msgSend(v12, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v142);
  v139[0] = v13;
  v139[1] = 3221225472;
  v139[2] = __54__HMDResidentMesh__buildResidentsWithElection_device___block_invoke_2;
  v139[3] = &unk_1E89B2920;
  v16 = v14;
  v140 = v16;
  v141 = self;
  v99 = v12;
  v17 = v12;
  v18 = self;
  objc_msgSend(v17, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v139);
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v135[0] = v13;
  v135[1] = 3221225472;
  v135[2] = __54__HMDResidentMesh__buildResidentsWithElection_device___block_invoke_211;
  v135[3] = &unk_1E89B2988;
  v98 = v15;
  v136 = v98;
  v20 = v19;
  v137 = v20;
  v138 = self;
  objc_msgSend(v16, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v135);
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v130[0] = v13;
  v130[1] = 3221225472;
  v130[2] = __54__HMDResidentMesh__buildResidentsWithElection_device___block_invoke_216;
  v130[3] = &unk_1E89B29B0;
  v130[4] = self;
  v100 = v6;
  v131 = v100;
  v95 = v7;
  v132 = v95;
  v108 = v16;
  v133 = v108;
  v22 = v21;
  v134 = v22;
  v97 = v20;
  objc_msgSend(v20, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v130);
  -[HMDResidentMesh resident](v18, "resident");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v126 = 0u;
  v127 = 0u;
  v128 = 0u;
  v129 = 0u;
  -[HMDResidentMesh residents](v18, "residents");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (void *)objc_msgSend(v24, "copy");

  v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v126, v155, 16);
  v109 = v18;
  v101 = v22;
  if (v26)
  {
    v27 = v26;
    v28 = *(_QWORD *)v127;
    v104 = v25;
    do
    {
      v29 = 0;
      obj = v27;
      do
      {
        if (*(_QWORD *)v127 != v28)
          objc_enumerationMutation(v25);
        v30 = *(void **)(*((_QWORD *)&v126 + 1) + 8 * v29);
        objc_msgSend(v30, "residentDevice", v95);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = objc_msgSend(v31, "isCurrentDevice");

        if (v32)
        {
          if ((objc_msgSend(v30, "isEqual:", v23) & 1) == 0)
          {
            v33 = v28;
            v34 = (void *)MEMORY[0x1D17BA0A0]();
            v35 = v18;
            HMFGetOSLogHandle();
            v36 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              v102 = v23;
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v30, "residentDevice");
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v38, "device");
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v39, "shortDescription");
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v148 = v37;
              v149 = 2114;
              v150 = v40;
              _os_log_impl(&dword_1CD062000, v36, OS_LOG_TYPE_INFO, "%{public}@Setting resident device to %{public}@", buf, 0x16u);

              v22 = v101;
              v18 = v109;

              v25 = v104;
              v23 = v102;
            }

            objc_autoreleasePoolPop(v34);
            v28 = v33;
            v27 = obj;
          }
          v41 = v30;

          -[HMDResidentMesh loadMetrics](v18, "loadMetrics");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "setMetrics:", v42);

          -[HMDResidentMesh setResident:](v18, "setResident:", v41);
          v23 = v41;
        }
        objc_msgSend(v30, "residentDevice");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v44 = objc_msgSend(v22, "containsObject:", v43);

        if ((v44 & 1) == 0)
        {
          -[HMDResidentMesh residents](v18, "residents");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v45, "removeObject:", v30);

        }
        ++v29;
      }
      while (v27 != v29);
      v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v126, v155, 16);
    }
    while (v27);
  }
  v103 = v23;

  v124 = 0u;
  v125 = 0u;
  v122 = 0u;
  v123 = 0u;
  -[HMDResidentMesh reachableAccessories](v18, "reachableAccessories");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = (void *)objc_msgSend(v46, "copy");

  v48 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v122, v154, 16);
  if (v48)
  {
    v49 = v48;
    v50 = *(_QWORD *)v123;
    do
    {
      for (i = 0; i != v49; ++i)
      {
        if (*(_QWORD *)v123 != v50)
          objc_enumerationMutation(v47);
        v52 = *(void **)(*((_QWORD *)&v122 + 1) + 8 * i);
        objc_msgSend(v52, "residentDevice", v95);
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        v54 = objc_msgSend(v22, "containsObject:", v53);

        if ((v54 & 1) == 0)
        {
          -[HMDResidentMesh reachableAccessories](v18, "reachableAccessories");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v55, "removeObject:", v52);

        }
      }
      v49 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v122, v154, 16);
    }
    while (v49);
  }

  if ((objc_msgSend(v100, "isEqual:", CFSTR("HMDResidentDeviceManagerAddResidentNotification")) & 1) != 0)
    v56 = 1;
  else
    v56 = objc_msgSend(v100, "isEqual:", CFSTR("HMDResidentDeviceManagerUpdateResidentNotification"));
  v57 = v108;
  -[HMDResidentMesh primaryResidentForHomes](v18, "primaryResidentForHomes", v95);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = objc_msgSend(v108, "isSubsetOfSet:", v58);

  if (!v59 || v56)
  {
    v60 = (void *)MEMORY[0x1D17BA0A0]();
    v61 = v18;
    HMFGetOSLogHandle();
    v62 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v62, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v148 = v63;
      _os_log_impl(&dword_1CD062000, v62, OS_LOG_TYPE_INFO, "%{public}@Our primary residents list has new items (or some shift in devices happened):", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v60);
    v120 = 0u;
    v121 = 0u;
    v118 = 0u;
    v119 = 0u;
    obja = v108;
    v64 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v118, v153, 16);
    if (v64)
    {
      v65 = v64;
      v66 = *(_QWORD *)v119;
      do
      {
        v67 = 0;
        v105 = v65;
        do
        {
          if (*(_QWORD *)v119 != v66)
            objc_enumerationMutation(obja);
          v68 = *(void **)(*((_QWORD *)&v118 + 1) + 8 * v67);
          v69 = (void *)MEMORY[0x1D17BA0A0]();
          v70 = v61;
          HMFGetOSLogHandle();
          v71 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v71, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v72 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v68, "UUIDString");
            v73 = v61;
            v74 = (void *)objc_claimAutoreleasedReturnValue();
            -[HMDResidentMesh primaryResidentForHomes](v70, "primaryResidentForHomes");
            v75 = (void *)objc_claimAutoreleasedReturnValue();
            v76 = objc_msgSend(v75, "containsObject:", v68);
            *(_DWORD *)buf = 138543874;
            v77 = " (added)";
            if (v76)
              v77 = "";
            v148 = v72;
            v149 = 2114;
            v150 = v74;
            v151 = 2080;
            v152 = v77;
            _os_log_impl(&dword_1CD062000, v71, OS_LOG_TYPE_INFO, "%{public}@  Home: %{public}@%s", buf, 0x20u);

            v61 = v73;
            v65 = v105;

            v18 = v109;
          }

          objc_autoreleasePoolPop(v69);
          ++v67;
        }
        while (v65 != v67);
        v65 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v118, v153, 16);
      }
      while (v65);
    }

    -[HMDResidentMesh _checkReachabilityWithTimerActivation:](v61, "_checkReachabilityWithTimerActivation:", 1);
    v114 = 0u;
    v115 = 0u;
    v116 = 0u;
    v117 = 0u;
    -[HMDResidentMesh residents](v61, "residents");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    v79 = objc_msgSend(v78, "countByEnumeratingWithState:objects:count:", &v114, v146, 16);
    if (v79)
    {
      v80 = v79;
      v81 = *(_QWORD *)v115;
      do
      {
        for (j = 0; j != v80; ++j)
        {
          if (*(_QWORD *)v115 != v81)
            objc_enumerationMutation(v78);
          v83 = *(void **)(*((_QWORD *)&v114 + 1) + 8 * j);
          if (v103 != v83 && objc_msgSend(*(id *)(*((_QWORD *)&v114 + 1) + 8 * j), "enabled"))
            objc_msgSend(v83, "_requestStatus");
        }
        v80 = objc_msgSend(v78, "countByEnumeratingWithState:objects:count:", &v114, v146, 16);
      }
      while (v80);
    }

    v57 = v108;
  }
  v112 = 0u;
  v113 = 0u;
  v110 = 0u;
  v111 = 0u;
  -[HMDResidentMesh primaryResidentForHomes](v18, "primaryResidentForHomes");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  v85 = objc_msgSend(v84, "countByEnumeratingWithState:objects:count:", &v110, v145, 16);
  if (v85)
  {
    v86 = v85;
    v87 = *(_QWORD *)v111;
    do
    {
      for (k = 0; k != v86; ++k)
      {
        if (*(_QWORD *)v111 != v87)
          objc_enumerationMutation(v84);
        v89 = *(void **)(*((_QWORD *)&v110 + 1) + 8 * k);
        if ((objc_msgSend(v57, "containsObject:", v89) & 1) == 0)
        {
          v90 = (void *)MEMORY[0x1D17BA0A0]();
          v91 = v18;
          HMFGetOSLogHandle();
          v92 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v92, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v93 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v89, "UUIDString");
            v94 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v148 = v93;
            v149 = 2114;
            v150 = v94;
            _os_log_impl(&dword_1CD062000, v92, OS_LOG_TYPE_INFO, "%{public}@  Home: %{public}@ (removed)", buf, 0x16u);

            v18 = v109;
          }

          objc_autoreleasePoolPop(v90);
          v57 = v108;
        }
      }
      v86 = objc_msgSend(v84, "countByEnumeratingWithState:objects:count:", &v110, v145, 16);
    }
    while (v86);
  }

  -[HMDResidentMesh setPrimaryResidentForHomes:](v18, "setPrimaryResidentForHomes:", v57);
}

- (id)_meshStorageForResidentDevice:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  char v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[HMDResidentMesh residents](self, "residents", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "residentDevice");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqual:", v4);

        if ((v11 & 1) != 0)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)_meshStorageForDeviceIdentifier:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[HMDResidentMesh residents](self, "residents", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "residentDevice");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "device");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "identifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "isEqual:", v4);

        if ((v13 & 1) != 0)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)_addMeshStorageResidentDevice:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  HMDResidentMeshMeshStorage *v7;
  void *v8;
  HMDResidentMesh *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v16;
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDResidentMesh _meshStorageForResidentDevice:](self, "_meshStorageForResidentDevice:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
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
      objc_msgSend(v4, "device");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "shortDescription");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138543618;
      v17 = v11;
      v18 = 2114;
      v19 = v13;
      _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_INFO, "%{public}@Adding resident device to mesh: %{public}@", (uint8_t *)&v16, 0x16u);

    }
    objc_autoreleasePoolPop(v8);
    v7 = -[HMDResidentMeshMeshStorage initWithResidentDevice:owner:]([HMDResidentMeshMeshStorage alloc], "initWithResidentDevice:owner:", v4, v9);
    -[HMDResidentMesh residents](v9, "residents");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObject:", v7);

  }
  return v7;
}

- (id)_residentStorageForResidentDevice:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  char v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[HMDResidentMesh reachableAccessories](self, "reachableAccessories", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "residentDevice");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqual:", v4);

        if ((v11 & 1) != 0)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)_addResidentStorageResidentDevice:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  HMDResidentMeshResidentStorage *v7;
  void *v8;
  HMDResidentMesh *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v16;
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDResidentMesh _residentStorageForResidentDevice:](self, "_residentStorageForResidentDevice:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
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
      objc_msgSend(v4, "device");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "shortDescription");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138543618;
      v17 = v11;
      v18 = 2114;
      v19 = v13;
      _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_INFO, "%{public}@Adding resident device to residents list: %{public}@", (uint8_t *)&v16, 0x16u);

    }
    objc_autoreleasePoolPop(v8);
    v7 = -[HMDResidentMeshResidentStorage initWithResidentDevice:owner:]([HMDResidentMeshResidentStorage alloc], "initWithResidentDevice:owner:", v4, v9);
    -[HMDResidentMesh reachableAccessories](v9, "reachableAccessories");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObject:", v7);

  }
  return v7;
}

- (BOOL)_checkReachabilityWithTimerActivation:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  HMDResidentMesh *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  void *v11;
  void *v12;
  char v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  id v21;
  void *v22;
  id v23;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint8_t v37[128];
  uint8_t buf[4];
  uint64_t v39;
  __int16 v40;
  const char *v41;
  uint64_t v42;

  v3 = a3;
  v42 = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1D17BA0A0](self, a2);
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v8;
    v10 = "NO";
    if (v3)
      v10 = "YES";
    *(_DWORD *)buf = 138543618;
    v39 = v8;
    v40 = 2080;
    v41 = v10;
    _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_INFO, "%{public}@Beginning full reachability check (timerActivation=%s)", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  -[HMDResidentMesh homeManager](v6, "homeManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "homes");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
  v13 = 0;
  if (v26)
  {
    v25 = *(_QWORD *)v33;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v33 != v25)
          objc_enumerationMutation(v12);
        v27 = v14;
        v15 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * v14);
        v28 = 0u;
        v29 = 0u;
        v30 = 0u;
        v31 = 0u;
        objc_msgSend(v15, "accessories");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
        if (v17)
        {
          v18 = v17;
          v19 = *(_QWORD *)v29;
          do
          {
            for (i = 0; i != v18; ++i)
            {
              if (*(_QWORD *)v29 != v19)
                objc_enumerationMutation(v16);
              v21 = *(id *)(*((_QWORD *)&v28 + 1) + 8 * i);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
                v22 = v21;
              else
                v22 = 0;
              v23 = v22;

              if (v23)
              {
                if (objc_msgSend(v21, "isReachable"))
                {
                  -[HMDResidentMesh _addConnectivityFromDeviceToAccessory:activateTimer:](v6, "_addConnectivityFromDeviceToAccessory:activateTimer:", v21, v3);
                }
                else
                {
                  -[HMDResidentMesh _removeConnectivityFromDeviceToAccessory:activateTimer:](v6, "_removeConnectivityFromDeviceToAccessory:activateTimer:", v21, v3);
                  v13 = 1;
                }
              }

            }
            v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
          }
          while (v18);
        }

        v14 = v27 + 1;
      }
      while (v27 + 1 != v26);
      v26 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
    }
    while (v26);
  }

  return v13 & 1;
}

- (void)_addConnectivityFromDeviceToAccessory:(id)a3 activateTimer:(BOOL)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  HMDResidentMesh *v15;
  NSObject *v16;
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
  void *v27;
  int v28;
  void *v29;
  HMDResidentMesh *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  void *v34;
  HMDResidentMesh *v35;
  NSObject *v36;
  void *v37;
  unsigned int v38;
  uint8_t buf[4];
  void *v40;
  __int16 v41;
  void *v42;
  uint64_t v43;

  v4 = a4;
  v43 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[HMDResidentMesh resident](self, "resident");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v6 = v6;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v8 = v6;
    else
      v8 = 0;
    v9 = v8;

    if (!v9
      || (objc_msgSend(v9, "isPrimary") & 1) != 0
      || (objc_msgSend(v9, "bridge"), v10 = objc_claimAutoreleasedReturnValue(), v6, (v6 = (id)v10) != 0))
    {
      objc_msgSend(v7, "accessoryUUIDs");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "uuid");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v11, "containsObject:", v12);

      if ((v13 & 1) == 0)
      {
        v14 = (void *)MEMORY[0x1D17BA0A0]();
        v15 = self;
        HMFGetOSLogHandle();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v38 = v4;
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "uuid");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "UUIDString");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v40 = v17;
          v41 = 2114;
          v42 = v19;
          _os_log_impl(&dword_1CD062000, v16, OS_LOG_TYPE_INFO, "%{public}@Adding local connectivity to mesh storage for accessory: %{public}@", buf, 0x16u);

          v4 = v38;
        }

        objc_autoreleasePoolPop(v14);
        objc_msgSend(v7, "accessoryUUIDs");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "uuid");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "addObject:", v21);

        objc_msgSend(v7, "setGenerationCount:", objc_msgSend(v7, "generationCount") + 1);
      }
      objc_msgSend(v6, "home");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "primaryResident");
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      if (v23)
      {
        -[HMDResidentMesh _addResidentStorageResidentDevice:](self, "_addResidentStorageResidentDevice:", v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v9, "hasBTLELink"))
        {
          objc_msgSend(v7, "accessoryListWithLinkQuality");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "_addAccessoryWithLinkQuality:toList:", v9, v25);

        }
        if (!objc_msgSend(v7, "enabled")
          || (objc_msgSend(v24, "residentDevice"),
              v26 = (void *)objc_claimAutoreleasedReturnValue(),
              objc_msgSend(v7, "residentDevice"),
              v27 = (void *)objc_claimAutoreleasedReturnValue(),
              v28 = objc_msgSend(v26, "isEqual:", v27),
              v27,
              v26,
              v28))
        {
          v4 = 0;
        }
        objc_msgSend(v24, "_addAccessory:activateTimer:", v6, v4);

      }
      else
      {
        v29 = (void *)MEMORY[0x1D17BA0A0]();
        v30 = self;
        HMFGetOSLogHandle();
        v31 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "shortDescription");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v40 = v32;
          v41 = 2114;
          v42 = v33;
          _os_log_impl(&dword_1CD062000, v31, OS_LOG_TYPE_INFO, "%{public}@Not adding connectivity to resident storage for accessory whose home has no known primary resident: %{public}@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v29);
      }

    }
    else
    {
      v34 = (void *)MEMORY[0x1D17BA0A0]();
      v35 = self;
      HMFGetOSLogHandle();
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v40 = v37;
        _os_log_impl(&dword_1CD062000, v36, OS_LOG_TYPE_INFO, "%{public}@Not adding connectivity for non-primary accessory with nil bridge", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v34);
      v6 = 0;
    }

  }
}

- (void)_removeConnectivityFromDeviceToAccessory:(id)a3 activateTimer:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  uint64_t v7;
  void *v8;
  char isKindOfClass;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  HMDResidentMesh *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  HMDResidentMesh *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  int v39;
  void *v40;
  HMDResidentMesh *v41;
  NSObject *v42;
  void *v43;
  void *v44;
  void *v45;
  HMDResidentMesh *v46;
  NSObject *v47;
  void *v48;
  void *v49;
  uint8_t buf[4];
  void *v51;
  __int16 v52;
  void *v53;
  __int16 v54;
  void *v55;
  uint64_t v56;

  v4 = a4;
  v56 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[HMDResidentMesh resident](self, "resident");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v6 && v7)
  {
    v6 = v6;
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    if ((isKindOfClass & 1) != 0)
      v10 = v6;
    else
      v10 = 0;
    v11 = v10;

    if ((isKindOfClass & 1) == 0
      || (objc_msgSend(v6, "isPrimary") & 1) != 0
      || (objc_msgSend(v6, "bridge"), v12 = objc_claimAutoreleasedReturnValue(), v6, (v6 = (id)v12) != 0))
    {
      if (objc_msgSend(v11, "hasBTLELink"))
      {
        objc_msgSend(v11, "identifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13)
        {
          objc_msgSend(v8, "accessoryListWithLinkQuality");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "identifier");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "removeObjectForKey:", v15);

        }
      }
      if (objc_msgSend(v6, "isSuspended"))
      {
        v16 = (void *)MEMORY[0x1D17BA0A0]();
        v17 = self;
        HMFGetOSLogHandle();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "uuid");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "UUIDString");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "identifier");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v51 = v19;
          v52 = 2112;
          v53 = v21;
          v54 = 2112;
          v55 = v22;
          _os_log_impl(&dword_1CD062000, v18, OS_LOG_TYPE_INFO, "%{public}@Not removing local connectivity to a suspended accessory %@/%@", buf, 0x20u);

        }
        objc_autoreleasePoolPop(v16);
      }
      else
      {
        objc_msgSend(v8, "accessoryUUIDs");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "uuid");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v23, "containsObject:", v24);

        if (v25)
        {
          v26 = (void *)MEMORY[0x1D17BA0A0]();
          v27 = self;
          HMFGetOSLogHandle();
          v28 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "uuid");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "UUIDString");
            v49 = v26;
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v51 = v29;
            v52 = 2112;
            v53 = v31;
            _os_log_impl(&dword_1CD062000, v28, OS_LOG_TYPE_INFO, "%{public}@Removing local connectivity to %@", buf, 0x16u);

            v26 = v49;
          }

          objc_autoreleasePoolPop(v26);
          objc_msgSend(v8, "accessoryUUIDs");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "uuid");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "removeObject:", v33);

          objc_msgSend(v8, "setGenerationCount:", objc_msgSend(v8, "generationCount") + 1);
        }
        objc_msgSend(v6, "home");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "primaryResident");
        v35 = (void *)objc_claimAutoreleasedReturnValue();

        if (v35)
        {
          -[HMDResidentMesh _addResidentStorageResidentDevice:](self, "_addResidentStorageResidentDevice:", v35);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          if (!objc_msgSend(v8, "enabled")
            || (objc_msgSend(v36, "residentDevice"),
                v37 = (void *)objc_claimAutoreleasedReturnValue(),
                objc_msgSend(v8, "residentDevice"),
                v38 = (void *)objc_claimAutoreleasedReturnValue(),
                v39 = objc_msgSend(v37, "isEqual:", v38),
                v38,
                v37,
                v39))
          {
            v4 = 0;
          }
          objc_msgSend(v36, "_removeAccessory:activateTimer:", v6, v4);

        }
        else
        {
          v40 = (void *)MEMORY[0x1D17BA0A0]();
          v41 = self;
          HMFGetOSLogHandle();
          v42 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "shortDescription");
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v51 = v43;
            v52 = 2114;
            v53 = v44;
            _os_log_impl(&dword_1CD062000, v42, OS_LOG_TYPE_INFO, "%{public}@Not removing connectivity from resident storage for accessory whose home has no known primary resident: %{public}@", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v40);
        }

      }
    }
    else
    {
      v45 = (void *)MEMORY[0x1D17BA0A0]();
      v46 = self;
      HMFGetOSLogHandle();
      v47 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v51 = v48;
        _os_log_impl(&dword_1CD062000, v47, OS_LOG_TYPE_INFO, "%{public}@Not removing connectivity for non-primary accessory with a nil bridge", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v45);
      v6 = 0;
    }

  }
}

- (void)_sendMessage:(id)a3 payload:(id)a4 target:(id)a5 force:(BOOL)a6 responseHandler:(id)a7
{
  NSObject *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  void *v26;
  void *v27;
  void *v28;
  HMDResidentMesh *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  int v37;
  void *v38;
  HMDResidentMesh *v39;
  NSObject *v40;
  void *v41;
  const char *v42;
  void *v43;
  void *v44;
  void *v45;
  HMDResidentMesh *v46;
  NSObject *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v57;
  id v58;
  id v59;
  id v60;
  id v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  uint8_t buf[4];
  void *v71;
  __int16 v72;
  id v73;
  __int16 v74;
  void *v75;
  _BYTE v76[128];
  _BYTE v77[128];
  uint64_t v78;

  v78 = *MEMORY[0x1E0C80C00];
  v61 = a3;
  v60 = a4;
  v59 = a5;
  v58 = a7;
  -[HMDResidentMesh workQueue](self, "workQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v11);

  v68 = 0u;
  v69 = 0u;
  v66 = 0u;
  v67 = 0u;
  -[HMDResidentMesh homeManager](self, "homeManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "homes");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v66, v77, 16);
  if (v14)
  {
    v15 = v14;
    v16 = 0;
    v17 = *(_QWORD *)v67;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v67 != v17)
          objc_enumerationMutation(v13);
        v19 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * i);
        v62 = 0u;
        v63 = 0u;
        v64 = 0u;
        v65 = 0u;
        objc_msgSend(v19, "residentDeviceManager");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "availableResidentDevices");
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v62, v76, 16);
        if (v22)
        {
          v23 = v22;
          v24 = *(_QWORD *)v63;
          while (2)
          {
            for (j = 0; j != v23; ++j)
            {
              if (*(_QWORD *)v63 != v24)
                objc_enumerationMutation(v21);
              if ((objc_msgSend(*(id *)(*((_QWORD *)&v62 + 1) + 8 * j), "isCurrentDevice") & 1) != 0)
              {
                v16 = 1;
                goto LABEL_16;
              }
            }
            v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v62, v76, 16);
            if (v23)
              continue;
            break;
          }
        }
LABEL_16:

      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v66, v77, 16);
    }
    while (v15);
  }
  else
  {
    v16 = 0;
  }

  -[HMDResidentMesh resident](self, "resident");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v26;
  if ((v16 & 1) == 0 && !a6)
  {
    v28 = (void *)MEMORY[0x1D17BA0A0]();
    v29 = self;
    HMFGetOSLogHandle();
    v30 = objc_claimAutoreleasedReturnValue();
    v31 = v61;
    v33 = v58;
    v32 = v59;
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v71 = v34;
      v72 = 2112;
      v73 = v61;
      _os_log_impl(&dword_1CD062000, v30, OS_LOG_TYPE_DEFAULT, "%{public}@Suppressing message %@ because we are not a resident device.", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v28);
    v35 = v60;
    goto LABEL_36;
  }
  v31 = v61;
  v33 = v58;
  v32 = v59;
  if (!v59)
  {
    v38 = (void *)MEMORY[0x1D17BA0A0]();
    v39 = self;
    HMFGetOSLogHandle();
    v40 = objc_claimAutoreleasedReturnValue();
    v35 = v60;
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v71 = v41;
      v72 = 2112;
      v73 = v61;
      v42 = "%{public}@Suppressing message %@ because target is nil.";
      goto LABEL_34;
    }
LABEL_35:

    objc_autoreleasePoolPop(v38);
    goto LABEL_36;
  }
  v35 = v60;
  if (!v26)
  {
    v38 = (void *)MEMORY[0x1D17BA0A0]();
    v39 = self;
    HMFGetOSLogHandle();
    v40 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v71 = v41;
      v72 = 2112;
      v73 = v61;
      v42 = "%{public}@Suppressing message %@ because self.resident is nil.";
      goto LABEL_34;
    }
    goto LABEL_35;
  }
  objc_msgSend(v26, "residentDevice");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = objc_msgSend(v36, "isEqual:", v59);

  if (v37)
  {
    v38 = (void *)MEMORY[0x1D17BA0A0]();
    v39 = self;
    HMFGetOSLogHandle();
    v40 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v71 = v41;
      v72 = 2112;
      v73 = v61;
      v42 = "%{public}@Suppressing message %@ because we are the target.";
LABEL_34:
      _os_log_impl(&dword_1CD062000, v40, OS_LOG_TYPE_DEFAULT, v42, buf, 0x16u);

      goto LABEL_35;
    }
    goto LABEL_35;
  }
  +[HMDRemoteMessage messageWithName:messagePayload:](HMDRemoteMessage, "messageWithName:messagePayload:", v61, v60);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDResidentMesh messageTargetUUID](self, "messageTargetUUID");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "device");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "remoteDestinationString");
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  v45 = (void *)MEMORY[0x1D17BA0A0]();
  v46 = self;
  HMFGetOSLogHandle();
  v47 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v53 = v44;
    v54 = v45;
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "shortDescription");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "messagePayload");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v71 = v48;
    v72 = 2114;
    v73 = v49;
    v74 = 2112;
    v75 = v50;
    _os_log_impl(&dword_1CD062000, v47, OS_LOG_TYPE_INFO, "%{public}@Sending message %{public}@ with payload: %@", buf, 0x20u);

    v45 = v54;
    v44 = v53;
  }

  objc_autoreleasePoolPop(v45);
  -[HMDResidentMesh messageDispatcher](v46, "messageDispatcher");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDResidentMesh workQueue](v46, "workQueue");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "sendSecureMessage:target:userID:destination:responseQueue:responseHandler:", v57, v55, v44, v44, v52, v58);

LABEL_36:
}

- (void)_handleMeshUpdateRequestMessage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  HMDResidentMesh *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  HMDResidentMesh *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _QWORD v41[5];
  _QWORD v42[5];
  uint8_t v43[128];
  uint8_t buf[4];
  void *v45;
  __int16 v46;
  void *v47;
  __int16 v48;
  uint64_t v49;
  __int16 v50;
  void *v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "numberForKey:", CFSTR("kMeshVersion"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "unsignedIntegerValue") == 2)
  {
    objc_msgSend(v4, "uuidForKey:", CFSTR("kMeshDevice"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDResidentMesh _meshStorageForDeviceIdentifier:](self, "_meshStorageForDeviceIdentifier:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      v35 = v6;
      v36 = v5;
      v9 = (void *)MEMORY[0x1E0C99DE8];
      objc_msgSend(v7, "accessoryUUIDs");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "arrayWithCapacity:", objc_msgSend(v10, "count"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      v39 = 0u;
      v40 = 0u;
      v37 = 0u;
      v38 = 0u;
      objc_msgSend(v8, "accessoryUUIDs");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v37, v43, 16);
      if (v13)
      {
        v14 = v13;
        v15 = *(_QWORD *)v38;
        do
        {
          for (i = 0; i != v14; ++i)
          {
            if (*(_QWORD *)v38 != v15)
              objc_enumerationMutation(v12);
            objc_msgSend(*(id *)(*((_QWORD *)&v37 + 1) + 8 * i), "UUIDString");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "addObject:", v17);

          }
          v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v37, v43, 16);
        }
        while (v14);
      }

      v41[0] = CFSTR("kMeshDeviceStorageEnabled");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v8, "enabled"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v42[0] = v18;
      v41[1] = CFSTR("kMeshDeviceStorageGenerationCount");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v8, "generationCount"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v42[1] = v19;
      v41[2] = CFSTR("kMeshDeviceStorageSystemLoad");
      objc_msgSend(v8, "metrics");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v42[2] = v20;
      v41[3] = CFSTR("kMeshDeviceStorageAcccessories");
      v21 = (void *)objc_msgSend(v11, "copy");
      v42[3] = v21;
      v41[4] = CFSTR("kMeshDeviceStorageAccessoriesWithLinkQuality");
      objc_msgSend(v8, "accessoryListWithLinkQuality");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = (void *)objc_msgSend(v22, "copy");
      v42[4] = v23;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v42, v41, 5);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "respondWithPayload:", v24);

      v6 = v35;
      v5 = v36;
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
        objc_msgSend(v4, "shortDescription");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v45 = v33;
        v46 = 2114;
        v47 = v34;
        v48 = 2114;
        v49 = (uint64_t)v6;
        _os_log_impl(&dword_1CD062000, v32, OS_LOG_TYPE_ERROR, "%{public}@Rejecting message %{public}@ from unknown device: %{public}@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v30);
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 2);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "respondWithError:", v11);
    }

  }
  else
  {
    v25 = (void *)MEMORY[0x1D17BA0A0]();
    v26 = self;
    HMFGetOSLogHandle();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "shortDescription");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v45 = v28;
      v46 = 2112;
      v47 = v5;
      v48 = 2048;
      v49 = 2;
      v50 = 2114;
      v51 = v29;
      _os_log_impl(&dword_1CD062000, v27, OS_LOG_TYPE_ERROR, "%{public}@Rejecting message with version %@ lower than current version %ld: %{public}@", buf, 0x2Au);

    }
    objc_autoreleasePoolPop(v25);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "respondWithError:", v6);
  }

}

- (void)_handleMeshUpdateMessage:(id)a3
{
  id v4;
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
  HMDResidentMesh *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  HMDResidentMesh *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  uint64_t v37;
  __int16 v38;
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "numberForKey:", CFSTR("kMeshVersion"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "unsignedIntegerValue") == 2)
  {
    objc_msgSend(v4, "uuidForKey:", CFSTR("kMeshDevice"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDResidentMesh _meshStorageForDeviceIdentifier:](self, "_meshStorageForDeviceIdentifier:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_msgSend(v4, "numberForKey:", CFSTR("kMeshDeviceStorageGenerationCount"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setGenerationCount:", objc_msgSend(v8, "unsignedIntegerValue"));

      objc_msgSend(v4, "numberForKey:", CFSTR("kMeshDeviceStorageEnabled"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setEnabled:", objc_msgSend(v9, "BOOLValue"));

      objc_msgSend(v4, "dictionaryForKey:", CFSTR("kMeshDeviceStorageSystemLoad"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setMetrics:", v10);

      objc_msgSend(v4, "arrayForKey:", CFSTR("kMeshDeviceStorageAcccessories"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      uuidSetFromArrayOfStrings(v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setAccessoryUUIDs:", v12);

      objc_msgSend(v4, "dictionaryForKey:", CFSTR("kMeshDeviceStorageAccessoriesWithLinkQuality"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v13;
      if (v13)
      {
        v15 = (void *)objc_msgSend(v13, "mutableCopy");
        objc_msgSend(v7, "setAccessoryListWithLinkQuality:", v15);

      }
      v16 = (void *)MEMORY[0x1E0CB37E8];
      -[HMDResidentMesh resident](self, "resident", CFSTR("kMeshDeviceStorageEnabled"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "numberWithBool:", objc_msgSend(v17, "enabled"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = v18;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v31, &v30, 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "respondWithPayload:", v19);

    }
    else
    {
      v25 = (void *)MEMORY[0x1D17BA0A0]();
      v26 = self;
      HMFGetOSLogHandle();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "shortDescription");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v33 = v28;
        v34 = 2114;
        v35 = v29;
        v36 = 2114;
        v37 = (uint64_t)v6;
        _os_log_impl(&dword_1CD062000, v27, OS_LOG_TYPE_ERROR, "%{public}@Rejecting message %{public}@ from unknown device: %{public}@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v25);
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 2);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "respondWithError:", v14);
    }

  }
  else
  {
    v20 = (void *)MEMORY[0x1D17BA0A0]();
    v21 = self;
    HMFGetOSLogHandle();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "shortDescription");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v33 = v23;
      v34 = 2112;
      v35 = v5;
      v36 = 2048;
      v37 = 2;
      v38 = 2114;
      v39 = v24;
      _os_log_impl(&dword_1CD062000, v22, OS_LOG_TYPE_ERROR, "%{public}@Rejecting message with version %@ lower than current version %ld: %{public}@", buf, 0x2Au);

    }
    objc_autoreleasePoolPop(v20);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "respondWithError:", v6);
  }

}

- (id)bestResidentDeviceForAccessory:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  HMDResidentMesh *v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  HMDResidentMesh *v21;
  NSObject *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  id v26;
  _QWORD block[4];
  id v29;
  HMDResidentMesh *v30;
  id v31;
  _QWORD *v32;
  uint64_t *v33;
  _QWORD v34[4];
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  id v40;
  uint8_t buf[4];
  void *v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v35 = 0;
  v36 = &v35;
  v37 = 0x3032000000;
  v38 = __Block_byref_object_copy__103594;
  v39 = __Block_byref_object_dispose__103595;
  v40 = 0;
  v34[0] = 0;
  v34[1] = v34;
  v34[2] = 0x2020000000;
  v34[3] = 5;
  v5 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(v4, "home");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "residentDeviceManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "availableResidentDevices");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setWithArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMDResidentMesh workQueue](self, "workQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__HMDResidentMesh_bestResidentDeviceForAccessory___block_invoke;
  block[3] = &unk_1E89B63C8;
  v11 = v4;
  v29 = v11;
  v30 = self;
  v12 = v9;
  v31 = v12;
  v32 = v34;
  v33 = &v35;
  dispatch_sync(v10, block);

  v13 = (void *)v36[5];
  if (!v13)
  {
    v14 = (void *)MEMORY[0x1D17BA0A0]();
    v15 = self;
    HMFGetOSLogHandle();
    v16 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v42 = v17;
      _os_log_impl(&dword_1CD062000, v16, OS_LOG_TYPE_DEBUG, "%{public}@Preferring (self) this resident", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v14);
    -[HMDResidentMesh deviceForAccessory:residentOrder:reachableResidents:](v15, "deviceForAccessory:residentOrder:reachableResidents:", v11, 0, 0);
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = (void *)v36[5];
    v36[5] = v18;

    v13 = (void *)v36[5];
    if (!v13)
    {
      v20 = (void *)MEMORY[0x1D17BA0A0]();
      v21 = v15;
      HMFGetOSLogHandle();
      v22 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      {
        HMFGetLogIdentifier();
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v42 = v23;
        _os_log_impl(&dword_1CD062000, v22, OS_LOG_TYPE_DEBUG, "%{public}@Preferring first reachable resident", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v20);
      -[HMDResidentMesh deviceForAccessory:residentOrder:reachableResidents:](v21, "deviceForAccessory:residentOrder:reachableResidents:", v11, 1, 0);
      v24 = objc_claimAutoreleasedReturnValue();
      v25 = (void *)v36[5];
      v36[5] = v24;

      v13 = (void *)v36[5];
    }
  }
  v26 = v13;

  _Block_object_dispose(v34, 8);
  _Block_object_dispose(&v35, 8);

  return v26;
}

- (id)cameraRecordingAnalysisNodesForCameraAccessory:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  _QWORD block[5];
  id v13;
  id v14;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDResidentMesh workQueue](self, "workQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66__HMDResidentMesh_cameraRecordingAnalysisNodesForCameraAccessory___block_invoke;
  block[3] = &unk_1E89C20C8;
  block[4] = self;
  v13 = v4;
  v7 = v5;
  v14 = v7;
  v8 = v4;
  dispatch_sync(v6, block);

  v9 = v14;
  v10 = v7;

  return v10;
}

- (id)balancedResidentMapForAccessories:(id)a3
{
  void *v4;
  uint64_t v5;
  id v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  HMDResidentMesh *v11;
  NSObject *v12;
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
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t j;
  void *v28;
  id v30;
  HMDResidentMesh *v31;
  id obj;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  void *v47;
  uint8_t buf[4];
  void *v49;
  __int16 v50;
  void *v51;
  __int16 v52;
  void *v53;
  __int16 v54;
  void *v55;
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v30 = a3;
  -[HMDResidentMesh _residentMapForAccessories:](self, "_residentMapForAccessories:");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_opt_new();
  v5 = 0;
  v31 = self;
  do
  {
    v44 = 0u;
    v45 = 0u;
    v42 = 0u;
    v43 = 0u;
    v6 = v30;
    v36 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v42, v56, 16);
    if (v36)
    {
      v35 = *(_QWORD *)v43;
      obj = v6;
      do
      {
        for (i = 0; i != v36; ++i)
        {
          if (*(_QWORD *)v43 != v35)
            objc_enumerationMutation(obj);
          v8 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * i);
          -[HMDResidentMesh bestResidentDeviceForAccessory:](self, "bestResidentDeviceForAccessory:", v8);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = (void *)MEMORY[0x1D17BA0A0]();
          v11 = self;
          HMFGetOSLogHandle();
          v12 = objc_claimAutoreleasedReturnValue();
          v37 = v9;
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
          {
            HMFGetLogIdentifier();
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "identifier");
            v33 = v10;
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "name");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "device");
            v16 = v4;
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "shortDescription");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138544130;
            v49 = v13;
            v50 = 2114;
            v51 = v14;
            v52 = 2112;
            v53 = v15;
            v54 = 2114;
            v55 = v18;
            _os_log_impl(&dword_1CD062000, v12, OS_LOG_TYPE_DEBUG, "%{public}@Selected %{public}@/%@ for resident device: %{public}@", buf, 0x2Au);

            v9 = v37;
            v4 = v16;

            v10 = v33;
            self = v31;
          }

          objc_autoreleasePoolPop(v10);
          if (v8)
          {
            objc_msgSend(v4, "objectForKey:", v9);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = v19;
            if (v19)
            {
              if ((objc_msgSend(v19, "containsObject:", v8) & 1) == 0)
                objc_msgSend(v20, "addObject:", v8);
            }
            else
            {
              v47 = v8;
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v47, 1);
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              v22 = (void *)objc_msgSend(v21, "mutableCopy");
              objc_msgSend(v4, "setObject:forKey:", v22, v37);

            }
          }
          v40 = 0u;
          v41 = 0u;
          v38 = 0u;
          v39 = 0u;
          objc_msgSend(v34, "objectEnumerator");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
          if (v24)
          {
            v25 = v24;
            v5 = 0;
            v26 = *(_QWORD *)v39;
            do
            {
              for (j = 0; j != v25; ++j)
              {
                if (*(_QWORD *)v39 != v26)
                  objc_enumerationMutation(v23);
                v28 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * j);
                v5 += objc_msgSend(v28, "count");
                if (v8 && objc_msgSend(v28, "containsObject:", v8))
                {
                  objc_msgSend(v28, "removeObject:", v8);
                  --v5;
                }
              }
              v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
            }
            while (v25);
          }
          else
          {
            v5 = 0;
          }

        }
        v6 = obj;
        v36 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v56, 16);
      }
      while (v36);
    }

  }
  while (v5);

  return v4;
}

- (id)_residentMapForAccessories:(id)a3
{
  id v4;
  void *v5;
  uint64_t i;
  unint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id obj;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint64_t v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  obj = v4;
  v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
  if (v17)
  {
    v16 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v20 != v16)
          objc_enumerationMutation(obj);
        v7 = 0;
        v8 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i);
        v18 = 0;
        do
        {
          -[HMDResidentMesh deviceForAccessory:residentOrder:reachableResidents:](self, "deviceForAccessory:residentOrder:reachableResidents:", v8, v7, &v18);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          if (v9)
          {
            objc_msgSend(v5, "objectForKey:", v9);
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            v11 = v10;
            if (v10)
            {
              if ((objc_msgSend(v10, "containsObject:", v8) & 1) == 0)
                objc_msgSend(v11, "addObject:", v8);
            }
            else
            {
              v23 = v8;
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v23, 1);
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              v13 = (void *)objc_msgSend(v12, "mutableCopy");
              objc_msgSend(v5, "setObject:forKey:", v13, v9);

            }
          }

          ++v7;
        }
        while (v7 <= v18);
      }
      v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    }
    while (v17);
  }

  return v5;
}

- (id)deviceForAccessory:(id)a3 residentOrder:(unint64_t)a4 reachableResidents:(unint64_t *)a5
{
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  NSObject *v12;
  id v13;
  id v14;
  _QWORD block[4];
  id v17;
  HMDResidentMesh *v18;
  uint64_t *v19;
  uint64_t *v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;

  v8 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v9 = v8;
  else
    v9 = 0;
  v10 = v9;

  if (v10 && (objc_msgSend(v10, "isPrimary") & 1) == 0)
  {
    objc_msgSend(v10, "bridge");
    v11 = objc_claimAutoreleasedReturnValue();

    v8 = (id)v11;
  }
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__103594;
  v30 = __Block_byref_object_dispose__103595;
  v31 = 0;
  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = 0;
  -[HMDResidentMesh workQueue](self, "workQueue");
  v12 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __71__HMDResidentMesh_deviceForAccessory_residentOrder_reachableResidents___block_invoke;
  block[3] = &unk_1E89B2A00;
  v13 = v8;
  v17 = v13;
  v18 = self;
  v20 = &v26;
  v21 = a4;
  v19 = &v22;
  dispatch_sync(v12, block);

  if (a5)
    *a5 = v23[3];
  v14 = (id)v27[5];

  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v26, 8);

  return v14;
}

- (void)setMetricForCurrentDevice:(id)a3 withValue:(id)a4 isUrgent:(BOOL)a5
{
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  BOOL v16;

  v8 = a3;
  v9 = a4;
  -[HMDResidentMesh workQueue](self, "workQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __64__HMDResidentMesh_setMetricForCurrentDevice_withValue_isUrgent___block_invoke;
  v13[3] = &unk_1E89BCF10;
  v13[4] = self;
  v14 = v8;
  v15 = v9;
  v16 = a5;
  v11 = v9;
  v12 = v8;
  dispatch_async(v10, v13);

}

- (id)_stateDump
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  int v15;
  const char *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t j;
  uint64_t v31;
  void *v32;
  void *v33;
  uint64_t v34;
  __CFString *v35;
  __CFString *v36;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  const char *v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t k;
  uint64_t v56;
  void *v57;
  void *v58;
  int v59;
  const char *v60;
  void *v61;
  void *v62;
  void *v63;
  id v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t m;
  uint64_t v69;
  void *v70;
  void *v71;
  uint64_t v72;
  __CFString *v73;
  __CFString *v74;
  void *v75;
  uint64_t v76;
  void *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t n;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  char v86;
  const __CFString *v87;
  HMDResidentMesh *v89;
  id obj;
  id obja;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  void *v96;
  uint64_t v97;
  void *v98;
  uint64_t v99;
  void *v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  _QWORD v117[4];
  id v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  _BYTE v131[128];
  _BYTE v132[128];
  _BYTE v133[128];
  _BYTE v134[128];
  _BYTE v135[128];
  _BYTE v136[128];
  _BYTE v137[128];
  uint64_t v138;

  v138 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v89 = self;
  -[HMDResidentMesh residents](self, "residents");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5)
    objc_msgSend(v3, "appendString:", CFSTR("mesh:\n"));
  -[HMDResidentMesh resident](v89, "resident");
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  v127 = 0u;
  v128 = 0u;
  v129 = 0u;
  v130 = 0u;
  -[HMDResidentMesh residents](v89, "residents");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v94 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v127, v137, 16);
  if (v94)
  {
    v92 = *(_QWORD *)v128;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v128 != v92)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v127 + 1) + 8 * v6);
        objc_msgSend(v7, "residentDevice");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "device");
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v9, "identifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "name");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "appendFormat:", CFSTR("    device: %@ / %@ / "), v10, v11);

        v99 = v6;
        if (v7 == v98)
        {
          -[HMDResidentMesh primaryResidentForHomes](v89, "primaryResidentForHomes");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v12, "count"))
            v13 = CFSTR("primary");
          else
            v13 = CFSTR("local");
          objc_msgSend(v3, "appendString:", v13);

        }
        else
        {
          objc_msgSend(v3, "appendString:", CFSTR("remote"));
        }
        objc_msgSend(v9, "remoteDestinationString");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "appendFormat:", CFSTR(" / %@\n"), v14);

        objc_msgSend(v3, "appendFormat:", CFSTR("     generation: %lu\n"), objc_msgSend(v7, "generationCount"));
        v15 = objc_msgSend(v7, "enabled");
        v16 = "YES";
        if (!v15)
          v16 = "NO";
        objc_msgSend(v3, "appendFormat:", CFSTR("        enabled: %s\n"), v16);
        objc_msgSend(v3, "appendString:", CFSTR("      can reach:\n"));
        v125 = 0u;
        v126 = 0u;
        v123 = 0u;
        v124 = 0u;
        objc_msgSend(v7, "accessoryUUIDs");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v123, v136, 16);
        if (v18)
        {
          v19 = v18;
          v20 = *(_QWORD *)v124;
          do
          {
            for (i = 0; i != v19; ++i)
            {
              if (*(_QWORD *)v124 != v20)
                objc_enumerationMutation(v17);
              objc_msgSend(*(id *)(*((_QWORD *)&v123 + 1) + 8 * i), "UUIDString");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v3, "appendFormat:", CFSTR("           acc uuid: %@\n"), v22);

            }
            v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v123, v136, 16);
          }
          while (v19);
        }
        v96 = v9;

        objc_msgSend(v7, "accessoryListWithLinkQuality");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "allKeys");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "sortedArrayUsingComparator:", &__block_literal_global_249_103607);
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v3, "appendString:", CFSTR("      HMDResidentMeshMeshStorage Accessories with Link Quality:\n"));
        v121 = 0u;
        v122 = 0u;
        v119 = 0u;
        v120 = 0u;
        v26 = v25;
        v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v119, v135, 16);
        if (v27)
        {
          v28 = v27;
          v29 = *(_QWORD *)v120;
          do
          {
            for (j = 0; j != v28; ++j)
            {
              if (*(_QWORD *)v120 != v29)
                objc_enumerationMutation(v26);
              v31 = *(_QWORD *)(*((_QWORD *)&v119 + 1) + 8 * j);
              objc_msgSend(v7, "accessoryListWithLinkQuality");
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v32, "objectForKey:", v31);
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              v34 = objc_msgSend(v33, "integerValue");
              v35 = CFSTR("*****");
              if ((unint64_t)(v34 - 1) <= 4)
                v35 = off_1E89ABF70[v34 - 1];
              v36 = v35;
              objc_msgSend(v3, "appendFormat:", CFSTR("          | Accessory: %@ | LinkQuality : %@ |\n"), v31, v36);

            }
            v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v119, v135, 16);
          }
          while (v28);
        }

        objc_msgSend(MEMORY[0x1E0CB37A0], "string");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "appendFormat:", CFSTR("{"));
        objc_msgSend(v7, "metrics");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v117[0] = MEMORY[0x1E0C809B0];
        v117[1] = 3221225472;
        v117[2] = __29__HMDResidentMesh__stateDump__block_invoke_2;
        v117[3] = &unk_1E89C1C10;
        v39 = v37;
        v118 = v39;
        objc_msgSend(v38, "enumerateKeysAndObjectsUsingBlock:", v117);

        if (objc_msgSend(v39, "hasSuffix:", CFSTR(",")))
          objc_msgSend(v39, "deleteCharactersInRange:", objc_msgSend(v39, "length") - 1, 1);
        objc_msgSend(v39, "appendFormat:", CFSTR(" }"));
        objc_msgSend(v3, "appendFormat:", CFSTR("      Device metrics: %@ \n"), v39);

        v6 = v99 + 1;
      }
      while (v99 + 1 != v94);
      v94 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v127, v137, 16);
    }
    while (v94);
  }

  -[HMDResidentMesh reachableAccessories](v89, "reachableAccessories");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = objc_msgSend(v40, "count");

  if (v41)
    objc_msgSend(v3, "appendString:", CFSTR("remote primary residents:\n"));
  v115 = 0u;
  v116 = 0u;
  v113 = 0u;
  v114 = 0u;
  -[HMDResidentMesh reachableAccessories](v89, "reachableAccessories");
  obja = (id)objc_claimAutoreleasedReturnValue();
  v95 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v113, v134, 16);
  if (v95)
  {
    v93 = *(_QWORD *)v114;
    do
    {
      v42 = 0;
      do
      {
        if (*(_QWORD *)v114 != v93)
          objc_enumerationMutation(obja);
        v97 = v42;
        v43 = *(void **)(*((_QWORD *)&v113 + 1) + 8 * v42);
        objc_msgSend(v43, "residentDevice");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "device");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "identifier");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        v100 = v44;
        objc_msgSend(v44, "device");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "name");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "appendFormat:", CFSTR("    resident: %@ / %@ \n"), v46, v48);

        objc_msgSend(v43, "transmitTimer");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        v50 = "YES";
        if (!v49)
          v50 = "NO";
        objc_msgSend(v3, "appendFormat:", CFSTR("         pending: %s\n"), v50);

        objc_msgSend(v3, "appendFormat:", CFSTR("       can reach:\n"));
        v111 = 0u;
        v112 = 0u;
        v109 = 0u;
        v110 = 0u;
        objc_msgSend(v43, "accessoryUUIDs");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        v52 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v109, v133, 16);
        if (v52)
        {
          v53 = v52;
          v54 = *(_QWORD *)v110;
          do
          {
            for (k = 0; k != v53; ++k)
            {
              if (*(_QWORD *)v110 != v54)
                objc_enumerationMutation(v51);
              v56 = *(_QWORD *)(*((_QWORD *)&v109 + 1) + 8 * k);
              objc_msgSend(v98, "residentDevice");
              v57 = (void *)objc_claimAutoreleasedReturnValue();
              if ((objc_msgSend(v100, "isEqual:", v57) & 1) != 0)
              {
                objc_msgSend(v3, "appendFormat:", CFSTR("            acc uuid: %@%s\n"), v56, ");
              }
              else
              {
                objc_msgSend(v43, "lastSentAccessoryUUIDs");
                v58 = (void *)objc_claimAutoreleasedReturnValue();
                v59 = objc_msgSend(v58, "containsObject:", v56);
                v60 = "";
                if (!v59)
                  v60 = " (new)";
                objc_msgSend(v3, "appendFormat:", CFSTR("            acc uuid: %@%s\n"), v56, v60);

              }
            }
            v53 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v109, v133, 16);
          }
          while (v53);
        }

        objc_msgSend(v43, "accessoryListWithLinkQuality");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v61, "allKeys");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v62, "sortedArrayUsingComparator:", &__block_literal_global_276_103621);
        v63 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v3, "appendString:", CFSTR("      HMDResidentMeshResidentStorage Accessories with Link Quality:\n"));
        v107 = 0u;
        v108 = 0u;
        v105 = 0u;
        v106 = 0u;
        v64 = v63;
        v65 = objc_msgSend(v64, "countByEnumeratingWithState:objects:count:", &v105, v132, 16);
        if (v65)
        {
          v66 = v65;
          v67 = *(_QWORD *)v106;
          do
          {
            for (m = 0; m != v66; ++m)
            {
              if (*(_QWORD *)v106 != v67)
                objc_enumerationMutation(v64);
              v69 = *(_QWORD *)(*((_QWORD *)&v105 + 1) + 8 * m);
              objc_msgSend(v43, "accessoryListWithLinkQuality");
              v70 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v70, "objectForKey:", v69);
              v71 = (void *)objc_claimAutoreleasedReturnValue();
              v72 = objc_msgSend(v71, "integerValue");
              v73 = CFSTR("*****");
              if ((unint64_t)(v72 - 1) <= 4)
                v73 = off_1E89ABF70[v72 - 1];
              v74 = v73;
              objc_msgSend(v3, "appendFormat:", CFSTR("          | Accessory: %@ | LinkQuality : %@ |\n"), v69, v74);

            }
            v66 = objc_msgSend(v64, "countByEnumeratingWithState:objects:count:", &v105, v132, 16);
          }
          while (v66);
        }

        v42 = v97 + 1;
      }
      while (v97 + 1 != v95);
      v95 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v113, v134, 16);
    }
    while (v95);
  }

  -[HMDResidentMesh primaryResidentForHomes](v89, "primaryResidentForHomes");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  v76 = objc_msgSend(v75, "count");

  if (v76)
    objc_msgSend(v3, "appendString:", CFSTR("primary resident for:\n"));
  v103 = 0u;
  v104 = 0u;
  v101 = 0u;
  v102 = 0u;
  -[HMDResidentMesh primaryResidentForHomes](v89, "primaryResidentForHomes");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  v78 = objc_msgSend(v77, "countByEnumeratingWithState:objects:count:", &v101, v131, 16);
  if (v78)
  {
    v79 = v78;
    v80 = *(_QWORD *)v102;
    do
    {
      for (n = 0; n != v79; ++n)
      {
        if (*(_QWORD *)v102 != v80)
          objc_enumerationMutation(v77);
        objc_msgSend(*(id *)(*((_QWORD *)&v101 + 1) + 8 * n), "UUIDString");
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "appendFormat:", CFSTR("    %@\n"), v82);

      }
      v79 = objc_msgSend(v77, "countByEnumeratingWithState:objects:count:", &v101, v131, 16);
    }
    while (v79);
  }

  if (!v98)
  {
    v87 = CFSTR("we do not have a resident device (either not logged into iCloud or have reachability issues).");
    goto LABEL_81;
  }
  -[HMDResidentMesh messageDispatcher](v89, "messageDispatcher");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v83, "secureRemoteTransport");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v84, "deviceMonitor");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  v86 = objc_msgSend(v85, "isReachable");

  if ((v86 & 1) == 0)
  {
    v87 = CFSTR("we are about to go unreachable in the near future unless we get network back.");
LABEL_81:
    objc_msgSend(v3, "appendString:", v87);
  }

  return v3;
}

- (NSString)stateDump
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__103594;
  v11 = __Block_byref_object_dispose__103595;
  v12 = 0;
  -[HMDResidentMesh workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __28__HMDResidentMesh_stateDump__block_invoke;
  v6[3] = &unk_1E89C0800;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSString *)v4;
}

- (id)messageDestination
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc(MEMORY[0x1E0D285D8]);
  -[HMDResidentMesh messageTargetUUID](self, "messageTargetUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithTarget:", v4);

  return v5;
}

- (NSUUID)uuid
{
  return (NSUUID *)objc_getProperty(self, a2, 8, 1);
}

- (HMDHomeManager)homeManager
{
  return (HMDHomeManager *)objc_loadWeakRetained((id *)&self->_homeManager);
}

- (void)setHomeManager:(id)a3
{
  objc_storeWeak((id *)&self->_homeManager, a3);
}

- (HMDMessageDispatcher)messageDispatcher
{
  return (HMDMessageDispatcher *)objc_loadWeakRetained((id *)&self->_messageDispatcher);
}

- (void)setMessageDispatcher:(id)a3
{
  objc_storeWeak((id *)&self->_messageDispatcher, a3);
}

- (NSMutableArray)residents
{
  return self->_residents;
}

- (void)setResidents:(id)a3
{
  objc_storeStrong((id *)&self->_residents, a3);
}

- (HMDResidentMeshMeshStorage)resident
{
  return (HMDResidentMeshMeshStorage *)objc_loadWeakRetained((id *)&self->_resident);
}

- (void)setResident:(id)a3
{
  objc_storeWeak((id *)&self->_resident, a3);
}

- (NSMutableArray)reachableAccessories
{
  return self->_reachableAccessories;
}

- (void)setReachableAccessories:(id)a3
{
  objc_storeStrong((id *)&self->_reachableAccessories, a3);
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setWorkQueue:(id)a3
{
  objc_storeStrong((id *)&self->_workQueue, a3);
}

- (HMFTimer)devicesChangedTimer
{
  return self->_devicesChangedTimer;
}

- (NSSet)primaryResidentForHomes
{
  return self->_primaryResidentForHomes;
}

- (void)setPrimaryResidentForHomes:(id)a3
{
  objc_storeStrong((id *)&self->_primaryResidentForHomes, a3);
}

- (NSMutableDictionary)loadMetrics
{
  return self->_loadMetrics;
}

- (HMFTimer)startupTimer
{
  return self->_startupTimer;
}

- (int64_t)startupTickCount
{
  return self->_startupTickCount;
}

- (void)setStartupTickCount:(int64_t)a3
{
  self->_startupTickCount = a3;
}

- (HMFTimer)linkQualityMonitorTimer
{
  return self->_linkQualityMonitorTimer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_linkQualityMonitorTimer, 0);
  objc_storeStrong((id *)&self->_startupTimer, 0);
  objc_storeStrong((id *)&self->_loadMetrics, 0);
  objc_storeStrong((id *)&self->_primaryResidentForHomes, 0);
  objc_storeStrong((id *)&self->_devicesChangedTimer, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_reachableAccessories, 0);
  objc_destroyWeak((id *)&self->_resident);
  objc_storeStrong((id *)&self->_residents, 0);
  objc_destroyWeak((id *)&self->_messageDispatcher);
  objc_destroyWeak((id *)&self->_homeManager);
  objc_storeStrong((id *)&self->_uuid, 0);
}

void __28__HMDResidentMesh_stateDump__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_stateDump");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

uint64_t __29__HMDResidentMesh__stateDump__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR(" %@:%@,"), a2, a3);
}

uint64_t __29__HMDResidentMesh__stateDump__block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

uint64_t __29__HMDResidentMesh__stateDump__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

void __64__HMDResidentMesh_setMetricForCurrentDevice_withValue_isUrgent___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  __int128 v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  id v26;
  NSObject *v27;
  _BOOL4 v28;
  void *v29;
  void *v30;
  id v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  __int128 v36;
  id obj;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint8_t v42[128];
  uint8_t buf[4];
  void *v44;
  __int16 v45;
  void *v46;
  __int16 v47;
  uint64_t v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1D17BA0A0]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(void **)(a1 + 40);
    v7 = *(_QWORD *)(a1 + 48);
    *(_DWORD *)buf = 138543874;
    v44 = v5;
    v45 = 2112;
    v46 = v6;
    v47 = 2112;
    v48 = v7;
    _os_log_impl(&dword_1CD062000, v4, OS_LOG_TYPE_INFO, "%{public}@Setting local metric with key: %@, value: %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v2);
  v8 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "loadMetrics");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v8, *(_QWORD *)(a1 + 40));

  objc_msgSend(*(id *)(a1 + 32), "loadMetrics");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "resident");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setMetrics:", v10);

  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "homeManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "homes");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v13;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
  if (v14)
  {
    v16 = v14;
    v17 = *(_QWORD *)v39;
    *(_QWORD *)&v15 = 138543362;
    v36 = v15;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v39 != v17)
          objc_enumerationMutation(obj);
        v19 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
        if (objc_msgSend(v19, "isCurrentDeviceAvailableResident", v36))
        {
          objc_msgSend(v19, "primaryResident");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          if (v20)
          {
            objc_msgSend(*(id *)(a1 + 32), "_addResidentStorageResidentDevice:", v20);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "metrics");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(a1 + 32), "loadMetrics");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "addEntriesFromDictionary:", v23);

            if ((objc_msgSend(v20, "isCurrentDevice") & 1) == 0)
            {
              v24 = *(unsigned __int8 *)(a1 + 56);
              v25 = (void *)MEMORY[0x1D17BA0A0]();
              v26 = *(id *)(a1 + 32);
              HMFGetOSLogHandle();
              v27 = objc_claimAutoreleasedReturnValue();
              v28 = os_log_type_enabled(v27, OS_LOG_TYPE_INFO);
              if (v24)
              {
                if (v28)
                {
                  HMFGetLogIdentifier();
                  v29 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = v36;
                  v44 = v29;
                  _os_log_impl(&dword_1CD062000, v27, OS_LOG_TYPE_INFO, "%{public}@Immediately transmitting updated metrics", buf, 0xCu);

                }
                objc_autoreleasePoolPop(v25);
                objc_msgSend(v21, "_transmitStatus:", 0);
              }
              else
              {
                if (v28)
                {
                  HMFGetLogIdentifier();
                  v35 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = v36;
                  v44 = v35;
                  _os_log_impl(&dword_1CD062000, v27, OS_LOG_TYPE_INFO, "%{public}@Scheduling transmission of updated metrics", buf, 0xCu);

                }
                objc_autoreleasePoolPop(v25);
                objc_msgSend(v21, "_transmitAfter:", 10.0);
              }
            }

          }
          else
          {
            v30 = (void *)MEMORY[0x1D17BA0A0]();
            v31 = *(id *)(a1 + 32);
            HMFGetOSLogHandle();
            v32 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v19, "uuid");
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v44 = v33;
              v45 = 2114;
              v46 = v34;
              _os_log_impl(&dword_1CD062000, v32, OS_LOG_TYPE_INFO, "%{public}@Could not set metric for current device for home %{public}@: no primary resident", buf, 0x16u);

            }
            objc_autoreleasePoolPop(v30);
          }

        }
      }
      v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
    }
    while (v16);
  }

}

void __71__HMDResidentMesh_deviceForAccessory_residentOrder_reachableResidents___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "home");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0C99E60];
  v26 = v2;
  objc_msgSend(v2, "residentDeviceManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "availableResidentDevices");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithArray:", v5);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  objc_msgSend(*(id *)(a1 + 40), "residents");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v7)
  {
    v8 = v7;
    v27 = 0;
    v9 = *(_QWORD *)v30;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v30 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * v10);
        objc_msgSend(v11, "accessoryUUIDs");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "uuid");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v12, "containsObject:", v13) || (objc_msgSend(v11, "enabled") & 1) == 0)
        {

LABEL_12:
          goto LABEL_13;
        }
        objc_msgSend(v11, "residentDevice");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v28, "containsObject:", v14);

        if (!v15)
          goto LABEL_13;
        ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
        if (!*(_QWORD *)(a1 + 64))
        {
          objc_msgSend(*(id *)(a1 + 40), "resident");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "residentDevice");
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v26, "primaryResident");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if (!objc_msgSend(v17, "isEqual:", v18))
            goto LABEL_18;
          v19 = objc_msgSend(*(id *)(a1 + 32), "isReachable");

          if (v19)
          {
            v20 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
            v21 = v17;
            v18 = *(void **)(v20 + 40);
            *(_QWORD *)(v20 + 40) = v21;
LABEL_18:

          }
          goto LABEL_20;
        }
        ++v27;
LABEL_20:
        if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
        {
          v22 = *(_QWORD *)(a1 + 64);
          if (v27 == v22)
          {
            if (v22)
            {
              objc_msgSend(v11, "residentDevice");
              v23 = objc_claimAutoreleasedReturnValue();
              v24 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
              v12 = *(void **)(v24 + 40);
              *(_QWORD *)(v24 + 40) = v23;
              goto LABEL_12;
            }
          }
        }
LABEL_13:
        ++v10;
      }
      while (v8 != v10);
      v25 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
      v8 = v25;
    }
    while (v25);
  }

}

void __66__HMDResidentMesh_cameraRecordingAnalysisNodesForCameraAccessory___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  HMDCameraRecordingAnalysisNode *v16;
  void *v17;
  void *v18;
  HMDCameraRecordingAnalysisNode *v19;
  void *v20;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _QWORD v26[4];
  id v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "residents");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "mutableCopy");

  v4 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(*(id *)(a1 + 40), "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "residentDeviceManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "availableResidentDevices");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWithArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __66__HMDResidentMesh_cameraRecordingAnalysisNodesForCameraAccessory___block_invoke_2;
  v26[3] = &unk_1E89B29D8;
  v21 = v8;
  v27 = v21;
  objc_msgSend(v3, "indexesOfObjectsPassingTest:", v26);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObjectsAtIndexes:");
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v9 = v3;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v23;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v23 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * v13);
        v15 = *(void **)(a1 + 48);
        v16 = [HMDCameraRecordingAnalysisNode alloc];
        objc_msgSend(v14, "residentDevice");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "metrics");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = -[HMDCameraRecordingAnalysisNode initWithResidentDevice:metrics:](v16, "initWithResidentDevice:metrics:", v17, v18);
        objc_msgSend(v15, "addObject:", v19);

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
    }
    while (v11);
  }

}

uint64_t __66__HMDResidentMesh_cameraRecordingAnalysisNodesForCameraAccessory___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  objc_msgSend(v3, "residentDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "containsObject:", v5))
  {
    objc_msgSend(v3, "residentDevice");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "capabilities");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "supportsCameraRecording") ^ 1;

  }
  else
  {
    v8 = 1;
  }

  return v8;
}

void __50__HMDResidentMesh_bestResidentDeviceForAccessory___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  id obj;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v2 = *(id *)(a1 + 32);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  if ((objc_msgSend(v4, "hasIPLink") & 1) == 0)
  {
    v27 = v4;
    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    objc_msgSend(*(id *)(a1 + 40), "residents");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v36;
      v28 = *(_QWORD *)v36;
      do
      {
        v8 = 0;
        v29 = v6;
        do
        {
          if (*(_QWORD *)v36 != v7)
            objc_enumerationMutation(obj);
          v9 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * v8);
          v10 = *(void **)(a1 + 48);
          objc_msgSend(v9, "residentDevice");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(v10) = objc_msgSend(v10, "containsObject:", v11);

          if ((_DWORD)v10)
          {
            v33 = 0u;
            v34 = 0u;
            v31 = 0u;
            v32 = 0u;
            objc_msgSend(v9, "accessoryListWithLinkQuality");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "keyEnumerator");
            v13 = (void *)objc_claimAutoreleasedReturnValue();

            v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
            if (v14)
            {
              v15 = v14;
              v16 = *(_QWORD *)v32;
              do
              {
                for (i = 0; i != v15; ++i)
                {
                  if (*(_QWORD *)v32 != v16)
                    objc_enumerationMutation(v13);
                  v18 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
                  objc_msgSend(*(id *)(a1 + 32), "identifier");
                  v19 = (void *)objc_claimAutoreleasedReturnValue();
                  v20 = objc_msgSend(v18, "isEqualToString:", v19);

                  if (v20)
                  {
                    objc_msgSend(v9, "accessoryListWithLinkQuality");
                    v21 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v21, "objectForKey:", v18);
                    v22 = (void *)objc_claimAutoreleasedReturnValue();
                    v23 = objc_msgSend(v22, "integerValue");

                    if (v23 < *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
                    {
                      objc_msgSend(v9, "residentDevice");
                      v24 = objc_claimAutoreleasedReturnValue();
                      v25 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
                      v26 = *(void **)(v25 + 40);
                      *(_QWORD *)(v25 + 40) = v24;

                      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v23;
                    }
                  }
                }
                v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
              }
              while (v15);
            }

            v7 = v28;
            v6 = v29;
          }
          ++v8;
        }
        while (v8 != v6);
        v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
      }
      while (v6);
    }

    v4 = v27;
  }

}

void __54__HMDResidentMesh__buildResidentsWithElection_device___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "enabledResidents");
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "isCurrentDevice", (_QWORD)v13))
        {
          v9 = *(void **)(a1 + 32);
          objc_msgSend(v3, "uuid");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "addObject:", v10);

          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  v11 = *(void **)(a1 + 40);
  objc_msgSend(v3, "uuid");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v4, v12);

}

void __54__HMDResidentMesh__buildResidentsWithElection_device___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(void **)(a1 + 32);
  objc_msgSend(v3, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = objc_msgSend(v4, "containsObject:", v5);

  if ((_DWORD)v4)
  {
    objc_msgSend(v3, "primaryResident");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = (id)objc_msgSend(*(id *)(a1 + 40), "_addResidentStorageResidentDevice:", v6);
    }
    else
    {
      v8 = (void *)MEMORY[0x1D17BA0A0]();
      v9 = *(id *)(a1 + 40);
      HMFGetOSLogHandle();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "uuid");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = 138543618;
        v14 = v11;
        v15 = 2114;
        v16 = v12;
        _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_INFO, "%{public}@Could not create resident storage for home %{public}@: no primary resident", (uint8_t *)&v13, 0x16u);

      }
      objc_autoreleasePoolPop(v8);
    }

  }
}

void __54__HMDResidentMesh__buildResidentsWithElection_device___block_invoke_211(id *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  id v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(a1[4], "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1D17BA0A0](objc_msgSend(a1[5], "addObjectsFromArray:", v4));
  v6 = a1[6];
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "na_map:", &__block_literal_global_214);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543874;
    v11 = v8;
    v12 = 2114;
    v13 = v3;
    v14 = 2114;
    v15 = v9;
    _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@Home %{public}@ may use devices: %{public}@", (uint8_t *)&v10, 0x20u);

  }
  objc_autoreleasePoolPop(v5);

}

void __54__HMDResidentMesh__buildResidentsWithElection_device___block_invoke_216(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  id v8;
  char v9;
  void *v10;
  int v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  const char *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  id v30;
  int v31;
  void *v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  id v36;
  __int16 v37;
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "capabilities");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isResidentCapable");

  if ((v5 & 1) != 0)
  {
    objc_msgSend(v3, "device");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "version");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (id)minimumSupportedResidentHomeKitVersion;
    v9 = objc_msgSend(v7, "isAtLeastVersion:", v8);

    if ((v9 & 1) != 0)
    {
      if (!objc_msgSend(*(id *)(a1 + 40), "isEqual:", CFSTR("HMDResidentDeviceManagerRemoveResidentNotification"))|| (objc_msgSend(v3, "device"), v10 = (void *)objc_claimAutoreleasedReturnValue(), v11 = objc_msgSend(v10, "isEqual:", *(_QWORD *)(a1 + 48)), v10, !v11))
      {
        if (objc_msgSend(v3, "isCurrentDevice"))
        {
          if (!objc_msgSend(*(id *)(a1 + 56), "count"))
          {
            v12 = (void *)MEMORY[0x1D17BA0A0]();
            v13 = *(id *)(a1 + 32);
            HMFGetOSLogHandle();
            v14 = objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
              goto LABEL_13;
            HMFGetLogIdentifier();
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v3, "device");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "shortDescription");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v31 = 138543618;
            v32 = v15;
            v33 = 2114;
            v34 = v17;
            v18 = "%{public}@Not adding the current device because it isn't a part of any homes: %{public}@";
            goto LABEL_9;
          }
        }
        else
        {
          objc_msgSend(*(id *)(a1 + 32), "messageDispatcher");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "secureRemoteTransport");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "deviceMonitor");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "unreachableDevices");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "device");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = objc_msgSend(v27, "containsObject:", v28);

          if (v29)
          {
            v12 = (void *)MEMORY[0x1D17BA0A0]();
            v13 = *(id *)(a1 + 32);
            HMFGetOSLogHandle();
            v14 = objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
              goto LABEL_13;
            HMFGetLogIdentifier();
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v3, "device");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "shortDescription");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v31 = 138543618;
            v32 = v15;
            v33 = 2114;
            v34 = v17;
            v18 = "%{public}@Not adding unreachable device: %{public}@";
            goto LABEL_9;
          }
        }
        objc_msgSend(*(id *)(a1 + 64), "addObject:", v3);
        v30 = (id)objc_msgSend(*(id *)(a1 + 32), "_addMeshStorageResidentDevice:", v3);
        goto LABEL_14;
      }
      v12 = (void *)MEMORY[0x1D17BA0A0]();
      v13 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "device");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "shortDescription");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = 138543618;
        v32 = v15;
        v33 = 2114;
        v34 = v17;
        v18 = "%{public}@Received a remove resident notification for device %{public}@";
LABEL_9:
        _os_log_impl(&dword_1CD062000, v14, OS_LOG_TYPE_INFO, v18, (uint8_t *)&v31, 0x16u);

LABEL_12:
      }
    }
    else
    {
      v12 = (void *)MEMORY[0x1D17BA0A0]();
      v13 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "device");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "version");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = (id)minimumSupportedResidentHomeKitVersion;
        objc_msgSend(v3, "device");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "shortDescription");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = 138544130;
        v32 = v15;
        v33 = 2112;
        v34 = v20;
        v35 = 2112;
        v36 = v21;
        v37 = 2114;
        v38 = v23;
        _os_log_impl(&dword_1CD062000, v14, OS_LOG_TYPE_INFO, "%{public}@Device version %@ does not support required resident version %@: %{public}@", (uint8_t *)&v31, 0x2Au);

        goto LABEL_12;
      }
    }
  }
  else
  {
    v12 = (void *)MEMORY[0x1D17BA0A0]();
    v13 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "device");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "shortDescription");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = 138543618;
      v32 = v15;
      v33 = 2114;
      v34 = v17;
      v18 = "%{public}@Device is not resident capable: %{public}@";
      goto LABEL_9;
    }
  }
LABEL_13:

  objc_autoreleasePoolPop(v12);
LABEL_14:

}

uint64_t __54__HMDResidentMesh__buildResidentsWithElection_device___block_invoke_2_212(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "shortDescription");
}

void __41__HMDResidentMesh__deviceIsNotReachable___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  char v5;
  void *v6;
  id v7;
  NSObject *v8;
  _BOOL4 v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "messageDispatcher");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "secureRemoteTransport");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "deviceMonitor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isReachable");

  v6 = (void *)MEMORY[0x1D17BA0A0]();
  v7 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_INFO);
  if ((v5 & 1) != 0)
  {
    if (v9)
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543362;
      v16 = v10;
      _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_INFO, "%{public}@Nope, we came back.", (uint8_t *)&v15, 0xCu);

    }
    objc_autoreleasePoolPop(v6);
  }
  else
  {
    if (v9)
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543362;
      v16 = v11;
      _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_INFO, "%{public}@Lost visibility to the rest of the world. Deconstructing the mesh entirely.", (uint8_t *)&v15, 0xCu);

    }
    objc_autoreleasePoolPop(v6);
    objc_msgSend(*(id *)(a1 + 32), "setResident:", 0);
    objc_msgSend(*(id *)(a1 + 32), "residents");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "removeAllObjects");

    objc_msgSend(*(id *)(a1 + 32), "reachableAccessories");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "removeAllObjects");

    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setPrimaryResidentForHomes:", v14);

  }
}

void __43__HMDResidentMesh___deviceResidentChanged___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  char v21;
  uint8_t v22[128];
  uint8_t buf[4];
  uint64_t v24;
  __int16 v25;
  const char *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v21 = 0;
  objc_msgSend(*(id *)(a1 + 32), "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v3) = objc_msgSend(v2, "hmf_BOOLForKey:isPresent:", CFSTR("kResidentEnabledKey"), &v21);

  if (v21)
    v3 = v3;
  else
    v3 = 1;
  v4 = (void *)MEMORY[0x1D17BA0A0]();
  v5 = *(id *)(a1 + 40);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v7;
    v9 = "NO";
    if ((_DWORD)v3)
      v9 = "YES";
    *(_DWORD *)buf = 138543618;
    v24 = v7;
    v25 = 2080;
    v26 = v9;
    _os_log_impl(&dword_1CD062000, v6, OS_LOG_TYPE_INFO, "%{public}@Got resident changed notification: %s", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v4);
  objc_msgSend(*(id *)(a1 + 40), "resident");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    objc_msgSend(v10, "setEnabled:", v3);
    if ((_DWORD)v3)
      objc_msgSend(*(id *)(a1 + 40), "_checkReachabilityWithTimerActivation:", 0);
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    objc_msgSend(*(id *)(a1 + 40), "reachableAccessories", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v18 != v15)
            objc_enumerationMutation(v12);
          objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * i), "_transmitStatus:", 1);
        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
      }
      while (v14);
    }

  }
}

void __38__HMDResidentMesh___rebuildResidents___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForKey:", CFSTR("HMDDeviceNotificationKey"));
  v3 = (id)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  if (!v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "object");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = v6;
    else
      v7 = 0;
    v3 = v7;

  }
  v8 = (void *)MEMORY[0x1D17BA0A0]();
  v9 = *(id *)(a1 + 40);
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "name");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "UUIDString");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138543874;
    v16 = v11;
    v17 = 2114;
    v18 = v12;
    v19 = 2114;
    v20 = v14;
    _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_INFO, "%{public}@Resident device changed (%{public}@ / %{public}@) notification.", (uint8_t *)&v15, 0x20u);

  }
  objc_autoreleasePoolPop(v8);
  objc_msgSend(*(id *)(a1 + 40), "_buildResidentsWithElection:device:", 0, 0);

}

void __62__HMDResidentMesh___residentDeviceAddedOrUpdatedNotification___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForKey:", CFSTR("HMDResidentDeviceManagerResidentDeviceNotificationKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  v6 = (void *)MEMORY[0x1D17BA0A0]();
  v7 = *(id *)(a1 + 40);
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "name");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "UUIDString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138543874;
    v16 = v9;
    v17 = 2114;
    v18 = v10;
    v19 = 2114;
    v20 = v12;
    _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_INFO, "%{public}@Resident device changed (%{public}@ / %{public}@) notification.", (uint8_t *)&v15, 0x20u);

  }
  objc_autoreleasePoolPop(v6);
  v13 = *(void **)(a1 + 40);
  objc_msgSend(v5, "device");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "_handleAddUpdateOrReachabilityChangeForDevice:", v14);

}

void __55__HMDResidentMesh___residentDeviceRemovedNotification___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
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
  int v17;
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForKey:", CFSTR("HMDResidentDeviceManagerResidentDeviceNotificationKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  v6 = (void *)MEMORY[0x1D17BA0A0]();
  v7 = *(id *)(a1 + 40);
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "name");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "device");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "UUIDString");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 138543874;
    v18 = v9;
    v19 = 2114;
    v20 = v10;
    v21 = 2114;
    v22 = v13;
    _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_INFO, "%{public}@Resident device removed (%{public}@ / %{public}@) notification.", (uint8_t *)&v17, 0x20u);

  }
  objc_autoreleasePoolPop(v6);
  v14 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "name");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "device");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "_buildResidentsWithElection:device:", v15, v16);

}

void __42__HMDResidentMesh___deviceIsNotReachable___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "object");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  v5 = (void *)MEMORY[0x1D17BA0A0]();
  v6 = *(id *)(a1 + 40);
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "UUIDString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543618;
    v12 = v8;
    v13 = 2114;
    v14 = v10;
    _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_INFO, "%{public}@Device %{public}@ is NOT reachable (notification)", (uint8_t *)&v11, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  objc_msgSend(*(id *)(a1 + 40), "_deviceIsNotReachable:", v4);

}

void __39__HMDResidentMesh___deviceIsReachable___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "object");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  v5 = (void *)MEMORY[0x1D17BA0A0]();
  v6 = *(id *)(a1 + 40);
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "UUIDString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543618;
    v12 = v8;
    v13 = 2114;
    v14 = v10;
    _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_INFO, "%{public}@Device %{public}@ is reachable (notification)", (uint8_t *)&v11, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  objc_msgSend(*(id *)(a1 + 40), "_handleAddUpdateOrReachabilityChangeForDevice:", v4);

}

void __54__HMDResidentMesh___accessoryDidUpdateSuspendedState___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "object");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  if (v4)
  {
    v5 = objc_msgSend(v4, "suspendedState");
    v6 = (void *)MEMORY[0x1D17BA0A0]();
    v7 = *(id *)(a1 + 40);
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "uuid");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      HAPAccessorySuspendedStateDescription();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v4, "isReachable"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138544130;
      v14 = v9;
      v15 = 2114;
      v16 = v10;
      v17 = 2112;
      v18 = v11;
      v19 = 2112;
      v20 = v12;
      _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_INFO, "%{public}@Accessory %{public}@ updated its suspended state to: '%@'. Reachable: '%@'", (uint8_t *)&v13, 0x2Au);

    }
    objc_autoreleasePoolPop(v6);
    if (!v5 && (objc_msgSend(v4, "isReachable") & 1) == 0)
      objc_msgSend(*(id *)(a1 + 40), "_removeConnectivityFromDeviceToAccessory:activateTimer:", v4, 1);
  }

}

void __45__HMDResidentMesh___accessoryIsNotReachable___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "object");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  v5 = (void *)MEMORY[0x1D17BA0A0]();
  v6 = *(id *)(a1 + 40);
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "uuid");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543618;
    v11 = v8;
    v12 = 2114;
    v13 = v9;
    _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_INFO, "%{public}@Accessory %{public}@ is NOT reachable (notification)", (uint8_t *)&v10, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  objc_msgSend(*(id *)(a1 + 40), "_removeConnectivityFromDeviceToAccessory:activateTimer:", v4, 1);

}

void __42__HMDResidentMesh___accessoryIsReachable___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "object");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  if (v4)
  {
    v5 = (void *)MEMORY[0x1D17BA0A0]();
    v6 = *(id *)(a1 + 40);
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "uuid");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543618;
      v11 = v8;
      v12 = 2114;
      v13 = v9;
      _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_INFO, "%{public}@Accessory %{public}@ is reachable (notification)", (uint8_t *)&v10, 0x16u);

    }
    objc_autoreleasePoolPop(v5);
    objc_msgSend(*(id *)(a1 + 40), "_addConnectivityFromDeviceToAccessory:activateTimer:", v4, 1);
  }

}

void __55__HMDResidentMesh_initWithHomeManager_residentEnabled___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_buildResidentsWithElection:device:", 0, 0);
  objc_msgSend(*(id *)(a1 + 32), "resident");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "setEnabled:", *(unsigned __int8 *)(a1 + 40));
  }
  else
  {
    v4 = (void *)MEMORY[0x1D17BA0A0]();
    v5 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138543362;
      v9 = v7;
      _os_log_impl(&dword_1CD062000, v6, OS_LOG_TYPE_INFO, "%{public}@We do not have a current device (probably logged out from iCloud).", (uint8_t *)&v8, 0xCu);

    }
    objc_autoreleasePoolPop(v4);
  }

}

+ (id)logCategory
{
  if (logCategory__hmf_once_t95 != -1)
    dispatch_once(&logCategory__hmf_once_t95, &__block_literal_global_288);
  return (id)logCategory__hmf_once_v96;
}

void __30__HMDResidentMesh_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v96;
  logCategory__hmf_once_v96 = v0;

}

@end
