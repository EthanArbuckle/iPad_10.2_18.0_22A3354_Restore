@implementation HMMTRFirmwareUpdateStatus

- (HMMTRFirmwareUpdateStatus)initWithFirmwareUpdateStatus:(id)a3 accessoryServer:(id)a4 browser:(id)a5
{
  id v9;
  id v10;
  id v11;
  HMMTRFirmwareUpdateStatus *v12;
  HMMTRFirmwareUpdateStatus *v13;
  NSNumber *downloadedFirmwareVersionNumber;
  void *v15;
  const char *v16;
  NSObject *v17;
  NSObject *v18;
  dispatch_queue_t v19;
  OS_dispatch_queue *idleResetTimerQueue;
  uint64_t v21;
  HMFTimer *idleResetTimer;
  objc_super v24;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v24.receiver = self;
  v24.super_class = (Class)HMMTRFirmwareUpdateStatus;
  v12 = -[HMMTRFirmwareUpdateStatus init](&v24, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeWeak((id *)&v12->_accessoryServer, v10);
    objc_storeWeak((id *)&v13->_browser, v11);
    objc_storeStrong((id *)&v13->_localFirmwareUpdateStatus, a3);
    downloadedFirmwareVersionNumber = v13->_downloadedFirmwareVersionNumber;
    v13->_downloadedFirmwareVersionNumber = 0;

    -[HAPMatterFirmwareUpdateStatus OTAProviderState](v13->_localFirmwareUpdateStatus, "OTAProviderState");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v13->_otaProviderState = objc_msgSend(v15, "value");

    v16 = (const char *)HMFDispatchQueueName();
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v17 = objc_claimAutoreleasedReturnValue();
    dispatch_get_global_queue(17, 0);
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = dispatch_queue_create_with_target_V2(v16, v17, v18);
    idleResetTimerQueue = v13->_idleResetTimerQueue;
    v13->_idleResetTimerQueue = (OS_dispatch_queue *)v19;

    v21 = objc_msgSend(objc_alloc(MEMORY[0x24BE3F298]), "initWithTimeInterval:options:", 0, 86400.0);
    idleResetTimer = v13->_idleResetTimer;
    v13->_idleResetTimer = (HMFTimer *)v21;

    -[HMFTimer setDelegateQueue:](v13->_idleResetTimer, "setDelegateQueue:", v13->_idleResetTimerQueue);
    -[HMFTimer setDelegate:](v13->_idleResetTimer, "setDelegate:", v13);
  }

  return v13;
}

- (void)timerDidFire:(id)a3
{
  id v4;
  void *v5;
  HMMTRFirmwareUpdateStatus *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x242656984]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMMTRFirmwareUpdateStatus accessoryServer](v6, "accessoryServer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543618;
    v11 = v8;
    v12 = 2112;
    v13 = v9;
    _os_log_impl(&dword_23E95B000, v7, OS_LOG_TYPE_INFO, "%{public}@Idle reset timed out for accessory server [%@]", (uint8_t *)&v10, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  if (-[HMMTRFirmwareUpdateStatus otaProviderState](v6, "otaProviderState") != 1)
    -[HMMTRFirmwareUpdateStatus updateFirmwareUpdateStatus:](v6, "updateFirmwareUpdateStatus:", 1);

}

- (void)setLocalFirmwareUpdateStatus:(id)a3
{
  id v5;
  void *v6;
  unint64_t v7;
  void *v8;
  HMMTRFirmwareUpdateStatus *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  void *v17;
  HMMTRFirmwareUpdateStatus *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  HMMTRFirmwareUpdateStatus *v24;
  NSObject *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  _BYTE v30[24];
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  objc_storeStrong((id *)&self->_localFirmwareUpdateStatus, a3);
  objc_msgSend(v5, "OTAProviderState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  self->_otaProviderState = objc_msgSend(v6, "value");

  v7 = -[HMMTRFirmwareUpdateStatus otaProviderState](self, "otaProviderState");
  if (v7 <= 6)
  {
    if (((1 << v7) & 0x35) != 0)
    {
      v8 = (void *)MEMORY[0x242656984]();
      v9 = self;
      HMFGetOSLogHandle();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMMTRFirmwareUpdateStatus idleResetTimer](v9, "idleResetTimer");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "timeInterval");
        v14 = v13;
        -[HMMTRFirmwareUpdateStatus accessoryServer](v9, "accessoryServer");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v30 = 138543874;
        *(_QWORD *)&v30[4] = v11;
        *(_WORD *)&v30[12] = 2048;
        *(_QWORD *)&v30[14] = v14;
        *(_WORD *)&v30[22] = 2112;
        v31 = v15;
        v16 = "%{public}@Kicking idle reset timer with delay of %f seconds for accessory server [%@]";
LABEL_14:
        _os_log_impl(&dword_23E95B000, v10, OS_LOG_TYPE_INFO, v16, v30, 0x20u);

      }
    }
    else
    {
      if (((1 << v7) & 0x42) != 0)
      {
        v17 = (void *)MEMORY[0x242656984]();
        v18 = self;
        HMFGetOSLogHandle();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          -[HMMTRFirmwareUpdateStatus accessoryServer](v18, "accessoryServer");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)v30 = 138543618;
          *(_QWORD *)&v30[4] = v20;
          *(_WORD *)&v30[12] = 2112;
          *(_QWORD *)&v30[14] = v21;
          _os_log_impl(&dword_23E95B000, v19, OS_LOG_TYPE_INFO, "%{public}@Stop idle reset timer for accessory server [%@]", v30, 0x16u);

        }
        objc_autoreleasePoolPop(v17);
        -[HMMTRFirmwareUpdateStatus idleResetTimer](v18, "idleResetTimer");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "suspend");
        goto LABEL_16;
      }
      v8 = (void *)MEMORY[0x242656984]();
      v9 = self;
      HMFGetOSLogHandle();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMMTRFirmwareUpdateStatus idleResetTimer](v9, "idleResetTimer");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "timeInterval");
        v28 = v27;
        -[HMMTRFirmwareUpdateStatus accessoryServer](v9, "accessoryServer");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v30 = 138543874;
        *(_QWORD *)&v30[4] = v11;
        *(_WORD *)&v30[12] = 2048;
        *(_QWORD *)&v30[14] = v28;
        *(_WORD *)&v30[22] = 2112;
        v31 = v15;
        v16 = "%{public}@Starting idle reset timer with delay of %f seconds for accessory server [%@]";
        goto LABEL_14;
      }
    }

    objc_autoreleasePoolPop(v8);
    -[HMMTRFirmwareUpdateStatus idleResetTimer](v9, "idleResetTimer");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "resume");
LABEL_16:

    goto LABEL_17;
  }
  v23 = (void *)MEMORY[0x242656984]();
  v24 = self;
  HMFGetOSLogHandle();
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v30 = 138543618;
    *(_QWORD *)&v30[4] = v26;
    *(_WORD *)&v30[12] = 1024;
    *(_DWORD *)&v30[14] = -[HMMTRFirmwareUpdateStatus otaProviderState](v24, "otaProviderState");
    _os_log_impl(&dword_23E95B000, v25, OS_LOG_TYPE_ERROR, "%{public}@Invalid OTA provider state : %d", v30, 0x12u);

  }
  objc_autoreleasePoolPop(v23);
LABEL_17:
  -[HMMTRFirmwareUpdateStatus accessoryServer](self, "accessoryServer", *(_OWORD *)v30, *(_QWORD *)&v30[16], v31);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "handleFirmwareUpdateStatusChange:", -[HMMTRFirmwareUpdateStatus otaProviderState](self, "otaProviderState"));

}

- (void)updateDownloadedFirmwareVersionNumber:(id)a3
{
  id v4;
  void *v5;
  HMMTRFirmwareUpdateStatus *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x242656984](-[HMMTRFirmwareUpdateStatus setDownloadedFirmwareVersionNumber:](self, "setDownloadedFirmwareVersionNumber:", v4));
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMMTRFirmwareUpdateStatus downloadedFirmwareVersionNumber](v6, "downloadedFirmwareVersionNumber");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543618;
    v11 = v8;
    v12 = 2112;
    v13 = v9;
    _os_log_impl(&dword_23E95B000, v7, OS_LOG_TYPE_INFO, "%{public}@Updated downloadedFirmwareVersionNumber: %@", (uint8_t *)&v10, 0x16u);

  }
  objc_autoreleasePoolPop(v5);

}

- (void)checkCurrentFirmwareVersionNumber:(id)a3
{
  id v4;
  void *v5;
  HMMTRFirmwareUpdateStatus *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  HMMTRFirmwareUpdateStatus *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  HMMTRFirmwareUpdateStatus *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  _QWORD v26[5];
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  id v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x242656984]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMMTRFirmwareUpdateStatus downloadedFirmwareVersionNumber](v6, "downloadedFirmwareVersionNumber");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v28 = v8;
    v29 = 2112;
    v30 = v4;
    v31 = 2112;
    v32 = v9;
    _os_log_impl(&dword_23E95B000, v7, OS_LOG_TYPE_INFO, "%{public}@Checking currentFirmwareVersionNumber: %@ with downloadedFirmwareVersionNumber: %@ to determine if a software update was installed.", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v5);
  -[HMMTRFirmwareUpdateStatus downloadedFirmwareVersionNumber](v6, "downloadedFirmwareVersionNumber");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[HMMTRFirmwareUpdateStatus downloadedFirmwareVersionNumber](v6, "downloadedFirmwareVersionNumber");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v4, "isEqualToNumber:", v11);

    if (v12)
    {
      -[HMMTRFirmwareUpdateStatus accessoryServer](v6, "accessoryServer");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "otaUpdateTimer");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14)
      {
        v15 = (void *)MEMORY[0x242656984]();
        v16 = v6;
        HMFGetOSLogHandle();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v28 = v18;
          _os_log_impl(&dword_23E95B000, v17, OS_LOG_TYPE_INFO, "%{public}@Stopping OTA update timer", buf, 0xCu);

        }
        objc_autoreleasePoolPop(v15);
        -[HMMTRFirmwareUpdateStatus accessoryServer](v16, "accessoryServer");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "otaUpdateTimer");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "stop");

      }
      v21 = (void *)MEMORY[0x242656984]();
      v22 = v6;
      HMFGetOSLogHandle();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v28 = v24;
        _os_log_impl(&dword_23E95B000, v23, OS_LOG_TYPE_INFO, "%{public}@Updating OTA Provider state to Installed and re-setting downloadedFirmwareVersionNumber to nil", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v21);
      -[HMMTRFirmwareUpdateStatus setDownloadedFirmwareVersionNumber:](v22, "setDownloadedFirmwareVersionNumber:", 0);
      -[HMMTRFirmwareUpdateStatus accessoryServer](v22, "accessoryServer");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26[0] = MEMORY[0x24BDAC760];
      v26[1] = 3221225472;
      v26[2] = __63__HMMTRFirmwareUpdateStatus_checkCurrentFirmwareVersionNumber___block_invoke;
      v26[3] = &unk_250F223C0;
      v26[4] = v22;
      objc_msgSend(v25, "refreshThreadCapabilitiesWithCompletion:", v26);

      -[HMMTRFirmwareUpdateStatus updateFirmwareUpdateStatus:](v22, "updateFirmwareUpdateStatus:", 6);
    }
  }

}

- (void)updateFirmwareUpdateStatus:(int64_t)a3
{
  void *v5;
  HMMTRFirmwareUpdateStatus *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  HMMTRFirmwareUpdateStatus *v13;
  NSObject *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  HMMTRFirmwareUpdateStatus *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  int v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  void *v45;
  void *v46;
  HMMTRFirmwareUpdateStatus *v47;
  NSObject *v48;
  void *v49;
  void *v50;
  HMMTRFirmwareUpdateStatus *v51;
  NSObject *v52;
  void *v53;
  void *v54;
  int64_t v55;
  void *v56;
  void *v57;
  id v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  _BYTE v67[128];
  uint8_t v68[128];
  uint8_t buf[4];
  void *v70;
  __int16 v71;
  void *v72;
  __int16 v73;
  void *v74;
  __int16 v75;
  void *v76;
  uint64_t v77;

  v77 = *MEMORY[0x24BDAC8D0];
  v5 = (void *)MEMORY[0x242656984](self, a2);
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMMTRFirmwareUpdateStatus otaProviderState](v6, "otaProviderState");
    HAPOTAProviderStateAsString();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    HAPOTAProviderStateAsString();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMMTRFirmwareUpdateStatus accessoryServer](v6, "accessoryServer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v70 = v8;
    v71 = 2112;
    v72 = v9;
    v73 = 2112;
    v74 = v10;
    v75 = 2112;
    v76 = v11;
    _os_log_impl(&dword_23E95B000, v7, OS_LOG_TYPE_INFO, "%{public}@Updating OTA Provider state from %@ to %@ for accessory server [%@]", buf, 0x2Au);

  }
  objc_autoreleasePoolPop(v5);
  if ((unint64_t)a3 >= 7)
  {
    v27 = (void *)MEMORY[0x242656984]();
    v28 = v6;
    HMFGetOSLogHandle();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v70 = v30;
      v71 = 1024;
      LODWORD(v72) = a3;
      _os_log_impl(&dword_23E95B000, v29, OS_LOG_TYPE_ERROR, "%{public}@Invalid OTA provider state : %d", buf, 0x12u);

    }
    objc_autoreleasePoolPop(v27);
  }
  else
  {
    if (((1 << a3) & 0x43) != 0)
    {
      v12 = (void *)MEMORY[0x242656984]();
      v13 = v6;
      HMFGetOSLogHandle();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v70 = v15;
        _os_log_impl(&dword_23E95B000, v14, OS_LOG_TYPE_INFO, "%{public}@Resetting downloadedFirmwareVersionNumber to nil", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v12);
      -[HMMTRFirmwareUpdateStatus setDownloadedFirmwareVersionNumber:](v13, "setDownloadedFirmwareVersionNumber:", 0);
    }
    v55 = a3;
    v16 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v63 = 0u;
    v64 = 0u;
    v65 = 0u;
    v66 = 0u;
    -[HMMTRFirmwareUpdateStatus accessoryServer](v6, "accessoryServer");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "primaryAccessory");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "services");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v63, v68, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v64;
      while (2)
      {
        for (i = 0; i != v21; ++i)
        {
          if (*(_QWORD *)v64 != v22)
            objc_enumerationMutation(v19);
          v24 = *(void **)(*((_QWORD *)&v63 + 1) + 8 * i);
          objc_msgSend(v24, "type");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = objc_msgSend(v25, "isEqualToString:", CFSTR("00000236-0000-1000-8000-0026BB765291"));

          if (v26)
          {
            v61 = 0u;
            v62 = 0u;
            v59 = 0u;
            v60 = 0u;
            objc_msgSend(v24, "characteristics");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v59, v67, 16);
            if (v32)
            {
              v33 = v32;
              v34 = *(_QWORD *)v60;
              v54 = v16;
LABEL_22:
              v35 = 0;
              while (1)
              {
                if (*(_QWORD *)v60 != v34)
                  objc_enumerationMutation(v31);
                v36 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * v35);
                objc_msgSend(v36, "type");
                v37 = (void *)objc_claimAutoreleasedReturnValue();
                v38 = objc_msgSend(v37, "isEqualToString:", CFSTR("0000026E-0000-1000-8000-0026BB765291"));

                if (v38)
                  break;
                if (v33 == ++v35)
                {
                  v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v59, v67, 16);
                  v16 = v54;
                  if (v33)
                    goto LABEL_22;
                  goto LABEL_36;
                }
              }
              v39 = (void *)objc_msgSend(v36, "copy");
              objc_msgSend(v36, "service");
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v39, "setService:", v40);

              v41 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE1BB98]), "initWithValue:", v55);
              v42 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE1BB18]), "initWithOTAProviderState:downloadedFirmwareVersionNumber:accessoryDownloadProgressPercent:", v41, 0, 0);
              v58 = 0;
              objc_msgSend(v42, "serializeWithError:", &v58);
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              v44 = v58;
              if (v44)
              {
                v45 = v44;
                v46 = (void *)MEMORY[0x242656984]();
                v47 = v6;
                HMFGetOSLogHandle();
                v48 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
                {
                  HMFGetLogIdentifier();
                  v56 = v43;
                  v49 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138543618;
                  v70 = v49;
                  v71 = 2112;
                  v72 = v45;
                  _os_log_impl(&dword_23E95B000, v48, OS_LOG_TYPE_ERROR, "%{public}@Matter firmware update status serialized failed. Error: %@", buf, 0x16u);

                  v43 = v56;
                }

                objc_autoreleasePoolPop(v46);
                v16 = v54;
                goto LABEL_38;
              }
              -[HMMTRFirmwareUpdateStatus setLocalFirmwareUpdateStatus:](v6, "setLocalFirmwareUpdateStatus:", v42);
              v57 = v43;
              v50 = (void *)MEMORY[0x242656984](objc_msgSend(v39, "setValue:", v43));
              v51 = v6;
              HMFGetOSLogHandle();
              v52 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
              {
                HMFGetLogIdentifier();
                v53 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543618;
                v70 = v53;
                v71 = 2112;
                v72 = v39;
                _os_log_impl(&dword_23E95B000, v52, OS_LOG_TYPE_INFO, "%{public}@Notification: Updated characteristic: %@", buf, 0x16u);

              }
              objc_autoreleasePoolPop(v50);
              v16 = v54;
              objc_msgSend(v54, "addObject:", v39);

            }
LABEL_36:

            goto LABEL_37;
          }
        }
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v63, v68, 16);
        if (v21)
          continue;
        break;
      }
    }
LABEL_37:

    -[HMMTRFirmwareUpdateStatus accessoryServer](v6, "accessoryServer");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "delegate");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMMTRFirmwareUpdateStatus accessoryServer](v6, "accessoryServer");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "accessoryServer:didUpdateValuesForCharacteristics:stateNumber:broadcast:", v39, v16, 0, 0);
LABEL_38:

  }
}

- (id)readForMatterFirmwareUpdateStatusCharacteristic:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  HMMTRFirmwareUpdateStatus *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v20[5];
  id v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "type");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqual:", CFSTR("0000026E-0000-1000-8000-0026BB765291"));

  if (v6)
  {
    -[HMMTRFirmwareUpdateStatus localFirmwareUpdateStatus](self, "localFirmwareUpdateStatus");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 0;
    objc_msgSend(v7, "serializeWithError:", &v21);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v21;

    v10 = (void *)MEMORY[0x242656984](objc_msgSend(v4, "setValue:", v8));
    v11 = self;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v23 = v13;
      v24 = 2112;
      v25 = v4;
      _os_log_impl(&dword_23E95B000, v12, OS_LOG_TYPE_INFO, "%{public}@Updated matter firmware update status characteristic on local read to :%@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v10);
    -[HMMTRFirmwareUpdateStatus browser](v11, "browser");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "softwareUpdateProvider");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMMTRFirmwareUpdateStatus accessoryServer](v11, "accessoryServer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "currentPairing");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = __77__HMMTRFirmwareUpdateStatus_readForMatterFirmwareUpdateStatusCharacteristic___block_invoke;
    v20[3] = &unk_250F223C0;
    v20[4] = v11;
    objc_msgSend(v15, "notifyDelegateCheckFirmwareUpdateSessionWithPairing:completionHandler:", v17, v20);

    objc_msgSend(v4, "value");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (id)readForHAPFirmwareUpdateStatusCharacteristic:(id)a3
{
  id v4;
  void *v5;
  int v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  HMMTRFirmwareUpdateStatus *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  id v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "type");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqual:", CFSTR("00000235-0000-1000-8000-0026BB765291"));

  if (v6)
  {
    v7 = objc_alloc_init(MEMORY[0x24BE1BAE8]);
    v16 = 0;
    objc_msgSend(v7, "serializeWithError:", &v16);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v16;
    v10 = (void *)MEMORY[0x242656984](objc_msgSend(v4, "setValue:", v8));
    v11 = self;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v18 = v13;
      v19 = 2112;
      v20 = v4;
      _os_log_impl(&dword_23E95B000, v12, OS_LOG_TYPE_INFO, "%{public}@Updated HAP firmware update status characteristic on local read to :%@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v10);
    objc_msgSend(v4, "value");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (id)readForHAPFirmwareUpdateReadinessCharacteristic:(id)a3
{
  id v4;
  void *v5;
  int v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  HMMTRFirmwareUpdateStatus *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  id v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "type");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqual:", CFSTR("00000234-0000-1000-8000-0026BB765291"));

  if (v6)
  {
    v7 = objc_alloc_init(MEMORY[0x24BE1BAE0]);
    v16 = 0;
    objc_msgSend(v7, "serializeWithError:", &v16);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v16;
    v10 = (void *)MEMORY[0x242656984](objc_msgSend(v4, "setValue:", v8));
    v11 = self;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v18 = v13;
      v19 = 2112;
      v20 = v4;
      _os_log_impl(&dword_23E95B000, v12, OS_LOG_TYPE_INFO, "%{public}@Updated HAP firmware update readiness characteristic on local read to :%@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v10);
    objc_msgSend(v4, "value");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (id)_updateStateAsString:(unsigned __int8)a3
{
  if ((a3 - 1) > 7u)
    return CFSTR("Unknown");
  else
    return off_250F20938[(a3 - 1)];
}

- (void)handleOTARequestorAttributeReport:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  int v10;
  void *v11;
  HMMTRFirmwareUpdateStatus *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  HMMTRFirmwareUpdateStatus *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  const char *v26;
  void *v27;
  int v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  int v33;
  void *v34;
  void *v35;
  int v36;
  void *v37;
  __int16 v38;
  id v39;
  __int16 v40;
  void *v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BDDB460]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
    goto LABEL_22;
  objc_msgSend(v5, "cluster");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToNumber:", &unk_250F3F1C8);

  if (!v8)
    goto LABEL_22;
  objc_msgSend(v6, "attribute");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqualToNumber:", &unk_250F3F1E0);

  if (!v10)
  {
    objc_msgSend(v6, "attribute");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "isEqualToNumber:", &unk_250F3F1F8);

    if (v17)
    {
      +[HMMTRUtilities mtrBaseClusterValueFromMTRClusterReportValue:](HMMTRUtilities, "mtrBaseClusterValueFromMTRClusterReportValue:", v4);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v19 = v18;
      else
        v19 = 0;
      v20 = v19;

      v21 = (void *)MEMORY[0x242656984]();
      v22 = self;
      HMFGetOSLogHandle();
      v23 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
        goto LABEL_21;
      HMFGetLogIdentifier();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMMTRFirmwareUpdateStatus accessoryServer](v22, "accessoryServer");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = 138543874;
      v37 = v24;
      v38 = 2112;
      v39 = v20;
      v40 = 2112;
      v41 = v25;
      v26 = "%{public}@OTA Requestor cluster, UpdatePossible Attribute report value:%@ for accessory:%@";
    }
    else
    {
      objc_msgSend(v6, "attribute");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(v27, "isEqualToNumber:", &unk_250F3F210);

      if (v28)
      {
        +[HMMTRUtilities mtrBaseClusterValueFromMTRClusterReportValue:](HMMTRUtilities, "mtrBaseClusterValueFromMTRClusterReportValue:", v4);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v30 = v29;
        else
          v30 = 0;
        v20 = v30;

        v21 = (void *)MEMORY[0x242656984]();
        v22 = self;
        HMFGetOSLogHandle();
        v23 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
          goto LABEL_21;
        HMFGetLogIdentifier();
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMMTRFirmwareUpdateStatus _updateStateAsString:](v22, "_updateStateAsString:", objc_msgSend(v20, "unsignedIntValue"));
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMMTRFirmwareUpdateStatus accessoryServer](v22, "accessoryServer");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = 138543874;
        v37 = v24;
        v38 = 2112;
        v39 = v25;
        v40 = 2112;
        v41 = v31;
        _os_log_impl(&dword_23E95B000, v23, OS_LOG_TYPE_INFO, "%{public}@OTA Requestor cluster, UpdateState Attribute report value:%@ for accessory:%@", (uint8_t *)&v36, 0x20u);

        goto LABEL_20;
      }
      objc_msgSend(v6, "attribute");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = objc_msgSend(v32, "isEqualToNumber:", &unk_250F3F228);

      if (!v33)
        goto LABEL_22;
      +[HMMTRUtilities mtrBaseClusterValueFromMTRClusterReportValue:](HMMTRUtilities, "mtrBaseClusterValueFromMTRClusterReportValue:", v4);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v35 = v34;
      else
        v35 = 0;
      v20 = v35;

      v21 = (void *)MEMORY[0x242656984]();
      v22 = self;
      HMFGetOSLogHandle();
      v23 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
        goto LABEL_21;
      HMFGetLogIdentifier();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMMTRFirmwareUpdateStatus accessoryServer](v22, "accessoryServer");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = 138543874;
      v37 = v24;
      v38 = 2112;
      v39 = v20;
      v40 = 2112;
      v41 = v25;
      v26 = "%{public}@OTA Requestor cluster, UpdateStateProgress Attribute report value:%@ for accessory:%@";
    }
    _os_log_impl(&dword_23E95B000, v23, OS_LOG_TYPE_INFO, v26, (uint8_t *)&v36, 0x20u);
LABEL_20:

LABEL_21:
    objc_autoreleasePoolPop(v21);

    goto LABEL_22;
  }
  v11 = (void *)MEMORY[0x242656984]();
  v12 = self;
  HMFGetOSLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMMTRFirmwareUpdateStatus accessoryServer](v12, "accessoryServer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = 138543874;
    v37 = v14;
    v38 = 2112;
    v39 = v4;
    v40 = 2112;
    v41 = v15;
    _os_log_impl(&dword_23E95B000, v13, OS_LOG_TYPE_INFO, "%{public}@OTA Requestor cluster, DefaultOTAProviders Attribute report:%@ for accessory:%@", (uint8_t *)&v36, 0x20u);

  }
  objc_autoreleasePoolPop(v11);
LABEL_22:

}

- (int64_t)otaProviderState
{
  return self->_otaProviderState;
}

- (HMMTRAccessoryServer)accessoryServer
{
  return (HMMTRAccessoryServer *)objc_loadWeakRetained((id *)&self->_accessoryServer);
}

- (HAPMatterFirmwareUpdateStatus)localFirmwareUpdateStatus
{
  return self->_localFirmwareUpdateStatus;
}

- (NSNumber)downloadedFirmwareVersionNumber
{
  return self->_downloadedFirmwareVersionNumber;
}

- (void)setDownloadedFirmwareVersionNumber:(id)a3
{
  objc_storeStrong((id *)&self->_downloadedFirmwareVersionNumber, a3);
}

- (OS_dispatch_queue)idleResetTimerQueue
{
  return self->_idleResetTimerQueue;
}

- (HMMTRAccessoryServerBrowser)browser
{
  return (HMMTRAccessoryServerBrowser *)objc_loadWeakRetained((id *)&self->_browser);
}

- (void)setBrowser:(id)a3
{
  objc_storeWeak((id *)&self->_browser, a3);
}

- (HMFTimer)idleResetTimer
{
  return self->_idleResetTimer;
}

- (void)setIdleResetTimer:(id)a3
{
  objc_storeStrong((id *)&self->_idleResetTimer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_idleResetTimer, 0);
  objc_destroyWeak((id *)&self->_browser);
  objc_storeStrong((id *)&self->_idleResetTimerQueue, 0);
  objc_storeStrong((id *)&self->_downloadedFirmwareVersionNumber, 0);
  objc_storeStrong((id *)&self->_localFirmwareUpdateStatus, 0);
  objc_destroyWeak((id *)&self->_accessoryServer);
}

void __77__HMMTRFirmwareUpdateStatus_readForMatterFirmwareUpdateStatusCharacteristic___block_invoke(uint64_t a1, void *a2)
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
      _os_log_impl(&dword_23E95B000, v6, OS_LOG_TYPE_ERROR, "%{public}@Delegate call to check firmware update session failed: %@", (uint8_t *)&v8, 0x16u);

    }
    objc_autoreleasePoolPop(v4);
  }

}

void __63__HMMTRFirmwareUpdateStatus_checkCurrentFirmwareVersionNumber___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x242656984]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "accessoryServer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "nodeID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543618;
    v11 = v7;
    v12 = 2112;
    v13 = v9;
    _os_log_impl(&dword_23E95B000, v6, OS_LOG_TYPE_INFO, "%{public}@Done refreshing thread capabilities for accessory server with nodeID: %@", (uint8_t *)&v10, 0x16u);

  }
  objc_autoreleasePoolPop(v4);

}

+ (id)logCategory
{
  if (logCategory__hmf_once_t26 != -1)
    dispatch_once(&logCategory__hmf_once_t26, &__block_literal_global_1290);
  return (id)logCategory__hmf_once_v27;
}

void __40__HMMTRFirmwareUpdateStatus_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v27;
  logCategory__hmf_once_v27 = v0;

}

@end
