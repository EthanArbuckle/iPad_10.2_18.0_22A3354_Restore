@implementation HMMTRSyncClusterDoorLock

- (HMMTRSyncClusterDoorLock)initWithDevice:(id)a3 baseDevice:(id)a4 endpoint:(unsigned __int16)a5 queue:(id)a6 accessoryServer:(id)a7
{
  uint64_t v9;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  HMMTRSyncClusterDoorLock *v17;
  NSObject *v18;
  void *v19;
  id v20;
  id v21;
  uint64_t v22;
  id v23;
  void *v24;
  uint64_t v25;
  HMFFuture *apiSerializationFuture;
  uint64_t v27;
  MTRBaseClusterDoorLock *baseDoorLock;
  id v30;
  id v31;
  objc_super v32;
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  id v36;
  __int16 v37;
  id v38;
  __int16 v39;
  void *v40;
  uint64_t v41;

  v9 = a5;
  v41 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a4;
  v14 = a6;
  v15 = a7;
  v16 = (void *)MEMORY[0x242656984]();
  v17 = self;
  HMFGetOSLogHandle();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v31 = v15;
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedShort:", v9);
    v30 = a6;
    v20 = a4;
    v21 = v14;
    v22 = v9;
    v23 = v13;
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v34 = v19;
    v35 = 2112;
    v36 = v12;
    v37 = 2112;
    v38 = v23;
    v39 = 2112;
    v40 = v24;
    _os_log_impl(&dword_23E95B000, v18, OS_LOG_TYPE_INFO, "%{public}@HMMTRSyncClusterDoorLock initWithDevice called with device: %@, baseDevice: %@ and endpoint: %@", buf, 0x2Au);

    v13 = v23;
    v9 = v22;
    v14 = v21;
    a4 = v20;
    a6 = v30;

    v15 = v31;
  }

  objc_autoreleasePoolPop(v16);
  if (!v12
    || (v32.receiver = v17,
        v32.super_class = (Class)HMMTRSyncClusterDoorLock,
        (v17 = -[MTRClusterDoorLock initWithDevice:endpoint:queue:](&v32, sel_initWithDevice_endpoint_queue_, v12, v9, v14)) != 0))
  {
    objc_storeStrong((id *)&v17->_queue, a6);
    v17->_endpoint = v9;
    objc_msgSend(MEMORY[0x24BE3F168], "blessWithImplicitContext:", v14);
    objc_msgSend(MEMORY[0x24BE3F180], "futureWithNoValue");
    v25 = objc_claimAutoreleasedReturnValue();
    apiSerializationFuture = v17->_apiSerializationFuture;
    v17->_apiSerializationFuture = (HMFFuture *)v25;

    v17->_unfairLock._os_unfair_lock_opaque = 0;
    objc_storeWeak((id *)&v17->_accessoryServer, v15);
    objc_storeStrong((id *)&v17->_baseDevice, a4);
    v27 = objc_msgSend(objc_alloc(MEMORY[0x24BDDB578]), "initWithDevice:endpoint:queue:", v13, v9, v14);
    baseDoorLock = v17->_baseDoorLock;
    v17->_baseDoorLock = (MTRBaseClusterDoorLock *)v27;

  }
  return v17;
}

- (id)serialize:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t);
  void *v14;
  id v15;
  id v16;
  id v17;
  id v18;

  v4 = a3;
  v18 = 0;
  objc_msgSend(MEMORY[0x24BE3F180], "futureWithPromise:", &v18);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock_with_options();
  -[HMMTRSyncClusterDoorLock apiSerializationFuture](self, "apiSerializationFuture");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x24BDAC760];
  v12 = 3221225472;
  v13 = __38__HMMTRSyncClusterDoorLock_serialize___block_invoke;
  v14 = &unk_250F22B90;
  v15 = v18;
  v7 = v4;
  v17 = v7;
  v8 = v5;
  v16 = v8;
  objc_msgSend(v6, "finally:", &v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMTRSyncClusterDoorLock setApiSerializationFuture:](self, "setApiSerializationFuture:", v9, v11, v12, v13, v14);

  os_unfair_lock_unlock(&self->_unfairLock);
  return v8;
}

- (id)ensureAccessoryConnected:(id)a3 flow:(id)a4
{
  void (**v6)(_QWORD);
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  HMMTRSyncClusterDoorLock *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  _QWORD v22[4];
  id v23;
  HMMTRSyncClusterDoorLock *v24;
  id v25;
  id v26;
  _QWORD v27[4];
  id v28;
  id v29;
  void (**v30)(_QWORD);
  _BYTE buf[12];
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v6 = (void (**)(_QWORD))a3;
  v7 = a4;
  -[HMMTRSyncClusterDoorLock accessoryServer](self, "accessoryServer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    *(_QWORD *)buf = 0;
    objc_msgSend(MEMORY[0x24BE3F180], "futureWithPromise:", buf);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_alloc(MEMORY[0x24BE3F168]);
    -[HMMTRSyncClusterDoorLock queue](self, "queue");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v10, "initWithQueue:", v11);

    -[HMMTRSyncClusterDoorLock accessoryServer](self, "accessoryServer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = MEMORY[0x24BDAC760];
    v27[0] = MEMORY[0x24BDAC760];
    v27[1] = 3221225472;
    v27[2] = __58__HMMTRSyncClusterDoorLock_ensureAccessoryConnected_flow___block_invoke;
    v27[3] = &unk_250F240D8;
    v28 = v12;
    v29 = *(id *)buf;
    v30 = v6;
    v22[0] = v14;
    v22[1] = 3221225472;
    v22[2] = __58__HMMTRSyncClusterDoorLock_ensureAccessoryConnected_flow___block_invoke_3;
    v22[3] = &unk_250F1F9B0;
    v23 = v28;
    v24 = self;
    v25 = v7;
    v26 = v29;
    v15 = v28;
    objc_msgSend(v13, "queueAccessoryOperation:highPriority:completion:", v27, 1, v22);

  }
  else
  {
    v16 = (void *)MEMORY[0x242656984]();
    v17 = self;
    HMFGetOSLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "UUID");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v19;
      v32 = 2112;
      v33 = v20;
      _os_log_impl(&dword_23E95B000, v18, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Accessory server is nil", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v16);
    v6[2](v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

- (void)unlockDoorWithAccessoryUUID:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __74__HMMTRSyncClusterDoorLock_unlockDoorWithAccessoryUUID_completionHandler___block_invoke;
  v11[3] = &unk_250F1FA78;
  v11[4] = self;
  v12 = v6;
  v13 = v7;
  v8 = v7;
  v9 = v6;
  v10 = -[HMMTRSyncClusterDoorLock serialize:](self, "serialize:", v11);

}

- (void)lockDoorWithAccessoryUUID:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __72__HMMTRSyncClusterDoorLock_lockDoorWithAccessoryUUID_completionHandler___block_invoke;
  v11[3] = &unk_250F1FA78;
  v11[4] = self;
  v12 = v6;
  v13 = v7;
  v8 = v7;
  v9 = v6;
  v10 = -[HMMTRSyncClusterDoorLock serialize:](self, "serialize:", v11);

}

- (id)findOrAddUserWithUniqueID:(id)a3 flow:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMMTRSyncClusterDoorLock *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  _QWORD v17[5];
  id v18;
  id v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x242656984]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "UUID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v21 = v11;
    v22 = 2112;
    v23 = v12;
    v24 = 2112;
    v25 = v6;
    _os_log_impl(&dword_23E95B000, v10, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] findOrAddUserWithUniqueID: %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v8);
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __59__HMMTRSyncClusterDoorLock_findOrAddUserWithUniqueID_flow___block_invoke;
  v17[3] = &unk_250F1FAA0;
  v17[4] = v9;
  v18 = v6;
  v19 = v7;
  v13 = v7;
  v14 = v6;
  -[HMMTRSyncClusterDoorLock serialize:](v9, "serialize:", v17);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)findUserOrAvailableSlotWithUserUniqueID:(id)a3 flow:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  _QWORD v12[5];
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __73__HMMTRSyncClusterDoorLock_findUserOrAvailableSlotWithUserUniqueID_flow___block_invoke;
  v12[3] = &unk_250F1FAA0;
  v12[4] = self;
  v13 = v6;
  v14 = v7;
  v8 = v7;
  v9 = v6;
  -[HMMTRSyncClusterDoorLock serialize:](self, "serialize:", v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)_findUserOrAvailableSlotWithUserUniqueID:(id)a3 flow:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMMTRSyncClusterDoorLock *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  _QWORD v20[5];
  id v21;
  id v22;
  id v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x242656984]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "UUID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v25 = v11;
    v26 = 2112;
    v27 = v12;
    _os_log_impl(&dword_23E95B000, v10, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] findHomeUserOrAvailableSlot", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v8);
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMTRSyncClusterDoorLock fetchCurrentFabricIndex_flow:](v9, "fetchCurrentFabricIndex_flow:", v7);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __74__HMMTRSyncClusterDoorLock__findUserOrAvailableSlotWithUserUniqueID_flow___block_invoke;
  v20[3] = &unk_250F1FAF0;
  v20[4] = v9;
  v21 = v7;
  v22 = v6;
  v23 = v13;
  v15 = v13;
  v16 = v6;
  v17 = v7;
  objc_msgSend(v14, "then:", v20);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (id)getUsersWithUniqueIDs:(id)a3 flow:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  _QWORD v12[5];
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __55__HMMTRSyncClusterDoorLock_getUsersWithUniqueIDs_flow___block_invoke;
  v12[3] = &unk_250F1FAA0;
  v12[4] = self;
  v13 = v7;
  v14 = v6;
  v8 = v6;
  v9 = v7;
  -[HMMTRSyncClusterDoorLock serialize:](self, "serialize:", v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)getUserAtIndex:(int64_t)a3 flow:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _QWORD v10[5];
  id v11;
  int64_t v12;

  v6 = a4;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __48__HMMTRSyncClusterDoorLock_getUserAtIndex_flow___block_invoke;
  v10[3] = &unk_250F1FB90;
  v11 = v6;
  v12 = a3;
  v10[4] = self;
  v7 = v6;
  -[HMMTRSyncClusterDoorLock serialize:](self, "serialize:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_getUserAtIndex:(int64_t)a3 flow:(id)a4
{
  id v6;
  void *v7;
  HMMTRSyncClusterDoorLock *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  _QWORD v15[5];
  id v16;
  int64_t v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  int64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = (void *)MEMORY[0x242656984]();
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
    v19 = v10;
    v20 = 2112;
    v21 = v11;
    v22 = 2048;
    v23 = a3;
    _os_log_impl(&dword_23E95B000, v9, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] getUserAtIndex: %ld", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v7);
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __49__HMMTRSyncClusterDoorLock__getUserAtIndex_flow___block_invoke;
  v15[3] = &unk_250F1FB90;
  v16 = v6;
  v17 = a3;
  v15[4] = v8;
  v12 = v6;
  -[HMMTRSyncClusterDoorLock ensureAccessoryConnected:flow:](v8, "ensureAccessoryConnected:flow:", v15, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)removeHomeUser
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __42__HMMTRSyncClusterDoorLock_removeHomeUser__block_invoke;
  v3[3] = &unk_250F1FBE0;
  v3[4] = self;
  -[HMMTRSyncClusterDoorLock serialize:](self, "serialize:", v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)removeUserWithUniqueID:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __51__HMMTRSyncClusterDoorLock_removeUserWithUniqueID___block_invoke;
  v8[3] = &unk_250F1FC08;
  v8[4] = self;
  v9 = v4;
  v5 = v4;
  -[HMMTRSyncClusterDoorLock serialize:](self, "serialize:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_removeUserWithUniqueID:(id)a3 flow:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMMTRSyncClusterDoorLock *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  _QWORD v22[5];
  id v23;
  id v24;
  _QWORD v25[5];
  id v26;
  id v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x242656984]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "UUID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v29 = v11;
    v30 = 2112;
    v31 = v12;
    v32 = 2112;
    v33 = v6;
    _os_log_impl(&dword_23E95B000, v10, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Removing user with userUniqueID: %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v8);
  -[HMMTRSyncClusterDoorLock _findUserOrAvailableSlotWithUserUniqueID:flow:](v9, "_findUserOrAvailableSlotWithUserUniqueID:flow:", v6, v7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = MEMORY[0x24BDAC760];
  v25[0] = MEMORY[0x24BDAC760];
  v25[1] = 3221225472;
  v25[2] = __57__HMMTRSyncClusterDoorLock__removeUserWithUniqueID_flow___block_invoke;
  v25[3] = &unk_250F1FC30;
  v25[4] = v9;
  v15 = v7;
  v26 = v15;
  v16 = v6;
  v27 = v16;
  objc_msgSend(v13, "then:", v25);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v14;
  v22[1] = 3221225472;
  v22[2] = __57__HMMTRSyncClusterDoorLock__removeUserWithUniqueID_flow___block_invoke_133;
  v22[3] = &unk_250F233F0;
  v22[4] = v9;
  v23 = v15;
  v24 = v16;
  v18 = v16;
  v19 = v15;
  objc_msgSend(v17, "recover:", v22);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (id)fetchAccessorySupportsPinCodes
{
  void *v3;
  void *v4;
  _QWORD v6[5];

  -[HMMTRSyncClusterDoorLock fetchFeatureMap](self, "fetchFeatureMap");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __58__HMMTRSyncClusterDoorLock_fetchAccessorySupportsPinCodes__block_invoke;
  v6[3] = &unk_250F1FC58;
  v6[4] = self;
  objc_msgSend(v3, "then:", v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)readAttributeWithEndpointIDAndCompletion:(id)a3 clusterID:(id)a4 attributeID:(id)a5 completion:(id)a6
{
  objc_class *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void (**v18)(id, void *, _QWORD);

  v18 = (void (**)(id, void *, _QWORD))a6;
  v10 = (objc_class *)MEMORY[0x24BDDB7F0];
  v11 = a5;
  v12 = a4;
  v13 = a3;
  v14 = objc_alloc_init(v10);
  -[MTRGenericCluster device](self, "device");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "readAttributeWithEndpointID:clusterID:attributeID:params:", v13, v12, v11, v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    v18[2](v18, v16, 0);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:", 2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, void *, void *))v18)[2](v18, 0, v17);

  }
}

- (id)fetchAccessorySupportsTapToUnlock
{
  void *v3;
  void *v4;
  _QWORD v6[5];

  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __61__HMMTRSyncClusterDoorLock_fetchAccessorySupportsTapToUnlock__block_invoke;
  v6[3] = &unk_250F1FBE0;
  v6[4] = self;
  objc_msgSend(MEMORY[0x24BE3F178], "untrackedPlaceholderFlow");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMTRSyncClusterDoorLock ensureAccessoryConnected:flow:](self, "ensureAccessoryConnected:flow:", v6, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)fetchAccessorySupportsAliroProvisioning
{
  void *v3;
  void *v4;
  _QWORD v6[5];

  -[HMMTRSyncClusterDoorLock fetchFeatureMap](self, "fetchFeatureMap");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __67__HMMTRSyncClusterDoorLock_fetchAccessorySupportsAliroProvisioning__block_invoke;
  v6[3] = &unk_250F1FC58;
  v6[4] = self;
  objc_msgSend(v3, "then:", v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)fetchAccessorySupportsAliroBLEUWB
{
  void *v3;
  void *v4;
  _QWORD v6[5];

  -[HMMTRSyncClusterDoorLock fetchFeatureMap](self, "fetchFeatureMap");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __61__HMMTRSyncClusterDoorLock_fetchAccessorySupportsAliroBLEUWB__block_invoke;
  v6[3] = &unk_250F1FC58;
  v6[4] = self;
  objc_msgSend(v3, "then:", v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)fetchReaderGroupSubIdentifier
{
  void *v3;
  void *v4;
  _QWORD v6[5];

  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __57__HMMTRSyncClusterDoorLock_fetchReaderGroupSubIdentifier__block_invoke;
  v6[3] = &unk_250F1FBE0;
  v6[4] = self;
  objc_msgSend(MEMORY[0x24BE3F178], "untrackedPlaceholderFlow");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMTRSyncClusterDoorLock ensureAccessoryConnected:flow:](self, "ensureAccessoryConnected:flow:", v6, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)fetchFeatureMapForSupportingWeekAndYearDaySchedule
{
  void *v2;
  void *v3;

  -[HMMTRSyncClusterDoorLock fetchFeatureMap](self, "fetchFeatureMap");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "then:", &__block_literal_global_277);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)fetchAccessoryColor_flow:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v10;
  id v11;

  v4 = a3;
  v10 = MEMORY[0x24BDAC760];
  v11 = v4;
  v5 = (void *)MEMORY[0x24BE3F178];
  v6 = v4;
  objc_msgSend(v5, "untrackedPlaceholderFlow", v10, 3221225472, __53__HMMTRSyncClusterDoorLock_fetchAccessoryColor_flow___block_invoke, &unk_250F1FC08, self);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMTRSyncClusterDoorLock ensureAccessoryConnected:flow:](self, "ensureAccessoryConnected:flow:", &v10, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)fetchFeatureMap
{
  void *v3;
  void *v4;
  _QWORD v6[5];

  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __43__HMMTRSyncClusterDoorLock_fetchFeatureMap__block_invoke;
  v6[3] = &unk_250F1FBE0;
  v6[4] = self;
  objc_msgSend(MEMORY[0x24BE3F178], "untrackedPlaceholderFlow");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMTRSyncClusterDoorLock ensureAccessoryConnected:flow:](self, "ensureAccessoryConnected:flow:", v6, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)getAllPinCodes
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __42__HMMTRSyncClusterDoorLock_getAllPinCodes__block_invoke;
  v3[3] = &unk_250F1FBE0;
  v3[4] = self;
  -[HMMTRSyncClusterDoorLock serialize:](self, "serialize:", v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)addOrUpdatePinCodeWithValue:(id)a3 forUserIndex:(int64_t)a4
{
  id v6;
  id v7;
  void *v8;
  _QWORD v10[5];
  id v11;
  int64_t v12;

  v6 = a3;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __69__HMMTRSyncClusterDoorLock_addOrUpdatePinCodeWithValue_forUserIndex___block_invoke;
  v10[3] = &unk_250F1FB90;
  v10[4] = self;
  v11 = v6;
  v12 = a4;
  v7 = v6;
  -[HMMTRSyncClusterDoorLock serialize:](self, "serialize:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)removePinCodeForUserIndex:(int64_t)a3
{
  _QWORD v4[6];

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __54__HMMTRSyncClusterDoorLock_removePinCodeForUserIndex___block_invoke;
  v4[3] = &unk_250F1FEA8;
  v4[4] = self;
  v4[5] = a3;
  -[HMMTRSyncClusterDoorLock serialize:](self, "serialize:", v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)setOrReadReaderConfig:(id)a3 flow:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMMTRSyncClusterDoorLock *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  _QWORD v17[5];
  id v18;
  id v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x242656984]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "UUID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v21 = v11;
    v22 = 2112;
    v23 = v12;
    v24 = 2112;
    v25 = v6;
    _os_log_impl(&dword_23E95B000, v10, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] setOrReadReaderConfig: %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v8);
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __55__HMMTRSyncClusterDoorLock_setOrReadReaderConfig_flow___block_invoke;
  v17[3] = &unk_250F1FAA0;
  v17[4] = v9;
  v18 = v6;
  v19 = v7;
  v13 = v7;
  v14 = v6;
  -[HMMTRSyncClusterDoorLock ensureAccessoryConnected:flow:](v9, "ensureAccessoryConnected:flow:", v17, v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)readReaderConfigWithFlow:(id)a3
{
  id v4;
  void *v5;
  HMMTRSyncClusterDoorLock *v6;
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
  id v21;
  void *v22;
  _QWORD v24[5];
  id v25;
  _QWORD v26[3];
  _BYTE buf[12];
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x242656984]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "UUID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = v8;
    v28 = 2112;
    v29 = v9;
    _os_log_impl(&dword_23E95B000, v7, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] readReaderConfig", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  *(_QWORD *)buf = 0;
  objc_msgSend(MEMORY[0x24BE3F180], "futureWithPromise:", buf);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)buf, "resolverBlock");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMTRSyncClusterDoorLock baseDoorLock](v6, "baseDoorLock");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "readAttributeAliroReaderVerificationKeyWithCompletion:", v11);

  v26[0] = v10;
  *(_QWORD *)buf = 0;
  objc_msgSend(MEMORY[0x24BE3F180], "futureWithPromise:", buf);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)buf, "resolverBlock");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMTRSyncClusterDoorLock baseDoorLock](v6, "baseDoorLock");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "readAttributeAliroReaderGroupIdentifierWithCompletion:", v14);

  v26[1] = v13;
  *(_QWORD *)buf = 0;
  objc_msgSend(MEMORY[0x24BE3F180], "futureWithPromise:", buf);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)buf, "resolverBlock");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMTRSyncClusterDoorLock baseDoorLock](v6, "baseDoorLock");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "readAttributeAliroGroupResolvingKeyWithCompletion:", v17);

  v26[2] = v16;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v26, 3);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE3F180], "allSettled:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = MEMORY[0x24BDAC760];
  v24[1] = 3221225472;
  v24[2] = __53__HMMTRSyncClusterDoorLock_readReaderConfigWithFlow___block_invoke;
  v24[3] = &unk_250F1FED0;
  v24[4] = v6;
  v25 = v4;
  v21 = v4;
  objc_msgSend(v20, "then:", v24);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

- (id)addOrUpdateReaderKeyData:(id)a3 flow:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  _QWORD v12[5];
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __58__HMMTRSyncClusterDoorLock_addOrUpdateReaderKeyData_flow___block_invoke;
  v12[3] = &unk_250F1FAA0;
  v12[4] = self;
  v13 = v7;
  v14 = v6;
  v8 = v6;
  v9 = v7;
  -[HMMTRSyncClusterDoorLock serialize:](self, "serialize:", v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)addIssuerKeyData:(id)a3 forUserIndex:(int64_t)a4 isUnifiedAccess:(BOOL)a5 flow:(id)a6
{
  _BOOL4 v7;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  _QWORD v18[5];
  id v19;
  id v20;
  id v21;
  int64_t v22;
  BOOL v23;

  v7 = a5;
  v10 = a3;
  v11 = a6;
  v12 = v11;
  v13 = &unk_250F3F060;
  v18[0] = MEMORY[0x24BDAC760];
  v18[2] = __79__HMMTRSyncClusterDoorLock_addIssuerKeyData_forUserIndex_isUnifiedAccess_flow___block_invoke;
  v18[3] = &unk_250F1FF48;
  v18[1] = 3221225472;
  if (v7)
    v13 = &unk_250F3F048;
  v18[4] = self;
  v19 = v11;
  v23 = v7;
  v20 = v10;
  v21 = v13;
  v22 = a4;
  v14 = v10;
  v15 = v12;
  -[HMMTRSyncClusterDoorLock serialize:](self, "serialize:", v18);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (id)addDeviceCredentialKeyData:(id)a3 ofType:(int64_t)a4 forUserIndex:(int64_t)a5 flow:(id)a6
{
  id v10;
  id v11;
  uint64_t v12;
  id v13;
  id v14;
  void *v15;
  _QWORD v17[5];
  id v18;
  id v19;
  uint64_t v20;
  int64_t v21;
  int64_t v22;

  v10 = a3;
  v11 = a6;
  v12 = objc_msgSend(&unk_250F3F048, "integerValue");
  if (a4 == 1)
    v12 = objc_msgSend(&unk_250F3F078, "integerValue");
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __80__HMMTRSyncClusterDoorLock_addDeviceCredentialKeyData_ofType_forUserIndex_flow___block_invoke;
  v17[3] = &unk_250F1FF98;
  v17[4] = self;
  v18 = v11;
  v19 = v10;
  v20 = v12;
  v21 = a4;
  v22 = a5;
  v13 = v10;
  v14 = v11;
  -[HMMTRSyncClusterDoorLock serialize:](self, "serialize:", v17);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)getAllUsers
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __39__HMMTRSyncClusterDoorLock_getAllUsers__block_invoke;
  v3[3] = &unk_250F1FBE0;
  v3[4] = self;
  -[HMMTRSyncClusterDoorLock serialize:](self, "serialize:", v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)clearUserAtIndex:(int64_t)a3 flow:(id)a4
{
  id v6;
  void *v7;
  HMMTRSyncClusterDoorLock *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  _QWORD v17[5];
  id v18;
  int64_t v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  int64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = (void *)MEMORY[0x242656984]();
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
    v21 = v10;
    v22 = 2112;
    v23 = v11;
    v24 = 2048;
    v25 = a3;
    _os_log_impl(&dword_23E95B000, v9, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Clearing user at index: %ld", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v7);
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __50__HMMTRSyncClusterDoorLock_clearUserAtIndex_flow___block_invoke;
  v17[3] = &unk_250F1FB90;
  v18 = v6;
  v19 = a3;
  v17[4] = v8;
  v12 = (void *)MEMORY[0x24BE3F178];
  v13 = v6;
  objc_msgSend(v12, "untrackedPlaceholderFlow");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMTRSyncClusterDoorLock ensureAccessoryConnected:flow:](v8, "ensureAccessoryConnected:flow:", v17, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)clearCredentialAtIndex:(int64_t)a3 withCredentialType:(id)a4 flow:(id)a5
{
  id v8;
  id v9;
  void *v10;
  HMMTRSyncClusterDoorLock *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  uint64_t v21;
  id v22;
  HMMTRSyncClusterDoorLock *v23;
  id v24;
  int64_t v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  int64_t v31;
  __int16 v32;
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  v9 = a5;
  v10 = (void *)MEMORY[0x242656984]();
  v11 = self;
  HMFGetOSLogHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "UUID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v27 = v13;
    v28 = 2112;
    v29 = v14;
    v30 = 2048;
    v31 = a3;
    v32 = 2112;
    v33 = v8;
    _os_log_impl(&dword_23E95B000, v12, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] clearCredentialAtIndex: %ld, withCredentialType: %@", buf, 0x2Au);

  }
  objc_autoreleasePoolPop(v10);
  v21 = MEMORY[0x24BDAC760];
  v22 = v8;
  v23 = v11;
  v24 = v9;
  v25 = a3;
  v15 = (void *)MEMORY[0x24BE3F178];
  v16 = v9;
  v17 = v8;
  objc_msgSend(v15, "untrackedPlaceholderFlow", v21, 3221225472, __75__HMMTRSyncClusterDoorLock_clearCredentialAtIndex_withCredentialType_flow___block_invoke, &unk_250F1FFC0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMTRSyncClusterDoorLock ensureAccessoryConnected:flow:](v11, "ensureAccessoryConnected:flow:", &v21, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (id)findOrAddUserWithUniqueID:(id)a3 withWeekDaySchedules:(id)a4 andYearDaySchedules:(id)a5 flow:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  _QWORD v20[5];
  id v21;
  id v22;
  id v23;
  id v24;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __100__HMMTRSyncClusterDoorLock_findOrAddUserWithUniqueID_withWeekDaySchedules_andYearDaySchedules_flow___block_invoke;
  v20[3] = &unk_250F20060;
  v20[4] = self;
  v21 = v13;
  v22 = v10;
  v23 = v11;
  v24 = v12;
  v14 = v12;
  v15 = v11;
  v16 = v10;
  v17 = v13;
  -[HMMTRSyncClusterDoorLock serialize:](self, "serialize:", v20);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (id)updateSchedulesForUserIndex:(int64_t)a3 withWeekDaySchedules:(id)a4 andYearDaySchedules:(id)a5 flow:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  _QWORD v18[5];
  id v19;
  id v20;
  id v21;
  int64_t v22;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __102__HMMTRSyncClusterDoorLock_updateSchedulesForUserIndex_withWeekDaySchedules_andYearDaySchedules_flow___block_invoke;
  v18[3] = &unk_250F20088;
  v18[4] = self;
  v19 = v12;
  v21 = v11;
  v22 = a3;
  v20 = v10;
  v13 = v11;
  v14 = v10;
  v15 = v12;
  -[HMMTRSyncClusterDoorLock serialize:](self, "serialize:", v18);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (id)readSchedulesForUserIndex:(int64_t)a3 flow:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _QWORD v10[5];
  id v11;
  int64_t v12;

  v6 = a4;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __59__HMMTRSyncClusterDoorLock_readSchedulesForUserIndex_flow___block_invoke;
  v10[3] = &unk_250F1FB90;
  v10[4] = self;
  v11 = v6;
  v12 = a3;
  v7 = v6;
  -[HMMTRSyncClusterDoorLock serialize:](self, "serialize:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)deriveHomePinFromUUID:(id)a3 flow:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  HMMTRSyncClusterDoorLock *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  int v17;
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[MTRClusterDoorLock readAttributeMaxPINCodeLengthWithParams:](self, "readAttributeMaxPINCodeLengthWithParams:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", CFSTR("value"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_msgSend((id)objc_opt_class(), "deriveHomePinFromUUID:withNumberOfDigits:flow:", v6, objc_msgSend(v9, "integerValue"), v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = (void *)MEMORY[0x242656984]();
    v12 = self;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "UUID");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138543618;
      v18 = v14;
      v19 = 2112;
      v20 = v15;
      _os_log_impl(&dword_23E95B000, v13, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Failed to read max pin code length from accessory", (uint8_t *)&v17, 0x16u);

    }
    objc_autoreleasePoolPop(v11);
    v10 = 0;
  }

  return v10;
}

- (id)provisionHomePin:(id)a3 flow:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v13[5];
  id v14;
  id v15;

  v6 = a3;
  v7 = a4;
  -[HMMTRSyncClusterDoorLock findOrAddUserWithUniqueID:userType:flow:](self, "findOrAddUserWithUniqueID:userType:flow:", &unk_250F3F090, &unk_250F3F0D8, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __50__HMMTRSyncClusterDoorLock_provisionHomePin_flow___block_invoke;
  v13[3] = &unk_250F1FEF8;
  v13[4] = self;
  v14 = v6;
  v15 = v7;
  v9 = v7;
  v10 = v6;
  objc_msgSend(v8, "then:", v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)pinCredentialForUser:(id)a3 flow:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMMTRSyncClusterDoorLock *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v17;
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x242656984]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "UUID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 138543874;
    v18 = v11;
    v19 = 2112;
    v20 = v12;
    v21 = 2112;
    v22 = v6;
    _os_log_impl(&dword_23E95B000, v10, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] pinCredentialForUser: %@", (uint8_t *)&v17, 0x20u);

  }
  objc_autoreleasePoolPop(v8);
  objc_msgSend(v6, "credentials");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "hmf_objectPassingTest:", &__block_literal_global_193);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "credentialIndex");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)rfidCredentialForUser:(id)a3 flow:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMMTRSyncClusterDoorLock *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v17;
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x242656984]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "UUID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 138543874;
    v18 = v11;
    v19 = 2112;
    v20 = v12;
    v21 = 2112;
    v22 = v6;
    _os_log_impl(&dword_23E95B000, v10, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] pinCredentialForUser: %@", (uint8_t *)&v17, 0x20u);

  }
  objc_autoreleasePoolPop(v8);
  objc_msgSend(v6, "credentials");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "hmf_objectPassingTest:", &__block_literal_global_194);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "credentialIndex");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)findOrAddUserWithUniqueID:(id)a3 userType:(id)a4 flow:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  HMMTRSyncClusterDoorLock *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  _QWORD v22[5];
  id v23;
  id v24;
  id v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  id v31;
  __int16 v32;
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)MEMORY[0x242656984]();
  v12 = self;
  HMFGetOSLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "UUID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v27 = v14;
    v28 = 2112;
    v29 = v15;
    v30 = 2112;
    v31 = v8;
    v32 = 2112;
    v33 = v9;
    _os_log_impl(&dword_23E95B000, v13, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] findOrAddUserWithUniqueID: %@, userType: %@ if creating new user", buf, 0x2Au);

  }
  objc_autoreleasePoolPop(v11);
  -[HMMTRSyncClusterDoorLock _findUserOrAvailableSlotWithUserUniqueID:flow:](v12, "_findUserOrAvailableSlotWithUserUniqueID:flow:", v8, v10);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __68__HMMTRSyncClusterDoorLock_findOrAddUserWithUniqueID_userType_flow___block_invoke;
  v22[3] = &unk_250F201F8;
  v22[4] = v12;
  v23 = v10;
  v24 = v8;
  v25 = v9;
  v17 = v9;
  v18 = v8;
  v19 = v10;
  objc_msgSend(v16, "then:", v22);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (id)firstAvailableCredentialSlotForCredentialType:(int64_t)a3 flow:(id)a4
{
  id v6;
  void *v7;
  HMMTRSyncClusterDoorLock *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v16;
  HMMTRSyncClusterDoorLock *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[5];
  id v23;
  int64_t v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  int64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = (void *)MEMORY[0x242656984]();
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
    v26 = v10;
    v27 = 2112;
    v28 = v11;
    v29 = 2048;
    v30 = a3;
    _os_log_impl(&dword_23E95B000, v9, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] firstAvailableCredentialSlotForCredentialType: %ld", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v7);
  if (objc_msgSend(&unk_250F3F030, "integerValue") == a3)
  {
    -[HMMTRSyncClusterDoorLock totalNumberOfPINCredentialsSupported_flow:](v8, "totalNumberOfPINCredentialsSupported_flow:", v6);
    v12 = objc_claimAutoreleasedReturnValue();
LABEL_10:
    v13 = (void *)v12;
    v22[0] = MEMORY[0x24BDAC760];
    v22[1] = 3221225472;
    v22[2] = __79__HMMTRSyncClusterDoorLock_firstAvailableCredentialSlotForCredentialType_flow___block_invoke;
    v22[3] = &unk_250F20220;
    v22[4] = v8;
    v24 = a3;
    v23 = v6;
    objc_msgSend(v13, "then:", v22);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_11;
  }
  if (objc_msgSend(&unk_250F3F048, "integerValue") == a3)
  {
    -[HMMTRSyncClusterDoorLock totalNumberOfRFIDCredentialsSupported_flow:](v8, "totalNumberOfRFIDCredentialsSupported_flow:", v6);
    v12 = objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
  if (objc_msgSend(&unk_250F3F060, "integerValue") == a3 || objc_msgSend(&unk_250F3F078, "integerValue") == a3)
  {
    objc_msgSend(MEMORY[0x24BE3F180], "futureWithValue:", &unk_250F3F168);
    v12 = objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
  v16 = (void *)MEMORY[0x242656984]();
  v17 = v8;
  HMFGetOSLogHandle();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "UUID");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v26 = v19;
    v27 = 2112;
    v28 = v20;
    v29 = 2048;
    v30 = a3;
    _os_log_impl(&dword_23E95B000, v18, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Unsupported credential type: %ld", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v16);
  v21 = (void *)MEMORY[0x24BE3F180];
  objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:", 5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "futureWithError:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_11:

  return v14;
}

- (id)findAvailableCredentialIndexStartingAtSlot:(int64_t)a3 forCredentialType:(int64_t)a4 assumingTotalNumberOfSlots:(int64_t)a5 flow:(id)a6
{
  id v10;
  void *v11;
  HMMTRSyncClusterDoorLock *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v20[5];
  id v21;
  int64_t v22;
  int64_t v23;
  int64_t v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  int64_t v30;
  __int16 v31;
  int64_t v32;
  __int16 v33;
  int64_t v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v10 = a6;
  v11 = (void *)MEMORY[0x242656984]();
  v12 = self;
  HMFGetOSLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "UUID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544386;
    v26 = v14;
    v27 = 2112;
    v28 = v15;
    v29 = 2048;
    v30 = a3;
    v31 = 2048;
    v32 = a4;
    v33 = 2048;
    v34 = a5;
    _os_log_impl(&dword_23E95B000, v13, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] findAvailableCredentialIndexStartingAtSlot: %ld forCredentialType: %ld assumingTotalNumberOfSlots: %ld", buf, 0x34u);

  }
  objc_autoreleasePoolPop(v11);
  if (a3 <= a5)
  {
    -[HMMTRSyncClusterDoorLock getCredentialAtIndex:forCredentialType:flow:](v12, "getCredentialAtIndex:forCredentialType:flow:", a3, a4, v10);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = __121__HMMTRSyncClusterDoorLock_findAvailableCredentialIndexStartingAtSlot_forCredentialType_assumingTotalNumberOfSlots_flow___block_invoke;
    v20[3] = &unk_250F20248;
    v22 = a3;
    v23 = a5;
    v20[4] = v12;
    v24 = a4;
    v21 = v10;
    objc_msgSend(v17, "then:", v20);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v16 = (void *)MEMORY[0x24BE3F180];
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("HMMTROperationErrorDomain"), 5, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "futureWithError:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v18;
}

- (id)getAllCredentialsIndexStartingAtSlot:(int64_t)a3 forCredentialType:(int64_t)a4 credentials:(id)a5 flow:(id)a6
{
  id v10;
  id v11;
  void *v12;
  HMMTRSyncClusterDoorLock *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  _QWORD v22[4];
  id v23;
  HMMTRSyncClusterDoorLock *v24;
  id v25;
  int64_t v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  int64_t v32;
  __int16 v33;
  int64_t v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v10 = a5;
  v11 = a6;
  v12 = (void *)MEMORY[0x242656984]();
  v13 = self;
  HMFGetOSLogHandle();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "UUID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v28 = v15;
    v29 = 2112;
    v30 = v16;
    v31 = 2048;
    v32 = a3;
    v33 = 2048;
    v34 = a4;
    _os_log_impl(&dword_23E95B000, v14, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] getAllCredentialsIndexStartingAtSlot: %ld forCredentialType: %ld", buf, 0x2Au);

  }
  objc_autoreleasePoolPop(v12);
  -[HMMTRSyncClusterDoorLock getCredentialAtIndex:forCredentialType:flow:](v13, "getCredentialAtIndex:forCredentialType:flow:", a3, a4, v11);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __100__HMMTRSyncClusterDoorLock_getAllCredentialsIndexStartingAtSlot_forCredentialType_credentials_flow___block_invoke;
  v22[3] = &unk_250F20270;
  v23 = v10;
  v24 = v13;
  v25 = v11;
  v26 = a4;
  v18 = v11;
  v19 = v10;
  objc_msgSend(v17, "then:", v22);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (id)findHomeUserWithUniqueID:(id)a3 indexStartingAtSlot:(int64_t)a4 assumingTotalNumberOfSlots:(int64_t)a5 availableSlots:(id)a6 currentFabricIndex:(id)a7 flow:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  HMMTRSyncClusterDoorLock *v19;
  NSObject *v20;
  void *v21;
  int64_t v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  id v27;
  id v28;
  void *v29;
  id v31;
  _QWORD v32[4];
  id v33;
  id v34;
  id v35;
  HMMTRSyncClusterDoorLock *v36;
  id v37;
  int64_t v38;
  int64_t v39;
  uint8_t buf[4];
  void *v41;
  __int16 v42;
  void *v43;
  __int16 v44;
  int64_t v45;
  __int16 v46;
  int64_t v47;
  __int16 v48;
  id v49;
  __int16 v50;
  id v51;
  uint64_t v52;

  v52 = *MEMORY[0x24BDAC8D0];
  v14 = a3;
  v15 = a6;
  v16 = a7;
  v17 = a8;
  v18 = (void *)MEMORY[0x242656984]();
  v19 = self;
  HMFGetOSLogHandle();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "UUID");
    v31 = v14;
    v22 = a5;
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544642;
    v41 = v21;
    v42 = 2112;
    v43 = v23;
    v44 = 2048;
    v45 = a4;
    v46 = 2048;
    v47 = v22;
    v48 = 2112;
    v49 = v15;
    v50 = 2112;
    v51 = v16;
    _os_log_impl(&dword_23E95B000, v20, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] findHomeUserIndexStartingAtSlot: %ld assumingTotalNumberOfSlots: %ld availableSlots: %@ currentFabricIndex: %@", buf, 0x3Eu);

    a5 = v22;
    v14 = v31;

  }
  objc_autoreleasePoolPop(v18);
  -[HMMTRSyncClusterDoorLock _getUserAtIndex:flow:](v19, "_getUserAtIndex:flow:", a4, v17);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = MEMORY[0x24BDAC760];
  v32[1] = 3221225472;
  v32[2] = __139__HMMTRSyncClusterDoorLock_findHomeUserWithUniqueID_indexStartingAtSlot_assumingTotalNumberOfSlots_availableSlots_currentFabricIndex_flow___block_invoke;
  v32[3] = &unk_250F20298;
  v33 = v16;
  v34 = v14;
  v38 = a4;
  v39 = a5;
  v35 = v15;
  v36 = v19;
  v37 = v17;
  v25 = v17;
  v26 = v15;
  v27 = v14;
  v28 = v16;
  objc_msgSend(v24, "then:", v32);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  return v29;
}

- (id)getAllUsersStartingAtSlot:(int64_t)a3 assumingTotalNumberOfSlots:(int64_t)a4 users:(id)a5 flow:(id)a6
{
  id v10;
  id v11;
  void *v12;
  HMMTRSyncClusterDoorLock *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  _QWORD v22[4];
  id v23;
  HMMTRSyncClusterDoorLock *v24;
  id v25;
  int64_t v26;
  int64_t v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  int64_t v33;
  __int16 v34;
  int64_t v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v10 = a5;
  v11 = a6;
  v12 = (void *)MEMORY[0x242656984]();
  v13 = self;
  HMFGetOSLogHandle();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "UUID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v29 = v15;
    v30 = 2112;
    v31 = v16;
    v32 = 2048;
    v33 = a3;
    v34 = 2048;
    v35 = a4;
    _os_log_impl(&dword_23E95B000, v14, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] getAllUsersStartingAtSlot: %ld assumingTotalNumberOfSlots: %ld", buf, 0x2Au);

  }
  objc_autoreleasePoolPop(v12);
  -[HMMTRSyncClusterDoorLock _getUserAtIndex:flow:](v13, "_getUserAtIndex:flow:", a3, v11);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __92__HMMTRSyncClusterDoorLock_getAllUsersStartingAtSlot_assumingTotalNumberOfSlots_users_flow___block_invoke;
  v22[3] = &unk_250F202C0;
  v26 = a3;
  v27 = a4;
  v23 = v10;
  v24 = v13;
  v25 = v11;
  v18 = v11;
  v19 = v10;
  objc_msgSend(v17, "then:", v22);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (id)findOperationOrderForModifyingWeekDaySchedules:(id)a3 andYearDaySchedules:(id)a4 forUserIndex:(int64_t)a5 flow:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  HMMTRSyncClusterDoorLock *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  HMMTRSyncClusterDoorLock *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  _QWORD v31[5];
  id v32;
  int64_t v33;
  _QWORD v34[5];
  id v35;
  int64_t v36;
  _QWORD v37[2];
  uint8_t buf[4];
  void *v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  id v43;
  __int16 v44;
  id v45;
  __int16 v46;
  int64_t v47;
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a6;
  v13 = (void *)MEMORY[0x242656984]();
  v14 = self;
  HMFGetOSLogHandle();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "UUID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544386;
    v39 = v16;
    v40 = 2112;
    v41 = v17;
    v42 = 2112;
    v43 = v10;
    v44 = 2112;
    v45 = v11;
    v46 = 2048;
    v47 = a5;
    _os_log_impl(&dword_23E95B000, v15, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] findOperationOrderForModifyingWeekDaySchedules: %@ andYearDaySchedules: %@ forUserIndex: %ld", buf, 0x34u);

  }
  objc_autoreleasePoolPop(v13);
  if (objc_msgSend(v10, "hmf_isEmpty") && objc_msgSend(v11, "hmf_isEmpty"))
  {
    v18 = (void *)MEMORY[0x24BE3F180];
    -[HMMTRSyncClusterDoorLock clearScheduleOfScheduleType:atScheduleIndex:forUserAtUserIndex:flow:](v14, "clearScheduleOfScheduleType:atScheduleIndex:forUserAtUserIndex:flow:", 0, 254, a5, v12);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v37[0] = v19;
    -[HMMTRSyncClusterDoorLock clearScheduleOfScheduleType:atScheduleIndex:forUserAtUserIndex:flow:](v14, "clearScheduleOfScheduleType:atScheduleIndex:forUserAtUserIndex:flow:", 1, 254, a5, v12);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v37[1] = v20;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v37, 2);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "all:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_14;
  }
  if (objc_msgSend(v11, "hmf_isEmpty"))
  {
    -[HMMTRSyncClusterDoorLock updateSchedulesOfScheduleType:withRequestedSchedules:forUserAtUserIndex:flow:](v14, "updateSchedulesOfScheduleType:withRequestedSchedules:forUserAtUserIndex:flow:", 0, v10, a5, v12);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v34[0] = MEMORY[0x24BDAC760];
    v34[1] = 3221225472;
    v34[2] = __113__HMMTRSyncClusterDoorLock_findOperationOrderForModifyingWeekDaySchedules_andYearDaySchedules_forUserIndex_flow___block_invoke;
    v34[3] = &unk_250F202E8;
    v34[4] = v14;
    v36 = a5;
    v35 = v12;
    objc_msgSend(v19, "then:", v34);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v35;
LABEL_10:

    goto LABEL_14;
  }
  if (objc_msgSend(v10, "hmf_isEmpty"))
  {
    -[HMMTRSyncClusterDoorLock updateSchedulesOfScheduleType:withRequestedSchedules:forUserAtUserIndex:flow:](v14, "updateSchedulesOfScheduleType:withRequestedSchedules:forUserAtUserIndex:flow:", 1, v11, a5, v12);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v31[0] = MEMORY[0x24BDAC760];
    v31[1] = 3221225472;
    v31[2] = __113__HMMTRSyncClusterDoorLock_findOperationOrderForModifyingWeekDaySchedules_andYearDaySchedules_forUserIndex_flow___block_invoke_2;
    v31[3] = &unk_250F202E8;
    v31[4] = v14;
    v33 = a5;
    v32 = v12;
    objc_msgSend(v19, "then:", v31);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v32;
    goto LABEL_10;
  }
  v24 = (void *)MEMORY[0x242656984]();
  v25 = v14;
  HMFGetOSLogHandle();
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "UUID");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v39 = v27;
    v40 = 2112;
    v41 = v28;
    _os_log_impl(&dword_23E95B000, v26, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to set schedule since both year day and week day schedule types are set at the same time.", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v24);
  v29 = (void *)MEMORY[0x24BE3F180];
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("HMMTROperationErrorDomain"), 9, 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "futureWithError:", v19);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_14:

  return v22;
}

- (id)updateSchedulesOfScheduleType:(int64_t)a3 withRequestedSchedules:(id)a4 forUserAtUserIndex:(int64_t)a5 flow:(id)a6
{
  id v10;
  id v11;
  void *v12;
  HMMTRSyncClusterDoorLock *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  unint64_t v17;
  void *v18;
  HMMTRSyncClusterDoorLock *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v28[5];
  id v29;
  int64_t v30;
  int64_t v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  int64_t v37;
  __int16 v38;
  id v39;
  __int16 v40;
  int64_t v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v10 = a4;
  v11 = a6;
  v12 = (void *)MEMORY[0x242656984]();
  v13 = self;
  HMFGetOSLogHandle();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "UUID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544386;
    v33 = v15;
    v34 = 2112;
    v35 = v16;
    v36 = 2048;
    v37 = a3;
    v38 = 2112;
    v39 = v10;
    v40 = 2048;
    v41 = a5;
    _os_log_impl(&dword_23E95B000, v14, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] updateSchedulesOfScheduleType: %ld, withRequestedSchedules: %@ forUserIndex: %ld", buf, 0x34u);

  }
  objc_autoreleasePoolPop(v12);
  if (objc_msgSend(v10, "count"))
  {
    v17 = -[HMMTRSyncClusterDoorLock totalNumberOfSchedulesSupportedOfScheduleType:withDefaultCapacity:flow:](v13, "totalNumberOfSchedulesSupportedOfScheduleType:withDefaultCapacity:flow:", a3, 1, v11);
    if (objc_msgSend(v10, "count") <= v17)
    {
      -[HMMTRSyncClusterDoorLock findScheduleSlotsToAddAndClearForScheduleType:withRequestedSchedules:forUserAtUserIndex:numberOfSchedulesSupported:flow:](v13, "findScheduleSlotsToAddAndClearForScheduleType:withRequestedSchedules:forUserAtUserIndex:numberOfSchedulesSupported:flow:", a3, v10, a5, v17, v11);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v28[0] = MEMORY[0x24BDAC760];
      v28[1] = 3221225472;
      v28[2] = __105__HMMTRSyncClusterDoorLock_updateSchedulesOfScheduleType_withRequestedSchedules_forUserAtUserIndex_flow___block_invoke;
      v28[3] = &unk_250F20360;
      v28[4] = v13;
      v30 = a3;
      v31 = a5;
      v29 = v11;
      objc_msgSend(v26, "then:", v28);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v18 = (void *)MEMORY[0x242656984]();
      v19 = v13;
      HMFGetOSLogHandle();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "UUID");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v33 = v21;
        v34 = 2112;
        v35 = v22;
        _os_log_impl(&dword_23E95B000, v20, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to updateSchedulesOfScheduleType since requested schedules is more than accessory supports", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v18);
      v23 = (void *)MEMORY[0x24BE3F180];
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("HMMTROperationErrorDomain"), 9, 0);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "futureWithError:", v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    -[HMMTRSyncClusterDoorLock clearScheduleOfScheduleType:atScheduleIndex:forUserAtUserIndex:flow:](v13, "clearScheduleOfScheduleType:atScheduleIndex:forUserAtUserIndex:flow:", a3, 254, a5, v11);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v25;
}

- (id)findScheduleSlotsToAddAndClearForScheduleType:(int64_t)a3 withRequestedSchedules:(id)a4 forUserAtUserIndex:(int64_t)a5 numberOfSchedulesSupported:(int64_t)a6 flow:(id)a7
{
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  _QWORD v21[5];
  id v22;
  id v23;

  v12 = a4;
  v13 = a7;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", a6);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMTRSyncClusterDoorLock readSchedulesForWritingForScheduleType:forUserIndex:startingAtSlot:assumingTotalNumberOfSlots:schedulesToSlots:availableSlots:flow:](self, "readSchedulesForWritingForScheduleType:forUserIndex:startingAtSlot:assumingTotalNumberOfSlots:schedulesToSlots:availableSlots:flow:", a3, a5, 1, a6, v14, v15, v13);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __148__HMMTRSyncClusterDoorLock_findScheduleSlotsToAddAndClearForScheduleType_withRequestedSchedules_forUserAtUserIndex_numberOfSchedulesSupported_flow___block_invoke;
  v21[3] = &unk_250F203C8;
  v21[4] = self;
  v22 = v12;
  v23 = v13;
  v17 = v13;
  v18 = v12;
  objc_msgSend(v16, "then:", v21);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (id)readSchedulesForWritingForScheduleType:(int64_t)a3 forUserIndex:(int64_t)a4 startingAtSlot:(int64_t)a5 assumingTotalNumberOfSlots:(int64_t)a6 schedulesToSlots:(id)a7 availableSlots:(id)a8 flow:(id)a9
{
  id v14;
  id v15;
  id v16;
  void *v17;
  HMMTRSyncClusterDoorLock *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  void *v26;
  void *v28;
  _QWORD v30[4];
  id v31;
  HMMTRSyncClusterDoorLock *v32;
  id v33;
  id v34;
  int64_t v35;
  int64_t v36;
  int64_t v37;
  int64_t v38;
  uint8_t buf[4];
  void *v40;
  __int16 v41;
  void *v42;
  __int16 v43;
  int64_t v44;
  __int16 v45;
  int64_t v46;
  __int16 v47;
  int64_t v48;
  __int16 v49;
  int64_t v50;
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  v14 = a7;
  v15 = a8;
  v16 = a9;
  v17 = (void *)MEMORY[0x242656984]();
  v18 = self;
  HMFGetOSLogHandle();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v28 = v17;
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "UUID");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544642;
    v40 = v20;
    v41 = 2112;
    v42 = v21;
    v43 = 2048;
    v44 = a3;
    v45 = 2048;
    v46 = a4;
    v47 = 2048;
    v48 = a5;
    v49 = 2048;
    v50 = a6;
    _os_log_impl(&dword_23E95B000, v19, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] readSchedulesForWritingForScheduleType: %ld, forUserIndex: %ld, atSlot:%ld assumingTotalNumberOfSlots: %ld", buf, 0x3Eu);

    v17 = v28;
  }

  objc_autoreleasePoolPop(v17);
  -[HMMTRSyncClusterDoorLock getScheduleOfScheduleType:atScheduleIndex:forUserAtUserIndex:flow:](v18, "getScheduleOfScheduleType:atScheduleIndex:forUserAtUserIndex:flow:", a3, a5, a4, v16);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = MEMORY[0x24BDAC760];
  v30[1] = 3221225472;
  v30[2] = __159__HMMTRSyncClusterDoorLock_readSchedulesForWritingForScheduleType_forUserIndex_startingAtSlot_assumingTotalNumberOfSlots_schedulesToSlots_availableSlots_flow___block_invoke;
  v30[3] = &unk_250F203F0;
  v31 = v15;
  v32 = v18;
  v33 = v16;
  v34 = v14;
  v35 = a5;
  v36 = a6;
  v37 = a3;
  v38 = a4;
  v23 = v14;
  v24 = v16;
  v25 = v15;
  objc_msgSend(v22, "then:", v30);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  return v26;
}

- (id)_findSchedulesToBeAdded:(id)a3 dict:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v19 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v6, "objectForKeyedSubscript:", v13, (_QWORD)v18);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (v14)
        {
          objc_msgSend(v6, "objectForKeyedSubscript:", v13);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v15, "count") == 1)
          {
            objc_msgSend(v6, "removeObjectForKey:", v13);
          }
          else
          {
            objc_msgSend(v15, "anyObject");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "removeObject:", v16);

          }
        }
        else
        {
          objc_msgSend(v7, "addObject:", v13);
        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v10);
  }

  return v7;
}

- (id)findAllUsersWithCreatorFabricIndex:(id)a3 indexStartingAtSlot:(int64_t)a4 assumingTotalNumberOfSlots:(int64_t)a5 users:(id)a6 flow:(id)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  HMMTRSyncClusterDoorLock *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  _QWORD v26[4];
  id v27;
  id v28;
  HMMTRSyncClusterDoorLock *v29;
  id v30;
  int64_t v31;
  int64_t v32;
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  id v38;
  __int16 v39;
  int64_t v40;
  __int16 v41;
  int64_t v42;
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a6;
  v14 = a7;
  v15 = (void *)MEMORY[0x242656984]();
  v16 = self;
  HMFGetOSLogHandle();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "UUID");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544386;
    v34 = v18;
    v35 = 2112;
    v36 = v19;
    v37 = 2112;
    v38 = v12;
    v39 = 2048;
    v40 = a4;
    v41 = 2048;
    v42 = a5;
    _os_log_impl(&dword_23E95B000, v17, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] findAllUsersWithCreatorFabricIndex: %@ indexStartingAtSlot: %ld assumingTotalNumberOfSlots: %ld", buf, 0x34u);

  }
  objc_autoreleasePoolPop(v15);
  -[HMMTRSyncClusterDoorLock _getUserAtIndex:flow:](v16, "_getUserAtIndex:flow:", a4, v14);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = MEMORY[0x24BDAC760];
  v26[1] = 3221225472;
  v26[2] = __121__HMMTRSyncClusterDoorLock_findAllUsersWithCreatorFabricIndex_indexStartingAtSlot_assumingTotalNumberOfSlots_users_flow___block_invoke;
  v26[3] = &unk_250F20418;
  v27 = v12;
  v28 = v13;
  v31 = a4;
  v32 = a5;
  v29 = v16;
  v30 = v14;
  v21 = v14;
  v22 = v13;
  v23 = v12;
  objc_msgSend(v20, "then:", v26);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return v24;
}

- (id)addPinCodeWithValue:(id)a3 forUserIndex:(int64_t)a4 flow:(id)a5
{
  id v8;
  id v9;
  void *v10;
  HMMTRSyncClusterDoorLock *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  _QWORD v20[5];
  id v21;
  id v22;
  int64_t v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  id v29;
  __int16 v30;
  int64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  v10 = (void *)MEMORY[0x242656984]();
  v11 = self;
  HMFGetOSLogHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "UUID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v25 = v13;
    v26 = 2112;
    v27 = v14;
    v28 = 2112;
    v29 = v8;
    v30 = 2048;
    v31 = a4;
    _os_log_impl(&dword_23E95B000, v12, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] addPinCodeWithValue: %@, forUserIndex: %ld", buf, 0x2Au);

  }
  objc_autoreleasePoolPop(v10);
  -[HMMTRSyncClusterDoorLock firstAvailableCredentialSlotForCredentialType:flow:](v11, "firstAvailableCredentialSlotForCredentialType:flow:", objc_msgSend(&unk_250F3F030, "integerValue"), v9);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __66__HMMTRSyncClusterDoorLock_addPinCodeWithValue_forUserIndex_flow___block_invoke;
  v20[3] = &unk_250F20440;
  v20[4] = v11;
  v21 = v8;
  v22 = v9;
  v23 = a4;
  v16 = v9;
  v17 = v8;
  objc_msgSend(v15, "then:", v20);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (id)addReaderKeyData:(id)a3 toUserIndex:(int64_t)a4 flow:(id)a5
{
  id v8;
  id v9;
  void *v10;
  HMMTRSyncClusterDoorLock *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  _QWORD v20[5];
  id v21;
  id v22;
  int64_t v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  id v29;
  __int16 v30;
  int64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  v10 = (void *)MEMORY[0x242656984]();
  v11 = self;
  HMFGetOSLogHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "UUID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v25 = v13;
    v26 = 2112;
    v27 = v14;
    v28 = 2112;
    v29 = v8;
    v30 = 2048;
    v31 = a4;
    _os_log_impl(&dword_23E95B000, v12, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] addReaderKeyData: %@ to UserIndex %ld", buf, 0x2Au);

  }
  objc_autoreleasePoolPop(v10);
  -[HMMTRSyncClusterDoorLock firstAvailableCredentialSlotForCredentialType:flow:](v11, "firstAvailableCredentialSlotForCredentialType:flow:", objc_msgSend(&unk_250F3F048, "integerValue"), v9);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __62__HMMTRSyncClusterDoorLock_addReaderKeyData_toUserIndex_flow___block_invoke;
  v20[3] = &unk_250F20440;
  v20[4] = v11;
  v21 = v8;
  v22 = v9;
  v23 = a4;
  v16 = v9;
  v17 = v8;
  objc_msgSend(v15, "then:", v20);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (HMMTRSyncClusterDoorLock)lockWithPin:(id)a3 flow:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMMTRSyncClusterDoorLock *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  _QWORD v19[4];
  id v20;
  HMMTRSyncClusterDoorLock *v21;
  id v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x242656984]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "UUID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v24 = v11;
    v25 = 2112;
    v26 = v12;
    v27 = 2112;
    v28 = v6;
    _os_log_impl(&dword_23E95B000, v10, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Locking with pin: %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v8);
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __45__HMMTRSyncClusterDoorLock_lockWithPin_flow___block_invoke;
  v19[3] = &unk_250F1FAA0;
  v20 = v6;
  v21 = v9;
  v22 = v7;
  v13 = (void *)MEMORY[0x24BE3F178];
  v14 = v7;
  v15 = v6;
  objc_msgSend(v13, "untrackedPlaceholderFlow");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMTRSyncClusterDoorLock ensureAccessoryConnected:flow:](v9, "ensureAccessoryConnected:flow:", v19, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return (HMMTRSyncClusterDoorLock *)v17;
}

- (id)lock_flow:(id)a3
{
  id v4;
  void *v5;
  HMMTRSyncClusterDoorLock *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v15;
  id v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x242656984]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "UUID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v18 = v8;
    v19 = 2112;
    v20 = v9;
    _os_log_impl(&dword_23E95B000, v7, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Locking", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  v15 = MEMORY[0x24BDAC760];
  v16 = v4;
  v10 = (void *)MEMORY[0x24BE3F178];
  v11 = v4;
  objc_msgSend(v10, "untrackedPlaceholderFlow", v15, 3221225472, __38__HMMTRSyncClusterDoorLock_lock_flow___block_invoke, &unk_250F1FC08, v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMTRSyncClusterDoorLock ensureAccessoryConnected:flow:](v6, "ensureAccessoryConnected:flow:", &v15, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)unlockWithPin:(id)a3 flow:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMMTRSyncClusterDoorLock *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  _QWORD v19[4];
  id v20;
  HMMTRSyncClusterDoorLock *v21;
  id v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x242656984]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "UUID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v24 = v11;
    v25 = 2112;
    v26 = v12;
    v27 = 2112;
    v28 = v6;
    _os_log_impl(&dword_23E95B000, v10, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Unlocking with pin: %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v8);
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __47__HMMTRSyncClusterDoorLock_unlockWithPin_flow___block_invoke;
  v19[3] = &unk_250F1FAA0;
  v20 = v6;
  v21 = v9;
  v22 = v7;
  v13 = (void *)MEMORY[0x24BE3F178];
  v14 = v7;
  v15 = v6;
  objc_msgSend(v13, "untrackedPlaceholderFlow");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMTRSyncClusterDoorLock ensureAccessoryConnected:flow:](v9, "ensureAccessoryConnected:flow:", v19, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (id)unlock_flow:(id)a3
{
  id v4;
  void *v5;
  HMMTRSyncClusterDoorLock *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v15;
  id v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x242656984]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "UUID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v18 = v8;
    v19 = 2112;
    v20 = v9;
    _os_log_impl(&dword_23E95B000, v7, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Unlocking", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  v15 = MEMORY[0x24BDAC760];
  v16 = v4;
  v10 = (void *)MEMORY[0x24BE3F178];
  v11 = v4;
  objc_msgSend(v10, "untrackedPlaceholderFlow", v15, 3221225472, __40__HMMTRSyncClusterDoorLock_unlock_flow___block_invoke, &unk_250F1FC08, v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMTRSyncClusterDoorLock ensureAccessoryConnected:flow:](v6, "ensureAccessoryConnected:flow:", &v15, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)addUserAtUserIndex:(int64_t)a3 withUserUniqueID:(int64_t)a4 userType:(id)a5 flow:(id)a6
{
  id v10;
  id v11;
  void *v12;
  HMMTRSyncClusterDoorLock *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  _QWORD v23[4];
  id v24;
  HMMTRSyncClusterDoorLock *v25;
  id v26;
  int64_t v27;
  int64_t v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  int64_t v34;
  __int16 v35;
  int64_t v36;
  __int16 v37;
  id v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v10 = a5;
  v11 = a6;
  v12 = (void *)MEMORY[0x242656984]();
  v13 = self;
  HMFGetOSLogHandle();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "UUID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544386;
    v30 = v15;
    v31 = 2112;
    v32 = v16;
    v33 = 2048;
    v34 = a3;
    v35 = 2048;
    v36 = a4;
    v37 = 2112;
    v38 = v10;
    _os_log_impl(&dword_23E95B000, v14, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] addUserAtUserIndex: %ld, withUserUniqueID: %ld, userType: %@", buf, 0x34u);

  }
  objc_autoreleasePoolPop(v12);
  v23[0] = MEMORY[0x24BDAC760];
  v23[1] = 3221225472;
  v23[2] = __78__HMMTRSyncClusterDoorLock_addUserAtUserIndex_withUserUniqueID_userType_flow___block_invoke;
  v23[3] = &unk_250F20490;
  v27 = a3;
  v28 = a4;
  v24 = v10;
  v25 = v13;
  v26 = v11;
  v17 = (void *)MEMORY[0x24BE3F178];
  v18 = v11;
  v19 = v10;
  objc_msgSend(v17, "untrackedPlaceholderFlow");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMTRSyncClusterDoorLock ensureAccessoryConnected:flow:](v13, "ensureAccessoryConnected:flow:", v23, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

- (id)addPinCredentialAtIndex:(int64_t)a3 withValue:(id)a4 forUserAtUserIndex:(int64_t)a5 flow:(id)a6
{
  id v10;
  id v11;
  void *v12;
  HMMTRSyncClusterDoorLock *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  _QWORD v23[4];
  id v24;
  HMMTRSyncClusterDoorLock *v25;
  id v26;
  int64_t v27;
  int64_t v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  int64_t v34;
  __int16 v35;
  id v36;
  __int16 v37;
  int64_t v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v10 = a4;
  v11 = a6;
  v12 = (void *)MEMORY[0x242656984]();
  v13 = self;
  HMFGetOSLogHandle();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "UUID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544386;
    v30 = v15;
    v31 = 2112;
    v32 = v16;
    v33 = 2048;
    v34 = a3;
    v35 = 2112;
    v36 = v10;
    v37 = 2048;
    v38 = a5;
    _os_log_impl(&dword_23E95B000, v14, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] addPinCredentialAtIndex: %ld, withValue: %@ forUserAtUserIndex: %ld", buf, 0x34u);

  }
  objc_autoreleasePoolPop(v12);
  v23[0] = MEMORY[0x24BDAC760];
  v23[1] = 3221225472;
  v23[2] = __86__HMMTRSyncClusterDoorLock_addPinCredentialAtIndex_withValue_forUserAtUserIndex_flow___block_invoke;
  v23[3] = &unk_250F20490;
  v27 = a3;
  v28 = a5;
  v24 = v10;
  v25 = v13;
  v26 = v11;
  v17 = (void *)MEMORY[0x24BE3F178];
  v18 = v11;
  v19 = v10;
  objc_msgSend(v17, "untrackedPlaceholderFlow");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMTRSyncClusterDoorLock ensureAccessoryConnected:flow:](v13, "ensureAccessoryConnected:flow:", v23, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

- (id)updatePinCredentialAtIndex:(int64_t)a3 withValue:(id)a4 forUserAtUserIndex:(int64_t)a5 flow:(id)a6
{
  id v10;
  id v11;
  void *v12;
  HMMTRSyncClusterDoorLock *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  _QWORD v23[4];
  id v24;
  HMMTRSyncClusterDoorLock *v25;
  id v26;
  int64_t v27;
  int64_t v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  int64_t v34;
  __int16 v35;
  id v36;
  __int16 v37;
  int64_t v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v10 = a4;
  v11 = a6;
  v12 = (void *)MEMORY[0x242656984]();
  v13 = self;
  HMFGetOSLogHandle();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "UUID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544386;
    v30 = v15;
    v31 = 2112;
    v32 = v16;
    v33 = 2048;
    v34 = a3;
    v35 = 2112;
    v36 = v10;
    v37 = 2048;
    v38 = a5;
    _os_log_impl(&dword_23E95B000, v14, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] updatePinCredentialAtIndex: %ld, withValue: %@ forUserAtUserIndex: %ld", buf, 0x34u);

  }
  objc_autoreleasePoolPop(v12);
  v23[0] = MEMORY[0x24BDAC760];
  v23[1] = 3221225472;
  v23[2] = __89__HMMTRSyncClusterDoorLock_updatePinCredentialAtIndex_withValue_forUserAtUserIndex_flow___block_invoke;
  v23[3] = &unk_250F20490;
  v27 = a3;
  v28 = a5;
  v24 = v10;
  v25 = v13;
  v26 = v11;
  v17 = (void *)MEMORY[0x24BE3F178];
  v18 = v11;
  v19 = v10;
  objc_msgSend(v17, "untrackedPlaceholderFlow");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMTRSyncClusterDoorLock ensureAccessoryConnected:flow:](v13, "ensureAccessoryConnected:flow:", v23, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

- (id)addCredentialData:(id)a3 forCredentialType:(id)a4 atIndex:(int64_t)a5 forUserAtUserIndex:(int64_t)a6 flow:(id)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  HMMTRSyncClusterDoorLock *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  uint64_t v27;
  id v28;
  id v29;
  HMMTRSyncClusterDoorLock *v30;
  id v31;
  int64_t v32;
  int64_t v33;
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  id v39;
  __int16 v40;
  id v41;
  __int16 v42;
  int64_t v43;
  __int16 v44;
  int64_t v45;
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a4;
  v14 = a7;
  v15 = (void *)MEMORY[0x242656984]();
  v16 = self;
  HMFGetOSLogHandle();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "UUID");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544642;
    v35 = v18;
    v36 = 2112;
    v37 = v19;
    v38 = 2112;
    v39 = v12;
    v40 = 2112;
    v41 = v13;
    v42 = 2048;
    v43 = a5;
    v44 = 2048;
    v45 = a6;
    _os_log_impl(&dword_23E95B000, v17, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] addCredentialData: %@ forCredentialType: %@, atIndex: %ld forUserAtUserIndex: %ld", buf, 0x3Eu);

  }
  objc_autoreleasePoolPop(v15);
  v27 = MEMORY[0x24BDAC760];
  v32 = a5;
  v33 = a6;
  v28 = v13;
  v29 = v12;
  v30 = v16;
  v31 = v14;
  v20 = (void *)MEMORY[0x24BE3F178];
  v21 = v14;
  v22 = v12;
  v23 = v13;
  objc_msgSend(v20, "untrackedPlaceholderFlow", v27, 3221225472, __96__HMMTRSyncClusterDoorLock_addCredentialData_forCredentialType_atIndex_forUserAtUserIndex_flow___block_invoke, &unk_250F20508);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMTRSyncClusterDoorLock ensureAccessoryConnected:flow:](v16, "ensureAccessoryConnected:flow:", &v27, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  return v25;
}

- (id)updateCredentialData:(id)a3 forCredentialType:(id)a4 atIndex:(int64_t)a5 forUserAtUserIndex:(int64_t)a6 flow:(id)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  HMMTRSyncClusterDoorLock *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  uint64_t v27;
  id v28;
  id v29;
  HMMTRSyncClusterDoorLock *v30;
  id v31;
  int64_t v32;
  int64_t v33;
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  id v39;
  __int16 v40;
  id v41;
  __int16 v42;
  int64_t v43;
  __int16 v44;
  int64_t v45;
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a4;
  v14 = a7;
  v15 = (void *)MEMORY[0x242656984]();
  v16 = self;
  HMFGetOSLogHandle();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "UUID");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544642;
    v35 = v18;
    v36 = 2112;
    v37 = v19;
    v38 = 2112;
    v39 = v12;
    v40 = 2112;
    v41 = v13;
    v42 = 2048;
    v43 = a5;
    v44 = 2048;
    v45 = a6;
    _os_log_impl(&dword_23E95B000, v17, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] updateCredentialData: %@ forCredentialType: %@, atIndex: %ld forUserAtUserIndex: %ld", buf, 0x3Eu);

  }
  objc_autoreleasePoolPop(v15);
  v27 = MEMORY[0x24BDAC760];
  v32 = a5;
  v33 = a6;
  v28 = v13;
  v29 = v12;
  v30 = v16;
  v31 = v14;
  v20 = (void *)MEMORY[0x24BE3F178];
  v21 = v14;
  v22 = v12;
  v23 = v13;
  objc_msgSend(v20, "untrackedPlaceholderFlow", v27, 3221225472, __99__HMMTRSyncClusterDoorLock_updateCredentialData_forCredentialType_atIndex_forUserAtUserIndex_flow___block_invoke, &unk_250F20508);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMTRSyncClusterDoorLock ensureAccessoryConnected:flow:](v16, "ensureAccessoryConnected:flow:", &v27, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  return v25;
}

- (id)getCredentialAtIndex:(int64_t)a3 forCredentialType:(int64_t)a4 flow:(id)a5
{
  id v8;
  void *v9;
  HMMTRSyncClusterDoorLock *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v19;
  id v20;
  int64_t v21;
  int64_t v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  int64_t v28;
  __int16 v29;
  int64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v8 = a5;
  v9 = (void *)MEMORY[0x242656984]();
  v10 = self;
  HMFGetOSLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "UUID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v24 = v12;
    v25 = 2112;
    v26 = v13;
    v27 = 2048;
    v28 = a3;
    v29 = 2048;
    v30 = a4;
    _os_log_impl(&dword_23E95B000, v11, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] getCredentialAtIndex: %ld forCredentialType: %ld", buf, 0x2Au);

  }
  objc_autoreleasePoolPop(v9);
  v19 = MEMORY[0x24BDAC760];
  v21 = a4;
  v22 = a3;
  v20 = v8;
  v14 = (void *)MEMORY[0x24BE3F178];
  v15 = v8;
  objc_msgSend(v14, "untrackedPlaceholderFlow", v19, 3221225472, __72__HMMTRSyncClusterDoorLock_getCredentialAtIndex_forCredentialType_flow___block_invoke, &unk_250F20530, v10);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMTRSyncClusterDoorLock ensureAccessoryConnected:flow:](v10, "ensureAccessoryConnected:flow:", &v19, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (id)fetchCurrentFabricIndex
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BE3F178], "untrackedPlaceholderFlow");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMTRSyncClusterDoorLock fetchCurrentFabricIndex_flow:](self, "fetchCurrentFabricIndex_flow:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)readAttributeCurrentFabricIndexWithCompletionHandler:(id)a3
{
  void (**v4)(id, void *, _QWORD);
  void *v5;
  HMMTRSyncClusterDoorLock *v6;
  NSObject *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  HMMTRSyncClusterDoorLock *v16;
  void *v17;
  HMMTRSyncClusterDoorLock *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  __int16 v24;
  HMMTRSyncClusterDoorLock *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, void *, _QWORD))a3;
  v5 = (void *)MEMORY[0x242656984]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 138543618;
    v23 = v8;
    v24 = 2112;
    v25 = v6;
    _os_log_impl(&dword_23E95B000, v7, OS_LOG_TYPE_INFO, "%{public}@Getting current fabric index: %@", (uint8_t *)&v22, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  v9 = objc_alloc(MEMORY[0x24BDDB610]);
  -[MTRGenericCluster device](v6, "device");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMTRSyncClusterDoorLock queue](v6, "queue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v9, "initWithDevice:endpointID:queue:", v10, &unk_250F3F090, v11);

  v13 = objc_alloc_init(MEMORY[0x24BDDB7F0]);
  objc_msgSend(v13, "setFilterByFabric:", 0);
  objc_msgSend(v12, "readAttributeCurrentFabricIndexWithParams:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v14)
  {
    objc_msgSend(v14, "hmf_numberForKey:", *MEMORY[0x24BDDB518]);
    v16 = (HMMTRSyncClusterDoorLock *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      v17 = (void *)MEMORY[0x242656984]();
      v18 = v6;
      HMFGetOSLogHandle();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = 138543618;
        v23 = v20;
        v24 = 2112;
        v25 = v16;
        _os_log_impl(&dword_23E95B000, v19, OS_LOG_TYPE_INFO, "%{public}@Current Fabric Index: %@", (uint8_t *)&v22, 0x16u);

      }
      objc_autoreleasePoolPop(v17);
      v4[2](v4, v16, 0);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:", 15);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(id, void *, void *))v4)[2](v4, 0, v21);

    }
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:", 2);
    v16 = (HMMTRSyncClusterDoorLock *)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, void *, HMMTRSyncClusterDoorLock *))v4)[2](v4, 0, v16);
  }

}

- (id)fetchCurrentFabricIndex_flow:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  HMMTRSyncClusterDoorLock *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v16;
  id v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[MTRGenericCluster device](self, "device");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v16 = MEMORY[0x24BDAC760];
    v17 = v4;
    objc_msgSend(MEMORY[0x24BE3F178], "untrackedPlaceholderFlow", v16, 3221225472, __57__HMMTRSyncClusterDoorLock_fetchCurrentFabricIndex_flow___block_invoke, &unk_250F1FC08, self);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMMTRSyncClusterDoorLock ensureAccessoryConnected:flow:](self, "ensureAccessoryConnected:flow:", &v16, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = (void *)MEMORY[0x242656984]();
    v9 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "UUID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v19 = v11;
      v20 = 2112;
      v21 = v12;
      _os_log_impl(&dword_23E95B000, v10, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] THIS IS A BUG: device is nil, this should not happen.", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v8);
    v13 = (void *)MEMORY[0x24BE3F180];
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("HMMTROperationErrorDomain"), 2, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "futureWithError:", v14);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

- (id)totalNumberOfUsersSupported_flow:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  HMMTRSyncClusterDoorLock *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  _QWORD v13[5];
  id v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[MTRGenericCluster device](self, "device");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __61__HMMTRSyncClusterDoorLock_totalNumberOfUsersSupported_flow___block_invoke;
    v13[3] = &unk_250F1FC08;
    v13[4] = self;
    v14 = v4;
    -[HMMTRSyncClusterDoorLock ensureAccessoryConnected:flow:](self, "ensureAccessoryConnected:flow:", v13, v14);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = (void *)MEMORY[0x242656984]();
    v8 = self;
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "UUID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v16 = v10;
      v17 = 2112;
      v18 = v11;
      _os_log_impl(&dword_23E95B000, v9, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] No MTRDevice, assuming 50 slots", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
    objc_msgSend(MEMORY[0x24BE3F180], "futureWithValue:", &unk_250F3F168);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

- (id)totalNumberOfPINCredentialsSupported_flow:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  HMMTRSyncClusterDoorLock *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  _QWORD v13[5];
  id v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[MTRGenericCluster device](self, "device");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __70__HMMTRSyncClusterDoorLock_totalNumberOfPINCredentialsSupported_flow___block_invoke;
    v13[3] = &unk_250F1FC08;
    v13[4] = self;
    v14 = v4;
    -[HMMTRSyncClusterDoorLock ensureAccessoryConnected:flow:](self, "ensureAccessoryConnected:flow:", v13, v14);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = (void *)MEMORY[0x242656984]();
    v8 = self;
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "UUID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v16 = v10;
      v17 = 2112;
      v18 = v11;
      _os_log_impl(&dword_23E95B000, v9, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] No MTRDevice, assuming 50 slots", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
    objc_msgSend(MEMORY[0x24BE3F180], "futureWithValue:", &unk_250F3F168);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

- (id)totalNumberOfRFIDCredentialsSupported_flow:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  HMMTRSyncClusterDoorLock *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  _QWORD v13[5];
  id v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[MTRGenericCluster device](self, "device");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __71__HMMTRSyncClusterDoorLock_totalNumberOfRFIDCredentialsSupported_flow___block_invoke;
    v13[3] = &unk_250F1FC08;
    v13[4] = self;
    v14 = v4;
    -[HMMTRSyncClusterDoorLock ensureAccessoryConnected:flow:](self, "ensureAccessoryConnected:flow:", v13, v14);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = (void *)MEMORY[0x242656984]();
    v8 = self;
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "UUID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v16 = v10;
      v17 = 2112;
      v18 = v11;
      _os_log_impl(&dword_23E95B000, v9, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] No MTRDevice, assuming 50 slots", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
    objc_msgSend(MEMORY[0x24BE3F180], "futureWithValue:", &unk_250F3F168);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

- (id)numberOfWeekDaySchedulesSupportedWithFlow:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __70__HMMTRSyncClusterDoorLock_numberOfWeekDaySchedulesSupportedWithFlow___block_invoke;
  v8[3] = &unk_250F1FC08;
  v8[4] = self;
  v9 = v4;
  v5 = v4;
  -[HMMTRSyncClusterDoorLock ensureAccessoryConnected:flow:](self, "ensureAccessoryConnected:flow:", v8, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)numberOfYearDaySchedulesSupportedWithFlow:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __70__HMMTRSyncClusterDoorLock_numberOfYearDaySchedulesSupportedWithFlow___block_invoke;
  v8[3] = &unk_250F1FC08;
  v8[4] = self;
  v9 = v4;
  v5 = v4;
  -[HMMTRSyncClusterDoorLock ensureAccessoryConnected:flow:](self, "ensureAccessoryConnected:flow:", v8, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (int64_t)totalNumberOfSchedulesSupportedOfScheduleType:(int64_t)a3 withDefaultCapacity:(int64_t)a4 flow:(id)a5
{
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  HMMTRSyncClusterDoorLock *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  int64_t v17;
  void *v18;
  HMMTRSyncClusterDoorLock *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v24;
  HMMTRSyncClusterDoorLock *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  int v29;
  void *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  int64_t v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v8 = a5;
  if (a3 == 1)
  {
    -[MTRClusterDoorLock readAttributeNumberOfYearDaySchedulesSupportedPerUserWithParams:](self, "readAttributeNumberOfYearDaySchedulesSupportedPerUserWithParams:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKey:", CFSTR("value"));
    v10 = objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
      v24 = (void *)MEMORY[0x242656984]();
      v25 = self;
      HMFGetOSLogHandle();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "UUID");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = 138543618;
        v30 = v27;
        v31 = 2112;
        v32 = v28;
        _os_log_impl(&dword_23E95B000, v26, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Could not determine total number of yearday schedule slots, assuming 1 by default", (uint8_t *)&v29, 0x16u);

      }
      objc_autoreleasePoolPop(v24);
      v16 = &unk_250F3F030;
      goto LABEL_9;
    }
LABEL_8:
    v16 = (void *)v10;
LABEL_9:

    v17 = objc_msgSend(v16, "integerValue");
    goto LABEL_13;
  }
  if (!a3)
  {
    -[MTRClusterDoorLock readAttributeNumberOfWeekDaySchedulesSupportedPerUserWithParams:](self, "readAttributeNumberOfWeekDaySchedulesSupportedPerUserWithParams:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKey:", CFSTR("value"));
    v10 = objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
      v11 = (void *)MEMORY[0x242656984]();
      v12 = self;
      HMFGetOSLogHandle();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "UUID");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = 138543874;
        v30 = v14;
        v31 = 2112;
        v32 = v15;
        v33 = 2048;
        v34 = a4;
        _os_log_impl(&dword_23E95B000, v13, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Could not determine total number of weekday schedule slots, assuming %ld by default", (uint8_t *)&v29, 0x20u);

      }
      objc_autoreleasePoolPop(v11);
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a4);
      v10 = objc_claimAutoreleasedReturnValue();
    }
    goto LABEL_8;
  }
  v18 = (void *)MEMORY[0x242656984]();
  v19 = self;
  HMFGetOSLogHandle();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "UUID");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = 138543874;
    v30 = v21;
    v31 = 2112;
    v32 = v22;
    v33 = 2048;
    v34 = a3;
    _os_log_impl(&dword_23E95B000, v20, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] ScheduleType unknown of type: %ld", (uint8_t *)&v29, 0x20u);

  }
  objc_autoreleasePoolPop(v18);
  v17 = 0;
LABEL_13:

  return v17;
}

- (id)clearScheduleOfScheduleType:(int64_t)a3 atScheduleIndex:(int64_t)a4 forUserAtUserIndex:(int64_t)a5 flow:(id)a6
{
  id v10;
  void *v11;
  HMMTRSyncClusterDoorLock *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  id v16;
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
  HMMTRSyncClusterDoorLock *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  _QWORD v32[5];
  id v33;
  _QWORD v34[5];
  id v35;
  _BYTE buf[12];
  __int16 v37;
  void *v38;
  __int16 v39;
  int64_t v40;
  __int16 v41;
  int64_t v42;
  __int16 v43;
  int64_t v44;
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v10 = a6;
  v11 = (void *)MEMORY[0x242656984]();
  v12 = self;
  HMFGetOSLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "UUID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544386;
    *(_QWORD *)&buf[4] = v14;
    v37 = 2112;
    v38 = v15;
    v39 = 2048;
    v40 = a3;
    v41 = 2048;
    v42 = a4;
    v43 = 2048;
    v44 = a5;
    _os_log_impl(&dword_23E95B000, v13, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] clearScheduleOfScheduleType: %ld, atScheduleIndex: %ld, for userIndex: %ld", buf, 0x34u);

  }
  objc_autoreleasePoolPop(v11);
  if (a3 == 1)
  {
    v16 = objc_alloc_init(MEMORY[0x24BDDB6C8]);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a4);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setYearDayIndex:", v23);

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a5);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setUserIndex:", v24);

    *(_QWORD *)buf = 0;
    objc_msgSend(MEMORY[0x24BE3F180], "futureWithPromise:", buf);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)buf, "errorOnlyResolverBlock");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTRClusterDoorLock clearYearDayScheduleWithParams:expectedValues:expectedValueInterval:completion:](v12, "clearYearDayScheduleWithParams:expectedValues:expectedValueInterval:completion:", v16, 0, 0, v25);

    v32[0] = MEMORY[0x24BDAC760];
    v32[1] = 3221225472;
    v32[2] = __96__HMMTRSyncClusterDoorLock_clearScheduleOfScheduleType_atScheduleIndex_forUserAtUserIndex_flow___block_invoke_227;
    v32[3] = &unk_250F21880;
    v32[4] = v12;
    v33 = v10;
    objc_msgSend(v19, "recover:", v32);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v33;
    goto LABEL_7;
  }
  if (!a3)
  {
    v16 = objc_alloc_init(MEMORY[0x24BDDB6C0]);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a4);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setWeekDayIndex:", v17);

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a5);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setUserIndex:", v18);

    *(_QWORD *)buf = 0;
    objc_msgSend(MEMORY[0x24BE3F180], "futureWithPromise:", buf);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)buf, "errorOnlyResolverBlock");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTRClusterDoorLock clearWeekDayScheduleWithParams:expectedValues:expectedValueInterval:completion:](v12, "clearWeekDayScheduleWithParams:expectedValues:expectedValueInterval:completion:", v16, 0, 0, v20);

    v34[0] = MEMORY[0x24BDAC760];
    v34[1] = 3221225472;
    v34[2] = __96__HMMTRSyncClusterDoorLock_clearScheduleOfScheduleType_atScheduleIndex_forUserAtUserIndex_flow___block_invoke;
    v34[3] = &unk_250F21880;
    v34[4] = v12;
    v35 = v10;
    objc_msgSend(v19, "recover:", v34);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v35;
LABEL_7:

    goto LABEL_11;
  }
  v26 = (void *)MEMORY[0x242656984]();
  v27 = v12;
  HMFGetOSLogHandle();
  v28 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "UUID");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    *(_QWORD *)&buf[4] = v29;
    v37 = 2112;
    v38 = v30;
    v39 = 2048;
    v40 = a3;
    _os_log_impl(&dword_23E95B000, v28, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to clear schedule with error of unknown HMMTRScheduleType: %ld", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v26);
  objc_msgSend(MEMORY[0x24BE3F180], "futureWithError:", 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_11:

  return v21;
}

- (id)setScheduleOfScheduleType:(int64_t)a3 withSchedule:(id)a4 atScheduleIndex:(int64_t)a5 forUserAtUserIndex:(int64_t)a6 flow:(id)a7
{
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  HMMTRSyncClusterDoorLock *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  _QWORD v27[5];
  id v28;
  _QWORD v29[5];
  id v30;
  _BYTE buf[12];
  __int16 v32;
  void *v33;
  __int16 v34;
  int64_t v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v12 = a4;
  v13 = a7;
  if (a3 == 1)
  {
    *(_QWORD *)buf = 0;
    objc_msgSend(MEMORY[0x24BE3F180], "futureWithPromise:", buf);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)buf, "errorOnlyResolverBlock");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "convertToMTRScheduleAtScheduleIndex:forUserAtUserIndex:", a5, a6);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTRClusterDoorLock setYearDayScheduleWithParams:expectedValues:expectedValueInterval:completion:](self, "setYearDayScheduleWithParams:expectedValues:expectedValueInterval:completion:", v20, 0, 0, v19);

    v27[0] = MEMORY[0x24BDAC760];
    v27[1] = 3221225472;
    v27[2] = __107__HMMTRSyncClusterDoorLock_setScheduleOfScheduleType_withSchedule_atScheduleIndex_forUserAtUserIndex_flow___block_invoke_228;
    v27[3] = &unk_250F21880;
    v27[4] = self;
    v28 = v13;
    objc_msgSend(v14, "recover:", v27);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v28;
    goto LABEL_5;
  }
  if (!a3)
  {
    *(_QWORD *)buf = 0;
    objc_msgSend(MEMORY[0x24BE3F180], "futureWithPromise:", buf);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)buf, "errorOnlyResolverBlock");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "convertToMTRScheduleAtScheduleIndex:forUserAtUserIndex:", a5, a6);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTRClusterDoorLock setWeekDayScheduleWithParams:expectedValues:expectedValueInterval:completion:](self, "setWeekDayScheduleWithParams:expectedValues:expectedValueInterval:completion:", v16, 0, 0, v15);

    v29[0] = MEMORY[0x24BDAC760];
    v29[1] = 3221225472;
    v29[2] = __107__HMMTRSyncClusterDoorLock_setScheduleOfScheduleType_withSchedule_atScheduleIndex_forUserAtUserIndex_flow___block_invoke;
    v29[3] = &unk_250F21880;
    v29[4] = self;
    v30 = v13;
    objc_msgSend(v14, "recover:", v29);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v30;
LABEL_5:

    goto LABEL_9;
  }
  v21 = (void *)MEMORY[0x242656984]();
  v22 = self;
  HMFGetOSLogHandle();
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "UUID");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    *(_QWORD *)&buf[4] = v24;
    v32 = 2112;
    v33 = v25;
    v34 = 2048;
    v35 = a3;
    _os_log_impl(&dword_23E95B000, v23, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to set schedule with error of unknown HMMTRScheduleType: %ld", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v21);
  objc_msgSend(MEMORY[0x24BE3F180], "futureWithError:", 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_9:

  return v17;
}

- (id)updateUserTypeForUserIndex:(int64_t)a3 userType:(id)a4 flow:(id)a5
{
  id v8;
  id v9;
  void *v10;
  HMMTRSyncClusterDoorLock *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  _QWORD v22[5];
  id v23;
  _BYTE buf[12];
  __int16 v25;
  void *v26;
  __int16 v27;
  int64_t v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  v9 = a5;
  v10 = (void *)MEMORY[0x242656984]();
  v11 = self;
  HMFGetOSLogHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "UUID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    *(_QWORD *)&buf[4] = v13;
    v25 = 2112;
    v26 = v14;
    v27 = 2048;
    v28 = a3;
    v29 = 2112;
    v30 = v8;
    _os_log_impl(&dword_23E95B000, v12, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] updateUserTypeForUserIndex: %ld, userType: %@", buf, 0x2Au);

  }
  objc_autoreleasePoolPop(v10);
  v15 = objc_alloc_init(MEMORY[0x24BDDB728]);
  objc_msgSend(v15, "setOperationType:", &unk_250F3F048);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setUserIndex:", v16);

  objc_msgSend(v15, "setUserType:", v8);
  *(_QWORD *)buf = 0;
  objc_msgSend(MEMORY[0x24BE3F180], "futureWithPromise:", buf);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)buf, "errorOnlyResolverBlock");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTRClusterDoorLock setUserWithParams:expectedValues:expectedValueInterval:completionHandler:](v11, "setUserWithParams:expectedValues:expectedValueInterval:completionHandler:", v15, 0, 0, v18);

  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __69__HMMTRSyncClusterDoorLock_updateUserTypeForUserIndex_userType_flow___block_invoke;
  v22[3] = &unk_250F21880;
  v22[4] = v11;
  v23 = v9;
  v19 = v9;
  objc_msgSend(v17, "recover:", v22);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (id)getScheduleOfScheduleType:(int64_t)a3 atScheduleIndex:(int64_t)a4 forUserAtUserIndex:(int64_t)a5 flow:(id)a6
{
  id v10;
  void *v11;
  HMMTRSyncClusterDoorLock *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  id v16;
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
  HMMTRSyncClusterDoorLock *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  _QWORD v32[5];
  id v33;
  int64_t v34;
  int64_t v35;
  _QWORD v36[5];
  id v37;
  int64_t v38;
  int64_t v39;
  _BYTE buf[12];
  __int16 v41;
  void *v42;
  __int16 v43;
  int64_t v44;
  __int16 v45;
  int64_t v46;
  __int16 v47;
  int64_t v48;
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  v10 = a6;
  v11 = (void *)MEMORY[0x242656984]();
  v12 = self;
  HMFGetOSLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "UUID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544386;
    *(_QWORD *)&buf[4] = v14;
    v41 = 2112;
    v42 = v15;
    v43 = 2048;
    v44 = a3;
    v45 = 2048;
    v46 = a4;
    v47 = 2048;
    v48 = a5;
    _os_log_impl(&dword_23E95B000, v13, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] getScheduleOfScheduleType: %ld, atScheduleIndex: %ld, and forUserAtUserIndex: %ld", buf, 0x34u);

  }
  objc_autoreleasePoolPop(v11);
  if (a3 == 1)
  {
    v16 = objc_alloc_init(MEMORY[0x24BDDB6F8]);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a5);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setUserIndex:", v23);

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a4);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setYearDayIndex:", v24);

    *(_QWORD *)buf = 0;
    objc_msgSend(MEMORY[0x24BE3F180], "futureWithPromise:", buf);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)buf, "resolverBlock");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTRClusterDoorLock getYearDayScheduleWithParams:expectedValues:expectedValueInterval:completion:](v12, "getYearDayScheduleWithParams:expectedValues:expectedValueInterval:completion:", v16, 0, 0, v25);

    v32[0] = MEMORY[0x24BDAC760];
    v32[1] = 3221225472;
    v32[2] = __94__HMMTRSyncClusterDoorLock_getScheduleOfScheduleType_atScheduleIndex_forUserAtUserIndex_flow___block_invoke_2_238;
    v32[3] = &unk_250F20598;
    v32[4] = v12;
    v33 = v10;
    v34 = a4;
    v35 = a5;
    objc_msgSend(v19, "then:orRecover:", &__block_literal_global_236, v32);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v33;
    goto LABEL_7;
  }
  if (!a3)
  {
    v16 = objc_alloc_init(MEMORY[0x24BDDB6F0]);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a5);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setUserIndex:", v17);

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a4);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setWeekDayIndex:", v18);

    *(_QWORD *)buf = 0;
    objc_msgSend(MEMORY[0x24BE3F180], "futureWithPromise:", buf);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)buf, "resolverBlock");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTRClusterDoorLock getWeekDayScheduleWithParams:expectedValues:expectedValueInterval:completion:](v12, "getWeekDayScheduleWithParams:expectedValues:expectedValueInterval:completion:", v16, 0, 0, v20);

    v36[0] = MEMORY[0x24BDAC760];
    v36[1] = 3221225472;
    v36[2] = __94__HMMTRSyncClusterDoorLock_getScheduleOfScheduleType_atScheduleIndex_forUserAtUserIndex_flow___block_invoke_2;
    v36[3] = &unk_250F20598;
    v36[4] = v12;
    v37 = v10;
    v38 = a4;
    v39 = a5;
    objc_msgSend(v19, "then:orRecover:", &__block_literal_global_231, v36);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v37;
LABEL_7:

    goto LABEL_11;
  }
  v26 = (void *)MEMORY[0x242656984]();
  v27 = v12;
  HMFGetOSLogHandle();
  v28 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "UUID");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544386;
    *(_QWORD *)&buf[4] = v29;
    v41 = 2112;
    v42 = v30;
    v43 = 2048;
    v44 = a4;
    v45 = 2048;
    v46 = a5;
    v47 = 2048;
    v48 = a3;
    _os_log_impl(&dword_23E95B000, v28, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Failed to get schedule at scheduleIndex: %ld and userIndex: %ld since scheduleType was of unknown type: %ld.", buf, 0x34u);

  }
  objc_autoreleasePoolPop(v26);
  objc_msgSend(MEMORY[0x24BE3F180], "futureWithError:", 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_11:

  return v21;
}

- (id)readScheduleForScheduleType:(int64_t)a3 forUserIndex:(int64_t)a4 flow:(id)a5
{
  id v8;
  void *v9;
  HMMTRSyncClusterDoorLock *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  int64_t v25;
  __int16 v26;
  int64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v8 = a5;
  v9 = (void *)MEMORY[0x242656984]();
  v10 = self;
  HMFGetOSLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "UUID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v21 = v12;
    v22 = 2112;
    v23 = v13;
    v24 = 2048;
    v25 = a3;
    v26 = 2048;
    v27 = a4;
    _os_log_impl(&dword_23E95B000, v11, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] readScheduleForScheduleType: %ld, forUserIndex: %ld", buf, 0x2Au);

  }
  objc_autoreleasePoolPop(v9);
  v14 = -[HMMTRSyncClusterDoorLock totalNumberOfSchedulesSupportedOfScheduleType:withDefaultCapacity:flow:](v10, "totalNumberOfSchedulesSupportedOfScheduleType:withDefaultCapacity:flow:", a3, 1, v8);
  v15 = (void *)objc_msgSend(MEMORY[0x24BDBD1B8], "mutableCopy");
  v16 = (void *)objc_msgSend(MEMORY[0x24BDBD1A8], "mutableCopy");
  -[HMMTRSyncClusterDoorLock readSchedulesForWritingForScheduleType:forUserIndex:startingAtSlot:assumingTotalNumberOfSlots:schedulesToSlots:availableSlots:flow:](v10, "readSchedulesForWritingForScheduleType:forUserIndex:startingAtSlot:assumingTotalNumberOfSlots:schedulesToSlots:availableSlots:flow:", a3, a4, 1, v14, v15, v16, v8);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "then:", &__block_literal_global_239);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (id)accessoryHasCOTAEnabledWithFlow:(id)a3
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __60__HMMTRSyncClusterDoorLock_accessoryHasCOTAEnabledWithFlow___block_invoke;
  v4[3] = &unk_250F1FBE0;
  v4[4] = self;
  -[HMMTRSyncClusterDoorLock ensureAccessoryConnected:flow:](self, "ensureAccessoryConnected:flow:", v4, a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)dealloc
{
  void *v3;
  HMMTRSyncClusterDoorLock *v4;
  NSObject *v5;
  void *v6;
  objc_super v7;
  uint8_t buf[4];
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x242656984](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v9 = v6;
    _os_log_impl(&dword_23E95B000, v5, OS_LOG_TYPE_INFO, "%{public}@dealloc", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  v7.receiver = v4;
  v7.super_class = (Class)HMMTRSyncClusterDoorLock;
  -[HMMTRSyncClusterDoorLock dealloc](&v7, sel_dealloc);
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 40, 1);
}

- (void)setQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (unsigned)endpoint
{
  return self->_endpoint;
}

- (void)setEndpoint:(unsigned __int16)a3
{
  self->_endpoint = a3;
}

- (HMFFuture)apiSerializationFuture
{
  return (HMFFuture *)objc_getProperty(self, a2, 48, 1);
}

- (void)setApiSerializationFuture:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (os_unfair_lock_s)unfairLock
{
  return self->_unfairLock;
}

- (HMMTRAccessoryServer)accessoryServer
{
  return (HMMTRAccessoryServer *)objc_loadWeakRetained((id *)&self->_accessoryServer);
}

- (MTRBaseDevice)baseDevice
{
  return (MTRBaseDevice *)objc_getProperty(self, a2, 64, 1);
}

- (void)setBaseDevice:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (MTRBaseClusterDoorLock)baseDoorLock
{
  return (MTRBaseClusterDoorLock *)objc_getProperty(self, a2, 72, 1);
}

- (void)setBaseDoorLock:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_baseDoorLock, 0);
  objc_storeStrong((id *)&self->_baseDevice, 0);
  objc_destroyWeak((id *)&self->_accessoryServer);
  objc_storeStrong((id *)&self->_apiSerializationFuture, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

id __60__HMMTRSyncClusterDoorLock_accessoryHasCOTAEnabledWithFlow___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "readAttributeRequirePINforRemoteOperationWithParams:", 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (void *)MEMORY[0x24BE3F180];
  objc_msgSend(v1, "objectForKey:", CFSTR("value"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "futureWithValue:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t __74__HMMTRSyncClusterDoorLock_readScheduleForScheduleType_forUserIndex_flow___block_invoke(uint64_t a1, void *a2)
{
  void *v2;

  objc_msgSend(a2, "schedulesToSlots");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "na_flatMap:", &__block_literal_global_241);
  objc_claimAutoreleasedReturnValue();

  return 1;
}

id __74__HMMTRSyncClusterDoorLock_readScheduleForScheduleType_forUserIndex_flow___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v4 = a2;
  v5 = (void *)MEMORY[0x24BDBCE30];
  v6 = objc_msgSend(a3, "count");
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __74__HMMTRSyncClusterDoorLock_readScheduleForScheduleType_forUserIndex_flow___block_invoke_3;
  v10[3] = &unk_250F20680;
  v11 = v4;
  v7 = v4;
  objc_msgSend(v5, "na_arrayByRepeatingWithCount:generatorBlock:", v6, v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id __74__HMMTRSyncClusterDoorLock_readScheduleForScheduleType_forUserIndex_flow___block_invoke_3(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

uint64_t __94__HMMTRSyncClusterDoorLock_getScheduleOfScheduleType_atScheduleIndex_forUserAtUserIndex_flow___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x242656984]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "UUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(a1 + 48);
    v10 = *(_QWORD *)(a1 + 56);
    v15 = 138544386;
    v16 = v7;
    v17 = 2112;
    v18 = v8;
    v19 = 2048;
    v20 = v9;
    v21 = 2048;
    v22 = v10;
    v23 = 2112;
    v24 = v3;
    _os_log_impl(&dword_23E95B000, v6, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Failed to get week day schedule at scheduleIndex: %ld and userIndex: %ld with error: %@", (uint8_t *)&v15, 0x34u);

  }
  objc_autoreleasePoolPop(v4);
  v11 = v3;
  v12 = v11;
  if (v11)
  {
    v13 = v11;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "hmfUnspecifiedError");
    objc_claimAutoreleasedReturnValue();
  }

  return 2;
}

uint64_t __94__HMMTRSyncClusterDoorLock_getScheduleOfScheduleType_atScheduleIndex_forUserAtUserIndex_flow___block_invoke_2_238(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x242656984]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "UUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(a1 + 48);
    v10 = *(_QWORD *)(a1 + 56);
    v15 = 138544386;
    v16 = v7;
    v17 = 2112;
    v18 = v8;
    v19 = 2048;
    v20 = v9;
    v21 = 2048;
    v22 = v10;
    v23 = 2112;
    v24 = v3;
    _os_log_impl(&dword_23E95B000, v6, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Failed to get year day schedule at scheduleIndex: %ld and userIndex: %ld with error: %@", (uint8_t *)&v15, 0x34u);

  }
  objc_autoreleasePoolPop(v4);
  v11 = v3;
  v12 = v11;
  if (v11)
  {
    v13 = v11;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "hmfUnspecifiedError");
    objc_claimAutoreleasedReturnValue();
  }

  return 2;
}

uint64_t __94__HMMTRSyncClusterDoorLock_getScheduleOfScheduleType_atScheduleIndex_forUserAtUserIndex_flow___block_invoke_234(uint64_t a1, void *a2)
{
  id v2;
  HMMTRYearDaySchedule *v3;
  HMMTRYearDaySchedule *v4;

  v2 = a2;
  v3 = -[HMMTRYearDaySchedule initWithMTRSchedule:]([HMMTRYearDaySchedule alloc], "initWithMTRSchedule:", v2);

  v4 = v3;
  return 1;
}

uint64_t __94__HMMTRSyncClusterDoorLock_getScheduleOfScheduleType_atScheduleIndex_forUserAtUserIndex_flow___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  HMMTRWeekDaySchedule *v3;
  HMMTRWeekDaySchedule *v4;

  v2 = a2;
  v3 = -[HMMTRWeekDaySchedule initWithMTRSchedule:]([HMMTRWeekDaySchedule alloc], "initWithMTRSchedule:", v2);

  v4 = v3;
  return 1;
}

uint64_t __69__HMMTRSyncClusterDoorLock_updateUserTypeForUserIndex_userType_flow___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x242656984]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "UUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138543874;
    v14 = v7;
    v15 = 2112;
    v16 = v8;
    v17 = 2112;
    v18 = v3;
    _os_log_impl(&dword_23E95B000, v6, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to add user with error: %@", (uint8_t *)&v13, 0x20u);

  }
  objc_autoreleasePoolPop(v4);
  v9 = v3;
  v10 = v9;
  if (v9)
  {
    v11 = v9;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "hmfUnspecifiedError");
    objc_claimAutoreleasedReturnValue();
  }

  return 2;
}

uint64_t __107__HMMTRSyncClusterDoorLock_setScheduleOfScheduleType_withSchedule_atScheduleIndex_forUserAtUserIndex_flow___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x242656984]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "UUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138543874;
    v14 = v7;
    v15 = 2112;
    v16 = v8;
    v17 = 2112;
    v18 = v3;
    _os_log_impl(&dword_23E95B000, v6, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to set weekday schedule with error: %@", (uint8_t *)&v13, 0x20u);

  }
  objc_autoreleasePoolPop(v4);
  v9 = v3;
  v10 = v9;
  if (v9)
  {
    v11 = v9;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "hmfUnspecifiedError");
    objc_claimAutoreleasedReturnValue();
  }

  return 2;
}

uint64_t __107__HMMTRSyncClusterDoorLock_setScheduleOfScheduleType_withSchedule_atScheduleIndex_forUserAtUserIndex_flow___block_invoke_228(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x242656984]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "UUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138543874;
    v14 = v7;
    v15 = 2112;
    v16 = v8;
    v17 = 2112;
    v18 = v3;
    _os_log_impl(&dword_23E95B000, v6, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to set yearday schedule with error: %@", (uint8_t *)&v13, 0x20u);

  }
  objc_autoreleasePoolPop(v4);
  v9 = v3;
  v10 = v9;
  if (v9)
  {
    v11 = v9;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "hmfUnspecifiedError");
    objc_claimAutoreleasedReturnValue();
  }

  return 2;
}

uint64_t __96__HMMTRSyncClusterDoorLock_clearScheduleOfScheduleType_atScheduleIndex_forUserAtUserIndex_flow___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x242656984]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "UUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138543874;
    v14 = v7;
    v15 = 2112;
    v16 = v8;
    v17 = 2112;
    v18 = v3;
    _os_log_impl(&dword_23E95B000, v6, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to clear weekday schedule with error: %@", (uint8_t *)&v13, 0x20u);

  }
  objc_autoreleasePoolPop(v4);
  v9 = v3;
  v10 = v9;
  if (v9)
  {
    v11 = v9;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "hmfUnspecifiedError");
    objc_claimAutoreleasedReturnValue();
  }

  return 2;
}

uint64_t __96__HMMTRSyncClusterDoorLock_clearScheduleOfScheduleType_atScheduleIndex_forUserAtUserIndex_flow___block_invoke_227(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x242656984]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "UUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138543874;
    v14 = v7;
    v15 = 2112;
    v16 = v8;
    v17 = 2112;
    v18 = v3;
    _os_log_impl(&dword_23E95B000, v6, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to clear yearday schedule with error: %@", (uint8_t *)&v13, 0x20u);

  }
  objc_autoreleasePoolPop(v4);
  v9 = v3;
  v10 = v9;
  if (v9)
  {
    v11 = v9;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "hmfUnspecifiedError");
    objc_claimAutoreleasedReturnValue();
  }

  return 2;
}

id __70__HMMTRSyncClusterDoorLock_numberOfYearDaySchedulesSupportedWithFlow___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;

  v1 = (void *)MEMORY[0x24BE3F180];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "totalNumberOfSchedulesSupportedOfScheduleType:withDefaultCapacity:flow:", 1, 0, *(_QWORD *)(a1 + 40)));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "futureWithValue:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __70__HMMTRSyncClusterDoorLock_numberOfWeekDaySchedulesSupportedWithFlow___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;

  v1 = (void *)MEMORY[0x24BE3F180];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "totalNumberOfSchedulesSupportedOfScheduleType:withDefaultCapacity:flow:", 0, 0, *(_QWORD *)(a1 + 40)));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "futureWithValue:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __71__HMMTRSyncClusterDoorLock_totalNumberOfRFIDCredentialsSupported_flow___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "readAttributeNumberOfRFIDUsersSupportedWithParams:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("value"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v4 = (void *)MEMORY[0x242656984]();
    v5 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "UUID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543618;
      v12 = v7;
      v13 = 2112;
      v14 = v8;
      _os_log_impl(&dword_23E95B000, v6, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Could not determine total number of RFID credential slots, assuming 50 by default", (uint8_t *)&v11, 0x16u);

    }
    objc_autoreleasePoolPop(v4);
    v3 = &unk_250F3F168;
  }
  objc_msgSend(MEMORY[0x24BE3F180], "futureWithValue:", v3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

id __70__HMMTRSyncClusterDoorLock_totalNumberOfPINCredentialsSupported_flow___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "readAttributeNumberOfPINUsersSupportedWithParams:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("value"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v4 = (void *)MEMORY[0x242656984]();
    v5 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "UUID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543618;
      v12 = v7;
      v13 = 2112;
      v14 = v8;
      _os_log_impl(&dword_23E95B000, v6, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Could not determine total number of PIN credential slots, assuming 50 by default", (uint8_t *)&v11, 0x16u);

    }
    objc_autoreleasePoolPop(v4);
    v3 = &unk_250F3F168;
  }
  objc_msgSend(MEMORY[0x24BE3F180], "futureWithValue:", v3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

id __61__HMMTRSyncClusterDoorLock_totalNumberOfUsersSupported_flow___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "readAttributeNumberOfTotalUsersSupportedWithParams:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("value"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v4 = (void *)MEMORY[0x242656984]();
    v5 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "UUID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543618;
      v12 = v7;
      v13 = 2112;
      v14 = v8;
      _os_log_impl(&dword_23E95B000, v6, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Could not determine total number of user slots, assuming 50 by default", (uint8_t *)&v11, 0x16u);

    }
    objc_autoreleasePoolPop(v4);
    v3 = &unk_250F3F168;
  }
  objc_msgSend(MEMORY[0x24BE3F180], "futureWithValue:", v3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

id __57__HMMTRSyncClusterDoorLock_fetchCurrentFabricIndex_flow___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[5];
  id v8;
  id v9;

  v9 = 0;
  objc_msgSend(MEMORY[0x24BE3F180], "futureWithPromise:", &v9);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "resolverBlock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "readAttributeCurrentFabricIndexWithCompletionHandler:", v3);

  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __57__HMMTRSyncClusterDoorLock_fetchCurrentFabricIndex_flow___block_invoke_2;
  v7[3] = &unk_250F21880;
  v4 = *(void **)(a1 + 40);
  v7[4] = *(_QWORD *)(a1 + 32);
  v8 = v4;
  objc_msgSend(v2, "recover:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t __57__HMMTRSyncClusterDoorLock_fetchCurrentFabricIndex_flow___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x242656984]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "UUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138543874;
    v14 = v7;
    v15 = 2112;
    v16 = v8;
    v17 = 2112;
    v18 = v3;
    _os_log_impl(&dword_23E95B000, v6, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to fetch current fabric index with error: %@", (uint8_t *)&v13, 0x20u);

  }
  objc_autoreleasePoolPop(v4);
  v9 = v3;
  v10 = v9;
  if (v9)
  {
    v11 = v9;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "hmfUnspecifiedError");
    objc_claimAutoreleasedReturnValue();
  }

  return 2;
}

id __72__HMMTRSyncClusterDoorLock_getCredentialAtIndex_forCredentialType_flow___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[5];
  id v13;
  id v14;

  v2 = objc_alloc_init(MEMORY[0x24BDDB6D0]);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", *(_QWORD *)(a1 + 48));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setCredentialType:", v3);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", *(_QWORD *)(a1 + 56));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setCredentialIndex:", v4);

  v5 = objc_alloc_init(MEMORY[0x24BDDB6E0]);
  objc_msgSend(v5, "setCredential:", v2);
  v14 = 0;
  objc_msgSend(MEMORY[0x24BE3F180], "futureWithPromise:", &v14);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "resolverBlock");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "baseDoorLock");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "getCredentialStatusWithParams:completion:", v5, v7);

  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __72__HMMTRSyncClusterDoorLock_getCredentialAtIndex_forCredentialType_flow___block_invoke_2;
  v12[3] = &unk_250F21880;
  v9 = *(void **)(a1 + 40);
  v12[4] = *(_QWORD *)(a1 + 32);
  v13 = v9;
  objc_msgSend(v6, "recover:", v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

uint64_t __72__HMMTRSyncClusterDoorLock_getCredentialAtIndex_forCredentialType_flow___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x242656984]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "UUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138543874;
    v14 = v7;
    v15 = 2112;
    v16 = v8;
    v17 = 2112;
    v18 = v3;
    _os_log_impl(&dword_23E95B000, v6, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to get credential with error: %@", (uint8_t *)&v13, 0x20u);

  }
  objc_autoreleasePoolPop(v4);
  v9 = v3;
  v10 = v9;
  if (v9)
  {
    v11 = v9;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "hmfUnspecifiedError");
    objc_claimAutoreleasedReturnValue();
  }

  return 2;
}

id __99__HMMTRSyncClusterDoorLock_updateCredentialData_forCredentialType_atIndex_forUserAtUserIndex_flow___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[5];
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;
  __int128 v19;
  id v20;

  v2 = objc_alloc_init(MEMORY[0x24BDDB6D0]);
  objc_msgSend(v2, "setCredentialType:", *(_QWORD *)(a1 + 32));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", *(_QWORD *)(a1 + 64));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setCredentialIndex:", v3);

  v4 = objc_alloc_init(MEMORY[0x24BDDB720]);
  objc_msgSend(v4, "setOperationType:", &unk_250F3F048);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", *(_QWORD *)(a1 + 72));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setUserIndex:", v5);

  objc_msgSend(v4, "setCredential:", v2);
  objc_msgSend(v4, "setCredentialData:", *(_QWORD *)(a1 + 40));
  v20 = 0;
  objc_msgSend(MEMORY[0x24BE3F180], "futureWithPromise:", &v20);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "resolverBlock");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "setCredentialWithParams:expectedValues:expectedValueInterval:completionHandler:", v4, 0, 0, v7);

  v8 = MEMORY[0x24BDAC760];
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __99__HMMTRSyncClusterDoorLock_updateCredentialData_forCredentialType_atIndex_forUserAtUserIndex_flow___block_invoke_2;
  v15[3] = &unk_250F204E0;
  v9 = *(void **)(a1 + 56);
  v15[4] = *(_QWORD *)(a1 + 48);
  v16 = v9;
  v17 = *(id *)(a1 + 40);
  v18 = *(id *)(a1 + 32);
  v19 = *(_OWORD *)(a1 + 64);
  v13[0] = v8;
  v13[1] = 3221225472;
  v13[2] = __99__HMMTRSyncClusterDoorLock_updateCredentialData_forCredentialType_atIndex_forUserAtUserIndex_flow___block_invoke_222;
  v13[3] = &unk_250F21880;
  v10 = *(void **)(a1 + 56);
  v13[4] = *(_QWORD *)(a1 + 48);
  v14 = v10;
  objc_msgSend(v6, "then:orRecover:", v15, v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

uint64_t __99__HMMTRSyncClusterDoorLock_updateCredentialData_forCredentialType_atIndex_forUserAtUserIndex_flow___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  char v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  int v17;
  void *v18;
  id v19;
  NSObject *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  id v31;
  int v33;
  void *v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  uint64_t v40;
  __int16 v41;
  uint64_t v42;
  __int16 v43;
  uint64_t v44;
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(v3, "status");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToNumber:", &unk_250F3F090);

  if ((v5 & 1) != 0)
  {
    v6 = (void *)MEMORY[0x242656984]();
    v7 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "UUID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = *(void **)(a1 + 48);
      v12 = *(_QWORD *)(a1 + 56);
      v13 = *(_QWORD *)(a1 + 64);
      v14 = *(_QWORD *)(a1 + 72);
      v33 = 138544642;
      v34 = v9;
      v35 = 2112;
      v36 = v10;
      v37 = 2112;
      v38 = v11;
      v39 = 2112;
      v40 = v12;
      v41 = 2048;
      v42 = v13;
      v43 = 2048;
      v44 = v14;
      _os_log_impl(&dword_23E95B000, v8, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Successfully updated CredentialData: %@ forCredentialType: %@, atIndex: %ld forUserAtUserIndex: %ld", (uint8_t *)&v33, 0x3Eu);

    }
    objc_autoreleasePoolPop(v6);
    v3;
    v15 = 1;
  }
  else
  {
    objc_msgSend(v3, "status");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "isEqualToNumber:", &unk_250F3F048);

    v18 = (void *)MEMORY[0x242656984]();
    v19 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = v20;
    if (v17)
    {
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "UUID");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = 138543618;
        v34 = v22;
        v35 = 2112;
        v36 = v23;
        _os_log_impl(&dword_23E95B000, v21, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Credential is a duplicate", (uint8_t *)&v33, 0x16u);

      }
      objc_autoreleasePoolPop(v18);
      v24 = (void *)MEMORY[0x24BDD1540];
      v25 = 8;
    }
    else
    {
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "UUID");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "status");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = 138543874;
        v34 = v26;
        v35 = 2112;
        v36 = v27;
        v37 = 2112;
        v38 = v28;
        _os_log_impl(&dword_23E95B000, v21, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to add credential with status: %@", (uint8_t *)&v33, 0x20u);

      }
      objc_autoreleasePoolPop(v18);
      v24 = (void *)MEMORY[0x24BDD1540];
      v25 = 6;
    }
    objc_msgSend(v24, "errorWithDomain:code:userInfo:", CFSTR("HMMTROperationErrorDomain"), v25, 0);
    v29 = (id)objc_claimAutoreleasedReturnValue();
    v30 = v29;
    if (v29)
    {
      v31 = v29;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1540], "hmfUnspecifiedError");
      objc_claimAutoreleasedReturnValue();
    }

    v15 = 2;
  }

  return v15;
}

uint64_t __99__HMMTRSyncClusterDoorLock_updateCredentialData_forCredentialType_atIndex_forUserAtUserIndex_flow___block_invoke_222(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x242656984]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "UUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138543874;
    v14 = v7;
    v15 = 2112;
    v16 = v8;
    v17 = 2112;
    v18 = v3;
    _os_log_impl(&dword_23E95B000, v6, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to add credential with error: %@", (uint8_t *)&v13, 0x20u);

  }
  objc_autoreleasePoolPop(v4);
  v9 = v3;
  v10 = v9;
  if (v9)
  {
    v11 = v9;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "hmfUnspecifiedError");
    objc_claimAutoreleasedReturnValue();
  }

  return 2;
}

id __96__HMMTRSyncClusterDoorLock_addCredentialData_forCredentialType_atIndex_forUserAtUserIndex_flow___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[5];
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;
  __int128 v20;
  id v21;

  v2 = objc_alloc_init(MEMORY[0x24BDDB6D0]);
  objc_msgSend(v2, "setCredentialType:", *(_QWORD *)(a1 + 32));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", *(_QWORD *)(a1 + 64));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setCredentialIndex:", v3);

  v4 = objc_alloc_init(MEMORY[0x24BDDB720]);
  objc_msgSend(v4, "setOperationType:", &unk_250F3F090);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", *(_QWORD *)(a1 + 72));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setUserIndex:", v5);

  objc_msgSend(v4, "setCredential:", v2);
  objc_msgSend(v4, "setCredentialData:", *(_QWORD *)(a1 + 40));
  v21 = 0;
  objc_msgSend(MEMORY[0x24BE3F180], "futureWithPromise:", &v21);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "resolverBlock");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "baseDoorLock");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setCredentialWithParams:completion:", v4, v7);

  v9 = MEMORY[0x24BDAC760];
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __96__HMMTRSyncClusterDoorLock_addCredentialData_forCredentialType_atIndex_forUserAtUserIndex_flow___block_invoke_2;
  v16[3] = &unk_250F204E0;
  v10 = *(void **)(a1 + 56);
  v16[4] = *(_QWORD *)(a1 + 48);
  v17 = v10;
  v18 = *(id *)(a1 + 40);
  v19 = *(id *)(a1 + 32);
  v20 = *(_OWORD *)(a1 + 64);
  v14[0] = v9;
  v14[1] = 3221225472;
  v14[2] = __96__HMMTRSyncClusterDoorLock_addCredentialData_forCredentialType_atIndex_forUserAtUserIndex_flow___block_invoke_221;
  v14[3] = &unk_250F21880;
  v11 = *(void **)(a1 + 56);
  v14[4] = *(_QWORD *)(a1 + 48);
  v15 = v11;
  objc_msgSend(v6, "then:orRecover:", v16, v14);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

uint64_t __96__HMMTRSyncClusterDoorLock_addCredentialData_forCredentialType_atIndex_forUserAtUserIndex_flow___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  char v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  int v17;
  void *v18;
  id v19;
  NSObject *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  id v31;
  int v33;
  void *v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  uint64_t v40;
  __int16 v41;
  uint64_t v42;
  __int16 v43;
  uint64_t v44;
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(v3, "status");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToNumber:", &unk_250F3F090);

  if ((v5 & 1) != 0)
  {
    v6 = (void *)MEMORY[0x242656984]();
    v7 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "UUID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = *(void **)(a1 + 48);
      v12 = *(_QWORD *)(a1 + 56);
      v13 = *(_QWORD *)(a1 + 64);
      v14 = *(_QWORD *)(a1 + 72);
      v33 = 138544642;
      v34 = v9;
      v35 = 2112;
      v36 = v10;
      v37 = 2112;
      v38 = v11;
      v39 = 2112;
      v40 = v12;
      v41 = 2048;
      v42 = v13;
      v43 = 2048;
      v44 = v14;
      _os_log_impl(&dword_23E95B000, v8, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Successfully added CredentialData: %@ forCredentialType: %@, atIndex: %ld forUserAtUserIndex: %ld", (uint8_t *)&v33, 0x3Eu);

    }
    objc_autoreleasePoolPop(v6);
    v3;
    v15 = 1;
  }
  else
  {
    objc_msgSend(v3, "status");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "isEqualToNumber:", &unk_250F3F048);

    v18 = (void *)MEMORY[0x242656984]();
    v19 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = v20;
    if (v17)
    {
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "UUID");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = 138543618;
        v34 = v22;
        v35 = 2112;
        v36 = v23;
        _os_log_impl(&dword_23E95B000, v21, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Credential is a duplicate", (uint8_t *)&v33, 0x16u);

      }
      objc_autoreleasePoolPop(v18);
      v24 = (void *)MEMORY[0x24BDD1540];
      v25 = 8;
    }
    else
    {
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "UUID");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "status");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = 138543874;
        v34 = v26;
        v35 = 2112;
        v36 = v27;
        v37 = 2112;
        v38 = v28;
        _os_log_impl(&dword_23E95B000, v21, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to add credential with status: %@", (uint8_t *)&v33, 0x20u);

      }
      objc_autoreleasePoolPop(v18);
      v24 = (void *)MEMORY[0x24BDD1540];
      v25 = 6;
    }
    objc_msgSend(v24, "errorWithDomain:code:userInfo:", CFSTR("HMMTROperationErrorDomain"), v25, 0);
    v29 = (id)objc_claimAutoreleasedReturnValue();
    v30 = v29;
    if (v29)
    {
      v31 = v29;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1540], "hmfUnspecifiedError");
      objc_claimAutoreleasedReturnValue();
    }

    v15 = 2;
  }

  return v15;
}

uint64_t __96__HMMTRSyncClusterDoorLock_addCredentialData_forCredentialType_atIndex_forUserAtUserIndex_flow___block_invoke_221(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x242656984]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "UUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138543874;
    v14 = v7;
    v15 = 2112;
    v16 = v8;
    v17 = 2112;
    v18 = v3;
    _os_log_impl(&dword_23E95B000, v6, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to add credential with error: %@", (uint8_t *)&v13, 0x20u);

  }
  objc_autoreleasePoolPop(v4);
  v9 = v3;
  v10 = v9;
  if (v9)
  {
    v11 = v9;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "hmfUnspecifiedError");
    objc_claimAutoreleasedReturnValue();
  }

  return 2;
}

id __89__HMMTRSyncClusterDoorLock_updatePinCredentialAtIndex_withValue_forUserAtUserIndex_flow___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[5];
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;

  v2 = objc_alloc_init(MEMORY[0x24BDDB6D0]);
  objc_msgSend(v2, "setCredentialType:", &unk_250F3F030);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", *(_QWORD *)(a1 + 56));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setCredentialIndex:", v3);

  v4 = objc_alloc_init(MEMORY[0x24BDDB720]);
  objc_msgSend(v4, "setOperationType:", &unk_250F3F048);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", *(_QWORD *)(a1 + 64));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setUserIndex:", v5);

  objc_msgSend(v4, "setCredential:", v2);
  +[HMMTRSyncClusterDoorLock pinDataWithDigits:](HMMTRSyncClusterDoorLock, "pinDataWithDigits:", *(_QWORD *)(a1 + 32));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCredentialData:", v6);

  v18 = 0;
  objc_msgSend(MEMORY[0x24BE3F180], "futureWithPromise:", &v18);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "resolverBlock");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "setCredentialWithParams:expectedValues:expectedValueInterval:completionHandler:", v4, 0, 0, v8);

  v9 = MEMORY[0x24BDAC760];
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __89__HMMTRSyncClusterDoorLock_updatePinCredentialAtIndex_withValue_forUserAtUserIndex_flow___block_invoke_2;
  v16[3] = &unk_250F204B8;
  v10 = *(void **)(a1 + 48);
  v16[4] = *(_QWORD *)(a1 + 40);
  v17 = v10;
  v14[0] = v9;
  v14[1] = 3221225472;
  v14[2] = __89__HMMTRSyncClusterDoorLock_updatePinCredentialAtIndex_withValue_forUserAtUserIndex_flow___block_invoke_220;
  v14[3] = &unk_250F21880;
  v11 = *(void **)(a1 + 48);
  v14[4] = *(_QWORD *)(a1 + 40);
  v15 = v11;
  objc_msgSend(v7, "then:orRecover:", v16, v14);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

uint64_t __89__HMMTRSyncClusterDoorLock_updatePinCredentialAtIndex_withValue_forUserAtUserIndex_flow___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  char v5;
  uint64_t v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  uint64_t v15;
  id v16;
  void *v17;
  id v18;
  int v20;
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(v3, "status");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToNumber:", &unk_250F3F090);

  if ((v5 & 1) != 0)
  {
    v3;
    v6 = 1;
  }
  else
  {
    v7 = (void *)MEMORY[0x242656984]();
    v8 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "UUID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "status");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138543874;
      v21 = v10;
      v22 = 2112;
      v23 = v11;
      v24 = 2112;
      v25 = v12;
      _os_log_impl(&dword_23E95B000, v9, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to update pin credential with status: %@", (uint8_t *)&v20, 0x20u);

    }
    objc_autoreleasePoolPop(v7);
    objc_msgSend(v3, "status");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "isEqualToNumber:", &unk_250F3F048);

    if (v14)
      v15 = 8;
    else
      v15 = 7;
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("HMMTROperationErrorDomain"), v15, 0);
    v16 = (id)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (v16)
    {
      v18 = v16;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1540], "hmfUnspecifiedError");
      objc_claimAutoreleasedReturnValue();
    }

    v6 = 2;
  }

  return v6;
}

uint64_t __89__HMMTRSyncClusterDoorLock_updatePinCredentialAtIndex_withValue_forUserAtUserIndex_flow___block_invoke_220(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x242656984]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "UUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138543874;
    v14 = v7;
    v15 = 2112;
    v16 = v8;
    v17 = 2112;
    v18 = v3;
    _os_log_impl(&dword_23E95B000, v6, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to update pin credential with error: %@", (uint8_t *)&v13, 0x20u);

  }
  objc_autoreleasePoolPop(v4);
  v9 = v3;
  v10 = v9;
  if (v9)
  {
    v11 = v9;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "hmfUnspecifiedError");
    objc_claimAutoreleasedReturnValue();
  }

  return 2;
}

id __86__HMMTRSyncClusterDoorLock_addPinCredentialAtIndex_withValue_forUserAtUserIndex_flow___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[5];
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;

  v2 = objc_alloc_init(MEMORY[0x24BDDB6D0]);
  objc_msgSend(v2, "setCredentialType:", &unk_250F3F030);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", *(_QWORD *)(a1 + 56));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setCredentialIndex:", v3);

  v4 = objc_alloc_init(MEMORY[0x24BDDB720]);
  objc_msgSend(v4, "setOperationType:", &unk_250F3F090);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", *(_QWORD *)(a1 + 64));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setUserIndex:", v5);

  objc_msgSend(v4, "setCredential:", v2);
  +[HMMTRSyncClusterDoorLock pinDataWithDigits:](HMMTRSyncClusterDoorLock, "pinDataWithDigits:", *(_QWORD *)(a1 + 32));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCredentialData:", v6);

  v18 = 0;
  objc_msgSend(MEMORY[0x24BE3F180], "futureWithPromise:", &v18);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "resolverBlock");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "setCredentialWithParams:expectedValues:expectedValueInterval:completionHandler:", v4, 0, 0, v8);

  v9 = MEMORY[0x24BDAC760];
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __86__HMMTRSyncClusterDoorLock_addPinCredentialAtIndex_withValue_forUserAtUserIndex_flow___block_invoke_2;
  v16[3] = &unk_250F204B8;
  v10 = *(void **)(a1 + 48);
  v16[4] = *(_QWORD *)(a1 + 40);
  v17 = v10;
  v14[0] = v9;
  v14[1] = 3221225472;
  v14[2] = __86__HMMTRSyncClusterDoorLock_addPinCredentialAtIndex_withValue_forUserAtUserIndex_flow___block_invoke_219;
  v14[3] = &unk_250F21880;
  v11 = *(void **)(a1 + 48);
  v14[4] = *(_QWORD *)(a1 + 40);
  v15 = v11;
  objc_msgSend(v7, "then:orRecover:", v16, v14);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

uint64_t __86__HMMTRSyncClusterDoorLock_addPinCredentialAtIndex_withValue_forUserAtUserIndex_flow___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  char v5;
  void *v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  uint64_t v18;
  id v19;
  void *v20;
  id v21;
  int v23;
  void *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(v3, "status");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToNumber:", &unk_250F3F090);

  v6 = (void *)MEMORY[0x242656984]();
  v7 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if ((v5 & 1) != 0)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "UUID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 138543618;
      v24 = v10;
      v25 = 2112;
      v26 = v11;
      _os_log_impl(&dword_23E95B000, v9, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Successfully added pin credential", (uint8_t *)&v23, 0x16u);

    }
    objc_autoreleasePoolPop(v6);
    v3;
    v12 = 1;
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "UUID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "status");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 138543874;
      v24 = v13;
      v25 = 2112;
      v26 = v14;
      v27 = 2112;
      v28 = v15;
      _os_log_impl(&dword_23E95B000, v9, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to add pin credential with status: %@", (uint8_t *)&v23, 0x20u);

    }
    objc_autoreleasePoolPop(v6);
    objc_msgSend(v3, "status");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "isEqualToNumber:", &unk_250F3F048);

    if (v17)
      v18 = 8;
    else
      v18 = 6;
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("HMMTROperationErrorDomain"), v18, 0);
    v19 = (id)objc_claimAutoreleasedReturnValue();
    v20 = v19;
    if (v19)
    {
      v21 = v19;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1540], "hmfUnspecifiedError");
      objc_claimAutoreleasedReturnValue();
    }

    v12 = 2;
  }

  return v12;
}

uint64_t __86__HMMTRSyncClusterDoorLock_addPinCredentialAtIndex_withValue_forUserAtUserIndex_flow___block_invoke_219(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x242656984]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "UUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138543874;
    v14 = v7;
    v15 = 2112;
    v16 = v8;
    v17 = 2112;
    v18 = v3;
    _os_log_impl(&dword_23E95B000, v6, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to add pin credential with error: %@", (uint8_t *)&v13, 0x20u);

  }
  objc_autoreleasePoolPop(v4);
  v9 = v3;
  v10 = v9;
  if (v9)
  {
    v11 = v9;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "hmfUnspecifiedError");
    objc_claimAutoreleasedReturnValue();
  }

  return 2;
}

id __78__HMMTRSyncClusterDoorLock_addUserAtUserIndex_withUserUniqueID_userType_flow___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[5];
  id v12;
  id v13;

  v2 = objc_alloc_init(MEMORY[0x24BDDB728]);
  objc_msgSend(v2, "setOperationType:", &unk_250F3F090);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", *(_QWORD *)(a1 + 56));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setUserIndex:", v3);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", *(_QWORD *)(a1 + 64));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setUserUniqueId:", v4);

  objc_msgSend(v2, "setUserType:", *(_QWORD *)(a1 + 32));
  v13 = 0;
  objc_msgSend(MEMORY[0x24BE3F180], "futureWithPromise:", &v13);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "errorOnlyResolverBlock");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "baseDoorLock");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setUserWithParams:completion:", v2, v6);

  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __78__HMMTRSyncClusterDoorLock_addUserAtUserIndex_withUserUniqueID_userType_flow___block_invoke_2;
  v11[3] = &unk_250F21880;
  v8 = *(void **)(a1 + 48);
  v11[4] = *(_QWORD *)(a1 + 40);
  v12 = v8;
  objc_msgSend(v5, "recover:", v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

uint64_t __78__HMMTRSyncClusterDoorLock_addUserAtUserIndex_withUserUniqueID_userType_flow___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x242656984]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "UUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138543874;
    v14 = v7;
    v15 = 2112;
    v16 = v8;
    v17 = 2112;
    v18 = v3;
    _os_log_impl(&dword_23E95B000, v6, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to add user with error: %@", (uint8_t *)&v13, 0x20u);

  }
  objc_autoreleasePoolPop(v4);
  v9 = v3;
  v10 = v9;
  if (v9)
  {
    v11 = v9;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "hmfUnspecifiedError");
    objc_claimAutoreleasedReturnValue();
  }

  return 2;
}

id __40__HMMTRSyncClusterDoorLock_unlock_flow___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[4];
  id v7;
  id v8;

  v8 = 0;
  objc_msgSend(MEMORY[0x24BE3F180], "futureWithPromise:", &v8);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "errorOnlyResolverBlock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "unlockDoorWithParams:expectedValues:expectedValueInterval:completionHandler:", 0, 0, 0, v3);

  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __40__HMMTRSyncClusterDoorLock_unlock_flow___block_invoke_2;
  v6[3] = &unk_250F20468;
  v7 = *(id *)(a1 + 40);
  objc_msgSend(v2, "recover:", v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t __40__HMMTRSyncClusterDoorLock_unlock_flow___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x242656984]();
  objc_opt_class();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "UUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138543874;
    v14 = v7;
    v15 = 2112;
    v16 = v8;
    v17 = 2112;
    v18 = v3;
    _os_log_impl(&dword_23E95B000, v6, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Unlocked door with error: %@", (uint8_t *)&v13, 0x20u);

  }
  objc_autoreleasePoolPop(v4);
  v9 = v3;
  v10 = v9;
  if (v9)
  {
    v11 = v9;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "hmfUnspecifiedError");
    objc_claimAutoreleasedReturnValue();
  }

  return 2;
}

id __47__HMMTRSyncClusterDoorLock_unlockWithPin_flow___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[4];
  id v9;
  id v10;

  v2 = objc_alloc_init(MEMORY[0x24BDDB740]);
  +[HMMTRSyncClusterDoorLock pinDataWithDigits:](HMMTRSyncClusterDoorLock, "pinDataWithDigits:", *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setPinCode:", v3);

  v10 = 0;
  objc_msgSend(MEMORY[0x24BE3F180], "futureWithPromise:", &v10);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "errorOnlyResolverBlock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "unlockDoorWithParams:expectedValues:expectedValueInterval:completionHandler:", v2, 0, 0, v5);

  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __47__HMMTRSyncClusterDoorLock_unlockWithPin_flow___block_invoke_2;
  v8[3] = &unk_250F20468;
  v9 = *(id *)(a1 + 48);
  objc_msgSend(v4, "recover:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t __47__HMMTRSyncClusterDoorLock_unlockWithPin_flow___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x242656984]();
  objc_opt_class();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "UUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138543874;
    v14 = v7;
    v15 = 2112;
    v16 = v8;
    v17 = 2112;
    v18 = v3;
    _os_log_impl(&dword_23E95B000, v6, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Unlocked door with error: %@", (uint8_t *)&v13, 0x20u);

  }
  objc_autoreleasePoolPop(v4);
  v9 = v3;
  v10 = v9;
  if (v9)
  {
    v11 = v9;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "hmfUnspecifiedError");
    objc_claimAutoreleasedReturnValue();
  }

  return 2;
}

id __38__HMMTRSyncClusterDoorLock_lock_flow___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[4];
  id v7;
  id v8;

  v8 = 0;
  objc_msgSend(MEMORY[0x24BE3F180], "futureWithPromise:", &v8);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "errorOnlyResolverBlock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "lockDoorWithParams:expectedValues:expectedValueInterval:completionHandler:", 0, 0, 0, v3);

  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __38__HMMTRSyncClusterDoorLock_lock_flow___block_invoke_2;
  v6[3] = &unk_250F20468;
  v7 = *(id *)(a1 + 40);
  objc_msgSend(v2, "recover:", v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t __38__HMMTRSyncClusterDoorLock_lock_flow___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x242656984]();
  objc_opt_class();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "UUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138543874;
    v14 = v7;
    v15 = 2112;
    v16 = v8;
    v17 = 2112;
    v18 = v3;
    _os_log_impl(&dword_23E95B000, v6, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Locked door with error: %@", (uint8_t *)&v13, 0x20u);

  }
  objc_autoreleasePoolPop(v4);
  v9 = v3;
  v10 = v9;
  if (v9)
  {
    v11 = v9;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "hmfUnspecifiedError");
    objc_claimAutoreleasedReturnValue();
  }

  return 2;
}

id __45__HMMTRSyncClusterDoorLock_lockWithPin_flow___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[4];
  id v9;
  id v10;

  v2 = objc_alloc_init(MEMORY[0x24BDDB700]);
  +[HMMTRSyncClusterDoorLock pinDataWithDigits:](HMMTRSyncClusterDoorLock, "pinDataWithDigits:", *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setPinCode:", v3);

  v10 = 0;
  objc_msgSend(MEMORY[0x24BE3F180], "futureWithPromise:", &v10);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "errorOnlyResolverBlock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "lockDoorWithParams:expectedValues:expectedValueInterval:completionHandler:", v2, 0, 0, v5);

  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __45__HMMTRSyncClusterDoorLock_lockWithPin_flow___block_invoke_2;
  v8[3] = &unk_250F20468;
  v9 = *(id *)(a1 + 48);
  objc_msgSend(v4, "recover:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t __45__HMMTRSyncClusterDoorLock_lockWithPin_flow___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x242656984]();
  objc_opt_class();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "UUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138543874;
    v14 = v7;
    v15 = 2112;
    v16 = v8;
    v17 = 2112;
    v18 = v3;
    _os_log_impl(&dword_23E95B000, v6, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Locked door with error: %@", (uint8_t *)&v13, 0x20u);

  }
  objc_autoreleasePoolPop(v4);
  v9 = v3;
  v10 = v9;
  if (v9)
  {
    v11 = v9;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "hmfUnspecifiedError");
    objc_claimAutoreleasedReturnValue();
  }

  return 2;
}

uint64_t __62__HMMTRSyncClusterDoorLock_addReaderKeyData_toUserIndex_flow___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  uint64_t v7;
  void *v8;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "addCredentialData:forCredentialType:atIndex:forUserAtUserIndex:flow:", *(_QWORD *)(a1 + 40), &unk_250F3F048, objc_msgSend(v3, "integerValue"), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 48));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = v4;

    return 3;
  }
  else
  {
    v7 = _HMFPreconditionFailure();
    return __66__HMMTRSyncClusterDoorLock_addPinCodeWithValue_forUserIndex_flow___block_invoke(v7, v8);
  }
}

uint64_t __66__HMMTRSyncClusterDoorLock_addPinCodeWithValue_forUserIndex_flow___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  uint64_t v7;
  void *v8;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "addPinCredentialAtIndex:withValue:forUserAtUserIndex:flow:", objc_msgSend(v3, "integerValue"), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 48));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = v4;

    return 3;
  }
  else
  {
    v7 = _HMFPreconditionFailure();
    return __121__HMMTRSyncClusterDoorLock_findAllUsersWithCreatorFabricIndex_indexStartingAtSlot_assumingTotalNumberOfSlots_users_flow___block_invoke(v7, v8);
  }
}

uint64_t __121__HMMTRSyncClusterDoorLock_findAllUsersWithCreatorFabricIndex_indexStartingAtSlot_assumingTotalNumberOfSlots_users_flow___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v14;
  void *v15;

  v3 = a2;
  objc_msgSend(v3, "creatorFabricIndex");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToNumber:", *(_QWORD *)(a1 + 32));

  if (v5)
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v3);
  if (*(_QWORD *)(a1 + 64) >= *(_QWORD *)(a1 + 72)
    || (objc_msgSend(v3, "nextUserIndex"), v6 = (void *)objc_claimAutoreleasedReturnValue(), v6, !v6))
  {
    objc_msgSend(*(id *)(a1 + 40), "copy");
    v12 = 1;
    goto LABEL_8;
  }
  v7 = *(void **)(a1 + 48);
  v8 = *(_QWORD *)(a1 + 32);
  objc_msgSend(v3, "nextUserIndex");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "findAllUsersWithCreatorFabricIndex:indexStartingAtSlot:assumingTotalNumberOfSlots:users:flow:", v8, objc_msgSend(v9, "integerValue"), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56));
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = v10;

    v12 = 3;
LABEL_8:

    return v12;
  }
  v14 = _HMFPreconditionFailure();
  return __159__HMMTRSyncClusterDoorLock_readSchedulesForWritingForScheduleType_forUserIndex_startingAtSlot_assumingTotalNumberOfSlots_schedulesToSlots_availableSlots_flow___block_invoke(v14, v15);
}

uint64_t __159__HMMTRSyncClusterDoorLock_readSchedulesForWritingForScheduleType_forUserIndex_startingAtSlot_assumingTotalNumberOfSlots_schedulesToSlots_availableSlots_flow___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  uint64_t v22;
  id v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(v3, "status");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToNumber:", &unk_250F3F0A8);

  if (v5)
  {
    v6 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", *(_QWORD *)(a1 + 64));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v7);
    goto LABEL_11;
  }
  objc_msgSend(v3, "status");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToNumber:", &unk_250F3F090);

  if ((v9 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 56), "objectForKeyedSubscript:", v3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(*(id *)(a1 + 56), "objectForKeyedSubscript:", v3);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", *(_QWORD *)(a1 + 64));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addObject:", v11);

    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCEF0], "set");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", *(_QWORD *)(a1 + 64));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addObject:", v21);

      objc_msgSend(*(id *)(a1 + 56), "setObject:forKey:", v7, v3);
    }
LABEL_11:

    v22 = *(_QWORD *)(a1 + 64);
    if (v22 >= *(_QWORD *)(a1 + 72))
    {
      v26 = (void *)objc_opt_new();
      objc_msgSend(v26, "setAvailableSlots:", *(_QWORD *)(a1 + 32));
      objc_msgSend(v26, "setSchedulesToSlots:", *(_QWORD *)(a1 + 56));
      v25 = 1;
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 40), "readSchedulesForWritingForScheduleType:forUserIndex:startingAtSlot:assumingTotalNumberOfSlots:schedulesToSlots:availableSlots:flow:", *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 88), v22 + 1, *(_QWORD *)(a1 + 48));
      v23 = (id)objc_claimAutoreleasedReturnValue();
      if (!v23)
        _HMFPreconditionFailure();
      v24 = v23;

      v25 = 3;
    }
    goto LABEL_17;
  }
  v12 = (void *)MEMORY[0x242656984]();
  v13 = *(id *)(a1 + 40);
  HMFGetOSLogHandle();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "UUID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "status");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v29 = v15;
    v30 = 2112;
    v31 = v16;
    v32 = 2112;
    v33 = v17;
    _os_log_impl(&dword_23E95B000, v14, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Schedule status was an invalid response of %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v12);
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("HMMTROperationErrorDomain"), 9, 0);
  v18 = (id)objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (v18)
  {
    v20 = v18;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "hmfUnspecifiedError");
    objc_claimAutoreleasedReturnValue();
  }

  v25 = 2;
LABEL_17:

  return v25;
}

uint64_t __148__HMMTRSyncClusterDoorLock_findScheduleSlotsToAddAndClearForScheduleType_withRequestedSchedules_forUserAtUserIndex_numberOfSchedulesSupported_flow___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  id v29;
  NSObject *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  id v35;
  void *v37;
  id v38;
  uint64_t v39;
  void *v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  uint8_t buf[4];
  void *v46;
  __int16 v47;
  void *v48;
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(v3, "schedulesToSlots");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  v39 = a1;
  objc_msgSend(*(id *)(a1 + 32), "_findSchedulesToBeAdded:dict:", *(_QWORD *)(a1 + 40), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = v5;
  objc_msgSend(v5, "na_flatMap:", &__block_literal_global_207);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", objc_msgSend(v6, "count"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectEnumerator");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "availableSlots");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectEnumerator");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  v12 = v6;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
  if (v13)
  {
    v14 = v13;
    v37 = v7;
    v38 = v3;
    v15 = 0;
    v16 = *(_QWORD *)v42;
    while (2)
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v42 != v16)
          objc_enumerationMutation(v12);
        v18 = *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * i);
        objc_msgSend(v9, "nextObject", v37);
        v19 = objc_claimAutoreleasedReturnValue();

        v15 = (void *)v19;
        if (!v19)
        {
          objc_msgSend(v11, "nextObject");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v15)
          {
            v28 = (void *)MEMORY[0x242656984]();
            v29 = *(id *)(v39 + 32);
            HMFGetOSLogHandle();
            v30 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
            {
              HMFGetLogIdentifier();
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(*(id *)(v39 + 48), "UUID");
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v46 = v31;
              v47 = 2112;
              v48 = v32;
              _os_log_impl(&dword_23E95B000, v30, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] There are no more slots to add schedules. Should have errored before reaching here.", buf, 0x16u);

            }
            objc_autoreleasePoolPop(v28);
            objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("HMMTROperationErrorDomain"), 9, 0);
            v33 = (id)objc_claimAutoreleasedReturnValue();
            v34 = v33;
            v3 = v38;
            if (v33)
            {
              v35 = v33;
            }
            else
            {
              objc_msgSend(MEMORY[0x24BDD1540], "hmfUnspecifiedError");
              objc_claimAutoreleasedReturnValue();
            }
            v27 = v40;
            v22 = v37;

            v26 = 2;
            v20 = v12;
            goto LABEL_21;
          }
        }
        objc_msgSend(v8, "setObject:forKey:", v18, v15);
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
      if (v14)
        continue;
      break;
    }

    v7 = v37;
    v3 = v38;
  }

  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v7, "count"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "nextObject");
  v21 = objc_claimAutoreleasedReturnValue();
  v22 = v7;
  if (v21)
  {
    v23 = (void *)v21;
    do
    {
      objc_msgSend(v20, "addObject:", v23);
      objc_msgSend(v9, "nextObject");
      v24 = objc_claimAutoreleasedReturnValue();

      v23 = (void *)v24;
    }
    while (v24);
  }
  v25 = (void *)objc_opt_new();
  objc_msgSend(v25, "setSlotToHMMTRSchedulesToAdd:", v8);
  objc_msgSend(v25, "setSlotsOfSchedulesToClear:", v20);
  v26 = 1;
  v27 = v40;
LABEL_21:

  return v26;
}

uint64_t __148__HMMTRSyncClusterDoorLock_findScheduleSlotsToAddAndClearForScheduleType_withRequestedSchedules_forUserAtUserIndex_numberOfSchedulesSupported_flow___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "allObjects");
}

uint64_t __105__HMMTRSyncClusterDoorLock_updateSchedulesOfScheduleType_withRequestedSchedules_forUserAtUserIndex_flow___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  _QWORD v19[5];
  id v20;
  __int128 v21;
  _QWORD v22[5];
  id v23;
  __int128 v24;
  _QWORD v25[3];

  v25[2] = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x24BE3F180];
  objc_msgSend(v3, "slotToHMMTRSchedulesToAdd");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v22[2] = __105__HMMTRSyncClusterDoorLock_updateSchedulesOfScheduleType_withRequestedSchedules_forUserAtUserIndex_flow___block_invoke_2;
  v22[3] = &unk_250F20310;
  v6 = *(void **)(a1 + 40);
  v22[4] = *(_QWORD *)(a1 + 32);
  v7 = MEMORY[0x24BDAC760];
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v24 = *(_OWORD *)(a1 + 48);
  v23 = v6;
  objc_msgSend(v5, "na_map:", v22);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "all:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v9;
  v10 = (void *)MEMORY[0x24BE3F180];
  objc_msgSend(v3, "slotsOfSchedulesToClear");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v7;
  v19[1] = 3221225472;
  v19[2] = __105__HMMTRSyncClusterDoorLock_updateSchedulesOfScheduleType_withRequestedSchedules_forUserAtUserIndex_flow___block_invoke_3;
  v19[3] = &unk_250F20338;
  v12 = *(void **)(a1 + 40);
  v19[4] = *(_QWORD *)(a1 + 32);
  v21 = *(_OWORD *)(a1 + 48);
  v20 = v12;
  objc_msgSend(v11, "na_map:", v19);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "all:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v25[1] = v14;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v25, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "all:", v15);
  v16 = (id)objc_claimAutoreleasedReturnValue();
  if (!v16)
    _HMFPreconditionFailure();
  v17 = v16;

  return 3;
}

id __105__HMMTRSyncClusterDoorLock_updateSchedulesOfScheduleType_withRequestedSchedules_forUserAtUserIndex_flow___block_invoke_2(_QWORD *a1, void *a2, void *a3)
{
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;

  v5 = (void *)a1[4];
  v6 = a1[6];
  v7 = a3;
  objc_msgSend(v5, "setScheduleOfScheduleType:withSchedule:atScheduleIndex:forUserAtUserIndex:flow:", v6, v7, objc_msgSend(a2, "integerValue"), a1[7], a1[5]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

uint64_t __105__HMMTRSyncClusterDoorLock_updateSchedulesOfScheduleType_withRequestedSchedules_forUserAtUserIndex_flow___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "clearScheduleOfScheduleType:atScheduleIndex:forUserAtUserIndex:flow:", *(_QWORD *)(a1 + 48), objc_msgSend(a2, "integerValue"), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40));
}

uint64_t __113__HMMTRSyncClusterDoorLock_findOperationOrderForModifyingWeekDaySchedules_andYearDaySchedules_forUserIndex_flow___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  uint64_t v7;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "clearScheduleOfScheduleType:atScheduleIndex:forUserAtUserIndex:flow:", 1, 254, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = v4;

    return 3;
  }
  else
  {
    v7 = _HMFPreconditionFailure();
    return __113__HMMTRSyncClusterDoorLock_findOperationOrderForModifyingWeekDaySchedules_andYearDaySchedules_forUserIndex_flow___block_invoke_2(v7);
  }
}

uint64_t __113__HMMTRSyncClusterDoorLock_findOperationOrderForModifyingWeekDaySchedules_andYearDaySchedules_forUserIndex_flow___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  uint64_t v7;
  void *v8;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "clearScheduleOfScheduleType:atScheduleIndex:forUserAtUserIndex:flow:", 0, 254, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = v4;

    return 3;
  }
  else
  {
    v7 = _HMFPreconditionFailure();
    return __92__HMMTRSyncClusterDoorLock_getAllUsersStartingAtSlot_assumingTotalNumberOfSlots_users_flow___block_invoke(v7, v8);
  }
}

uint64_t __92__HMMTRSyncClusterDoorLock_getAllUsersStartingAtSlot_assumingTotalNumberOfSlots_users_flow___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  _QWORD *v13;
  void *v14;

  v3 = a2;
  objc_msgSend(v3, "userStatus");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToNumber:", &unk_250F3F090);

  if ((v5 & 1) == 0)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);
  if (*(_QWORD *)(a1 + 56) >= *(_QWORD *)(a1 + 64)
    || (objc_msgSend(v3, "nextUserIndex"), v6 = (void *)objc_claimAutoreleasedReturnValue(), v6, !v6))
  {
    objc_msgSend(*(id *)(a1 + 32), "copy");
    v11 = 1;
    goto LABEL_8;
  }
  v7 = *(void **)(a1 + 40);
  objc_msgSend(v3, "nextUserIndex");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "getAllUsersStartingAtSlot:assumingTotalNumberOfSlots:users:flow:", objc_msgSend(v8, "integerValue"), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));
  v9 = (id)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = v9;

    v11 = 3;
LABEL_8:

    return v11;
  }
  v13 = (_QWORD *)_HMFPreconditionFailure();
  return __139__HMMTRSyncClusterDoorLock_findHomeUserWithUniqueID_indexStartingAtSlot_assumingTotalNumberOfSlots_availableSlots_currentFabricIndex_flow___block_invoke(v13, v14);
}

uint64_t __139__HMMTRSyncClusterDoorLock_findHomeUserWithUniqueID_indexStartingAtSlot_assumingTotalNumberOfSlots_availableSlots_currentFabricIndex_flow___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;
  void *v21;
  uint64_t v22;
  uint64_t v24;
  void *v25;

  v3 = a2;
  objc_msgSend(v3, "creatorFabricIndex");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isEqualToNumber:", a1[4]) & 1) != 0)
  {
    objc_msgSend(v3, "userUniqueId");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isEqualToNumber:", a1[5]);

    if (v6)
    {
      objc_msgSend((id)objc_opt_new(), "setUser:", v3);
LABEL_15:
      v22 = 1;
      goto LABEL_16;
    }
  }
  else
  {

  }
  objc_msgSend(v3, "userStatus");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    v8 = (void *)a1[6];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a1[9]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v9);

  }
  if (a1[9] >= a1[10])
    goto LABEL_14;
  objc_msgSend(v3, "nextUserIndex");
  v10 = objc_claimAutoreleasedReturnValue();
  if (!v10
    || (v11 = (void *)v10,
        objc_msgSend(v3, "nextUserIndex"),
        v12 = (void *)objc_claimAutoreleasedReturnValue(),
        v13 = objc_msgSend(v12, "integerValue") - a1[9],
        v12,
        v11,
        v13 >= 2))
  {
    v14 = (void *)a1[6];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a1[9] + 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObject:", v15);

  }
  objc_msgSend(v3, "nextUserIndex");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v16)
  {
LABEL_14:
    objc_msgSend((id)objc_opt_new(), "setAvailableSlots:", a1[6]);
    goto LABEL_15;
  }
  v17 = (void *)a1[7];
  v18 = a1[5];
  objc_msgSend(v3, "nextUserIndex");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "findHomeUserWithUniqueID:indexStartingAtSlot:assumingTotalNumberOfSlots:availableSlots:currentFabricIndex:flow:", v18, objc_msgSend(v19, "integerValue"), a1[10], a1[6], a1[4], a1[8]);
  v20 = (id)objc_claimAutoreleasedReturnValue();
  if (v20)
  {
    v21 = v20;

    v22 = 3;
LABEL_16:

    return v22;
  }
  v24 = _HMFPreconditionFailure();
  return __100__HMMTRSyncClusterDoorLock_getAllCredentialsIndexStartingAtSlot_forCredentialType_credentials_flow___block_invoke(v24, v25);
}

uint64_t __100__HMMTRSyncClusterDoorLock_getAllCredentialsIndexStartingAtSlot_forCredentialType_credentials_flow___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v13;
  void *v14;

  v3 = a2;
  objc_msgSend(v3, "credentialExists");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  if (v5)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);
  objc_msgSend(v3, "nextCredentialIndex");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    *(id *)(a1 + 32);
    v11 = 1;
    goto LABEL_7;
  }
  v7 = *(void **)(a1 + 40);
  objc_msgSend(v3, "nextCredentialIndex");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "getAllCredentialsIndexStartingAtSlot:forCredentialType:credentials:flow:", objc_msgSend(v8, "integerValue"), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));
  v9 = (id)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = v9;

    v11 = 3;
LABEL_7:

    return v11;
  }
  v13 = _HMFPreconditionFailure();
  return __121__HMMTRSyncClusterDoorLock_findAvailableCredentialIndexStartingAtSlot_forCredentialType_assumingTotalNumberOfSlots_flow___block_invoke(v13, v14);
}

uint64_t __121__HMMTRSyncClusterDoorLock_findAvailableCredentialIndexStartingAtSlot_forCredentialType_assumingTotalNumberOfSlots_flow___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  char v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  uint64_t v19;
  void *v20;

  v3 = a2;
  objc_msgSend(v3, "credentialExists");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  if ((v5 & 1) == 0)
  {
    v10 = (void *)MEMORY[0x24BDD16E0];
    v11 = *(_QWORD *)(a1 + 48);
    goto LABEL_7;
  }
  if (*(_QWORD *)(a1 + 48) >= *(_QWORD *)(a1 + 56))
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("HMMTROperationErrorDomain"), 5, 0);
    v13 = (id)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13)
    {
      v15 = v13;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1540], "hmfUnspecifiedError");
      objc_claimAutoreleasedReturnValue();
    }

    v12 = 2;
    goto LABEL_14;
  }
  objc_msgSend(v3, "nextCredentialIndex");
  v6 = objc_claimAutoreleasedReturnValue();
  if (!v6
    || (v7 = (void *)v6,
        objc_msgSend(v3, "nextCredentialIndex"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = objc_msgSend(v8, "integerValue") - *(_QWORD *)(a1 + 48),
        v8,
        v7,
        v9 >= 2))
  {
    v10 = (void *)MEMORY[0x24BDD16E0];
    v11 = *(_QWORD *)(a1 + 48) + 1;
LABEL_7:
    objc_msgSend(v10, "numberWithInteger:", v11);
    objc_claimAutoreleasedReturnValue();
    v12 = 1;
LABEL_14:

    return v12;
  }
  objc_msgSend(*(id *)(a1 + 32), "findAvailableCredentialIndexStartingAtSlot:forCredentialType:assumingTotalNumberOfSlots:flow:", *(_QWORD *)(a1 + 48) + 2, *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40));
  v16 = (id)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    v17 = v16;

    v12 = 3;
    goto LABEL_14;
  }
  v19 = _HMFPreconditionFailure();
  return __79__HMMTRSyncClusterDoorLock_firstAvailableCredentialSlotForCredentialType_flow___block_invoke(v19, v20);
}

uint64_t __79__HMMTRSyncClusterDoorLock_firstAvailableCredentialSlotForCredentialType_flow___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  uint64_t v7;
  void *v8;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "findAvailableCredentialIndexStartingAtSlot:forCredentialType:assumingTotalNumberOfSlots:flow:", 1, *(_QWORD *)(a1 + 48), objc_msgSend(v3, "integerValue"), *(_QWORD *)(a1 + 40));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = v4;

    return 3;
  }
  else
  {
    v7 = _HMFPreconditionFailure();
    return __68__HMMTRSyncClusterDoorLock_findOrAddUserWithUniqueID_userType_flow___block_invoke(v7, v8);
  }
}

uint64_t __68__HMMTRSyncClusterDoorLock_findOrAddUserWithUniqueID_userType_flow___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  int v15;
  void *v16;
  id v17;
  NSObject *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  id v28;
  void *v29;
  _QWORD v31[5];
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(v3, "user");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = (void *)objc_opt_new();
    objc_msgSend(v3, "user");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setExistingUser:", v6);

    v7 = (void *)MEMORY[0x242656984]();
    v8 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "UUID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "existingUser");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v33 = v10;
      v34 = 2112;
      v35 = v11;
      v36 = 2112;
      v37 = v12;
      _os_log_impl(&dword_23E95B000, v9, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Found user: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v7);
    v13 = 1;
  }
  else
  {
    objc_msgSend(v3, "availableSlots");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "hmf_isEmpty");

    if (v15)
    {
      v16 = (void *)MEMORY[0x242656984]();
      v17 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "UUID");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v33 = v19;
        v34 = 2112;
        v35 = v20;
        _os_log_impl(&dword_23E95B000, v18, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Could not add home user because there are no available slots", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v16);
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("HMMTROperationErrorDomain"), 5, 0);
      v21 = (id)objc_claimAutoreleasedReturnValue();
      v22 = v21;
      if (v21)
      {
        v23 = v21;
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDD1540], "hmfUnspecifiedError");
        objc_claimAutoreleasedReturnValue();
      }

      v13 = 2;
    }
    else
    {
      objc_msgSend(v3, "availableSlots");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "firstObject");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v25, "integerValue");

      objc_msgSend(*(id *)(a1 + 32), "addUserAtUserIndex:withUserUniqueID:userType:flow:", v26, objc_msgSend(*(id *)(a1 + 48), "integerValue"), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v31[0] = MEMORY[0x24BDAC760];
      v31[1] = 3221225472;
      v31[2] = __68__HMMTRSyncClusterDoorLock_findOrAddUserWithUniqueID_userType_flow___block_invoke_196;
      v31[3] = &__block_descriptor_40_e50___HMFFutureBlockOutcome_q__16__0___HMFAlwaysNil__8l;
      v31[4] = v26;
      objc_msgSend(v27, "then:", v31);
      v28 = (id)objc_claimAutoreleasedReturnValue();
      if (!v28)
        _HMFPreconditionFailure();
      v29 = v28;

      v13 = 3;
    }
  }

  return v13;
}

uint64_t __68__HMMTRSyncClusterDoorLock_findOrAddUserWithUniqueID_userType_flow___block_invoke_196(uint64_t a1)
{
  objc_msgSend((id)objc_opt_new(), "setNewUserSlot:", *(_QWORD *)(a1 + 32));
  return 1;
}

uint64_t __55__HMMTRSyncClusterDoorLock_rfidCredentialForUser_flow___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "credentialType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToNumber:", &unk_250F3F048);

  return v3;
}

uint64_t __54__HMMTRSyncClusterDoorLock_pinCredentialForUser_flow___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "credentialType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToNumber:", &unk_250F3F030);

  return v3;
}

uint64_t __50__HMMTRSyncClusterDoorLock_provisionHomePin_flow___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v13;

  v3 = a2;
  if (!objc_msgSend(v3, "newUserSlot"))
  {
    objc_msgSend(v3, "existingUser");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "userIndex");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "integerValue");

    v9 = *(void **)(a1 + 32);
    objc_msgSend(v3, "existingUser");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "pinCredentialForUser:flow:", v10, *(_QWORD *)(a1 + 48));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
      objc_msgSend(*(id *)(a1 + 32), "updatePinCredentialAtIndex:withValue:forUserAtUserIndex:flow:", objc_msgSend(v5, "integerValue"), *(_QWORD *)(a1 + 40), v8, *(_QWORD *)(a1 + 48));
    else
      objc_msgSend(*(id *)(a1 + 32), "addPinCodeWithValue:forUserIndex:flow:", *(_QWORD *)(a1 + 40), v8, *(_QWORD *)(a1 + 48));
    v11 = (id)objc_claimAutoreleasedReturnValue();
    v4 = v11;
    if (!v11)
      goto LABEL_10;

LABEL_9:
    return 3;
  }
  objc_msgSend(*(id *)(a1 + 32), "addPinCodeWithValue:forUserIndex:flow:", *(_QWORD *)(a1 + 40), objc_msgSend(v3, "newUserSlot"), *(_QWORD *)(a1 + 48));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
    goto LABEL_9;
LABEL_10:
  v13 = _HMFPreconditionFailure();
  return (uint64_t)__59__HMMTRSyncClusterDoorLock_readSchedulesForUserIndex_flow___block_invoke(v13);
}

id __59__HMMTRSyncClusterDoorLock_readSchedulesForUserIndex_flow___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[2];
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x242656984]();
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
    *(_DWORD *)buf = 138543874;
    v17 = v5;
    v18 = 2112;
    v19 = v6;
    v20 = 2048;
    v21 = v7;
    _os_log_impl(&dword_23E95B000, v4, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] readSchedulesForUserIndex: %ld", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v2);
  v8 = (void *)MEMORY[0x24BE3F180];
  objc_msgSend(*(id *)(a1 + 32), "readScheduleForScheduleType:forUserIndex:flow:", 0, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "readScheduleForScheduleType:forUserIndex:flow:", 1, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v10;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v15, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "all:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "then:", &__block_literal_global_173);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

uint64_t __59__HMMTRSyncClusterDoorLock_readSchedulesForUserIndex_flow___block_invoke_172(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  id v5;

  v2 = a2;
  objc_msgSend(v2, "objectAtIndexedSubscript:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectAtIndexedSubscript:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v4);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  return 1;
}

id __102__HMMTRSyncClusterDoorLock_updateSchedulesForUserIndex_withWeekDaySchedules_andYearDaySchedules_flow___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v20[5];
  id v21;
  _QWORD v22[5];
  id v23;
  id v24;
  uint64_t v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  uint64_t v31;
  __int16 v32;
  uint64_t v33;
  __int16 v34;
  uint64_t v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x242656984]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "UUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1 + 56);
    v7 = *(_QWORD *)(a1 + 64);
    v9 = *(_QWORD *)(a1 + 48);
    *(_DWORD *)buf = 138544386;
    v27 = v5;
    v28 = 2112;
    v29 = v6;
    v30 = 2048;
    v31 = v7;
    v32 = 2112;
    v33 = v9;
    v34 = 2112;
    v35 = v8;
    _os_log_impl(&dword_23E95B000, v4, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] updateSchedulesForUserIndex: %ld, withWeekDaySchedules: %@ andYearDaySchedules: %@", buf, 0x34u);

  }
  objc_autoreleasePoolPop(v2);
  v10 = &unk_250F3F0C0;
  if (objc_msgSend(*(id *)(a1 + 48), "hmf_isEmpty")
    && objc_msgSend(*(id *)(a1 + 56), "hmf_isEmpty"))
  {
    v10 = &unk_250F3F090;
  }
  v11 = v10;
  objc_msgSend(*(id *)(a1 + 32), "findOperationOrderForModifyingWeekDaySchedules:andYearDaySchedules:forUserIndex:flow:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 40));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x24BDAC760];
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __102__HMMTRSyncClusterDoorLock_updateSchedulesForUserIndex_withWeekDaySchedules_andYearDaySchedules_flow___block_invoke_171;
  v22[3] = &unk_250F1FFE8;
  v25 = *(_QWORD *)(a1 + 64);
  v14 = *(void **)(a1 + 40);
  v22[4] = *(_QWORD *)(a1 + 32);
  v23 = v11;
  v24 = v14;
  v15 = v11;
  objc_msgSend(v12, "then:", v22);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v13;
  v20[1] = 3221225472;
  v20[2] = __102__HMMTRSyncClusterDoorLock_updateSchedulesForUserIndex_withWeekDaySchedules_andYearDaySchedules_flow___block_invoke_2;
  v20[3] = &unk_250F21880;
  v17 = *(void **)(a1 + 40);
  v20[4] = *(_QWORD *)(a1 + 32);
  v21 = v17;
  objc_msgSend(v16, "recover:", v20);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

uint64_t __102__HMMTRSyncClusterDoorLock_updateSchedulesForUserIndex_withWeekDaySchedules_andYearDaySchedules_flow___block_invoke_171(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  uint64_t v7;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "updateUserTypeForUserIndex:userType:flow:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = v4;

    return 3;
  }
  else
  {
    v7 = _HMFPreconditionFailure();
    return __102__HMMTRSyncClusterDoorLock_updateSchedulesForUserIndex_withWeekDaySchedules_andYearDaySchedules_flow___block_invoke_2(v7);
  }
}

uint64_t __102__HMMTRSyncClusterDoorLock_updateSchedulesForUserIndex_withWeekDaySchedules_andYearDaySchedules_flow___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x242656984]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "UUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138543874;
    v14 = v7;
    v15 = 2112;
    v16 = v8;
    v17 = 2112;
    v18 = v3;
    _os_log_impl(&dword_23E95B000, v6, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to update either week or year day schedules with error: %@", (uint8_t *)&v13, 0x20u);

  }
  objc_autoreleasePoolPop(v4);
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("HMMTROperationErrorDomain"), 9, 0);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    v11 = v9;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "hmfUnspecifiedError");
    objc_claimAutoreleasedReturnValue();
  }

  return 2;
}

id __100__HMMTRSyncClusterDoorLock_findOrAddUserWithUniqueID_withWeekDaySchedules_andYearDaySchedules_flow___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  _QWORD v19[4];
  id v20;
  id v21;
  uint64_t v22;
  id v23;
  id v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  uint64_t v30;
  __int16 v31;
  uint64_t v32;
  __int16 v33;
  uint64_t v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x242656984]();
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
    v8 = *(_QWORD *)(a1 + 56);
    v9 = *(_QWORD *)(a1 + 64);
    *(_DWORD *)buf = 138544386;
    v26 = v5;
    v27 = 2112;
    v28 = v6;
    v29 = 2048;
    v30 = v7;
    v31 = 2112;
    v32 = v8;
    v33 = 2112;
    v34 = v9;
    _os_log_impl(&dword_23E95B000, v4, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] findOrAddUserWithUniqueID: %ld, withWeekDaySchedules: %@ andYearDaySchedules: %@", buf, 0x34u);

  }
  objc_autoreleasePoolPop(v2);
  v10 = &unk_250F3F0C0;
  if (objc_msgSend(*(id *)(a1 + 56), "hmf_isEmpty")
    && objc_msgSend(*(id *)(a1 + 64), "hmf_isEmpty"))
  {
    v10 = &unk_250F3F090;
  }
  v11 = v10;
  objc_msgSend(*(id *)(a1 + 32), "findOrAddUserWithUniqueID:userType:flow:", *(_QWORD *)(a1 + 48), v11, *(_QWORD *)(a1 + 40));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __100__HMMTRSyncClusterDoorLock_findOrAddUserWithUniqueID_withWeekDaySchedules_andYearDaySchedules_flow___block_invoke_169;
  v19[3] = &unk_250F20038;
  v20 = *(id *)(a1 + 56);
  v13 = *(id *)(a1 + 64);
  v14 = *(_QWORD *)(a1 + 32);
  v15 = *(void **)(a1 + 40);
  v21 = v13;
  v22 = v14;
  v23 = v15;
  v24 = v11;
  v16 = v11;
  objc_msgSend(v12, "then:", v19);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

uint64_t __100__HMMTRSyncClusterDoorLock_findOrAddUserWithUniqueID_withWeekDaySchedules_andYearDaySchedules_flow___block_invoke_169(id *a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  uint64_t v15;
  id v16;
  id v17;
  void *v18;
  id v20;
  void *v21;
  uint64_t v22;
  void *v23;
  _QWORD v24[5];
  id v25;
  id v26;
  _QWORD v27[4];
  id v28;
  _QWORD v29[5];
  id v30;
  id v31;
  uint64_t v32;

  v3 = a2;
  v4 = objc_msgSend(v3, "newUserSlot");
  if (!v4)
  {
    objc_msgSend(v3, "existingUser");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "userIndex");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v6, "integerValue");

  }
  if (objc_msgSend(a1[4], "hmf_isEmpty")
    && objc_msgSend(a1[5], "hmf_isEmpty")
    && (objc_msgSend(v3, "existingUser"), v7 = (void *)objc_claimAutoreleasedReturnValue(), v7, !v7))
  {
    objc_msgSend(MEMORY[0x24BE3F180], "futureWithValue:", v3);
    v20 = (id)objc_claimAutoreleasedReturnValue();
    if (v20)
    {
      v21 = v20;

      goto LABEL_11;
    }
  }
  else
  {
    objc_msgSend(a1[6], "findOperationOrderForModifyingWeekDaySchedules:andYearDaySchedules:forUserIndex:flow:", a1[4], a1[5], v4, a1[7]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "existingUser");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = MEMORY[0x24BDAC760];
    if (v9)
    {
      v11 = (void *)v9;
      objc_msgSend(v3, "existingUser");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "userType");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "isEqualToNumber:", a1[8]);

      if ((v14 & 1) == 0)
      {
        v29[0] = v10;
        v29[1] = 3221225472;
        v29[2] = __100__HMMTRSyncClusterDoorLock_findOrAddUserWithUniqueID_withWeekDaySchedules_andYearDaySchedules_flow___block_invoke_2;
        v29[3] = &unk_250F1FFE8;
        v29[4] = a1[6];
        v32 = v4;
        v30 = a1[8];
        v31 = a1[7];
        objc_msgSend(v8, "then:", v29);
        v15 = objc_claimAutoreleasedReturnValue();

        v8 = (void *)v15;
      }
    }
    v27[0] = v10;
    v27[1] = 3221225472;
    v27[2] = __100__HMMTRSyncClusterDoorLock_findOrAddUserWithUniqueID_withWeekDaySchedules_andYearDaySchedules_flow___block_invoke_3;
    v27[3] = &unk_250F20010;
    v28 = v3;
    v24[0] = v10;
    v24[1] = 3221225472;
    v24[2] = __100__HMMTRSyncClusterDoorLock_findOrAddUserWithUniqueID_withWeekDaySchedules_andYearDaySchedules_flow___block_invoke_4;
    v24[3] = &unk_250F233F0;
    v16 = a1[7];
    v24[4] = a1[6];
    v25 = v16;
    v26 = v28;
    objc_msgSend(v8, "then:orRecover:", v27, v24);
    v17 = (id)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      v18 = v17;

LABEL_11:
      return 3;
    }
  }
  v22 = _HMFPreconditionFailure();
  return __100__HMMTRSyncClusterDoorLock_findOrAddUserWithUniqueID_withWeekDaySchedules_andYearDaySchedules_flow___block_invoke_2(v22, v23);
}

uint64_t __100__HMMTRSyncClusterDoorLock_findOrAddUserWithUniqueID_withWeekDaySchedules_andYearDaySchedules_flow___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  uint64_t v7;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "updateUserTypeForUserIndex:userType:flow:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = v4;

    return 3;
  }
  else
  {
    v7 = _HMFPreconditionFailure();
    return __100__HMMTRSyncClusterDoorLock_findOrAddUserWithUniqueID_withWeekDaySchedules_andYearDaySchedules_flow___block_invoke_3(v7);
  }
}

uint64_t __100__HMMTRSyncClusterDoorLock_findOrAddUserWithUniqueID_withWeekDaySchedules_andYearDaySchedules_flow___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  uint64_t v7;

  v3 = a2;
  objc_msgSend(MEMORY[0x24BE3F180], "futureWithValue:", *(_QWORD *)(a1 + 32));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = v4;

    return 3;
  }
  else
  {
    v7 = _HMFPreconditionFailure();
    return __100__HMMTRSyncClusterDoorLock_findOrAddUserWithUniqueID_withWeekDaySchedules_andYearDaySchedules_flow___block_invoke_4(v7);
  }
}

uint64_t __100__HMMTRSyncClusterDoorLock_findOrAddUserWithUniqueID_withWeekDaySchedules_andYearDaySchedules_flow___block_invoke_4(id *a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  int v19;
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x242656984]();
  v5 = a1[4];
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[5], "UUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 138543874;
    v20 = v7;
    v21 = 2112;
    v22 = v8;
    v23 = 2112;
    v24 = v3;
    _os_log_impl(&dword_23E95B000, v6, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to update either week or year day schedules with error: %@", (uint8_t *)&v19, 0x20u);

  }
  objc_autoreleasePoolPop(v4);
  if (objc_msgSend(a1[6], "newUserSlot"))
  {
    v9 = (void *)MEMORY[0x242656984]();
    v10 = a1[4];
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[5], "UUID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138543618;
      v20 = v12;
      v21 = 2112;
      v22 = v13;
      _os_log_impl(&dword_23E95B000, v11, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Failed to create a new RG matter user with correct schedules, so removing the user.", (uint8_t *)&v19, 0x16u);

    }
    objc_autoreleasePoolPop(v9);
    v14 = (id)objc_msgSend(a1[4], "clearUserAtIndex:flow:", objc_msgSend(a1[6], "newUserSlot"), a1[5]);
  }
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("HMMTROperationErrorDomain"), 9, 0);
  v15 = (id)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v15)
  {
    v17 = v15;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "hmfUnspecifiedError");
    objc_claimAutoreleasedReturnValue();
  }

  return 2;
}

id __75__HMMTRSyncClusterDoorLock_clearCredentialAtIndex_withCredentialType_flow___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[5];
  id v11;
  id v12;

  v2 = objc_alloc_init(MEMORY[0x24BDDB6D0]);
  objc_msgSend(v2, "setCredentialType:", *(_QWORD *)(a1 + 32));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", *(_QWORD *)(a1 + 56));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setCredentialIndex:", v3);

  v4 = objc_alloc_init(MEMORY[0x24BDDB6B0]);
  objc_msgSend(v4, "setCredential:", v2);
  v12 = 0;
  objc_msgSend(MEMORY[0x24BE3F180], "futureWithPromise:", &v12);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "errorOnlyResolverBlock");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "clearCredentialWithParams:expectedValues:expectedValueInterval:completionHandler:", v4, 0, 0, v6);

  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __75__HMMTRSyncClusterDoorLock_clearCredentialAtIndex_withCredentialType_flow___block_invoke_2;
  v10[3] = &unk_250F21880;
  v7 = *(void **)(a1 + 48);
  v10[4] = *(_QWORD *)(a1 + 40);
  v11 = v7;
  objc_msgSend(v5, "recover:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

uint64_t __75__HMMTRSyncClusterDoorLock_clearCredentialAtIndex_withCredentialType_flow___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x242656984]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "UUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138543874;
    v14 = v7;
    v15 = 2112;
    v16 = v8;
    v17 = 2112;
    v18 = v3;
    _os_log_impl(&dword_23E95B000, v6, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to update pin credential with error: %@", (uint8_t *)&v13, 0x20u);

  }
  objc_autoreleasePoolPop(v4);
  v9 = v3;
  v10 = v9;
  if (v9)
  {
    v11 = v9;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "hmfUnspecifiedError");
    objc_claimAutoreleasedReturnValue();
  }

  return 2;
}

id __50__HMMTRSyncClusterDoorLock_clearUserAtIndex_flow___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  _QWORD v11[5];
  id v12;
  uint64_t v13;
  id v14;

  v2 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", *(_QWORD *)(a1 + 48));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setUserIndex:", v3);

  v14 = 0;
  objc_msgSend(MEMORY[0x24BE3F180], "futureWithPromise:", &v14);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "errorOnlyResolverBlock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "clearUserWithParams:expectedValues:expectedValueInterval:completionHandler:", v2, 0, 0, v5);

  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __50__HMMTRSyncClusterDoorLock_clearUserAtIndex_flow___block_invoke_2;
  v11[3] = &unk_250F1FBB8;
  v6 = *(void **)(a1 + 40);
  v11[4] = *(_QWORD *)(a1 + 32);
  v7 = v6;
  v8 = *(_QWORD *)(a1 + 48);
  v12 = v7;
  v13 = v8;
  objc_msgSend(v4, "recover:", v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

uint64_t __50__HMMTRSyncClusterDoorLock_clearUserAtIndex_flow___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x242656984]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "UUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(a1 + 48);
    v14 = 138544130;
    v15 = v7;
    v16 = 2112;
    v17 = v8;
    v18 = 2048;
    v19 = v9;
    v20 = 2112;
    v21 = v3;
    _os_log_impl(&dword_23E95B000, v6, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to clear user at index: %ld, with error: %@", (uint8_t *)&v14, 0x2Au);

  }
  objc_autoreleasePoolPop(v4);
  v10 = v3;
  v11 = v10;
  if (v10)
  {
    v12 = v10;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "hmfUnspecifiedError");
    objc_claimAutoreleasedReturnValue();
  }

  return 2;
}

id __39__HMMTRSyncClusterDoorLock_getAllUsers__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  _QWORD v12[5];
  id v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE3F178], "internalOnlyInitializer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x242656984]();
  v4 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "UUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v15 = v6;
    v16 = 2112;
    v17 = v7;
    _os_log_impl(&dword_23E95B000, v5, OS_LOG_TYPE_INFO, "%{public}@[NewFlow: %@] Getting all users", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v3);
  objc_msgSend(*(id *)(a1 + 32), "totalNumberOfUsersSupported_flow:", v2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __39__HMMTRSyncClusterDoorLock_getAllUsers__block_invoke_165;
  v12[3] = &unk_250F1FE30;
  v12[4] = *(_QWORD *)(a1 + 32);
  v13 = v2;
  v9 = v2;
  objc_msgSend(v8, "then:", v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

uint64_t __39__HMMTRSyncClusterDoorLock_getAllUsers__block_invoke_165(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v10;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v5 = objc_msgSend(v3, "integerValue");
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "getAllUsersStartingAtSlot:assumingTotalNumberOfSlots:users:flow:", 1, v5, v6, *(_QWORD *)(a1 + 40));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = v7;

    return 3;
  }
  else
  {
    v10 = _HMFPreconditionFailure();
    return (uint64_t)__80__HMMTRSyncClusterDoorLock_addDeviceCredentialKeyData_ofType_forUserIndex_flow___block_invoke(v10);
  }
}

id __80__HMMTRSyncClusterDoorLock_addDeviceCredentialKeyData_ofType_forUserIndex_flow___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  _QWORD v17[5];
  id v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  uint64_t v29;
  __int16 v30;
  uint64_t v31;
  __int16 v32;
  uint64_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x242656984]();
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
    v8 = *(_QWORD *)(a1 + 56);
    v9 = *(_QWORD *)(a1 + 64);
    v10 = *(_QWORD *)(a1 + 72);
    *(_DWORD *)buf = 138544642;
    v23 = v5;
    v24 = 2112;
    v25 = v6;
    v26 = 2112;
    v27 = v7;
    v28 = 2048;
    v29 = v8;
    v30 = 2048;
    v31 = v9;
    v32 = 2048;
    v33 = v10;
    _os_log_impl(&dword_23E95B000, v4, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] addDeviceCredentialKeyData: %@, credentialType: %ld, tapToUnlockType: %ld, forUserIndex: %ld", buf, 0x3Eu);

  }
  objc_autoreleasePoolPop(v2);
  objc_msgSend(*(id *)(a1 + 32), "firstAvailableCredentialSlotForCredentialType:flow:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __80__HMMTRSyncClusterDoorLock_addDeviceCredentialKeyData_ofType_forUserIndex_flow___block_invoke_164;
  v17[3] = &unk_250F1FF70;
  v17[4] = *(_QWORD *)(a1 + 32);
  v12 = *(id *)(a1 + 48);
  v13 = *(_QWORD *)(a1 + 56);
  v18 = v12;
  v14 = *(_QWORD *)(a1 + 72);
  v20 = v13;
  v21 = v14;
  v19 = *(id *)(a1 + 40);
  objc_msgSend(v11, "then:", v17);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

uint64_t __80__HMMTRSyncClusterDoorLock_addDeviceCredentialKeyData_ofType_forUserIndex_flow___block_invoke_164(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v10;

  v3 = a2;
  v4 = (void *)a1[4];
  v5 = a1[5];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a1[7]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addCredentialData:forCredentialType:atIndex:forUserAtUserIndex:flow:", v5, v6, objc_msgSend(v3, "integerValue"), a1[8], a1[6]);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = v7;

    return 3;
  }
  else
  {
    v10 = _HMFPreconditionFailure();
    return (uint64_t)__79__HMMTRSyncClusterDoorLock_addIssuerKeyData_forUserIndex_isUnifiedAccess_flow___block_invoke(v10);
  }
}

id __79__HMMTRSyncClusterDoorLock_addIssuerKeyData_forUserIndex_isUnifiedAccess_flow___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  uint64_t v30;
  __int16 v31;
  uint64_t v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x242656984]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "UUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(unsigned __int8 *)(a1 + 72);
    v8 = *(_QWORD *)(a1 + 48);
    v9 = *(_QWORD *)(a1 + 56);
    v10 = *(_QWORD *)(a1 + 64);
    *(_DWORD *)buf = 138544642;
    v22 = v5;
    v23 = 2112;
    v24 = v6;
    v25 = 2112;
    v26 = v8;
    v27 = 2048;
    v28 = v7;
    v29 = 2112;
    v30 = v9;
    v31 = 2048;
    v32 = v10;
    _os_log_impl(&dword_23E95B000, v4, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] addIssuerKeyData: %@, isUnifiedAccess: %ld, credentialType: %@, forUserIndex: %ld", buf, 0x3Eu);

  }
  objc_autoreleasePoolPop(v2);
  objc_msgSend(*(id *)(a1 + 32), "firstAvailableCredentialSlotForCredentialType:flow:", objc_msgSend(*(id *)(a1 + 56), "integerValue"), *(_QWORD *)(a1 + 40));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __79__HMMTRSyncClusterDoorLock_addIssuerKeyData_forUserIndex_isUnifiedAccess_flow___block_invoke_163;
  v16[3] = &unk_250F1FF20;
  v16[4] = *(_QWORD *)(a1 + 32);
  v17 = *(id *)(a1 + 48);
  v12 = *(id *)(a1 + 56);
  v13 = *(_QWORD *)(a1 + 64);
  v18 = v12;
  v20 = v13;
  v19 = *(id *)(a1 + 40);
  objc_msgSend(v11, "then:", v16);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

uint64_t __79__HMMTRSyncClusterDoorLock_addIssuerKeyData_forUserIndex_isUnifiedAccess_flow___block_invoke_163(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  id *v7;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "addCredentialData:forCredentialType:atIndex:forUserAtUserIndex:flow:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), objc_msgSend(v3, "integerValue"), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 56));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = v4;

    return 3;
  }
  else
  {
    v7 = (id *)_HMFPreconditionFailure();
    return (uint64_t)__58__HMMTRSyncClusterDoorLock_addOrUpdateReaderKeyData_flow___block_invoke(v7);
  }
}

id __58__HMMTRSyncClusterDoorLock_addOrUpdateReaderKeyData_flow___block_invoke(id *a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  _QWORD v12[5];
  id v13;
  id v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x242656984]();
  v3 = a1[4];
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[5], "UUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = a1[6];
    *(_DWORD *)buf = 138543874;
    v16 = v5;
    v17 = 2112;
    v18 = v6;
    v19 = 2112;
    v20 = v7;
    _os_log_impl(&dword_23E95B000, v4, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] addOrUpdateReaderKeyData: %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v2);
  objc_msgSend(a1[4], "findOrAddUserWithUniqueID:userType:flow:", &unk_250F3F090, &unk_250F3F0D8, a1[5]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __58__HMMTRSyncClusterDoorLock_addOrUpdateReaderKeyData_flow___block_invoke_161;
  v12[3] = &unk_250F1FEF8;
  v9 = a1[5];
  v12[4] = a1[4];
  v13 = v9;
  v14 = a1[6];
  objc_msgSend(v8, "then:", v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

uint64_t __58__HMMTRSyncClusterDoorLock_addOrUpdateReaderKeyData_flow___block_invoke_161(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v14;
  void *v15;

  v3 = a2;
  v4 = objc_msgSend(v3, "newUserSlot");
  if (!v4)
  {
    objc_msgSend(v3, "existingUser");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "userIndex");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v6, "integerValue");

  }
  objc_msgSend(v3, "existingUser");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7
    && (v8 = *(void **)(a1 + 32),
        objc_msgSend(v3, "existingUser"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v8, "rfidCredentialForUser:flow:", v9, *(_QWORD *)(a1 + 40)),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v9,
        v10))
  {
    objc_msgSend(*(id *)(a1 + 32), "updateCredentialData:forCredentialType:atIndex:forUserAtUserIndex:flow:", *(_QWORD *)(a1 + 48), &unk_250F3F048, objc_msgSend(v10, "integerValue"), v4, *(_QWORD *)(a1 + 40));
    v11 = (id)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v12 = v11;

LABEL_8:
      return 3;
    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "addReaderKeyData:toUserIndex:flow:", *(_QWORD *)(a1 + 48), v4, *(_QWORD *)(a1 + 40));
    v12 = (id)objc_claimAutoreleasedReturnValue();
    v10 = v12;
    if (v12)
      goto LABEL_8;
  }
  v14 = _HMFPreconditionFailure();
  return __53__HMMTRSyncClusterDoorLock_readReaderConfigWithFlow___block_invoke(v14, v15);
}

uint64_t __53__HMMTRSyncClusterDoorLock_readReaderConfigWithFlow___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  int v19;
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)objc_opt_class();
  objc_msgSend(v4, "validateFutureResults:ofClass:flow:", v3, objc_opt_class(), *(_QWORD *)(a1 + 40));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)MEMORY[0x242656984]();
    v7 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "UUID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138543874;
      v20 = v9;
      v21 = 2112;
      v22 = v10;
      v23 = 2112;
      v24 = v5;
      _os_log_impl(&dword_23E95B000, v8, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Error while reading aliro reader config: %@", (uint8_t *)&v19, 0x20u);

    }
    objc_autoreleasePoolPop(v6);
    v5;
    v11 = 2;
  }
  else
  {
    v12 = (void *)objc_opt_new();
    objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setReaderPublicKeyExternalRepresentation:", v13);

    objc_msgSend(v3, "objectAtIndexedSubscript:", 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setReaderGroupIdentifier:", v14);

    objc_msgSend(v3, "objectAtIndexedSubscript:", 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setGroupResolvingKey:", v15);

    objc_msgSend(MEMORY[0x24BE3F180], "futureWithValue:", v12);
    v16 = (id)objc_claimAutoreleasedReturnValue();
    if (!v16)
      _HMFPreconditionFailure();
    v17 = v16;

    v11 = 3;
  }

  return v11;
}

id __55__HMMTRSyncClusterDoorLock_setOrReadReaderConfig_flow___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  id v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  _QWORD v35[5];
  id v36;
  _BYTE buf[12];
  __int16 v38;
  void *v39;
  __int16 v40;
  uint64_t v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  objc_msgSend((id)objc_opt_class(), "readerConfigParamsFromReaderConfig:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x242656984]();
  v4 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "UUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "signingKey");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    *(_QWORD *)&buf[4] = v6;
    v38 = 2112;
    v39 = v7;
    v40 = 2048;
    v41 = objc_msgSend(v8, "length");
    _os_log_impl(&dword_23E95B000, v5, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] signingKeySize: %lu", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v3);
  v9 = (void *)MEMORY[0x242656984]();
  v10 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "UUID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "verificationKey");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "length");
    *(_DWORD *)buf = 138543874;
    *(_QWORD *)&buf[4] = v12;
    v38 = 2112;
    v39 = v13;
    v40 = 2048;
    v41 = v15;
    _os_log_impl(&dword_23E95B000, v11, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] verificationKey: %lu", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v9);
  v16 = (void *)MEMORY[0x242656984]();
  v17 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "UUID");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "groupIdentifier");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "length");
    *(_DWORD *)buf = 138543874;
    *(_QWORD *)&buf[4] = v19;
    v38 = 2112;
    v39 = v20;
    v40 = 2048;
    v41 = v22;
    _os_log_impl(&dword_23E95B000, v18, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] groupIdentifier: %lu", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v16);
  v23 = (void *)MEMORY[0x242656984]();
  v24 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "UUID");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "groupResolvingKey");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "length");
    *(_DWORD *)buf = 138543874;
    *(_QWORD *)&buf[4] = v26;
    v38 = 2112;
    v39 = v27;
    v40 = 2048;
    v41 = v29;
    _os_log_impl(&dword_23E95B000, v25, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] groupResolvingKey: %lu", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v23);
  *(_QWORD *)buf = 0;
  objc_msgSend(MEMORY[0x24BE3F180], "futureWithPromise:", buf);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)buf, "errorOnlyResolverBlock");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "baseDoorLock");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setAliroReaderConfigWithParams:completion:", v2, v31);

  v35[0] = MEMORY[0x24BDAC760];
  v35[1] = 3221225472;
  v35[2] = __55__HMMTRSyncClusterDoorLock_setOrReadReaderConfig_flow___block_invoke_157;
  v35[3] = &unk_250F21880;
  v35[4] = *(_QWORD *)(a1 + 32);
  v36 = *(id *)(a1 + 48);
  objc_msgSend(v30, "recover:", v35);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  return v33;
}

uint64_t __55__HMMTRSyncClusterDoorLock_setOrReadReaderConfig_flow___block_invoke_157(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  int v19;
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(v3, "domain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4 != (void *)*MEMORY[0x24BDDB4C8])
  {

LABEL_6:
    v10 = (void *)MEMORY[0x242656984]();
    v11 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "UUID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138543874;
      v20 = v13;
      v21 = 2112;
      v22 = v14;
      v23 = 2112;
      v24 = v3;
      _os_log_impl(&dword_23E95B000, v12, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to set or read reader config with error: %@", (uint8_t *)&v19, 0x20u);

    }
    objc_autoreleasePoolPop(v10);
    v15 = v3;
    v16 = v15;
    if (v15)
    {
      v17 = v15;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1540], "hmfUnspecifiedError");
      objc_claimAutoreleasedReturnValue();
    }

    v9 = 2;
    goto LABEL_12;
  }
  v6 = objc_msgSend(v3, "code");

  if (v6 != 203)
    goto LABEL_6;
  objc_msgSend(*(id *)(a1 + 32), "readReaderConfigWithFlow:", *(_QWORD *)(a1 + 40));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (!v7)
    _HMFPreconditionFailure();
  v8 = v7;

  v9 = 3;
LABEL_12:

  return v9;
}

id __54__HMMTRSyncClusterDoorLock_removePinCodeForUserIndex___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v13[5];
  id v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE3F178], "internalOnlyInitializer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x242656984]();
  v4 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "UUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138543874;
    v16 = v6;
    v17 = 2112;
    v18 = v7;
    v19 = 2048;
    v20 = v8;
    _os_log_impl(&dword_23E95B000, v5, OS_LOG_TYPE_INFO, "%{public}@[NewFlow: %@] removePinCodeForUserIndex: %ld", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v3);
  objc_msgSend(*(id *)(a1 + 32), "_getUserAtIndex:flow:", *(_QWORD *)(a1 + 40), v2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __54__HMMTRSyncClusterDoorLock_removePinCodeForUserIndex___block_invoke_156;
  v13[3] = &unk_250F1FE80;
  v13[4] = *(_QWORD *)(a1 + 32);
  v14 = v2;
  v10 = v2;
  objc_msgSend(v9, "then:", v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

id __54__HMMTRSyncClusterDoorLock_removePinCodeForUserIndex___block_invoke_156(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v10;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "pinCredentialForUser:flow:", v3, *(_QWORD *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v4)
  {
    v8 = 1;
    goto LABEL_5;
  }
  objc_msgSend(*(id *)(a1 + 32), "clearCredentialAtIndex:withCredentialType:flow:", objc_msgSend(v4, "integerValue"), &unk_250F3F030, *(_QWORD *)(a1 + 40));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = v6;
    v8 = 3;

LABEL_5:
    return (id)v8;
  }
  v10 = _HMFPreconditionFailure();
  return __69__HMMTRSyncClusterDoorLock_addOrUpdatePinCodeWithValue_forUserIndex___block_invoke(v10);
}

id __69__HMMTRSyncClusterDoorLock_addOrUpdatePinCodeWithValue_forUserIndex___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  id v14;
  void *v15;
  _QWORD v17[5];
  id v18;
  id v19;
  uint64_t v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE3F178], "internalOnlyInitializer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x242656984]();
  v4 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "UUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1 + 40);
    v9 = *(_QWORD *)(a1 + 48);
    *(_DWORD *)buf = 138544130;
    v22 = v6;
    v23 = 2112;
    v24 = v7;
    v25 = 2112;
    v26 = v8;
    v27 = 2048;
    v28 = v9;
    _os_log_impl(&dword_23E95B000, v5, OS_LOG_TYPE_INFO, "%{public}@[NewFlow: %@] addOrUpdatePinCodeWithValue: %@, forUserIndex: %ld", buf, 0x2Au);

  }
  objc_autoreleasePoolPop(v3);
  objc_msgSend(*(id *)(a1 + 32), "_getUserAtIndex:flow:", *(_QWORD *)(a1 + 48), v2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __69__HMMTRSyncClusterDoorLock_addOrUpdatePinCodeWithValue_forUserIndex___block_invoke_155;
  v17[3] = &unk_250F1FE58;
  v11 = *(void **)(a1 + 40);
  v17[4] = *(_QWORD *)(a1 + 32);
  v18 = v2;
  v12 = v11;
  v13 = *(_QWORD *)(a1 + 48);
  v19 = v12;
  v20 = v13;
  v14 = v2;
  objc_msgSend(v10, "then:", v17);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

uint64_t __69__HMMTRSyncClusterDoorLock_addOrUpdatePinCodeWithValue_forUserIndex___block_invoke_155(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v9;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "pinCredentialForUser:flow:", v3, *(_QWORD *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
    objc_msgSend(*(id *)(a1 + 32), "updatePinCredentialAtIndex:withValue:forUserAtUserIndex:flow:", objc_msgSend(v4, "integerValue"), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40));
  else
    objc_msgSend(*(id *)(a1 + 32), "addPinCodeWithValue:forUserIndex:flow:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {

    return 3;
  }
  else
  {
    v9 = _HMFPreconditionFailure();
    return (uint64_t)__42__HMMTRSyncClusterDoorLock_getAllPinCodes__block_invoke(v9);
  }
}

id __42__HMMTRSyncClusterDoorLock_getAllPinCodes__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  _QWORD v12[5];
  id v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE3F178], "internalOnlyInitializer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x242656984]();
  v4 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "UUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v15 = v6;
    v16 = 2112;
    v17 = v7;
    _os_log_impl(&dword_23E95B000, v5, OS_LOG_TYPE_INFO, "%{public}@[NewFlow: %@] getAllPinCodes", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v3);
  objc_msgSend(*(id *)(a1 + 32), "fetchCurrentFabricIndex_flow:", v2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __42__HMMTRSyncClusterDoorLock_getAllPinCodes__block_invoke_141;
  v12[3] = &unk_250F1FE30;
  v12[4] = *(_QWORD *)(a1 + 32);
  v13 = v2;
  v9 = v2;
  objc_msgSend(v8, "then:", v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

uint64_t __42__HMMTRSyncClusterDoorLock_getAllPinCodes__block_invoke_141(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v15;
  void *v16;
  _QWORD v17[5];
  id v18;
  _QWORD v19[5];
  id v20;
  id v21;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v5 = objc_msgSend(&unk_250F3F030, "integerValue");
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "getAllCredentialsIndexStartingAtSlot:forCredentialType:credentials:flow:", 1, v5, v6, *(_QWORD *)(a1 + 40));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x24BDAC760];
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __42__HMMTRSyncClusterDoorLock_getAllPinCodes__block_invoke_2;
  v19[3] = &unk_250F1FE08;
  v9 = *(void **)(a1 + 40);
  v19[4] = *(_QWORD *)(a1 + 32);
  v20 = v9;
  v10 = v3;
  v21 = v10;
  v17[0] = v8;
  v17[1] = 3221225472;
  v17[2] = __42__HMMTRSyncClusterDoorLock_getAllPinCodes__block_invoke_3_154;
  v17[3] = &unk_250F21880;
  v11 = *(void **)(a1 + 40);
  v17[4] = *(_QWORD *)(a1 + 32);
  v18 = v11;
  objc_msgSend(v7, "then:orRecover:", v19, v17);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = v12;

    return 3;
  }
  else
  {
    v15 = _HMFPreconditionFailure();
    return __42__HMMTRSyncClusterDoorLock_getAllPinCodes__block_invoke_2(v15, v16);
  }
}

uint64_t __42__HMMTRSyncClusterDoorLock_getAllPinCodes__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v11;
  _QWORD v12[5];
  id v13;
  id v14;

  v3 = a2;
  v12[0] = MEMORY[0x24BDAC760];
  v12[2] = __42__HMMTRSyncClusterDoorLock_getAllPinCodes__block_invoke_3;
  v12[3] = &unk_250F1FD60;
  v4 = *(void **)(a1 + 40);
  v12[4] = *(_QWORD *)(a1 + 32);
  v5 = (void *)MEMORY[0x24BE3F180];
  v12[1] = 3221225472;
  v13 = v4;
  v14 = *(id *)(a1 + 48);
  objc_msgSend(v3, "na_map:", v12);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allSettled:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "then:", &__block_literal_global_149);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = v8;

    return 3;
  }
  else
  {
    v11 = _HMFPreconditionFailure();
    return __42__HMMTRSyncClusterDoorLock_getAllPinCodes__block_invoke_3_154(v11);
  }
}

uint64_t __42__HMMTRSyncClusterDoorLock_getAllPinCodes__block_invoke_3_154(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x242656984]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "UUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138543874;
    v14 = v7;
    v15 = 2112;
    v16 = v8;
    v17 = 2112;
    v18 = v3;
    _os_log_impl(&dword_23E95B000, v6, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to get all pincodes with error: %@", (uint8_t *)&v13, 0x20u);

  }
  objc_autoreleasePoolPop(v4);
  v9 = v3;
  v10 = v9;
  if (v9)
  {
    v11 = v9;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "hmfUnspecifiedError");
    objc_claimAutoreleasedReturnValue();
  }

  return 2;
}

id __42__HMMTRSyncClusterDoorLock_getAllPinCodes__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v13[5];
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  objc_msgSend(v3, "userIndex");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_getUserAtIndex:flow:", objc_msgSend(v5, "integerValue"), *(_QWORD *)(a1 + 40));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x24BDAC760];
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __42__HMMTRSyncClusterDoorLock_getAllPinCodes__block_invoke_4;
  v16[3] = &unk_250F1FD38;
  v8 = *(void **)(a1 + 40);
  v16[4] = *(_QWORD *)(a1 + 32);
  v17 = v8;
  v18 = v3;
  v19 = *(id *)(a1 + 48);
  v13[0] = v7;
  v13[1] = 3221225472;
  v13[2] = __42__HMMTRSyncClusterDoorLock_getAllPinCodes__block_invoke_146;
  v13[3] = &unk_250F233F0;
  v9 = *(void **)(a1 + 40);
  v13[4] = *(_QWORD *)(a1 + 32);
  v14 = v9;
  v15 = v18;
  v10 = v18;
  objc_msgSend(v6, "then:orRecover:", v16, v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

uint64_t __42__HMMTRSyncClusterDoorLock_getAllPinCodes__block_invoke_148(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "na_filter:", &__block_literal_global_152);
  objc_claimAutoreleasedReturnValue();
  return 1;
}

uint64_t __42__HMMTRSyncClusterDoorLock_getAllPinCodes__block_invoke_2_150(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;

  v2 = a2;
  objc_opt_class();
  v3 = objc_opt_isKindOfClass() & (v2 != 0);

  return v3;
}

uint64_t __42__HMMTRSyncClusterDoorLock_getAllPinCodes__block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  int v18;
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(v3, "userStatus");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToNumber:", &unk_250F3F150);

  if (v5)
  {
    v6 = (void *)MEMORY[0x242656984]();
    v7 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "UUID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = *(_QWORD *)(a1 + 48);
      v18 = 138543874;
      v19 = v9;
      v20 = 2112;
      v21 = v10;
      v22 = 2112;
      v23 = v11;
      _os_log_impl(&dword_23E95B000, v8, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Dropping credential that we could not fetch a user for. The user slot was marked Available. Credential: %@", (uint8_t *)&v18, 0x20u);

    }
    objc_autoreleasePoolPop(v6);
    objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:", 2);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
    {
      v14 = v12;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1540], "hmfUnspecifiedError");
      objc_claimAutoreleasedReturnValue();
    }

    v16 = 2;
  }
  else
  {
    v15 = (void *)objc_opt_new();
    objc_msgSend(v15, "setCredential:", *(_QWORD *)(a1 + 48));
    objc_msgSend(v15, "setUser:", v3);
    objc_msgSend(v15, "setCurrentFabricIndex:", *(_QWORD *)(a1 + 56));
    v16 = 1;
  }

  return v16;
}

uint64_t __42__HMMTRSyncClusterDoorLock_getAllPinCodes__block_invoke_146(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x242656984]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "UUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(a1 + 48);
    v14 = 138544130;
    v15 = v7;
    v16 = 2112;
    v17 = v8;
    v18 = 2112;
    v19 = v9;
    v20 = 2112;
    v21 = v3;
    _os_log_impl(&dword_23E95B000, v6, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Dropping credential that we could not fetch a user for. Credential: %@, Error: %@", (uint8_t *)&v14, 0x2Au);

  }
  objc_autoreleasePoolPop(v4);
  v10 = v3;
  v11 = v10;
  if (v10)
  {
    v12 = v10;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "hmfUnspecifiedError");
    objc_claimAutoreleasedReturnValue();
  }

  return 2;
}

id __43__HMMTRSyncClusterDoorLock_fetchFeatureMap__block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  void *v18;
  id v19;
  NSObject *v20;
  void *v21;
  id v22;
  id v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v2 = objc_alloc(MEMORY[0x24BDDB5E0]);
  objc_msgSend(*(id *)(a1 + 32), "device");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(*(id *)(a1 + 32), "endpoint");
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v2, "initWithDevice:endpoint:queue:", v3, v4, v5);

  v24 = 0;
  objc_msgSend(MEMORY[0x24BE3F180], "futureWithPromise:", &v24);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_alloc_init(MEMORY[0x24BDDB7F0]);
  objc_msgSend(v6, "readAttributeFeatureMapWithParams:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x24BDDB518]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v12 = v11;
    else
      v12 = 0;
    v13 = v12;

    v14 = (void *)MEMORY[0x242656984]();
    v15 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v26 = v17;
      v27 = 2112;
      v28 = v13;
      _os_log_impl(&dword_23E95B000, v16, OS_LOG_TYPE_INFO, "%{public}@Read feature map: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v14);
    objc_msgSend(v24, "fulfillWithValue:", v13);
  }
  else
  {
    v18 = (void *)MEMORY[0x242656984]();
    v19 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v26 = v21;
      _os_log_impl(&dword_23E95B000, v20, OS_LOG_TYPE_ERROR, "%{public}@Could not read attribute feature map from door lock", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v18);
    v22 = v24;
    objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:", 2);
    v13 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "rejectWithError:", v13);
  }

  return v7;
}

id __53__HMMTRSyncClusterDoorLock_fetchAccessoryColor_flow___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[5];
  id v8;
  id v9;

  v9 = 0;
  objc_msgSend(MEMORY[0x24BE3F180], "futureWithPromise:", &v9);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "resolverBlock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "readAttributeWithEndpointIDAndCompletion:clusterID:attributeID:completion:", &unk_250F3F090, &unk_250F3F120, &unk_250F3F108, v3);

  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __53__HMMTRSyncClusterDoorLock_fetchAccessoryColor_flow___block_invoke_138;
  v7[3] = &unk_250F1FD10;
  v4 = *(void **)(a1 + 40);
  v7[4] = *(_QWORD *)(a1 + 32);
  v8 = v4;
  objc_msgSend(v2, "then:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t __53__HMMTRSyncClusterDoorLock_fetchAccessoryColor_flow___block_invoke_138(uint64_t a1, void *a2)
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
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;
  NSObject *v20;
  void *v21;
  void *v22;
  int v24;
  void *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  id v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x242656984]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "UUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 138543874;
    v25 = v7;
    v26 = 2112;
    v27 = v8;
    v28 = 2112;
    v29 = v3;
    _os_log_impl(&dword_23E95B000, v6, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Read value for fetchAccessoryColor: %@", (uint8_t *)&v24, 0x20u);

  }
  objc_autoreleasePoolPop(v4);
  objc_msgSend((id)objc_opt_class(), "productFinishFromAttributeResponse:", v3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "colorFromAttributeResponse:", v3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)MEMORY[0x242656984]();
  v12 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "UUID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 138544130;
    v25 = v14;
    v26 = 2112;
    v27 = v15;
    v28 = 2112;
    v29 = v9;
    v30 = 2112;
    v31 = v10;
    _os_log_impl(&dword_23E95B000, v13, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Parsed productFinish: %@, color: %@", (uint8_t *)&v24, 0x2Au);

  }
  objc_autoreleasePoolPop(v11);
  v16 = &unk_250F3F138;
  if (v9 && v10)
  {
    if (objc_msgSend(v9, "integerValue") == 2 && objc_msgSend(v10, "integerValue") == 16)
    {
      v17 = 14935011;
    }
    else if (objc_msgSend(v9, "integerValue") == 2 && objc_msgSend(v10, "integerValue") == 15)
    {
      v17 = 14341582;
    }
    else if (objc_msgSend(v9, "integerValue") == 1 && !objc_msgSend(v10, "integerValue"))
    {
      v17 = 0;
    }
    else
    {
      if (objc_msgSend(v9, "integerValue") != 3 || objc_msgSend(v10, "integerValue") != 17)
        goto LABEL_20;
      v17 = 15521450;
    }
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v17);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_20:
    v18 = (void *)MEMORY[0x242656984]();
    v19 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "UUID");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 138543874;
      v25 = v21;
      v26 = 2112;
      v27 = v22;
      v28 = 2112;
      v29 = v16;
      _os_log_impl(&dword_23E95B000, v20, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Returning color: %@", (uint8_t *)&v24, 0x20u);

    }
    objc_autoreleasePoolPop(v18);
  }

  return 1;
}

uint64_t __78__HMMTRSyncClusterDoorLock_fetchFeatureMapForSupportingWeekAndYearDaySchedule__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  unsigned int v4;
  __int16 v5;
  id v6;

  v2 = (void *)MEMORY[0x24BDD16E0];
  v3 = a2;
  v4 = objc_msgSend(v3, "unsignedIntValue") & 0x10;
  v5 = objc_msgSend(v3, "unsignedIntValue");

  objc_msgSend(v2, "numberWithUnsignedInt:", v5 & 0x400 | v4);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  return 1;
}

id __57__HMMTRSyncClusterDoorLock_fetchReaderGroupSubIdentifier__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[5];
  id v8;

  v8 = 0;
  objc_msgSend(MEMORY[0x24BE3F180], "futureWithPromise:", &v8);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "resolverBlock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "baseDoorLock");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "readAttributeAliroReaderGroupSubIdentifierWithCompletion:", v3);

  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __57__HMMTRSyncClusterDoorLock_fetchReaderGroupSubIdentifier__block_invoke_2;
  v7[3] = &unk_250F1FCA8;
  v7[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v2, "then:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t __57__HMMTRSyncClusterDoorLock_fetchReaderGroupSubIdentifier__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  int v9;
  void *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x242656984]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543618;
    v10 = v7;
    v11 = 2112;
    v12 = v3;
    _os_log_impl(&dword_23E95B000, v6, OS_LOG_TYPE_INFO, "%{public}@Read value for reader group sub identifier: %@", (uint8_t *)&v9, 0x16u);

  }
  objc_autoreleasePoolPop(v4);
  return 1;
}

uint64_t __61__HMMTRSyncClusterDoorLock_fetchAccessorySupportsAliroBLEUWB__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;

  v2 = a2;
  objc_msgSend((id)objc_opt_class(), "doorLockFeatureMapSupportsAliroBLEUWB:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = v3;
  return 1;
}

uint64_t __67__HMMTRSyncClusterDoorLock_fetchAccessorySupportsAliroProvisioning__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;

  v2 = a2;
  objc_msgSend((id)objc_opt_class(), "doorLockFeatureMapSupportsAliroProvisioning:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = v3;
  return 1;
}

id __61__HMMTRSyncClusterDoorLock_fetchAccessorySupportsTapToUnlock__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[5];
  id v7;

  v7 = 0;
  objc_msgSend(MEMORY[0x24BE3F180], "futureWithPromise:", &v7);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "resolverBlock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "readAttributeWithEndpointIDAndCompletion:clusterID:attributeID:completion:", &unk_250F3F090, &unk_250F3F0F0, &unk_250F3F090, v3);

  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __61__HMMTRSyncClusterDoorLock_fetchAccessorySupportsTapToUnlock__block_invoke_2;
  v6[3] = &unk_250F1FC80;
  v6[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v2, "then:", v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t __61__HMMTRSyncClusterDoorLock_fetchAccessorySupportsTapToUnlock__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  int v13;
  void *v14;
  __int16 v15;
  id v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend((id)objc_opt_class(), "numberFromAttributeDictionary:", v3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  v6 = (void *)MEMORY[0x24BDBD1C0];
  if (v4)
    v6 = (void *)v4;
  v7 = v6;

  v8 = (void *)MEMORY[0x242656984]();
  v9 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138543874;
    v14 = v11;
    v15 = 2112;
    v16 = v7;
    v17 = 2112;
    v18 = v3;
    _os_log_impl(&dword_23E95B000, v10, OS_LOG_TYPE_INFO, "%{public}@Read value for supportsTapToUnlock with value %@ from response: %@", (uint8_t *)&v13, 0x20u);

  }
  objc_autoreleasePoolPop(v8);

  return 1;
}

uint64_t __58__HMMTRSyncClusterDoorLock_fetchAccessorySupportsPinCodes__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;

  v2 = a2;
  objc_msgSend((id)objc_opt_class(), "doorLockFeatureMapSupportsPinCodes:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = v3;
  return 1;
}

uint64_t __57__HMMTRSyncClusterDoorLock__removeUserWithUniqueID_flow___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  int v18;
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(v3, "user");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = *(void **)(a1 + 32);
    objc_msgSend(v3, "user");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "userIndex");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "clearUserAtIndex:flow:", objc_msgSend(v7, "integerValue"), *(_QWORD *)(a1 + 40));
    v8 = (id)objc_claimAutoreleasedReturnValue();
    if (!v8)
      _HMFPreconditionFailure();
    v9 = v8;
    v10 = 3;

  }
  else
  {
    v11 = (void *)MEMORY[0x242656984]();
    v12 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "UUID");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = *(_QWORD *)(a1 + 48);
      v18 = 138543874;
      v19 = v14;
      v20 = 2112;
      v21 = v15;
      v22 = 2112;
      v23 = v16;
      _os_log_impl(&dword_23E95B000, v13, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Did not find user on lock, so nothing to remove. userUniqueID: %@", (uint8_t *)&v18, 0x20u);

    }
    objc_autoreleasePoolPop(v11);
    v10 = 1;
  }

  return v10;
}

uint64_t __57__HMMTRSyncClusterDoorLock__removeUserWithUniqueID_flow___block_invoke_133(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x242656984]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "UUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(a1 + 48);
    v14 = 138544130;
    v15 = v7;
    v16 = 2112;
    v17 = v8;
    v18 = 2112;
    v19 = v9;
    v20 = 2112;
    v21 = v3;
    _os_log_impl(&dword_23E95B000, v6, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to remove user with userUniqueID: %@, error: %@", (uint8_t *)&v14, 0x2Au);

  }
  objc_autoreleasePoolPop(v4);
  v10 = v3;
  v11 = v10;
  if (v10)
  {
    v12 = v10;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "hmfUnspecifiedError");
    objc_claimAutoreleasedReturnValue();
  }

  return 2;
}

id __51__HMMTRSyncClusterDoorLock_removeUserWithUniqueID___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE3F178], "internalOnlyInitializer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x242656984]();
  v4 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "UUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1 + 40);
    v11 = 138543874;
    v12 = v6;
    v13 = 2112;
    v14 = v7;
    v15 = 2112;
    v16 = v8;
    _os_log_impl(&dword_23E95B000, v5, OS_LOG_TYPE_INFO, "%{public}@[NewFlow: %@] Removing user with uniqueID: %@", (uint8_t *)&v11, 0x20u);

  }
  objc_autoreleasePoolPop(v3);
  objc_msgSend(*(id *)(a1 + 32), "_removeUserWithUniqueID:flow:", *(_QWORD *)(a1 + 40), v2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

id __42__HMMTRSyncClusterDoorLock_removeHomeUser__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE3F178], "internalOnlyInitializer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x242656984]();
  v4 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "UUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543618;
    v11 = v6;
    v12 = 2112;
    v13 = v7;
    _os_log_impl(&dword_23E95B000, v5, OS_LOG_TYPE_INFO, "%{public}@[NewFlow: %@] Removing home user", (uint8_t *)&v10, 0x16u);

  }
  objc_autoreleasePoolPop(v3);
  objc_msgSend(*(id *)(a1 + 32), "_removeUserWithUniqueID:flow:", &unk_250F3F090, v2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id __49__HMMTRSyncClusterDoorLock__getUserAtIndex_flow___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  _QWORD v12[5];
  id v13;
  uint64_t v14;
  id v15;

  v2 = objc_alloc_init(MEMORY[0x24BDDB6E8]);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", *(_QWORD *)(a1 + 48));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setUserIndex:", v3);

  v15 = 0;
  objc_msgSend(MEMORY[0x24BE3F180], "futureWithPromise:", &v15);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "resolverBlock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "baseDoorLock");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "getUserWithParams:completion:", v2, v5);

  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __49__HMMTRSyncClusterDoorLock__getUserAtIndex_flow___block_invoke_2;
  v12[3] = &unk_250F1FBB8;
  v7 = *(void **)(a1 + 40);
  v12[4] = *(_QWORD *)(a1 + 32);
  v8 = v7;
  v9 = *(_QWORD *)(a1 + 48);
  v13 = v8;
  v14 = v9;
  objc_msgSend(v4, "recover:", v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

uint64_t __49__HMMTRSyncClusterDoorLock__getUserAtIndex_flow___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x242656984]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "UUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(a1 + 48);
    v14 = 138544130;
    v15 = v7;
    v16 = 2112;
    v17 = v8;
    v18 = 2048;
    v19 = v9;
    v20 = 2112;
    v21 = v3;
    _os_log_impl(&dword_23E95B000, v6, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Failed to get user at index: %ld with error: %@", (uint8_t *)&v14, 0x2Au);

  }
  objc_autoreleasePoolPop(v4);
  v10 = v3;
  v11 = v10;
  if (v10)
  {
    v12 = v10;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "hmfUnspecifiedError");
    objc_claimAutoreleasedReturnValue();
  }

  return 2;
}

uint64_t __48__HMMTRSyncClusterDoorLock_getUserAtIndex_flow___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_getUserAtIndex:flow:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
}

id __55__HMMTRSyncClusterDoorLock_getUsersWithUniqueIDs_flow___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[5];
  id v7;
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "fetchCurrentFabricIndex_flow:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __55__HMMTRSyncClusterDoorLock_getUsersWithUniqueIDs_flow___block_invoke_2;
  v6[3] = &unk_250F1FB68;
  v3 = *(void **)(a1 + 40);
  v6[4] = *(_QWORD *)(a1 + 32);
  v7 = v3;
  v8 = *(id *)(a1 + 48);
  objc_msgSend(v2, "then:", v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t __55__HMMTRSyncClusterDoorLock_getUsersWithUniqueIDs_flow___block_invoke_2(id *a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  uint64_t v9;
  void *v10;
  _QWORD v11[5];
  id v12;
  id v13;
  id v14;

  v3 = a2;
  objc_msgSend(a1[4], "totalNumberOfUsersSupported_flow:", a1[5]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __55__HMMTRSyncClusterDoorLock_getUsersWithUniqueIDs_flow___block_invoke_3;
  v11[3] = &unk_250F1FAF0;
  v11[4] = a1[4];
  v5 = v3;
  v12 = v5;
  v13 = a1[5];
  v14 = a1[6];
  objc_msgSend(v4, "then:", v11);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = v6;

    return 3;
  }
  else
  {
    v9 = _HMFPreconditionFailure();
    return __55__HMMTRSyncClusterDoorLock_getUsersWithUniqueIDs_flow___block_invoke_3(v9, v10);
  }
}

uint64_t __55__HMMTRSyncClusterDoorLock_getUsersWithUniqueIDs_flow___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v12;
  void *v13;
  _QWORD v14[4];
  id v15;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v6 = objc_msgSend(v3, "integerValue");
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "findAllUsersWithCreatorFabricIndex:indexStartingAtSlot:assumingTotalNumberOfSlots:users:flow:", v5, 1, v6, v7, *(_QWORD *)(a1 + 48));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __55__HMMTRSyncClusterDoorLock_getUsersWithUniqueIDs_flow___block_invoke_4;
  v14[3] = &unk_250F1FB40;
  v15 = *(id *)(a1 + 56);
  objc_msgSend(v8, "then:", v14);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = v9;

    return 3;
  }
  else
  {
    v12 = _HMFPreconditionFailure();
    return __55__HMMTRSyncClusterDoorLock_getUsersWithUniqueIDs_flow___block_invoke_4(v12, v13);
  }
}

uint64_t __55__HMMTRSyncClusterDoorLock_getUsersWithUniqueIDs_flow___block_invoke_4(uint64_t a1, void *a2)
{
  _QWORD v4[4];
  id v5;

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __55__HMMTRSyncClusterDoorLock_getUsersWithUniqueIDs_flow___block_invoke_5;
  v4[3] = &unk_250F1FB18;
  v5 = *(id *)(a1 + 32);
  objc_msgSend(a2, "na_map:", v4);
  objc_claimAutoreleasedReturnValue();

  return 1;
}

id __55__HMMTRSyncClusterDoorLock_getUsersWithUniqueIDs_flow___block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  objc_msgSend(v3, "userUniqueID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = objc_msgSend(v4, "containsObject:", v5);

  if ((_DWORD)v4)
    v6 = v3;
  else
    v6 = 0;

  return v6;
}

uint64_t __74__HMMTRSyncClusterDoorLock__findUserOrAvailableSlotWithUserUniqueID_flow___block_invoke(id *a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  uint64_t v9;
  void *v10;
  _QWORD v11[5];
  id v12;
  id v13;
  id v14;
  id v15;

  v3 = a2;
  objc_msgSend(a1[4], "totalNumberOfUsersSupported_flow:", a1[5]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __74__HMMTRSyncClusterDoorLock__findUserOrAvailableSlotWithUserUniqueID_flow___block_invoke_2;
  v11[3] = &unk_250F1FAC8;
  v11[4] = a1[4];
  v12 = a1[6];
  v13 = a1[7];
  v5 = v3;
  v14 = v5;
  v15 = a1[5];
  objc_msgSend(v4, "then:", v11);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = v6;

    return 3;
  }
  else
  {
    v9 = _HMFPreconditionFailure();
    return __74__HMMTRSyncClusterDoorLock__findUserOrAvailableSlotWithUserUniqueID_flow___block_invoke_2(v9, v10);
  }
}

uint64_t __74__HMMTRSyncClusterDoorLock__findUserOrAvailableSlotWithUserUniqueID_flow___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  uint64_t v7;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "findHomeUserWithUniqueID:indexStartingAtSlot:assumingTotalNumberOfSlots:availableSlots:currentFabricIndex:flow:", *(_QWORD *)(a1 + 40), 1, objc_msgSend(v3, "integerValue"), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = v4;

    return 3;
  }
  else
  {
    v7 = _HMFPreconditionFailure();
    return __73__HMMTRSyncClusterDoorLock_findUserOrAvailableSlotWithUserUniqueID_flow___block_invoke(v7);
  }
}

uint64_t __73__HMMTRSyncClusterDoorLock_findUserOrAvailableSlotWithUserUniqueID_flow___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_findUserOrAvailableSlotWithUserUniqueID:flow:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __59__HMMTRSyncClusterDoorLock_findOrAddUserWithUniqueID_flow___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "findOrAddUserWithUniqueID:userType:flow:", *(_QWORD *)(a1 + 40), &unk_250F3F090, *(_QWORD *)(a1 + 48));
}

id __72__HMMTRSyncClusterDoorLock_lockDoorWithAccessoryUUID_completionHandler___block_invoke(id *a1)
{
  void *v2;
  void *v3;
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  _QWORD v14[5];
  id v15;
  id v16;
  id v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  id v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE3F178], "internalOnlyInitializer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x242656984]();
  v4 = a1[4];
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "UUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = a1[5];
    v9 = (void *)MEMORY[0x242656B10](a1[6]);
    *(_DWORD *)buf = 138544130;
    v19 = v6;
    v20 = 2112;
    v21 = v7;
    v22 = 2112;
    v23 = v8;
    v24 = 2112;
    v25 = v9;
    _os_log_impl(&dword_23E95B000, v5, OS_LOG_TYPE_INFO, "%{public}@[NewFlow: %@] Locking door with accessoryUUID: %@ completionHandler: %@", buf, 0x2Au);

  }
  objc_autoreleasePoolPop(v3);
  objc_msgSend(a1[4], "accessoryHasCOTAEnabledWithFlow:", v2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __72__HMMTRSyncClusterDoorLock_lockDoorWithAccessoryUUID_completionHandler___block_invoke_124;
  v14[3] = &unk_250F1FA50;
  v14[4] = a1[4];
  v15 = v2;
  v17 = a1[6];
  v16 = a1[5];
  v11 = v2;
  objc_msgSend(v10, "then:", v14);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

uint64_t __72__HMMTRSyncClusterDoorLock_lockDoorWithAccessoryUUID_completionHandler___block_invoke_124(uint64_t a1, void *a2)
{
  id v3;
  char v4;
  void *v5;
  id v6;
  NSObject *v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  uint64_t v23;
  void *v24;
  id v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  uint64_t v32;
  void *v33;
  void *v34;
  id v35;
  NSObject *v36;
  void *v37;
  void *v38;
  void (**v39)(_QWORD, _QWORD);
  void *v40;
  _QWORD v42[5];
  id v43;
  id v44;
  _QWORD v45[5];
  id v46;
  id v47;
  _QWORD v48[5];
  id v49;
  id v50;
  uint8_t buf[4];
  void *v52;
  __int16 v53;
  void *v54;
  __int16 v55;
  void *v56;
  uint64_t v57;

  v57 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = objc_msgSend(v3, "BOOLValue");
  v5 = (void *)MEMORY[0x242656984]();
  v6 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_INFO);
  if ((v4 & 1) != 0)
  {
    if (v8)
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "UUID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v52 = v9;
      v53 = 2112;
      v54 = v10;
      _os_log_impl(&dword_23E95B000, v7, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Accessory has COTA enabled", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v5);
    objc_msgSend(*(id *)(a1 + 32), "deriveHomePinFromUUID:flow:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)MEMORY[0x242656984]();
    v13 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "UUID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v52 = v15;
      v53 = 2112;
      v54 = v16;
      v55 = 2112;
      v56 = v11;
      _os_log_impl(&dword_23E95B000, v14, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] homePin: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v12);
    if (v11)
    {
      objc_msgSend(*(id *)(a1 + 32), "lockWithPin:flow:", v11, *(_QWORD *)(a1 + 40));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = MEMORY[0x24BDAC760];
      v45[0] = MEMORY[0x24BDAC760];
      v45[1] = 3221225472;
      v45[2] = __72__HMMTRSyncClusterDoorLock_lockDoorWithAccessoryUUID_completionHandler___block_invoke_126;
      v45[3] = &unk_250F233F0;
      v19 = *(void **)(a1 + 40);
      v45[4] = *(_QWORD *)(a1 + 32);
      v46 = v19;
      v20 = v11;
      v47 = v20;
      objc_msgSend(v17, "recover:", v45);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      v42[0] = v18;
      v42[1] = 3221225472;
      v42[2] = __72__HMMTRSyncClusterDoorLock_lockDoorWithAccessoryUUID_completionHandler___block_invoke_2;
      v42[3] = &unk_250F1FA28;
      v22 = *(id *)(a1 + 56);
      v23 = *(_QWORD *)(a1 + 32);
      v24 = *(void **)(a1 + 40);
      v44 = v22;
      v42[4] = v23;
      v43 = v24;
      objc_msgSend(v21, "getResultWithCompletion:", v42);
      v25 = v21;
      if (!v25)
        _HMFPreconditionFailure();
      v26 = v25;
      v27 = 3;

    }
    else
    {
      v34 = (void *)MEMORY[0x242656984]();
      v35 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "UUID");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v52 = v37;
        v53 = 2112;
        v54 = v38;
        _os_log_impl(&dword_23E95B000, v36, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to create home pin, aborting", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v34);
      v39 = (void (**)(_QWORD, _QWORD))MEMORY[0x242656B10](*(_QWORD *)(a1 + 56));
      if (v39)
      {
        objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("HMMTROperationErrorDomain"), 4, 0);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *))v39)[2](v39, v40);

      }
      v20 = 0;
      v27 = 1;
    }
  }
  else
  {
    if (v8)
    {
      HMFGetLogIdentifier();
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "UUID");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v52 = v28;
      v53 = 2112;
      v54 = v29;
      _os_log_impl(&dword_23E95B000, v7, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Accessory does not have COTA enabled", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v5);
    objc_msgSend(*(id *)(a1 + 32), "lock_flow:", *(_QWORD *)(a1 + 40));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v48[0] = MEMORY[0x24BDAC760];
    v48[1] = 3221225472;
    v48[2] = __72__HMMTRSyncClusterDoorLock_lockDoorWithAccessoryUUID_completionHandler___block_invoke_125;
    v48[3] = &unk_250F1F9D8;
    v31 = *(id *)(a1 + 56);
    v32 = *(_QWORD *)(a1 + 32);
    v33 = *(void **)(a1 + 40);
    v50 = v31;
    v48[4] = v32;
    v49 = v33;
    objc_msgSend(v30, "getResultWithCompletion:", v48);

    v27 = 1;
    v20 = v50;
  }

  return v27;
}

void __72__HMMTRSyncClusterDoorLock_lockDoorWithAccessoryUUID_completionHandler___block_invoke_125(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (*(_QWORD *)(a1 + 48))
  {
    v7 = (void *)MEMORY[0x242656984]();
    v8 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "UUID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543874;
      v13 = v10;
      v14 = 2112;
      v15 = v11;
      v16 = 2112;
      v17 = v6;
      _os_log_impl(&dword_23E95B000, v9, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Calling completion with error: %@", (uint8_t *)&v12, 0x20u);

    }
    objc_autoreleasePoolPop(v7);
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

uint64_t __72__HMMTRSyncClusterDoorLock_lockDoorWithAccessoryUUID_completionHandler___block_invoke_126(id *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  _QWORD v19[5];
  id v20;
  id v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  uint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(v3, "domain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4 != (void *)*MEMORY[0x24BDDB4C8])
  {

LABEL_6:
    v11 = (void *)MEMORY[0x242656984]();
    v12 = a1[4];
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[5], "UUID");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "domain");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v23 = v14;
      v24 = 2112;
      v25 = v15;
      v26 = 2112;
      v27 = v16;
      v28 = 2048;
      v29 = objc_msgSend(v3, "code");
      _os_log_impl(&dword_23E95B000, v13, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Not attempting to add home pin because the write failed for a different reason than our COTA pin being rejected. ErrorDomain: %@, ErrorCode: %ld", buf, 0x2Au);

    }
    objc_autoreleasePoolPop(v11);
    v17 = v3;
    if (v17)
    {
      v7 = v17;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1540], "hmfUnspecifiedError");
      objc_claimAutoreleasedReturnValue();
      v7 = 0;
    }
    v10 = 2;
    goto LABEL_12;
  }
  v6 = objc_msgSend(v3, "code");

  if (v6 != 1)
    goto LABEL_6;
  objc_msgSend(a1[4], "provisionHomePin:flow:", a1[6], a1[5]);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __72__HMMTRSyncClusterDoorLock_lockDoorWithAccessoryUUID_completionHandler___block_invoke_127;
  v19[3] = &unk_250F1FA00;
  v19[4] = a1[4];
  v20 = a1[6];
  v21 = a1[5];
  objc_msgSend(v7, "then:", v19);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (!v8)
    _HMFPreconditionFailure();
  v9 = v8;

  v10 = 3;
LABEL_12:

  return v10;
}

void __72__HMMTRSyncClusterDoorLock_lockDoorWithAccessoryUUID_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (*(_QWORD *)(a1 + 48))
  {
    v7 = (void *)MEMORY[0x242656984]();
    v8 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "UUID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543874;
      v13 = v10;
      v14 = 2112;
      v15 = v11;
      v16 = 2112;
      v17 = v6;
      _os_log_impl(&dword_23E95B000, v9, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Calling completion with error: %@", (uint8_t *)&v12, 0x20u);

    }
    objc_autoreleasePoolPop(v7);
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

uint64_t __72__HMMTRSyncClusterDoorLock_lockDoorWithAccessoryUUID_completionHandler___block_invoke_127(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  id *v7;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "lockWithPin:flow:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = v4;

    return 3;
  }
  else
  {
    v7 = (id *)_HMFPreconditionFailure();
    return (uint64_t)__74__HMMTRSyncClusterDoorLock_unlockDoorWithAccessoryUUID_completionHandler___block_invoke(v7);
  }
}

id __74__HMMTRSyncClusterDoorLock_unlockDoorWithAccessoryUUID_completionHandler___block_invoke(id *a1)
{
  void *v2;
  void *v3;
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  _QWORD v14[5];
  id v15;
  id v16;
  id v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  id v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE3F178], "internalOnlyInitializer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x242656984]();
  v4 = a1[4];
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "UUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = a1[5];
    v9 = (void *)MEMORY[0x242656B10](a1[6]);
    *(_DWORD *)buf = 138544130;
    v19 = v6;
    v20 = 2112;
    v21 = v7;
    v22 = 2112;
    v23 = v8;
    v24 = 2112;
    v25 = v9;
    _os_log_impl(&dword_23E95B000, v5, OS_LOG_TYPE_INFO, "%{public}@[NewFlow: %@] Unlocking door with accessoryUUID: %@ completionHandler: %@", buf, 0x2Au);

  }
  objc_autoreleasePoolPop(v3);
  objc_msgSend(a1[4], "accessoryHasCOTAEnabledWithFlow:", v2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __74__HMMTRSyncClusterDoorLock_unlockDoorWithAccessoryUUID_completionHandler___block_invoke_114;
  v14[3] = &unk_250F1FA50;
  v14[4] = a1[4];
  v15 = v2;
  v17 = a1[6];
  v16 = a1[5];
  v11 = v2;
  objc_msgSend(v10, "then:", v14);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

uint64_t __74__HMMTRSyncClusterDoorLock_unlockDoorWithAccessoryUUID_completionHandler___block_invoke_114(uint64_t a1, void *a2)
{
  id v3;
  char v4;
  void *v5;
  id v6;
  NSObject *v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  uint64_t v23;
  void *v24;
  id v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  uint64_t v32;
  void *v33;
  void *v34;
  id v35;
  NSObject *v36;
  void *v37;
  void *v38;
  void (**v39)(_QWORD, _QWORD);
  void *v40;
  _QWORD v42[5];
  id v43;
  id v44;
  _QWORD v45[5];
  id v46;
  id v47;
  _QWORD v48[5];
  id v49;
  id v50;
  uint8_t buf[4];
  void *v52;
  __int16 v53;
  void *v54;
  __int16 v55;
  void *v56;
  uint64_t v57;

  v57 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = objc_msgSend(v3, "BOOLValue");
  v5 = (void *)MEMORY[0x242656984]();
  v6 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_INFO);
  if ((v4 & 1) != 0)
  {
    if (v8)
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "UUID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v52 = v9;
      v53 = 2112;
      v54 = v10;
      _os_log_impl(&dword_23E95B000, v7, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Accessory has COTA enabled", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v5);
    objc_msgSend(*(id *)(a1 + 32), "deriveHomePinFromUUID:flow:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)MEMORY[0x242656984]();
    v13 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "UUID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v52 = v15;
      v53 = 2112;
      v54 = v16;
      v55 = 2112;
      v56 = v11;
      _os_log_impl(&dword_23E95B000, v14, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] homePin: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v12);
    if (v11)
    {
      objc_msgSend(*(id *)(a1 + 32), "unlockWithPin:flow:", v11, *(_QWORD *)(a1 + 40));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = MEMORY[0x24BDAC760];
      v45[0] = MEMORY[0x24BDAC760];
      v45[1] = 3221225472;
      v45[2] = __74__HMMTRSyncClusterDoorLock_unlockDoorWithAccessoryUUID_completionHandler___block_invoke_117;
      v45[3] = &unk_250F233F0;
      v19 = *(void **)(a1 + 40);
      v45[4] = *(_QWORD *)(a1 + 32);
      v46 = v19;
      v20 = v11;
      v47 = v20;
      objc_msgSend(v17, "recover:", v45);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      v42[0] = v18;
      v42[1] = 3221225472;
      v42[2] = __74__HMMTRSyncClusterDoorLock_unlockDoorWithAccessoryUUID_completionHandler___block_invoke_2;
      v42[3] = &unk_250F1FA28;
      v22 = *(id *)(a1 + 56);
      v23 = *(_QWORD *)(a1 + 32);
      v24 = *(void **)(a1 + 40);
      v44 = v22;
      v42[4] = v23;
      v43 = v24;
      objc_msgSend(v21, "getResultWithCompletion:", v42);
      v25 = v21;
      if (!v25)
        _HMFPreconditionFailure();
      v26 = v25;
      v27 = 3;

    }
    else
    {
      v34 = (void *)MEMORY[0x242656984]();
      v35 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "UUID");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v52 = v37;
        v53 = 2112;
        v54 = v38;
        _os_log_impl(&dword_23E95B000, v36, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to create home pin, aborting", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v34);
      v39 = (void (**)(_QWORD, _QWORD))MEMORY[0x242656B10](*(_QWORD *)(a1 + 56));
      if (v39)
      {
        objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("HMMTROperationErrorDomain"), 4, 0);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *))v39)[2](v39, v40);

      }
      v20 = 0;
      v27 = 1;
    }
  }
  else
  {
    if (v8)
    {
      HMFGetLogIdentifier();
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "UUID");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v52 = v28;
      v53 = 2112;
      v54 = v29;
      _os_log_impl(&dword_23E95B000, v7, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Accessory does not have COTA enabled", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v5);
    objc_msgSend(*(id *)(a1 + 32), "unlock_flow:", *(_QWORD *)(a1 + 40));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v48[0] = MEMORY[0x24BDAC760];
    v48[1] = 3221225472;
    v48[2] = __74__HMMTRSyncClusterDoorLock_unlockDoorWithAccessoryUUID_completionHandler___block_invoke_115;
    v48[3] = &unk_250F1F9D8;
    v31 = *(id *)(a1 + 56);
    v32 = *(_QWORD *)(a1 + 32);
    v33 = *(void **)(a1 + 40);
    v50 = v31;
    v48[4] = v32;
    v49 = v33;
    objc_msgSend(v30, "getResultWithCompletion:", v48);

    v27 = 1;
    v20 = v50;
  }

  return v27;
}

void __74__HMMTRSyncClusterDoorLock_unlockDoorWithAccessoryUUID_completionHandler___block_invoke_115(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (*(_QWORD *)(a1 + 48))
  {
    v7 = (void *)MEMORY[0x242656984]();
    v8 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "UUID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543874;
      v13 = v10;
      v14 = 2112;
      v15 = v11;
      v16 = 2112;
      v17 = v6;
      _os_log_impl(&dword_23E95B000, v9, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Calling completion with error: %@", (uint8_t *)&v12, 0x20u);

    }
    objc_autoreleasePoolPop(v7);
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

uint64_t __74__HMMTRSyncClusterDoorLock_unlockDoorWithAccessoryUUID_completionHandler___block_invoke_117(id *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  _QWORD v19[5];
  id v20;
  id v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  uint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(v3, "domain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4 != (void *)*MEMORY[0x24BDDB4C8])
  {

LABEL_6:
    v11 = (void *)MEMORY[0x242656984]();
    v12 = a1[4];
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[5], "UUID");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "domain");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v23 = v14;
      v24 = 2112;
      v25 = v15;
      v26 = 2112;
      v27 = v16;
      v28 = 2048;
      v29 = objc_msgSend(v3, "code");
      _os_log_impl(&dword_23E95B000, v13, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Not attempting to add home pin because the write failed for a different reason than our COTA pin being rejected. ErrorDomain: %@, ErrorCode: %ld", buf, 0x2Au);

    }
    objc_autoreleasePoolPop(v11);
    v17 = v3;
    if (v17)
    {
      v7 = v17;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1540], "hmfUnspecifiedError");
      objc_claimAutoreleasedReturnValue();
      v7 = 0;
    }
    v10 = 2;
    goto LABEL_12;
  }
  v6 = objc_msgSend(v3, "code");

  if (v6 != 1)
    goto LABEL_6;
  objc_msgSend(a1[4], "provisionHomePin:flow:", a1[6], a1[5]);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __74__HMMTRSyncClusterDoorLock_unlockDoorWithAccessoryUUID_completionHandler___block_invoke_118;
  v19[3] = &unk_250F1FA00;
  v19[4] = a1[4];
  v20 = a1[6];
  v21 = a1[5];
  objc_msgSend(v7, "then:", v19);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (!v8)
    _HMFPreconditionFailure();
  v9 = v8;

  v10 = 3;
LABEL_12:

  return v10;
}

void __74__HMMTRSyncClusterDoorLock_unlockDoorWithAccessoryUUID_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (*(_QWORD *)(a1 + 48))
  {
    v7 = (void *)MEMORY[0x242656984]();
    v8 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "UUID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543874;
      v13 = v10;
      v14 = 2112;
      v15 = v11;
      v16 = 2112;
      v17 = v6;
      _os_log_impl(&dword_23E95B000, v9, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Calling completion with error: %@", (uint8_t *)&v12, 0x20u);

    }
    objc_autoreleasePoolPop(v7);
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

void __74__HMMTRSyncClusterDoorLock_unlockDoorWithAccessoryUUID_completionHandler___block_invoke_118(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  uint64_t v6;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "unlockWithPin:flow:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = v4;

  }
  else
  {
    v6 = _HMFPreconditionFailure();
    __58__HMMTRSyncClusterDoorLock_ensureAccessoryConnected_flow___block_invoke(v6);
  }
}

void __58__HMMTRSyncClusterDoorLock_ensureAccessoryConnected_flow___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __58__HMMTRSyncClusterDoorLock_ensureAccessoryConnected_flow___block_invoke_2;
  v3[3] = &unk_250F22768;
  v2 = *(void **)(a1 + 32);
  v4 = *(id *)(a1 + 40);
  v5 = *(id *)(a1 + 48);
  objc_msgSend(v2, "performBlock:", v3);

}

void __58__HMMTRSyncClusterDoorLock_ensureAccessoryConnected_flow___block_invoke_3(uint64_t a1, uint64_t a2)
{
  void *v3;
  _QWORD v4[5];
  id v5;
  id v6;

  if (a2)
  {
    v4[0] = MEMORY[0x24BDAC760];
    v4[1] = 3221225472;
    v4[2] = __58__HMMTRSyncClusterDoorLock_ensureAccessoryConnected_flow___block_invoke_4;
    v4[3] = &unk_250F224F8;
    v3 = *(void **)(a1 + 32);
    v4[4] = *(_QWORD *)(a1 + 40);
    v5 = *(id *)(a1 + 48);
    v6 = *(id *)(a1 + 56);
    objc_msgSend(v3, "performBlock:", v4);

  }
}

void __58__HMMTRSyncClusterDoorLock_ensureAccessoryConnected_flow___block_invoke_4(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x242656984]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "UUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543618;
    v10 = v5;
    v11 = 2112;
    v12 = v6;
    _os_log_impl(&dword_23E95B000, v4, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to connect to Matter accessory", (uint8_t *)&v9, 0x16u);

  }
  objc_autoreleasePoolPop(v2);
  v7 = *(void **)(a1 + 48);
  objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:reason:", 11, CFSTR("Failed to connect to Matter accessory"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "rejectWithError:", v8);

}

void __58__HMMTRSyncClusterDoorLock_ensureAccessoryConnected_flow___block_invoke_2(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "resolveWithFuture:", v2);

}

uint64_t __38__HMMTRSyncClusterDoorLock_serialize___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v6;
  SEL v7;
  id v8;

  v2 = *(void **)(a1 + 32);
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveWithFuture:", v3);

  v4 = *(id *)(a1 + 40);
  if (v4)
  {

    return 3;
  }
  else
  {
    v6 = (void *)_HMFPreconditionFailure();
    return (uint64_t)+[HMMTRSyncClusterDoorLock doorLockFeatureMapSupportsPinCodes:](v6, v7, v8);
  }
}

+ (id)doorLockFeatureMapSupportsPinCodes:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", objc_msgSend(a3, "unsignedIntValue") & 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "numberWithBool:", objc_msgSend(v4, "BOOLValue"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)doorLockFeatureMapSupportsWeekDaySchedule:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", objc_msgSend(a3, "unsignedIntValue") & 0x10);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "numberWithBool:", objc_msgSend(v4, "BOOLValue"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)doorLockFeatureMapSupportsYearDaySchedule:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", objc_msgSend(a3, "unsignedIntValue") & 0x400);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "numberWithBool:", objc_msgSend(v4, "BOOLValue"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)doorLockFeatureMapSupportsAliroProvisioning:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", objc_msgSend(a3, "unsignedIntValue") & 0x2000);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "numberWithBool:", objc_msgSend(v4, "BOOLValue"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)doorLockFeatureMapSupportsAliroBLEUWB:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", objc_msgSend(a3, "unsignedIntValue") & 0x4000);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "numberWithBool:", objc_msgSend(v4, "BOOLValue"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)numberFromAttributeResponse:(id)a3
{
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(a1, "valueFromAttributeResponse:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  return v5;
}

+ (id)numberFromAttributeDictionary:(id)a3
{
  if (!a3)
    return 0;
  objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x24BDDB518]);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)valueFromAttributeResponse:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;

  if (a3)
  {
    objc_msgSend(a3, "firstObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
    v6 = v5;

    if (v6)
    {
      objc_msgSend(a1, "valueFromDictionaryWithData:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

+ (id)valueFromDictionaryWithData:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x24BDDB478]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  if (v5)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x24BDDB518]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)deriveHomePinFromUUID:(id)a3 withNumberOfDigits:(int64_t)a4 flow:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  NSObject *v26;
  void *v27;
  void *v28;
  id v30;
  void *v31;
  void *v32;
  unsigned int v33;
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  int64_t v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  v10 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v8, "UUIDString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithFormat:", CFSTR("%@ %@"), v11, CFSTR("Home Pin"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "hmmtr_sha256hash");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v32, "length") >= (unint64_t)a4)
  {
    v30 = v8;
    v31 = v12;
    objc_msgSend(MEMORY[0x24BDD16A8], "string");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (a4 < 1)
    {
LABEL_9:
      v18 = v19;
      v8 = v30;
    }
    else
    {
      v20 = 0;
      while (1)
      {
        objc_msgSend(v32, "substringWithRange:", v20, 1);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17A8], "scannerWithString:", v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = 0;
        if ((objc_msgSend(v22, "scanHexInt:", &v33) & 1) == 0)
          break;
        v33 %= 0xAu;
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%u"), v33);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "appendString:", v23);

        if (a4 == ++v20)
          goto LABEL_9;
      }
      v24 = (void *)MEMORY[0x242656984]();
      v25 = a1;
      HMFGetOSLogHandle();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "UUID");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v35 = v27;
        v36 = 2112;
        v37 = v28;
        v38 = 2112;
        v39 = v21;
        _os_log_impl(&dword_23E95B000, v26, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to scan hex to int from hash: %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v24);

      v18 = 0;
      v8 = v30;
    }

    v12 = v31;
  }
  else
  {
    v13 = (void *)MEMORY[0x242656984]();
    v14 = a1;
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "UUID");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v35 = v16;
      v36 = 2112;
      v37 = v17;
      v38 = 2112;
      v39 = v32;
      v40 = 2048;
      v41 = a4;
      _os_log_impl(&dword_23E95B000, v15, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Number of digits exceeds total size of hash. Hash: %@, numberOfDigits: %ld", buf, 0x2Au);

    }
    objc_autoreleasePoolPop(v13);
    v18 = 0;
  }

  return v18;
}

+ (id)validateFutureResults:(id)a3 ofClass:(Class)a4 flow:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  void *v18;
  _QWORD v20[5];
  _QWORD v21[4];
  id v22;
  id v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  id v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  objc_msgSend(v8, "na_map:", &__block_literal_global_185);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v10, "hmf_isEmpty") & 1) != 0)
  {
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = __63__HMMTRSyncClusterDoorLock_validateFutureResults_ofClass_flow___block_invoke_186;
    v20[3] = &__block_descriptor_40_e16___NSData_16__0_8lu32l8;
    v20[4] = a4;
    objc_msgSend(v8, "na_map:", v20);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "count");
    if (v12 == objc_msgSend(v8, "count"))
    {
      v13 = 0;
    }
    else
    {
      v14 = (void *)MEMORY[0x242656984]();
      v15 = a1;
      HMFGetOSLogHandle();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "UUID");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v25 = v17;
        v26 = 2112;
        v27 = v18;
        v28 = 2112;
        v29 = v8;
        v30 = 2112;
        v31 = v11;
        _os_log_impl(&dword_23E95B000, v16, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to cast future results to correct type. results: %@, finalResults: %@", buf, 0x2Au);

      }
      objc_autoreleasePoolPop(v14);
      objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:", 15);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    v21[0] = MEMORY[0x24BDAC760];
    v21[1] = 3221225472;
    v21[2] = __63__HMMTRSyncClusterDoorLock_validateFutureResults_ofClass_flow___block_invoke_2;
    v21[3] = &unk_250F20130;
    v23 = a1;
    v22 = v9;
    objc_msgSend(v10, "na_each:", v21);
    objc_msgSend(v10, "firstObject");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v13;
}

+ (id)readerConfigParamsFromReaderConfig:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v3, "readerPrivateKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSigningKey:", v5);

  objc_msgSend(v3, "readerPublicKeyExternalRepresentation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setVerificationKey:", v6);

  objc_msgSend(v3, "readerGroupIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setGroupIdentifier:", v7);

  objc_msgSend(v3, "groupResolvingKey");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setGroupResolvingKey:", v8);
  return v4;
}

+ (id)pinDataWithDigits:(id)a3
{
  return (id)objc_msgSend(a3, "dataUsingEncoding:", 1);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t210 != -1)
    dispatch_once(&logCategory__hmf_once_t210, &__block_literal_global_243);
  return (id)logCategory__hmf_once_v211;
}

void __39__HMMTRSyncClusterDoorLock_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v211;
  logCategory__hmf_once_v211 = v0;

}

void __63__HMMTRSyncClusterDoorLock_validateFutureResults_ofClass_flow___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x242656984]();
  v5 = *(id *)(a1 + 40);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "UUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543874;
    v10 = v7;
    v11 = 2112;
    v12 = v8;
    v13 = 2112;
    v14 = v3;
    _os_log_impl(&dword_23E95B000, v6, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Error in future results: %@", (uint8_t *)&v9, 0x20u);

  }
  objc_autoreleasePoolPop(v4);

}

id __63__HMMTRSyncClusterDoorLock_validateFutureResults_ofClass_flow___block_invoke_186(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;

  v2 = a2;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

id __63__HMMTRSyncClusterDoorLock_validateFutureResults_ofClass_flow___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;

  v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

@end
