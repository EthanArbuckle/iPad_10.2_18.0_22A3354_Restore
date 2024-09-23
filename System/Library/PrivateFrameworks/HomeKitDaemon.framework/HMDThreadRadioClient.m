@implementation HMDThreadRadioClient

- (HMDThreadRadioClient)init
{
  HMDThreadRadioClient *v2;
  void *v3;
  char v4;
  uint64_t v5;
  CtrClient *threadClient;
  NSObject *v7;
  NSObject *v8;
  dispatch_queue_t v9;
  OS_dispatch_queue *threadStateCaptureQueue;
  HMDThreadCommandTimer *v11;
  NSObject *v12;
  NSObject *v13;
  dispatch_queue_t v14;
  uint64_t v15;
  HMDThreadCommandTimer *deferredCommandTimer;
  NSObject *v17;
  NSObject *v18;
  dispatch_queue_t v19;
  OS_dispatch_queue *threadEventQueue;
  uint64_t v21;
  NSHashTable *observers;
  void *v23;
  HMDThreadRadioClient *v24;
  NSObject *v25;
  void *v26;
  HMDThreadRadioClient *v27;
  void *v28;
  objc_super v30;
  uint8_t buf[4];
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v30.receiver = self;
  v30.super_class = (Class)HMDThreadRadioClient;
  v2 = -[HMDThreadRadioClient init](&v30, sel_init);
  if (!v2)
    return v2;
  if ((isFeatureMatteriPhoneOnlyPairingControlForThreadEnabled() & 1) == 0)
  {
    v23 = (void *)MEMORY[0x227676638]();
    v24 = v2;
    HMFGetOSLogHandle();
    v25 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v32 = v26;
      _os_log_impl(&dword_2218F0000, v25, OS_LOG_TYPE_ERROR, "%{public}@Thread service not enabled", buf, 0xCu);

    }
    goto LABEL_10;
  }
  +[HMDDeviceCapabilities deviceCapabilities](HMDDeviceCapabilities, "deviceCapabilities");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "supportsThreadService");

  if ((v4 & 1) == 0)
  {
    v23 = (void *)MEMORY[0x227676638]();
    v27 = v2;
    HMFGetOSLogHandle();
    v25 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v32 = v28;
      _os_log_impl(&dword_2218F0000, v25, OS_LOG_TYPE_ERROR, "%{public}@This device doesn't support thread service", buf, 0xCu);

    }
LABEL_10:

    objc_autoreleasePoolPop(v23);
    return v2;
  }
  if (objc_opt_class())
  {
    v5 = objc_msgSend(objc_alloc(MEMORY[0x24BE28960]), "init:", "HomeD");
    threadClient = v2->_threadClient;
    v2->_threadClient = (CtrClient *)v5;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v7 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v7, QOS_CLASS_BACKGROUND, 0);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = dispatch_queue_create("thread-state-capture", v8);
    threadStateCaptureQueue = v2->_threadStateCaptureQueue;
    v2->_threadStateCaptureQueue = (OS_dispatch_queue *)v9;

    v2->_threadNetworkUp = 0;
    v2->_threadLayerInformedResidentState = 0;
    v2->_isGeoAvailable = 0;
    v11 = [HMDThreadCommandTimer alloc];
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v12 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v12, QOS_CLASS_BACKGROUND, 0);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = dispatch_queue_create("thread-command-timer", v13);
    v15 = -[HMDThreadCommandTimer initWithQueue:delayInSecs:](v11, "initWithQueue:delayInSecs:", v14, &unk_24E96BE58);
    deferredCommandTimer = v2->_deferredCommandTimer;
    v2->_deferredCommandTimer = (HMDThreadCommandTimer *)v15;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v17 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v17, QOS_CLASS_BACKGROUND, 0);
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = dispatch_queue_create("thread-event", v18);
    threadEventQueue = v2->_threadEventQueue;
    v2->_threadEventQueue = (OS_dispatch_queue *)v19;

    objc_msgSend(MEMORY[0x24BDD15C0], "weakObjectsHashTable");
    v21 = objc_claimAutoreleasedReturnValue();
    observers = v2->_observers;
    v2->_observers = (NSHashTable *)v21;

  }
  return v2;
}

- (void)setIsGeoAvailable:(BOOL)a3
{
  self->_isGeoAvailable = a3;
}

- (BOOL)isGeoAvailable
{
  return self->_isGeoAvailable;
}

- (void)startThreadNetwork:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  HMDThreadRadioClient *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  HMDThreadRadioClient *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  HMDThreadRadioClient *v19;
  NSObject *v20;
  void *v21;
  NSObject *v22;
  id v23;
  HMDThreadRadioClient *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  HMDThreadRadioClient *v29;
  NSObject *v30;
  void *v31;
  NSObject *v32;
  _QWORD v33[4];
  id v34;
  _QWORD block[4];
  id v36;
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  id v40;
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[HMDThreadRadioClient threadClient](self, "threadClient");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    if (v6)
    {
      v9 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", v6);
      v10 = (void *)MEMORY[0x227676638]();
      v11 = self;
      if (v9)
      {
        HMFGetOSLogHandle();
        v12 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          HMFGetLogIdentifier();
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v38 = v13;
          _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@Scheduling an attempt to join an existing thread network", buf, 0xCu);

        }
        objc_autoreleasePoolPop(v10);
        v14 = (void *)MEMORY[0x227676638]();
        v15 = v11;
        HMFGetOSLogHandle();
        v16 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        {
          HMFGetLogIdentifier();
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v38 = v17;
          v39 = 2112;
          v40 = v9;
          _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_DEBUG, "%{public}@Thread networkID: %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v14);
        goto LABEL_17;
      }
      HMFGetOSLogHandle();
      v25 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v38 = v27;
        v39 = 2112;
        v40 = v6;
        _os_log_impl(&dword_2218F0000, v25, OS_LOG_TYPE_ERROR, "%{public}@NetworkID is not valid for thread unique id: %@", buf, 0x16u);

      }
    }
    else
    {
      v10 = (void *)MEMORY[0x227676638]();
      v24 = self;
      HMFGetOSLogHandle();
      v25 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v38 = v26;
        _os_log_impl(&dword_2218F0000, v25, OS_LOG_TYPE_DEFAULT, "%{public}@Scheduling an attempt to create a new thread network", buf, 0xCu);

      }
    }

    objc_autoreleasePoolPop(v10);
    v9 = 0;
LABEL_17:
    v28 = (void *)MEMORY[0x227676638]();
    v29 = self;
    HMFGetOSLogHandle();
    v30 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v38 = v31;
      _os_log_impl(&dword_2218F0000, v30, OS_LOG_TYPE_ERROR, "%{public}@Incorrect startThread API used", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v28);
    dispatch_get_global_queue(21, 0);
    v32 = objc_claimAutoreleasedReturnValue();
    v33[0] = MEMORY[0x24BDAC760];
    v33[1] = 3221225472;
    v33[2] = __54__HMDThreadRadioClient_startThreadNetwork_completion___block_invoke_124;
    v33[3] = &unk_24E799CC8;
    v34 = v7;
    v23 = v7;
    dispatch_async(v32, v33);

    goto LABEL_20;
  }
  v18 = (void *)MEMORY[0x227676638]();
  v19 = self;
  HMFGetOSLogHandle();
  v20 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v38 = v21;
    _os_log_impl(&dword_2218F0000, v20, OS_LOG_TYPE_INFO, "%{public}@Thread radio client is not available on this device", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v18);
  dispatch_get_global_queue(21, 0);
  v22 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __54__HMDThreadRadioClient_startThreadNetwork_completion___block_invoke;
  block[3] = &unk_24E799CC8;
  v36 = v7;
  v9 = v7;
  dispatch_async(v22, block);

  v23 = v36;
LABEL_20:

}

- (void)startThreadNetworkWithOperationalDataset:(id)a3 isOwnerUser:(BOOL)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  BOOL v13;
  void *v14;
  HMDThreadRadioClient *v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  _QWORD v24[5];
  id v25;
  id v26;
  BOOL v27;
  BOOL v28;
  _QWORD block[4];
  id v30;
  uint8_t buf[4];
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  -[HMDThreadRadioClient _updateThreadMessageReliabilityParametersWithUserDefinedValues:](self, "_updateThreadMessageReliabilityParametersWithUserDefinedValues:", 1);
  -[HMDThreadRadioClient threadClient](self, "threadClient");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    +[HMDLocation sharedManager](HMDLocation, "sharedManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "locationAuthorized");

    v13 = v12 == 1 && -[HMDThreadRadioClient isGeoAvailable](self, "isGeoAvailable");
    objc_msgSend(v8, "hmf_hexadecimalStringWithOptions:", 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "dataUsingEncoding:", 4);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE3F268], "defaultScheduler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = MEMORY[0x24BDAC760];
    v24[1] = 3221225472;
    v24[2] = __88__HMDThreadRadioClient_startThreadNetworkWithOperationalDataset_isOwnerUser_completion___block_invoke_2;
    v24[3] = &unk_24E789BB8;
    v24[4] = self;
    v22 = v20;
    v25 = v22;
    v27 = v13;
    v28 = a4;
    v26 = v9;
    v23 = (id)objc_msgSend(v21, "performWithQualityOfService:block:", 17, v24);

  }
  else
  {
    v14 = (void *)MEMORY[0x227676638]();
    v15 = self;
    HMFGetOSLogHandle();
    v16 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v32 = v17;
      _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_INFO, "%{public}@Thread radio client is not available on this device", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v14);
    dispatch_get_global_queue(21, 0);
    v18 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __88__HMDThreadRadioClient_startThreadNetworkWithOperationalDataset_isOwnerUser_completion___block_invoke;
    block[3] = &unk_24E799CC8;
    v30 = v9;
    dispatch_async(v18, block);

    v19 = v30;
  }

}

- (void)connectToExtendedMACAddress:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  char v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  HMDThreadRadioClient *v18;
  NSObject *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  HMDThreadRadioClient *v24;
  NSObject *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void (*v29)(uint64_t);
  void *v30;
  id v31;
  HMDThreadRadioClient *v32;
  id v33;
  _QWORD block[4];
  id v35;
  uint8_t buf[4];
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[HMDThreadRadioClient threadClient](self, "threadClient");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[HMDThreadRadioClient threadClient](self, "threadClient");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_opt_respondsToSelector();

    if ((v10 & 1) != 0)
    {
      v27 = MEMORY[0x24BDAC760];
      v28 = 3221225472;
      v29 = __63__HMDThreadRadioClient_connectToExtendedMACAddress_completion___block_invoke_131;
      v30 = &unk_24E79B440;
      v11 = v6;
      v31 = v11;
      v32 = self;
      v12 = v7;
      v33 = v12;
      v13 = _Block_copy(&v27);
      -[HMDThreadRadioClient deferredCommandTimer](self, "deferredCommandTimer", v27, v28, v29, v30);
      if (v11)
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "abort");

        objc_msgSend(MEMORY[0x24BE3F268], "defaultScheduler");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = (id)objc_msgSend(v15, "performWithQualityOfService:block:", 17, v13);
      }
      else
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "startWithBlock:completion:commandType:", v13, v12, 1);
      }

      v22 = v31;
    }
    else
    {
      v23 = (void *)MEMORY[0x227676638]();
      v24 = self;
      HMFGetOSLogHandle();
      v25 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v37 = v26;
        _os_log_impl(&dword_2218F0000, v25, OS_LOG_TYPE_ERROR, "%{public}@ThreadClient did not respond to selector - provideExtendedMACAddress:completion", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v23);
      objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 48);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, void *))v7 + 2))(v7, v22);
    }
  }
  else
  {
    v17 = (void *)MEMORY[0x227676638]();
    v18 = self;
    HMFGetOSLogHandle();
    v19 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v37 = v20;
      _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_INFO, "%{public}@Thread radio client is not available on this device", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v17);
    dispatch_get_global_queue(21, 0);
    v21 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __63__HMDThreadRadioClient_connectToExtendedMACAddress_completion___block_invoke;
    block[3] = &unk_24E799CC8;
    v35 = v7;
    dispatch_async(v21, block);

    v22 = v35;
  }

}

- (void)startThreadPairingWithExtendedMACAddress:(id)a3 isWedDevice:(BOOL)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  HMDThreadRadioClient *v17;
  NSObject *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  HMDThreadRadioClient *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  _QWORD aBlock[5];
  id v27;
  id v28;
  BOOL v29;
  _QWORD block[4];
  id v31;
  uint8_t buf[4];
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  -[HMDThreadRadioClient threadClient](self, "threadClient");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[HMDThreadRadioClient threadClient](self, "threadClient");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_opt_respondsToSelector();

    if ((v12 & 1) != 0)
    {
      aBlock[0] = MEMORY[0x24BDAC760];
      aBlock[1] = 3221225472;
      aBlock[2] = __88__HMDThreadRadioClient_startThreadPairingWithExtendedMACAddress_isWedDevice_completion___block_invoke_135;
      aBlock[3] = &unk_24E7962D8;
      aBlock[4] = self;
      v27 = v8;
      v29 = a4;
      v28 = v9;
      v13 = _Block_copy(aBlock);
      objc_msgSend(MEMORY[0x24BE3F268], "defaultScheduler");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (id)objc_msgSend(v14, "performWithQualityOfService:block:", 17, v13);

    }
    else
    {
      v21 = (void *)MEMORY[0x227676638]();
      v22 = self;
      HMFGetOSLogHandle();
      v23 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v33 = v24;
        _os_log_impl(&dword_2218F0000, v23, OS_LOG_TYPE_ERROR, "%{public}@ThreadClient did not respond to selector - startPairingForExtendedMACAddress:isWedDevice:completion", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v21);
      objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 48);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, void *))v9 + 2))(v9, v25);

    }
  }
  else
  {
    v16 = (void *)MEMORY[0x227676638]();
    v17 = self;
    HMFGetOSLogHandle();
    v18 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v33 = v19;
      _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_INFO, "%{public}@Thread radio client is not available on this device", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v16);
    dispatch_get_global_queue(21, 0);
    v20 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __88__HMDThreadRadioClient_startThreadPairingWithExtendedMACAddress_isWedDevice_completion___block_invoke;
    block[3] = &unk_24E799CC8;
    v31 = v9;
    dispatch_async(v20, block);

  }
}

- (void)stopThreadPairingWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  HMDThreadRadioClient *v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  HMDThreadRadioClient *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  _QWORD aBlock[5];
  id v22;
  _QWORD block[4];
  id v24;
  uint8_t buf[4];
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDThreadRadioClient threadClient](self, "threadClient");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[HMDThreadRadioClient threadClient](self, "threadClient");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_opt_respondsToSelector();

    if ((v7 & 1) != 0)
    {
      aBlock[0] = MEMORY[0x24BDAC760];
      aBlock[1] = 3221225472;
      aBlock[2] = __56__HMDThreadRadioClient_stopThreadPairingWithCompletion___block_invoke_138;
      aBlock[3] = &unk_24E79C2B8;
      aBlock[4] = self;
      v22 = v4;
      v8 = _Block_copy(aBlock);
      objc_msgSend(MEMORY[0x24BE3F268], "defaultScheduler");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (id)objc_msgSend(v9, "performWithQualityOfService:block:", 17, v8);

    }
    else
    {
      v16 = (void *)MEMORY[0x227676638]();
      v17 = self;
      HMFGetOSLogHandle();
      v18 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v26 = v19;
        _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_ERROR, "%{public}@ThreadClient did not respond to selector - stopPairing:", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v16);
      objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 48);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, void *))v4 + 2))(v4, v20);

    }
  }
  else
  {
    v11 = (void *)MEMORY[0x227676638]();
    v12 = self;
    HMFGetOSLogHandle();
    v13 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v26 = v14;
      _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_INFO, "%{public}@Thread radio client is not available on this device", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v11);
    dispatch_get_global_queue(21, 0);
    v15 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __56__HMDThreadRadioClient_stopThreadPairingWithCompletion___block_invoke;
    block[3] = &unk_24E799CC8;
    v24 = v4;
    dispatch_async(v15, block);

  }
}

- (void)startFirmwareUpdateWithExtendedMACAddress:(id)a3 isWedDevice:(BOOL)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  HMDThreadRadioClient *v17;
  NSObject *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  HMDThreadRadioClient *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  _QWORD aBlock[5];
  id v27;
  id v28;
  BOOL v29;
  _QWORD block[4];
  id v31;
  uint8_t buf[4];
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  -[HMDThreadRadioClient threadClient](self, "threadClient");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[HMDThreadRadioClient threadClient](self, "threadClient");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_opt_respondsToSelector();

    if ((v12 & 1) != 0)
    {
      aBlock[0] = MEMORY[0x24BDAC760];
      aBlock[1] = 3221225472;
      aBlock[2] = __89__HMDThreadRadioClient_startFirmwareUpdateWithExtendedMACAddress_isWedDevice_completion___block_invoke_141;
      aBlock[3] = &unk_24E7962D8;
      aBlock[4] = self;
      v27 = v8;
      v29 = a4;
      v28 = v9;
      v13 = _Block_copy(aBlock);
      objc_msgSend(MEMORY[0x24BE3F268], "defaultScheduler");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (id)objc_msgSend(v14, "performWithQualityOfService:block:", 17, v13);

    }
    else
    {
      v21 = (void *)MEMORY[0x227676638]();
      v22 = self;
      HMFGetOSLogHandle();
      v23 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v33 = v24;
        _os_log_impl(&dword_2218F0000, v23, OS_LOG_TYPE_ERROR, "%{public}@ThreadClient did not respond to selector - startFWUpdate:isWedDevice:completion", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v21);
      objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 48);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, void *))v9 + 2))(v9, v25);

    }
  }
  else
  {
    v16 = (void *)MEMORY[0x227676638]();
    v17 = self;
    HMFGetOSLogHandle();
    v18 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v33 = v19;
      _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_INFO, "%{public}@Thread radio client is not available on this device", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v16);
    dispatch_get_global_queue(21, 0);
    v20 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __89__HMDThreadRadioClient_startFirmwareUpdateWithExtendedMACAddress_isWedDevice_completion___block_invoke;
    block[3] = &unk_24E799CC8;
    v31 = v9;
    dispatch_async(v20, block);

  }
}

- (void)stopFirmwareUpdateWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  HMDThreadRadioClient *v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  HMDThreadRadioClient *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  _QWORD aBlock[5];
  id v22;
  _QWORD block[4];
  id v24;
  uint8_t buf[4];
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDThreadRadioClient threadClient](self, "threadClient");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[HMDThreadRadioClient threadClient](self, "threadClient");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_opt_respondsToSelector();

    if ((v7 & 1) != 0)
    {
      aBlock[0] = MEMORY[0x24BDAC760];
      aBlock[1] = 3221225472;
      aBlock[2] = __57__HMDThreadRadioClient_stopFirmwareUpdateWithCompletion___block_invoke_144;
      aBlock[3] = &unk_24E79C2B8;
      aBlock[4] = self;
      v22 = v4;
      v8 = _Block_copy(aBlock);
      objc_msgSend(MEMORY[0x24BE3F268], "defaultScheduler");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (id)objc_msgSend(v9, "performWithQualityOfService:block:", 17, v8);

    }
    else
    {
      v16 = (void *)MEMORY[0x227676638]();
      v17 = self;
      HMFGetOSLogHandle();
      v18 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v26 = v19;
        _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_ERROR, "%{public}@ThreadClient did not respond to selector - stopFWUpdate:", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v16);
      objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 48);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, void *))v4 + 2))(v4, v20);

    }
  }
  else
  {
    v11 = (void *)MEMORY[0x227676638]();
    v12 = self;
    HMFGetOSLogHandle();
    v13 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v26 = v14;
      _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_INFO, "%{public}@Thread radio client is not available on this device", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v11);
    dispatch_get_global_queue(21, 0);
    v15 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __57__HMDThreadRadioClient_stopFirmwareUpdateWithCompletion___block_invoke;
    block[3] = &unk_24E799CC8;
    v24 = v4;
    dispatch_async(v15, block);

  }
}

- (void)setThreadMessageReliabilityParameters:(id)a3 activeRetransmitMs:(id)a4 activeThresholdMs:(id)a5 additionalRetransmitDelayMs:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  HMDThreadRadioClient *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  _BOOL4 v19;
  void *v20;
  HMDThreadRadioClient *v21;
  NSObject *v22;
  void *v23;
  int v24;
  void *v25;
  __int16 v26;
  id v27;
  __int16 v28;
  id v29;
  __int16 v30;
  id v31;
  __int16 v32;
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = (void *)MEMORY[0x227676638]();
  v15 = self;
  HMFGetOSLogHandle();
  v16 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 138544386;
    v25 = v17;
    v26 = 2112;
    v27 = v10;
    v28 = 2112;
    v29 = v11;
    v30 = 2112;
    v31 = v12;
    v32 = 2112;
    v33 = v13;
    _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_INFO, "%{public}@Updating thread message reliability parameters, idleRetransmitMs=%@, activeRetransmitMs=%@, activeThresholdMs=%@, additionalRetransmitDelayMs=%@", (uint8_t *)&v24, 0x34u);

  }
  objc_autoreleasePoolPop(v14);
  -[HMDThreadRadioClient threadClient](v15, "threadClient");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v18 == 0;

  if (v19)
  {
    v20 = (void *)MEMORY[0x227676638]();
    v21 = v15;
    HMFGetOSLogHandle();
    v22 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 138543362;
      v25 = v23;
      _os_log_impl(&dword_2218F0000, v22, OS_LOG_TYPE_INFO, "%{public}@Thread radio client is not available on this device, not setting thread reliability parameters", (uint8_t *)&v24, 0xCu);

    }
    objc_autoreleasePoolPop(v20);
  }
  else
  {
    MTRSetMessageReliabilityParameters();
  }

}

- (void)_updateThreadMessageReliabilityParametersWithUserDefinedValues:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  HMDThreadRadioClient *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  CFIndex AppIntegerValue;
  void *v13;
  CFIndex v14;
  void *v15;
  CFIndex v16;
  CFIndex v17;
  void *v18;
  int v19;
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v3 = a3;
  v23 = *MEMORY[0x24BDAC8D0];
  v5 = (void *)MEMORY[0x227676638](self, a2);
  v6 = self;
  HMFGetOSLogHandle();
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    HMFBooleanToString();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 138543618;
    v20 = v8;
    v21 = 2112;
    v22 = v9;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Should use user defined values for thread message reliability parameters: %@", (uint8_t *)&v19, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  if (v3)
  {
    LOBYTE(v19) = 0;
    v10 = (const __CFString *)*MEMORY[0x24BDBD580];
    v11 = &unk_24E96BE40;
    AppIntegerValue = CFPreferencesGetAppIntegerValue(CFSTR("matter.thread.idleRetransmitMs"), (CFStringRef)*MEMORY[0x24BDBD580], (Boolean *)&v19);
    if ((_BYTE)v19 && AppIntegerValue)
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", AppIntegerValue);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v13 = &unk_24E96BE40;
    v14 = CFPreferencesGetAppIntegerValue(CFSTR("matter.thread.activeRetransmitMs"), v10, (Boolean *)&v19);
    if ((_BYTE)v19 && v14)
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", v14);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v15 = &unk_24E96BE40;
    v16 = CFPreferencesGetAppIntegerValue(CFSTR("matter.thread.activeThresholdMs"), v10, (Boolean *)&v19);
    if ((_BYTE)v19 && v16)
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", v16);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v17 = CFPreferencesGetAppIntegerValue(CFSTR("matter.thread.additionalRetransmitDelayMs"), v10, (Boolean *)&v19);
    v18 = &unk_24E96BE40;
    if ((_BYTE)v19 && v17)
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v11 = &unk_24E96BE40;
    v13 = &unk_24E96BE40;
    v15 = &unk_24E96BE40;
    v18 = &unk_24E96BE40;
  }
  -[HMDThreadRadioClient setThreadMessageReliabilityParameters:activeRetransmitMs:activeThresholdMs:additionalRetransmitDelayMs:](v6, "setThreadMessageReliabilityParameters:activeRetransmitMs:activeThresholdMs:additionalRetransmitDelayMs:", v11, v13, v15, v18);

}

- (void)stopThreadNetworkWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  HMDThreadRadioClient *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  HMDThreadRadioClient *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  _QWORD v22[5];
  id v23;
  _QWORD block[4];
  id v25;
  uint8_t buf[4];
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDThreadRadioClient _updateThreadMessageReliabilityParametersWithUserDefinedValues:](self, "_updateThreadMessageReliabilityParametersWithUserDefinedValues:", 0);
  -[HMDThreadRadioClient threadClient](self, "threadClient");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x227676638]();
  v7 = self;
  if (v5)
  {
    HMFGetOSLogHandle();
    v8 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v27 = v9;
      _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@Scheduling an attempt to stop the thread network", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v6);
    -[HMDThreadRadioClient threadClient](v7, "threadClient");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_opt_respondsToSelector();

    if ((v11 & 1) != 0)
    {
      objc_msgSend(MEMORY[0x24BE3F268], "defaultScheduler");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v22[0] = MEMORY[0x24BDAC760];
      v22[1] = 3221225472;
      v22[2] = __56__HMDThreadRadioClient_stopThreadNetworkWithCompletion___block_invoke_156;
      v22[3] = &unk_24E79C2B8;
      v22[4] = v7;
      v23 = v4;
      v13 = (id)objc_msgSend(v12, "performWithQualityOfService:block:", 17, v22);

    }
    else
    {
      v17 = (void *)MEMORY[0x227676638]();
      v18 = v7;
      HMFGetOSLogHandle();
      v19 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v27 = v20;
        _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_ERROR, "%{public}@ThreadClient did not respond to selector - threadStopWithCompletion:", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v17);
      objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 48);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, void *))v4 + 2))(v4, v21);

    }
  }
  else
  {
    HMFGetOSLogHandle();
    v14 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v27 = v15;
      _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_INFO, "%{public}@Thread radio client is not available on this device", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v6);
    dispatch_get_global_queue(21, 0);
    v16 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __56__HMDThreadRadioClient_stopThreadNetworkWithCompletion___block_invoke;
    block[3] = &unk_24E799CC8;
    v25 = v4;
    dispatch_async(v16, block);

  }
}

- (void)registerForThreadNetworkEvents:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  HMDThreadRadioClient *v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  os_unfair_lock_lock_with_options();
  -[HMDThreadRadioClient observers](self, "observers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  -[HMDThreadRadioClient observers](self, "observers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v4);

  os_unfair_lock_unlock(&self->_lock);
  v8 = (void *)MEMORY[0x227676638]();
  v9 = self;
  if (v6)
  {
    HMFGetOSLogHandle();
    v10 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543362;
      v15 = v11;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@registerForThreadNetworkEvents - events already setup, reading and notifying current state", (uint8_t *)&v14, 0xCu);

    }
    objc_autoreleasePoolPop(v8);
    -[HMDThreadRadioClient _reportCurrentThreadState:](v9, "_reportCurrentThreadState:", v4);
  }
  else
  {
    HMFGetOSLogHandle();
    v12 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543362;
      v15 = v13;
      _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_INFO, "%{public}@registerForThreadNetworkEvents - setting up events for first observer", (uint8_t *)&v14, 0xCu);

    }
    objc_autoreleasePoolPop(v8);
    -[HMDThreadRadioClient _registerForThreadNetworkEvents](v9, "_registerForThreadNetworkEvents");
  }

}

- (void)unregisterForThreadNetworkEvents:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;

  v9 = a3;
  os_unfair_lock_lock_with_options();
  -[HMDThreadRadioClient observers](self, "observers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  -[HMDThreadRadioClient observers](self, "observers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObject:", v9);

  -[HMDThreadRadioClient observers](self, "observers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  os_unfair_lock_unlock(&self->_lock);
  if (!v8 && v5)
    -[HMDThreadRadioClient _unregisterForThreadNetworkEvents](self, "_unregisterForThreadNetworkEvents");

}

- (int64_t)_connectionStateFromString:(id)a3
{
  id v3;
  int64_t v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("uninitialized")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("uninitialized:fault")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("uninitialized:upgrading")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("offline:deep-sleep")) & 1) != 0
         || (objc_msgSend(v3, "isEqualToString:", CFSTR("offline")) & 1) != 0
         || (objc_msgSend(v3, "isEqualToString:", CFSTR("offline:commissioned")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("associating")) & 1) != 0
         || (objc_msgSend(v3, "isEqualToString:", CFSTR("associating:credentials-needed")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("associated")) & 1) != 0
         || (objc_msgSend(v3, "isEqualToString:", CFSTR("associated:no-parent")) & 1) != 0
         || (objc_msgSend(v3, "isEqualToString:", CFSTR("associated:netwake-asleep")) & 1) != 0)
  {
    v4 = 3;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("associated:netwake-waking")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int64_t)_nodeTypeFromString:(id)a3
{
  id v3;
  int64_t v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("unknown")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("sleepy-router")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("router")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("end-device")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("sleepy-end-device")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("synchronized-sleepy-end-device")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("commissioner")) & 1) != 0)
  {
    v4 = 6;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("leader")))
  {
    v4 = 7;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int64_t)_WEDConnectionStateFromStatus:(id)a3 disconnectReason:(id)a4
{
  id v5;
  id v6;
  int64_t v7;

  v5 = a3;
  v6 = a4;
  if ((objc_msgSend(v5, "isEqualToString:", CFSTR("wed_added")) & 1) != 0)
  {
    v7 = 1;
  }
  else if (objc_msgSend(v5, "isEqualToString:", CFSTR("wed_removed")))
  {
    if ((objc_msgSend(v6, "isEqualToString:", CFSTR("none")) & 1) != 0)
    {
      v7 = 2;
    }
    else if ((objc_msgSend(v6, "isEqualToString:", CFSTR("linkloss")) & 1) != 0)
    {
      v7 = 3;
    }
    else if (objc_msgSend(v6, "isEqualToString:", CFSTR("threadradiod-daemon-crash")))
    {
      v7 = 4;
    }
    else
    {
      v7 = 2;
    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)_WEDStateChangeEventFromThreadEvent:(shared_ptr<CtrXPC::Event>)a3
{
  CtrXPC::Event **var0;
  void *v5;
  NSObject *v6;
  id v7;
  _BYTE *v8;
  size_t count;
  __int128 v10;
  void *v11;
  size_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  HMDThreadRadioClient *v18;
  NSObject *v19;
  void *v20;
  uint64_t v21;
  HMDThreadNetworkWakeOnDeviceConnectionStateChangeEvent *v22;
  __int128 v24;
  HMDThreadRadioClient *v25;
  id v26;
  id v27;
  xpc_object_t xarray;
  _BYTE __p[12];
  __int16 v30;
  void *v31;
  char v32;
  uint8_t buf[4];
  id v34;
  __int16 v35;
  _BYTE *v36;
  uint64_t v37;

  var0 = (CtrXPC::Event **)a3.var0;
  v37 = *MEMORY[0x24BDAC8D0];
  v5 = (void *)MEMORY[0x227676638](self, a2, a3.var0, a3.var1);
  v25 = self;
  HMFGetOSLogHandle();
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (id)objc_claimAutoreleasedReturnValue();
    CtrXPC::Event::getName(*var0);
    if (v32 >= 0)
      v8 = __p;
    else
      v8 = *(_BYTE **)__p;
    *(_DWORD *)buf = 138543618;
    v34 = v7;
    v35 = 2080;
    v36 = v8;
    _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_INFO, "%{public}@Received thread event: event name - %s", buf, 0x16u);
    if (v32 < 0)
      operator delete(*(void **)__p);

  }
  objc_autoreleasePoolPop(v5);
  CtrXPC::Event::getDataValue(*var0);
  xarray = (xpc_object_t)objc_claimAutoreleasedReturnValue();
  count = xpc_array_get_count(xarray);
  if (count)
  {
    v11 = 0;
    v26 = 0;
    v27 = 0;
    v12 = 0;
    *(_QWORD *)&v10 = 138543618;
    v24 = v10;
    while (1)
    {
      xpc_array_get_dictionary(xarray, v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithCString:", xpc_dictionary_get_string(v13, "key"));
      v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithCString:", xpc_dictionary_get_string(v13, "value"));
      if (objc_msgSend(v14, "isEqualToString:", CFSTR("extendedMACAddress")))
      {
        objc_msgSend(v15, "stringByReplacingOccurrencesOfString:withString:", CFSTR(":"), &stru_24E79DB48);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v16, "uppercaseString");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else if (objc_msgSend(v14, "isEqualToString:", CFSTR("status")))
      {
        v16 = v27;
        v27 = v15;
      }
      else
      {
        if (!objc_msgSend(v14, "isEqualToString:", CFSTR("wed_unsolicted_disconnect")))
        {
          v17 = (void *)MEMORY[0x227676638]();
          v18 = v25;
          HMFGetOSLogHandle();
          v19 = (id)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
          {
            HMFGetLogIdentifier();
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)__p = v24;
            *(_QWORD *)&__p[4] = v20;
            v30 = 2112;
            v31 = v14;
            _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_DEBUG, "%{public}@Ignoring key: %@", __p, 0x16u);

          }
          objc_autoreleasePoolPop(v17);
          goto LABEL_17;
        }
        v16 = v26;
        v26 = v15;
      }

LABEL_17:
      if (count == ++v12)
        goto LABEL_23;
    }
  }
  v26 = 0;
  v27 = 0;
  v11 = 0;
LABEL_23:
  v21 = -[HMDThreadRadioClient _WEDConnectionStateFromStatus:disconnectReason:](v25, "_WEDConnectionStateFromStatus:disconnectReason:", v27, v26, v24);
  v22 = 0;
  if (v11 && v21)
    v22 = -[HMDThreadNetworkWakeOnDeviceConnectionStateChangeEvent initWitheMACAddress:connectionState:]([HMDThreadNetworkWakeOnDeviceConnectionStateChangeEvent alloc], "initWitheMACAddress:connectionState:", v11, v21);

  return v22;
}

- (void)_notifyObserversOfThreadNetworkEvent:(id)a3
{
  id v4;
  os_unfair_lock_s *p_lock;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  -[HMDThreadRadioClient observers](self, "observers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allObjects");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_lock);
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v8 = v7;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v13;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v11++), "threadNetworkStateChange:", v4, (_QWORD)v12);
      }
      while (v9 != v11);
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
  }

}

- (void)_notifyObserversOfThreadPreferredNetworkUpdatedEvent:(id)a3
{
  id v4;
  os_unfair_lock_s *p_lock;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  -[HMDThreadRadioClient observers](self, "observers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allObjects");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_lock);
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v8 = v7;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v13;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v11++), "threadPreferredNetworkUpdated:", v4, (_QWORD)v12);
      }
      while (v9 != v11);
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
  }

}

- (void)_notifyObserversOfThreadWakeOnDeviceConnectionStateEvent:(id)a3
{
  id v4;
  os_unfair_lock_s *p_lock;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  -[HMDThreadRadioClient observers](self, "observers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allObjects");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_lock);
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v8 = v7;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v13;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v11++), "threadWakeOnDeviceConnectionStateChange:", v4, (_QWORD)v12);
      }
      while (v9 != v11);
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
  }

}

- (void)_notifyObserversOfPeripheralDeviceNodeTypeEvent:(id)a3
{
  id v4;
  os_unfair_lock_s *p_lock;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  -[HMDThreadRadioClient observers](self, "observers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allObjects");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_lock);
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v8 = v7;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v13;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v11++), "threadPeripheralDeviceNodeTypeChange:", v4, (_QWORD)v12);
      }
      while (v9 != v11);
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
  }

}

- (void)_notifyObserversOfCallStateChangedEvent:(id)a3
{
  id v4;
  os_unfair_lock_s *p_lock;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  -[HMDThreadRadioClient observers](self, "observers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allObjects");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_lock);
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v8 = v7;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v14;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v8);
        v12 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v11);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v12, "threadBTCallStateChange:", v4, (_QWORD)v13);
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v9);
  }

}

- (void)_reportCurrentThreadState:(id)a3
{
  id v4;
  xpc_object_t v5;
  void *v6;
  void *v7;
  void *v8;
  HMDThreadRadioClient *v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  HMDThreadNetworkStateChangeEvent *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  HMDThreadRadioClient *v22;
  NSObject *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  HMDThreadNetworkStateChangeEvent *v30;
  void *__p[2];
  int __pa;
  void *__p_8;
  __int128 v34;
  signed __int8 v35;
  uint8_t buf[40];
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = xpc_dictionary_create(0, 0, 0);
  -[HMDThreadRadioClient threadClient](self, "threadClient");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "getProperty:output:", "NCP:State", v5);
  }
  else
  {
    *(_OWORD *)__p = 0u;
    v34 = 0u;
  }

  v8 = (void *)MEMORY[0x227676638]();
  v9 = self;
  if (LODWORD(__p[0]))
  {
    HMFGetOSLogHandle();
    v10 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v11;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_ERROR, "%{public}@failed to fetch kWPANTUNDProperty_NCPState", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v8);
  }
  else
  {
    HMFGetOSLogHandle();
    v12 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v13;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v5;
      _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_DEBUG, "%{public}@fetched kWPANTUNDProperty_NCPState got value =%@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v8);
    v14 = objc_alloc(MEMORY[0x24BDD17C8]);
    xpc_dictionary_get_value(v5, "PropVal");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v14, "initWithCString:", xpc_string_get_string_ptr(v15));

    v17 = -[HMDThreadNetworkStateChangeEvent initWithEventType:eventValue:]([HMDThreadNetworkStateChangeEvent alloc], "initWithEventType:eventValue:", 0, -[HMDThreadRadioClient _connectionStateFromString:](v9, "_connectionStateFromString:", v16));
    if (v4)
      objc_msgSend(v4, "threadNetworkStateChange:", v17);
    else
      -[HMDThreadRadioClient _notifyObserversOfThreadNetworkEvent:](v9, "_notifyObserversOfThreadNetworkEvent:", v17);

  }
  -[HMDThreadRadioClient threadClient](v9, "threadClient", __p[0]);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (v18)
  {
    objc_msgSend(v18, "getProperty:output:", "Network:NodeType", v5);
    v20 = *(_DWORD *)buf;
  }
  else
  {
    v20 = 0;
    memset(buf, 0, 32);
  }
  __pa = v20;
  if (SHIBYTE(v34) < 0)
    operator delete(__p[1]);
  __p_8 = *(void **)&buf[8];
  v35 = buf[31];
  buf[31] = 0;
  buf[8] = 0;

  v21 = (void *)MEMORY[0x227676638]();
  v22 = v9;
  if (__pa)
  {
    HMFGetOSLogHandle();
    v23 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v24;
      _os_log_impl(&dword_2218F0000, v23, OS_LOG_TYPE_ERROR, "%{public}@failed to fetch kWPANTUNDEvent_NetworkNodeType", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v21);
  }
  else
  {
    HMFGetOSLogHandle();
    v25 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v26;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v5;
      _os_log_impl(&dword_2218F0000, v25, OS_LOG_TYPE_DEBUG, "%{public}@fetched kWPANTUNDEvent_NetworkNodeType got value =%@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v21);
    v27 = objc_alloc(MEMORY[0x24BDD17C8]);
    xpc_dictionary_get_value(v5, "PropVal");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = (void *)objc_msgSend(v27, "initWithCString:", xpc_string_get_string_ptr(v28));

    v30 = -[HMDThreadNetworkStateChangeEvent initWithEventType:eventValue:]([HMDThreadNetworkStateChangeEvent alloc], "initWithEventType:eventValue:", 1, -[HMDThreadRadioClient _nodeTypeFromString:](v22, "_nodeTypeFromString:", v29));
    -[HMDThreadRadioClient _notifyObserversOfThreadNetworkEvent:](v22, "_notifyObserversOfThreadNetworkEvent:", v30);
    if (v4)
      objc_msgSend(v4, "threadNetworkStateChange:", v30);
    else
      -[HMDThreadRadioClient _notifyObserversOfThreadNetworkEvent:](v22, "_notifyObserversOfThreadNetworkEvent:", v30);

  }
  if (v35 < 0)
    operator delete(__p_8);

}

- (void)_registerForThreadNetworkEvents
{
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  HMDThreadRadioClient *v22;
  NSObject *v23;
  void *v24;
  id v25;
  _QWORD v26[4];
  id v27;
  id v28;
  _QWORD v29[4];
  id v30;
  id v31;
  _QWORD v32[4];
  id v33;
  id v34;
  _QWORD v35[4];
  id v36;
  id v37;
  _QWORD v38[4];
  id v39;
  id location;
  _BYTE buf[12];
  char v42;
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  -[HMDThreadRadioClient threadClient](self, "threadClient");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_initWeak(&location, self);
    -[HMDThreadRadioClient threadClient](self, "threadClient");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    std::string::basic_string[abi:ne180100]<0>(buf, "NCP:State");
    v5 = MEMORY[0x24BDAC760];
    v38[0] = MEMORY[0x24BDAC760];
    v38[1] = 3221225472;
    v38[2] = __55__HMDThreadRadioClient__registerForThreadNetworkEvents__block_invoke;
    v38[3] = &unk_24E789C08;
    objc_copyWeak(&v39, &location);
    -[HMDThreadRadioClient threadEventQueue](self, "threadEventQueue");
    v37 = (id)objc_claimAutoreleasedReturnValue();
    v6 = v37;
    objc_msgSend(v4, "setEventHandler:EventBlock:dqueue:", buf, v38, &v37);
    v7 = v37;
    v37 = 0;

    if (v42 < 0)
      operator delete(*(void **)buf);

    -[HMDThreadRadioClient threadClient](self, "threadClient");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    std::string::basic_string[abi:ne180100]<0>(buf, "Network:NodeType");
    v35[0] = v5;
    v35[1] = 3221225472;
    v35[2] = __55__HMDThreadRadioClient__registerForThreadNetworkEvents__block_invoke_229;
    v35[3] = &unk_24E789C08;
    objc_copyWeak(&v36, &location);
    -[HMDThreadRadioClient threadEventQueue](self, "threadEventQueue");
    v34 = (id)objc_claimAutoreleasedReturnValue();
    v9 = v34;
    objc_msgSend(v8, "setEventHandler:EventBlock:dqueue:", buf, v35, &v34);
    v10 = v34;
    v34 = 0;

    if (v42 < 0)
      operator delete(*(void **)buf);

    -[HMDThreadRadioClient threadClient](self, "threadClient");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    std::string::basic_string[abi:ne180100]<0>(buf, "WakeOnDeviceConnectionStatus");
    v32[0] = v5;
    v32[1] = 3221225472;
    v32[2] = __55__HMDThreadRadioClient__registerForThreadNetworkEvents__block_invoke_231;
    v32[3] = &unk_24E789C08;
    objc_copyWeak(&v33, &location);
    -[HMDThreadRadioClient threadEventQueue](self, "threadEventQueue");
    v31 = (id)objc_claimAutoreleasedReturnValue();
    v12 = v31;
    objc_msgSend(v11, "setEventHandler:EventBlock:dqueue:", buf, v32, &v31);
    v13 = v31;
    v31 = 0;

    if (v42 < 0)
      operator delete(*(void **)buf);

    -[HMDThreadRadioClient threadClient](self, "threadClient");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    std::string::basic_string[abi:ne180100]<0>(buf, "PeripheralDeviceType");
    v29[0] = v5;
    v29[1] = 3221225472;
    v29[2] = __55__HMDThreadRadioClient__registerForThreadNetworkEvents__block_invoke_233;
    v29[3] = &unk_24E789C08;
    objc_copyWeak(&v30, &location);
    -[HMDThreadRadioClient threadEventQueue](self, "threadEventQueue");
    v28 = (id)objc_claimAutoreleasedReturnValue();
    v15 = v28;
    objc_msgSend(v14, "setEventHandler:EventBlock:dqueue:", buf, v29, &v28);
    v16 = v28;
    v28 = 0;

    if (v42 < 0)
      operator delete(*(void **)buf);

    -[HMDThreadRadioClient threadClient](self, "threadClient");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    std::string::basic_string[abi:ne180100]<0>(buf, "bt_airpod_esco");
    v26[0] = v5;
    v26[1] = 3221225472;
    v26[2] = __55__HMDThreadRadioClient__registerForThreadNetworkEvents__block_invoke_236;
    v26[3] = &unk_24E789C08;
    objc_copyWeak(&v27, &location);
    -[HMDThreadRadioClient threadEventQueue](self, "threadEventQueue");
    v25 = (id)objc_claimAutoreleasedReturnValue();
    v18 = v25;
    objc_msgSend(v17, "setEventHandler:EventBlock:dqueue:", buf, v26, &v25);
    v19 = v25;
    v25 = 0;

    if (v42 < 0)
      operator delete(*(void **)buf);

    -[HMDThreadRadioClient threadClient](self, "threadClient");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setClientEventsOn");

    -[HMDThreadRadioClient _reportCurrentThreadState:](self, "_reportCurrentThreadState:", 0);
    objc_destroyWeak(&v27);
    objc_destroyWeak(&v30);
    objc_destroyWeak(&v33);
    objc_destroyWeak(&v36);
    objc_destroyWeak(&v39);
    objc_destroyWeak(&location);
  }
  else
  {
    v21 = (void *)MEMORY[0x227676638]();
    v22 = self;
    HMFGetOSLogHandle();
    v23 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v24;
      _os_log_impl(&dword_2218F0000, v23, OS_LOG_TYPE_INFO, "%{public}@Thread radio client is not available on this device", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v21);
  }
}

- (void)_unregisterForThreadNetworkEvents
{
  void *v3;
  HMDThreadRadioClient *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  HMDThreadRadioClient *v11;
  NSObject *v12;
  void *v13;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x227676638](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138543362;
    v15 = v6;
    _os_log_impl(&dword_2218F0000, v5, OS_LOG_TYPE_ERROR, "%{public}@registerForThreadNetworkEvents", (uint8_t *)&v14, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  -[HMDThreadRadioClient threadClient](v4, "threadClient");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7 == 0;

  if (v8)
  {
    v10 = (void *)MEMORY[0x227676638]();
    v11 = v4;
    HMFGetOSLogHandle();
    v12 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543362;
      v15 = v13;
      _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_INFO, "%{public}@Thread radio client is not available on this device", (uint8_t *)&v14, 0xCu);

    }
    objc_autoreleasePoolPop(v10);
  }
  else
  {
    -[HMDThreadRadioClient threadClient](v4, "threadClient");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setClientEventsOff");

  }
}

- (BOOL)isThreadNetworkUp
{
  return self->_threadNetworkUp;
}

- (void)triggerThreadNetworkStateCaptureWithCompletion:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  void *v8;
  NSObject *v9;
  id v10;
  _QWORD block[5];
  id v12;
  _QWORD v13[4];
  id v14;

  v4 = a3;
  -[HMDThreadRadioClient threadClient](self, "threadClient");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[HMDThreadRadioClient threadStateCaptureQueue](self, "threadStateCaptureQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __71__HMDThreadRadioClient_triggerThreadNetworkStateCaptureWithCompletion___block_invoke_2;
    block[3] = &unk_24E79C2B8;
    block[4] = self;
    v12 = v4;
    v7 = v4;
    dispatch_async(v6, block);

    v8 = v12;
  }
  else
  {
    dispatch_get_global_queue(21, 0);
    v9 = objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __71__HMDThreadRadioClient_triggerThreadNetworkStateCaptureWithCompletion___block_invoke;
    v13[3] = &unk_24E799CC8;
    v14 = v4;
    v10 = v4;
    dispatch_async(v9, v13);

    v8 = v14;
  }

}

- (void)triggerThreadNetworkStateCaptureForAccessories:(id)a3 isSessionFailure:(BOOL)a4 withCompletion:(id)a5
{
  id v7;
  void *v8;
  NSObject *v9;
  id v10;
  void *v11;
  NSObject *v12;
  id v13;
  _QWORD v14[5];
  id v15;
  BOOL v16;
  _QWORD block[4];
  id v18;

  v7 = a5;
  -[HMDThreadRadioClient threadClient](self, "threadClient");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[HMDThreadRadioClient threadStateCaptureQueue](self, "threadStateCaptureQueue");
    v9 = objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __103__HMDThreadRadioClient_triggerThreadNetworkStateCaptureForAccessories_isSessionFailure_withCompletion___block_invoke_2;
    v14[3] = &unk_24E78D3F8;
    v16 = a4;
    v14[4] = self;
    v15 = v7;
    v10 = v7;
    dispatch_async(v9, v14);

    v11 = v15;
  }
  else
  {
    dispatch_get_global_queue(21, 0);
    v12 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __103__HMDThreadRadioClient_triggerThreadNetworkStateCaptureForAccessories_isSessionFailure_withCompletion___block_invoke;
    block[3] = &unk_24E799CC8;
    v18 = v7;
    v13 = v7;
    dispatch_async(v12, block);

    v11 = v18;
  }

}

- (void)informThreadLayerOfResidentChange:(BOOL)a3 primaryResidentIsThreadCapable:(BOOL)a4
{
  void *v7;
  NSObject *v8;
  _QWORD v9[5];
  BOOL v10;
  BOOL v11;

  -[HMDThreadRadioClient threadClient](self, "threadClient");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[HMDThreadRadioClient threadStateCaptureQueue](self, "threadStateCaptureQueue");
    v8 = objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __89__HMDThreadRadioClient_informThreadLayerOfResidentChange_primaryResidentIsThreadCapable___block_invoke;
    v9[3] = &unk_24E789C58;
    v9[4] = self;
    v10 = a3;
    v11 = a4;
    dispatch_async(v8, v9);

  }
}

- (BOOL)shouldInformThreadOfResidentChange:(BOOL)a3 primaryResidentIsThreadCapable:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL4 v5;
  int64_t v6;

  v4 = a4;
  v5 = a3;
  v6 = -[HMDThreadRadioClient threadLayerInformedResidentState](self, "threadLayerInformedResidentState");
  if (v5)
  {
    if (v6 == 1)
      return 0;
  }
  else if (v4)
  {
    if (v6 == 2)
      return 0;
  }
  else if (v6 == 3)
  {
    return 0;
  }
  return 1;
}

- (CtrClient)threadClient
{
  return self->_threadClient;
}

- (void)setThreadClient:(id)a3
{
  objc_storeStrong((id *)&self->_threadClient, a3);
}

- (OS_dispatch_queue)threadStateCaptureQueue
{
  return self->_threadStateCaptureQueue;
}

- (BOOL)threadNetworkUp
{
  return self->_threadNetworkUp;
}

- (int64_t)threadLayerInformedResidentState
{
  return self->_threadLayerInformedResidentState;
}

- (void)setThreadLayerInformedResidentState:(int64_t)a3
{
  self->_threadLayerInformedResidentState = a3;
}

- (HMDThreadCommandTimer)deferredCommandTimer
{
  return self->_deferredCommandTimer;
}

- (void)setDeferredCommandTimer:(id)a3
{
  objc_storeStrong((id *)&self->_deferredCommandTimer, a3);
}

- (OS_dispatch_queue)threadEventQueue
{
  return self->_threadEventQueue;
}

- (NSHashTable)observers
{
  return (NSHashTable *)objc_getProperty(self, a2, 56, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_threadEventQueue, 0);
  objc_storeStrong((id *)&self->_deferredCommandTimer, 0);
  objc_storeStrong((id *)&self->_threadStateCaptureQueue, 0);
  objc_storeStrong((id *)&self->_threadClient, 0);
}

void __89__HMDThreadRadioClient_informThreadLayerOfResidentChange_primaryResidentIsThreadCapable___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  NSObject *v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  uint64_t v24;
  uint64_t v25;
  std::ios_base *v26;
  char *v27;
  void **v28;
  uint64_t v29;
  uint64_t v30;
  void **v31;
  uint64_t v32;
  size_t v33;
  void **v34;
  unint64_t v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void **v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  NSObject *v45;
  void *v46;
  void *v47[2];
  __int128 v48;
  void *__dst[2];
  int64_t v50;
  void *__p[2];
  unsigned __int8 v52;
  _BYTE buf[22];
  __int16 v54;
  void *v55;
  unint64_t v56;
  void *__src;
  unint64_t v58;
  __int128 v59;
  __int128 v60;
  int v61;
  _QWORD v62[22];

  v62[19] = *MEMORY[0x24BDAC8D0];
  if ((objc_msgSend(*(id *)(a1 + 32), "shouldInformThreadOfResidentChange:primaryResidentIsThreadCapable:", *(unsigned __int8 *)(a1 + 40), *(unsigned __int8 *)(a1 + 41)) & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "threadClient");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v2;
    if (v2)
    {
      objc_msgSend(v2, "updatePrimaryResident:isPrimaryResidentThreadCapable:primaryResidentInfo:", *(unsigned __int8 *)(a1 + 40), *(unsigned __int8 *)(a1 + 41), 0);
    }
    else
    {
      *(_OWORD *)v47 = 0u;
      v48 = 0u;
    }

    v8 = 23;
    switch(LODWORD(v47[0]))
    {
      case 0:
        v9 = (void *)MEMORY[0x227676638]();
        v10 = *(id *)(a1 + 32);
        HMFGetOSLogHandle();
        v11 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        {
          HMFGetLogIdentifier();
          v12 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", *(unsigned __int8 *)(a1 + 40));
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", *(unsigned __int8 *)(a1 + 41));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          *(_QWORD *)&buf[4] = v12;
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v13;
          v54 = 2112;
          v55 = v14;
          _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_DEBUG, "%{public}@Successfully informed Thread layer of primary resident change (isPrimary=%@ primaryThreadCapable=%@)", buf, 0x20u);

        }
        objc_autoreleasePoolPop(v9);
        if (*(_BYTE *)(a1 + 40))
        {
          v15 = 1;
        }
        else if (*(_BYTE *)(a1 + 41))
        {
          v15 = 2;
        }
        else
        {
          v15 = 3;
        }
        objc_msgSend(*(id *)(a1 + 32), "setThreadLayerInformedResidentState:", v15, v47[0]);
        goto LABEL_68;
      case 4:
        goto LABEL_20;
      case 5:
        v8 = 48;
        goto LABEL_20;
      case 6:
        v8 = 15;
        goto LABEL_20;
      case 7:
        v8 = 10;
        goto LABEL_20;
      case 9:
        v8 = 27;
        goto LABEL_20;
      case 0xA:
        v8 = 3;
        goto LABEL_20;
      case 0xC:
        v8 = 80;
        goto LABEL_20;
      default:
        v8 = 52;
LABEL_20:
        v16 = (void *)MEMORY[0x227676638]();
        objc_opt_class();
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        HMFGetOSLogHandle();
        v18 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        {
          HMFGetLogIdentifier();
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          *(_QWORD *)&buf[4] = v19;
          *(_WORD *)&buf[12] = 2048;
          *(_QWORD *)&buf[14] = LODWORD(v47[0]);
          v54 = 2048;
          v55 = (void *)v8;
          _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_DEBUG, "%{public}@CoreThreadRadio result code %lu mapped to HMErrorCode %lu", buf, 0x20u);

        }
        objc_autoreleasePoolPop(v16);
        v20 = (void *)MEMORY[0x24BDD17C8];
        v21 = MEMORY[0x24BEDB870];
        v22 = MEMORY[0x24BEDB870] + 64;
        v23 = (_QWORD *)MEMORY[0x24BEDB800];
        v24 = *(_QWORD *)(MEMORY[0x24BEDB800] + 8);
        v25 = *(_QWORD *)(MEMORY[0x24BEDB800] + 16);
        v62[0] = MEMORY[0x24BEDB870] + 64;
        *(_QWORD *)buf = v24;
        *(_QWORD *)&buf[*(_QWORD *)(v24 - 24)] = v25;
        v26 = (std::ios_base *)&buf[*(_QWORD *)(*(_QWORD *)buf - 24)];
        std::ios_base::init(v26, &buf[8]);
        v26[1].__vftable = 0;
        v26[1].__fmtflags_ = -1;
        *(_QWORD *)buf = v21 + 24;
        v62[0] = v22;
        std::streambuf::basic_streambuf();
        *(_QWORD *)&buf[8] = MEMORY[0x24BEDB848] + 16;
        v59 = 0u;
        v60 = 0u;
        v61 = 16;
        std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(buf, (uint64_t)"Result:'", 8);
        if (LODWORD(v47[0]) > 0xE)
          v27 = "kInvalidErrorCode";
        else
          v27 = off_24E789C78[LODWORD(v47[0])];
        std::string::basic_string[abi:ne180100]<0>(__p, v27);
        if ((v52 & 0x80u) == 0)
          v28 = __p;
        else
          v28 = (void **)__p[0];
        if ((v52 & 0x80u) == 0)
          v29 = v52;
        else
          v29 = (uint64_t)__p[1];
        std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(buf, (uint64_t)v28, v29);
        std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(buf, (uint64_t)"'", 1);
        if ((char)v52 < 0)
          operator delete(__p[0]);
        v30 = HIBYTE(v48);
        if (v48 < 0)
          v30 = v48;
        if (v30)
        {
          std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(buf, (uint64_t)" Info:'", 7);
          if (v48 >= 0)
            v31 = &v47[1];
          else
            v31 = (void **)v47[1];
          if (v48 >= 0)
            v32 = HIBYTE(v48);
          else
            v32 = v48;
          std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(buf, (uint64_t)v31, v32);
          std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(buf, (uint64_t)"'", 1);
        }
        if ((v61 & 0x10) != 0)
        {
          v35 = *((_QWORD *)&v60 + 1);
          if (*((_QWORD *)&v60 + 1) < v58)
          {
            *((_QWORD *)&v60 + 1) = v58;
            v35 = v58;
          }
          v36 = __src;
        }
        else
        {
          if ((v61 & 8) == 0)
          {
            v33 = 0;
            HIBYTE(v50) = 0;
            v34 = __dst;
            goto LABEL_58;
          }
          v36 = v55;
          v35 = v56;
        }
        v33 = v35 - (_QWORD)v36;
        if (v35 - (unint64_t)v36 >= 0x7FFFFFFFFFFFFFF8)
          std::string::__throw_length_error[abi:ne180100]();
        if (v33 >= 0x17)
        {
          v37 = (v33 & 0xFFFFFFFFFFFFFFF8) + 8;
          if ((v33 | 7) != 0x17)
            v37 = v33 | 7;
          v38 = v37 + 1;
          v34 = (void **)operator new(v37 + 1);
          __dst[1] = (void *)v33;
          v50 = v38 | 0x8000000000000000;
          __dst[0] = v34;
        }
        else
        {
          HIBYTE(v50) = v35 - (_BYTE)v36;
          v34 = __dst;
          if (!v33)
            goto LABEL_58;
        }
        memmove(v34, v36, v33);
LABEL_58:
        v39 = MEMORY[0x24BEDB848];
        *((_BYTE *)v34 + v33) = 0;
        *(_QWORD *)buf = *v23;
        *(_QWORD *)&buf[*(_QWORD *)(*(_QWORD *)buf - 24)] = v23[3];
        *(_QWORD *)&buf[8] = v39 + 16;
        if (SBYTE7(v60) < 0)
          operator delete((void *)v59);
        std::streambuf::~streambuf();
        std::ostream::~ostream();
        MEMORY[0x227675D20](v62);
        if (v50 >= 0)
          v40 = __dst;
        else
          v40 = (void **)__dst[0];
        objc_msgSend(v20, "stringWithCString:encoding:", v40, 4, v47[0]);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        if (SHIBYTE(v50) < 0)
          operator delete(__dst[0]);
        objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:description:reason:suggestion:", v8, 0, v41, 0);
        v42 = (void *)objc_claimAutoreleasedReturnValue();

        v43 = (void *)MEMORY[0x227676638]();
        v44 = *(id *)(a1 + 32);
        HMFGetOSLogHandle();
        v45 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          *(_QWORD *)&buf[4] = v46;
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v42;
          _os_log_impl(&dword_2218F0000, v45, OS_LOG_TYPE_ERROR, "%{public}@Failed to inform Thread layer of primary resident update: %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v43);

LABEL_68:
        if (SHIBYTE(v48) < 0)
          operator delete(v47[1]);
        break;
    }
  }
  else
  {
    v4 = (void *)MEMORY[0x227676638]();
    v5 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v6 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v7;
      _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_INFO, "%{public}@Not informing Thread layer of primary resident change as state has not changed.", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v4);
  }
}

void __103__HMDThreadRadioClient_triggerThreadNetworkStateCaptureForAccessories_isSessionFailure_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 48);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, _QWORD))(v1 + 16))(v1, 0, 0);

}

void __103__HMDThreadRadioClient_triggerThreadNetworkStateCaptureForAccessories_isSessionFailure_withCompletion___block_invoke_2(uint64_t a1)
{
  void *v2;
  _BOOL8 v3;
  _QWORD v4[4];
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "threadClient");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_BYTE *)(a1 + 48) == 0;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __103__HMDThreadRadioClient_triggerThreadNetworkStateCaptureForAccessories_isSessionFailure_withCompletion___block_invoke_3;
  v4[3] = &unk_24E789C30;
  v5 = *(id *)(a1 + 40);
  objc_msgSend(v2, "captureTriggerData:triggerId:accessoryInfoList:completionHandler:", 0, v3, 0, v4);

}

void __103__HMDThreadRadioClient_triggerThreadNetworkStateCaptureForAccessories_isSessionFailure_withCompletion___block_invoke_3(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  char v22;
  id v23;

  v23 = a2;
  v7 = a3;
  v8 = a4;
  if (v23)
  {
    if (!v8)
    {
LABEL_5:
      if (objc_msgSend(v23, "duration"))
        v11 = v23;
      else
        v11 = v7;
      v12 = v11;
      v13 = *(_QWORD *)(a1 + 32);
      v14 = objc_alloc(MEMORY[0x24BDBCE70]);
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", objc_msgSend(v12, "num_border_routers_advertised"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", objc_msgSend(v12, "num_apple_BRs"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", objc_msgSend(v12, "num_border_routers_advertised"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", objc_msgSend(v12, "num_border_routers_advertised"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", objc_msgSend(v12, "num_border_routers_advertised"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (void *)objc_msgSend(v14, "initWithObjectsAndKeys:", v15, CFSTR("numAdvertisedBRs"), v16, CFSTR("numAppleBRs"), v17, CFSTR("numThirdPartyBRs"), v18, CFSTR("numThreadNetworks"), v19, CFSTR("maxSimuIPPrefixesDetected"), 0);
      (*(void (**)(uint64_t, void *, _QWORD, _QWORD))(v13 + 16))(v13, v20, 0, 0);

      goto LABEL_16;
    }
    objc_msgSend(v8, "domain");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v9, "isEqualToString:", CFSTR("com.threadradiod.ctr")) & 1) != 0)
    {
      v10 = objc_msgSend(v8, "code");

      if (!v10)
        goto LABEL_5;
    }
    else
    {

    }
    v22 = 0;
    v21 = *(_QWORD *)(a1 + 32);
    goto LABEL_13;
  }
  v21 = *(_QWORD *)(a1 + 32);
  if (v8)
  {
    v22 = 0;
LABEL_13:
    v12 = v8;
    goto LABEL_15;
  }
  objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 52);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  v22 = 1;
LABEL_15:
  (*(void (**)(uint64_t, _QWORD, _QWORD, id))(v21 + 16))(v21, 0, 0, v12);
  if ((v22 & 1) != 0)
LABEL_16:

}

void __71__HMDThreadRadioClient_triggerThreadNetworkStateCaptureWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 48);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD))(v1 + 16))(v1, 0);

}

void __71__HMDThreadRadioClient_triggerThreadNetworkStateCaptureWithCompletion___block_invoke_2(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "threadClient");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __71__HMDThreadRadioClient_triggerThreadNetworkStateCaptureWithCompletion___block_invoke_3;
  v3[3] = &unk_24E789C30;
  v4 = *(id *)(a1 + 40);
  objc_msgSend(v2, "captureTriggerData:triggerId:accessoryInfoList:completionHandler:", 0, 2, 0, v3);

}

void __71__HMDThreadRadioClient_triggerThreadNetworkStateCaptureWithCompletion___block_invoke_3(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  HMDThreadNetworkStatusReport *v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  id v17;

  v17 = a2;
  v7 = a3;
  v8 = a4;
  if (v17)
  {
    if (!v8)
    {
LABEL_5:
      if (objc_msgSend(v17, "duration"))
        v11 = v17;
      else
        v11 = v7;
      v12 = v11;
      v16 = *(_QWORD *)(a1 + 32);
      v13 = -[HMDThreadNetworkStatusReport initWithNumAdvertisedBRs:numAppleBRs:numThirdPartyBRs:numThreadNetworks:maxSimuIPPrefixesDetected:txTotal:txSuccess:txDelayAvg:rxTotal:rxSuccess:reportDuration:]([HMDThreadNetworkStatusReport alloc], "initWithNumAdvertisedBRs:numAppleBRs:numThirdPartyBRs:numThreadNetworks:maxSimuIPPrefixesDetected:txTotal:txSuccess:txDelayAvg:rxTotal:rxSuccess:reportDuration:", objc_msgSend(v12, "num_border_routers_advertised"), objc_msgSend(v12, "num_apple_BRs"), objc_msgSend(v12, "num_thirdparty_BRs"), objc_msgSend(v12, "num_thread_networks"), objc_msgSend(v12, "max_simultaneous_prefix_detected"), objc_msgSend(v12, "tx_total"), objc_msgSend(v12, "tx_total_success"), objc_msgSend(v12, "tx_delayavg"), objc_msgSend(v12, "rx_total"), objc_msgSend(v12, "rx_total_success"), objc_msgSend(v12, "duration"));
      (*(void (**)(uint64_t, HMDThreadNetworkStatusReport *, _QWORD))(v16 + 16))(v16, v13, 0);

      goto LABEL_16;
    }
    objc_msgSend(v8, "domain");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v9, "isEqualToString:", CFSTR("com.threadradiod.ctr")) & 1) != 0)
    {
      v10 = objc_msgSend(v8, "code");

      if (!v10)
        goto LABEL_5;
    }
    else
    {

    }
    v15 = 0;
    v14 = *(_QWORD *)(a1 + 32);
    goto LABEL_13;
  }
  v14 = *(_QWORD *)(a1 + 32);
  if (v8)
  {
    v15 = 0;
LABEL_13:
    v12 = v8;
    goto LABEL_15;
  }
  objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 52);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  v15 = 1;
LABEL_15:
  (*(void (**)(uint64_t, _QWORD, id))(v14 + 16))(v14, 0, v12);
  if ((v15 & 1) != 0)
LABEL_16:

}

void __55__HMDThreadRadioClient__registerForThreadNetworkEvents__block_invoke(uint64_t a1, CtrXPC::Event **a2)
{
  id WeakRetained;
  void *v4;
  id v5;
  NSObject *v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *p_p;
  id v11;
  void *v12;
  void *v13;
  HMDThreadNetworkStateChangeEvent *v14;
  void *__p;
  char v16;
  uint8_t buf[4];
  id v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v4 = (void *)MEMORY[0x227676638]();
    v5 = WeakRetained;
    HMFGetOSLogHandle();
    v6 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v7 = (id)objc_claimAutoreleasedReturnValue();
      CtrXPC::Event::getName(*a2);
      CtrXPC::Event::getDataValue(*a2);
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = (void *)v8;
      p_p = &__p;
      *(_DWORD *)buf = 138543874;
      if (v16 < 0)
        p_p = __p;
      v18 = v7;
      v19 = 2080;
      v20 = p_p;
      v21 = 2112;
      v22 = v8;
      _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_DEBUG, "%{public}@Received thread event: event name - %s, value =%@", buf, 0x20u);
      if (v16 < 0)
        operator delete(__p);

    }
    objc_autoreleasePoolPop(v4);
    v11 = objc_alloc(MEMORY[0x24BDD17C8]);
    CtrXPC::Event::getDataValue(*a2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v11, "initWithCString:", xpc_string_get_string_ptr(v12));

    v14 = -[HMDThreadNetworkStateChangeEvent initWithEventType:eventValue:]([HMDThreadNetworkStateChangeEvent alloc], "initWithEventType:eventValue:", 0, objc_msgSend(v5, "_connectionStateFromString:", v13));
    objc_msgSend(v5, "_notifyObserversOfThreadNetworkEvent:", v14);

  }
}

void __55__HMDThreadRadioClient__registerForThreadNetworkEvents__block_invoke_229(uint64_t a1, CtrXPC::Event **a2)
{
  id WeakRetained;
  void *v4;
  id v5;
  NSObject *v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *p_p;
  id v11;
  void *v12;
  void *v13;
  HMDThreadNetworkStateChangeEvent *v14;
  void *__p;
  char v16;
  uint8_t buf[4];
  id v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v4 = (void *)MEMORY[0x227676638]();
    v5 = WeakRetained;
    HMFGetOSLogHandle();
    v6 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v7 = (id)objc_claimAutoreleasedReturnValue();
      CtrXPC::Event::getName(*a2);
      CtrXPC::Event::getDataValue(*a2);
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = (void *)v8;
      p_p = &__p;
      *(_DWORD *)buf = 138543874;
      if (v16 < 0)
        p_p = __p;
      v18 = v7;
      v19 = 2080;
      v20 = p_p;
      v21 = 2112;
      v22 = v8;
      _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_DEBUG, "%{public}@Received thread event: event name - %s, value =%@", buf, 0x20u);
      if (v16 < 0)
        operator delete(__p);

    }
    objc_autoreleasePoolPop(v4);
    v11 = objc_alloc(MEMORY[0x24BDD17C8]);
    CtrXPC::Event::getDataValue(*a2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v11, "initWithCString:", xpc_string_get_string_ptr(v12));

    v14 = -[HMDThreadNetworkStateChangeEvent initWithEventType:eventValue:]([HMDThreadNetworkStateChangeEvent alloc], "initWithEventType:eventValue:", 1, objc_msgSend(v5, "_nodeTypeFromString:", v13));
    objc_msgSend(v5, "_notifyObserversOfThreadNetworkEvent:", v14);

  }
}

void __55__HMDThreadRadioClient__registerForThreadNetworkEvents__block_invoke_231(uint64_t a1, uint64_t a2)
{
  id WeakRetained;
  void *v4;
  std::__shared_weak_count *v5;
  unint64_t *p_shared_owners;
  unint64_t v7;
  uint64_t v8;
  void *v9;
  std::__shared_weak_count *v10;
  unint64_t *v11;
  unint64_t v12;
  void *v13;
  id v14;
  NSObject *v15;
  id v16;
  void *p_p;
  void *__p;
  char v19;
  CtrXPC::Event *v20;
  std::__shared_weak_count *v21;
  uint8_t buf[4];
  id v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    v5 = *(std::__shared_weak_count **)(a2 + 8);
    v20 = *(CtrXPC::Event **)a2;
    v21 = v5;
    if (v5)
    {
      p_shared_owners = (unint64_t *)&v5->__shared_owners_;
      do
        v7 = __ldxr(p_shared_owners);
      while (__stxr(v7 + 1, p_shared_owners));
    }
    objc_msgSend(WeakRetained, "_WEDStateChangeEventFromThreadEvent:", &v20);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v8;
    v10 = v21;
    if (!v21)
      goto LABEL_9;
    v11 = (unint64_t *)&v21->__shared_owners_;
    do
      v12 = __ldaxr(v11);
    while (__stlxr(v12 - 1, v11));
    if (!v12)
    {
      ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
      std::__shared_weak_count::__release_weak(v10);
      if (v9)
        goto LABEL_10;
    }
    else
    {
LABEL_9:
      if (v8)
      {
LABEL_10:
        objc_msgSend(v4, "_notifyObserversOfThreadWakeOnDeviceConnectionStateEvent:", v9);
LABEL_20:

        goto LABEL_21;
      }
    }
    v13 = (void *)MEMORY[0x227676638]();
    v14 = v4;
    HMFGetOSLogHandle();
    v15 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v16 = (id)objc_claimAutoreleasedReturnValue();
      CtrXPC::Event::getName(*(CtrXPC::Event **)a2);
      if (v19 >= 0)
        p_p = &__p;
      else
        p_p = __p;
      *(_DWORD *)buf = 138543618;
      v23 = v16;
      v24 = 2080;
      v25 = p_p;
      _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_INFO, "%{public}@Ignoring thread event: event name - %s", buf, 0x16u);
      if (v19 < 0)
        operator delete(__p);

    }
    objc_autoreleasePoolPop(v13);
    goto LABEL_20;
  }
LABEL_21:

}

void __55__HMDThreadRadioClient__registerForThreadNetworkEvents__block_invoke_233(uint64_t a1, CtrXPC::Event **a2)
{
  id WeakRetained;
  void *v4;
  id v5;
  NSObject *v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *p_p;
  id v11;
  void *v12;
  void *v13;
  HMDThreadNetworkPeripheralDeviceNodeTypeEvent *v14;
  void *__p;
  char v16;
  uint8_t buf[4];
  id v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v4 = (void *)MEMORY[0x227676638]();
    v5 = WeakRetained;
    HMFGetOSLogHandle();
    v6 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v7 = (id)objc_claimAutoreleasedReturnValue();
      CtrXPC::Event::getName(*a2);
      CtrXPC::Event::getDataValue(*a2);
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = (void *)v8;
      p_p = &__p;
      *(_DWORD *)buf = 138543874;
      if (v16 < 0)
        p_p = __p;
      v18 = v7;
      v19 = 2080;
      v20 = p_p;
      v21 = 2112;
      v22 = v8;
      _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_DEBUG, "%{public}@Received thread event: event name - %s, value =%@", buf, 0x20u);
      if (v16 < 0)
        operator delete(__p);

    }
    objc_autoreleasePoolPop(v4);
    v11 = objc_alloc(MEMORY[0x24BDD17C8]);
    CtrXPC::Event::getDataValue(*a2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v11, "initWithCString:", xpc_string_get_string_ptr(v12));

    v14 = -[HMDThreadNetworkPeripheralDeviceNodeTypeEvent initWithPeripheralDeviceNodeType:]([HMDThreadNetworkPeripheralDeviceNodeTypeEvent alloc], "initWithPeripheralDeviceNodeType:", objc_msgSend(v5, "_nodeTypeFromString:", v13));
    objc_msgSend(v5, "_notifyObserversOfPeripheralDeviceNodeTypeEvent:", v14);

  }
}

void __55__HMDThreadRadioClient__registerForThreadNetworkEvents__block_invoke_236(uint64_t a1, CtrXPC::Event **a2)
{
  id WeakRetained;
  void *v4;
  id v5;
  NSObject *v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *p_p;
  void *v11;
  _BOOL4 value;
  HMDThreadNetworkBTCallStateEvent *v13;
  void *__p;
  char v15;
  uint8_t buf[4];
  id v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v4 = (void *)MEMORY[0x227676638]();
    v5 = WeakRetained;
    HMFGetOSLogHandle();
    v6 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v7 = (id)objc_claimAutoreleasedReturnValue();
      CtrXPC::Event::getName(*a2);
      CtrXPC::Event::getDataValue(*a2);
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = (void *)v8;
      p_p = &__p;
      *(_DWORD *)buf = 138543874;
      if (v15 < 0)
        p_p = __p;
      v17 = v7;
      v18 = 2080;
      v19 = p_p;
      v20 = 2112;
      v21 = v8;
      _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_DEBUG, "%{public}@Received thread event: event name - %s, value =%@", buf, 0x20u);
      if (v15 < 0)
        operator delete(__p);

    }
    objc_autoreleasePoolPop(v4);
    CtrXPC::Event::getDataValue(*a2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    value = xpc_BOOL_get_value(v11);

    v13 = -[HMDThreadNetworkBTCallStateEvent initWithCallState:]([HMDThreadNetworkBTCallStateEvent alloc], "initWithCallState:", value);
    objc_msgSend(v5, "_notifyObserversOfCallStateChangedEvent:", v13);

  }
}

void __56__HMDThreadRadioClient_stopThreadNetworkWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 48);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t))(v1 + 16))(v1);

}

void __56__HMDThreadRadioClient_stopThreadNetworkWithCompletion___block_invoke_156(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  _QWORD v7[5];
  id v8;
  uint8_t buf[4];
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x227676638]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v10 = v5;
    _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@Attempting to stop thread network", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v2);
  objc_msgSend(*(id *)(a1 + 32), "threadClient");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __56__HMDThreadRadioClient_stopThreadNetworkWithCompletion___block_invoke_157;
  v7[3] = &unk_24E79B3A0;
  v7[4] = *(_QWORD *)(a1 + 32);
  v8 = *(id *)(a1 + 40);
  objc_msgSend(v6, "threadStopWithCompletion:", v7);

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 13) = 0;
}

void __56__HMDThreadRadioClient_stopThreadNetworkWithCompletion___block_invoke_157(uint64_t a1, void *a2)
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
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x227676638]();
  v5 = *(id *)(a1 + 32);
  if (v3)
  {
    HMFGetOSLogHandle();
    v6 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138543618;
      v10 = v7;
      v11 = 2112;
      v12 = v3;
      _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_ERROR, "%{public}@Failed to stop thread network: %@", (uint8_t *)&v9, 0x16u);

    }
  }
  else
  {
    HMFGetOSLogHandle();
    v6 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138543362;
      v10 = v8;
      _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@Successfully stopped thread network", (uint8_t *)&v9, 0xCu);

    }
  }

  objc_autoreleasePoolPop(v4);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __57__HMDThreadRadioClient_stopFirmwareUpdateWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 48);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t))(v1 + 16))(v1);

}

void __57__HMDThreadRadioClient_stopFirmwareUpdateWithCompletion___block_invoke_144(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[5];
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "threadClient");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __57__HMDThreadRadioClient_stopFirmwareUpdateWithCompletion___block_invoke_2;
  v4[3] = &unk_24E79B3A0;
  v3 = *(void **)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  objc_msgSend(v2, "stopFWUpdate:", v4);

}

void __57__HMDThreadRadioClient_stopFirmwareUpdateWithCompletion___block_invoke_2(uint64_t a1, void *a2)
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

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (v3)
  {
    v4 = (void *)MEMORY[0x227676638]();
    v5 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v6 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138543618;
      v9 = v7;
      v10 = 2112;
      v11 = v3;
      _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_ERROR, "%{public}@Error while informing thread sw of stopFWUpdate, error: %@", (uint8_t *)&v8, 0x16u);

    }
    objc_autoreleasePoolPop(v4);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __89__HMDThreadRadioClient_startFirmwareUpdateWithExtendedMACAddress_isWedDevice_completion___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 48);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t))(v1 + 16))(v1);

}

void __89__HMDThreadRadioClient_startFirmwareUpdateWithExtendedMACAddress_isWedDevice_completion___block_invoke_141(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[5];
  id v6;
  id v7;
  char v8;

  objc_msgSend(*(id *)(a1 + 32), "threadClient");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(unsigned __int8 *)(a1 + 56);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __89__HMDThreadRadioClient_startFirmwareUpdateWithExtendedMACAddress_isWedDevice_completion___block_invoke_2;
  v5[3] = &unk_24E789BE0;
  v4 = *(void **)(a1 + 40);
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v4;
  v8 = *(_BYTE *)(a1 + 56);
  v7 = *(id *)(a1 + 48);
  objc_msgSend(v2, "startFWUpdate:isWedDevice:completion:", v6, v3, v5);

}

void __89__HMDThreadRadioClient_startFirmwareUpdateWithExtendedMACAddress_isWedDevice_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (v3)
  {
    v4 = (void *)MEMORY[0x227676638]();
    v5 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v6 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = *(_QWORD *)(a1 + 40);
      HMFBooleanToString();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138544130;
      v11 = v7;
      v12 = 2112;
      v13 = v8;
      v14 = 2112;
      v15 = v9;
      v16 = 2112;
      v17 = v3;
      _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_ERROR, "%{public}@Error while informing thread sw of startFWUpdate (emac: %@, isWed: %@), error: %@", (uint8_t *)&v10, 0x2Au);

    }
    objc_autoreleasePoolPop(v4);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

void __56__HMDThreadRadioClient_stopThreadPairingWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 48);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t))(v1 + 16))(v1);

}

void __56__HMDThreadRadioClient_stopThreadPairingWithCompletion___block_invoke_138(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[5];
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "threadClient");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __56__HMDThreadRadioClient_stopThreadPairingWithCompletion___block_invoke_2;
  v4[3] = &unk_24E79B3A0;
  v3 = *(void **)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  objc_msgSend(v2, "stopPairing:", v4);

}

void __56__HMDThreadRadioClient_stopThreadPairingWithCompletion___block_invoke_2(uint64_t a1, void *a2)
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

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (v3)
  {
    v4 = (void *)MEMORY[0x227676638]();
    v5 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v6 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138543618;
      v9 = v7;
      v10 = 2112;
      v11 = v3;
      _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_ERROR, "%{public}@Error while informing thread sw of pairing stop, error: %@", (uint8_t *)&v8, 0x16u);

    }
    objc_autoreleasePoolPop(v4);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __88__HMDThreadRadioClient_startThreadPairingWithExtendedMACAddress_isWedDevice_completion___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 48);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t))(v1 + 16))(v1);

}

void __88__HMDThreadRadioClient_startThreadPairingWithExtendedMACAddress_isWedDevice_completion___block_invoke_135(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[5];
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "threadClient");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(unsigned __int8 *)(a1 + 56);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __88__HMDThreadRadioClient_startThreadPairingWithExtendedMACAddress_isWedDevice_completion___block_invoke_2;
  v5[3] = &unk_24E79B3A0;
  v4 = *(_QWORD *)(a1 + 40);
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = *(id *)(a1 + 48);
  objc_msgSend(v2, "startPairingForExtendedMACAddress:isWedDevice:completion:", v4, v3, v5);

}

void __88__HMDThreadRadioClient_startThreadPairingWithExtendedMACAddress_isWedDevice_completion___block_invoke_2(uint64_t a1, void *a2)
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

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (v3)
  {
    v4 = (void *)MEMORY[0x227676638]();
    v5 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v6 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138543618;
      v9 = v7;
      v10 = 2112;
      v11 = v3;
      _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_ERROR, "%{public}@Error while informing thread sw of pairing start, error: %@", (uint8_t *)&v8, 0x16u);

    }
    objc_autoreleasePoolPop(v4);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __63__HMDThreadRadioClient_connectToExtendedMACAddress_completion___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 48);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t))(v1 + 16))(v1);

}

void __63__HMDThreadRadioClient_connectToExtendedMACAddress_completion___block_invoke_131(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  int8x16_t v11;
  _QWORD v12[4];
  int8x16_t v13;
  id v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = (void *)MEMORY[0x227676638]();
  v4 = *(id *)(a1 + 40);
  if (v2)
  {
    HMFGetOSLogHandle();
    v5 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      v16 = v6;
      v17 = 2112;
      v18 = v7;
      _os_log_impl(&dword_2218F0000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@Attempting to connect to device with eMAC address %@", buf, 0x16u);

    }
  }
  else
  {
    HMFGetOSLogHandle();
    v5 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v16 = v8;
      _os_log_impl(&dword_2218F0000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@Received nil eMAC, disconnecting from current device", buf, 0xCu);

    }
  }

  objc_autoreleasePoolPop(v3);
  objc_msgSend(*(id *)(a1 + 40), "threadClient");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __63__HMDThreadRadioClient_connectToExtendedMACAddress_completion___block_invoke_132;
  v12[3] = &unk_24E79AB68;
  v11 = *(int8x16_t *)(a1 + 32);
  v10 = (id)v11.i64[0];
  v13 = vextq_s8(v11, v11, 8uLL);
  v14 = *(id *)(a1 + 48);
  objc_msgSend(v9, "provideExtendedMACAddress:completion:", v10, v12);

}

void __63__HMDThreadRadioClient_connectToExtendedMACAddress_completion___block_invoke_132(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  int v9;
  void *v10;
  __int16 v11;
  uint64_t v12;
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
    v6 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = *(_QWORD *)(a1 + 40);
      v9 = 138543874;
      v10 = v7;
      v11 = 2112;
      v12 = v8;
      v13 = 2112;
      v14 = v3;
      _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_ERROR, "%{public}@Error while trying to connect to emac address: %@ error: %@", (uint8_t *)&v9, 0x20u);

    }
    objc_autoreleasePoolPop(v4);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

void __88__HMDThreadRadioClient_startThreadNetworkWithOperationalDataset_isOwnerUser_completion___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 48);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t))(v1 + 16))(v1);

}

void __88__HMDThreadRadioClient_startThreadNetworkWithOperationalDataset_isOwnerUser_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v11[5];
  id v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x227676638]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138543618;
    v14 = v5;
    v15 = 2112;
    v16 = v6;
    _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@Attempting to start thread network with operation data set: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v2);
  objc_msgSend(*(id *)(a1 + 32), "threadClient");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *(unsigned __int8 *)(a1 + 56);
  v9 = *(unsigned __int8 *)(a1 + 57);
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __88__HMDThreadRadioClient_startThreadNetworkWithOperationalDataset_isOwnerUser_completion___block_invoke_127;
  v11[3] = &unk_24E79B3A0;
  v11[4] = *(_QWORD *)(a1 + 32);
  v10 = *(_QWORD *)(a1 + 40);
  v12 = *(id *)(a1 + 48);
  objc_msgSend(v7, "threadStart:geoAvailable:isPrimaryUser:waitForSync:completion:", v10, v8, v9, 0, v11);

}

void __88__HMDThreadRadioClient_startThreadNetworkWithOperationalDataset_isOwnerUser_completion___block_invoke_127(uint64_t a1, void *a2)
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
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (v3)
  {
    v4 = (void *)MEMORY[0x227676638]();
    v5 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v6 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138543618;
      v10 = v7;
      v11 = 2112;
      v12 = v3;
      _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_ERROR, "%{public}@Failed to start thread network: %@", (uint8_t *)&v9, 0x16u);

    }
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 13) = 1;
    v4 = (void *)MEMORY[0x227676638]();
    v5 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v6 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138543362;
      v10 = v8;
      _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@Successfully started thread network", (uint8_t *)&v9, 0xCu);

    }
  }

  objc_autoreleasePoolPop(v4);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __54__HMDThreadRadioClient_startThreadNetwork_completion___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 48);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD))(v1 + 16))(v1, 0);

}

void __54__HMDThreadRadioClient_startThreadNetwork_completion___block_invoke_124(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 48);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD))(v1 + 16))(v1, 0);

}

+ (id)logCategory
{
  if (+[HMDThreadRadioClient logCategory]::_hmf_once_t1 != -1)
    dispatch_once(&+[HMDThreadRadioClient logCategory]::_hmf_once_t1, &__block_literal_global_152135);
  return (id)+[HMDThreadRadioClient logCategory]::_hmf_once_v2;
}

void __35__HMDThreadRadioClient_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)+[HMDThreadRadioClient logCategory]::_hmf_once_v2;
  +[HMDThreadRadioClient logCategory]::_hmf_once_v2 = v0;

}

@end
