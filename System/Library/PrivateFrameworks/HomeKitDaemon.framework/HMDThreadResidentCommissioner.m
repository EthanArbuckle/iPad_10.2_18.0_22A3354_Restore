@implementation HMDThreadResidentCommissioner

- (HMDThreadResidentCommissioner)initWithThreadRadioClient:(id)a3
{
  id v5;
  HMDThreadResidentCommissioner *v6;
  const char *v7;
  NSObject *v8;
  NSObject *v9;
  dispatch_queue_t v10;
  OS_dispatch_queue *workQueue;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HMDThreadResidentCommissioner;
  v6 = -[HMDThreadResidentCommissioner init](&v13, sel_init);
  if (v6)
  {
    v7 = (const char *)HMFDispatchQueueName();
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8 = objc_claimAutoreleasedReturnValue();
    dispatch_get_global_queue(17, 0);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = dispatch_queue_create_with_target_V2(v7, v8, v9);
    workQueue = v6->_workQueue;
    v6->_workQueue = (OS_dispatch_queue *)v10;

    objc_storeStrong((id *)&v6->_threadRadioClient, a3);
  }

  return v6;
}

- (id)initInternal
{
  void *v3;
  HMDThreadResidentCommissioner *v4;

  v3 = (void *)objc_opt_new();
  v4 = -[HMDThreadResidentCommissioner initWithThreadRadioClient:](self, "initWithThreadRadioClient:", v3);

  return v4;
}

- (void)startThreadNetworkWithID:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMDThreadResidentCommissioner *v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  id v13;
  id v14;
  _QWORD block[5];
  id v16;
  id v17;
  uint8_t buf[4];
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x227676638]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v19 = v11;
    _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@Scheduling startThreadNetworkWithID", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v8);
  -[HMDThreadResidentCommissioner workQueue](v9, "workQueue");
  v12 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __69__HMDThreadResidentCommissioner_startThreadNetworkWithID_completion___block_invoke;
  block[3] = &unk_24E79B440;
  block[4] = v9;
  v16 = v6;
  v17 = v7;
  v13 = v7;
  v14 = v6;
  dispatch_async(v12, block);

}

- (void)setGeoAvailable:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  HMDThreadResidentCommissioner *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  _BOOL4 v13;
  uint64_t v14;

  v3 = a3;
  v14 = *MEMORY[0x24BDAC8D0];
  v5 = (void *)MEMORY[0x227676638](self, a2);
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543618;
    v11 = v8;
    v12 = 1024;
    v13 = v3;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@Setting isGeoAvailable: %d", (uint8_t *)&v10, 0x12u);

  }
  objc_autoreleasePoolPop(v5);
  -[HMDThreadResidentCommissioner threadRadioClient](v6, "threadRadioClient");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setIsGeoAvailable:", v3);

}

- (void)_startThreadNetworkWithID:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  HMDThreadResidentCommissioner *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  uint8_t buf[4];
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[HMDThreadResidentCommissioner workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  v9 = (void *)MEMORY[0x227676638]();
  v10 = self;
  HMFGetOSLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v20 = v12;
    _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@Starting thread network", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v9);
  -[HMDThreadResidentCommissioner threadRadioClient](v10, "threadRadioClient");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __70__HMDThreadResidentCommissioner__startThreadNetworkWithID_completion___block_invoke;
  v16[3] = &unk_24E784130;
  v16[4] = v10;
  v17 = v6;
  v18 = v7;
  v14 = v7;
  v15 = v6;
  objc_msgSend(v13, "startThreadNetwork:completion:", v15, v16);

}

- (void)startThreadNetworkWithOperationalDataset:(id)a3 threadNetworkID:(id)a4 isOwnerUser:(BOOL)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  HMDThreadResidentCommissioner *v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  id v18;
  id v19;
  id v20;
  _QWORD block[5];
  id v22;
  id v23;
  id v24;
  BOOL v25;
  uint8_t buf[4];
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a6;
  v13 = (void *)MEMORY[0x227676638]();
  v14 = self;
  HMFGetOSLogHandle();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v27 = v16;
    _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@Scheduling startThreadNetworkWithOperationalDataset", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v13);
  -[HMDThreadResidentCommissioner workQueue](v14, "workQueue");
  v17 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __113__HMDThreadResidentCommissioner_startThreadNetworkWithOperationalDataset_threadNetworkID_isOwnerUser_completion___block_invoke;
  block[3] = &unk_24E798BF0;
  block[4] = v14;
  v22 = v10;
  v25 = a5;
  v23 = v11;
  v24 = v12;
  v18 = v12;
  v19 = v11;
  v20 = v10;
  dispatch_async(v17, block);

}

- (void)_startThreadNetworkWithOperationalDataset:(id)a3 threadNetworkID:(id)a4 isOwnerUser:(BOOL)a5 completion:(id)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  HMDThreadResidentCommissioner *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  _QWORD v22[5];
  id v23;
  id v24;
  id v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  id v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v7 = a5;
  v32 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a6;
  -[HMDThreadResidentCommissioner workQueue](self, "workQueue");
  v13 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v13);

  v14 = (void *)MEMORY[0x227676638]();
  v15 = self;
  HMFGetOSLogHandle();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v27 = v17;
    v28 = 2112;
    v29 = v11;
    v30 = 2112;
    v31 = v10;
    _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@Starting thread network id %@ with operational dataset %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v14);
  -[HMDThreadResidentCommissioner threadRadioClient](v15, "threadRadioClient");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __114__HMDThreadResidentCommissioner__startThreadNetworkWithOperationalDataset_threadNetworkID_isOwnerUser_completion___block_invoke;
  v22[3] = &unk_24E79C0D0;
  v22[4] = v15;
  v23 = v11;
  v24 = v10;
  v25 = v12;
  v19 = v12;
  v20 = v10;
  v21 = v11;
  objc_msgSend(v18, "startThreadNetworkWithOperationalDataset:isOwnerUser:completion:", v20, v7, v22);

}

- (void)stopThreadNetworkWithCompletion:(id)a3
{
  void (**v4)(id, _QWORD);
  int AppBooleanValue;
  void *v6;
  HMDThreadResidentCommissioner *v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  _QWORD v13[5];
  void (**v14)(id, _QWORD);
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, _QWORD))a3;
  AppBooleanValue = CFPreferencesGetAppBooleanValue(CFSTR("StartThreadOnWake"), CFSTR("/Library/Managed Preferences/mobile/com.apple.homed.plist"), 0);
  v6 = (void *)MEMORY[0x227676638]();
  v7 = self;
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (AppBooleanValue)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v16 = v10;
      _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@Suppressing thread stop", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v6);
    v4[2](v4, 0);
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v16 = v11;
      _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@Scheduling stopThreadNetworkWithCompletion", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v6);
    -[HMDThreadResidentCommissioner workQueue](v7, "workQueue");
    v12 = objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __65__HMDThreadResidentCommissioner_stopThreadNetworkWithCompletion___block_invoke;
    v13[3] = &unk_24E79C2B8;
    v13[4] = v7;
    v14 = v4;
    dispatch_async(v12, v13);

  }
}

- (void)stopThreadNetworkOnDeviceLockWithCompletion:(id)a3
{
  id v4;
  void *v5;
  HMDThreadResidentCommissioner *v6;
  NSObject *v7;
  void *v8;
  int AppBooleanValue;
  void *v10;
  HMDThreadResidentCommissioner *v11;
  NSObject *v12;
  _BOOL4 v13;
  void *v14;
  NSObject *v15;
  void *v16;
  _QWORD v17[5];
  id v18;
  uint8_t buf[4];
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x227676638]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v20 = v8;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@stopThreadNetworkOnDeviceLock: Scheduling stopThreadNetworkWithCompletion", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v5);
  if (!CFPreferencesGetAppBooleanValue(CFSTR("StartThreadOnWake"), CFSTR("/Library/Managed Preferences/mobile/com.apple.homed.plist"), 0))goto LABEL_8;
  AppBooleanValue = CFPreferencesGetAppBooleanValue(CFSTR("StartThreadOnWakeAllowHomeThreadStop"), CFSTR("/Library/Managed Preferences/mobile/com.apple.homed.plist"), 0);
  v10 = (void *)MEMORY[0x227676638]();
  v11 = v6;
  HMFGetOSLogHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = os_log_type_enabled(v12, OS_LOG_TYPE_INFO);
  if (AppBooleanValue)
  {
    if (v13)
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v20 = v14;
      _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_INFO, "%{public}@Allowing stop thread", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v10);
LABEL_8:
    -[HMDThreadResidentCommissioner workQueue](v6, "workQueue");
    v15 = objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __77__HMDThreadResidentCommissioner_stopThreadNetworkOnDeviceLockWithCompletion___block_invoke;
    v17[3] = &unk_24E79C2B8;
    v17[4] = v6;
    v18 = v4;
    dispatch_async(v15, v17);

    goto LABEL_12;
  }
  if (v13)
  {
    HMFGetLogIdentifier();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v20 = v16;
    _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_INFO, "%{public}@Suppressing thread stop on device lock - thread will stop by itself", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v10);
  (*((void (**)(id, _QWORD))v4 + 2))(v4, 0);
LABEL_12:

}

- (void)_stopThreadNetworkWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  HMDThreadResidentCommissioner *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[5];
  id v13;
  uint8_t buf[4];
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDThreadResidentCommissioner workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v6 = (void *)MEMORY[0x227676638]();
  v7 = self;
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v15 = v9;
    _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@Stopping thread network", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v6);
  -[HMDThreadResidentCommissioner threadRadioClient](v7, "threadRadioClient");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __66__HMDThreadResidentCommissioner__stopThreadNetworkWithCompletion___block_invoke;
  v12[3] = &unk_24E79B3A0;
  v12[4] = v7;
  v13 = v4;
  v11 = v4;
  objc_msgSend(v10, "stopThreadNetworkWithCompletion:", v12);

}

- (void)connectToThreadAccessoryWithExtendedMACAddress:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMDThreadResidentCommissioner *v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  HMDThreadResidentCommissioner *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  _QWORD block[5];
  id v19;
  id v20;
  uint8_t buf[4];
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x227676638]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v22 = v11;
    _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@Scheduling connectToThreadAccessoryWithExtendedMACAddress", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v8);
  if ((isFeatureMatteriPhoneOnlyPairingControlForThreadEnabled() & 1) != 0)
  {
    -[HMDThreadResidentCommissioner workQueue](v9, "workQueue");
    v12 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __91__HMDThreadResidentCommissioner_connectToThreadAccessoryWithExtendedMACAddress_completion___block_invoke;
    block[3] = &unk_24E79B440;
    block[4] = v9;
    v19 = v6;
    v20 = v7;
    dispatch_async(v12, block);

  }
  else
  {
    v13 = (void *)MEMORY[0x227676638]();
    v14 = v9;
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v22 = v16;
      _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_ERROR, "%{public}@Thread Service feature is not enabled", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v13);
    objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:", 5);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v7 + 2))(v7, v17);

  }
}

- (void)_connectToThreadAccessoryWithExtendedMACAddress:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  HMDThreadResidentCommissioner *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v15[5];
  id v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[HMDThreadResidentCommissioner workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  v9 = (void *)MEMORY[0x227676638]();
  v10 = self;
  HMFGetOSLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v18 = v12;
    v19 = 2112;
    v20 = v6;
    _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@Attempting to connect to accessory with emac %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v9);
  -[HMDThreadResidentCommissioner threadRadioClient](v10, "threadRadioClient");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __92__HMDThreadResidentCommissioner__connectToThreadAccessoryWithExtendedMACAddress_completion___block_invoke;
  v15[3] = &unk_24E79B3A0;
  v15[4] = v10;
  v16 = v7;
  v14 = v7;
  objc_msgSend(v13, "connectToExtendedMACAddress:completion:", v6, v15);

}

- (void)startThreadAccessoryPairingWithExtendedMACAddress:(id)a3 isWedDevice:(BOOL)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  HMDThreadResidentCommissioner *v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  HMDThreadResidentCommissioner *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  _QWORD v20[5];
  id v21;
  id v22;
  BOOL v23;
  uint8_t buf[4];
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  v10 = (void *)MEMORY[0x227676638]();
  v11 = self;
  HMFGetOSLogHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v25 = v13;
    _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@Scheduling startThreadAccessoryPairingWithExtendedMACAddress", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v10);
  if ((isFeatureMatteriPhoneOnlyPairingControlForThreadEnabled() & 1) != 0)
  {
    -[HMDThreadResidentCommissioner workQueue](v11, "workQueue");
    v14 = objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = __106__HMDThreadResidentCommissioner_startThreadAccessoryPairingWithExtendedMACAddress_isWedDevice_completion___block_invoke;
    v20[3] = &unk_24E7962D8;
    v20[4] = v11;
    v21 = v8;
    v23 = a4;
    v22 = v9;
    dispatch_async(v14, v20);

  }
  else
  {
    v15 = (void *)MEMORY[0x227676638]();
    v16 = v11;
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v25 = v18;
      _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_ERROR, "%{public}@Thread Service feature is not enabled", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v15);
    objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:", 5);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v9 + 2))(v9, v19);

  }
}

- (void)stopThreadAccessoryPairingWithCompletion:(id)a3
{
  id v4;
  void *v5;
  HMDThreadResidentCommissioner *v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  HMDThreadResidentCommissioner *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  _QWORD v15[5];
  id v16;
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x227676638]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v18 = v8;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@Scheduling stopThreadAccessoryPairingWithCompletion", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v5);
  if ((isFeatureMatteriPhoneOnlyPairingControlForThreadEnabled() & 1) != 0)
  {
    -[HMDThreadResidentCommissioner workQueue](v6, "workQueue");
    v9 = objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __74__HMDThreadResidentCommissioner_stopThreadAccessoryPairingWithCompletion___block_invoke;
    v15[3] = &unk_24E79C2B8;
    v15[4] = v6;
    v16 = v4;
    dispatch_async(v9, v15);

  }
  else
  {
    v10 = (void *)MEMORY[0x227676638]();
    v11 = v6;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v18 = v13;
      _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_ERROR, "%{public}@Thread Service feature is not enabled", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v10);
    objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:", 5);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v4 + 2))(v4, v14);

  }
}

- (void)startThreadAccessoryFirmwareUpdateWithExtendedMACAddress:(id)a3 isWedDevice:(BOOL)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  HMDThreadResidentCommissioner *v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  HMDThreadResidentCommissioner *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  _QWORD v20[5];
  id v21;
  id v22;
  BOOL v23;
  uint8_t buf[4];
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  v10 = (void *)MEMORY[0x227676638]();
  v11 = self;
  HMFGetOSLogHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v25 = v13;
    _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@Scheduling startThreadAccessoryFirmwareUpdateWithExtendedMACAddress", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v10);
  if ((isFeatureMatteriPhoneOnlyPairingControlForThreadEnabled() & 1) != 0)
  {
    -[HMDThreadResidentCommissioner workQueue](v11, "workQueue");
    v14 = objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = __113__HMDThreadResidentCommissioner_startThreadAccessoryFirmwareUpdateWithExtendedMACAddress_isWedDevice_completion___block_invoke;
    v20[3] = &unk_24E7962D8;
    v20[4] = v11;
    v21 = v8;
    v23 = a4;
    v22 = v9;
    dispatch_async(v14, v20);

  }
  else
  {
    v15 = (void *)MEMORY[0x227676638]();
    v16 = v11;
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v25 = v18;
      _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_ERROR, "%{public}@Thread Service feature is not enabled", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v15);
    objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:", 5);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v9 + 2))(v9, v19);

  }
}

- (void)stopThreadAccessoryFirmwareUpdateWithCompletion:(id)a3
{
  id v4;
  void *v5;
  HMDThreadResidentCommissioner *v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  HMDThreadResidentCommissioner *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  _QWORD v15[5];
  id v16;
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x227676638]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v18 = v8;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@Scheduling stopThreadAccessoryFirmwareUpdateWithCompletion", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v5);
  if ((isFeatureMatteriPhoneOnlyPairingControlForThreadEnabled() & 1) != 0)
  {
    -[HMDThreadResidentCommissioner workQueue](v6, "workQueue");
    v9 = objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __81__HMDThreadResidentCommissioner_stopThreadAccessoryFirmwareUpdateWithCompletion___block_invoke;
    v15[3] = &unk_24E79C2B8;
    v15[4] = v6;
    v16 = v4;
    dispatch_async(v9, v15);

  }
  else
  {
    v10 = (void *)MEMORY[0x227676638]();
    v11 = v6;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v18 = v13;
      _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_ERROR, "%{public}@Thread Service feature is not enabled", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v10);
    objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:", 5);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v4 + 2))(v4, v14);

  }
}

- (void)registerForThreadNetworkEvents:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HMDThreadResidentCommissioner threadRadioClient](self, "threadRadioClient");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "registerForThreadNetworkEvents:", v4);

}

- (void)unregisterForThreadNetworkEvents:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HMDThreadResidentCommissioner threadRadioClient](self, "threadRadioClient");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unregisterForThreadNetworkEvents:", v4);

}

- (void)informThreadLayerOfResidentChange:(BOOL)a3 primaryResidentIsThreadCapable:(BOOL)a4
{
  NSObject *v7;
  _QWORD v8[5];
  BOOL v9;
  BOOL v10;

  -[HMDThreadResidentCommissioner workQueue](self, "workQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __98__HMDThreadResidentCommissioner_informThreadLayerOfResidentChange_primaryResidentIsThreadCapable___block_invoke;
  v8[3] = &unk_24E789C58;
  v8[4] = self;
  v9 = a3;
  v10 = a4;
  dispatch_async(v7, v8);

}

- (void)_informThreadLayerOfResidentChange:(BOOL)a3 primaryResidentIsThreadCapable:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  NSObject *v7;
  id v8;

  v4 = a4;
  v5 = a3;
  -[HMDThreadResidentCommissioner workQueue](self, "workQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  -[HMDThreadResidentCommissioner threadRadioClient](self, "threadRadioClient");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "informThreadLayerOfResidentChange:primaryResidentIsThreadCapable:", v5, v4);

}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (HMDThreadRadioClient)threadRadioClient
{
  return self->_threadRadioClient;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_threadRadioClient, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
}

uint64_t __98__HMDThreadResidentCommissioner_informThreadLayerOfResidentChange_primaryResidentIsThreadCapable___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_informThreadLayerOfResidentChange:primaryResidentIsThreadCapable:", *(unsigned __int8 *)(a1 + 40), *(unsigned __int8 *)(a1 + 41));
}

void __81__HMDThreadResidentCommissioner_stopThreadAccessoryFirmwareUpdateWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  _QWORD v4[5];
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "threadRadioClient");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __81__HMDThreadResidentCommissioner_stopThreadAccessoryFirmwareUpdateWithCompletion___block_invoke_2;
  v4[3] = &unk_24E79B3A0;
  v3 = *(id *)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  objc_msgSend(v2, "stopFirmwareUpdateWithCompletion:", v4);

}

uint64_t __81__HMDThreadResidentCommissioner_stopThreadAccessoryFirmwareUpdateWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __113__HMDThreadResidentCommissioner_startThreadAccessoryFirmwareUpdateWithExtendedMACAddress_isWedDevice_completion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  _QWORD v6[5];
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "threadRadioClient");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(unsigned __int8 *)(a1 + 56);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __113__HMDThreadResidentCommissioner_startThreadAccessoryFirmwareUpdateWithExtendedMACAddress_isWedDevice_completion___block_invoke_2;
  v6[3] = &unk_24E79B3A0;
  v4 = *(_QWORD *)(a1 + 40);
  v5 = *(id *)(a1 + 48);
  v6[4] = *(_QWORD *)(a1 + 32);
  v7 = v5;
  objc_msgSend(v2, "startFirmwareUpdateWithExtendedMACAddress:isWedDevice:completion:", v4, v3, v6);

}

uint64_t __113__HMDThreadResidentCommissioner_startThreadAccessoryFirmwareUpdateWithExtendedMACAddress_isWedDevice_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __74__HMDThreadResidentCommissioner_stopThreadAccessoryPairingWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  _QWORD v4[5];
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "threadRadioClient");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __74__HMDThreadResidentCommissioner_stopThreadAccessoryPairingWithCompletion___block_invoke_2;
  v4[3] = &unk_24E79B3A0;
  v3 = *(id *)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  objc_msgSend(v2, "stopThreadPairingWithCompletion:", v4);

}

uint64_t __74__HMDThreadResidentCommissioner_stopThreadAccessoryPairingWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __106__HMDThreadResidentCommissioner_startThreadAccessoryPairingWithExtendedMACAddress_isWedDevice_completion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  _QWORD v6[5];
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "threadRadioClient");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(unsigned __int8 *)(a1 + 56);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __106__HMDThreadResidentCommissioner_startThreadAccessoryPairingWithExtendedMACAddress_isWedDevice_completion___block_invoke_2;
  v6[3] = &unk_24E79B3A0;
  v4 = *(_QWORD *)(a1 + 40);
  v5 = *(id *)(a1 + 48);
  v6[4] = *(_QWORD *)(a1 + 32);
  v7 = v5;
  objc_msgSend(v2, "startThreadPairingWithExtendedMACAddress:isWedDevice:completion:", v4, v3, v6);

}

uint64_t __106__HMDThreadResidentCommissioner_startThreadAccessoryPairingWithExtendedMACAddress_isWedDevice_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __92__HMDThreadResidentCommissioner__connectToThreadAccessoryWithExtendedMACAddress_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __91__HMDThreadResidentCommissioner_connectToThreadAccessoryWithExtendedMACAddress_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_connectToThreadAccessoryWithExtendedMACAddress:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void __66__HMDThreadResidentCommissioner__stopThreadNetworkWithCompletion___block_invoke(uint64_t a1, void *a2)
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
  void *v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
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
      v16 = 138543618;
      v17 = v8;
      v18 = 2112;
      v19 = v3;
      v9 = "%{public}@Failed to stop thread network: %@";
      v10 = v7;
      v11 = OS_LOG_TYPE_ERROR;
      v12 = 22;
LABEL_6:
      _os_log_impl(&dword_2218F0000, v10, v11, v9, (uint8_t *)&v16, v12);

    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 138543362;
    v17 = v8;
    v9 = "%{public}@Stopped thread network";
    v10 = v7;
    v11 = OS_LOG_TYPE_DEFAULT;
    v12 = 12;
    goto LABEL_6;
  }

  objc_autoreleasePoolPop(v4);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "postNotificationName:object:", CFSTR("HMDThreadNetworkStateChangeNotification"), 0);

  (*(void (**)(_QWORD, id, uint64_t, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), v3, v14, v15);
}

uint64_t __77__HMDThreadResidentCommissioner_stopThreadNetworkOnDeviceLockWithCompletion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_stopThreadNetworkWithCompletion:", *(_QWORD *)(a1 + 40));
}

uint64_t __65__HMDThreadResidentCommissioner_stopThreadNetworkWithCompletion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_stopThreadNetworkWithCompletion:", *(_QWORD *)(a1 + 40));
}

void __114__HMDThreadResidentCommissioner__startThreadNetworkWithOperationalDataset_threadNetworkID_isOwnerUser_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  uint64_t v15;
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
      v9 = *(_QWORD *)(a1 + 48);
      v12 = 138543874;
      v13 = v8;
      v14 = 2112;
      v15 = v9;
      v16 = 2112;
      v17 = v3;
      _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_ERROR, "%{public}@Failed to start thread network %@: %@", (uint8_t *)&v12, 0x20u);

    }
    objc_autoreleasePoolPop(v4);
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543362;
      v13 = v10;
      _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@Started thread network", (uint8_t *)&v12, 0xCu);

    }
    objc_autoreleasePoolPop(v4);
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "postNotificationName:object:", CFSTR("HMDThreadNetworkStateChangeNotification"), *(_QWORD *)(a1 + 40));

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

}

uint64_t __113__HMDThreadResidentCommissioner_startThreadNetworkWithOperationalDataset_threadNetworkID_isOwnerUser_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_startThreadNetworkWithOperationalDataset:threadNetworkID:isOwnerUser:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 64), *(_QWORD *)(a1 + 56));
}

void __70__HMDThreadResidentCommissioner__startThreadNetworkWithID_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = (void *)MEMORY[0x227676638]();
  v8 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v5)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543618;
      v16 = v11;
      v17 = 2112;
      v18 = v5;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@Started thread network: %@", (uint8_t *)&v15, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "postNotificationName:object:", CFSTR("HMDThreadNetworkStateChangeNotification"), v5);

  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = *(void **)(a1 + 40);
      v15 = 138543874;
      v16 = v13;
      v17 = 2112;
      v18 = v14;
      v19 = 2112;
      v20 = v6;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to start thread network %@: %@", (uint8_t *)&v15, 0x20u);

    }
    objc_autoreleasePoolPop(v7);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

uint64_t __69__HMDThreadResidentCommissioner_startThreadNetworkWithID_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_startThreadNetworkWithID:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t0_109672 != -1)
    dispatch_once(&logCategory__hmf_once_t0_109672, &__block_literal_global_109673);
  return (id)logCategory__hmf_once_v1_109674;
}

+ (HMDThreadResidentCommissioner)sharedCommissioner
{
  id WeakRetained;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  os_unfair_lock_lock_with_options();
  WeakRetained = objc_loadWeakRetained(&sharedCommissioner_weakCommissioner);
  v4 = (void *)MEMORY[0x227676638]();
  v5 = a1;
  if (WeakRetained)
  {
    HMFGetOSLogHandle();
    v6 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543362;
      v12 = v7;
      _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_DEBUG, "%{public}@Reusing existing commissioner", (uint8_t *)&v11, 0xCu);

    }
    objc_autoreleasePoolPop(v4);
  }
  else
  {
    HMFGetOSLogHandle();
    v8 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543362;
      v12 = v9;
      _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_DEBUG, "%{public}@Creating new commissioner", (uint8_t *)&v11, 0xCu);

    }
    objc_autoreleasePoolPop(v4);
    WeakRetained = -[HMDThreadResidentCommissioner initInternal]([HMDThreadResidentCommissioner alloc], "initInternal");
    objc_storeWeak(&sharedCommissioner_weakCommissioner, WeakRetained);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&sharedCommissioner_lock);
  return (HMDThreadResidentCommissioner *)WeakRetained;
}

void __44__HMDThreadResidentCommissioner_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v1_109674;
  logCategory__hmf_once_v1_109674 = v0;

}

@end
