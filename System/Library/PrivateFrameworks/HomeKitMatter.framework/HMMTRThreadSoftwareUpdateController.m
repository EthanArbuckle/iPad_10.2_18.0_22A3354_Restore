@implementation HMMTRThreadSoftwareUpdateController

- (HMMTRThreadSoftwareUpdateController)initWithQueue:(id)a3 browser:(id)a4
{
  id v7;
  id v8;
  HMMTRThreadSoftwareUpdateController *v9;
  HMMTRThreadSoftwareUpdateController *v10;
  uint64_t v11;
  HMFTimer *firmwareUpdateActiveTimer;
  HMMTRAccessoryReachabilityObserver *v13;
  HMMTRAccessoryReachabilityObserver *reachabilityObserver;
  objc_super v16;

  v7 = a3;
  v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)HMMTRThreadSoftwareUpdateController;
  v9 = -[HMMTRThreadSoftwareUpdateController init](&v16, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_clientQueue, a3);
    objc_storeWeak((id *)&v10->_browser, v8);
    v11 = objc_msgSend(objc_alloc(MEMORY[0x24BE3F298]), "initWithTimeInterval:options:", 0, 1800.0);
    firmwareUpdateActiveTimer = v10->_firmwareUpdateActiveTimer;
    v10->_firmwareUpdateActiveTimer = (HMFTimer *)v11;

    -[HMFTimer setDelegateQueue:](v10->_firmwareUpdateActiveTimer, "setDelegateQueue:", v7);
    -[HMFTimer setDelegate:](v10->_firmwareUpdateActiveTimer, "setDelegate:", v10);
    v13 = -[HMMTRAccessoryReachabilityObserver initWithQueue:]([HMMTRAccessoryReachabilityObserver alloc], "initWithQueue:", v7);
    reachabilityObserver = v10->_reachabilityObserver;
    v10->_reachabilityObserver = v13;

  }
  return v10;
}

- (void)_cleanupFirmwareUpdateStateWithError:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  HMMTRThreadSoftwareUpdateController *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  HMMTRThreadSoftwareUpdateController *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[5];
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMMTRThreadSoftwareUpdateController targetThreadAccessoryServerForFWUpdate](self, "targetThreadAccessoryServerForFWUpdate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x242656984]();
  v7 = self;
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "nodeID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v23 = v9;
    v24 = 2112;
    v25 = v10;
    v26 = 2112;
    v27 = v4;
    _os_log_impl(&dword_23E95B000, v8, OS_LOG_TYPE_INFO, "%{public}@Cleaning up firmware update state - current target accessory nodeID = %@, error = %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v6);
  -[HMMTRThreadSoftwareUpdateController firmwareUpdateActiveTimer](v7, "firmwareUpdateActiveTimer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "suspend");

  -[HMMTRThreadSoftwareUpdateController setTargetThreadAccessoryServerForFWUpdate:](v7, "setTargetThreadAccessoryServerForFWUpdate:", 0);
  -[HMMTRThreadSoftwareUpdateController reachabilityObserver](v7, "reachabilityObserver");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stopObservingReachabilityWithError:", v4);

  -[HMMTRThreadSoftwareUpdateController browser](v7, "browser");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "threadRadioManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __76__HMMTRThreadSoftwareUpdateController__cleanupFirmwareUpdateStateWithError___block_invoke;
  v21[3] = &unk_250F223C0;
  v21[4] = v7;
  objc_msgSend(v14, "stopAccessoryFirmwareUpdateWithCompletion:", v21);

  if (v4 && v5)
  {
    v15 = (void *)MEMORY[0x242656984]();
    v16 = v7;
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "nodeID");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v23 = v18;
      v24 = 2112;
      v25 = v19;
      v26 = 2112;
      v27 = v4;
      _os_log_impl(&dword_23E95B000, v17, OS_LOG_TYPE_INFO, "%{public}@Resetting firmware update to unknown for current target accessory nodeID = %@, error = %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v15);
    objc_msgSend(v5, "matterFirmwareUpdateStatus");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "updateFirmwareUpdateStatus:", 0);

  }
}

- (BOOL)isFirmwareUpdateInProgressForFabricID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  char v10;
  BOOL v11;

  v4 = a3;
  -[HMMTRThreadSoftwareUpdateController targetThreadAccessoryServerForFWUpdate](self, "targetThreadAccessoryServerForFWUpdate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
    goto LABEL_5;
  objc_msgSend(v5, "fabricID");
  v7 = objc_claimAutoreleasedReturnValue();
  if (!v7)
    goto LABEL_5;
  v8 = (void *)v7;
  objc_msgSend(v6, "fabricID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = HMFEqualObjects();

  if ((v10 & 1) != 0)
    v11 = 1;
  else
LABEL_5:
    v11 = 0;

  return v11;
}

- (void)suspendOperationsForFabricID:(id)a3
{
  id v4;
  BOOL v5;
  void *v6;
  HMMTRThreadSoftwareUpdateController *v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = -[HMMTRThreadSoftwareUpdateController isFirmwareUpdateInProgressForFabricID:](self, "isFirmwareUpdateInProgressForFabricID:", v4);
  v6 = (void *)MEMORY[0x242656984]();
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
      v13 = 138543362;
      v14 = v10;
      _os_log_impl(&dword_23E95B000, v9, OS_LOG_TYPE_INFO, "%{public}@Suspending firmware update operations", (uint8_t *)&v13, 0xCu);

    }
    objc_autoreleasePoolPop(v6);
    objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:", 12);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMMTRThreadSoftwareUpdateController _cleanupFirmwareUpdateStateWithError:](v7, "_cleanupFirmwareUpdateStateWithError:", v11);

  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543618;
      v14 = v12;
      v15 = 2112;
      v16 = v4;
      _os_log_impl(&dword_23E95B000, v9, OS_LOG_TYPE_DEBUG, "%{public}@Received suspendOperations, but no active fw updates in progress for fabricID %@", (uint8_t *)&v13, 0x16u);

    }
    objc_autoreleasePoolPop(v6);
  }

}

- (void)suspendOperations
{
  void *v3;
  void *v4;
  HMMTRThreadSoftwareUpdateController *v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  -[HMMTRThreadSoftwareUpdateController targetThreadAccessoryServerForFWUpdate](self, "targetThreadAccessoryServerForFWUpdate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (void *)MEMORY[0x242656984]();
  v5 = self;
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v3)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543362;
      v12 = v8;
      _os_log_impl(&dword_23E95B000, v7, OS_LOG_TYPE_INFO, "%{public}@Suspending firmware update operations", (uint8_t *)&v11, 0xCu);

    }
    objc_autoreleasePoolPop(v4);
    objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:", 12);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMMTRThreadSoftwareUpdateController _cleanupFirmwareUpdateStateWithError:](v5, "_cleanupFirmwareUpdateStateWithError:", v9);

  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543362;
      v12 = v10;
      _os_log_impl(&dword_23E95B000, v7, OS_LOG_TYPE_DEBUG, "%{public}@Received suspendOperations, but not currently tracking any firmware updates, ignoring", (uint8_t *)&v11, 0xCu);

    }
    objc_autoreleasePoolPop(v4);
  }
}

- (void)handleUpdateRequestedForAccessoryServer:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id WeakRetained;
  void *v9;
  HMMTRThreadSoftwareUpdateController *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  const char *v14;
  NSObject *v15;
  os_log_type_t v16;
  _QWORD v17[5];
  id v18;
  id v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_browser);
  if (WeakRetained)
  {
    if ((isFeatureMatteriPhoneOnlyPairingControlForThreadEnabled() & 1) != 0)
    {
      if (!objc_msgSend(v6, "accessoryLinkLayerTypeIsWifiOrEthernet"))
      {
        v17[0] = MEMORY[0x24BDAC760];
        v17[1] = 3221225472;
        v17[2] = __90__HMMTRThreadSoftwareUpdateController_handleUpdateRequestedForAccessoryServer_completion___block_invoke;
        v17[3] = &unk_250F228C0;
        v17[4] = self;
        v18 = v6;
        v19 = v7;
        -[HMMTRThreadSoftwareUpdateController _attemptConnectionForFirmwareUpdateForAccessoryServer:completion:](self, "_attemptConnectionForFirmwareUpdateForAccessoryServer:completion:", v18, v17);

        goto LABEL_13;
      }
      v9 = (void *)MEMORY[0x242656984]();
      v10 = self;
      HMFGetOSLogHandle();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "nodeID");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v21 = v12;
        v22 = 2112;
        v23 = v13;
        v14 = "%{public}@Accessory server with nodeID %@ is an IP accessory, no tracking needed.";
        v15 = v11;
        v16 = OS_LOG_TYPE_INFO;
LABEL_8:
        _os_log_impl(&dword_23E95B000, v15, v16, v14, buf, 0x16u);

LABEL_11:
      }
    }
    else
    {
      v9 = (void *)MEMORY[0x242656984]();
      v10 = self;
      HMFGetOSLogHandle();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v21 = v12;
        _os_log_impl(&dword_23E95B000, v11, OS_LOG_TYPE_ERROR, "%{public}@Feature is not enabled, falling back to sending notification immediately", buf, 0xCu);
        goto LABEL_11;
      }
    }
  }
  else
  {
    v9 = (void *)MEMORY[0x242656984]();
    v10 = self;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "nodeID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v21 = v12;
      v22 = 2112;
      v23 = v13;
      v14 = "%{public}@Unable to get browser ref for notifyUpdateRequestedForNodeID:%@";
      v15 = v11;
      v16 = OS_LOG_TYPE_ERROR;
      goto LABEL_8;
    }
  }

  objc_autoreleasePoolPop(v9);
  (*((void (**)(id, _QWORD))v7 + 2))(v7, 0);
LABEL_13:

}

- (void)_attemptConnectionForFirmwareUpdateForAccessoryServer:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  void *v8;
  HMMTRThreadSoftwareUpdateController *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  id WeakRetained;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  HMMTRThreadSoftwareUpdateController *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  HMMTRThreadSoftwareUpdateController *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  HMMTRThreadSoftwareUpdateController *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  int v32;
  void *v33;
  HMMTRThreadSoftwareUpdateController *v34;
  NSObject *v35;
  NSObject *v36;
  void *v37;
  void *v38;
  void *v39;
  int v40;
  void *v41;
  HMMTRThreadSoftwareUpdateController *v42;
  NSObject *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  _BOOL4 v52;
  void *v53;
  HMMTRThreadSoftwareUpdateController *v54;
  NSObject *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  int v60;
  void *v61;
  HMMTRThreadSoftwareUpdateController *v62;
  NSObject *v63;
  void *v64;
  void *v65;
  void *v66;
  HMMTRThreadSoftwareUpdateController *v67;
  NSObject *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  char v74;
  void *v75;
  void *v76;
  void *v77;
  char v78;
  void *v79;
  dispatch_time_t v80;
  NSObject *v81;
  id v82;
  void *v83;
  void *v84;
  HMMTRThreadSoftwareUpdateController *v85;
  NSObject *v86;
  id v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  uint64_t v92;
  id v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  BOOL v99;
  void *v100;
  HMMTRThreadSoftwareUpdateController *v101;
  NSObject *v102;
  void *v103;
  void *v104;
  void *v105;
  _QWORD v106[5];
  id v107;
  id v108;
  _QWORD block[4];
  id v110;
  _QWORD v111[4];
  void (**v112)(id, void *);
  _BYTE *v113;
  id v114;
  id location;
  uint8_t v116[4];
  id v117;
  __int16 v118;
  void *v119;
  _BYTE buf[24];
  void *v121;
  uint64_t v122;

  v122 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  v8 = (void *)MEMORY[0x242656984]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "nodeID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = v11;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v12;
    _os_log_impl(&dword_23E95B000, v10, OS_LOG_TYPE_INFO, "%{public}@Attempting connection to accessory server with nodeID %@ for firmware update", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v8);
  if ((isFeatureMatteriPhoneOnlyPairingControlForThreadEnabled() & 1) != 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)&v9->_browser);
    v14 = WeakRetained;
    if (!WeakRetained)
    {
      v27 = (void *)MEMORY[0x242656984]();
      v28 = v9;
      HMFGetOSLogHandle();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "nodeID");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v30;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v31;
        _os_log_impl(&dword_23E95B000, v29, OS_LOG_TYPE_ERROR, "%{public}@Unable to get browser ref for attemptConnectionForFirmwareUpdateForAccessoryServer with nodeID:%@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v27);
      objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:", 11);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v7[2](v7, v22);
      goto LABEL_40;
    }
    objc_msgSend(WeakRetained, "threadRadioManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "isPairingActive");

    if (v16)
    {
      v17 = (void *)MEMORY[0x242656984]();
      v18 = v9;
      HMFGetOSLogHandle();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "nodeID");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v20;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v21;
        _os_log_impl(&dword_23E95B000, v19, OS_LOG_TYPE_ERROR, "%{public}@Cannot start firmware update for nodeID %@ while pairing is active", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v17);
      objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:", 9);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v7[2](v7, v22);
      goto LABEL_40;
    }
    -[HMMTRThreadSoftwareUpdateController targetThreadAccessoryServerForFWUpdate](v9, "targetThreadAccessoryServerForFWUpdate");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (v22)
    {
      v32 = HMFEqualObjects();
      v33 = (void *)MEMORY[0x242656984]();
      v34 = v9;
      HMFGetOSLogHandle();
      v35 = objc_claimAutoreleasedReturnValue();
      v36 = v35;
      if (v32)
      {
        if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "nodeID");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          *(_QWORD *)&buf[4] = v37;
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v38;
          _os_log_impl(&dword_23E95B000, v36, OS_LOG_TYPE_INFO, "%{public}@Start firmware update attempted for the accessory with nodeID %@, but it's already targeted for fw update, just send out announcement immediately", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v33);
        v7[2](v7, 0);
      }
      else
      {
        if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "nodeID");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "nodeID");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          *(_QWORD *)&buf[4] = v47;
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v48;
          *(_WORD *)&buf[22] = 2112;
          v121 = v49;
          _os_log_impl(&dword_23E95B000, v36, OS_LOG_TYPE_ERROR, "%{public}@Start firmware update attempted for the accessory with nodeID %@, but we're already targeting accessory with nodeID %@", buf, 0x20u);

        }
        objc_autoreleasePoolPop(v33);
        objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:", 6);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        v7[2](v7, v50);

      }
      goto LABEL_40;
    }
    objc_msgSend(v14, "threadRadioManager");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = objc_msgSend(v39, "isFirmwareUpdateActive");

    if (v40)
    {
      v41 = (void *)MEMORY[0x242656984]();
      v42 = v9;
      HMFGetOSLogHandle();
      v43 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "nodeID");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v44;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v45;
        _os_log_impl(&dword_23E95B000, v43, OS_LOG_TYPE_ERROR, "%{public}@Cannot start firmware update for nodeID %@ while another firmware update is active", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v41);
      objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:", 9);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v7[2](v7, v46);

      goto LABEL_39;
    }
    objc_msgSend(v6, "matterDevice");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = objc_msgSend(v51, "state") == 1;

    if (v52)
    {
      v53 = (void *)MEMORY[0x242656984]();
      v54 = v9;
      HMFGetOSLogHandle();
      v55 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "nodeID");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v56;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v57;
        _os_log_impl(&dword_23E95B000, v55, OS_LOG_TYPE_INFO, "%{public}@Accessory server with nodeID %@ was reachable", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v53);
      -[HMMTRThreadSoftwareUpdateController setTargetThreadAccessoryServerForFWUpdate:](v54, "setTargetThreadAccessoryServerForFWUpdate:", v6);
      -[HMMTRThreadSoftwareUpdateController firmwareUpdateActiveTimer](v54, "firmwareUpdateActiveTimer");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "resume");

      v7[2](v7, 0);
      goto LABEL_39;
    }
    -[HMMTRThreadSoftwareUpdateController browser](v9, "browser");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = objc_msgSend(v59, "isOperationAllowedForAccessoryServer:", v6);

    if ((v60 & 1) != 0)
    {
      if (objc_msgSend(v6, "isWEDDevice"))
      {
        v61 = (void *)MEMORY[0x242656984]();
        v62 = v9;
        HMFGetOSLogHandle();
        v63 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v63, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "nodeID");
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          *(_QWORD *)&buf[4] = v64;
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v65;
          _os_log_impl(&dword_23E95B000, v63, OS_LOG_TYPE_INFO, "%{public}@Accessory server with nodeID %@ is WED device", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v61);
        -[HMMTRThreadSoftwareUpdateController setTargetThreadAccessoryServerForFWUpdate:](v62, "setTargetThreadAccessoryServerForFWUpdate:", v6);
        v7[2](v7, 0);
        goto LABEL_39;
      }
      -[HMMTRThreadSoftwareUpdateController browser](v9, "browser");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "nodeID");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      v74 = objc_msgSend(v72, "canEstablishConnectionForNodeID:", v73);

      if ((v74 & 1) != 0)
      {
        objc_msgSend(v14, "threadRadioManager");
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v75, "isThreadNetworkConnected"))
        {
          objc_msgSend(v14, "threadRadioManager");
          v76 = (void *)objc_claimAutoreleasedReturnValue();
          if (!objc_msgSend(v76, "isFirmwareUpdateActive"))
          {
            objc_msgSend(v6, "matterDevice");
            v98 = (void *)objc_claimAutoreleasedReturnValue();
            v99 = objc_msgSend(v98, "state") == 1;

            if (!v99)
            {
              v100 = (void *)MEMORY[0x242656984]();
              v101 = v9;
              HMFGetOSLogHandle();
              v102 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v102, OS_LOG_TYPE_ERROR))
              {
                HMFGetLogIdentifier();
                v103 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v6, "nodeID");
                v104 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543618;
                *(_QWORD *)&buf[4] = v103;
                *(_WORD *)&buf[12] = 2112;
                *(_QWORD *)&buf[14] = v104;
                _os_log_impl(&dword_23E95B000, v102, OS_LOG_TYPE_ERROR, "%{public}@Device is already connected to thread network, no need to transition to full router for firmware update for accessory with nodeID %@", buf, 0x16u);

              }
              objc_autoreleasePoolPop(v100);
              objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:", 2);
              v105 = (void *)objc_claimAutoreleasedReturnValue();
              v7[2](v7, v105);

              goto LABEL_39;
            }
            goto LABEL_47;
          }

        }
LABEL_47:
        objc_msgSend(v14, "threadRadioManager");
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        v78 = objc_msgSend(v77, "isReadyToTransitionToFullRouterModeForFirmwareUpdate");

        if ((v78 & 1) != 0)
        {
          -[HMMTRThreadSoftwareUpdateController setTargetThreadAccessoryServerForFWUpdate:](v9, "setTargetThreadAccessoryServerForFWUpdate:", v6);
          *(_QWORD *)buf = 0;
          *(_QWORD *)&buf[8] = buf;
          *(_QWORD *)&buf[16] = 0x2020000000;
          LOBYTE(v121) = 0;
          objc_initWeak(&location, v9);
          v111[0] = MEMORY[0x24BDAC760];
          v111[1] = 3221225472;
          v111[2] = __104__HMMTRThreadSoftwareUpdateController__attemptConnectionForFirmwareUpdateForAccessoryServer_completion___block_invoke;
          v111[3] = &unk_250F212D8;
          objc_copyWeak(&v114, &location);
          v113 = buf;
          v112 = v7;
          v79 = (void *)MEMORY[0x242656B10](v111);
          v80 = dispatch_time(0, 1200000000000);
          -[HMMTRThreadSoftwareUpdateController clientQueue](v9, "clientQueue");
          v81 = objc_claimAutoreleasedReturnValue();
          block[0] = MEMORY[0x24BDAC760];
          block[1] = 3221225472;
          block[2] = __104__HMMTRThreadSoftwareUpdateController__attemptConnectionForFirmwareUpdateForAccessoryServer_completion___block_invoke_2;
          block[3] = &unk_250F22988;
          v82 = v79;
          v110 = v82;
          dispatch_after(v80, v81, block);

          -[HMMTRThreadSoftwareUpdateController firmwareUpdateActiveTimer](v9, "firmwareUpdateActiveTimer");
          v83 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v83, "resume");

          v84 = (void *)MEMORY[0x242656984]();
          v85 = v9;
          HMFGetOSLogHandle();
          v86 = (id)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v86, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v87 = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "nodeID");
            v88 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)v116 = 138543618;
            v117 = v87;
            v118 = 2112;
            v119 = v88;
            _os_log_impl(&dword_23E95B000, v86, OS_LOG_TYPE_INFO, "%{public}@Entering full-router mode to attempt to reach accessory with nodeID %@", v116, 0x16u);

          }
          objc_autoreleasePoolPop(v84);
          objc_msgSend(v14, "threadRadioManager");
          v89 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "eMACAddress");
          v90 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v90, "dataUsingEncoding:", 4);
          v91 = (void *)objc_claimAutoreleasedReturnValue();
          v92 = objc_msgSend(v6, "isWEDDevice");
          v106[0] = MEMORY[0x24BDAC760];
          v106[1] = 3221225472;
          v106[2] = __104__HMMTRThreadSoftwareUpdateController__attemptConnectionForFirmwareUpdateForAccessoryServer_completion___block_invoke_110;
          v106[3] = &unk_250F228C0;
          v106[4] = v85;
          v107 = v6;
          v93 = v82;
          v108 = v93;
          objc_msgSend(v89, "startAccessoryFirmwareUpdateWithExtendedMACAddress:isWedDevice:completion:", v91, v92, v106);

          objc_destroyWeak(&v114);
          objc_destroyWeak(&location);
          _Block_object_dispose(buf, 8);
          goto LABEL_39;
        }
        v66 = (void *)MEMORY[0x242656984]();
        v67 = v9;
        HMFGetOSLogHandle();
        v68 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v96 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "nodeID");
          v97 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          *(_QWORD *)&buf[4] = v96;
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v97;
          _os_log_impl(&dword_23E95B000, v68, OS_LOG_TYPE_ERROR, "%{public}@Cannot start firmware update for nodeID %@ due to invalid thread state", buf, 0x16u);

        }
        goto LABEL_38;
      }
      v66 = (void *)MEMORY[0x242656984]();
      v67 = v9;
      HMFGetOSLogHandle();
      v68 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v94 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "nodeID");
        v95 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v94;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v95;
        _os_log_impl(&dword_23E95B000, v68, OS_LOG_TYPE_ERROR, "%{public}@Cannot start firmware update for nodeID %@ accessory cannot be made reachable", buf, 0x16u);

      }
    }
    else
    {
      v66 = (void *)MEMORY[0x242656984]();
      v67 = v9;
      HMFGetOSLogHandle();
      v68 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "nodeID");
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v69;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v70;
        _os_log_impl(&dword_23E95B000, v68, OS_LOG_TYPE_ERROR, "%{public}@Cannot start firmware update for nodeID %@ accessory at this point in time", buf, 0x16u);

      }
    }
LABEL_38:

    objc_autoreleasePoolPop(v66);
    objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:", 6);
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, v71);

LABEL_39:
    v22 = 0;
LABEL_40:

    goto LABEL_41;
  }
  v23 = (void *)MEMORY[0x242656984]();
  v24 = v9;
  HMFGetOSLogHandle();
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    *(_QWORD *)&buf[4] = v26;
    _os_log_impl(&dword_23E95B000, v25, OS_LOG_TYPE_ERROR, "%{public}@Feature is not enabled, falling back to sending notification immediately", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v23);
  v7[2](v7, 0);
LABEL_41:

}

- (void)handleFirmwareUpdateStatusChangeForAccessoryServer:(id)a3 state:(int64_t)a4
{
  id v6;
  void *v7;
  HMMTRThreadSoftwareUpdateController *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  HMMTRThreadSoftwareUpdateController *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  HMMTRThreadSoftwareUpdateController *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  const char *v27;
  void *v28;
  uint64_t v29;
  HMMTRThreadSoftwareUpdateController *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  NSObject *v36;
  void *v37;
  void *v38;
  _QWORD v39[5];
  id v40;
  uint8_t buf[4];
  void *v42;
  __int16 v43;
  int64_t v44;
  __int16 v45;
  int64_t v46;
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void *)MEMORY[0x242656984]();
  v8 = self;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "nodeID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v42 = v10;
    v43 = 2112;
    v44 = (int64_t)v11;
    v45 = 2048;
    v46 = a4;
    _os_log_impl(&dword_23E95B000, v9, OS_LOG_TYPE_INFO, "%{public}@Received firmware update status change for accessory server with nodeID:%@, state: %lu", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v7);
  if ((isFeatureMatteriPhoneOnlyPairingControlForThreadEnabled() & 1) != 0)
  {
    -[HMMTRThreadSoftwareUpdateController targetThreadAccessoryServerForFWUpdate](v8, "targetThreadAccessoryServerForFWUpdate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      if ((HMFEqualObjects() & 1) != 0)
      {
        if (a4 == 6)
        {
          v29 = MEMORY[0x242656984]();
          v30 = v8;
          HMFGetOSLogHandle();
          v31 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "nodeID");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v42 = v32;
            v43 = 2048;
            v44 = 6;
            v45 = 2112;
            v46 = (int64_t)v33;
            _os_log_impl(&dword_23E95B000, v31, OS_LOG_TYPE_INFO, "%{public}@Firmware update moved to installed state (%lu) for accessory with nodeID %@", buf, 0x20u);

          }
          v34 = (void *)v29;
          goto LABEL_28;
        }
        if (a4 == 3)
        {
          -[HMMTRThreadSoftwareUpdateController browser](v8, "browser");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "threadRadioManager");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "eMACAddress");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "dataUsingEncoding:", 4);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v6, "isWEDDevice");
          v39[0] = MEMORY[0x24BDAC760];
          v39[1] = 3221225472;
          v39[2] = __96__HMMTRThreadSoftwareUpdateController_handleFirmwareUpdateStatusChangeForAccessoryServer_state___block_invoke;
          v39[3] = &unk_250F23E18;
          v39[4] = v8;
          v40 = v6;
          objc_msgSend(v14, "startAccessoryFirmwareUpdateWithExtendedMACAddress:isWedDevice:completion:", v16, v17, v39);

LABEL_19:
          goto LABEL_20;
        }
        if ((unint64_t)a4 <= 1)
        {
          v35 = MEMORY[0x242656984]();
          v30 = v8;
          HMFGetOSLogHandle();
          v36 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "nodeID");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v42 = v37;
            v43 = 2048;
            v44 = a4;
            v45 = 2112;
            v46 = (int64_t)v38;
            _os_log_impl(&dword_23E95B000, v36, OS_LOG_TYPE_INFO, "%{public}@Firmware update moved to idle or unknown state (%lu) for accessory with nodeID %@", buf, 0x20u);

          }
          v34 = (void *)v35;
LABEL_28:
          objc_autoreleasePoolPop(v34);
          -[HMMTRThreadSoftwareUpdateController _cleanupFirmwareUpdateStateWithError:](v30, "_cleanupFirmwareUpdateStateWithError:", 0);
          goto LABEL_19;
        }
        switch(a4)
        {
          case 5:
            v22 = (void *)MEMORY[0x242656984]();
            v23 = v8;
            HMFGetOSLogHandle();
            v24 = objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
              goto LABEL_18;
            HMFGetLogIdentifier();
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "nodeID");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v42 = v25;
            v43 = 2112;
            v44 = (int64_t)v26;
            v27 = "%{public}@Firmware update moved to installing state for accessory with nodeID %@";
            break;
          case 4:
            v22 = (void *)MEMORY[0x242656984]();
            v23 = v8;
            HMFGetOSLogHandle();
            v24 = objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
              goto LABEL_18;
            HMFGetLogIdentifier();
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "nodeID");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v42 = v25;
            v43 = 2112;
            v44 = (int64_t)v26;
            v27 = "%{public}@Firmware update moved to downloading state for accessory with nodeID %@";
            break;
          case 2:
            v22 = (void *)MEMORY[0x242656984]();
            v23 = v8;
            HMFGetOSLogHandle();
            v24 = objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
              goto LABEL_18;
            HMFGetLogIdentifier();
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "nodeID");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v42 = v25;
            v43 = 2112;
            v44 = (int64_t)v26;
            v27 = "%{public}@Firmware update moved to downloaded state for accessory with nodeID %@";
            break;
          default:
            goto LABEL_19;
        }
        goto LABEL_14;
      }
      v22 = (void *)MEMORY[0x242656984]();
      v23 = v8;
      HMFGetOSLogHandle();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "nodeID");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "nodeID");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v42 = v25;
        v43 = 2112;
        v44 = (int64_t)v26;
        v45 = 2112;
        v46 = (int64_t)v28;
        _os_log_impl(&dword_23E95B000, v24, OS_LOG_TYPE_ERROR, "%{public}@Expecting notification for accessory server with nodeID %@ but received notification for accessory server with nodeID %@ accessory server, ignoring", buf, 0x20u);

        goto LABEL_17;
      }
    }
    else
    {
      v22 = (void *)MEMORY[0x242656984]();
      v23 = v8;
      HMFGetOSLogHandle();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "nodeID");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v42 = v25;
        v43 = 2112;
        v44 = (int64_t)v26;
        v27 = "%{public}@Received notification for accessory server with nodeID %@ accessory server, but not currently tr"
              "acking any firmware updates, ignoring";
LABEL_14:
        _os_log_impl(&dword_23E95B000, v24, OS_LOG_TYPE_INFO, v27, buf, 0x16u);
LABEL_17:

      }
    }
LABEL_18:

    objc_autoreleasePoolPop(v22);
    goto LABEL_19;
  }
  v18 = (void *)MEMORY[0x242656984]();
  v19 = v8;
  HMFGetOSLogHandle();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v42 = v21;
    _os_log_impl(&dword_23E95B000, v20, OS_LOG_TYPE_INFO, "%{public}@Feature is not enabled, ignoring", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v18);
LABEL_20:

}

- (void)timerDidFire:(id)a3
{
  id v4;
  void *v5;
  HMMTRThreadSoftwareUpdateController *v6;
  NSObject *v7;
  void *v8;
  id WeakRetained;
  void *v10;
  HMMTRThreadSoftwareUpdateController *v11;
  void *v12;
  HMMTRThreadSoftwareUpdateController *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  HMMTRThreadSoftwareUpdateController *v17;
  void *v18;
  HMMTRThreadSoftwareUpdateController *v19;
  NSObject *v20;
  void *v21;
  _QWORD v22[5];
  HMMTRThreadSoftwareUpdateController *v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  HMMTRThreadSoftwareUpdateController *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x242656984]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v25 = v8;
    v26 = 2112;
    v27 = v6;
    _os_log_impl(&dword_23E95B000, v7, OS_LOG_TYPE_DEBUG, "%{public}@%@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  WeakRetained = objc_loadWeakRetained((id *)&v6->_browser);
  if (WeakRetained)
  {
    -[HMMTRThreadSoftwareUpdateController targetThreadAccessoryServerForFWUpdate](v6, "targetThreadAccessoryServerForFWUpdate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "nodeID");
    v11 = (HMMTRThreadSoftwareUpdateController *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)MEMORY[0x242656984]();
    v13 = v6;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v25 = v15;
      v26 = 2112;
      v27 = v11;
      _os_log_impl(&dword_23E95B000, v14, OS_LOG_TYPE_ERROR, "%{public}@Timed up doing firmware update for nodeID %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v12);
    objc_msgSend(WeakRetained, "threadRadioManager");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = MEMORY[0x24BDAC760];
    v22[1] = 3221225472;
    v22[2] = __52__HMMTRThreadSoftwareUpdateController_timerDidFire___block_invoke;
    v22[3] = &unk_250F23E18;
    v22[4] = v13;
    v23 = v11;
    v17 = v11;
    objc_msgSend(v16, "stopAccessoryFirmwareUpdateWithCompletion:", v22);

  }
  else
  {
    v18 = (void *)MEMORY[0x242656984]();
    v19 = v6;
    HMFGetOSLogHandle();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v25 = v21;
      _os_log_impl(&dword_23E95B000, v20, OS_LOG_TYPE_ERROR, "%{public}@Unable to get browser ref in HMMTRSoftwareUpdateProvider timerDidFire", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v18);
  }

}

- (OS_dispatch_queue)clientQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 8, 1);
}

- (HMMTRAccessoryServerBrowser)browser
{
  return (HMMTRAccessoryServerBrowser *)objc_loadWeakRetained((id *)&self->_browser);
}

- (void)setBrowser:(id)a3
{
  objc_storeWeak((id *)&self->_browser, a3);
}

- (HMMTRAccessoryServer)targetThreadAccessoryServerForFWUpdate
{
  return (HMMTRAccessoryServer *)objc_loadWeakRetained((id *)&self->_targetThreadAccessoryServerForFWUpdate);
}

- (void)setTargetThreadAccessoryServerForFWUpdate:(id)a3
{
  objc_storeWeak((id *)&self->_targetThreadAccessoryServerForFWUpdate, a3);
}

- (HMMTRAccessoryReachabilityObserver)reachabilityObserver
{
  return (HMMTRAccessoryReachabilityObserver *)objc_getProperty(self, a2, 32, 1);
}

- (HMFTimer)firmwareUpdateActiveTimer
{
  return (HMFTimer *)objc_getProperty(self, a2, 40, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_firmwareUpdateActiveTimer, 0);
  objc_storeStrong((id *)&self->_reachabilityObserver, 0);
  objc_destroyWeak((id *)&self->_targetThreadAccessoryServerForFWUpdate);
  objc_destroyWeak((id *)&self->_browser);
  objc_storeStrong((id *)&self->_clientQueue, 0);
}

void __52__HMMTRThreadSoftwareUpdateController_timerDidFire___block_invoke(uint64_t a1, void *a2)
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
  v4 = (void *)MEMORY[0x242656984]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
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
    _os_log_impl(&dword_23E95B000, v6, OS_LOG_TYPE_ERROR, "%{public}@Failed to inform thread SW of stop firmware update for nodeID %@, error %@", (uint8_t *)&v9, 0x20u);

  }
  objc_autoreleasePoolPop(v4);
  objc_msgSend(*(id *)(a1 + 32), "_cleanupFirmwareUpdateStateWithError:", 0);

}

void __96__HMMTRThreadSoftwareUpdateController_handleFirmwareUpdateStatusChangeForAccessoryServer_state___block_invoke(uint64_t a1, void *a2)
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
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
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
      objc_msgSend(*(id *)(a1 + 40), "nodeID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543874;
      v13 = v8;
      v14 = 2112;
      v15 = v9;
      v16 = 2112;
      v17 = v3;
      _os_log_impl(&dword_23E95B000, v7, OS_LOG_TYPE_ERROR, "%{public}@Failed to inform thread SW of start firmware update for accessory with nodeID %@, error %@", (uint8_t *)&v12, 0x20u);

    }
    objc_autoreleasePoolPop(v4);
    objc_msgSend(*(id *)(a1 + 32), "_cleanupFirmwareUpdateStateWithError:", v3);
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "nodeID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543618;
      v13 = v10;
      v14 = 2112;
      v15 = v11;
      _os_log_impl(&dword_23E95B000, v7, OS_LOG_TYPE_INFO, "%{public}@Successfully informed thread SW of start firmware update for accessory with nodeID %@", (uint8_t *)&v12, 0x16u);

    }
    objc_autoreleasePoolPop(v4);
  }

}

void __104__HMMTRThreadSoftwareUpdateController__attemptConnectionForFirmwareUpdateForAccessoryServer_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  _QWORD block[4];
  id v17;
  id v18;
  id v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  id v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (v3 && !*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    v5 = (void *)MEMORY[0x242656984]();
    v6 = WeakRetained;
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "targetThreadAccessoryServerForFWUpdate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "nodeID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v21 = v8;
      v22 = 2112;
      v23 = v10;
      v24 = 2112;
      v25 = v3;
      _os_log_impl(&dword_23E95B000, v7, OS_LOG_TYPE_ERROR, "%{public}@Failed to connect to accessory in time for nodeID %@, error %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v5);
  }
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    v11 = (void *)MEMORY[0x242656984]();
    v12 = WeakRetained;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v21 = v14;
      v22 = 2112;
      v23 = v12;
      v24 = 2112;
      v25 = v3;
      _os_log_impl(&dword_23E95B000, v13, OS_LOG_TYPE_INFO, "%{public}@Firmware update connection attempt for a accessory with nodeID %@, error = %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v11);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    objc_msgSend(v12, "clientQueue");
    v15 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __104__HMMTRThreadSoftwareUpdateController__attemptConnectionForFirmwareUpdateForAccessoryServer_completion___block_invoke_109;
    block[3] = &unk_250F240D8;
    v17 = v3;
    v18 = v12;
    v19 = *(id *)(a1 + 32);
    dispatch_async(v15, block);

  }
}

void __104__HMMTRThreadSoftwareUpdateController__attemptConnectionForFirmwareUpdateForAccessoryServer_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:", 13);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

void __104__HMMTRThreadSoftwareUpdateController__attemptConnectionForFirmwareUpdateForAccessoryServer_completion___block_invoke_110(id *a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD v17[5];
  id v18;
  _QWORD block[4];
  id v20;
  id v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x242656984]();
  v5 = a1[4];
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v3)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[5], "nodeID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v23 = v8;
      v24 = 2112;
      v25 = v9;
      v26 = 2112;
      v27 = v3;
      _os_log_impl(&dword_23E95B000, v7, OS_LOG_TYPE_ERROR, "%{public}@Failed to inform thread SW of start firmware update for accessory with nodeID %@, error %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v4);
    objc_msgSend(a1[4], "firmwareUpdateActiveTimer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "suspend");

    objc_msgSend(a1[4], "setTargetThreadAccessoryServerForFWUpdate:", 0);
    objc_msgSend(a1[4], "clientQueue");
    v11 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __104__HMMTRThreadSoftwareUpdateController__attemptConnectionForFirmwareUpdateForAccessoryServer_completion___block_invoke_111;
    block[3] = &unk_250F22768;
    v21 = a1[6];
    v20 = v3;
    dispatch_async(v11, block);

    v12 = v21;
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[5], "nodeID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v23 = v13;
      v24 = 2112;
      v25 = v14;
      _os_log_impl(&dword_23E95B000, v7, OS_LOG_TYPE_INFO, "%{public}@Successfully informed thread SW of start firmware update for accessory with nodeID %@, waiting for reachability to update", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v4);
    objc_msgSend(a1[4], "reachabilityObserver");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __104__HMMTRThreadSoftwareUpdateController__attemptConnectionForFirmwareUpdateForAccessoryServer_completion___block_invoke_112;
    v17[3] = &unk_250F23CD0;
    v16 = a1[5];
    v17[4] = a1[4];
    v18 = a1[6];
    objc_msgSend(v15, "startObservingReachabilityForAccessoryServer:completion:", v16, v17);

    v12 = v18;
  }

}

uint64_t __104__HMMTRThreadSoftwareUpdateController__attemptConnectionForFirmwareUpdateForAccessoryServer_completion___block_invoke_111(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __104__HMMTRThreadSoftwareUpdateController__attemptConnectionForFirmwareUpdateForAccessoryServer_completion___block_invoke_112(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "clientQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __104__HMMTRThreadSoftwareUpdateController__attemptConnectionForFirmwareUpdateForAccessoryServer_completion___block_invoke_2_113;
  v7[3] = &unk_250F22768;
  v5 = *(id *)(a1 + 40);
  v8 = v3;
  v9 = v5;
  v6 = v3;
  dispatch_async(v4, v7);

}

uint64_t __104__HMMTRThreadSoftwareUpdateController__attemptConnectionForFirmwareUpdateForAccessoryServer_completion___block_invoke_2_113(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __104__HMMTRThreadSoftwareUpdateController__attemptConnectionForFirmwareUpdateForAccessoryServer_completion___block_invoke_109(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  void *v4;

  v3 = a1[4];
  v2 = (void *)a1[5];
  if (v3)
  {
    objc_msgSend(v2, "_cleanupFirmwareUpdateStateWithError:");
  }
  else
  {
    objc_msgSend(v2, "reachabilityObserver");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stopObservingReachabilityWithError:", a1[4]);

  }
  return (*(uint64_t (**)(void))(a1[6] + 16))();
}

void __90__HMMTRThreadSoftwareUpdateController_handleUpdateRequestedForAccessoryServer_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void (*v10)(void);
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (v3)
  {
    v4 = (void *)MEMORY[0x242656984]();
    v5 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "nodeID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138543874;
      v17 = v7;
      v18 = 2112;
      v19 = v8;
      v20 = 2112;
      v21 = v3;
      _os_log_impl(&dword_23E95B000, v6, OS_LOG_TYPE_ERROR, "%{public}@Unable to connect to accessory with nodeID:%@ error:%@", (uint8_t *)&v16, 0x20u);

    }
    objc_autoreleasePoolPop(v4);
    objc_msgSend(*(id *)(a1 + 40), "matterFirmwareUpdateStatus");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "updateFirmwareUpdateStatus:", 0);

    v10 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
  }
  else
  {
    if (objc_msgSend(*(id *)(a1 + 40), "accessoryLinkLayerTypeIsWifiOrEthernet"))
    {
      v11 = (void *)MEMORY[0x242656984]();
      v12 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "nodeID");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = 138543618;
        v17 = v14;
        v18 = 2112;
        v19 = v15;
        _os_log_impl(&dword_23E95B000, v13, OS_LOG_TYPE_INFO, "%{public}@Accessory server with nodeID %@ became reachable, but is an IP accessory, no tracking needed.", (uint8_t *)&v16, 0x16u);

      }
      objc_autoreleasePoolPop(v11);
      objc_msgSend(*(id *)(a1 + 32), "_cleanupFirmwareUpdateStateWithError:", 0);
    }
    v10 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
  }
  v10();

}

void __76__HMMTRThreadSoftwareUpdateController__cleanupFirmwareUpdateStateWithError___block_invoke(uint64_t a1, void *a2)
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
    v4 = (void *)MEMORY[0x242656984]();
    v5 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138543618;
      v9 = v7;
      v10 = 2112;
      v11 = v3;
      _os_log_impl(&dword_23E95B000, v6, OS_LOG_TYPE_ERROR, "%{public}@Failed to inform thread SW of stop firmware update after successful fw installed, error %@", (uint8_t *)&v8, 0x16u);

    }
    objc_autoreleasePoolPop(v4);
  }

}

+ (id)logCategory
{
  if (logCategory__hmf_once_t56 != -1)
    dispatch_once(&logCategory__hmf_once_t56, &__block_literal_global_114);
  return (id)logCategory__hmf_once_v57;
}

void __50__HMMTRThreadSoftwareUpdateController_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v57;
  logCategory__hmf_once_v57 = v0;

}

@end
