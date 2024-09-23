@implementation HMDResidentMesh

- (HMDResidentMesh)initWithHomeManager:(id)a3 residentEnabled:(BOOL)a4
{
  id v6;
  HMDResidentMesh *v7;
  uint64_t v8;
  NSMutableArray *residents;
  uint64_t v10;
  NSMutableArray *reachableAccessories;
  uint64_t v12;
  NSMutableDictionary *loadMetrics;
  uint64_t v14;
  NSMutableSet *updatedOrAddedDevices;
  uint64_t v16;
  NSUUID *uuid;
  uint64_t v18;
  NSSet *primaryResidentForHomes;
  id v20;
  const char *v21;
  NSObject *v22;
  dispatch_queue_t v23;
  OS_dispatch_queue *workQueue;
  void *v25;
  NSObject *v26;
  id *v27;
  uint64_t v28;
  id v29;
  void *v30;
  void *v31;
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
  _QWORD block[4];
  id *v45;
  BOOL v46;
  objc_super v47;
  void *v48;
  _QWORD v49[2];

  v49[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v47.receiver = self;
  v47.super_class = (Class)HMDResidentMesh;
  v7 = -[HMDResidentMesh init](&v47, sel_init);
  if (v7)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v8 = objc_claimAutoreleasedReturnValue();
    residents = v7->_residents;
    v7->_residents = (NSMutableArray *)v8;

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v10 = objc_claimAutoreleasedReturnValue();
    reachableAccessories = v7->_reachableAccessories;
    v7->_reachableAccessories = (NSMutableArray *)v10;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v12 = objc_claimAutoreleasedReturnValue();
    loadMetrics = v7->_loadMetrics;
    v7->_loadMetrics = (NSMutableDictionary *)v12;

    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v14 = objc_claimAutoreleasedReturnValue();
    updatedOrAddedDevices = v7->_updatedOrAddedDevices;
    v7->_updatedOrAddedDevices = (NSMutableSet *)v14;

    objc_storeWeak((id *)&v7->_homeManager, v6);
    v16 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", CFSTR("82455554-35AB-4772-B3A4-DCA0F933F5D3"));
    uuid = v7->_uuid;
    v7->_uuid = (NSUUID *)v16;

    objc_msgSend(MEMORY[0x24BDBCF20], "set");
    v18 = objc_claimAutoreleasedReturnValue();
    primaryResidentForHomes = v7->_primaryResidentForHomes;
    v7->_primaryResidentForHomes = (NSSet *)v18;

    HMDispatchQueueNameString();
    v20 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v21 = (const char *)objc_msgSend(v20, "UTF8String");
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = dispatch_queue_create(v21, v22);
    workQueue = v7->_workQueue;
    v7->_workQueue = (OS_dispatch_queue *)v23;

    objc_storeWeak((id *)&v7->_resident, 0);
    objc_msgSend(v6, "messageDispatcher");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)&v7->_messageDispatcher, v25);
    v26 = v7->_workQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __55__HMDResidentMesh_initWithHomeManager_residentEnabled___block_invoke;
    block[3] = &unk_24E7968C8;
    v27 = v7;
    v45 = v27;
    v46 = a4;
    dispatch_sync(v26, block);
    v28 = objc_msgSend(objc_alloc(MEMORY[0x24BE3F298]), "initWithTimeInterval:options:", 1, 2.0);
    v29 = v27[8];
    v27[8] = (id)v28;

    objc_msgSend(v27[8], "setDelegate:", v27);
    objc_msgSend(v27[8], "setDelegateQueue:", v7->_workQueue);
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "addObserver:selector:name:object:", v27, sel___residentDeviceAddedOrUpdatedNotification_, CFSTR("HMDResidentDeviceManagerAddResidentNotification"), 0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "addObserver:selector:name:object:", v27, sel___residentDeviceAddedOrUpdatedNotification_, CFSTR("HMDResidentDeviceManagerUpdateResidentNotification"), 0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "addObserver:selector:name:object:", v27, sel___residentDeviceRemovedNotification_, CFSTR("HMDResidentDeviceManagerRemoveResidentNotification"), 0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "addObserver:selector:name:object:", v27, sel___rebuildResidents_, CFSTR("HMDAccountAddedDeviceNotification"), 0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "addObserver:selector:name:object:", v27, sel___rebuildResidents_, CFSTR("HMDDeviceUpdatedNotification"), 0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "addObserver:selector:name:object:", v27, sel___rebuildResidents_, CFSTR("HMDAccountRemovedDeviceNotification"), 0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "addObserver:selector:name:object:", v27, sel___deviceResidentChanged_, CFSTR("HMDHomeManagerResidentEnabledChangedNotification"), 0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "addObserver:selector:name:object:", v27, sel___deviceIsNotReachable_, CFSTR("HMDRemoteDeviceIsNotReachableNotification"), 0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "addObserver:selector:name:object:", v27, sel___deviceIsReachable_, CFSTR("HMDRemoteDeviceIsReachableNotification"), 0);

    +[HMDRemoteMessagePolicy defaultPolicy](HMDMutableRemoteMessagePolicy, "defaultPolicy");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "setRequiresAccountMessage:", 1);
    objc_msgSend(v39, "setRequiresSecureMessage:", 1);
    objc_msgSend(v39, "setTransportRestriction:", -1);
    v40 = (void *)objc_msgSend(v39, "copy");
    v49[0] = v40;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v49, 1);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "registerForMessage:receiver:policies:selector:", CFSTR("kDeviceMeshUpdateRequestKey"), v27, v41, sel__handleMeshUpdateRequestMessage_);

    v48 = v40;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v48, 1);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "registerForMessage:receiver:policies:selector:", CFSTR("kDeviceMeshUpdateKey"), v27, v42, sel__handleMeshUpdateMessage_);

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

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:", self);

  v5.receiver = self;
  v5.super_class = (Class)HMDResidentMesh;
  -[HMDResidentMesh dealloc](&v5, sel_dealloc);
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
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __39__HMDResidentMesh___deviceIsReachable___block_invoke;
  v7[3] = &unk_24E79C268;
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
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __42__HMDResidentMesh___deviceIsNotReachable___block_invoke;
  v7[3] = &unk_24E79C268;
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
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __55__HMDResidentMesh___residentDeviceRemovedNotification___block_invoke;
  v7[3] = &unk_24E79C268;
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
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __62__HMDResidentMesh___residentDeviceAddedOrUpdatedNotification___block_invoke;
  v7[3] = &unk_24E79C268;
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
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __38__HMDResidentMesh___rebuildResidents___block_invoke;
  v7[3] = &unk_24E79C268;
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
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __43__HMDResidentMesh___deviceResidentChanged___block_invoke;
  v7[3] = &unk_24E79C268;
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

  v4 = a3;
  -[HMDResidentMesh workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[HMDResidentMesh devicesChangedTimer](self, "devicesChangedTimer");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6 == v4)
    -[HMDResidentMesh _buildResidentsWithElection:device:](self, "_buildResidentsWithElection:device:", CFSTR("HMDResidentDeviceManagerAddResidentNotification"), 0);
}

- (void)_handleAddUpdateOrReachabilityChangeForDevice:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  if ((objc_msgSend(v6, "isCurrentDevice") & 1) == 0)
  {
    -[HMDResidentMesh updatedOrAddedDevices](self, "updatedOrAddedDevices");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v6);

  }
  -[HMDResidentMesh devicesChangedTimer](self, "devicesChangedTimer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "resume");

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
  void *v43;
  void *v44;
  void *v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _QWORD block[5];
  uint8_t v55[128];
  uint8_t buf[4];
  void *v57;
  __int16 v58;
  void *v59;
  _BYTE v60[128];
  uint64_t v61;

  v61 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (objc_msgSend(v4, "isCurrentDevice"))
  {
    v5 = (void *)MEMORY[0x227676638]();
    v6 = self;
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v57 = v8;
      _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Our device lost visibility to the rest of the world. Setting timeout before pulling the plug.", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v5);
    v9 = dispatch_time(0, 10000000000);
    -[HMDResidentMesh workQueue](v6, "workQueue");
    v10 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __41__HMDResidentMesh__deviceIsNotReachable___block_invoke;
    block[3] = &unk_24E79C240;
    block[4] = v6;
    dispatch_after(v9, v10, block);

  }
  else
  {
    v52 = 0u;
    v53 = 0u;
    v50 = 0u;
    v51 = 0u;
    -[HMDResidentMesh reachableAccessories](self, "reachableAccessories");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v11, "copy");

    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v50, v60, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v51;
      while (2)
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v51 != v15)
            objc_enumerationMutation(v12);
          v17 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * i);
          objc_msgSend(v17, "residentDevice");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "device");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v4, "isEqual:", v19);

          if (v20)
          {
            v21 = (void *)MEMORY[0x227676638]();
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
              v57 = v24;
              v58 = 2114;
              v59 = v25;
              _os_log_impl(&dword_2218F0000, v23, OS_LOG_TYPE_INFO, "%{public}@Removed device %{public}@ from resident storage", buf, 0x16u);

            }
            objc_autoreleasePoolPop(v21);
            -[HMDResidentMesh reachableAccessories](v22, "reachableAccessories");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "removeObject:", v17);

            goto LABEL_17;
          }
        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v50, v60, 16);
        if (v14)
          continue;
        break;
      }
    }
LABEL_17:

    v48 = 0u;
    v49 = 0u;
    v46 = 0u;
    v47 = 0u;
    -[HMDResidentMesh residents](self, "residents", 0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = (void *)objc_msgSend(v27, "copy");

    v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v46, v55, 16);
    if (v29)
    {
      v30 = v29;
      v31 = *(_QWORD *)v47;
      while (2)
      {
        for (j = 0; j != v30; ++j)
        {
          if (*(_QWORD *)v47 != v31)
            objc_enumerationMutation(v28);
          v33 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * j);
          objc_msgSend(v33, "residentDevice");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "device");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v36 = objc_msgSend(v4, "isEqual:", v35);

          if (v36)
          {
            v37 = (void *)MEMORY[0x227676638]();
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
              v57 = v40;
              v58 = 2114;
              v59 = v41;
              _os_log_impl(&dword_2218F0000, v39, OS_LOG_TYPE_INFO, "%{public}@Removed device %{public}@ from mesh storage", buf, 0x16u);

            }
            objc_autoreleasePoolPop(v37);
            -[HMDResidentMesh residents](v38, "residents");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v42, "removeObject:", v33);

            -[HMDResidentMesh updatedOrAddedDevices](v38, "updatedOrAddedDevices");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "residentDevice");
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v44, "device");
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v43, "removeObject:", v45);

            goto LABEL_29;
          }
        }
        v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v46, v55, 16);
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
  uint64_t i;
  void *v28;
  void *v29;
  int v30;
  void *v31;
  void *v32;
  HMDResidentMesh *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  void *v41;
  char v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t j;
  void *v51;
  void *v52;
  char v53;
  void *v54;
  void *v55;
  int v56;
  void *v57;
  HMDResidentMesh *v58;
  NSObject *v59;
  void *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  void *v66;
  HMDResidentMesh *v67;
  NSObject *v68;
  void *v69;
  HMDResidentMesh *v70;
  void *v71;
  void *v72;
  int v73;
  const char *v74;
  uint64_t v75;
  void *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t k;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  HMDResidentMesh *v84;
  int v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t m;
  void *v94;
  void *v95;
  HMDResidentMesh *v96;
  NSObject *v97;
  void *v98;
  void *v99;
  id v100;
  void *v101;
  id v102;
  void *v103;
  id v104;
  int v105;
  void *v106;
  uint64_t v107;
  uint64_t v108;
  void *v109;
  void *v110;
  id v111;
  HMDResidentMesh *v112;
  uint64_t obj;
  id obja;
  void *objb;
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
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  _QWORD v136[4];
  id v137;
  id v138;
  HMDResidentMesh *v139;
  id v140;
  id v141;
  _QWORD v142[4];
  id v143;
  id v144;
  HMDResidentMesh *v145;
  _QWORD v146[4];
  id v147;
  HMDResidentMesh *v148;
  _QWORD v149[4];
  id v150;
  id v151;
  _BYTE v152[128];
  uint8_t v153[128];
  uint8_t buf[4];
  void *v155;
  __int16 v156;
  void *v157;
  __int16 v158;
  const char *v159;
  _BYTE v160[128];
  _BYTE v161[128];
  _BYTE v162[128];
  uint64_t v163;

  v163 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[HMDResidentMesh workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDResidentMesh homeManager](self, "homeManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "homes");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = MEMORY[0x24BDAC760];
  v149[0] = MEMORY[0x24BDAC760];
  v149[1] = 3221225472;
  v149[2] = __54__HMDResidentMesh__buildResidentsWithElection_device___block_invoke;
  v149[3] = &unk_24E788BF0;
  v14 = v9;
  v150 = v14;
  v15 = v10;
  v151 = v15;
  objc_msgSend(v12, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v149);
  v146[0] = v13;
  v146[1] = 3221225472;
  v146[2] = __54__HMDResidentMesh__buildResidentsWithElection_device___block_invoke_2;
  v146[3] = &unk_24E788BF0;
  v16 = v14;
  v147 = v16;
  v148 = self;
  v103 = v12;
  v17 = v12;
  v18 = self;
  objc_msgSend(v17, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v146);
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v142[0] = v13;
  v142[1] = 3221225472;
  v142[2] = __54__HMDResidentMesh__buildResidentsWithElection_device___block_invoke_176;
  v142[3] = &unk_24E788C38;
  v102 = v15;
  v143 = v102;
  v20 = v19;
  v144 = v20;
  v145 = self;
  objc_msgSend(v16, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v142);
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v136[0] = v13;
  v136[1] = 3221225472;
  v136[2] = __54__HMDResidentMesh__buildResidentsWithElection_device___block_invoke_181;
  v136[3] = &unk_24E788C60;
  v104 = v6;
  v137 = v104;
  v100 = v7;
  v138 = v100;
  v139 = self;
  v111 = v16;
  v140 = v111;
  v22 = v21;
  v141 = v22;
  v101 = v20;
  objc_msgSend(v20, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v136);
  -[HMDResidentMesh resident](v18, "resident");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v132 = 0u;
  v133 = 0u;
  v134 = 0u;
  v135 = 0u;
  -[HMDResidentMesh residents](v18, "residents");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (void *)objc_msgSend(v24, "copy");

  v112 = v18;
  obj = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v132, v162, 16);
  v106 = v22;
  if (obj)
  {
    v26 = *(_QWORD *)v133;
    v107 = *(_QWORD *)v133;
    do
    {
      for (i = 0; i != obj; ++i)
      {
        if (*(_QWORD *)v133 != v26)
          objc_enumerationMutation(v25);
        v28 = *(void **)(*((_QWORD *)&v132 + 1) + 8 * i);
        objc_msgSend(v28, "residentDevice");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = objc_msgSend(v29, "isCurrentDevice");

        if (v30)
        {
          if ((objc_msgSend(v28, "isEqual:", v23) & 1) == 0)
          {
            v31 = v25;
            v32 = (void *)MEMORY[0x227676638]();
            v33 = v18;
            HMFGetOSLogHandle();
            v34 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              v109 = v23;
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v28, "residentDevice");
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v36, "device");
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v37, "shortDescription");
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v155 = v35;
              v156 = 2114;
              v157 = v38;
              _os_log_impl(&dword_2218F0000, v34, OS_LOG_TYPE_INFO, "%{public}@Setting resident device to %{public}@", buf, 0x16u);

              v22 = v106;
              v18 = v112;

              v23 = v109;
            }

            objc_autoreleasePoolPop(v32);
            v25 = v31;
            v26 = v107;
          }
          v39 = v28;

          -[HMDResidentMesh loadMetrics](v18, "loadMetrics");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "setMetrics:", v40);

          -[HMDResidentMesh setResident:](v18, "setResident:", v39);
          v23 = v39;
        }
        objc_msgSend(v28, "residentDevice");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = objc_msgSend(v22, "containsObject:", v41);

        if ((v42 & 1) == 0)
        {
          -[HMDResidentMesh residents](v18, "residents");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "removeObject:", v28);

        }
      }
      obj = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v132, v162, 16);
    }
    while (obj);
  }
  v110 = v23;

  v130 = 0u;
  v131 = 0u;
  v128 = 0u;
  v129 = 0u;
  -[HMDResidentMesh reachableAccessories](v18, "reachableAccessories");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = (void *)objc_msgSend(v44, "copy");

  v46 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v128, v161, 16);
  v47 = v111;
  if (v46)
  {
    v48 = v46;
    v49 = *(_QWORD *)v129;
    do
    {
      for (j = 0; j != v48; ++j)
      {
        if (*(_QWORD *)v129 != v49)
          objc_enumerationMutation(v45);
        v51 = *(void **)(*((_QWORD *)&v128 + 1) + 8 * j);
        objc_msgSend(v51, "residentDevice");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        v53 = objc_msgSend(v22, "containsObject:", v52);

        if ((v53 & 1) == 0)
        {
          -[HMDResidentMesh reachableAccessories](v18, "reachableAccessories");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v54, "removeObject:", v51);

        }
      }
      v48 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v128, v161, 16);
    }
    while (v48);
  }

  if ((objc_msgSend(v104, "isEqual:", CFSTR("HMDResidentDeviceManagerAddResidentNotification")) & 1) != 0)
    v105 = 1;
  else
    v105 = objc_msgSend(v104, "isEqual:", CFSTR("HMDResidentDeviceManagerUpdateResidentNotification"));
  -[HMDResidentMesh primaryResidentForHomes](v18, "primaryResidentForHomes");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = objc_msgSend(v111, "isSubsetOfSet:", v55);

  if (!v56 || v105)
  {
    v57 = (void *)MEMORY[0x227676638]();
    v58 = v18;
    HMFGetOSLogHandle();
    v59 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v59, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v155 = v60;
      _os_log_impl(&dword_2218F0000, v59, OS_LOG_TYPE_INFO, "%{public}@Our primary residents list has new items (or some shift in devices happened):", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v57);
    v126 = 0u;
    v127 = 0u;
    v124 = 0u;
    v125 = 0u;
    obja = v111;
    v61 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v124, v160, 16);
    if (v61)
    {
      v62 = v61;
      v63 = *(_QWORD *)v125;
      do
      {
        v64 = 0;
        v108 = v62;
        do
        {
          if (*(_QWORD *)v125 != v63)
            objc_enumerationMutation(obja);
          v65 = *(void **)(*((_QWORD *)&v124 + 1) + 8 * v64);
          v66 = (void *)MEMORY[0x227676638]();
          v67 = v58;
          HMFGetOSLogHandle();
          v68 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v68, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v69 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v65, "UUIDString");
            v70 = v58;
            v71 = (void *)objc_claimAutoreleasedReturnValue();
            -[HMDResidentMesh primaryResidentForHomes](v67, "primaryResidentForHomes");
            v72 = (void *)objc_claimAutoreleasedReturnValue();
            v73 = objc_msgSend(v72, "containsObject:", v65);
            *(_DWORD *)buf = 138543874;
            v74 = " (added)";
            if (v73)
              v74 = "";
            v155 = v69;
            v156 = 2114;
            v157 = v71;
            v158 = 2080;
            v159 = v74;
            _os_log_impl(&dword_2218F0000, v68, OS_LOG_TYPE_INFO, "%{public}@  Home: %{public}@%s", buf, 0x20u);

            v58 = v70;
            v62 = v108;

            v18 = v112;
          }

          objc_autoreleasePoolPop(v66);
          ++v64;
        }
        while (v62 != v64);
        v62 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v124, v160, 16);
      }
      while (v62);
    }

    v122 = 0u;
    v123 = 0u;
    v120 = 0u;
    v121 = 0u;
    -[HMDResidentMesh residents](v58, "residents");
    objb = (void *)objc_claimAutoreleasedReturnValue();
    v75 = objc_msgSend(objb, "countByEnumeratingWithState:objects:count:", &v120, v153, 16);
    v76 = v110;
    v47 = v111;
    if (v75)
    {
      v77 = v75;
      v78 = *(_QWORD *)v121;
      do
      {
        for (k = 0; k != v77; ++k)
        {
          if (*(_QWORD *)v121 != v78)
            objc_enumerationMutation(objb);
          v80 = *(void **)(*((_QWORD *)&v120 + 1) + 8 * k);
          if (v76 != v80 && objc_msgSend(*(id *)(*((_QWORD *)&v120 + 1) + 8 * k), "enabled"))
          {
            -[HMDResidentMesh updatedOrAddedDevices](v58, "updatedOrAddedDevices");
            v81 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v80, "residentDevice");
            v82 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v82, "device");
            v83 = (void *)objc_claimAutoreleasedReturnValue();
            v84 = v58;
            v85 = objc_msgSend(v81, "containsObject:", v83);

            if (v85)
            {
              -[HMDResidentMesh updatedOrAddedDevices](v84, "updatedOrAddedDevices");
              v86 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v80, "residentDevice");
              v87 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v87, "device");
              v88 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v86, "removeObject:", v88);

              v18 = v112;
              v76 = v110;
              v58 = v84;
            }
            else
            {
              v18 = v112;
              v76 = v110;
              v58 = v84;
              if ((v105 & 1) != 0)
                continue;
            }
            objc_msgSend(v80, "_requestStatus");
          }
        }
        v77 = objc_msgSend(objb, "countByEnumeratingWithState:objects:count:", &v120, v153, 16);
      }
      while (v77);
    }

  }
  v118 = 0u;
  v119 = 0u;
  v116 = 0u;
  v117 = 0u;
  -[HMDResidentMesh primaryResidentForHomes](v18, "primaryResidentForHomes");
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  v90 = objc_msgSend(v89, "countByEnumeratingWithState:objects:count:", &v116, v152, 16);
  if (v90)
  {
    v91 = v90;
    v92 = *(_QWORD *)v117;
    do
    {
      for (m = 0; m != v91; ++m)
      {
        if (*(_QWORD *)v117 != v92)
          objc_enumerationMutation(v89);
        v94 = *(void **)(*((_QWORD *)&v116 + 1) + 8 * m);
        if ((objc_msgSend(v47, "containsObject:", v94) & 1) == 0)
        {
          v95 = (void *)MEMORY[0x227676638]();
          v96 = v18;
          HMFGetOSLogHandle();
          v97 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v97, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v98 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v94, "UUIDString");
            v99 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v155 = v98;
            v156 = 2114;
            v157 = v99;
            _os_log_impl(&dword_2218F0000, v97, OS_LOG_TYPE_INFO, "%{public}@  Home: %{public}@ (removed)", buf, 0x16u);

            v18 = v112;
          }

          objc_autoreleasePoolPop(v95);
          v47 = v111;
        }
      }
      v91 = objc_msgSend(v89, "countByEnumeratingWithState:objects:count:", &v116, v152, 16);
    }
    while (v91);
  }

  -[HMDResidentMesh setPrimaryResidentForHomes:](v18, "setPrimaryResidentForHomes:", v47);
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

  v18 = *MEMORY[0x24BDAC8D0];
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

  v20 = *MEMORY[0x24BDAC8D0];
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

  v20 = *MEMORY[0x24BDAC8D0];
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
    v8 = (void *)MEMORY[0x227676638]();
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
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Adding resident device to mesh: %{public}@", (uint8_t *)&v16, 0x16u);

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

  v18 = *MEMORY[0x24BDAC8D0];
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

  v20 = *MEMORY[0x24BDAC8D0];
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
    v8 = (void *)MEMORY[0x227676638]();
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
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Adding resident device to residents list: %{public}@", (uint8_t *)&v16, 0x16u);

    }
    objc_autoreleasePoolPop(v8);
    v7 = -[HMDResidentMeshResidentStorage initWithResidentDevice:owner:]([HMDResidentMeshResidentStorage alloc], "initWithResidentDevice:owner:", v4, v9);
    -[HMDResidentMesh reachableAccessories](v9, "reachableAccessories");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObject:", v7);

  }
  return v7;
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

  v78 = *MEMORY[0x24BDAC8D0];
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
    v28 = (void *)MEMORY[0x227676638]();
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
      _os_log_impl(&dword_2218F0000, v30, OS_LOG_TYPE_DEFAULT, "%{public}@Suppressing message %@ because we are not a resident device.", buf, 0x16u);

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
    v38 = (void *)MEMORY[0x227676638]();
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
    v38 = (void *)MEMORY[0x227676638]();
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
    v38 = (void *)MEMORY[0x227676638]();
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
      _os_log_impl(&dword_2218F0000, v40, OS_LOG_TYPE_DEFAULT, v42, buf, 0x16u);

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

  v45 = (void *)MEMORY[0x227676638]();
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
    _os_log_impl(&dword_2218F0000, v47, OS_LOG_TYPE_INFO, "%{public}@Sending message %{public}@ with payload: %@", buf, 0x20u);

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
  void *v13;
  HMDResidentMesh *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  HMDResidentMesh *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  _QWORD v23[3];
  _QWORD v24[3];
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  uint64_t v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
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
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v7, "enabled", CFSTR("kMeshDeviceStorageEnabled")));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v24[0] = v9;
      v23[1] = CFSTR("kMeshDeviceStorageGenerationCount");
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v8, "generationCount"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v24[1] = v10;
      v23[2] = CFSTR("kMeshDeviceStorageSystemLoad");
      objc_msgSend(v8, "metrics");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v24[2] = v11;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v24, v23, 3);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "respondWithPayload:", v12);

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
        objc_msgSend(v4, "shortDescription");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v26 = v21;
        v27 = 2114;
        v28 = v22;
        v29 = 2114;
        v30 = (uint64_t)v6;
        _os_log_impl(&dword_2218F0000, v20, OS_LOG_TYPE_ERROR, "%{public}@Rejecting message %{public}@ from unknown device: %{public}@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v18);
      objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 2);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "respondWithError:", v9);
    }

  }
  else
  {
    v13 = (void *)MEMORY[0x227676638]();
    v14 = self;
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "shortDescription");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v26 = v16;
      v27 = 2112;
      v28 = v5;
      v29 = 2048;
      v30 = 2;
      v31 = 2114;
      v32 = v17;
      _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_ERROR, "%{public}@Rejecting message with version %@ lower than current version %ld: %{public}@", buf, 0x2Au);

    }
    objc_autoreleasePoolPop(v13);
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 3);
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
  HMDResidentMesh *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  HMDResidentMesh *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  uint64_t v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
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

      v11 = (void *)MEMORY[0x24BDD16E0];
      -[HMDResidentMesh resident](self, "resident", CFSTR("kMeshDeviceStorageEnabled"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "numberWithBool:", objc_msgSend(v12, "enabled"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = v13;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v26, &v25, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "respondWithPayload:", v14);

    }
    else
    {
      v20 = (void *)MEMORY[0x227676638]();
      v21 = self;
      HMFGetOSLogHandle();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "shortDescription");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v28 = v23;
        v29 = 2114;
        v30 = v24;
        v31 = 2114;
        v32 = (uint64_t)v6;
        _os_log_impl(&dword_2218F0000, v22, OS_LOG_TYPE_ERROR, "%{public}@Rejecting message %{public}@ from unknown device: %{public}@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v20);
      objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 2);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "respondWithError:", v12);
    }

  }
  else
  {
    v15 = (void *)MEMORY[0x227676638]();
    v16 = self;
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "shortDescription");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v28 = v18;
      v29 = 2112;
      v30 = v5;
      v31 = 2048;
      v32 = 2;
      v33 = 2114;
      v34 = v19;
      _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_ERROR, "%{public}@Rejecting message with version %@ lower than current version %ld: %{public}@", buf, 0x2Au);

    }
    objc_autoreleasePoolPop(v15);
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "respondWithError:", v6);
  }

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
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDResidentMesh workQueue](self, "workQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __66__HMDResidentMesh_cameraRecordingAnalysisNodesForCameraAccessory___block_invoke;
  block[3] = &unk_24E79BBD0;
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
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __64__HMDResidentMesh_setMetricForCurrentDevice_withValue_isUrgent___block_invoke;
  v13[3] = &unk_24E796150;
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
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  int v18;
  const char *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t j;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  const char *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t k;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  char v48;
  const __CFString *v49;
  HMDResidentMesh *v51;
  id obj;
  id obja;
  void *v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  _QWORD v63[4];
  id v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  _BYTE v69[128];
  _BYTE v70[128];
  _BYTE v71[128];
  uint64_t v72;

  v72 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = self;
  -[HMDResidentMesh residents](self, "residents");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5)
    objc_msgSend(v3, "appendString:", CFSTR("mesh:\n"));
  -[HMDResidentMesh resident](v51, "resident");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v65 = 0u;
  v66 = 0u;
  v67 = 0u;
  v68 = 0u;
  -[HMDResidentMesh residents](v51, "residents");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v65, v71, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v66;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v66 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * i);
        objc_msgSend(v10, "residentDevice");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "device");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v12, "identifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "name");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "appendFormat:", CFSTR("    device: %@ / %@ / "), v13, v14);

        if (v10 == v54)
        {
          -[HMDResidentMesh primaryResidentForHomes](v51, "primaryResidentForHomes");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v15, "count"))
            v16 = CFSTR("primary");
          else
            v16 = CFSTR("local");
          objc_msgSend(v3, "appendString:", v16);

        }
        else
        {
          objc_msgSend(v3, "appendString:", CFSTR("remote"));
        }
        objc_msgSend(v12, "remoteDestinationString");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "appendFormat:", CFSTR(" / %@\n"), v17);

        objc_msgSend(v3, "appendFormat:", CFSTR("     generation: %lu\n"), objc_msgSend(v10, "generationCount"));
        v18 = objc_msgSend(v10, "enabled");
        v19 = "YES";
        if (!v18)
          v19 = "NO";
        objc_msgSend(v3, "appendFormat:", CFSTR("        enabled: %s\n"), v19);
        objc_msgSend(MEMORY[0x24BDD16A8], "string");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "appendFormat:", CFSTR("{"));
        objc_msgSend(v10, "metrics");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v63[0] = MEMORY[0x24BDAC760];
        v63[1] = 3221225472;
        v63[2] = __29__HMDResidentMesh__stateDump__block_invoke;
        v63[3] = &unk_24E79B060;
        v22 = v20;
        v64 = v22;
        objc_msgSend(v21, "enumerateKeysAndObjectsUsingBlock:", v63);

        if (objc_msgSend(v22, "hasSuffix:", CFSTR(",")))
          objc_msgSend(v22, "deleteCharactersInRange:", objc_msgSend(v22, "length") - 1, 1);
        objc_msgSend(v22, "appendFormat:", CFSTR(" }"));
        objc_msgSend(v3, "appendFormat:", CFSTR("      Device metrics: %@ \n"), v22);

      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v65, v71, 16);
    }
    while (v7);
  }

  -[HMDResidentMesh reachableAccessories](v51, "reachableAccessories");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "count");

  if (v24)
    objc_msgSend(v3, "appendString:", CFSTR("remote primary residents:\n"));
  v61 = 0u;
  v62 = 0u;
  v59 = 0u;
  v60 = 0u;
  -[HMDResidentMesh reachableAccessories](v51, "reachableAccessories");
  obja = (id)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v59, v70, 16);
  if (v25)
  {
    v26 = v25;
    v27 = *(_QWORD *)v60;
    do
    {
      for (j = 0; j != v26; ++j)
      {
        if (*(_QWORD *)v60 != v27)
          objc_enumerationMutation(obja);
        v29 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * j);
        objc_msgSend(v29, "residentDevice");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "device");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "identifier");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "device");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "name");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "appendFormat:", CFSTR("    resident: %@ / %@ \n"), v32, v34);

        objc_msgSend(v29, "transmitTimer");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = "YES";
        if (!v35)
          v36 = "NO";
        objc_msgSend(v3, "appendFormat:", CFSTR("         pending: %s\n"), v36);

      }
      v26 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v59, v70, 16);
    }
    while (v26);
  }

  -[HMDResidentMesh primaryResidentForHomes](v51, "primaryResidentForHomes");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = objc_msgSend(v37, "count");

  if (v38)
    objc_msgSend(v3, "appendString:", CFSTR("primary resident for:\n"));
  v57 = 0u;
  v58 = 0u;
  v55 = 0u;
  v56 = 0u;
  -[HMDResidentMesh primaryResidentForHomes](v51, "primaryResidentForHomes");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v55, v69, 16);
  if (v40)
  {
    v41 = v40;
    v42 = *(_QWORD *)v56;
    do
    {
      for (k = 0; k != v41; ++k)
      {
        if (*(_QWORD *)v56 != v42)
          objc_enumerationMutation(v39);
        objc_msgSend(*(id *)(*((_QWORD *)&v55 + 1) + 8 * k), "UUIDString");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "appendFormat:", CFSTR("    %@\n"), v44);

      }
      v41 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v55, v69, 16);
    }
    while (v41);
  }

  if (!v54)
  {
    v49 = CFSTR("we do not have a resident device (either not logged into iCloud or have reachability issues).");
    goto LABEL_44;
  }
  -[HMDResidentMesh messageDispatcher](v51, "messageDispatcher");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "secureRemoteTransport");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "deviceMonitor");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = objc_msgSend(v47, "isReachable");

  if ((v48 & 1) == 0)
  {
    v49 = CFSTR("we are about to go unreachable in the near future unless we get network back.");
LABEL_44:
    objc_msgSend(v3, "appendString:", v49);
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
  v10 = __Block_byref_object_copy__144264;
  v11 = __Block_byref_object_dispose__144265;
  v12 = 0;
  -[HMDResidentMesh workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __28__HMDResidentMesh_stateDump__block_invoke;
  v6[3] = &unk_24E79B698;
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

  v3 = objc_alloc(MEMORY[0x24BE3F1B8]);
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

- (NSMutableSet)updatedOrAddedDevices
{
  return self->_updatedOrAddedDevices;
}

- (void)setUpdatedOrAddedDevices:(id)a3
{
  objc_storeStrong((id *)&self->_updatedOrAddedDevices, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updatedOrAddedDevices, 0);
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

uint64_t __29__HMDResidentMesh__stateDump__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR(" %@:%@,"), a2, a3);
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

  v49 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x227676638]();
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
    _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_INFO, "%{public}@Setting local metric with key: %@, value: %@", buf, 0x20u);

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
              v25 = (void *)MEMORY[0x227676638]();
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
                  _os_log_impl(&dword_2218F0000, v27, OS_LOG_TYPE_INFO, "%{public}@Immediately transmitting updated metrics", buf, 0xCu);

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
                  _os_log_impl(&dword_2218F0000, v27, OS_LOG_TYPE_INFO, "%{public}@Scheduling transmission of updated metrics", buf, 0xCu);

                }
                objc_autoreleasePoolPop(v25);
                objc_msgSend(v21, "_transmitAfter:", 10.0);
              }
            }

          }
          else
          {
            v30 = (void *)MEMORY[0x227676638]();
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
              _os_log_impl(&dword_2218F0000, v32, OS_LOG_TYPE_INFO, "%{public}@Could not set metric for current device for home %{public}@: no primary resident", buf, 0x16u);

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

  v29 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "residents");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "mutableCopy");

  v4 = (void *)MEMORY[0x24BDBCF20];
  objc_msgSend(*(id *)(a1 + 40), "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "residentDeviceManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "availableResidentDevices");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWithArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v26[0] = MEMORY[0x24BDAC760];
  v26[1] = 3221225472;
  v26[2] = __66__HMDResidentMesh_cameraRecordingAnalysisNodesForCameraAccessory___block_invoke_2;
  v26[3] = &unk_24E788C88;
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

  v18 = *MEMORY[0x24BDAC8D0];
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

  v17 = *MEMORY[0x24BDAC8D0];
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
      v8 = (void *)MEMORY[0x227676638]();
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
        _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Could not create resident storage for home %{public}@: no primary resident", (uint8_t *)&v13, 0x16u);

      }
      objc_autoreleasePoolPop(v8);
    }

  }
}

void __54__HMDResidentMesh__buildResidentsWithElection_device___block_invoke_176(id *a1, void *a2)
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

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(a1[4], "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x227676638](objc_msgSend(a1[5], "addObjectsFromArray:", v4));
  v6 = a1[6];
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "na_map:", &__block_literal_global_179);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543874;
    v11 = v8;
    v12 = 2114;
    v13 = v3;
    v14 = 2114;
    v15 = v9;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@Home %{public}@ may use devices: %{public}@", (uint8_t *)&v10, 0x20u);

  }
  objc_autoreleasePoolPop(v5);

}

void __54__HMDResidentMesh__buildResidentsWithElection_device___block_invoke_181(uint64_t a1, void *a2)
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
  const char *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  id v19;
  int v20;
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "isEqual:", CFSTR("HMDResidentDeviceManagerRemoveResidentNotification")))
  {
    objc_msgSend(v3, "device");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isEqual:", *(_QWORD *)(a1 + 40));

    if (v5)
    {
      v6 = (void *)MEMORY[0x227676638]();
      v7 = *(id *)(a1 + 48);
      HMFGetOSLogHandle();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "device");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "shortDescription");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = 138543618;
        v21 = v9;
        v22 = 2114;
        v23 = v11;
        v12 = "%{public}@Received a remove resident notification for device %{public}@";
LABEL_12:
        _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_INFO, v12, (uint8_t *)&v20, 0x16u);

        goto LABEL_13;
      }
      goto LABEL_13;
    }
  }
  if (!objc_msgSend(v3, "isCurrentDevice"))
  {
    objc_msgSend(*(id *)(a1 + 48), "messageDispatcher");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "secureRemoteTransport");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "deviceMonitor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "unreachableDevices");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "device");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v16, "containsObject:", v17);

    if (v18)
    {
      v6 = (void *)MEMORY[0x227676638]();
      v7 = *(id *)(a1 + 48);
      HMFGetOSLogHandle();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "device");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "shortDescription");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = 138543618;
        v21 = v9;
        v22 = 2114;
        v23 = v11;
        v12 = "%{public}@Not adding unreachable device: %{public}@";
        goto LABEL_12;
      }
      goto LABEL_13;
    }
LABEL_14:
    objc_msgSend(*(id *)(a1 + 64), "addObject:", v3);
    v19 = (id)objc_msgSend(*(id *)(a1 + 48), "_addMeshStorageResidentDevice:", v3);
    goto LABEL_15;
  }
  if (objc_msgSend(*(id *)(a1 + 56), "count"))
    goto LABEL_14;
  v6 = (void *)MEMORY[0x227676638]();
  v7 = *(id *)(a1 + 48);
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "device");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "shortDescription");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 138543618;
    v21 = v9;
    v22 = 2114;
    v23 = v11;
    v12 = "%{public}@Not adding the current device because it isn't a part of any homes: %{public}@";
    goto LABEL_12;
  }
LABEL_13:

  objc_autoreleasePoolPop(v6);
LABEL_15:

}

uint64_t __54__HMDResidentMesh__buildResidentsWithElection_device___block_invoke_2_177(uint64_t a1, void *a2)
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

  v17 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "messageDispatcher");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "secureRemoteTransport");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "deviceMonitor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isReachable");

  v6 = (void *)MEMORY[0x227676638]();
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
      _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_INFO, "%{public}@Nope, we came back.", (uint8_t *)&v15, 0xCu);

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
      _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_INFO, "%{public}@Lost visibility to the rest of the world. Deconstructing the mesh entirely.", (uint8_t *)&v15, 0xCu);

    }
    objc_autoreleasePoolPop(v6);
    objc_msgSend(*(id *)(a1 + 32), "setResident:", 0);
    objc_msgSend(*(id *)(a1 + 32), "residents");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "removeAllObjects");

    objc_msgSend(*(id *)(a1 + 32), "reachableAccessories");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "removeAllObjects");

    objc_msgSend(MEMORY[0x24BDBCF20], "set");
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

  v27 = *MEMORY[0x24BDAC8D0];
  v21 = 0;
  objc_msgSend(*(id *)(a1 + 32), "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v3) = objc_msgSend(v2, "hmf_BOOLForKey:isPresent:", CFSTR("kResidentEnabledKey"), &v21);

  if (v21)
    v3 = v3;
  else
    v3 = 1;
  v4 = (void *)MEMORY[0x227676638]();
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
    _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_INFO, "%{public}@Got resident changed notification: %s", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v4);
  objc_msgSend(*(id *)(a1 + 40), "resident");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    objc_msgSend(v10, "setEnabled:", v3);
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

  v21 = *MEMORY[0x24BDAC8D0];
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
  v8 = (void *)MEMORY[0x227676638]();
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
    _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Resident device changed (%{public}@ / %{public}@) notification.", (uint8_t *)&v15, 0x20u);

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

  v21 = *MEMORY[0x24BDAC8D0];
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

  v6 = (void *)MEMORY[0x227676638]();
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
    _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_INFO, "%{public}@Resident device changed (%{public}@ / %{public}@) notification.", (uint8_t *)&v15, 0x20u);

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

  v23 = *MEMORY[0x24BDAC8D0];
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

  v6 = (void *)MEMORY[0x227676638]();
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
    _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_INFO, "%{public}@Resident device removed (%{public}@ / %{public}@) notification.", (uint8_t *)&v17, 0x20u);

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

  v15 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "object");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  v5 = (void *)MEMORY[0x227676638]();
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
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Device %{public}@ is NOT reachable (notification)", (uint8_t *)&v11, 0x16u);

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

  v15 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "object");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  v5 = (void *)MEMORY[0x227676638]();
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
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Device %{public}@ is reachable (notification)", (uint8_t *)&v11, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  objc_msgSend(*(id *)(a1 + 40), "_handleAddUpdateOrReachabilityChangeForDevice:", v4);

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

  v10 = *MEMORY[0x24BDAC8D0];
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
      _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_INFO, "%{public}@We do not have a current device (probably logged out from iCloud).", (uint8_t *)&v8, 0xCu);

    }
    objc_autoreleasePoolPop(v4);
  }

}

+ (id)logCategory
{
  if (logCategory__hmf_once_t62_144380 != -1)
    dispatch_once(&logCategory__hmf_once_t62_144380, &__block_literal_global_234_144381);
  return (id)logCategory__hmf_once_v63_144382;
}

void __30__HMDResidentMesh_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v63_144382;
  logCategory__hmf_once_v63_144382 = v0;

}

@end
