@implementation HMMTRThreadRadioManager

- (HMMTRThreadRadioManager)initWithBrowser:(id)a3
{
  id v4;
  HMMTRThreadRadioManager *v5;
  HMMTRThreadRadioManager *v6;
  NSNumber *fabricIDOfActiveThreadNetwork;
  NSString *eMACAddressOfWEDAccessory;
  NSString *eMACAddressOfFWUpdatesAccessory;
  const char *v10;
  NSObject *v11;
  dispatch_queue_t v12;
  OS_dispatch_queue *workQueue;
  uint64_t v14;
  HMFTimer *disconnectTimer;
  id pendingStartPairingBlock;
  NSNumber *fabricIDOfPendingStartPairingBlock;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)HMMTRThreadRadioManager;
  v5 = -[HMMTRThreadRadioManager init](&v19, sel_init);
  v6 = v5;
  if (v5)
  {
    v5->_lock._os_unfair_lock_opaque = 0;
    fabricIDOfActiveThreadNetwork = v5->_fabricIDOfActiveThreadNetwork;
    v5->_fabricIDOfActiveThreadNetwork = 0;

    v6->_threadNetworkActivatedForSystemCommissionerFabric = 0;
    v6->_preventDisconnect = 0;
    v6->_lastKnownThreadNetworkConnectionState = 0;
    v6->_deviceSupportsThreadService = 0;
    v6->_pairingActive = 0;
    v6->_firmwareUpdateActive = 0;
    v6->_pendingThreadStart = 0;
    v6->_isWEDConnectionRetryActive = 0;
    v6->_deviceIsLockedAndPendingStopThread = 0;
    eMACAddressOfWEDAccessory = v6->_eMACAddressOfWEDAccessory;
    v6->_eMACAddressOfWEDAccessory = 0;

    eMACAddressOfFWUpdatesAccessory = v6->_eMACAddressOfFWUpdatesAccessory;
    v6->_eMACAddressOfFWUpdatesAccessory = 0;

    v10 = (const char *)HMFDispatchQueueName();
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = dispatch_queue_create(v10, v11);
    workQueue = v6->_workQueue;
    v6->_workQueue = (OS_dispatch_queue *)v12;

    objc_storeWeak((id *)&v6->_browser, v4);
    v14 = objc_msgSend(objc_alloc(MEMORY[0x24BE3F298]), "initWithTimeInterval:options:", 0, 15.0);
    disconnectTimer = v6->_disconnectTimer;
    v6->_disconnectTimer = (HMFTimer *)v14;

    -[HMFTimer setDelegateQueue:](v6->_disconnectTimer, "setDelegateQueue:", v6->_workQueue);
    -[HMFTimer setDelegate:](v6->_disconnectTimer, "setDelegate:", v6);
    pendingStartPairingBlock = v6->_pendingStartPairingBlock;
    v6->_pendingStartPairingBlock = 0;

    fabricIDOfPendingStartPairingBlock = v6->_fabricIDOfPendingStartPairingBlock;
    v6->_fabricIDOfPendingStartPairingBlock = 0;

  }
  return v6;
}

- (HMMTRThreadRadioControllerDelegate)delegate
{
  os_unfair_lock_s *p_lock;
  id WeakRetained;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  os_unfair_lock_unlock(p_lock);
  return (HMMTRThreadRadioControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock_with_options();
  objc_storeWeak((id *)&self->_delegate, v5);

  os_unfair_lock_unlock(p_lock);
}

- (void)handleDeviceLockStateChange:(BOOL)a3
{
  _BOOL4 v3;
  void (*v5)(uint64_t);
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  v3 = a3;
  -[HMMTRThreadRadioManager setDeviceIsLockedAndPendingStopThread:](self, "setDeviceIsLockedAndPendingStopThread:", 0);
  if (v3)
  {
    v8 = MEMORY[0x24BDAC760];
    v5 = __55__HMMTRThreadRadioManager_handleDeviceLockStateChange___block_invoke;
    v6 = &v8;
  }
  else
  {
    v7 = MEMORY[0x24BDAC760];
    v5 = __55__HMMTRThreadRadioManager_handleDeviceLockStateChange___block_invoke_12;
    v6 = &v7;
  }
  v6[1] = 3221225472;
  v6[2] = (uint64_t)v5;
  v6[3] = (uint64_t)&unk_250F23DF0;
  v6[4] = (uint64_t)self;
  -[HMMTRThreadRadioManager dispatchBlock:](self, "dispatchBlock:", v7);
}

- (void)stopThreadOnDeviceLockTimeout
{
  _BOOL4 v3;
  void *v4;
  HMMTRThreadRadioManager *v5;
  NSObject *v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = -[HMMTRThreadRadioManager preventDisconnect](self, "preventDisconnect");
  v4 = (void *)MEMORY[0x242656984]();
  v5 = self;
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_INFO);
  if (v3)
  {
    if (v7)
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543362;
      v16 = v8;
      _os_log_impl(&dword_23E95B000, v6, OS_LOG_TYPE_INFO, "%{public}@stopThreadOnDeviceLockTimeout - not stopping because preventDisconnect is true", (uint8_t *)&v15, 0xCu);

    }
    objc_autoreleasePoolPop(v4);
    -[HMMTRThreadRadioManager setDeviceIsLockedAndPendingStopThread:](v5, "setDeviceIsLockedAndPendingStopThread:", 1);
  }
  else
  {
    if (v7)
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543362;
      v16 = v9;
      _os_log_impl(&dword_23E95B000, v6, OS_LOG_TYPE_INFO, "%{public}@stopping thread due to device lock", (uint8_t *)&v15, 0xCu);

    }
    objc_autoreleasePoolPop(v4);
    v10 = -[HMMTRThreadRadioManager threadNetworkActivatedForSystemCommissionerFabric](v5, "threadNetworkActivatedForSystemCommissionerFabric");
    -[HMMTRThreadRadioManager delegate](v5, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v10)
    {
      objc_msgSend(v11, "stopThreadRadioForUserPreferredNetwork");
    }
    else
    {
      -[HMMTRThreadRadioManager fabricIDOfActiveThreadNetwork](v5, "fabricIDOfActiveThreadNetwork");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "stopThreadRadioForHomeWithFabricID:", v13);

    }
    -[HMMTRThreadRadioManager _updateFabricIDOfActiveThreadNetwork:isFabricIDOfSystemCommissioner:](v5, "_updateFabricIDOfActiveThreadNetwork:isFabricIDOfSystemCommissioner:", 0, 0);
    -[HMMTRThreadRadioManager delegate](v5, "delegate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stopThreadRadioOnDeviceLock");

  }
}

- (void)startThreadRadioForHomeWithFabricID:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __63__HMMTRThreadRadioManager_startThreadRadioForHomeWithFabricID___block_invoke;
  v6[3] = &unk_250F22458;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[HMMTRThreadRadioManager dispatchBlock:](self, "dispatchBlock:", v6);

}

- (void)startThreadRadioForHomeWithFabricID:(id)a3 preventDisconnect:(BOOL)a4
{
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;
  BOOL v10;

  v6 = a3;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __81__HMMTRThreadRadioManager_startThreadRadioForHomeWithFabricID_preventDisconnect___block_invoke;
  v8[3] = &unk_250F23558;
  v8[4] = self;
  v9 = v6;
  v10 = a4;
  v7 = v6;
  -[HMMTRThreadRadioManager dispatchBlock:](self, "dispatchBlock:", v8);

}

- (void)_startThreadRadioForHomeWithFabricID:(id)a3 preventDisconnect:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  uint64_t v7;
  void *v8;
  BOOL v9;
  void *v10;
  HMMTRThreadRadioManager *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  HMMTRThreadRadioManager *v16;
  NSObject *v17;
  void *v18;
  const char *v19;
  NSObject *v20;
  os_log_type_t v21;
  uint32_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  int v28;
  void *v29;
  HMMTRThreadRadioManager *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  _BOOL4 v34;
  HMMTRThreadRadioManager *v35;
  _BOOL4 v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  int v42;
  void *v43;
  __int16 v44;
  id v45;
  __int16 v46;
  void *v47;
  __int16 v48;
  uint64_t v49;
  uint64_t v50;

  v4 = a4;
  v50 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  if (!isFeatureMatteriPhoneOnlyPairingControlForThreadEnabled()
    || (-[HMMTRThreadRadioManager delegate](self, "delegate"), (v7 = objc_claimAutoreleasedReturnValue()) == 0)
    || (v8 = (void *)v7,
        v9 = -[HMMTRThreadRadioManager deviceSupportsThreadService](self, "deviceSupportsThreadService"),
        v8,
        !v9))
  {
    v15 = MEMORY[0x242656984]();
    v16 = self;
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      goto LABEL_14;
    HMFGetLogIdentifier();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = 138543362;
    v43 = v18;
    v19 = "%{public}@Thread radio feature is not enabled";
    v20 = v17;
    v21 = OS_LOG_TYPE_DEBUG;
LABEL_12:
    v22 = 12;
    goto LABEL_13;
  }
  v10 = (void *)MEMORY[0x242656984]();
  v11 = self;
  HMFGetOSLogHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    HMFBooleanToString();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = 138544130;
    v43 = v13;
    v44 = 2112;
    v45 = v6;
    v46 = 2112;
    v47 = v14;
    v48 = 2048;
    v49 = -[HMMTRThreadRadioManager lastKnownThreadNetworkConnectionState](v11, "lastKnownThreadNetworkConnectionState");
    _os_log_impl(&dword_23E95B000, v12, OS_LOG_TYPE_INFO, "%{public}@Start thread for fabricID %@, preventDisconnect = %@, last known connectionState: %ld", (uint8_t *)&v42, 0x2Au);

  }
  objc_autoreleasePoolPop(v10);
  if (!v6)
  {
    v15 = MEMORY[0x242656984]();
    v16 = v11;
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      goto LABEL_14;
    HMFGetLogIdentifier();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = 138543362;
    v43 = v18;
    v19 = "%{public}@Invalid fabricID, ignoring thread radio start";
    v20 = v17;
    v21 = OS_LOG_TYPE_INFO;
    goto LABEL_12;
  }
  if (!-[HMMTRThreadRadioManager pendingThreadStart](v11, "pendingThreadStart"))
  {
    -[HMMTRThreadRadioManager fabricIDOfActiveThreadNetwork](v11, "fabricIDOfActiveThreadNetwork");
    v24 = objc_claimAutoreleasedReturnValue();
    if (v24)
    {
      v25 = (void *)v24;
      v26 = -[HMMTRThreadRadioManager lastKnownThreadNetworkConnectionState](v11, "lastKnownThreadNetworkConnectionState");

      if (v26 != 1)
      {
        -[HMMTRThreadRadioManager fabricIDOfActiveThreadNetwork](v11, "fabricIDOfActiveThreadNetwork");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = objc_msgSend(v27, "isEqualToNumber:", v6);

        if (v28)
        {
          v29 = (void *)MEMORY[0x242656984]();
          v30 = v11;
          HMFGetOSLogHandle();
          v31 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            HMFBooleanToString();
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            v42 = 138543618;
            v43 = v32;
            v44 = 2112;
            v45 = v33;
            _os_log_impl(&dword_23E95B000, v31, OS_LOG_TYPE_INFO, "%{public}@Thread network is already running for this fabric, calling threadStart and setting preventDisconnect to %@", (uint8_t *)&v42, 0x16u);

          }
        }
        else
        {
          v34 = -[HMMTRThreadRadioManager preventDisconnect](v11, "preventDisconnect");
          v29 = (void *)MEMORY[0x242656984]();
          v35 = v11;
          HMFGetOSLogHandle();
          v31 = objc_claimAutoreleasedReturnValue();
          v36 = os_log_type_enabled(v31, OS_LOG_TYPE_INFO);
          if (v34)
          {
            if (v36)
            {
              HMFGetLogIdentifier();
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              -[HMMTRThreadRadioManager fabricIDOfActiveThreadNetwork](v35, "fabricIDOfActiveThreadNetwork");
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              v42 = 138543874;
              v43 = v37;
              v44 = 2112;
              v45 = v6;
              v46 = 2112;
              v47 = v38;
              _os_log_impl(&dword_23E95B000, v31, OS_LOG_TYPE_INFO, "%{public}@Ignoring thread start for fabric %@, network is locked to fabricID %@", (uint8_t *)&v42, 0x20u);

            }
            v23 = v29;
            goto LABEL_15;
          }
          if (v36)
          {
            HMFGetLogIdentifier();
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            -[HMMTRThreadRadioManager fabricIDOfActiveThreadNetwork](v35, "fabricIDOfActiveThreadNetwork");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            v42 = 138543874;
            v43 = v39;
            v44 = 2112;
            v45 = v6;
            v46 = 2112;
            v47 = v40;
            _os_log_impl(&dword_23E95B000, v31, OS_LOG_TYPE_INFO, "%{public}@Thread start called for new fabricID %@, will be disconnecting from thread network for fabricID %@", (uint8_t *)&v42, 0x20u);

          }
        }

        objc_autoreleasePoolPop(v29);
      }
    }
    -[HMMTRThreadRadioManager _updateFabricIDOfActiveThreadNetwork:isFabricIDOfSystemCommissioner:](v11, "_updateFabricIDOfActiveThreadNetwork:isFabricIDOfSystemCommissioner:", v6, 0);
    -[HMMTRThreadRadioManager setPreventDisconnect:](v11, "setPreventDisconnect:", v4);
    -[HMMTRThreadRadioManager delegate](v11, "delegate");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "startThreadRadioForHomeWithFabricID:", v6);

    goto LABEL_16;
  }
  v15 = MEMORY[0x242656984]();
  v16 = v11;
  HMFGetOSLogHandle();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = 138543618;
    v43 = v18;
    v44 = 2112;
    v45 = v6;
    v19 = "%{public}@Thread start already pending, ignoring startThread request for fabricID %@";
    v20 = v17;
    v21 = OS_LOG_TYPE_ERROR;
    v22 = 22;
LABEL_13:
    _os_log_impl(&dword_23E95B000, v20, v21, v19, (uint8_t *)&v42, v22);

  }
LABEL_14:

  v23 = (void *)v15;
LABEL_15:
  objc_autoreleasePoolPop(v23);
LABEL_16:

}

- (void)connectToAccessoryWithExtendedMACAddress:(id)a3 completion:(id)a4
{
  -[HMMTRThreadRadioManager connectToAccessoryWithExtendedMACAddress:forRetry:completion:](self, "connectToAccessoryWithExtendedMACAddress:forRetry:completion:", a3, 0, a4);
}

- (void)connectToAccessoryWithExtendedMACAddress:(id)a3 forRetry:(BOOL)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  BOOL v15;

  v8 = a3;
  v9 = a5;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __88__HMMTRThreadRadioManager_connectToAccessoryWithExtendedMACAddress_forRetry_completion___block_invoke;
  v12[3] = &unk_250F21F90;
  v13 = v8;
  v14 = v9;
  v12[4] = self;
  v15 = a4;
  v10 = v8;
  v11 = v9;
  -[HMMTRThreadRadioManager dispatchBlock:](self, "dispatchBlock:", v12);

}

- (void)startAccessoryPairingWithExtendedMACAddress:(id)a3 isWedDevice:(BOOL)a4 accessoryServer:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;
  BOOL v20;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __110__HMMTRThreadRadioManager_startAccessoryPairingWithExtendedMACAddress_isWedDevice_accessoryServer_completion___block_invoke;
  v16[3] = &unk_250F229D8;
  v16[4] = self;
  v17 = v10;
  v20 = a4;
  v18 = v11;
  v19 = v12;
  v13 = v12;
  v14 = v11;
  v15 = v10;
  -[HMMTRThreadRadioManager dispatchBlock:](self, "dispatchBlock:", v16);

}

- (void)_startAccessoryPairingWithExtendedMACAddress:(id)a3 isWedDevice:(BOOL)a4 accessoryServer:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void (**v17)(_QWORD, _QWORD);
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  char v25;
  char v26;
  void *v27;
  HMMTRThreadRadioManager *v28;
  NSObject *v29;
  id v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  HMMTRThreadRadioManager *v38;
  NSObject *v39;
  id v40;
  id v41;
  void *v42;
  void *v43;
  id v44;
  void *v45;
  id *v46;
  uint64_t v47;
  uint64_t v48;
  void (*v49)(uint64_t, void *);
  void *v50;
  id v51;
  id v52;
  id v53;
  id v54;
  BOOL v55;
  id location;
  uint8_t buf[4];
  id v58;
  __int16 v59;
  id v60;
  __int16 v61;
  void *v62;
  __int16 v63;
  void *v64;
  uint64_t v65;

  v65 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a5;
  v12 = a6;
  objc_initWeak(&location, self);
  v48 = 3221225472;
  v49 = __111__HMMTRThreadRadioManager__startAccessoryPairingWithExtendedMACAddress_isWedDevice_accessoryServer_completion___block_invoke;
  v50 = &unk_250F20FF8;
  v46 = &v54;
  v47 = MEMORY[0x24BDAC760];
  objc_copyWeak(&v54, &location);
  v13 = v12;
  v53 = v13;
  v44 = v10;
  v51 = v44;
  v55 = a4;
  v14 = v11;
  v52 = v14;
  v15 = (void *)MEMORY[0x242656B10](&v47);
  -[HMMTRThreadRadioManager pendingStartPairingBlock](self, "pendingStartPairingBlock");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    -[HMMTRThreadRadioManager pendingStartPairingBlock](self, "pendingStartPairingBlock", v44, &v54, v47, v48, v49, v50, v51);
    v17 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:", 12);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *))v17)[2](v17, v18);

    }
  }
  -[HMMTRThreadRadioManager delegate](self, "delegate", v44);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "fabricID");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v19, "getThreadNetworkConnectionStateWithFabricID:", v20);

  -[HMMTRThreadRadioManager fabricIDOfActiveThreadNetwork](self, "fabricIDOfActiveThreadNetwork");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v22)
    goto LABEL_14;
  -[HMMTRThreadRadioManager fabricIDOfActiveThreadNetwork](self, "fabricIDOfActiveThreadNetwork");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "fabricID");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v23, "isEqual:", v24);
  v26 = v21 == 3 ? v25 : 0;

  if ((v26 & 1) != 0)
  {
    v27 = (void *)MEMORY[0x242656984]();
    v28 = self;
    HMFGetOSLogHandle();
    v29 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v30 = (id)objc_claimAutoreleasedReturnValue();
      -[HMMTRThreadRadioManager _connectionStateValueToString:](v28, "_connectionStateValueToString:", 3);
      v31 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "fabricID");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMMTRThreadRadioManager fabricIDOfActiveThreadNetwork](v28, "fabricIDOfActiveThreadNetwork");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v58 = v30;
      v59 = 2112;
      v60 = v31;
      v61 = 2112;
      v62 = v32;
      v63 = 2112;
      v64 = v33;
      _os_log_impl(&dword_23E95B000, v29, OS_LOG_TYPE_INFO, "%{public}@Thread network connection state: %@ for fabricID: %@, calling start pairing block now. ActiveThreadNetworkFabricID: %@", buf, 0x2Au);

    }
    objc_autoreleasePoolPop(v27);
    objc_msgSend(v14, "fabricID");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMMTRThreadRadioManager setFabricIDOfPendingStartPairingBlock:](v28, "setFabricIDOfPendingStartPairingBlock:", v34);

    v35 = MEMORY[0x242656B10](v15);
    v36 = (void *)v35;
    if (v35)
      (*(void (**)(uint64_t, _QWORD))(v35 + 16))(v35, 0);
  }
  else
  {
LABEL_14:
    v37 = (void *)MEMORY[0x242656984]();
    v38 = self;
    HMFGetOSLogHandle();
    v39 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v40 = (id)objc_claimAutoreleasedReturnValue();
      -[HMMTRThreadRadioManager _connectionStateValueToString:](v38, "_connectionStateValueToString:", v21);
      v41 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "fabricID");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMMTRThreadRadioManager fabricIDOfActiveThreadNetwork](v38, "fabricIDOfActiveThreadNetwork");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v58 = v40;
      v59 = 2112;
      v60 = v41;
      v61 = 2112;
      v62 = v42;
      v63 = 2112;
      v64 = v43;
      _os_log_impl(&dword_23E95B000, v39, OS_LOG_TYPE_INFO, "%{public}@Thread network connection state: %@ for fabricID: %@, deferring call to start pairing block. ActiveThreadNetworkFabricID: %@", buf, 0x2Au);

    }
    objc_autoreleasePoolPop(v37);
    -[HMMTRThreadRadioManager setPendingStartPairingBlock:](v38, "setPendingStartPairingBlock:", v15);
    objc_msgSend(v14, "fabricID");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMMTRThreadRadioManager setFabricIDOfPendingStartPairingBlock:](v38, "setFabricIDOfPendingStartPairingBlock:", v36);
  }

  objc_destroyWeak(v46);
  objc_destroyWeak(&location);

}

- (void)__startAccessoryPairingWithExtendedMACAddress:(id)a3 isWedDevice:(BOOL)a4 accessoryServer:(id)a5 completion:(id)a6
{
  _BOOL8 v8;
  id v10;
  id v11;
  void (**v12)(id, _QWORD);
  void *v13;
  void *v14;
  void *v15;
  HMMTRThreadRadioManager *v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void (**v24)(_QWORD, _QWORD);
  void *v25;
  void *v26;
  uint64_t v27;
  HMMTRThreadRadioManager *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  _QWORD v35[5];
  id v36;
  void (**v37)(id, _QWORD);
  uint8_t buf[4];
  void *v39;
  __int16 v40;
  id v41;
  __int16 v42;
  void *v43;
  __int16 v44;
  void *v45;
  uint64_t v46;

  v8 = a4;
  v46 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a5;
  v12 = (void (**)(id, _QWORD))a6;
  if (!isFeatureMatteriPhoneOnlyPairingControlForThreadEnabled()
    || (-[HMMTRThreadRadioManager delegate](self, "delegate"),
        v13 = (void *)objc_claimAutoreleasedReturnValue(),
        v13,
        !v13))
  {
    v27 = MEMORY[0x242656984]();
    v28 = self;
    HMFGetOSLogHandle();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v39 = v30;
      _os_log_impl(&dword_23E95B000, v29, OS_LOG_TYPE_DEBUG, "%{public}@Thread radio feature is not enabled", buf, 0xCu);

    }
    v31 = (void *)v27;
    goto LABEL_13;
  }
  -[HMMTRThreadRadioManager fabricIDOfActiveThreadNetwork](self, "fabricIDOfActiveThreadNetwork");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = (void *)MEMORY[0x242656984]();
  v16 = self;
  HMFGetOSLogHandle();
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (!v14)
  {
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v39 = v32;
      v40 = 2112;
      v41 = v10;
      _os_log_impl(&dword_23E95B000, v18, OS_LOG_TYPE_ERROR, "%{public}@No active thread network configured, dropping request to inform thread SW of start pairing with eMAC %@", buf, 0x16u);

    }
    v31 = v15;
LABEL_13:
    objc_autoreleasePoolPop(v31);
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BE3EBB0], 5, 0);
    v24 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v12[2](v12, v24);
    goto LABEL_14;
  }
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    HMFBooleanToString();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "nodeID");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v39 = v19;
    v40 = 2112;
    v41 = v10;
    v42 = 2112;
    v43 = v20;
    v44 = 2112;
    v45 = v21;
    _os_log_impl(&dword_23E95B000, v18, OS_LOG_TYPE_INFO, "%{public}@start accessory pairing for accessory with eMAC = %@, isWED = %@, accessory nodeID = %@", buf, 0x2Au);

  }
  objc_autoreleasePoolPop(v15);
  -[HMMTRThreadRadioManager fabricIDOfActiveThreadNetwork](v16, "fabricIDOfActiveThreadNetwork");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMTRThreadRadioManager overrideLocationCheckForPairingForFabricID:](v16, "overrideLocationCheckForPairingForFabricID:", v22);

  -[HMMTRThreadRadioManager fabricIDOfActiveThreadNetwork](v16, "fabricIDOfActiveThreadNetwork");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMTRThreadRadioManager startThreadRadioForHomeWithFabricID:preventDisconnect:](v16, "startThreadRadioForHomeWithFabricID:preventDisconnect:", v23, 1);

  -[HMMTRThreadRadioManager setPairingActive:](v16, "setPairingActive:", 1);
  -[HMMTRThreadRadioManager setPairingAccessoryServer:](v16, "setPairingAccessoryServer:", v11);
  -[HMMTRThreadRadioManager setIsWEDConnectionRetryActive:](v16, "setIsWEDConnectionRetryActive:", 0);
  -[HMMTRThreadRadioManager retryCompletionHandler](v16, "retryCompletionHandler");
  v24 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  -[HMMTRThreadRadioManager setRetryCompletionHandler:](v16, "setRetryCompletionHandler:", 0);
  if (v24)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:", 12);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v24)[2](v24, v25);

  }
  if (v10)
  {
    v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v10, 4);
    -[HMMTRThreadRadioManager setEMACAddressOfWEDAccessory:](v16, "setEMACAddressOfWEDAccessory:", v26);

  }
  else
  {
    -[HMMTRThreadRadioManager setEMACAddressOfWEDAccessory:](v16, "setEMACAddressOfWEDAccessory:", 0);
  }
  -[HMMTRThreadRadioManager delegate](v16, "delegate");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMTRThreadRadioManager fabricIDOfActiveThreadNetwork](v16, "fabricIDOfActiveThreadNetwork");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35[0] = MEMORY[0x24BDAC760];
  v35[1] = 3221225472;
  v35[2] = __112__HMMTRThreadRadioManager___startAccessoryPairingWithExtendedMACAddress_isWedDevice_accessoryServer_completion___block_invoke;
  v35[3] = &unk_250F228C0;
  v35[4] = v16;
  v36 = v10;
  v37 = v12;
  objc_msgSend(v33, "startAccessoryPairingWithExtendedMACAddress:fabricID:isWedDevice:completion:", v36, v34, v8, v35);

LABEL_14:
}

- (void)stopAccessoryPairingWithCompletion:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __62__HMMTRThreadRadioManager_stopAccessoryPairingWithCompletion___block_invoke;
  v6[3] = &unk_250F22768;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[HMMTRThreadRadioManager dispatchBlock:](self, "dispatchBlock:", v6);

}

- (void)_stopAccessoryPairingWithCompletion:(id)a3
{
  void (**v4)(id, void *);
  void *v5;
  void *v6;
  void *v7;
  HMMTRThreadRadioManager *v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void (**v18)(_QWORD, _QWORD);
  void *v19;
  uint64_t v20;
  HMMTRThreadRadioManager *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void (*v29)(uint64_t, void *);
  void *v30;
  HMMTRThreadRadioManager *v31;
  void (**v32)(id, void *);
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, void *))a3;
  if (!isFeatureMatteriPhoneOnlyPairingControlForThreadEnabled()
    || (-[HMMTRThreadRadioManager delegate](self, "delegate"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v5,
        !v5))
  {
    v20 = MEMORY[0x242656984]();
    v21 = self;
    HMFGetOSLogHandle();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v34 = v23;
      _os_log_impl(&dword_23E95B000, v22, OS_LOG_TYPE_DEBUG, "%{public}@Thread radio feature is not enabled", buf, 0xCu);

    }
    v24 = (void *)v20;
    goto LABEL_14;
  }
  -[HMMTRThreadRadioManager fabricIDOfActiveThreadNetwork](self, "fabricIDOfActiveThreadNetwork");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x242656984]();
  v8 = self;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (!v6)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v34 = v26;
      _os_log_impl(&dword_23E95B000, v10, OS_LOG_TYPE_ERROR, "%{public}@No active thread network configured, dropping request to inform thread SW of stop pairing", buf, 0xCu);

    }
    v24 = v7;
LABEL_14:
    objc_autoreleasePoolPop(v24);
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BE3EBB0], 5, 0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v4[2](v4, v25);

    goto LABEL_15;
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMMTRThreadRadioManager pairingAccessoryServer](v8, "pairingAccessoryServer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "nodeID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMMTRThreadRadioManager eMACAddressOfWEDAccessory](v8, "eMACAddressOfWEDAccessory");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v34 = v11;
    v35 = 2112;
    v36 = v13;
    v37 = 2112;
    v38 = v14;
    _os_log_impl(&dword_23E95B000, v10, OS_LOG_TYPE_INFO, "%{public}@stop accessory pairing for accessory with nodeID = %@, emac = %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v7);
  -[HMMTRThreadRadioManager setPairingActive:](v8, "setPairingActive:", 0);
  -[HMMTRThreadRadioManager setPairingAccessoryServer:](v8, "setPairingAccessoryServer:", 0);
  -[HMMTRThreadRadioManager delegate](v8, "delegate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMTRThreadRadioManager fabricIDOfActiveThreadNetwork](v8, "fabricIDOfActiveThreadNetwork");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = MEMORY[0x24BDAC760];
  v28 = 3221225472;
  v29 = __63__HMMTRThreadRadioManager__stopAccessoryPairingWithCompletion___block_invoke;
  v30 = &unk_250F23CD0;
  v31 = v8;
  v32 = v4;
  objc_msgSend(v15, "stopAccessoryPairingWithFabricID:completion:", v16, &v27);

  -[HMMTRThreadRadioManager pendingStartPairingBlock](v8, "pendingStartPairingBlock", v27, v28, v29, v30, v31);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    -[HMMTRThreadRadioManager pendingStartPairingBlock](v8, "pendingStartPairingBlock");
    v18 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:", 12);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *))v18)[2](v18, v19);

    }
  }
  -[HMMTRThreadRadioManager allowDisconnect](v8, "allowDisconnect");

LABEL_15:
}

- (void)startAccessoryFirmwareUpdateWithExtendedMACAddress:(id)a3 isWedDevice:(BOOL)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  BOOL v15;

  v8 = a3;
  v9 = a5;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __101__HMMTRThreadRadioManager_startAccessoryFirmwareUpdateWithExtendedMACAddress_isWedDevice_completion___block_invoke;
  v12[3] = &unk_250F21F90;
  v12[4] = self;
  v13 = v8;
  v15 = a4;
  v14 = v9;
  v10 = v9;
  v11 = v8;
  -[HMMTRThreadRadioManager dispatchBlock:](self, "dispatchBlock:", v12);

}

- (void)_startAccessoryFirmwareUpdateWithExtendedMACAddress:(id)a3 isWedDevice:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v6;
  id v8;
  void (**v9)(id, void *);
  void *v10;
  void *v11;
  void *v12;
  HMMTRThreadRadioManager *v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  HMMTRThreadRadioManager *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  HMMTRThreadRadioManager *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  _QWORD v34[5];
  id v35;
  void (**v36)(id, void *);
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  id v40;
  __int16 v41;
  void *v42;
  uint64_t v43;

  v6 = a4;
  v43 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = (void (**)(id, void *))a5;
  if (!isFeatureMatteriPhoneOnlyPairingControlForThreadEnabled()
    || (-[HMMTRThreadRadioManager delegate](self, "delegate"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v10,
        !v10))
  {
    v23 = MEMORY[0x242656984]();
    v24 = self;
    HMFGetOSLogHandle();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v38 = v26;
      _os_log_impl(&dword_23E95B000, v25, OS_LOG_TYPE_DEBUG, "%{public}@Thread radio feature is not enabled", buf, 0xCu);

    }
    v27 = (void *)v23;
    goto LABEL_13;
  }
  -[HMMTRThreadRadioManager fabricIDOfActiveThreadNetwork](self, "fabricIDOfActiveThreadNetwork");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)MEMORY[0x242656984]();
  v13 = self;
  HMFGetOSLogHandle();
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (!v11)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v38 = v29;
      v39 = 2112;
      v40 = v8;
      _os_log_impl(&dword_23E95B000, v15, OS_LOG_TYPE_ERROR, "%{public}@No active thread network configured, dropping request to inform thread SW of start firmware update with eMAC %@", buf, 0x16u);

    }
    v27 = v12;
LABEL_13:
    objc_autoreleasePoolPop(v27);
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BE3EBB0], 5, 0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v9[2](v9, v28);

    goto LABEL_14;
  }
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    HMFBooleanToString();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v38 = v16;
    v39 = 2112;
    v40 = v8;
    v41 = 2112;
    v42 = v17;
    _os_log_impl(&dword_23E95B000, v15, OS_LOG_TYPE_INFO, "%{public}@start accessory firmware update for accessory with eMAC %@, isWED = %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v12);
  if (-[HMMTRThreadRadioManager isFirmwareUpdateActive](v13, "isFirmwareUpdateActive"))
  {
    v18 = (void *)MEMORY[0x242656984]();
    v19 = v13;
    HMFGetOSLogHandle();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMMTRThreadRadioManager eMACAddressOfFWUpdatesAccessory](v19, "eMACAddressOfFWUpdatesAccessory");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v38 = v21;
      v39 = 2112;
      v40 = v22;
      _os_log_impl(&dword_23E95B000, v20, OS_LOG_TYPE_INFO, "%{public}@Already informed thread SW of start firmware update with emac %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v18);
    v9[2](v9, 0);
  }
  else
  {
    -[HMMTRThreadRadioManager fabricIDOfActiveThreadNetwork](v13, "fabricIDOfActiveThreadNetwork");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMMTRThreadRadioManager startThreadRadioForHomeWithFabricID:preventDisconnect:](v13, "startThreadRadioForHomeWithFabricID:preventDisconnect:", v30, 1);

    -[HMMTRThreadRadioManager setFirmwareUpdateActive:](v13, "setFirmwareUpdateActive:", 1);
    if (v8)
    {
      v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v8, 4);
      -[HMMTRThreadRadioManager setEMACAddressOfFWUpdatesAccessory:](v13, "setEMACAddressOfFWUpdatesAccessory:", v31);

    }
    else
    {
      -[HMMTRThreadRadioManager setEMACAddressOfFWUpdatesAccessory:](v13, "setEMACAddressOfFWUpdatesAccessory:", 0);
    }
    -[HMMTRThreadRadioManager delegate](v13, "delegate");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMMTRThreadRadioManager fabricIDOfActiveThreadNetwork](v13, "fabricIDOfActiveThreadNetwork");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34[0] = MEMORY[0x24BDAC760];
    v34[1] = 3221225472;
    v34[2] = __102__HMMTRThreadRadioManager__startAccessoryFirmwareUpdateWithExtendedMACAddress_isWedDevice_completion___block_invoke;
    v34[3] = &unk_250F228C0;
    v34[4] = v13;
    v35 = v8;
    v36 = v9;
    objc_msgSend(v32, "startAccessoryFirmwareUpdateWithExtendedMACAddress:fabricID:isWedDevice:completion:", v35, v33, v6, v34);

  }
LABEL_14:

}

- (void)stopAccessoryFirmwareUpdateWithCompletion:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __69__HMMTRThreadRadioManager_stopAccessoryFirmwareUpdateWithCompletion___block_invoke;
  v6[3] = &unk_250F22768;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[HMMTRThreadRadioManager dispatchBlock:](self, "dispatchBlock:", v6);

}

- (void)_stopAccessoryFirmwareUpdateWithCompletion:(id)a3
{
  void (**v4)(id, void *);
  void *v5;
  void *v6;
  HMMTRThreadRadioManager *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  HMMTRThreadRadioManager *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  HMMTRThreadRadioManager *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  HMMTRThreadRadioManager *v25;
  NSObject *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  void (*v30)(uint64_t, void *);
  void *v31;
  HMMTRThreadRadioManager *v32;
  void (**v33)(id, void *);
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, void *))a3;
  if (!isFeatureMatteriPhoneOnlyPairingControlForThreadEnabled()
    || (-[HMMTRThreadRadioManager delegate](self, "delegate"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v5,
        !v5))
  {
    v18 = MEMORY[0x242656984]();
    v19 = self;
    HMFGetOSLogHandle();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v35 = v21;
      _os_log_impl(&dword_23E95B000, v20, OS_LOG_TYPE_DEBUG, "%{public}@Thread radio feature is not enabled", buf, 0xCu);

    }
    v22 = (void *)v18;
    goto LABEL_14;
  }
  v6 = (void *)MEMORY[0x242656984]();
  v7 = self;
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMMTRThreadRadioManager eMACAddressOfWEDAccessory](v7, "eMACAddressOfWEDAccessory");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v35 = v9;
    v36 = 2112;
    v37 = v10;
    _os_log_impl(&dword_23E95B000, v8, OS_LOG_TYPE_INFO, "%{public}@stop accessory firmware update for accessory with emac = %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v6);
  -[HMMTRThreadRadioManager fabricIDOfActiveThreadNetwork](v7, "fabricIDOfActiveThreadNetwork");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    v24 = MEMORY[0x242656984]();
    v25 = v7;
    HMFGetOSLogHandle();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v35 = v27;
      _os_log_impl(&dword_23E95B000, v26, OS_LOG_TYPE_ERROR, "%{public}@No active thread network configured, dropping request to inform thread SW of stop firmware update", buf, 0xCu);

    }
    v22 = (void *)v24;
LABEL_14:
    objc_autoreleasePoolPop(v22);
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BE3EBB0], 5, 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v4[2](v4, v23);

    goto LABEL_15;
  }
  if (!-[HMMTRThreadRadioManager isFirmwareUpdateActive](v7, "isFirmwareUpdateActive"))
  {
    v12 = (void *)MEMORY[0x242656984]();
    v13 = v7;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v35 = v15;
      _os_log_impl(&dword_23E95B000, v14, OS_LOG_TYPE_INFO, "%{public}@Not currently in a firmware update mode", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v12);
  }
  -[HMMTRThreadRadioManager delegate](v7, "delegate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMTRThreadRadioManager fabricIDOfActiveThreadNetwork](v7, "fabricIDOfActiveThreadNetwork");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = MEMORY[0x24BDAC760];
  v29 = 3221225472;
  v30 = __70__HMMTRThreadRadioManager__stopAccessoryFirmwareUpdateWithCompletion___block_invoke;
  v31 = &unk_250F23CD0;
  v32 = v7;
  v33 = v4;
  objc_msgSend(v16, "stopAccessoryFirmwareUpdateWithFabricID:completion:", v17, &v28);

  -[HMMTRThreadRadioManager allowDisconnect](v7, "allowDisconnect", v28, v29, v30, v31, v32);
LABEL_15:

}

- (BOOL)hasMatterThreadAccessoryInHomeWithFabricID:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[HMMTRThreadRadioManager delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hasMatterThreadAccessoryInHomeWithFabricID:", v4);

  return v6;
}

- (void)allowDisconnect
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __42__HMMTRThreadRadioManager_allowDisconnect__block_invoke;
  v2[3] = &unk_250F23DF0;
  v2[4] = self;
  -[HMMTRThreadRadioManager dispatchBlock:](self, "dispatchBlock:", v2);
}

- (void)_allowDisconnect
{
  uint64_t v3;
  void *v4;
  BOOL v5;
  uint64_t v6;
  void *v7;
  BOOL v8;
  void *v9;
  HMMTRThreadRadioManager *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  HMMTRThreadRadioManager *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  HMMTRThreadRadioManager *v21;
  NSObject *v22;
  void *v23;
  int v24;
  void *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  if (isFeatureMatteriPhoneOnlyPairingControlForThreadEnabled()
    && (-[HMMTRThreadRadioManager delegate](self, "delegate"), (v3 = objc_claimAutoreleasedReturnValue()) != 0)
    && (v4 = (void *)v3,
        v5 = -[HMMTRThreadRadioManager deviceSupportsThreadService](self, "deviceSupportsThreadService"),
        v4,
        v5))
  {
    -[HMMTRThreadRadioManager fabricIDOfActiveThreadNetwork](self, "fabricIDOfActiveThreadNetwork");
    v6 = objc_claimAutoreleasedReturnValue();
    if (!v6
      || (v7 = (void *)v6,
          v8 = -[HMMTRThreadRadioManager preventDisconnect](self, "preventDisconnect"),
          v7,
          !v8))
    {
      v9 = (void *)MEMORY[0x242656984]();
      v10 = self;
      HMFGetOSLogHandle();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMMTRThreadRadioManager fabricIDOfActiveThreadNetwork](v10, "fabricIDOfActiveThreadNetwork");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMMTRThreadRadioManager preventDisconnect](v10, "preventDisconnect");
        HMFBooleanToString();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = 138543874;
        v25 = v12;
        v26 = 2112;
        v27 = v13;
        v28 = 2112;
        v29 = v14;
        _os_log_impl(&dword_23E95B000, v11, OS_LOG_TYPE_ERROR, "%{public}@Unexpected state, fabricIDOfActiveThreadNetwork = %@, preventDisconnect = %@", (uint8_t *)&v24, 0x20u);

      }
      objc_autoreleasePoolPop(v9);
    }
    v15 = (void *)MEMORY[0x242656984]();
    v16 = self;
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMMTRThreadRadioManager fabricIDOfActiveThreadNetwork](v16, "fabricIDOfActiveThreadNetwork");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 138543618;
      v25 = v18;
      v26 = 2112;
      v27 = v19;
      _os_log_impl(&dword_23E95B000, v17, OS_LOG_TYPE_INFO, "%{public}@Allowing thread stop for fabricID %@", (uint8_t *)&v24, 0x16u);

    }
    objc_autoreleasePoolPop(v15);
    -[HMMTRThreadRadioManager setPreventDisconnect:](v16, "setPreventDisconnect:", 0);
  }
  else
  {
    v20 = (void *)MEMORY[0x242656984]();
    v21 = self;
    HMFGetOSLogHandle();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 138543362;
      v25 = v23;
      _os_log_impl(&dword_23E95B000, v22, OS_LOG_TYPE_DEBUG, "%{public}@Thread radio feature is not enabled", (uint8_t *)&v24, 0xCu);

    }
    objc_autoreleasePoolPop(v20);
  }
}

- (void)stopThreadRadioForHomeWithFabricID:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __62__HMMTRThreadRadioManager_stopThreadRadioForHomeWithFabricID___block_invoke;
  v6[3] = &unk_250F22458;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[HMMTRThreadRadioManager dispatchBlock:](self, "dispatchBlock:", v6);

}

- (void)_stopThreadRadioForHomeWithFabricID:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  BOOL v7;
  void *v8;
  HMMTRThreadRadioManager *v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  HMMTRThreadRadioManager *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  HMMTRThreadRadioManager *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  __int16 v26;
  id v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (!isFeatureMatteriPhoneOnlyPairingControlForThreadEnabled()
    || (-[HMMTRThreadRadioManager delegate](self, "delegate"), (v5 = objc_claimAutoreleasedReturnValue()) == 0)
    || (v6 = (void *)v5,
        v7 = -[HMMTRThreadRadioManager deviceSupportsThreadService](self, "deviceSupportsThreadService"),
        v6,
        !v7))
  {
    v17 = MEMORY[0x242656984]();
    v18 = self;
    HMFGetOSLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 138543362;
      v25 = v20;
      _os_log_impl(&dword_23E95B000, v19, OS_LOG_TYPE_DEBUG, "%{public}@Thread radio feature is not enabled", (uint8_t *)&v24, 0xCu);

    }
    v21 = (void *)v17;
    goto LABEL_13;
  }
  v8 = (void *)MEMORY[0x242656984]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 138543618;
    v25 = v11;
    v26 = 2112;
    v27 = v4;
    _os_log_impl(&dword_23E95B000, v10, OS_LOG_TYPE_INFO, "%{public}@Stop thread for fabricID %@", (uint8_t *)&v24, 0x16u);

  }
  objc_autoreleasePoolPop(v8);
  if (!v4)
  {
    v12 = MEMORY[0x242656984]();
    v13 = v9;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 138543362;
      v25 = v15;
      _os_log_impl(&dword_23E95B000, v14, OS_LOG_TYPE_INFO, "%{public}@Invalid fabricID, ignoring thread radio stop", (uint8_t *)&v24, 0xCu);
      goto LABEL_17;
    }
LABEL_18:

    v21 = (void *)v12;
LABEL_13:
    objc_autoreleasePoolPop(v21);
    goto LABEL_14;
  }
  if (-[HMMTRThreadRadioManager preventDisconnect](v9, "preventDisconnect"))
  {
    v12 = MEMORY[0x242656984]();
    v13 = v9;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMMTRThreadRadioManager fabricIDOfActiveThreadNetwork](v13, "fabricIDOfActiveThreadNetwork");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 138543874;
      v25 = v15;
      v26 = 2112;
      v27 = v4;
      v28 = 2112;
      v29 = v16;
      _os_log_impl(&dword_23E95B000, v14, OS_LOG_TYPE_INFO, "%{public}@Preventing thread stop for fabricID %@ because preventDisconnect is true and locked to fabricID %@", (uint8_t *)&v24, 0x20u);

LABEL_17:
      goto LABEL_18;
    }
    goto LABEL_18;
  }
  -[HMMTRThreadRadioManager setLastKnownThreadNetworkConnectionState:](v9, "setLastKnownThreadNetworkConnectionState:", 1);
  -[HMMTRThreadRadioManager delegate](v9, "delegate");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "stopThreadRadioForHomeWithFabricID:", v4);

  -[HMMTRThreadRadioManager _updateFabricIDOfActiveThreadNetwork:isFabricIDOfSystemCommissioner:](v9, "_updateFabricIDOfActiveThreadNetwork:isFabricIDOfSystemCommissioner:", 0, 0);
  -[HMMTRThreadRadioManager setEMACAddressOfWEDAccessory:](v9, "setEMACAddressOfWEDAccessory:", 0);
  if (CFPreferencesGetAppBooleanValue(CFSTR("StartThreadOnWake"), CFSTR("/Library/Managed Preferences/mobile/com.apple.homed.plist"), 0)&& -[HMMTRThreadRadioManager deviceIsLockedAndPendingStopThread](v9, "deviceIsLockedAndPendingStopThread"))
  {
    -[HMMTRThreadRadioManager delegate](v9, "delegate");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "stopThreadRadioOnDeviceLock");

  }
LABEL_14:

}

- (void)startThreadRadioForSystemCommissionerFabricID:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __73__HMMTRThreadRadioManager_startThreadRadioForSystemCommissionerFabricID___block_invoke;
  v6[3] = &unk_250F22458;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[HMMTRThreadRadioManager dispatchBlock:](self, "dispatchBlock:", v6);

}

- (void)overrideLocationCheckForPairingForFabricID:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __70__HMMTRThreadRadioManager_overrideLocationCheckForPairingForFabricID___block_invoke;
  v6[3] = &unk_250F22458;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[HMMTRThreadRadioManager dispatchBlock:](self, "dispatchBlock:", v6);

}

- (void)_startThreadRadioForSystemCommissionerFabricID:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  BOOL v7;
  void *v8;
  HMMTRThreadRadioManager *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  HMMTRThreadRadioManager *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  HMMTRThreadRadioManager *v19;
  NSObject *v20;
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
  if (!isFeatureMatteriPhoneOnlyPairingControlForThreadEnabled()
    || (-[HMMTRThreadRadioManager delegate](self, "delegate"), (v5 = objc_claimAutoreleasedReturnValue()) == 0)
    || (v6 = (void *)v5,
        v7 = -[HMMTRThreadRadioManager deviceSupportsThreadService](self, "deviceSupportsThreadService"),
        v6,
        !v7))
  {
    v18 = MEMORY[0x242656984]();
    v19 = self;
    HMFGetOSLogHandle();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 138543362;
      v25 = v21;
      _os_log_impl(&dword_23E95B000, v20, OS_LOG_TYPE_DEBUG, "%{public}@Thread radio feature is not enabled", (uint8_t *)&v24, 0xCu);

    }
    v22 = (void *)v18;
    goto LABEL_13;
  }
  v8 = (void *)MEMORY[0x242656984]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 138543618;
    v25 = v11;
    v26 = 2112;
    v27 = v4;
    _os_log_impl(&dword_23E95B000, v10, OS_LOG_TYPE_INFO, "%{public}@Start thread for system commissioner fabric ID %@", (uint8_t *)&v24, 0x16u);

  }
  objc_autoreleasePoolPop(v8);
  if (v4)
  {
    -[HMMTRThreadRadioManager fabricIDOfActiveThreadNetwork](v9, "fabricIDOfActiveThreadNetwork");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v12)
    {
      -[HMMTRThreadRadioManager _updateFabricIDOfActiveThreadNetwork:isFabricIDOfSystemCommissioner:](v9, "_updateFabricIDOfActiveThreadNetwork:isFabricIDOfSystemCommissioner:", v4, 1);
      -[HMMTRThreadRadioManager setPreventDisconnect:](v9, "setPreventDisconnect:", 0);
      -[HMMTRThreadRadioManager delegate](v9, "delegate");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "startThreadRadioForUserPreferredNetwork");

      goto LABEL_14;
    }
    v13 = MEMORY[0x242656984]();
    v14 = v9;
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      goto LABEL_18;
    HMFGetLogIdentifier();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMMTRThreadRadioManager fabricIDOfActiveThreadNetwork](v14, "fabricIDOfActiveThreadNetwork");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 138543618;
    v25 = v16;
    v26 = 2112;
    v27 = v17;
    _os_log_impl(&dword_23E95B000, v15, OS_LOG_TYPE_INFO, "%{public}@Thread network is already running for fabric ID %@. Not starting Thread.", (uint8_t *)&v24, 0x16u);

    goto LABEL_17;
  }
  v13 = MEMORY[0x242656984]();
  v14 = v9;
  HMFGetOSLogHandle();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 138543362;
    v25 = v16;
    _os_log_impl(&dword_23E95B000, v15, OS_LOG_TYPE_INFO, "%{public}@Invalid fabricID, ignoring thread radio start", (uint8_t *)&v24, 0xCu);
LABEL_17:

  }
LABEL_18:

  v22 = (void *)v13;
LABEL_13:
  objc_autoreleasePoolPop(v22);
LABEL_14:

}

- (void)stopThreadRadioForSystemCommissionerFabricID:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __72__HMMTRThreadRadioManager_stopThreadRadioForSystemCommissionerFabricID___block_invoke;
  v6[3] = &unk_250F22458;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[HMMTRThreadRadioManager dispatchBlock:](self, "dispatchBlock:", v6);

}

- (void)_stopThreadRadioForSystemCommissionerFabricID:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  BOOL v7;
  void *v8;
  HMMTRThreadRadioManager *v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  HMMTRThreadRadioManager *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  const char *v17;
  NSObject *v18;
  uint32_t v19;
  uint64_t v20;
  HMMTRThreadRadioManager *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  char v28;
  void *v29;
  void *v30;
  int v31;
  void *v32;
  __int16 v33;
  id v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (!isFeatureMatteriPhoneOnlyPairingControlForThreadEnabled()
    || (-[HMMTRThreadRadioManager delegate](self, "delegate"), (v5 = objc_claimAutoreleasedReturnValue()) == 0)
    || (v6 = (void *)v5,
        v7 = -[HMMTRThreadRadioManager deviceSupportsThreadService](self, "deviceSupportsThreadService"),
        v6,
        !v7))
  {
    v20 = MEMORY[0x242656984]();
    v21 = self;
    HMFGetOSLogHandle();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = 138543362;
      v32 = v23;
      _os_log_impl(&dword_23E95B000, v22, OS_LOG_TYPE_DEBUG, "%{public}@Thread radio feature is not enabled", (uint8_t *)&v31, 0xCu);

    }
    v24 = (void *)v20;
    goto LABEL_13;
  }
  v8 = (void *)MEMORY[0x242656984]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = 138543618;
    v32 = v11;
    v33 = 2112;
    v34 = v4;
    _os_log_impl(&dword_23E95B000, v10, OS_LOG_TYPE_INFO, "%{public}@Stop thread for system commissioner fabric ID %@", (uint8_t *)&v31, 0x16u);

  }
  objc_autoreleasePoolPop(v8);
  if (!v4)
  {
    v12 = MEMORY[0x242656984]();
    v13 = v9;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = 138543362;
      v32 = v15;
      _os_log_impl(&dword_23E95B000, v14, OS_LOG_TYPE_INFO, "%{public}@Invalid fabricID, ignoring thread radio stop", (uint8_t *)&v31, 0xCu);
LABEL_25:

      goto LABEL_26;
    }
    goto LABEL_26;
  }
  if (-[HMMTRThreadRadioManager preventDisconnect](v9, "preventDisconnect"))
  {
    v12 = MEMORY[0x242656984]();
    v13 = v9;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMMTRThreadRadioManager fabricIDOfActiveThreadNetwork](v13, "fabricIDOfActiveThreadNetwork");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = 138543874;
      v32 = v15;
      v33 = 2112;
      v34 = v4;
      v35 = 2112;
      v36 = v16;
      v17 = "%{public}@Preventing thread stop for system commissioner fabricID %@ because preventDisconnect is true and l"
            "ocked to fabricID %@";
      v18 = v14;
      v19 = 32;
LABEL_24:
      _os_log_impl(&dword_23E95B000, v18, OS_LOG_TYPE_INFO, v17, (uint8_t *)&v31, v19);

      goto LABEL_25;
    }
    goto LABEL_26;
  }
  -[HMMTRThreadRadioManager fabricIDOfActiveThreadNetwork](v9, "fabricIDOfActiveThreadNetwork");
  v25 = objc_claimAutoreleasedReturnValue();
  if (v25)
  {
    v26 = (void *)v25;
    -[HMMTRThreadRadioManager fabricIDOfActiveThreadNetwork](v9, "fabricIDOfActiveThreadNetwork");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "isEqual:", v4);

    if ((v28 & 1) == 0)
    {
      v12 = MEMORY[0x242656984]();
      v13 = v9;
      HMFGetOSLogHandle();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMMTRThreadRadioManager fabricIDOfActiveThreadNetwork](v13, "fabricIDOfActiveThreadNetwork");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = 138543618;
        v32 = v15;
        v33 = 2112;
        v34 = v16;
        v17 = "%{public}@Thread network is running for another fabric ID %@. Not stopping Thread.";
        v18 = v14;
        v19 = 22;
        goto LABEL_24;
      }
LABEL_26:

      v24 = (void *)v12;
LABEL_13:
      objc_autoreleasePoolPop(v24);
      goto LABEL_14;
    }
  }
  -[HMMTRThreadRadioManager setLastKnownThreadNetworkConnectionState:](v9, "setLastKnownThreadNetworkConnectionState:", 1);
  -[HMMTRThreadRadioManager delegate](v9, "delegate");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "stopThreadRadioForUserPreferredNetwork");

  -[HMMTRThreadRadioManager _updateFabricIDOfActiveThreadNetwork:isFabricIDOfSystemCommissioner:](v9, "_updateFabricIDOfActiveThreadNetwork:isFabricIDOfSystemCommissioner:", 0, 0);
  if (CFPreferencesGetAppBooleanValue(CFSTR("StartThreadOnWake"), CFSTR("/Library/Managed Preferences/mobile/com.apple.homed.plist"), 0)&& -[HMMTRThreadRadioManager deviceIsLockedAndPendingStopThread](v9, "deviceIsLockedAndPendingStopThread"))
  {
    -[HMMTRThreadRadioManager delegate](v9, "delegate");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "stopThreadRadioOnDeviceLock");

  }
LABEL_14:

}

- (BOOL)isThreadNetworkConnected
{
  uint64_t v3;
  void *v4;
  BOOL v5;
  void *v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  unint64_t v12;
  void *v13;
  void *v14;
  HMMTRThreadRadioManager *v15;
  NSObject *v16;
  void *v17;
  void *v19;
  HMMTRThreadRadioManager *v20;
  NSObject *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  id v25;
  id v26;
  uint8_t buf[4];
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  if (isFeatureMatteriPhoneOnlyPairingControlForThreadEnabled())
  {
    -[HMMTRThreadRadioManager delegate](self, "delegate");
    v3 = objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      v4 = (void *)v3;
      v5 = -[HMMTRThreadRadioManager deviceSupportsThreadService](self, "deviceSupportsThreadService");

      if (v5)
      {
        -[HMMTRThreadRadioManager fabricIDOfActiveThreadNetwork](self, "fabricIDOfActiveThreadNetwork");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v6)
        {
          v19 = (void *)MEMORY[0x242656984]();
          v20 = self;
          HMFGetOSLogHandle();
          v21 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v28 = v22;
            _os_log_impl(&dword_23E95B000, v21, OS_LOG_TYPE_INFO, "%{public}@Thread is not active", buf, 0xCu);

          }
          objc_autoreleasePoolPop(v19);
          goto LABEL_22;
        }
        v7 = -[HMMTRThreadRadioManager threadNetworkActivatedForSystemCommissionerFabric](self, "threadNetworkActivatedForSystemCommissionerFabric");
        -[HMMTRThreadRadioManager delegate](self, "delegate");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v8;
        if (v7)
        {
          v26 = 0;
          v10 = objc_msgSend(v8, "getUserPreferredThreadNetworkConnectionStateWithError:", &v26);
          v11 = v26;

          v12 = 0;
          if (!v11 && v10 == 3)
          {
            -[HMMTRThreadRadioManager delegate](self, "delegate");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v25 = 0;
            v12 = objc_msgSend(v13, "getUserPreferredThreadNetworkNodeTypeWithError:", &v25);
            v11 = v25;

            if (v11)
              v12 = 0;
          }

        }
        else
        {
          v23 = objc_msgSend(v8, "getThreadNetworkConnectionStateWithFabricID:", v6);

          if (v23 != 3)
            goto LABEL_22;
          -[HMMTRThreadRadioManager delegate](self, "delegate");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v24, "getThreadNetworkNodeTypeWithFabricID:", v6);

        }
        if (v12 <= 7)
        {
          LODWORD(v15) = (0xFCu >> v12) & 1;
LABEL_23:

          return (char)v15;
        }
LABEL_22:
        LOBYTE(v15) = 0;
        goto LABEL_23;
      }
    }
  }
  v14 = (void *)MEMORY[0x242656984]();
  v15 = self;
  HMFGetOSLogHandle();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v28 = v17;
    _os_log_impl(&dword_23E95B000, v16, OS_LOG_TYPE_DEBUG, "%{public}@Thread radio feature is not enabled", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v14);
  LOBYTE(v15) = 0;
  return (char)v15;
}

- (BOOL)isReadyToEstablishWEDConnection
{
  uint64_t v3;
  void *v4;
  BOOL v5;
  void *v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  BOOL v12;
  void *v13;
  HMMTRThreadRadioManager *v14;
  NSObject *v15;
  void *v16;
  void *v18;
  HMMTRThreadRadioManager *v19;
  NSObject *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  BOOL v27;
  id v28;
  id v29;
  uint8_t buf[4];
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  if (isFeatureMatteriPhoneOnlyPairingControlForThreadEnabled())
  {
    -[HMMTRThreadRadioManager delegate](self, "delegate");
    v3 = objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      v4 = (void *)v3;
      v5 = -[HMMTRThreadRadioManager deviceSupportsThreadService](self, "deviceSupportsThreadService");

      if (v5)
      {
        -[HMMTRThreadRadioManager fabricIDOfActiveThreadNetwork](self, "fabricIDOfActiveThreadNetwork");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        if (v6)
        {
          v7 = -[HMMTRThreadRadioManager threadNetworkActivatedForSystemCommissionerFabric](self, "threadNetworkActivatedForSystemCommissionerFabric");
          -[HMMTRThreadRadioManager delegate](self, "delegate");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v9 = v8;
          if (v7)
          {
            v29 = 0;
            v10 = objc_msgSend(v8, "getUserPreferredThreadNetworkConnectionStateWithError:", &v29);
            v11 = v29;

            if (v11)
            {
              v12 = 1;
            }
            else if (v10 == 3)
            {
              -[HMMTRThreadRadioManager delegate](self, "delegate");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              v28 = 0;
              v26 = objc_msgSend(v25, "getUserPreferredThreadNetworkNodeTypeWithError:", &v28);
              v11 = v28;

              if (v11)
                v27 = 1;
              else
                v27 = v26 == 1;
              v12 = v27;
            }
            else
            {
              v11 = 0;
              v12 = 0;
            }

            goto LABEL_28;
          }
          v22 = objc_msgSend(v8, "getThreadNetworkConnectionStateWithFabricID:", v6);

          if (v22 == 3)
          {
            -[HMMTRThreadRadioManager delegate](self, "delegate");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = objc_msgSend(v23, "getThreadNetworkNodeTypeWithFabricID:", v6);

            if (v24 == 1)
            {
              v12 = 1;
LABEL_28:

              return v12;
            }
          }
        }
        else
        {
          v18 = (void *)MEMORY[0x242656984]();
          v19 = self;
          HMFGetOSLogHandle();
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v31 = v21;
            _os_log_impl(&dword_23E95B000, v20, OS_LOG_TYPE_INFO, "%{public}@Thread is not active", buf, 0xCu);

          }
          objc_autoreleasePoolPop(v18);
        }
        v12 = 0;
        goto LABEL_28;
      }
    }
  }
  v13 = (void *)MEMORY[0x242656984]();
  v14 = self;
  HMFGetOSLogHandle();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v31 = v16;
    _os_log_impl(&dword_23E95B000, v15, OS_LOG_TYPE_DEBUG, "%{public}@Thread radio feature is not enabled", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v13);
  return 0;
}

- (BOOL)isReadyToTransitionToFullRouterModeForFirmwareUpdate
{
  uint64_t v3;
  void *v4;
  BOOL v5;
  void *v6;
  void *v7;
  HMMTRThreadRadioManager *v8;
  NSObject *v9;
  void *v10;
  const char *v11;
  void *v12;
  HMMTRThreadRadioManager *v13;
  NSObject *v14;
  void *v15;
  void *v17;
  uint64_t v18;
  void *v19;
  int v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  if (isFeatureMatteriPhoneOnlyPairingControlForThreadEnabled())
  {
    -[HMMTRThreadRadioManager delegate](self, "delegate");
    v3 = objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      v4 = (void *)v3;
      v5 = -[HMMTRThreadRadioManager deviceSupportsThreadService](self, "deviceSupportsThreadService");

      if (v5)
      {
        -[HMMTRThreadRadioManager fabricIDOfActiveThreadNetwork](self, "fabricIDOfActiveThreadNetwork");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        if (v6)
        {
          if (-[HMMTRThreadRadioManager threadNetworkActivatedForSystemCommissionerFabric](self, "threadNetworkActivatedForSystemCommissionerFabric"))
          {
            v7 = (void *)MEMORY[0x242656984]();
            v8 = self;
            HMFGetOSLogHandle();
            v9 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
            {
              HMFGetLogIdentifier();
              v10 = (void *)objc_claimAutoreleasedReturnValue();
              v20 = 138543362;
              v21 = v10;
              v11 = "%{public}@Firmware updates shouldn't be triggered from system commissioner fabric";
LABEL_17:
              _os_log_impl(&dword_23E95B000, v9, OS_LOG_TYPE_ERROR, v11, (uint8_t *)&v20, 0xCu);

            }
          }
          else
          {
            if (!-[HMMTRThreadRadioManager isPairingActive](self, "isPairingActive"))
            {
              -[HMMTRThreadRadioManager delegate](self, "delegate");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              v18 = objc_msgSend(v17, "getThreadNetworkConnectionStateWithFabricID:", v6);

              if (v18 == 3)
              {
                -[HMMTRThreadRadioManager delegate](self, "delegate");
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                v13 = (HMMTRThreadRadioManager *)objc_msgSend(v19, "getThreadNetworkNodeTypeWithFabricID:", v6);

                if ((unint64_t)v13 <= 7)
                {
                  LODWORD(v13) = (0x86u >> (char)v13) & 1;
                  goto LABEL_20;
                }
              }
LABEL_19:
              LOBYTE(v13) = 0;
LABEL_20:

              return (char)v13;
            }
            v7 = (void *)MEMORY[0x242656984]();
            v8 = self;
            HMFGetOSLogHandle();
            v9 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
            {
              HMFGetLogIdentifier();
              v10 = (void *)objc_claimAutoreleasedReturnValue();
              v20 = 138543362;
              v21 = v10;
              v11 = "%{public}@Currently in pairing mode, cannot transition to fw update mode";
              goto LABEL_17;
            }
          }
        }
        else
        {
          v7 = (void *)MEMORY[0x242656984]();
          v8 = self;
          HMFGetOSLogHandle();
          v9 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = 138543362;
            v21 = v10;
            v11 = "%{public}@Thread is not active";
            goto LABEL_17;
          }
        }

        objc_autoreleasePoolPop(v7);
        goto LABEL_19;
      }
    }
  }
  v12 = (void *)MEMORY[0x242656984]();
  v13 = self;
  HMFGetOSLogHandle();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 138543362;
    v21 = v15;
    _os_log_impl(&dword_23E95B000, v14, OS_LOG_TYPE_DEBUG, "%{public}@Thread radio feature is not enabled", (uint8_t *)&v20, 0xCu);

  }
  objc_autoreleasePoolPop(v12);
  LOBYTE(v13) = 0;
  return (char)v13;
}

- (void)_updateFabricIDOfActiveThreadNetwork:(id)a3 isFabricIDOfSystemCommissioner:(BOOL)a4
{
  _BOOL8 v4;

  v4 = a4;
  -[HMMTRThreadRadioManager setFabricIDOfActiveThreadNetwork:](self, "setFabricIDOfActiveThreadNetwork:", a3);
  -[HMMTRThreadRadioManager setThreadNetworkActivatedForSystemCommissionerFabric:](self, "setThreadNetworkActivatedForSystemCommissionerFabric:", v4);
}

- (void)notifyThreadRadioStateChanged:(int64_t)a3 nodeType:(int64_t)a4 fabricID:(id)a5
{
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  int64_t v12;
  int64_t v13;

  v8 = a5;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __75__HMMTRThreadRadioManager_notifyThreadRadioStateChanged_nodeType_fabricID___block_invoke;
  v10[3] = &unk_250F21020;
  v12 = a3;
  v13 = a4;
  v10[4] = self;
  v11 = v8;
  v9 = v8;
  -[HMMTRThreadRadioManager dispatchBlock:](self, "dispatchBlock:", v10);

}

- (void)_notifyThreadRadioStateChanged:(int64_t)a3 nodeType:(int64_t)a4 fabricID:(id)a5
{
  id v8;
  void *v9;
  HMMTRThreadRadioManager *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  _BOOL4 v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  void *v19;
  BOOL v20;
  void *v21;
  HMMTRThreadRadioManager *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  HMMTRThreadRadioManager *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  HMMTRThreadRadioManager *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  HMMTRThreadRadioManager *v36;
  NSObject *v37;
  void *v38;
  void *v39;
  HMMTRThreadRadioManager *v40;
  NSObject *v41;
  void *v42;
  id v43;
  void *v44;
  void *v45;
  void *v46;
  dispatch_time_t v47;
  NSObject *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *context;
  _QWORD block[8];
  _QWORD v55[3];
  BOOL v56;
  _QWORD v57[3];
  BOOL v58;
  _QWORD v59[2];
  _QWORD v60[2];
  _BYTE buf[24];
  id v62;
  _BYTE v63[20];
  uint64_t v64;

  v64 = *MEMORY[0x24BDAC8D0];
  v8 = a5;
  v9 = (void *)MEMORY[0x242656984]();
  v10 = self;
  HMFGetOSLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544386;
    *(_QWORD *)&buf[4] = v12;
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = a3;
    *(_WORD *)&buf[22] = 2048;
    v62 = a4;
    *(_WORD *)v63 = 2112;
    *(_QWORD *)&v63[2] = v8;
    *(_WORD *)&v63[10] = 2048;
    *(_QWORD *)&v63[12] = -[HMMTRThreadRadioManager lastKnownThreadNetworkConnectionState](v10, "lastKnownThreadNetworkConnectionState");
    _os_log_impl(&dword_23E95B000, v11, OS_LOG_TYPE_INFO, "%{public}@Received thread radio state changed notification, connectionState: %ld, nodeType: %ld, fabricID:%@, last known connectionState: %ld", buf, 0x34u);

  }
  objc_autoreleasePoolPop(v9);
  -[HMMTRThreadRadioManager fabricIDOfActiveThreadNetwork](v10, "fabricIDOfActiveThreadNetwork");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13 == 0;

  if (v14)
  {
    v31 = (void *)MEMORY[0x242656984]();
    v32 = v10;
    HMFGetOSLogHandle();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v34;
      _os_log_impl(&dword_23E95B000, v33, OS_LOG_TYPE_INFO, "%{public}@No active fabric, no action taken on thread state change", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v31);
    -[HMMTRThreadRadioManager setLastKnownThreadNetworkConnectionState:](v32, "setLastKnownThreadNetworkConnectionState:", a3);
  }
  else
  {
    if (!v8)
    {
      -[HMMTRThreadRadioManager browser](v10, "browser");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "systemCommissionerFabricID");
      v8 = (id)objc_claimAutoreleasedReturnValue();

    }
    -[HMMTRThreadRadioManager fabricIDOfActiveThreadNetwork](v10, "fabricIDOfActiveThreadNetwork");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "isEqual:", v8);

    if ((v17 & 1) != 0)
    {
      if (a3 == 1)
      {
        if (-[HMMTRThreadRadioManager lastKnownThreadNetworkConnectionState](v10, "lastKnownThreadNetworkConnectionState")&& -[HMMTRThreadRadioManager lastKnownThreadNetworkConnectionState](v10, "lastKnownThreadNetworkConnectionState") != 1)
        {
          context = (void *)MEMORY[0x242656984]();
          v40 = v10;
          HMFGetOSLogHandle();
          v41 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            -[HMMTRThreadRadioManager fabricIDOfActiveThreadNetwork](v40, "fabricIDOfActiveThreadNetwork");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            -[HMMTRThreadRadioManager threadNetworkActivatedForSystemCommissionerFabric](v40, "threadNetworkActivatedForSystemCommissionerFabric");
            HMFBooleanToString();
            v43 = (id)objc_claimAutoreleasedReturnValue();
            -[HMMTRThreadRadioManager preventDisconnect](v40, "preventDisconnect");
            HMFBooleanToString();
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138544130;
            *(_QWORD *)&buf[4] = v52;
            *(_WORD *)&buf[12] = 2112;
            *(_QWORD *)&buf[14] = v42;
            *(_WORD *)&buf[22] = 2112;
            v62 = (int64_t)v43;
            *(_WORD *)v63 = 2112;
            *(_QWORD *)&v63[2] = v44;
            _os_log_impl(&dword_23E95B000, v41, OS_LOG_TYPE_ERROR, "%{public}@Unexpected, thread radio went offline. Restarting thread radio for fabric ID: %@, is system commissioner: %@, preventDisconnect = %@", buf, 0x2Au);

          }
          objc_autoreleasePoolPop(context);
          v57[0] = 0;
          v57[1] = v57;
          v57[2] = 0x2020000000;
          v58 = 0;
          v58 = -[HMMTRThreadRadioManager preventDisconnect](v40, "preventDisconnect");
          v55[0] = 0;
          v55[1] = v55;
          v55[2] = 0x2020000000;
          v56 = 0;
          v56 = -[HMMTRThreadRadioManager threadNetworkActivatedForSystemCommissionerFabric](v40, "threadNetworkActivatedForSystemCommissionerFabric");
          *(_QWORD *)buf = 0;
          *(_QWORD *)&buf[8] = buf;
          *(_QWORD *)&buf[16] = 0x3032000000;
          v62 = (int64_t)__Block_byref_object_copy__3731;
          *(_QWORD *)v63 = __Block_byref_object_dispose__3732;
          -[HMMTRThreadRadioManager fabricIDOfActiveThreadNetwork](v40, "fabricIDOfActiveThreadNetwork");
          *(_QWORD *)&v63[8] = objc_claimAutoreleasedReturnValue();
          if (-[HMMTRThreadRadioManager threadNetworkActivatedForSystemCommissionerFabric](v40, "threadNetworkActivatedForSystemCommissionerFabric"))
          {
            -[HMMTRThreadRadioManager delegate](v40, "delegate");
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v45, "stopThreadRadioForUserPreferredNetwork");
          }
          else
          {
            -[HMMTRThreadRadioManager delegate](v40, "delegate");
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            -[HMMTRThreadRadioManager fabricIDOfActiveThreadNetwork](v40, "fabricIDOfActiveThreadNetwork");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v45, "stopThreadRadioForHomeWithFabricID:", v46);

          }
          -[HMMTRThreadRadioManager setPreventDisconnect:](v40, "setPreventDisconnect:", 0);
          -[HMMTRThreadRadioManager _updateFabricIDOfActiveThreadNetwork:isFabricIDOfSystemCommissioner:](v40, "_updateFabricIDOfActiveThreadNetwork:isFabricIDOfSystemCommissioner:", 0, 0);
          if (!-[HMMTRThreadRadioManager pendingThreadStart](v40, "pendingThreadStart"))
          {
            -[HMMTRThreadRadioManager setPendingThreadStart:](v40, "setPendingThreadStart:", 1);
            v47 = dispatch_time(0, 100000000);
            -[HMMTRThreadRadioManager workQueue](v40, "workQueue");
            v48 = objc_claimAutoreleasedReturnValue();
            block[0] = MEMORY[0x24BDAC760];
            block[1] = 3221225472;
            block[2] = __76__HMMTRThreadRadioManager__notifyThreadRadioStateChanged_nodeType_fabricID___block_invoke;
            block[3] = &unk_250F21048;
            block[4] = v40;
            block[5] = v55;
            block[6] = buf;
            block[7] = v57;
            dispatch_after(v47, v48, block);

          }
          _Block_object_dispose(buf, 8);

          _Block_object_dispose(v55, 8);
          _Block_object_dispose(v57, 8);
        }
        goto LABEL_36;
      }
      if (a3 == 3)
      {
        -[HMMTRThreadRadioManager fabricIDOfPendingStartPairingBlock](v10, "fabricIDOfPendingStartPairingBlock");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v8, "isEqual:", v18))
        {
          -[HMMTRThreadRadioManager pendingStartPairingBlock](v10, "pendingStartPairingBlock");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = v19 == 0;

          if (v20)
            goto LABEL_16;
          v21 = (void *)MEMORY[0x242656984]();
          v22 = v10;
          HMFGetOSLogHandle();
          v23 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            -[HMMTRThreadRadioManager _connectionStateValueToString:](v22, "_connectionStateValueToString:", 3);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            *(_QWORD *)&buf[4] = v24;
            *(_WORD *)&buf[12] = 2112;
            *(_QWORD *)&buf[14] = v25;
            *(_WORD *)&buf[22] = 2112;
            v62 = (int64_t)v8;
            _os_log_impl(&dword_23E95B000, v23, OS_LOG_TYPE_INFO, "%{public}@Thread network connection state: %@ for fabricID: %@, calling start pairing block now", buf, 0x20u);

          }
          objc_autoreleasePoolPop(v21);
          -[HMMTRThreadRadioManager pendingStartPairingBlock](v22, "pendingStartPairingBlock");
          v26 = objc_claimAutoreleasedReturnValue();
          v18 = (void *)v26;
          if (v26)
            (*(void (**)(uint64_t, _QWORD))(v26 + 16))(v26, 0);
        }

      }
LABEL_16:
      if (-[HMMTRThreadRadioManager isWEDConnectionRetryActive](v10, "isWEDConnectionRetryActive"))
      {
        v27 = (void *)MEMORY[0x242656984]();
        v28 = v10;
        HMFGetOSLogHandle();
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          *(_QWORD *)&buf[4] = v30;
          _os_log_impl(&dword_23E95B000, v29, OS_LOG_TYPE_INFO, "%{public}@WED connection retry is active", buf, 0xCu);

        }
        objc_autoreleasePoolPop(v27);
      }
LABEL_36:
      -[HMMTRThreadRadioManager setLastKnownThreadNetworkConnectionState:](v10, "setLastKnownThreadNetworkConnectionState:", a3);
      v59[0] = CFSTR("HMMTRThreadRadioConnectionStateKey");
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v59[1] = CFSTR("HMMTRThreadRadioNodeTypeKey");
      v60[0] = v49;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a4);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v60[1] = v50;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v60, v59, 2);
      v51 = (void *)objc_claimAutoreleasedReturnValue();

      -[HMMTRThreadRadioManager postNotification:userInfo:](v10, "postNotification:userInfo:", CFSTR("HMMTRThreadRadioStateChangedNotification"), v51);
      goto LABEL_37;
    }
    v35 = (void *)MEMORY[0x242656984]();
    v36 = v10;
    HMFGetOSLogHandle();
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMMTRThreadRadioManager fabricIDOfActiveThreadNetwork](v36, "fabricIDOfActiveThreadNetwork");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      *(_QWORD *)&buf[4] = v38;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v39;
      *(_WORD *)&buf[22] = 2112;
      v62 = (int64_t)v8;
      _os_log_impl(&dword_23E95B000, v37, OS_LOG_TYPE_INFO, "%{public}@Dropping notification as the fabricID does not match that of the active network, activeNetworkFabricID: %@, fabricID: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v35);
  }
LABEL_37:

}

- (BOOL)_shouldRetryWEDConnectionToAccessory
{
  void *v3;
  void *v4;
  BOOL v5;
  void *v7;
  HMMTRThreadRadioManager *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void (**v16)(_QWORD, _QWORD);
  void *v17;
  int v18;
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  -[HMMTRThreadRadioManager browser](self, "browser");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v3, "isCurrentDeviceAllowedAccessoryControlDespiteReachableResident"))
    goto LABEL_7;
  -[HMMTRThreadRadioManager eMACAddressOfWEDAccessory](self, "eMACAddressOfWEDAccessory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4 || !-[HMMTRThreadRadioManager isWEDConnectionRetryActive](self, "isWEDConnectionRetryActive"))
  {

LABEL_7:
    goto LABEL_8;
  }
  v5 = -[HMMTRThreadRadioManager isReadyToEstablishWEDConnection](self, "isReadyToEstablishWEDConnection");

  if (v5)
    return 1;
LABEL_8:
  v7 = (void *)MEMORY[0x242656984]();
  v8 = self;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMMTRThreadRadioManager eMACAddressOfWEDAccessory](v8, "eMACAddressOfWEDAccessory");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMMTRThreadRadioManager browser](v8, "browser");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "isCurrentDeviceAllowedAccessoryControlDespiteReachableResident");
    HMFBooleanToString();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMMTRThreadRadioManager isWEDConnectionRetryActive](v8, "isWEDConnectionRetryActive");
    HMFBooleanToString();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMMTRThreadRadioManager isReadyToEstablishWEDConnection](v8, "isReadyToEstablishWEDConnection");
    HMFBooleanToString();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 138544386;
    v19 = v10;
    v20 = 2112;
    v21 = v11;
    v22 = 2112;
    v23 = v13;
    v24 = 2112;
    v25 = v14;
    v26 = 2112;
    v27 = v15;
    _os_log_impl(&dword_23E95B000, v9, OS_LOG_TYPE_INFO, "%{public}@Not retrying thread connection. eMACAddress: %@, allowedAccessoryControlDespiteReachableResident: %@, connection retry: %@, isReadyToEstablishWEDConnection: %@", (uint8_t *)&v18, 0x34u);

  }
  objc_autoreleasePoolPop(v7);
  -[HMMTRThreadRadioManager setIsWEDConnectionRetryActive:](v8, "setIsWEDConnectionRetryActive:", 0);
  -[HMMTRThreadRadioManager retryCompletionHandler](v8, "retryCompletionHandler");
  v16 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  -[HMMTRThreadRadioManager setRetryCompletionHandler:](v8, "setRetryCompletionHandler:", 0);
  if (v16)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:", 12);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v16)[2](v16, v17);

  }
  return 0;
}

- (double)_computeRetryDelayForError:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  double v11;
  uint64_t v13;

  v3 = a3;
  v4 = v3;
  v13 = 0x4059000000000000;
  if (v3 && (objc_msgSend(v3, "userInfo"), v5 = (void *)objc_claimAutoreleasedReturnValue(), v5, v5))
  {
    objc_msgSend(v4, "userInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x24BDD0FF0]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v8 = v7;
    else
      v8 = 0;
    v9 = v8;

    if (v9)
    {
      objc_msgSend(MEMORY[0x24BDD17A8], "scannerWithString:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v10, "scanDouble:", &v13) & 1) == 0)
        v13 = 0x4059000000000000;

    }
    v11 = *(double *)&v13;
  }
  else
  {
    v11 = 100.0;
  }

  return v11;
}

- (void)_retryWEDConnectionToAccessoryWithDelayInMs:(double)a3
{
  void *v5;
  HMMTRThreadRadioManager *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  float v10;
  dispatch_time_t v11;
  _QWORD v12[5];
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  double v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  if (-[HMMTRThreadRadioManager _shouldRetryWEDConnectionToAccessory](self, "_shouldRetryWEDConnectionToAccessory"))
  {
    v5 = (void *)MEMORY[0x242656984]();
    v6 = self;
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMMTRThreadRadioManager eMACAddressOfWEDAccessory](v6, "eMACAddressOfWEDAccessory");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = a3;
      *(_DWORD *)buf = 138543874;
      v14 = v8;
      v15 = 2112;
      v16 = v9;
      v17 = 2048;
      v18 = v10;
      _os_log_impl(&dword_23E95B000, v7, OS_LOG_TYPE_INFO, "%{public}@Attempting to retry WED connection to eMACAddress: %@ after %f milliseconds", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v5);
    v11 = dispatch_time(0, (uint64_t)(a3 * 1000000.0));
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __71__HMMTRThreadRadioManager__retryWEDConnectionToAccessoryWithDelayInMs___block_invoke;
    v12[3] = &unk_250F23DF0;
    v12[4] = v6;
    -[HMMTRThreadRadioManager dispatchAfter:block:](v6, "dispatchAfter:block:", v11, v12);
  }
}

- (void)notifyWakeOnDeviceConnectionChanged:(int64_t)a3 eMACAddress:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;
  int64_t v10;

  v6 = a4;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __75__HMMTRThreadRadioManager_notifyWakeOnDeviceConnectionChanged_eMACAddress___block_invoke;
  v8[3] = &unk_250F22A00;
  v9 = v6;
  v10 = a3;
  v8[4] = self;
  v7 = v6;
  -[HMMTRThreadRadioManager dispatchBlock:](self, "dispatchBlock:", v8);

}

- (void)_notifyWakeOnDeviceConnectionChanged:(int64_t)a3 eMACAddress:(id)a4
{
  id v6;
  void *v7;
  HMMTRThreadRadioManager *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  BOOL v13;
  int v14;
  void *v15;
  __int16 v16;
  id v17;
  __int16 v18;
  int64_t v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = (void *)MEMORY[0x242656984]();
  v8 = self;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMMTRThreadRadioManager eMACAddressOfWEDAccessory](v8, "eMACAddressOfWEDAccessory");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138544130;
    v15 = v10;
    v16 = 2112;
    v17 = v6;
    v18 = 2048;
    v19 = a3;
    v20 = 2112;
    v21 = v11;
    _os_log_impl(&dword_23E95B000, v9, OS_LOG_TYPE_INFO, "%{public}@Received thread WED connection changed notification for eMACAddress: %@ with state: %ld, eMACAddress of last connection: %@", (uint8_t *)&v14, 0x2Au);

  }
  objc_autoreleasePoolPop(v7);
  if ((unint64_t)(a3 - 2) <= 2)
  {
    -[HMMTRThreadRadioManager eMACAddressOfWEDAccessory](v8, "eMACAddressOfWEDAccessory");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v12, "isEqualToString:", v6) & 1) != 0)
    {
      v13 = -[HMMTRThreadRadioManager isWEDConnectionRetryActive](v8, "isWEDConnectionRetryActive");

      if (!v13)
      {
        -[HMMTRThreadRadioManager setIsWEDConnectionRetryActive:](v8, "setIsWEDConnectionRetryActive:", 1);
        -[HMMTRThreadRadioManager _retryWEDConnectionToAccessoryWithDelayInMs:](v8, "_retryWEDConnectionToAccessoryWithDelayInMs:", 100.0);
      }
    }
    else
    {

    }
  }

}

- (void)notifyPeripheralDeviceNodeTypeChanged:(int64_t)a3
{
  void *v5;
  HMMTRThreadRadioManager *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  HMMTRThreadRadioManager *v14;
  NSObject *v15;
  void *v16;
  HMMTRThreadRadioManager *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  if ((unint64_t)a3 > 7)
  {
    v10 = 0;
  }
  else
  {
    if (((1 << a3) & 0xCF) != 0)
    {
      v5 = (void *)MEMORY[0x242656984](self, a2);
      v6 = self;
      HMFGetOSLogHandle();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMMTRThreadRadioManager _nodeTypeValueToString:](v6, "_nodeTypeValueToString:", a3);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = 138543618;
        v21 = v8;
        v22 = 2112;
        v23 = v9;
        _os_log_impl(&dword_23E95B000, v7, OS_LOG_TYPE_INFO, "%{public}@Pairing accessory is not sleepy (nodeType: %@)", (uint8_t *)&v20, 0x16u);

      }
      v10 = 0;
    }
    else
    {
      v5 = (void *)MEMORY[0x242656984](self, a2);
      v17 = self;
      HMFGetOSLogHandle();
      v7 = objc_claimAutoreleasedReturnValue();
      v10 = 1;
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMMTRThreadRadioManager _nodeTypeValueToString:](v17, "_nodeTypeValueToString:", a3);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = 138543618;
        v21 = v18;
        v22 = 2112;
        v23 = v19;
        _os_log_impl(&dword_23E95B000, v7, OS_LOG_TYPE_INFO, "%{public}@Pairing accessory is sleepy (nodeType: %@)", (uint8_t *)&v20, 0x16u);

      }
    }

    objc_autoreleasePoolPop(v5);
  }
  -[HMMTRThreadRadioManager pairingAccessoryServer](self, "pairingAccessoryServer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    objc_msgSend(v11, "handleThreadDirectConnectionSleepyTypeChange:", v10);
  }
  else
  {
    v13 = (void *)MEMORY[0x242656984]();
    v14 = self;
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138543362;
      v21 = v16;
      _os_log_impl(&dword_23E95B000, v15, OS_LOG_TYPE_ERROR, "%{public}@notifyPeripheralDeviceNodeTypeChanged: could not get a strong reference to accessory server", (uint8_t *)&v20, 0xCu);

    }
    objc_autoreleasePoolPop(v13);
  }

}

- (void)postNotification:(id)a3 userInfo:(id)a4
{
  void *v6;
  id v7;
  id v8;
  id v9;

  v6 = (void *)MEMORY[0x24BDD16D0];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "defaultCenter");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "postNotificationName:object:userInfo:", v8, self, v7);

}

- (void)dispatchBlock:(id)a3
{
  id v4;
  NSObject *v5;

  v4 = a3;
  -[HMMTRThreadRadioManager workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_async(v5, v4);

}

- (void)dispatchAfter:(unint64_t)a3 block:(id)a4
{
  id v6;
  NSObject *v7;

  v6 = a4;
  -[HMMTRThreadRadioManager workQueue](self, "workQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_after(a3, v7, v6);

}

- (id)_nodeTypeValueToString:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 6)
    return CFSTR("unknown");
  else
    return off_250F21088[a3 - 1];
}

- (id)_connectionStateValueToString:(int64_t)a3
{
  if ((unint64_t)a3 > 3)
    return CFSTR("unknown");
  else
    return off_250F210C0[a3];
}

- (BOOL)deviceSupportsThreadService
{
  return self->_deviceSupportsThreadService;
}

- (void)setDeviceSupportsThreadService:(BOOL)a3
{
  self->_deviceSupportsThreadService = a3;
}

- (BOOL)isPairingActive
{
  return self->_pairingActive;
}

- (void)setPairingActive:(BOOL)a3
{
  self->_pairingActive = a3;
}

- (BOOL)isFirmwareUpdateActive
{
  return self->_firmwareUpdateActive;
}

- (void)setFirmwareUpdateActive:(BOOL)a3
{
  self->_firmwareUpdateActive = a3;
}

- (NSNumber)fabricIDOfActiveThreadNetwork
{
  return self->_fabricIDOfActiveThreadNetwork;
}

- (void)setFabricIDOfActiveThreadNetwork:(id)a3
{
  objc_storeStrong((id *)&self->_fabricIDOfActiveThreadNetwork, a3);
}

- (BOOL)threadNetworkActivatedForSystemCommissionerFabric
{
  return self->_threadNetworkActivatedForSystemCommissionerFabric;
}

- (void)setThreadNetworkActivatedForSystemCommissionerFabric:(BOOL)a3
{
  self->_threadNetworkActivatedForSystemCommissionerFabric = a3;
}

- (HMMTRAccessoryServerBrowser)browser
{
  return (HMMTRAccessoryServerBrowser *)objc_loadWeakRetained((id *)&self->_browser);
}

- (void)setBrowser:(id)a3
{
  objc_storeWeak((id *)&self->_browser, a3);
}

- (HMMTRAccessoryServer)pairingAccessoryServer
{
  return (HMMTRAccessoryServer *)objc_loadWeakRetained((id *)&self->_pairingAccessoryServer);
}

- (void)setPairingAccessoryServer:(id)a3
{
  objc_storeWeak((id *)&self->_pairingAccessoryServer, a3);
}

- (BOOL)preventDisconnect
{
  return self->_preventDisconnect;
}

- (void)setPreventDisconnect:(BOOL)a3
{
  self->_preventDisconnect = a3;
}

- (BOOL)pendingThreadStart
{
  return self->_pendingThreadStart;
}

- (void)setPendingThreadStart:(BOOL)a3
{
  self->_pendingThreadStart = a3;
}

- (NSString)eMACAddressOfFWUpdatesAccessory
{
  return self->_eMACAddressOfFWUpdatesAccessory;
}

- (void)setEMACAddressOfFWUpdatesAccessory:(id)a3
{
  objc_storeStrong((id *)&self->_eMACAddressOfFWUpdatesAccessory, a3);
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setWorkQueue:(id)a3
{
  objc_storeStrong((id *)&self->_workQueue, a3);
}

- (HMFTimer)disconnectTimer
{
  return self->_disconnectTimer;
}

- (BOOL)deviceIsLockedAndPendingStopThread
{
  return self->_deviceIsLockedAndPendingStopThread;
}

- (void)setDeviceIsLockedAndPendingStopThread:(BOOL)a3
{
  self->_deviceIsLockedAndPendingStopThread = a3;
}

- (id)retryCompletionHandler
{
  return self->_retryCompletionHandler;
}

- (void)setRetryCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (id)pendingStartPairingBlock
{
  return objc_getProperty(self, a2, 88, 1);
}

- (void)setPendingStartPairingBlock:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 88);
}

- (NSNumber)fabricIDOfPendingStartPairingBlock
{
  return self->_fabricIDOfPendingStartPairingBlock;
}

- (void)setFabricIDOfPendingStartPairingBlock:(id)a3
{
  objc_storeStrong((id *)&self->_fabricIDOfPendingStartPairingBlock, a3);
}

- (int64_t)lastKnownThreadNetworkConnectionState
{
  return self->_lastKnownThreadNetworkConnectionState;
}

- (void)setLastKnownThreadNetworkConnectionState:(int64_t)a3
{
  self->_lastKnownThreadNetworkConnectionState = a3;
}

- (BOOL)isWEDConnectionRetryActive
{
  return self->_isWEDConnectionRetryActive;
}

- (void)setIsWEDConnectionRetryActive:(BOOL)a3
{
  self->_isWEDConnectionRetryActive = a3;
}

- (NSString)eMACAddressOfWEDAccessory
{
  return self->_eMACAddressOfWEDAccessory;
}

- (void)setEMACAddressOfWEDAccessory:(id)a3
{
  objc_storeStrong((id *)&self->_eMACAddressOfWEDAccessory, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eMACAddressOfWEDAccessory, 0);
  objc_storeStrong((id *)&self->_fabricIDOfPendingStartPairingBlock, 0);
  objc_storeStrong(&self->_pendingStartPairingBlock, 0);
  objc_storeStrong(&self->_retryCompletionHandler, 0);
  objc_storeStrong((id *)&self->_disconnectTimer, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_eMACAddressOfFWUpdatesAccessory, 0);
  objc_destroyWeak((id *)&self->_pairingAccessoryServer);
  objc_destroyWeak((id *)&self->_browser);
  objc_storeStrong((id *)&self->_fabricIDOfActiveThreadNetwork, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

uint64_t __75__HMMTRThreadRadioManager_notifyWakeOnDeviceConnectionChanged_eMACAddress___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_notifyWakeOnDeviceConnectionChanged:eMACAddress:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
}

void __71__HMMTRThreadRadioManager__retryWEDConnectionToAccessoryWithDelayInMs___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[5];
  uint8_t buf[4];
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend(*(id *)(a1 + 32), "_shouldRetryWEDConnectionToAccessory"))
  {
    objc_msgSend(*(id *)(a1 + 32), "eMACAddressOfWEDAccessory");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "dataUsingEncoding:", 4);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    v4 = (void *)MEMORY[0x242656984]();
    v5 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "eMACAddressOfWEDAccessory");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v12 = v7;
      v13 = 2112;
      v14 = v8;
      _os_log_impl(&dword_23E95B000, v6, OS_LOG_TYPE_INFO, "%{public}@Attempting to retry WED connection to eMACAddress: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v4);
    v9 = *(void **)(a1 + 32);
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __71__HMMTRThreadRadioManager__retryWEDConnectionToAccessoryWithDelayInMs___block_invoke_26;
    v10[3] = &unk_250F223C0;
    v10[4] = v9;
    objc_msgSend(v9, "connectToAccessoryWithExtendedMACAddress:forRetry:completion:", v3, 1, v10);

  }
}

void __71__HMMTRThreadRadioManager__retryWEDConnectionToAccessoryWithDelayInMs___block_invoke_26(uint64_t a1, void *a2)
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
  void *v12;
  void (**v13)(_QWORD, _QWORD);
  _QWORD v14[5];
  id v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x242656984]();
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
      objc_msgSend(*(id *)(a1 + 32), "eMACAddressOfWEDAccessory");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v17 = v8;
      v18 = 2112;
      v19 = v9;
      v20 = 2112;
      v21 = v3;
      _os_log_impl(&dword_23E95B000, v7, OS_LOG_TYPE_ERROR, "%{public}@RETRY: Failed to establish WED connection to accessory with emac %@, error %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v4);
    v10 = *(void **)(a1 + 32);
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __71__HMMTRThreadRadioManager__retryWEDConnectionToAccessoryWithDelayInMs___block_invoke_27;
    v14[3] = &unk_250F22458;
    v14[4] = v10;
    v15 = v3;
    objc_msgSend(v10, "dispatchBlock:", v14);

  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "eMACAddressOfWEDAccessory");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v17 = v11;
      v18 = 2112;
      v19 = v12;
      _os_log_impl(&dword_23E95B000, v7, OS_LOG_TYPE_INFO, "%{public}@RETRY: Connected to WED accessory with emac: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v4);
    objc_msgSend(*(id *)(a1 + 32), "setIsWEDConnectionRetryActive:", 0);
    objc_msgSend(*(id *)(a1 + 32), "retryCompletionHandler");
    v13 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setRetryCompletionHandler:", 0);
    if (v13)
      v13[2](v13, 0);

  }
}

uint64_t __71__HMMTRThreadRadioManager__retryWEDConnectionToAccessoryWithDelayInMs___block_invoke_27(uint64_t a1)
{
  void *v1;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(v1, "_computeRetryDelayForError:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(v1, "_retryWEDConnectionToAccessoryWithDelayInMs:");
}

uint64_t __76__HMMTRThreadRadioManager__notifyThreadRadioStateChanged_nodeType_fabricID___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(*(id *)(a1 + 32), "setPendingThreadStart:", 0);
  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
    return objc_msgSend(v2, "startThreadRadioForSystemCommissionerFabricID:", v3);
  else
    return objc_msgSend(v2, "startThreadRadioForHomeWithFabricID:preventDisconnect:", v3, *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24));
}

uint64_t __75__HMMTRThreadRadioManager_notifyThreadRadioStateChanged_nodeType_fabricID___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_notifyThreadRadioStateChanged:nodeType:fabricID:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40));
}

uint64_t __72__HMMTRThreadRadioManager_stopThreadRadioForSystemCommissionerFabricID___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_stopThreadRadioForSystemCommissionerFabricID:", *(_QWORD *)(a1 + 40));
}

void __70__HMMTRThreadRadioManager_overrideLocationCheckForPairingForFabricID___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "overrideLocationCheckForPairingForFabricID:", *(_QWORD *)(a1 + 40));

}

uint64_t __73__HMMTRThreadRadioManager_startThreadRadioForSystemCommissionerFabricID___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_startThreadRadioForSystemCommissionerFabricID:", *(_QWORD *)(a1 + 40));
}

uint64_t __62__HMMTRThreadRadioManager_stopThreadRadioForHomeWithFabricID___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_stopThreadRadioForHomeWithFabricID:", *(_QWORD *)(a1 + 40));
}

uint64_t __42__HMMTRThreadRadioManager_allowDisconnect__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_allowDisconnect");
}

void __70__HMMTRThreadRadioManager__stopAccessoryFirmwareUpdateWithCompletion___block_invoke(uint64_t a1, void *a2)
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
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x242656984]();
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
      v12 = 138543362;
      v13 = v8;
      v9 = "%{public}@Failed to inform thread SW of stop firmware update";
      v10 = v7;
      v11 = OS_LOG_TYPE_ERROR;
LABEL_6:
      _os_log_impl(&dword_23E95B000, v10, v11, v9, (uint8_t *)&v12, 0xCu);

    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138543362;
    v13 = v8;
    v9 = "%{public}@Informed thread SW of stop firmware update";
    v10 = v7;
    v11 = OS_LOG_TYPE_INFO;
    goto LABEL_6;
  }

  objc_autoreleasePoolPop(v4);
  objc_msgSend(*(id *)(a1 + 32), "setFirmwareUpdateActive:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setEMACAddressOfFWUpdatesAccessory:", 0);
  (*(void (**)(_QWORD, id))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), v3);

}

uint64_t __69__HMMTRThreadRadioManager_stopAccessoryFirmwareUpdateWithCompletion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_stopAccessoryFirmwareUpdateWithCompletion:", *(_QWORD *)(a1 + 40));
}

void __102__HMMTRThreadRadioManager__startAccessoryFirmwareUpdateWithExtendedMACAddress_isWedDevice_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  int v12;
  void *v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x242656984]();
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
      v9 = *(_QWORD *)(a1 + 40);
      v12 = 138543874;
      v13 = v8;
      v14 = 2112;
      v15 = v9;
      v16 = 2112;
      v17 = v3;
      _os_log_impl(&dword_23E95B000, v7, OS_LOG_TYPE_ERROR, "%{public}@Failed to inform thread SW of start firmware update with emac %@, error %@", (uint8_t *)&v12, 0x20u);

    }
    objc_autoreleasePoolPop(v4);
    objc_msgSend(*(id *)(a1 + 32), "setFirmwareUpdateActive:", 0);
    objc_msgSend(*(id *)(a1 + 32), "setEMACAddressOfFWUpdatesAccessory:", 0);
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = *(_QWORD *)(a1 + 40);
      v12 = 138543618;
      v13 = v10;
      v14 = 2112;
      v15 = v11;
      _os_log_impl(&dword_23E95B000, v7, OS_LOG_TYPE_INFO, "%{public}@Informed thread SW of start firmware update with emac %@", (uint8_t *)&v12, 0x16u);

    }
    objc_autoreleasePoolPop(v4);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

uint64_t __101__HMMTRThreadRadioManager_startAccessoryFirmwareUpdateWithExtendedMACAddress_isWedDevice_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_startAccessoryFirmwareUpdateWithExtendedMACAddress:isWedDevice:completion:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 48));
}

void __63__HMMTRThreadRadioManager__stopAccessoryPairingWithCompletion___block_invoke(uint64_t a1, void *a2)
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
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x242656984]();
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
      v12 = 138543362;
      v13 = v8;
      v9 = "%{public}@Failed to inform thread SW of stop pairing";
      v10 = v7;
      v11 = OS_LOG_TYPE_ERROR;
LABEL_6:
      _os_log_impl(&dword_23E95B000, v10, v11, v9, (uint8_t *)&v12, 0xCu);

    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138543362;
    v13 = v8;
    v9 = "%{public}@Informed thread SW of stop pairing";
    v10 = v7;
    v11 = OS_LOG_TYPE_INFO;
    goto LABEL_6;
  }

  objc_autoreleasePoolPop(v4);
  (*(void (**)(_QWORD, id))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), v3);

}

uint64_t __62__HMMTRThreadRadioManager_stopAccessoryPairingWithCompletion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_stopAccessoryPairingWithCompletion:", *(_QWORD *)(a1 + 40));
}

void __112__HMMTRThreadRadioManager___startAccessoryPairingWithExtendedMACAddress_isWedDevice_accessoryServer_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  const char *v10;
  NSObject *v11;
  os_log_type_t v12;
  uint32_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  void *v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x242656984]();
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
      v9 = *(_QWORD *)(a1 + 40);
      v17 = 138543874;
      v18 = v8;
      v19 = 2112;
      v20 = v9;
      v21 = 2112;
      v22 = v3;
      v10 = "%{public}@Failed to inform thread SW of start pairing with emac %@, error %@";
      v11 = v7;
      v12 = OS_LOG_TYPE_ERROR;
      v13 = 32;
LABEL_6:
      _os_log_impl(&dword_23E95B000, v11, v12, v10, (uint8_t *)&v17, v13);

    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = *(_QWORD *)(a1 + 40);
    v17 = 138543618;
    v18 = v8;
    v19 = 2112;
    v20 = v14;
    v10 = "%{public}@Informed thread SW of start pairing with emac %@";
    v11 = v7;
    v12 = OS_LOG_TYPE_INFO;
    v13 = 22;
    goto LABEL_6;
  }

  objc_autoreleasePoolPop(v4);
  (*(void (**)(_QWORD, id, uint64_t, uint64_t))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), v3, v15, v16);

}

void __111__HMMTRThreadRadioManager__startAccessoryPairingWithExtendedMACAddress_isWedDevice_accessoryServer_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  _QWORD v12[5];
  id v13;
  id v14;
  id v15;
  char v16;
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v5 = WeakRetained;
  if (v3)
  {
    v6 = (void *)MEMORY[0x242656984]();
    v7 = v5;
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v18 = v9;
      _os_log_impl(&dword_23E95B000, v8, OS_LOG_TYPE_INFO, "%{public}@Aborting call to thread start pairing", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v6);
    v10 = MEMORY[0x242656B10](*(_QWORD *)(a1 + 48));
    v11 = (void *)v10;
    if (v10)
      (*(void (**)(uint64_t, id))(v10 + 16))(v10, v3);

    objc_msgSend(v7, "setPendingStartPairingBlock:", 0);
    objc_msgSend(v7, "setFabricIDOfPendingStartPairingBlock:", 0);
  }
  else
  {
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __111__HMMTRThreadRadioManager__startAccessoryPairingWithExtendedMACAddress_isWedDevice_accessoryServer_completion___block_invoke_18;
    v12[3] = &unk_250F229D8;
    v12[4] = WeakRetained;
    v13 = *(id *)(a1 + 32);
    v16 = *(_BYTE *)(a1 + 64);
    v14 = *(id *)(a1 + 40);
    v15 = *(id *)(a1 + 48);
    objc_msgSend(v5, "dispatchBlock:", v12);
    objc_msgSend(v5, "setPendingStartPairingBlock:", 0);
    objc_msgSend(v5, "setFabricIDOfPendingStartPairingBlock:", 0);

  }
}

uint64_t __111__HMMTRThreadRadioManager__startAccessoryPairingWithExtendedMACAddress_isWedDevice_accessoryServer_completion___block_invoke_18(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "__startAccessoryPairingWithExtendedMACAddress:isWedDevice:accessoryServer:completion:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 64), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

uint64_t __110__HMMTRThreadRadioManager_startAccessoryPairingWithExtendedMACAddress_isWedDevice_accessoryServer_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_startAccessoryPairingWithExtendedMACAddress:isWedDevice:accessoryServer:completion:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 64), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

void __88__HMMTRThreadRadioManager_connectToAccessoryWithExtendedMACAddress_forRetry_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  char v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  const char *v11;
  NSObject *v12;
  os_log_type_t v13;
  uint32_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  char v18;
  uint64_t v19;
  void *v20;
  id v21;
  NSObject *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void (**v27)(_QWORD, _QWORD);
  void *v28;
  id v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  NSObject *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void (**v40)(_QWORD, _QWORD);
  void *v41;
  _QWORD v42[5];
  id v43;
  id v44;
  char v45;
  _QWORD v46[5];
  id v47;
  uint8_t buf[4];
  void *v49;
  __int16 v50;
  void *v51;
  __int16 v52;
  void *v53;
  uint64_t v54;

  v54 = *MEMORY[0x24BDAC8D0];
  if (!isFeatureMatteriPhoneOnlyPairingControlForThreadEnabled()
    || (objc_msgSend(*(id *)(a1 + 32), "delegate"), (v2 = objc_claimAutoreleasedReturnValue()) == 0)
    || (v3 = (void *)v2,
        v4 = objc_msgSend(*(id *)(a1 + 32), "deviceSupportsThreadService"),
        v3,
        (v4 & 1) == 0))
  {
    v7 = (void *)MEMORY[0x242656984]();
    v8 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
LABEL_10:

      objc_autoreleasePoolPop(v7);
      v15 = *(_QWORD *)(a1 + 48);
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BE3EBB0], 5, 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *))(v15 + 16))(v15, v6);
      goto LABEL_11;
    }
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v49 = v10;
    v11 = "%{public}@Thread radio feature is not enabled";
    v12 = v9;
    v13 = OS_LOG_TYPE_DEBUG;
    v14 = 12;
LABEL_9:
    _os_log_impl(&dword_23E95B000, v12, v13, v11, buf, v14);

    goto LABEL_10;
  }
  objc_msgSend(*(id *)(a1 + 32), "fabricIDOfActiveThreadNetwork");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v7 = (void *)MEMORY[0x242656984]();
    v8 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      goto LABEL_10;
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = *(void **)(a1 + 40);
    *(_DWORD *)buf = 138543618;
    v49 = v10;
    v50 = 2112;
    v51 = v16;
    v11 = "%{public}@No active thread network configured, dropping request to connect to accessory with eMAC %@";
    v12 = v9;
    v13 = OS_LOG_TYPE_ERROR;
    v14 = 22;
    goto LABEL_9;
  }
  if (*(_QWORD *)(a1 + 40))
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", *(_QWORD *)(a1 + 40), 4);
  else
    v6 = 0;
  if (objc_msgSend(*(id *)(a1 + 32), "isPairingActive") && !v6
    || objc_msgSend(*(id *)(a1 + 32), "isPairingActive")
    && (objc_msgSend(*(id *)(a1 + 32), "eMACAddressOfWEDAccessory"),
        v17 = (void *)objc_claimAutoreleasedReturnValue(),
        v18 = objc_msgSend(v17, "isEqualToString:", v6),
        v17,
        (v18 & 1) == 0))
  {
    v20 = (void *)MEMORY[0x242656984]();
    v21 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "eMACAddressOfWEDAccessory");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v49 = v23;
      v50 = 2112;
      v51 = v6;
      v52 = 2112;
      v53 = v24;
      _os_log_impl(&dword_23E95B000, v22, OS_LOG_TYPE_INFO, "%{public}@Not processing connect request to a different WED accessory emac %@ when pairing is active for emac %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v20);
    v25 = *(_QWORD *)(a1 + 48);
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BE3EBB0], 5, 0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v25 + 16))(v25, v26);

  }
  else
  {
    if (*(_QWORD *)(a1 + 40))
    {
      v19 = objc_msgSend(*(id *)(a1 + 32), "setEMACAddressOfWEDAccessory:", v6);
    }
    else
    {
      if (*(_BYTE *)(a1 + 56))
      {
        v27 = 0;
      }
      else
      {
        objc_msgSend(*(id *)(a1 + 32), "retryCompletionHandler");
        v27 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();

        if (v27)
        {
          v28 = (void *)MEMORY[0x242656984]();
          v29 = *(id *)(a1 + 32);
          HMFGetOSLogHandle();
          v30 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v49 = v31;
            _os_log_impl(&dword_23E95B000, v30, OS_LOG_TYPE_INFO, "%{public}@Previously attempted WED connection is aborted", buf, 0xCu);

          }
          objc_autoreleasePoolPop(v28);
          objc_msgSend(*(id *)(a1 + 32), "retryCompletionHandler");
          v27 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 32), "setRetryCompletionHandler:", 0);
        }
      }
      objc_msgSend(*(id *)(a1 + 32), "setEMACAddressOfWEDAccessory:", 0);
      objc_msgSend(*(id *)(a1 + 32), "setIsWEDConnectionRetryActive:", 0);
      if (v27)
      {
        objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:", 12);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *))v27)[2](v27, v32);

      }
    }
    v33 = (void *)MEMORY[0x242656984](v19);
    v34 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "eMACAddressOfWEDAccessory");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v49 = v36;
      v50 = 2112;
      v51 = v37;
      _os_log_impl(&dword_23E95B000, v35, OS_LOG_TYPE_INFO, "%{public}@Set eMACAddress of WED accessory to :%@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v33);
    v38 = MEMORY[0x24BDAC760];
    v46[0] = MEMORY[0x24BDAC760];
    v46[1] = 3221225472;
    v46[2] = __88__HMMTRThreadRadioManager_connectToAccessoryWithExtendedMACAddress_forRetry_completion___block_invoke_15;
    v46[3] = &unk_250F20FD0;
    v39 = *(void **)(a1 + 40);
    v46[4] = *(_QWORD *)(a1 + 32);
    v47 = v39;
    v40 = (void (**)(_QWORD, _QWORD))MEMORY[0x242656B10](v46);
    v42[0] = v38;
    v42[1] = 3221225472;
    v42[2] = __88__HMMTRThreadRadioManager_connectToAccessoryWithExtendedMACAddress_forRetry_completion___block_invoke_2;
    v42[3] = &unk_250F21FB8;
    v41 = *(void **)(a1 + 40);
    v42[4] = *(_QWORD *)(a1 + 32);
    v43 = v41;
    v45 = *(_BYTE *)(a1 + 56);
    v44 = *(id *)(a1 + 48);
    ((void (**)(_QWORD, _QWORD *))v40)[2](v40, v42);

  }
LABEL_11:

}

void __88__HMMTRThreadRadioManager_connectToAccessoryWithExtendedMACAddress_forRetry_completion___block_invoke_15(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  v5 = objc_msgSend(v3, "threadNetworkActivatedForSystemCommissionerFabric");
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1 + 40);
  if (v5)
  {
    objc_msgSend(v8, "connectToAccessoryForUserPreferredNetworkWithExtendedMACAddress:completion:", *(_QWORD *)(a1 + 40), v4);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "fabricIDOfActiveThreadNetwork");
    v7 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "connectToAccessoryWithExtendedMACAddress:withFabricID:completion:", v6, v7, v4);

    v4 = (id)v7;
  }

}

void __88__HMMTRThreadRadioManager_connectToAccessoryWithExtendedMACAddress_forRetry_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  void *v9;
  id v10;
  id v11;
  char v12;

  v3 = a2;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __88__HMMTRThreadRadioManager_connectToAccessoryWithExtendedMACAddress_forRetry_completion___block_invoke_3;
  v7[3] = &unk_250F229D8;
  v5 = *(void **)(a1 + 32);
  v4 = *(void **)(a1 + 40);
  v8 = v3;
  v9 = v5;
  v10 = v4;
  v12 = *(_BYTE *)(a1 + 56);
  v11 = *(id *)(a1 + 48);
  v6 = v3;
  objc_msgSend(v5, "dispatchBlock:", v7);

}

uint64_t __88__HMMTRThreadRadioManager_connectToAccessoryWithExtendedMACAddress_forRetry_completion___block_invoke_3(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t result;
  int v9;
  void *v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  if (!*(_QWORD *)(a1 + 32))
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  v2 = (void *)MEMORY[0x242656984]();
  v3 = *(id *)(a1 + 40);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 48);
    v7 = *(_QWORD *)(a1 + 32);
    v9 = 138543874;
    v10 = v5;
    v11 = 2112;
    v12 = v6;
    v13 = 2112;
    v14 = v7;
    _os_log_impl(&dword_23E95B000, v4, OS_LOG_TYPE_ERROR, "%{public}@Failed to connect to accessory with emac %@, error %@", (uint8_t *)&v9, 0x20u);

  }
  objc_autoreleasePoolPop(v2);
  if ((objc_msgSend(*(id *)(a1 + 40), "isWEDConnectionRetryActive") & 1) != 0)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  objc_msgSend(*(id *)(a1 + 40), "setIsWEDConnectionRetryActive:", 1);
  if (!*(_BYTE *)(a1 + 64))
    objc_msgSend(*(id *)(a1 + 40), "setRetryCompletionHandler:", *(_QWORD *)(a1 + 56));
  result = objc_msgSend(*(id *)(a1 + 40), "_retryWEDConnectionToAccessoryWithDelayInMs:", 100.0);
  if (*(_BYTE *)(a1 + 64))
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  return result;
}

uint64_t __81__HMMTRThreadRadioManager_startThreadRadioForHomeWithFabricID_preventDisconnect___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_startThreadRadioForHomeWithFabricID:preventDisconnect:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48));
}

uint64_t __63__HMMTRThreadRadioManager_startThreadRadioForHomeWithFabricID___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_startThreadRadioForHomeWithFabricID:preventDisconnect:", *(_QWORD *)(a1 + 40), 0);
}

void __55__HMMTRThreadRadioManager_handleDeviceLockStateChange___block_invoke_12(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x242656984]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 138543362;
    v17 = v5;
    _os_log_impl(&dword_23E95B000, v4, OS_LOG_TYPE_INFO, "%{public}@starting thread on device unlock", (uint8_t *)&v16, 0xCu);

  }
  objc_autoreleasePoolPop(v2);
  objc_msgSend(*(id *)(a1 + 32), "disconnectTimer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "suspend");

  objc_msgSend(*(id *)(a1 + 32), "browser");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "currentFabricID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = (void *)MEMORY[0x242656984]();
    v10 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138543362;
      v17 = v12;
      _os_log_impl(&dword_23E95B000, v11, OS_LOG_TYPE_INFO, "%{public}@Not starting thread on device unlock - fabric is already active", (uint8_t *)&v16, 0xCu);

    }
    objc_autoreleasePoolPop(v9);
  }
  else
  {
    v13 = *(void **)(a1 + 32);
    objc_msgSend(v13, "browser");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "systemCommissionerFabricID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "startThreadRadioForSystemCommissionerFabricID:", v15);

  }
}

void __55__HMMTRThreadRadioManager_handleDeviceLockStateChange___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  void *v4;
  id v5;
  NSObject *v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "disconnectTimer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isRunning");

  v4 = (void *)MEMORY[0x242656984]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_INFO);
  if (v3)
  {
    if (v7)
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543362;
      v12 = v8;
      _os_log_impl(&dword_23E95B000, v6, OS_LOG_TYPE_INFO, "%{public}@Thread disconnect timer is already running", (uint8_t *)&v11, 0xCu);

    }
    objc_autoreleasePoolPop(v4);
  }
  else
  {
    if (v7)
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543618;
      v12 = v9;
      v13 = 2048;
      v14 = 0x402E000000000000;
      _os_log_impl(&dword_23E95B000, v6, OS_LOG_TYPE_INFO, "%{public}@Starting %f seconds thread disconnect timer", (uint8_t *)&v11, 0x16u);

    }
    objc_autoreleasePoolPop(v4);
    objc_msgSend(*(id *)(a1 + 32), "disconnectTimer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "resume");

  }
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t91 != -1)
    dispatch_once(&logCategory__hmf_once_t91, &__block_literal_global_3815);
  return (id)logCategory__hmf_once_v92;
}

void __38__HMMTRThreadRadioManager_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v92;
  logCategory__hmf_once_v92 = v0;

}

@end
