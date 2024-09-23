@implementation HMDHomeNFCReaderKeyManager

- (HMDHomeNFCReaderKeyManager)initWithUUID:(id)a3 workQueue:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  HMDHomeWalletDataSource *v10;
  HMDHomeNFCReaderKeyManager *v11;

  v6 = (void *)MEMORY[0x24BE1BC08];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "systemStore");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_alloc_init(HMDHomeWalletDataSource);
  v11 = -[HMDHomeNFCReaderKeyManager initWithUUID:workQueue:keychainStore:dataSource:](self, "initWithUUID:workQueue:keychainStore:dataSource:", v8, v7, v9, v10);

  return v11;
}

- (HMDHomeNFCReaderKeyManager)initWithUUID:(id)a3 workQueue:(id)a4 keychainStore:(id)a5 dataSource:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  HMDHomeNFCReaderKeyManager *v14;
  uint64_t v15;
  NSUUID *uuid;
  HMDHomeWalletKeyAccessoryManager *v17;
  HMDHomeWalletKeyAccessoryManager *accessoryManager;
  uint64_t v19;
  NSMutableSet *keyIdentifiersAlreadyUpdated;
  objc_super v22;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v22.receiver = self;
  v22.super_class = (Class)HMDHomeNFCReaderKeyManager;
  v14 = -[HMDHomeNFCReaderKeyManager init](&v22, sel_init);
  if (v14)
  {
    v15 = objc_msgSend(v10, "copy");
    uuid = v14->_uuid;
    v14->_uuid = (NSUUID *)v15;

    objc_storeStrong((id *)&v14->_workQueue, a4);
    objc_storeStrong((id *)&v14->_keychainStore, a5);
    objc_storeStrong((id *)&v14->_dataSource, a6);
    v17 = -[HMDHomeWalletKeyAccessoryManager initWithUUID:workQueue:]([HMDHomeWalletKeyAccessoryManager alloc], "initWithUUID:workQueue:", v10, v11);
    accessoryManager = v14->_accessoryManager;
    v14->_accessoryManager = v17;

    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v19 = objc_claimAutoreleasedReturnValue();
    keyIdentifiersAlreadyUpdated = v14->_keyIdentifiersAlreadyUpdated;
    v14->_keyIdentifiersAlreadyUpdated = (NSMutableSet *)v19;

  }
  return v14;
}

- (void)configureWithHome:(id)a3
{
  id v4;
  void *v5;
  HMDHomeNFCReaderKeyManager *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  HMDHomeNFCReaderKeyManager *v13;
  NSObject *v14;
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
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  _QWORD v31[2];
  _QWORD v32[2];
  _QWORD v33[2];
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  id v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x227676638]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v35 = v8;
    v36 = 2112;
    v37 = v4;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Configuring with home: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  -[HMDHomeNFCReaderKeyManager setHome:](v6, "setHome:", v4);
  objc_msgSend(v4, "msgDispatcher");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDHomeNFCReaderKeyManager setMessageDispatcher:](v6, "setMessageDispatcher:", v9);

  -[HMDHomeNFCReaderKeyManager dataSource](v6, "dataSource");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isResidentCapable");

  if (v11)
  {
    v12 = (void *)MEMORY[0x227676638]();
    v13 = v6;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v35 = v15;
      _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_INFO, "%{public}@Registering for messages", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v12);
    +[HMDUserMessagePolicy userMessagePolicyWithHome:userPrivilege:remoteAccessRequired:](HMDUserMessagePolicy, "userMessagePolicyWithHome:userPrivilege:remoteAccessRequired:", v4, 4, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMDRemoteMessagePolicy defaultSecurePolicy](HMDMutableRemoteMessagePolicy, "defaultSecurePolicy");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setRoles:", objc_msgSend(v17, "roles") | 4);
    -[HMDHomeNFCReaderKeyManager messageDispatcher](v13, "messageDispatcher");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v33[0] = v16;
    v33[1] = v17;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v33, 2);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "registerForMessage:receiver:policies:selector:", CFSTR("HMDHomeFetchOrCreateNFCReaderKeyMessage"), v13, v19, sel_handleFetchOrCreateReaderKeyMessage_);

    -[HMDHomeNFCReaderKeyManager messageDispatcher](v13, "messageDispatcher");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v32[0] = v16;
    v32[1] = v17;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v32, 2);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "registerForMessage:receiver:policies:selector:", CFSTR("HMDHomeCreateKeychainItemForNFCReaderKeyMessage"), v13, v21, sel_handleCreateKeychainItemForReaderKeyMessage_);

    -[HMDHomeNFCReaderKeyManager messageDispatcher](v13, "messageDispatcher");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v31[0] = v16;
    v31[1] = v17;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v31, 2);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "registerForMessage:receiver:policies:selector:", CFSTR("HMDHomeDeleteKeychainItemForNFCReaderKeyMessage"), v13, v23, sel_handleDeleteKeychainItemForNFCReaderKey_);

  }
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "homeManager");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "addObserver:selector:name:object:", v6, sel_handleHomeRemovedNotification_, CFSTR("HMDHomeRemovedNotification"), v25);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = *MEMORY[0x24BE1B8B8];
  -[HMDHomeNFCReaderKeyManager keychainStore](v6, "keychainStore");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "addObserver:selector:name:object:", v6, sel_handleSystemKeychainStoreUpdatedNotification_, v27, v28);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "addObserver:selector:name:object:", v6, sel_handleHomeDidUpdateNFCReaderKeyNotification_, CFSTR("HMDHomeDidUpdateNFCReaderKeyNotification"), v4);

  -[HMDHomeNFCReaderKeyManager accessoryManager](v6, "accessoryManager");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "configureWithHome:", v4);

}

- (void)handleDeleteKeychainItemForNFCReaderKey:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  HMDHomeNFCReaderKeyManager *v8;
  NSObject *v9;
  void *v10;
  id v11;
  _QWORD v12[5];
  id v13;
  uint8_t buf[4];
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDHomeNFCReaderKeyManager workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  objc_msgSend(v4, "flow");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x227676638]();
  v8 = self;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v15 = v10;
    _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@Handling message to delete keychain item for nfc reader key", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v7);
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __70__HMDHomeNFCReaderKeyManager_handleDeleteKeychainItemForNFCReaderKey___block_invoke;
  v12[3] = &unk_24E79BCC8;
  v12[4] = v8;
  v13 = v4;
  v11 = v4;
  -[HMDHomeNFCReaderKeyManager deleteKeychainItemForNFCReaderKeyWithFlow:completion:](v8, "deleteKeychainItemForNFCReaderKeyWithFlow:completion:", v6, v12);

}

- (void)handleFetchOrCreateReaderKeyMessage:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  HMDHomeNFCReaderKeyManager *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDHomeNFCReaderKeyManager workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  objc_msgSend(v4, "flow");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x227676638]();
  v8 = self;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "UUID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v18 = v10;
    v19 = 2112;
    v20 = v11;
    v21 = 2112;
    v22 = v4;
    _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Handling message to fetch or create reader key: %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v7);
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __66__HMDHomeNFCReaderKeyManager_handleFetchOrCreateReaderKeyMessage___block_invoke;
  v14[3] = &unk_24E78C660;
  v14[4] = v8;
  v15 = v6;
  v16 = v4;
  v12 = v4;
  v13 = v6;
  -[HMDHomeNFCReaderKeyManager fetchOrCreateReaderKeyWithRequiresPrivateKey:flow:completion:](v8, "fetchOrCreateReaderKeyWithRequiresPrivateKey:flow:completion:", 0, v13, v14);

}

- (void)handleCreateKeychainItemForReaderKeyMessage:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  HMDHomeNFCReaderKeyManager *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  HMDHomeNFCReaderKeyManager *v20;
  NSObject *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  HMDHomeNFCReaderKeyManager *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  _QWORD v38[4];
  id v39;
  id v40;
  const __CFString *v41;
  void *v42;
  uint8_t buf[4];
  void *v44;
  __int16 v45;
  void *v46;
  __int16 v47;
  id v48;
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDHomeNFCReaderKeyManager workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  objc_msgSend(v4, "flow");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x227676638]();
  v8 = self;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "UUID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v44 = v10;
    v45 = 2112;
    v46 = v11;
    v47 = 2112;
    v48 = v4;
    _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Handling message to create keychain item for reader key: %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v7);
  -[HMDHomeNFCReaderKeyManager home](v8, "home");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
  {
    objc_msgSend(v12, "nfcReaderKey");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "identifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      +[HMDHomeNFCReaderKey keychainItemAccountAttributeValueWithHome:keyIdentifier:](HMDHomeNFCReaderKey, "keychainItemAccountAttributeValueWithHome:keyIdentifier:", v13, v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = 0;
      -[HMDHomeNFCReaderKeyManager readerKeyWithKeychainItemIdentifier:error:flow:](v8, "readerKeyWithKeychainItemIdentifier:error:flow:", v16, &v40, v6);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v40;
      v19 = (void *)MEMORY[0x227676638]();
      v20 = v8;
      HMFGetOSLogHandle();
      v21 = objc_claimAutoreleasedReturnValue();
      v22 = v21;
      if (v17)
      {
        if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v36 = v16;
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "UUID");
          v34 = v19;
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v44 = v23;
          v45 = 2112;
          v46 = v24;
          v47 = 2112;
          v48 = v17;
          _os_log_impl(&dword_2218F0000, v22, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Keychain item is already created for reader key: %@", buf, 0x20u);

          v19 = v34;
          v16 = v36;
        }

        objc_autoreleasePoolPop(v19);
        v41 = CFSTR("HMDHomeCreateKeychainItemForNFCReaderKeyMessageKeyReaderKey");
        objc_msgSend(v17, "externalRepresentation");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = v25;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v42, &v41, 1);
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v4, "respondWithPayload:", v26);
      }
      else
      {
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v35 = v19;
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "UUID");
          v37 = v16;
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v44 = v32;
          v45 = 2112;
          v46 = v33;
          v47 = 2112;
          v48 = v18;
          _os_log_impl(&dword_2218F0000, v22, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to fetch keychain item for nfc reader key: %@", buf, 0x20u);

          v16 = v37;
          v19 = v35;
        }

        objc_autoreleasePoolPop(v19);
        objc_msgSend(v4, "respondWithError:", v18);
      }

    }
    else
    {
      v38[0] = MEMORY[0x24BDAC760];
      v38[1] = 3221225472;
      v38[2] = __74__HMDHomeNFCReaderKeyManager_handleCreateKeychainItemForReaderKeyMessage___block_invoke;
      v38[3] = &unk_24E78C688;
      v39 = v4;
      -[HMDHomeNFCReaderKeyManager createReaderKeyKeychainItemForHome:flow:completion:](v8, "createReaderKeyKeychainItemForHome:flow:completion:", v13, v6, v38);
      v18 = v39;
    }

  }
  else
  {
    v27 = (void *)MEMORY[0x227676638]();
    v28 = v8;
    HMFGetOSLogHandle();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "UUID");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v44 = v30;
      v45 = 2112;
      v46 = v31;
      _os_log_impl(&dword_2218F0000, v29, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] I am not configured with a home", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v27);
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "respondWithError:", v15);
  }

}

- (void)fetchOrCreateReaderKeyOnQueueWithRequiresPrivateKey:(BOOL)a3 flow:(id)a4 completion:(id)a5
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

  v8 = a4;
  v9 = a5;
  -[HMDHomeNFCReaderKeyManager workQueue](self, "workQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __98__HMDHomeNFCReaderKeyManager_fetchOrCreateReaderKeyOnQueueWithRequiresPrivateKey_flow_completion___block_invoke;
  v13[3] = &unk_24E7962D8;
  v16 = a3;
  v13[4] = self;
  v14 = v8;
  v15 = v9;
  v11 = v9;
  v12 = v8;
  dispatch_async(v10, v13);

}

- (void)fetchOrCreateReaderKeyWithRequiresPrivateKey:(BOOL)a3 flow:(id)a4 completion:(id)a5
{
  id v8;
  void (**v9)(id, void *, _QWORD);
  NSObject *v10;
  void *v11;
  HMDHomeNFCReaderKeyManager *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  HMDHomeNFCReaderKeyManager *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  HMDHomeNFCReaderKeyManager *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  HMDHomeNFCReaderKeyManager *v35;
  NSObject *v36;
  _BOOL4 v37;
  void *v38;
  void *v39;
  void *v40;
  HMDHomeNFCReaderKeyManager *v41;
  NSObject *v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  HMDHomeNFCReaderKeyManager *v55;
  NSObject *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  id v61;
  void *v62;
  NSObject *v63;
  void *v64;
  void *v65;
  void *v66;
  void *context;
  void *v68;
  HMDHomeNFCReaderKeyManager *v69;
  void *v70;
  void *v71;
  id v72;
  uint8_t buf[4];
  void *v74;
  __int16 v75;
  void *v76;
  __int16 v77;
  void *v78;
  __int16 v79;
  void *v80;
  __int16 v81;
  id v82;
  uint64_t v83;

  v83 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  v9 = (void (**)(id, void *, _QWORD))a5;
  -[HMDHomeNFCReaderKeyManager workQueue](self, "workQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v10);

  v11 = (void *)MEMORY[0x227676638]();
  v12 = self;
  HMFGetOSLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "UUID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    HMFBooleanToString();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v74 = v14;
    v75 = 2112;
    v76 = v15;
    v77 = 2112;
    v78 = v16;
    _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Fetch or create reader key with requiresPrivateKey: %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v11);
  -[HMDHomeNFCReaderKeyManager home](v12, "home");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    -[HMDHomeNFCReaderKeyManager dataSource](v12, "dataSource");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "isWatch");

    objc_msgSend(v17, "currentUser");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "nfcReaderKey");
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = (void *)v21;
    if (((v19 & 1) != 0 || !a3) && v21)
    {
      v23 = (void *)MEMORY[0x227676638]();
      v24 = v12;
      HMFGetOSLogHandle();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "UUID");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v74 = v26;
        v75 = 2112;
        v76 = v27;
        v77 = 2112;
        v78 = v22;
        _os_log_impl(&dword_2218F0000, v25, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Current device is watch or caller does not requires private key, fetched nfc reader key from home graph: %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v23);
      v9[2](v9, v22, 0);
      goto LABEL_23;
    }
    if ((objc_msgSend(v20, "isAdministrator") & 1) != 0)
    {
      v33 = objc_msgSend(v20, "privilege");
      v34 = (void *)MEMORY[0x227676638]();
      v35 = v12;
      HMFGetOSLogHandle();
      v36 = objc_claimAutoreleasedReturnValue();
      v37 = os_log_type_enabled(v36, OS_LOG_TYPE_INFO);
      if (v33 == 4)
      {
        if (v37)
        {
          HMFGetLogIdentifier();
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "UUID");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v74 = v38;
          v75 = 2112;
          v76 = v39;
          _os_log_impl(&dword_2218F0000, v36, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Current user is shared admin, sending request to resident to create nfc reader key", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v34);
        -[HMDHomeNFCReaderKeyManager requestPrimaryResidentToFetchOrCreateReaderKeyWithFlow:completion:](v35, "requestPrimaryResidentToFetchOrCreateReaderKeyWithFlow:completion:", v8, v9);
        goto LABEL_23;
      }
      if (!v19)
      {
        if (v37)
        {
          HMFGetLogIdentifier();
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "UUID");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v74 = v50;
          v75 = 2112;
          v76 = v51;
          _os_log_impl(&dword_2218F0000, v36, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Current user is owner, fetching or creating nfc reader key from keychain", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v34);
        objc_msgSend(v17, "nfcReaderKey");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v52, "identifier");
        v47 = (void *)objc_claimAutoreleasedReturnValue();

        if (v47)
        {
          +[HMDHomeNFCReaderKey keychainItemAccountAttributeValueWithHome:keyIdentifier:](HMDHomeNFCReaderKey, "keychainItemAccountAttributeValueWithHome:keyIdentifier:", v17, v47);
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          v54 = (void *)MEMORY[0x227676638]();
          v55 = v35;
          HMFGetOSLogHandle();
          v56 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v56, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v68 = v54;
            v57 = v53;
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "UUID");
            v70 = v47;
            v59 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138544130;
            v74 = v58;
            v75 = 2112;
            v76 = v59;
            v77 = 2112;
            v78 = v57;
            v79 = 2112;
            v80 = v22;
            _os_log_impl(&dword_2218F0000, v56, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Looking for key chain item with identifier: %@ for reader key: %@", buf, 0x2Au);

            v47 = v70;
            v53 = v57;
            v54 = v68;
          }

          objc_autoreleasePoolPop(v54);
          v72 = 0;
          -[HMDHomeNFCReaderKeyManager readerKeyWithKeychainItemIdentifier:error:flow:](v55, "readerKeyWithKeychainItemIdentifier:error:flow:", v53, &v72, v8);
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          v61 = v72;
          if (v60)
          {
            v9[2](v9, v60, 0);
          }
          else
          {
            context = (void *)MEMORY[0x227676638]();
            v69 = v55;
            HMFGetOSLogHandle();
            v63 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
            {
              HMFGetLogIdentifier();
              v71 = v47;
              v64 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v8, "UUID");
              v66 = v53;
              v65 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138544386;
              v74 = v64;
              v75 = 2112;
              v76 = v65;
              v77 = 2112;
              v78 = v66;
              v79 = 2112;
              v80 = v22;
              v81 = 2112;
              v82 = v61;
              _os_log_impl(&dword_2218F0000, v63, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to fetch keychain item with identifier: %@ for nfc reader key %@:%@", buf, 0x34u);

              v53 = v66;
              v47 = v71;
            }

            objc_autoreleasePoolPop(context);
            ((void (**)(id, void *, id))v9)[2](v9, 0, v61);
          }

        }
        else
        {
          -[HMDHomeNFCReaderKeyManager primaryResidentDevice](v35, "primaryResidentDevice");
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          v61 = v62;
          if (v62 && (objc_msgSend(v62, "isCurrentDevice") & 1) == 0)
            -[HMDHomeNFCReaderKeyManager requestDevice:toCreateKeychainItemForReaderKeyWithFlow:completion:](v35, "requestDevice:toCreateKeychainItemForReaderKeyWithFlow:completion:", v61, v8, v9);
          else
            -[HMDHomeNFCReaderKeyManager createReaderKeyKeychainItemForHome:flow:completion:](v35, "createReaderKeyKeychainItemForHome:flow:completion:", v17, v8, v9);
        }

        goto LABEL_22;
      }
      if (v37)
      {
        HMFGetLogIdentifier();
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "UUID");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v74 = v48;
        v75 = 2112;
        v76 = v49;
        _os_log_impl(&dword_2218F0000, v36, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Current user is owner. Fetch or create reader key from keychain is not supported on watch", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v34);
      v45 = (void *)MEMORY[0x24BDD1540];
      v46 = 48;
    }
    else
    {
      v40 = (void *)MEMORY[0x227676638]();
      v41 = v12;
      HMFGetOSLogHandle();
      v42 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "UUID");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v74 = v43;
        v75 = 2112;
        v76 = v44;
        _os_log_impl(&dword_2218F0000, v42, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Current user is not admin and home key doesn't exist in home graph, returning nil", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v40);
      v45 = (void *)MEMORY[0x24BDD1540];
      v46 = 2;
    }
    objc_msgSend(v45, "hmErrorWithCode:", v46);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, void *, void *))v9)[2](v9, 0, v47);
LABEL_22:

LABEL_23:
    goto LABEL_24;
  }
  v28 = (void *)MEMORY[0x227676638]();
  v29 = v12;
  HMFGetOSLogHandle();
  v30 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "UUID");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v74 = v31;
    v75 = 2112;
    v76 = v32;
    _os_log_impl(&dword_2218F0000, v30, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to create reader key, home is nil", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v28);
  objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", -1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(id, void *, void *))v9)[2](v9, 0, v20);
LABEL_24:

}

- (id)fetchOrCreateReaderKeyForPairingWithFlow:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  HMDHomeNFCReaderKeyManager *v7;
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
  HMDHomeNFCReaderKeyManager *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  HMDHomeNFCReaderKeyManager *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  HMDHomeNFCReaderKeyManager *v35;
  NSObject *v36;
  void *v37;
  void *v38;
  void *v39;
  HMDHomeNFCReaderKeyManager *v40;
  NSObject *v41;
  void *v42;
  void *v43;
  void *v44;
  HMDHomeNFCReaderKeyManager *v45;
  NSObject *v46;
  void *v47;
  void *v48;
  void *v49;
  HMDHomeNFCReaderKeyManager *v50;
  NSObject *v51;
  void *v52;
  HMDAssertionLogEvent *v53;
  void *v54;
  void *v56;
  id v57;
  void *v58;
  void *v59;
  void *v60;
  _QWORD v61[5];
  id v62;
  id v63;
  id v64;
  uint8_t buf[4];
  void *v66;
  __int16 v67;
  void *v68;
  __int16 v69;
  void *v70;
  __int16 v71;
  id v72;
  __int16 v73;
  id v74;
  uint64_t v75;

  v75 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDHomeNFCReaderKeyManager workQueue](self, "workQueue");
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
    objc_msgSend(v4, "UUID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v66 = v9;
    v67 = 2112;
    v68 = v10;
    _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] fetchOrCreateReaderKeyForPairingWithFlow", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v6);
  -[HMDHomeNFCReaderKeyManager home](v7, "home");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "currentUser");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v11 && v12)
  {
    if ((objc_msgSend(v12, "isOwner") & 1) != 0)
    {
      objc_msgSend(v11, "nfcReaderKey");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "nfcReaderKey");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "identifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (v16)
      {
        +[HMDHomeNFCReaderKey keychainItemAccountAttributeValueWithHome:keyIdentifier:](HMDHomeNFCReaderKey, "keychainItemAccountAttributeValueWithHome:keyIdentifier:", v11, v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = (void *)MEMORY[0x227676638]();
        v19 = v7;
        HMFGetOSLogHandle();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v59 = v16;
          v21 = v14;
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "UUID");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544130;
          v66 = v22;
          v67 = 2112;
          v68 = v23;
          v69 = 2112;
          v70 = v17;
          v71 = 2112;
          v72 = v21;
          _os_log_impl(&dword_2218F0000, v20, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Looking for key chain item with identifier: %@ for reader key: %@", buf, 0x2Au);

          v14 = v21;
          v16 = v59;
        }

        objc_autoreleasePoolPop(v18);
        v64 = 0;
        -[HMDHomeNFCReaderKeyManager readerKeyWithKeychainItemIdentifier:error:flow:](v19, "readerKeyWithKeychainItemIdentifier:error:flow:", v17, &v64, v4);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = v64;
        if (v24)
        {
          objc_msgSend(MEMORY[0x24BE6B608], "futureWithResult:", v24);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v60 = v14;
          v44 = (void *)MEMORY[0x227676638]();
          v45 = v19;
          HMFGetOSLogHandle();
          v46 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v57 = v25;
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "UUID");
            v56 = v44;
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138544386;
            v66 = v47;
            v67 = 2112;
            v68 = v48;
            v69 = 2112;
            v70 = v17;
            v71 = 2112;
            v72 = v60;
            v73 = 2112;
            v74 = v57;
            _os_log_impl(&dword_2218F0000, v46, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to fetch keychain item with identifier: %@ for nfc reader key %@:%@", buf, 0x34u);

            v44 = v56;
            v25 = v57;
          }

          objc_autoreleasePoolPop(v44);
          v49 = (void *)MEMORY[0x227676638]();
          v50 = v45;
          HMFGetOSLogHandle();
          v51 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v51, OS_LOG_TYPE_FAULT))
          {
            HMFGetLogIdentifier();
            v58 = v49;
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138544130;
            v66 = v52;
            v67 = 2112;
            v68 = v17;
            v69 = 2112;
            v70 = v60;
            v71 = 2112;
            v72 = v25;
            _os_log_impl(&dword_2218F0000, v51, OS_LOG_TYPE_FAULT, "%{public}@Submitting ABC event for failure: Failed to fetch keychain item with identifier: %@ for nfc reader key %@:%@", buf, 0x2Au);

            v49 = v58;
          }

          objc_autoreleasePoolPop(v49);
          v14 = v60;
          v53 = -[HMDAssertionLogEvent initWithReason:]([HMDAssertionLogEvent alloc], "initWithReason:", CFSTR("Failed to fetch keychain item with identifier: %@ for nfc reader key %@:%@"), v17, v60, v25);
          +[HMDMetricsManager sharedLogEventSubmitter](HMDMetricsManager, "sharedLogEventSubmitter");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v54, "submitLogEvent:", v53);

          objc_msgSend(MEMORY[0x24BE6B608], "futureWithError:", v25);
          v26 = (void *)objc_claimAutoreleasedReturnValue();

        }
      }
      else
      {
        v39 = (void *)MEMORY[0x227676638]();
        v40 = v7;
        HMFGetOSLogHandle();
        v41 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "UUID");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v66 = v42;
          v67 = 2112;
          v68 = v43;
          _os_log_impl(&dword_2218F0000, v41, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Did not find an existing key in the home graph, so fetching the key from the resident", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v39);
        -[HMDHomeNFCReaderKeyManager requestPrimaryResidentToFetchOrCreateReaderKeyWithFlow:](v40, "requestPrimaryResidentToFetchOrCreateReaderKeyWithFlow:", v4);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v61[0] = MEMORY[0x24BDAC760];
        v61[1] = 3221225472;
        v61[2] = __71__HMDHomeNFCReaderKeyManager_fetchOrCreateReaderKeyForPairingWithFlow___block_invoke;
        v61[3] = &unk_24E792CB0;
        v61[4] = v40;
        v62 = v4;
        v63 = v11;
        objc_msgSend(v17, "recover:", v61);
        v26 = (void *)objc_claimAutoreleasedReturnValue();

      }
    }
    else
    {
      v34 = (void *)MEMORY[0x227676638]();
      v35 = v7;
      HMFGetOSLogHandle();
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "UUID");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v66 = v37;
        v67 = 2112;
        v68 = v38;
        _os_log_impl(&dword_2218F0000, v36, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] We are not the owner, so fetching the key from the resident", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v34);
      -[HMDHomeNFCReaderKeyManager requestPrimaryResidentToFetchOrCreateReaderKeyWithFlow:](v35, "requestPrimaryResidentToFetchOrCreateReaderKeyWithFlow:", v4);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v27 = (void *)MEMORY[0x227676638]();
    v28 = v7;
    HMFGetOSLogHandle();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "UUID");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v66 = v30;
      v67 = 2112;
      v68 = v31;
      v69 = 2112;
      v70 = v11;
      v71 = 2112;
      v72 = v13;
      _os_log_impl(&dword_2218F0000, v29, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to create reader key, home or currentUser is nil. home: %@, currentUser: %@", buf, 0x2Au);

    }
    objc_autoreleasePoolPop(v27);
    v32 = (void *)MEMORY[0x24BE6B608];
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", -1);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "futureWithError:", v33);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v26;
}

- (void)unconfigure
{
  void *v3;
  void *v4;
  id v5;

  -[HMDHomeNFCReaderKeyManager messageDispatcher](self, "messageDispatcher");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "deregisterReceiver:", self);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:", self);

  -[HMDHomeNFCReaderKeyManager accessoryManager](self, "accessoryManager");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unconfigure");

}

- (void)handleHomeDidUpdateNFCReaderKeyNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  int v12;
  int v13;
  NSObject *v14;
  void *v15;
  HMDHomeNFCReaderKeyManager *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD block[5];
  id v22;
  id v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  -[HMDHomeNFCReaderKeyManager dataSource](self, "dataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isWatch");

  -[HMDHomeNFCReaderKeyManager home](self, "home");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "currentUser");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isOwner");

  v13 = v12 ^ 1;
  if ((v9 & 1) != 0 || v13)
  {
    v15 = (void *)MEMORY[0x227676638]();
    v16 = self;
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      HMFBooleanToString();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      HMFBooleanToString();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v25 = v18;
      v26 = 2112;
      v27 = v19;
      v28 = 2112;
      v29 = v20;
      _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_INFO, "%{public}@Not handling home nfc reader key update notification because it is watch: %@ or is not owner device: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v15);
  }
  else
  {
    -[HMDHomeNFCReaderKeyManager workQueue](self, "workQueue");
    v14 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __74__HMDHomeNFCReaderKeyManager_handleHomeDidUpdateNFCReaderKeyNotification___block_invoke;
    block[3] = &unk_24E79BBD0;
    block[4] = self;
    v22 = v4;
    v23 = v7;
    dispatch_async(v14, block);

  }
}

- (void)handleHomeRemovedNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  HMDHomeNFCReaderKeyManager *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  char v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  HMDHomeNFCReaderKeyManager *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  HMDHomeNFCReaderKeyManager *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  void *v36;
  _QWORD block[5];
  id v38;
  id v39;
  id v40;
  uint8_t buf[4];
  void *v42;
  __int16 v43;
  void *v44;
  __int16 v45;
  id v46;
  __int16 v47;
  void *v48;
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("HMDHomeNotificationKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;
  v8 = v7;

  objc_msgSend(MEMORY[0x24BE3F178], "internalOnlyInitializer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x227676638]();
  v11 = self;
  HMFGetOSLogHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "UUID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v42 = v13;
    v43 = 2112;
    v44 = v14;
    v45 = 2112;
    v46 = v8;
    _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_INFO, "%{public}@[NewFlow: %@] Handling home removed notification: %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v10);
  -[HMDHomeNFCReaderKeyManager home](v11, "home");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  if (v15 == v8)
  {
    -[HMDHomeNFCReaderKeyManager dataSource](v11, "dataSource");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "isWatch");

    objc_msgSend(v8, "currentUser");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "isOwner");

    if ((v17 & 1) != 0 || v19 != 1)
    {
      v24 = (void *)MEMORY[0x227676638]();
      v25 = v11;
      HMFGetOSLogHandle();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "UUID");
        v36 = v24;
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        HMFBooleanToString();
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        HMFBooleanToString();
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v42 = v27;
        v43 = 2112;
        v44 = v28;
        v45 = 2112;
        v46 = v29;
        v47 = 2112;
        v48 = v30;
        _os_log_impl(&dword_2218F0000, v26, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Not removing nfc reader key because it is watch: %@ or is not owner device: %@", buf, 0x2Au);

        v24 = v36;
      }

      objc_autoreleasePoolPop(v24);
    }
    else
    {
      -[HMDHomeNFCReaderKeyManager primaryResidentDevice](v11, "primaryResidentDevice");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = v20;
      if (v20 && (objc_msgSend(v20, "isCurrentDevice") & 1) == 0)
      {
        v31 = (void *)MEMORY[0x227676638]();
        v32 = v11;
        HMFGetOSLogHandle();
        v33 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "UUID");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v42 = v34;
          v43 = 2112;
          v44 = v35;
          _os_log_impl(&dword_2218F0000, v33, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Skipping removal of nfc reader key on current device because home has a primary resident that supports wallet key", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v31);
      }
      else
      {
        objc_msgSend(v8, "nfcReaderKey");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        if (v22)
        {
          -[HMDHomeNFCReaderKeyManager workQueue](v11, "workQueue");
          v23 = objc_claimAutoreleasedReturnValue();
          block[0] = MEMORY[0x24BDAC760];
          block[1] = 3221225472;
          block[2] = __60__HMDHomeNFCReaderKeyManager_handleHomeRemovedNotification___block_invoke;
          block[3] = &unk_24E79A910;
          block[4] = v11;
          v38 = v22;
          v39 = v8;
          v40 = v9;
          dispatch_async(v23, block);

        }
      }

    }
  }

}

- (void)handleSystemKeychainStoreUpdatedNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  HMDHomeNFCReaderKeyManager *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  HMDHomeNFCReaderKeyManager *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  _QWORD block[5];
  id v19;
  id v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BE3F178], "internalOnlyInitializer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x227676638]();
  v7 = self;
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "UUID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v22 = v9;
    v23 = 2112;
    v24 = v10;
    _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_INFO, "%{public}@[NewFlow: %@] Handling system keychain store updated notification", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v6);
  -[HMDHomeNFCReaderKeyManager home](v7, "home");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    -[HMDHomeNFCReaderKeyManager workQueue](v7, "workQueue");
    v12 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __75__HMDHomeNFCReaderKeyManager_handleSystemKeychainStoreUpdatedNotification___block_invoke;
    block[3] = &unk_24E79BBD0;
    block[4] = v7;
    v19 = v11;
    v20 = v5;
    dispatch_async(v12, block);

  }
  else
  {
    v13 = (void *)MEMORY[0x227676638]();
    v14 = v7;
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "UUID");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v22 = v16;
      v23 = 2112;
      v24 = v17;
      _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Not handling keychain update, home is nil", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v13);
  }

}

- (id)requestPrimaryResidentToFetchOrCreateReaderKeyWithFlow:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  HMDHomeNFCReaderKeyManager *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  _QWORD v20[4];
  id v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDHomeNFCReaderKeyManager home](self, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "residentDeviceManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "primaryResidentDevice");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "device");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8 && (objc_msgSend(v8, "isCurrentDevice") & 1) == 0)
  {
    v18 = (void *)objc_opt_new();
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = __85__HMDHomeNFCReaderKeyManager_requestPrimaryResidentToFetchOrCreateReaderKeyWithFlow___block_invoke;
    v20[3] = &unk_24E78C688;
    v17 = v18;
    v21 = v17;
    -[HMDHomeNFCReaderKeyManager requestDevice:toCreateKeychainItemForReaderKeyWithFlow:completion:](self, "requestDevice:toCreateKeychainItemForReaderKeyWithFlow:completion:", v9, v4, v20);
    v16 = v21;
  }
  else
  {
    v10 = (void *)MEMORY[0x227676638]();
    v11 = self;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "UUID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v23 = v13;
      v24 = 2112;
      v25 = v14;
      _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Did not find primary resident", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v10);
    v15 = (void *)MEMORY[0x24BE6B608];
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 91);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "futureWithError:", v16);
    v17 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v17;
}

- (void)deleteKeychainItemForNFCReaderKeyWithFlow:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  HMDHomeNFCReaderKeyManager *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  _QWORD v29[5];
  id v30;
  id v31;
  id v32;
  id v33;
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  -[HMDHomeNFCReaderKeyManager workQueue](self, "workQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v9);

  -[HMDHomeNFCReaderKeyManager home](self, "home");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    objc_msgSend(v10, "homeManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v12, "hasLoadedData") & 1) != 0)
    {
      objc_msgSend(v11, "nfcReaderKey");
      v13 = (id)objc_claimAutoreleasedReturnValue();
      if (v13)
      {
        v14 = objc_alloc(MEMORY[0x24BE3F1D0]);
        NSStringFromSelector(a2);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BE3F1B8], "allMessageDestinations");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = (void *)objc_msgSend(v14, "initWithName:destination:payload:", v15, v16, 0);

        v29[0] = MEMORY[0x24BDAC760];
        v29[1] = 3221225472;
        v29[2] = __83__HMDHomeNFCReaderKeyManager_deleteKeychainItemForNFCReaderKeyWithFlow_completion___block_invoke;
        v29[3] = &unk_24E799BC0;
        v33 = v8;
        v29[4] = self;
        v13 = v13;
        v30 = v13;
        v18 = v11;
        v31 = v18;
        v32 = v7;
        objc_msgSend(v17, "setResponseHandler:", v29);
        -[HMDHomeNFCReaderKeyManager createNFCReaderKeyModelWithHome:nfcReaderKey:](self, "createNFCReaderKeyModelWithHome:nfcReaderKey:", v18, 0);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "backingStore");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        +[HMDBackingStoreTransactionOptions defaultXPCOptions](HMDBackingStoreTransactionOptions, "defaultXPCOptions");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "transaction:options:", CFSTR("Deleting NFC Reader Key"), v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v22, "add:withMessage:", v19, v17);
        objc_msgSend(v22, "run");

      }
      else
      {
        objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 2);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        (*((void (**)(id, void *))v8 + 2))(v8, v28);

      }
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
        objc_msgSend(v7, "UUID");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v35 = v26;
        v36 = 2112;
        v37 = v27;
        _os_log_impl(&dword_2218F0000, v25, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Not deleting reader key, home data load is in progress.", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v23);
      objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 48);
      v13 = (id)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, id))v8 + 2))(v8, v13);
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", -1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v8 + 2))(v8, v12);
  }

}

- (id)readerKeyWithKeychainItemIdentifier:(id)a3 error:(id *)a4 flow:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  HMDHomeNFCReaderKeyManager *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v21;
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  -[HMDHomeNFCReaderKeyManager workQueue](self, "workQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v10);

  -[HMDHomeNFCReaderKeyManager keychainStore](self, "keychainStore");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "allKeychainItemsForType:identifier:syncable:error:", &unk_24E96C170, v8, MEMORY[0x24BDBD1C8], a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v12, "count"))
  {
    v13 = (void *)MEMORY[0x227676638]();
    v14 = self;
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "UUID");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 138544130;
      v22 = v16;
      v23 = 2112;
      v24 = v17;
      v25 = 2112;
      v26 = v12;
      v27 = 2112;
      v28 = v8;
      _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Found keychain items: %@ for nfc reader key with keychain item identifier: %@", (uint8_t *)&v21, 0x2Au);

    }
    objc_autoreleasePoolPop(v13);
    objc_msgSend(v12, "firstObject");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMDHomeNFCReaderKey createWithKeychainItem:](HMDHomeNFCReaderKey, "createWithKeychainItem:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (void)createReaderKeyKeychainItemForHome:(id)a3 flow:(id)a4 completion:(id)a5
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  void *v26;
  HMDHomeNFCReaderKeyManager *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  char v35;
  HMDHomeNFCReaderKeyManager *v36;
  NSObject *v37;
  NSObject *v38;
  void *v39;
  void *v40;
  HMDHomeNFCReaderKeyManager *v41;
  id v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  id v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  id v52;
  void *v53;
  void *v54;
  HMDHomeNFCReaderKeyManager *v55;
  NSObject *v56;
  void *v57;
  void *v58;
  void *v59;
  HMDHomeNFCReaderKeyManager *v60;
  NSObject *v61;
  void *v62;
  void *v63;
  void *v64;
  HMDHomeNFCReaderKeyManager *v65;
  NSObject *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  id v73;
  HMDHomeNFCReaderKeyManager *v74;
  HMDHomeNFCReaderKeyManager *v75;
  id v76;
  void *context;
  void *contexta;
  void *v79;
  _QWORD v80[5];
  id v81;
  id v82;
  id v83;
  _QWORD v84[5];
  id v85;
  id v86;
  id v87;
  id v88;
  _QWORD v89[5];
  id v90;
  id v91;
  uint8_t buf[4];
  void *v93;
  __int16 v94;
  void *v95;
  __int16 v96;
  void *v97;
  __int16 v98;
  id v99;
  uint64_t v100;

  v100 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  -[HMDHomeNFCReaderKeyManager workQueue](self, "workQueue");
  v12 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v12);

  objc_msgSend(v9, "homeManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "hasLoadedData");

  if ((v14 & 1) != 0)
  {
    v79 = v10;
    -[HMDHomeNFCReaderKeyManager createKeychainItemFuture](self, "createKeychainItemFuture");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    -[HMDHomeNFCReaderKeyManager createKeychainItemFuture](self, "createKeychainItemFuture");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v16)
    {
      v17 = objc_alloc_init(MEMORY[0x24BE6B608]);
      -[HMDHomeNFCReaderKeyManager setCreateKeychainItemFuture:](self, "setCreateKeychainItemFuture:", v17);

    }
    -[HMDHomeNFCReaderKeyManager createKeychainItemFuture](self, "createKeychainItemFuture");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDHomeNFCReaderKeyManager createKeychainItemFuture](self, "createKeychainItemFuture");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)MEMORY[0x24BE6B628];
    -[HMDHomeNFCReaderKeyManager workQueue](self, "workQueue");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "schedulerWithDispatchQueue:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "reschedule:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v89[0] = MEMORY[0x24BDAC760];
    v89[1] = 3221225472;
    v89[2] = __81__HMDHomeNFCReaderKeyManager_createReaderKeyKeychainItemForHome_flow_completion___block_invoke;
    v89[3] = &unk_24E78C6B0;
    v89[4] = self;
    v24 = v18;
    v90 = v24;
    v91 = v11;
    v25 = (id)objc_msgSend(v23, "addCompletionBlock:", v89);

    v10 = v79;
    if (!v15)
    {
      v26 = (void *)MEMORY[0x227676638]();
      v27 = self;
      HMFGetOSLogHandle();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v79, "UUID");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v93 = v29;
        v94 = 2112;
        v95 = v30;
        _os_log_impl(&dword_2218F0000, v28, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Creating reader key", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v26);
      +[HMDHomeNFCReaderKey createRandomKey](HMDHomeNFCReaderKey, "createRandomKey");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = v31;
      if (v31)
      {
        objc_msgSend(v31, "createKeychainItemForHome:", v9);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        if (v33)
        {
          -[HMDHomeNFCReaderKeyManager keychainStore](v27, "keychainStore");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v88 = 0;
          v35 = objc_msgSend(v34, "updateKeychainItem:createIfNeeded:error:", v33, 1, &v88);
          v76 = v88;

          context = (void *)MEMORY[0x227676638]();
          v36 = v27;
          HMFGetOSLogHandle();
          v37 = objc_claimAutoreleasedReturnValue();
          v38 = v37;
          if ((v35 & 1) != 0)
          {
            v74 = v36;
            if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v79, "UUID");
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138544130;
              v93 = v39;
              v94 = 2112;
              v95 = v40;
              v96 = 2112;
              v97 = v33;
              v98 = 2112;
              v99 = v32;
              _os_log_impl(&dword_2218F0000, v38, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Successfully created keychain item: %@ for nfc reader key: %@", buf, 0x2Au);

              v36 = v74;
            }

            objc_autoreleasePoolPop(context);
            v41 = v36;
            v42 = objc_alloc(MEMORY[0x24BE3F1D0]);
            NSStringFromSelector(a2);
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BE3F1B8], "allMessageDestinations");
            contexta = v33;
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            v45 = (void *)objc_msgSend(v42, "initWithName:destination:payload:", v43, v44, 0);

            v84[0] = MEMORY[0x24BDAC760];
            v84[1] = 3221225472;
            v84[2] = __81__HMDHomeNFCReaderKeyManager_createReaderKeyKeychainItemForHome_flow_completion___block_invoke_94;
            v84[3] = &unk_24E78C6D8;
            v84[4] = v41;
            v73 = v79;
            v85 = v73;
            v46 = v32;
            v86 = v46;
            v47 = v9;
            v87 = v47;
            objc_msgSend(v45, "setResponseHandler:", v84);
            -[HMDHomeNFCReaderKeyManager createNFCReaderKeyModelWithHome:nfcReaderKey:](v41, "createNFCReaderKeyModelWithHome:nfcReaderKey:", v47, v46);
            v72 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v47, "backingStore");
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            +[HMDBackingStoreTransactionOptions defaultXPCOptions](HMDBackingStoreTransactionOptions, "defaultXPCOptions");
            v49 = v32;
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v48, "transaction:options:", CFSTR("Creating NFC Reader Key"), v50);
            v51 = (void *)objc_claimAutoreleasedReturnValue();

            v32 = v49;
            objc_msgSend(v51, "add:withMessage:", v72, v45);
            v80[0] = MEMORY[0x24BDAC760];
            v80[1] = 3221225472;
            v80[2] = __81__HMDHomeNFCReaderKeyManager_createReaderKeyKeychainItemForHome_flow_completion___block_invoke_2;
            v80[3] = &unk_24E792CD8;
            v80[4] = v74;
            v81 = v73;
            v82 = v46;
            v52 = v47;
            v10 = v79;
            v83 = v52;
            objc_msgSend(v51, "run:", v80);

            v33 = contexta;
            v53 = v76;
          }
          else
          {
            v53 = v76;
            if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
            {
              HMFGetLogIdentifier();
              v75 = v36;
              v69 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v79, "UUID");
              v70 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138544130;
              v93 = v69;
              v94 = 2112;
              v95 = v70;
              v96 = 2112;
              v97 = v33;
              v98 = 2112;
              v99 = v76;
              _os_log_impl(&dword_2218F0000, v38, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to add nfc reader key item: %@ to key chain: %@", buf, 0x2Au);

              v36 = v75;
            }

            objc_autoreleasePoolPop(context);
            -[HMDHomeNFCReaderKeyManager createKeychainItemFuture](v36, "createKeychainItemFuture");
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", -1);
            v71 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v45, "finishWithError:", v71);

            v10 = v79;
          }
        }
        else
        {
          v64 = (void *)MEMORY[0x227676638]();
          v65 = v27;
          HMFGetOSLogHandle();
          v66 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v67 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v79, "UUID");
            v68 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v93 = v67;
            v94 = 2112;
            v95 = v68;
            v96 = 2112;
            v97 = v32;
            _os_log_impl(&dword_2218F0000, v66, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to create keychain item  for reader key: %@", buf, 0x20u);

          }
          objc_autoreleasePoolPop(v64);
          -[HMDHomeNFCReaderKeyManager createKeychainItemFuture](v65, "createKeychainItemFuture");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", -1);
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v53, "finishWithError:", v45);
          v33 = 0;
        }

      }
      else
      {
        v59 = (void *)MEMORY[0x227676638]();
        v60 = v27;
        HMFGetOSLogHandle();
        v61 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v79, "UUID");
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v93 = v62;
          v94 = 2112;
          v95 = v63;
          _os_log_impl(&dword_2218F0000, v61, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to create the nfc reader key", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v59);
        -[HMDHomeNFCReaderKeyManager createKeychainItemFuture](v60, "createKeychainItemFuture");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", -1);
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "finishWithError:", v53);
        v32 = 0;
      }

    }
  }
  else
  {
    v54 = (void *)MEMORY[0x227676638]();
    v55 = self;
    HMFGetOSLogHandle();
    v56 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "UUID");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v93 = v57;
      v94 = 2112;
      v95 = v58;
      _os_log_impl(&dword_2218F0000, v56, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Not creating nfc reader key, home data load is in progress.", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v54);
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 48);
    v24 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, id))v11 + 2))(v11, 0, v24);
  }

}

- (id)createNFCReaderKeyModelWithHome:(id)a3 nfcReaderKey:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  HMDHomeModel *v9;
  void *v10;
  void *v11;
  void *v12;
  HMDHomeModel *v13;

  v6 = a4;
  v7 = a3;
  -[HMDHomeNFCReaderKeyManager workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  v9 = [HMDHomeModel alloc];
  objc_msgSend(v7, "uuid");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "homeManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "uuid");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[HMDBackingStoreModelObject initWithObjectChangeType:uuid:parentUUID:](v9, "initWithObjectChangeType:uuid:parentUUID:", 2, v10, v12);

  -[HMDHomeModel setNfcReaderKey:](v13, "setNfcReaderKey:", v6);
  return v13;
}

- (void)removeKeychainItemForReaderKey:(id)a3 home:(id)a4 flow:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  char v21;
  id v22;
  void *v23;
  HMDHomeNFCReaderKeyManager *v24;
  NSObject *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  const char *v30;
  NSObject *v31;
  os_log_type_t v32;
  uint32_t v33;
  uint64_t v34;
  HMDHomeNFCReaderKeyManager *v35;
  NSObject *v36;
  void *v37;
  void *v38;
  const char *v39;
  NSObject *v40;
  os_log_type_t v41;
  uint32_t v42;
  void *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  id v47;
  id v48;
  uint8_t buf[4];
  void *v50;
  __int16 v51;
  void *v52;
  __int16 v53;
  id v54;
  __int16 v55;
  id v56;
  uint64_t v57;

  v57 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[HMDHomeNFCReaderKeyManager workQueue](self, "workQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v11);

  objc_msgSend(v8, "identifier");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = v9;
  +[HMDHomeNFCReaderKey keychainItemAccountAttributeValueWithHome:keyIdentifier:](HMDHomeNFCReaderKey, "keychainItemAccountAttributeValueWithHome:keyIdentifier:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDHomeNFCReaderKeyManager keychainStore](self, "keychainStore");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = 0;
  objc_msgSend(v13, "allKeychainItemsForType:identifier:syncable:error:", &unk_24E96C170, v12, MEMORY[0x24BDBD1C8], &v48);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v48;
  objc_msgSend(v14, "firstObject");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "userInfo");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "hmf_errorForKey:", *MEMORY[0x24BDD1398]);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v16)
  {
    v34 = objc_msgSend(v18, "code");
    v44 = MEMORY[0x227676638]();
    v35 = self;
    HMFGetOSLogHandle();
    v36 = objc_claimAutoreleasedReturnValue();
    v26 = v36;
    if (v34 == -25300)
    {
      if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "UUID");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v50 = v37;
        v51 = 2112;
        v52 = v38;
        v39 = "%{public}@[Flow: %@] Not removing nfc reader key, keychain item does not exist";
        v40 = v26;
        v41 = OS_LOG_TYPE_INFO;
        v42 = 22;
LABEL_14:
        _os_log_impl(&dword_2218F0000, v40, v41, v39, buf, v42);

      }
    }
    else if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "UUID");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v50 = v37;
      v51 = 2112;
      v52 = v38;
      v53 = 2112;
      v54 = v15;
      v39 = "%{public}@[Flow: %@] Failed to remove nfc reader key, keychain item fetch failed: %@";
      v40 = v26;
      v41 = OS_LOG_TYPE_ERROR;
      v42 = 32;
      goto LABEL_14;
    }
    v23 = (void *)v44;
    goto LABEL_16;
  }
  v43 = v18;
  v19 = v8;
  -[HMDHomeNFCReaderKeyManager keychainStore](self, "keychainStore");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = v15;
  v21 = objc_msgSend(v20, "deleteKeychainItem:error:", v16, &v47);
  v22 = v47;

  v23 = (void *)MEMORY[0x227676638]();
  v24 = self;
  HMFGetOSLogHandle();
  v25 = objc_claimAutoreleasedReturnValue();
  v26 = v25;
  if ((v21 & 1) != 0)
  {
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v27 = v23;
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "UUID");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v50 = v28;
      v51 = 2112;
      v52 = v29;
      v53 = 2112;
      v54 = v16;
      v30 = "%{public}@[Flow: %@] Successfully removed nfc reader key keychain item %@";
      v31 = v26;
      v32 = OS_LOG_TYPE_INFO;
      v33 = 32;
LABEL_10:
      _os_log_impl(&dword_2218F0000, v31, v32, v30, buf, v33);

      v23 = v27;
    }
  }
  else if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v27 = v23;
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "UUID");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v50 = v28;
    v51 = 2112;
    v52 = v29;
    v53 = 2112;
    v54 = v16;
    v55 = 2112;
    v56 = v22;
    v30 = "%{public}@[Flow: %@] Failed to remove nfc reader key keychain item %@:%@";
    v31 = v26;
    v32 = OS_LOG_TYPE_ERROR;
    v33 = 42;
    goto LABEL_10;
  }
  v15 = v22;
  v8 = v19;
  v18 = v43;
LABEL_16:

  objc_autoreleasePoolPop(v23);
}

- (HMDDevice)primaryResidentDevice
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  id v8;

  -[HMDHomeNFCReaderKeyManager home](self, "home");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "residentDeviceManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "primaryResidentDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "device");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
    goto LABEL_6;
  objc_msgSend(v4, "capabilities");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "supportsWalletKey") & 1) == 0)
  {

    goto LABEL_6;
  }
  v7 = objc_msgSend(v4, "isReachable");

  if (!v7)
  {
LABEL_6:
    v8 = 0;
    goto LABEL_7;
  }
  v8 = v5;
LABEL_7:

  return (HMDDevice *)v8;
}

- (void)requestDevice:(id)a3 toCreateKeychainItemForReaderKeyWithFlow:(id)a4 completion:(id)a5
{
  HMDRemoteMessage *v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  HMDHomeNFCReaderKeyManager *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  HMDRemoteDeviceMessageDestination *v17;
  void *v18;
  HMDRemoteDeviceMessageDestination *v19;
  HMDRemoteMessage *v20;
  void *v21;
  void *v22;
  HMDRemoteMessage *v23;
  id v24;
  id v25;
  void *v26;
  HMDHomeNFCReaderKeyManager *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  _QWORD v32[5];
  id v33;
  id v34;
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  HMDRemoteMessage *v40;
  __int16 v41;
  HMDRemoteMessage *v42;
  uint64_t v43;
  _QWORD v44[2];

  v44[1] = *MEMORY[0x24BDAC8D0];
  v8 = (HMDRemoteMessage *)a3;
  v9 = a4;
  v10 = a5;
  -[HMDHomeNFCReaderKeyManager workQueue](self, "workQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v11);

  v12 = (void *)MEMORY[0x227676638]();
  v13 = self;
  HMFGetOSLogHandle();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "UUID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v36 = v15;
    v37 = 2112;
    v38 = v16;
    v39 = 2112;
    v40 = v8;
    _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Requesting primary resident device to create keychain item for nfc reader key. residentDevice: %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v12);
  v17 = [HMDRemoteDeviceMessageDestination alloc];
  -[HMDHomeNFCReaderKeyManager messageTargetUUID](v13, "messageTargetUUID");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[HMDRemoteDeviceMessageDestination initWithTarget:device:](v17, "initWithTarget:device:", v18, v8);

  v20 = [HMDRemoteMessage alloc];
  v43 = *MEMORY[0x24BE3EBF8];
  HMFEncodedRootObject();
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v44[0] = v21;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v44, &v43, 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = -[HMDRemoteMessage initWithName:destination:payload:type:timeout:secure:](v20, "initWithName:destination:payload:type:timeout:secure:", CFSTR("HMDHomeCreateKeychainItemForNFCReaderKeyMessage"), v19, v22, 0, 1, 0.0);

  v32[0] = MEMORY[0x24BDAC760];
  v32[1] = 3221225472;
  v32[2] = __96__HMDHomeNFCReaderKeyManager_requestDevice_toCreateKeychainItemForReaderKeyWithFlow_completion___block_invoke;
  v32[3] = &unk_24E796990;
  v32[4] = v13;
  v24 = v9;
  v33 = v24;
  v25 = v10;
  v34 = v25;
  v26 = (void *)MEMORY[0x227676638](-[HMDRemoteMessage setResponseHandler:](v23, "setResponseHandler:", v32));
  v27 = v13;
  HMFGetOSLogHandle();
  v28 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "UUID");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v36 = v29;
    v37 = 2112;
    v38 = v30;
    v39 = 2112;
    v40 = v23;
    v41 = 2112;
    v42 = v8;
    _os_log_impl(&dword_2218F0000, v28, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Sending message to create keychain item for reader key: %@ to primary resident: %@", buf, 0x2Au);

  }
  objc_autoreleasePoolPop(v26);
  -[HMDHomeNFCReaderKeyManager messageDispatcher](v27, "messageDispatcher");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "sendMessage:", v23);

}

- (void)requestPrimaryResidentToFetchOrCreateReaderKeyWithFlow:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  HMDRemoteDeviceMessageDestination *v10;
  void *v11;
  HMDRemoteDeviceMessageDestination *v12;
  HMDRemoteMessage *v13;
  void *v14;
  void *v15;
  HMDRemoteMessage *v16;
  id v17;
  void *v18;
  HMDHomeNFCReaderKeyManager *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  HMDHomeNFCReaderKeyManager *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  _QWORD v29[5];
  id v30;
  id v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  HMDRemoteMessage *v37;
  __int16 v38;
  void *v39;
  uint64_t v40;
  _QWORD v41[2];

  v41[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[HMDHomeNFCReaderKeyManager workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  -[HMDHomeNFCReaderKeyManager primaryResidentDevice](self, "primaryResidentDevice");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = [HMDRemoteDeviceMessageDestination alloc];
    -[HMDHomeNFCReaderKeyManager messageTargetUUID](self, "messageTargetUUID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[HMDRemoteDeviceMessageDestination initWithTarget:device:](v10, "initWithTarget:device:", v11, v9);

    v13 = [HMDRemoteMessage alloc];
    v40 = *MEMORY[0x24BE3EBF8];
    HMFEncodedRootObject();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v41[0] = v14;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v41, &v40, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[HMDRemoteMessage initWithName:destination:payload:type:timeout:secure:](v13, "initWithName:destination:payload:type:timeout:secure:", CFSTR("HMDHomeFetchOrCreateNFCReaderKeyMessage"), v12, v15, 0, 1, 0.0);

    v29[0] = MEMORY[0x24BDAC760];
    v29[1] = 3221225472;
    v29[2] = __96__HMDHomeNFCReaderKeyManager_requestPrimaryResidentToFetchOrCreateReaderKeyWithFlow_completion___block_invoke;
    v29[3] = &unk_24E796990;
    v29[4] = self;
    v17 = v6;
    v30 = v17;
    v31 = v7;
    v18 = (void *)MEMORY[0x227676638](-[HMDRemoteMessage setResponseHandler:](v16, "setResponseHandler:", v29));
    v19 = self;
    HMFGetOSLogHandle();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "UUID");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v33 = v21;
      v34 = 2112;
      v35 = v22;
      v36 = 2112;
      v37 = v16;
      v38 = 2112;
      v39 = v9;
      _os_log_impl(&dword_2218F0000, v20, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Sending message to fetch or create reader key: %@ to primary resident: %@", buf, 0x2Au);

    }
    objc_autoreleasePoolPop(v18);
    -[HMDHomeNFCReaderKeyManager messageDispatcher](v19, "messageDispatcher");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "sendMessage:", v16);

  }
  else
  {
    v24 = (void *)MEMORY[0x227676638]();
    v25 = self;
    HMFGetOSLogHandle();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "UUID");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v33 = v27;
      v34 = 2112;
      v35 = v28;
      _os_log_impl(&dword_2218F0000, v26, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Did not send message to fetch or create reader key, there is no primary resident that support wallet key", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v24);
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 48);
    v12 = (HMDRemoteDeviceMessageDestination *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, HMDRemoteDeviceMessageDestination *))v7 + 2))(v7, 0, v12);
  }

}

- (id)logIdentifier
{
  void *v2;
  void *v3;

  -[HMDHomeNFCReaderKeyManager uuid](self, "uuid");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (HMDHomeWalletKeyAccessoryManager)accessoryManager
{
  return (HMDHomeWalletKeyAccessoryManager *)objc_getProperty(self, a2, 8, 1);
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 16, 1);
}

- (HAPSystemKeychainStore)keychainStore
{
  return (HAPSystemKeychainStore *)objc_getProperty(self, a2, 24, 1);
}

- (NSUUID)uuid
{
  return (NSUUID *)objc_getProperty(self, a2, 32, 1);
}

- (HMDHome)home
{
  return (HMDHome *)objc_loadWeakRetained((id *)&self->_home);
}

- (void)setHome:(id)a3
{
  objc_storeWeak((id *)&self->_home, a3);
}

- (HMFMessageDispatcher)messageDispatcher
{
  return (HMFMessageDispatcher *)objc_getProperty(self, a2, 48, 1);
}

- (void)setMessageDispatcher:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (HMDHomeWalletDataSource)dataSource
{
  return (HMDHomeWalletDataSource *)objc_getProperty(self, a2, 56, 1);
}

- (NAFuture)createKeychainItemFuture
{
  return (NAFuture *)objc_getProperty(self, a2, 64, 1);
}

- (void)setCreateKeychainItemFuture:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (NSMutableSet)keyIdentifiersAlreadyUpdated
{
  return (NSMutableSet *)objc_getProperty(self, a2, 72, 1);
}

- (void)setKeyIdentifiersAlreadyUpdated:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyIdentifiersAlreadyUpdated, 0);
  objc_storeStrong((id *)&self->_createKeychainItemFuture, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_messageDispatcher, 0);
  objc_destroyWeak((id *)&self->_home);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_keychainStore, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_accessoryManager, 0);
}

void __96__HMDHomeNFCReaderKeyManager_requestPrimaryResidentToFetchOrCreateReaderKeyWithFlow_completion___block_invoke(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  __CFString *v7;
  void *v8;
  id v9;
  NSObject *v10;
  id v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  id v16;
  void *v17;
  NSObject *v18;
  void *v19;
  id v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  id v26;
  id v27;
  void *v28;
  id v29;
  _QWORD block[5];
  id v31;
  id v32;
  id v33;
  _QWORD v34[4];
  id v35;
  id v36;
  id v37;
  _QWORD v38[4];
  id v39;
  uint8_t buf[4];
  void *v41;
  __int16 v42;
  void *v43;
  __int16 v44;
  const __CFString *v45;
  __int16 v46;
  id v47;
  __int16 v48;
  id v49;
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  objc_msgSend(v6, "hmf_dataForKey:", CFSTR("HMDHomeFetchOrCreateNFCReaderKeyMessageKeyReaderKey"));
  v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v37 = 0;
    objc_msgSend(MEMORY[0x24BDD1620], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v7, &v37);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v37;
    if (v8)
    {
      objc_msgSend(a1[4], "workQueue");
      v10 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __96__HMDHomeNFCReaderKeyManager_requestPrimaryResidentToFetchOrCreateReaderKeyWithFlow_completion___block_invoke_2;
      block[3] = &unk_24E79B3F0;
      v11 = a1[5];
      block[4] = a1[4];
      v31 = v11;
      v32 = v8;
      v33 = a1[6];
      dispatch_async(v10, block);

    }
    else
    {
      v19 = (void *)MEMORY[0x227676638]();
      v20 = a1[4];
      HMFGetOSLogHandle();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v29 = v5;
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1[5], "UUID");
        v28 = v19;
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v41 = v22;
        v42 = 2112;
        v43 = v23;
        v44 = 2112;
        v45 = v7;
        v46 = 2112;
        v47 = v9;
        _os_log_impl(&dword_2218F0000, v21, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to decode reader key %@:%@", buf, 0x2Au);

        v19 = v28;
        v5 = v29;
      }

      objc_autoreleasePoolPop(v19);
      objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setObject:forKeyedSubscript:", v9, *MEMORY[0x24BDD1398]);
      objc_msgSend(a1[4], "workQueue");
      v25 = objc_claimAutoreleasedReturnValue();
      v34[0] = MEMORY[0x24BDAC760];
      v34[1] = 3221225472;
      v34[2] = __96__HMDHomeNFCReaderKeyManager_requestPrimaryResidentToFetchOrCreateReaderKeyWithFlow_completion___block_invoke_106;
      v34[3] = &unk_24E79C2B8;
      v26 = a1[6];
      v35 = v24;
      v36 = v26;
      v27 = v24;
      dispatch_async(v25, v34);

    }
  }
  else
  {
    v12 = (void *)MEMORY[0x227676638]();
    v13 = a1[4];
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[5], "UUID");
      v16 = v5;
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544386;
      v41 = v15;
      v42 = 2112;
      v43 = v17;
      v44 = 2112;
      v45 = CFSTR("HMDHomeFetchOrCreateNFCReaderKeyMessageKeyReaderKey");
      v46 = 2112;
      v47 = v6;
      v48 = 2112;
      v49 = v16;
      _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Missing reader key: %@ in payload: %@ error: %@", buf, 0x34u);

      v5 = v16;
    }

    objc_autoreleasePoolPop(v12);
    objc_msgSend(a1[4], "workQueue");
    v18 = objc_claimAutoreleasedReturnValue();
    v38[0] = MEMORY[0x24BDAC760];
    v38[1] = 3221225472;
    v38[2] = __96__HMDHomeNFCReaderKeyManager_requestPrimaryResidentToFetchOrCreateReaderKeyWithFlow_completion___block_invoke_104;
    v38[3] = &unk_24E799CC8;
    v39 = a1[6];
    dispatch_async(v18, v38);

    v9 = v39;
  }

}

void __96__HMDHomeNFCReaderKeyManager_requestPrimaryResidentToFetchOrCreateReaderKeyWithFlow_completion___block_invoke_104(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", -1);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

}

void __96__HMDHomeNFCReaderKeyManager_requestPrimaryResidentToFetchOrCreateReaderKeyWithFlow_completion___block_invoke_106(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:userInfo:", -1, *(_QWORD *)(a1 + 32));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

}

uint64_t __96__HMDHomeNFCReaderKeyManager_requestPrimaryResidentToFetchOrCreateReaderKeyWithFlow_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x227676638]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "UUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1 + 48);
    v9 = 138543874;
    v10 = v5;
    v11 = 2112;
    v12 = v6;
    v13 = 2112;
    v14 = v7;
    _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Successfully fetched nfc reader key: %@", (uint8_t *)&v9, 0x20u);

  }
  objc_autoreleasePoolPop(v2);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

void __96__HMDHomeNFCReaderKeyManager_requestDevice_toCreateKeychainItemForReaderKeyWithFlow_completion___block_invoke(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  __CFString *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  id v17;
  void *v18;
  NSObject *v19;
  void *v20;
  id v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  id v27;
  id v28;
  _QWORD block[5];
  id v30;
  id v31;
  id v32;
  _QWORD v33[4];
  id v34;
  id v35;
  _QWORD v36[4];
  id v37;
  uint8_t buf[4];
  void *v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  const __CFString *v43;
  __int16 v44;
  id v45;
  __int16 v46;
  id v47;
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  objc_msgSend(v6, "hmf_dataForKey:", CFSTR("HMDHomeCreateKeychainItemForNFCReaderKeyMessageKeyReaderKey"));
  v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    +[HMDHomeNFCReaderKey createWithExternalRepresentation:](HMDHomeNFCReaderKey, "createWithExternalRepresentation:", v7);
    v8 = objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = (void *)v8;
      objc_msgSend(a1[4], "workQueue");
      v10 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __96__HMDHomeNFCReaderKeyManager_requestDevice_toCreateKeychainItemForReaderKeyWithFlow_completion___block_invoke_2;
      block[3] = &unk_24E79B3F0;
      v11 = a1[5];
      block[4] = a1[4];
      v30 = v11;
      v12 = v9;
      v31 = v12;
      v32 = a1[6];
      dispatch_async(v10, block);

    }
    else
    {
      v20 = (void *)MEMORY[0x227676638]();
      v21 = a1[4];
      HMFGetOSLogHandle();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1[5], "UUID");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v39 = v23;
        v40 = 2112;
        v41 = v24;
        v42 = 2112;
        v43 = v7;
        v44 = 2112;
        v45 = 0;
        _os_log_impl(&dword_2218F0000, v22, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to decode reader key keychain item %@:%@", buf, 0x2Au);

      }
      objc_autoreleasePoolPop(v20);
      objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setObject:forKeyedSubscript:", 0, *MEMORY[0x24BDD1398]);
      objc_msgSend(a1[4], "workQueue");
      v26 = objc_claimAutoreleasedReturnValue();
      v33[0] = MEMORY[0x24BDAC760];
      v33[1] = 3221225472;
      v33[2] = __96__HMDHomeNFCReaderKeyManager_requestDevice_toCreateKeychainItemForReaderKeyWithFlow_completion___block_invoke_103;
      v33[3] = &unk_24E79C2B8;
      v27 = a1[6];
      v34 = v25;
      v35 = v27;
      v28 = v25;
      dispatch_async(v26, v33);

      v12 = 0;
    }
  }
  else
  {
    v13 = (void *)MEMORY[0x227676638]();
    v14 = a1[4];
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[5], "UUID");
      v17 = v5;
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544386;
      v39 = v16;
      v40 = 2112;
      v41 = v18;
      v42 = 2112;
      v43 = CFSTR("HMDHomeCreateKeychainItemForNFCReaderKeyMessageKeyReaderKey");
      v44 = 2112;
      v45 = v6;
      v46 = 2112;
      v47 = v17;
      _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Missing reader key keychain item: %@ in payload: %@ error: %@", buf, 0x34u);

      v5 = v17;
    }

    objc_autoreleasePoolPop(v13);
    objc_msgSend(a1[4], "workQueue");
    v19 = objc_claimAutoreleasedReturnValue();
    v36[0] = MEMORY[0x24BDAC760];
    v36[1] = 3221225472;
    v36[2] = __96__HMDHomeNFCReaderKeyManager_requestDevice_toCreateKeychainItemForReaderKeyWithFlow_completion___block_invoke_102;
    v36[3] = &unk_24E799CC8;
    v37 = a1[6];
    dispatch_async(v19, v36);

    v12 = v37;
  }

}

void __96__HMDHomeNFCReaderKeyManager_requestDevice_toCreateKeychainItemForReaderKeyWithFlow_completion___block_invoke_102(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", -1);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

}

void __96__HMDHomeNFCReaderKeyManager_requestDevice_toCreateKeychainItemForReaderKeyWithFlow_completion___block_invoke_103(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:userInfo:", -1, *(_QWORD *)(a1 + 32));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

}

uint64_t __96__HMDHomeNFCReaderKeyManager_requestDevice_toCreateKeychainItemForReaderKeyWithFlow_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x227676638]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "UUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1 + 48);
    v9 = 138543874;
    v10 = v5;
    v11 = 2112;
    v12 = v6;
    v13 = 2112;
    v14 = v7;
    _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Resident successfully created keychain item for nfc reader key: %@", (uint8_t *)&v9, 0x20u);

  }
  objc_autoreleasePoolPop(v2);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

void __81__HMDHomeNFCReaderKeyManager_createReaderKeyKeychainItemForHome_flow_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "createKeychainItemFuture");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(void **)(a1 + 40);

  if (v6 == v7)
    objc_msgSend(*(id *)(a1 + 32), "setCreateKeychainItemFuture:", 0);
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

void __81__HMDHomeNFCReaderKeyManager_createReaderKeyKeychainItemForHome_flow_completion___block_invoke_94(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t);
  void *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v7 = (void *)MEMORY[0x227676638]();
    v8 = a1[4];
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[5], "UUID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v24 = v10;
      v25 = 2112;
      v26 = v11;
      v27 = 2112;
      v28 = v5;
      _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] NFC reader key transaction message response handler called with: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v7);
    objc_msgSend(a1[4], "workQueue");
    v12 = objc_claimAutoreleasedReturnValue();
    v15 = MEMORY[0x24BDAC760];
    v16 = 3221225472;
    v17 = __81__HMDHomeNFCReaderKeyManager_createReaderKeyKeychainItemForHome_flow_completion___block_invoke_95;
    v18 = &unk_24E79A910;
    v19 = a1[4];
    v20 = a1[6];
    v21 = a1[7];
    v22 = a1[5];
    dispatch_async(v12, &v15);

    objc_msgSend(a1[4], "createKeychainItemFuture", v15, v16, v17, v18, v19);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "finishWithError:", v5);

  }
  else
  {
    objc_msgSend(a1[4], "createKeychainItemFuture");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "finishWithResult:", a1[6]);

  }
}

void __81__HMDHomeNFCReaderKeyManager_createReaderKeyKeychainItemForHome_flow_completion___block_invoke_2(id *a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t);
  void *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (v3)
  {
    v4 = (void *)MEMORY[0x227676638]();
    v5 = a1[4];
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[5], "UUID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v20 = v7;
      v21 = 2112;
      v22 = v8;
      v23 = 2112;
      v24 = v3;
      _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] NFC reader key transaction run failed: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v4);
    objc_msgSend(a1[4], "workQueue");
    v9 = objc_claimAutoreleasedReturnValue();
    v11 = MEMORY[0x24BDAC760];
    v12 = 3221225472;
    v13 = __81__HMDHomeNFCReaderKeyManager_createReaderKeyKeychainItemForHome_flow_completion___block_invoke_98;
    v14 = &unk_24E79A910;
    v15 = a1[4];
    v16 = a1[6];
    v17 = a1[7];
    v18 = a1[5];
    dispatch_async(v9, &v11);

    objc_msgSend(a1[4], "createKeychainItemFuture", v11, v12, v13, v14, v15);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "finishWithError:", v3);

  }
}

uint64_t __81__HMDHomeNFCReaderKeyManager_createReaderKeyKeychainItemForHome_flow_completion___block_invoke_98(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeKeychainItemForReaderKey:home:flow:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

uint64_t __81__HMDHomeNFCReaderKeyManager_createReaderKeyKeychainItemForHome_flow_completion___block_invoke_95(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeKeychainItemForReaderKey:home:flow:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

void __83__HMDHomeNFCReaderKeyManager_deleteKeychainItemForNFCReaderKeyWithFlow_completion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  void *v9;
  _QWORD v10[5];
  id v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x24BDAC8D0];
  if (a2)
  {
    v15 = *MEMORY[0x24BDD1398];
    v16[0] = a2;
    v3 = (void *)MEMORY[0x24BDBCE70];
    v4 = a2;
    objc_msgSend(v3, "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 64);
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:userInfo:", -1, v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v7);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "workQueue");
    v8 = objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __83__HMDHomeNFCReaderKeyManager_deleteKeychainItemForNFCReaderKeyWithFlow_completion___block_invoke_2;
    v10[3] = &unk_24E799A68;
    v9 = *(void **)(a1 + 40);
    v10[4] = *(_QWORD *)(a1 + 32);
    v11 = v9;
    v12 = *(id *)(a1 + 48);
    v13 = *(id *)(a1 + 56);
    v14 = *(id *)(a1 + 64);
    dispatch_async(v8, v10);

    v5 = 0;
  }

}

uint64_t __83__HMDHomeNFCReaderKeyManager_deleteKeychainItemForNFCReaderKeyWithFlow_completion___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "removeKeychainItemForReaderKey:home:flow:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
}

uint64_t __85__HMDHomeNFCReaderKeyManager_requestPrimaryResidentToFetchOrCreateReaderKeyWithFlow___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithResult:error:", a2, a3);
}

void __75__HMDHomeNFCReaderKeyManager_handleSystemKeychainStoreUpdatedNotification___block_invoke(id *a1)
{
  void *v2;
  char v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  NSObject *v26;
  void *v27;
  void *v28;
  id v29;
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
  objc_msgSend(a1[4], "dataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isWatch");

  objc_msgSend(a1[5], "currentUser");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isOwner");

  if ((v3 & 1) != 0 || v5 != 1)
  {
    v12 = (void *)MEMORY[0x227676638]();
    v13 = a1[4];
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[6], "UUID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      HMFBooleanToString();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      HMFBooleanToString();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v31 = v15;
      v32 = 2112;
      v33 = v16;
      v34 = 2112;
      v35 = v17;
      v36 = 2112;
      v37 = v18;
      _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Not handling keychain update because it is watch: %@ or is not owner device: %@", buf, 0x2Au);

    }
    objc_autoreleasePoolPop(v12);
  }
  else
  {
    objc_msgSend(a1[5], "nfcReaderKey");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      +[HMDHomeNFCReaderKey keychainItemAccountAttributeValueWithHome:keyIdentifier:](HMDHomeNFCReaderKey, "keychainItemAccountAttributeValueWithHome:keyIdentifier:", a1[5], v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = a1[4];
      v29 = 0;
      objc_msgSend(v9, "readerKeyWithKeychainItemIdentifier:error:flow:", v8, &v29, a1[6]);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v29;
      if (v10)
      {
        logAndPostNotification(CFSTR("HMDHomeNFCReaderKeyKeychainItemAvailableNotification"), a1[4], 0);
      }
      else
      {
        v24 = (void *)MEMORY[0x227676638]();
        v25 = a1[4];
        HMFGetOSLogHandle();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(a1[6], "UUID");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544130;
          v31 = v27;
          v32 = 2112;
          v33 = v28;
          v34 = 2112;
          v35 = v7;
          v36 = 2112;
          v37 = v8;
          _os_log_impl(&dword_2218F0000, v26, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Failed to fetch reader key with identifier: %@ and keychain item identifier: %@", buf, 0x2Au);

        }
        objc_autoreleasePoolPop(v24);
      }

    }
    else
    {
      v19 = (void *)MEMORY[0x227676638]();
      v20 = a1[4];
      HMFGetOSLogHandle();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1[6], "UUID");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v31 = v22;
        v32 = 2112;
        v33 = v23;
        _os_log_impl(&dword_2218F0000, v21, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Not handling nfc reader key update because it set to nil on home", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v19);
    }

  }
}

uint64_t __60__HMDHomeNFCReaderKeyManager_handleHomeRemovedNotification___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeKeychainItemForReaderKey:home:flow:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

void __74__HMDHomeNFCReaderKeyManager_handleHomeDidUpdateNFCReaderKeyNotification___block_invoke(id *a1)
{
  void *v2;
  void *v3;
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  int v25;
  void *v26;
  id v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  NSObject *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  NSObject *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  NSObject *v44;
  void *v45;
  void *v46;
  dispatch_time_t v47;
  NSObject *v48;
  void *v49;
  void *v50;
  void *v51;
  id v52;
  void *v53;
  _QWORD block[5];
  id v55;
  id v56;
  id v57;
  uint8_t buf[4];
  void *v59;
  __int16 v60;
  void *v61;
  __int16 v62;
  id v63;
  __int16 v64;
  void *v65;
  uint64_t v66;

  v66 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE3F178], "internalOnlyInitializer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x227676638]();
  v4 = a1[4];
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "UUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v59 = v6;
    v60 = 2112;
    v61 = v7;
    _os_log_impl(&dword_2218F0000, v5, OS_LOG_TYPE_INFO, "%{public}@[NewFlow: %@] Handling HomeDidUpdateNFCReaderKeyNotification", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v3);
  objc_msgSend(a1[5], "userInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("HMDHomeDidUpdateNFCReaderKeyNotificationKeyPreviousNFCReaderKey"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v10 = v9;
  else
    v10 = 0;
  v11 = v10;

  if (v11)
  {
    v12 = (void *)MEMORY[0x227676638]();
    v13 = a1[4];
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "UUID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v59 = v15;
      v60 = 2112;
      v61 = v16;
      v62 = 2112;
      v63 = v11;
      _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Removing keychain item for nfc reader key: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v12);
    objc_msgSend(a1[4], "removeKeychainItemForReaderKey:home:flow:", v11, a1[6], v2);
  }
  objc_msgSend(a1[6], "nfcReaderKey");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (v17)
  {
    objc_msgSend(v17, "identifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMDHomeNFCReaderKey keychainItemAccountAttributeValueWithHome:keyIdentifier:](HMDHomeNFCReaderKey, "keychainItemAccountAttributeValueWithHome:keyIdentifier:", a1[6], v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = a1[4];
    v57 = 0;
    objc_msgSend(v21, "readerKeyWithKeychainItemIdentifier:error:flow:", v20, &v57, v2);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v57;
    if (v22)
    {
      v53 = v22;
      objc_msgSend(a1[4], "keyIdentifiersAlreadyUpdated");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v24, "containsObject:", v19);

      if (v25)
      {
        v26 = (void *)MEMORY[0x227676638]();
        v27 = a1[4];
        HMFGetOSLogHandle();
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v2, "UUID");
          v50 = v26;
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v59 = v29;
          v60 = 2112;
          v61 = v30;
          v62 = 2112;
          v63 = v19;
          _os_log_impl(&dword_2218F0000, v28, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Already updated Reader key with key identifier: %@", buf, 0x20u);

          v26 = v50;
        }

        objc_autoreleasePoolPop(v26);
      }
      else
      {
        v52 = v23;
        objc_msgSend(a1[4], "keyIdentifiersAlreadyUpdated");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "addObject:", v19);

        v42 = (void *)MEMORY[0x227676638]();
        v43 = a1[4];
        HMFGetOSLogHandle();
        v44 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v2, "UUID");
          v49 = v42;
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v59 = v45;
          v60 = 2112;
          v61 = v46;
          v62 = 2112;
          v63 = v19;
          _os_log_impl(&dword_2218F0000, v44, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Caching did update reader key with key identifier: %@", buf, 0x20u);

          v42 = v49;
        }

        objc_autoreleasePoolPop(v42);
        v47 = dispatch_time(0, 86400000000000);
        objc_msgSend(a1[4], "workQueue");
        v48 = objc_claimAutoreleasedReturnValue();
        block[0] = MEMORY[0x24BDAC760];
        block[1] = 3221225472;
        block[2] = __74__HMDHomeNFCReaderKeyManager_handleHomeDidUpdateNFCReaderKeyNotification___block_invoke_85;
        block[3] = &unk_24E79BBD0;
        block[4] = a1[4];
        v55 = v2;
        v56 = v19;
        dispatch_after(v47, v48, block);

        logAndPostNotification(CFSTR("HMDHomeNFCReaderKeyKeychainItemAvailableNotification"), a1[4], 0);
        v23 = v52;
      }
      v22 = v53;
    }
    else
    {
      v36 = (void *)MEMORY[0x227676638]();
      v37 = a1[4];
      HMFGetOSLogHandle();
      v38 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "UUID");
        v51 = v36;
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v59 = v39;
        v60 = 2112;
        v61 = v40;
        v62 = 2112;
        v63 = v19;
        v64 = 2112;
        v65 = v20;
        _os_log_impl(&dword_2218F0000, v38, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Failed to fetch reader key with identifier: %@ and keychain item identifier: %@", buf, 0x2Au);

        v36 = v51;
        v22 = 0;
      }

      objc_autoreleasePoolPop(v36);
    }

  }
  else
  {
    v31 = (void *)MEMORY[0x227676638]();
    v32 = a1[4];
    HMFGetOSLogHandle();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "UUID");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v59 = v34;
      v60 = 2112;
      v61 = v35;
      _os_log_impl(&dword_2218F0000, v33, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Received home nfc reader key did update notification but its not set for home", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v31);
  }

}

void __74__HMDHomeNFCReaderKeyManager_handleHomeDidUpdateNFCReaderKeyNotification___block_invoke_85(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x227676638]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "UUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1 + 48);
    v9 = 138543874;
    v10 = v5;
    v11 = 2112;
    v12 = v6;
    v13 = 2112;
    v14 = v7;
    _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Removing key identifier from keyIdentifiersAlreadyUpdated: %@", (uint8_t *)&v9, 0x20u);

  }
  objc_autoreleasePoolPop(v2);
  objc_msgSend(*(id *)(a1 + 32), "keyIdentifiersAlreadyUpdated");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeObject:", *(_QWORD *)(a1 + 48));

}

id __71__HMDHomeNFCReaderKeyManager_fetchOrCreateReaderKeyForPairingWithFlow___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  _QWORD v19[4];
  id v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = v3;
  if (!v3)
    goto LABEL_8;
  objc_msgSend(v3, "domain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5 != (void *)*MEMORY[0x24BDD5BD8])
  {

LABEL_8:
    objc_msgSend(MEMORY[0x24BE6B608], "futureWithError:", v4);
    v17 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  v7 = objc_msgSend(v4, "code");

  if (v7 != 91)
    goto LABEL_8;
  v8 = (void *)MEMORY[0x227676638]();
  v9 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "UUID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v22 = v11;
    v23 = 2112;
    v24 = v12;
    _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Creating a reader key locally because we do not have a resident", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v8);
  v13 = (void *)objc_opt_new();
  v15 = *(_QWORD *)(a1 + 40);
  v14 = *(_QWORD *)(a1 + 48);
  v16 = *(void **)(a1 + 32);
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __71__HMDHomeNFCReaderKeyManager_fetchOrCreateReaderKeyForPairingWithFlow___block_invoke_81;
  v19[3] = &unk_24E78C688;
  v17 = v13;
  v20 = v17;
  objc_msgSend(v16, "createReaderKeyKeychainItemForHome:flow:completion:", v14, v15, v19);

LABEL_9:
  return v17;
}

uint64_t __71__HMDHomeNFCReaderKeyManager_fetchOrCreateReaderKeyForPairingWithFlow___block_invoke_81(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithResult:error:", a2, a3);
}

uint64_t __98__HMDHomeNFCReaderKeyManager_fetchOrCreateReaderKeyOnQueueWithRequiresPrivateKey_flow_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "fetchOrCreateReaderKeyWithRequiresPrivateKey:flow:completion:", *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void __74__HMDHomeNFCReaderKeyManager_handleCreateKeychainItemForReaderKeyMessage___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  if (a2)
  {
    v5 = CFSTR("HMDHomeCreateKeychainItemForNFCReaderKeyMessageKeyReaderKey");
    objc_msgSend(a2, "externalRepresentation");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = v3;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "respondWithPayload:", v4);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "respondWithError:");
  }
}

void __66__HMDHomeNFCReaderKeyManager_handleFetchOrCreateReaderKeyMessage___block_invoke(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  NSObject *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  id v24;
  NSObject *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  id v30;
  id v31;
  id v32;
  const __CFString *v33;
  void *v34;
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  id v40;
  __int16 v41;
  id v42;
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v32 = 0;
    objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", v5, 1, &v32);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v32;
    if (v7)
    {
      v33 = CFSTR("HMDHomeFetchOrCreateNFCReaderKeyMessageKeyReaderKey");
      v34 = v7;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v34, &v33, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)MEMORY[0x227676638]();
      v11 = a1[4];
      HMFGetOSLogHandle();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v30 = v8;
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1[5], "UUID");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = a1[6];
        *(_DWORD *)buf = 138544130;
        v36 = v13;
        v37 = 2112;
        v38 = v14;
        v39 = 2112;
        v40 = v15;
        v41 = 2112;
        v42 = v9;
        _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Responding to fetch or create reader key message: %@ with payload: %@ ", buf, 0x2Au);

        v8 = v30;
      }

      objc_autoreleasePoolPop(v10);
      objc_msgSend(a1[6], "respondWithPayload:", v9);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v8, *MEMORY[0x24BDD1398]);
      objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:userInfo:", -1, v9);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = (void *)MEMORY[0x227676638](objc_msgSend(a1[6], "respondWithError:", v22));
      v24 = a1[4];
      HMFGetOSLogHandle();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v29 = v23;
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1[5], "UUID");
        v31 = v8;
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = a1[6];
        *(_DWORD *)buf = 138544130;
        v36 = v26;
        v37 = 2112;
        v38 = v27;
        v39 = 2112;
        v40 = v28;
        v41 = 2112;
        v42 = v22;
        _os_log_impl(&dword_2218F0000, v25, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Responding to fetch or create reader key message: %@ with: %@", buf, 0x2Au);

        v8 = v31;
        v23 = v29;
      }

      objc_autoreleasePoolPop(v23);
    }

  }
  else
  {
    v16 = (void *)MEMORY[0x227676638]();
    v17 = a1[4];
    HMFGetOSLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[5], "UUID");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = a1[6];
      *(_DWORD *)buf = 138544130;
      v36 = v19;
      v37 = 2112;
      v38 = v20;
      v39 = 2112;
      v40 = v21;
      v41 = 2112;
      v42 = v6;
      _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Responding to fetch or create reader key message: %@ with: %@", buf, 0x2Au);

    }
    objc_autoreleasePoolPop(v16);
    objc_msgSend(a1[6], "respondWithError:", v6);
  }

}

void __70__HMDHomeNFCReaderKeyManager_handleDeleteKeychainItemForNFCReaderKey___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  uint64_t v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
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
      *(_DWORD *)buf = 138543618;
      v15 = v8;
      v16 = 2112;
      v17 = v3;
      _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_ERROR, "%{public}@Failed to handle message to delete nfc reader key: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v4);
    objc_msgSend(*(id *)(a1 + 40), "respondWithError:", v3);
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v15 = v9;
      _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Successfully handled message to delete nfc reader key", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v4);
    v10 = *(void **)(a1 + 40);
    v12 = CFSTR("HMDHomeDeleteKeychainItemForNFCReaderKeyMessageKeyDidSucceed");
    v13 = MEMORY[0x24BDBD1C8];
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v13, &v12, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "respondWithPayload:", v11);

  }
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t74_173312 != -1)
    dispatch_once(&logCategory__hmf_once_t74_173312, &__block_literal_global_173313);
  return (id)logCategory__hmf_once_v75_173314;
}

void __41__HMDHomeNFCReaderKeyManager_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v75_173314;
  logCategory__hmf_once_v75_173314 = v0;

}

@end
