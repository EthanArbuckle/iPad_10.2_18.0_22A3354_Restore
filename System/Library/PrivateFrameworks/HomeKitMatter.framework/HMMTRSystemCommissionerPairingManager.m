@implementation HMMTRSystemCommissionerPairingManager

- (HMMTRSystemCommissionerPairingManager)initWithQueue:(id)a3 accessoryServerBrowser:(id)a4
{
  id v7;
  id v8;
  HMMTRSystemCommissionerPairingManager *v9;
  HMMTRSystemCommissionerPairingManager *v10;
  void *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)HMMTRSystemCommissionerPairingManager;
  v9 = -[HMMTRSystemCommissionerPairingManager init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_workQueue, a3);
    objc_storeWeak((id *)&v10->_browser, v8);
    objc_msgSend(v8, "storage");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)&v10->_storage, v11);

  }
  return v10;
}

- (void)fetchSystemCommissionerPairingsWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HMMTRSystemCommissionerPairingManager workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __94__HMMTRSystemCommissionerPairingManager_fetchSystemCommissionerPairingsWithCompletionHandler___block_invoke;
  v7[3] = &unk_250F22768;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)fetchDevicePairingsForSystemCommissionerPairingUUID:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[HMMTRSystemCommissionerPairingManager workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __111__HMMTRSystemCommissionerPairingManager_fetchDevicePairingsForSystemCommissionerPairingUUID_completionHandler___block_invoke;
  block[3] = &unk_250F240D8;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

- (void)removeSystemCommissionerPairingWithUUID:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[HMMTRSystemCommissionerPairingManager workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __99__HMMTRSystemCommissionerPairingManager_removeSystemCommissionerPairingWithUUID_completionHandler___block_invoke;
  block[3] = &unk_250F240D8;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

- (void)removeDevicePairingWithUUID:(id)a3 forSystemCommissionerPairingUUID:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[HMMTRSystemCommissionerPairingManager workQueue](self, "workQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __120__HMMTRSystemCommissionerPairingManager_removeDevicePairingWithUUID_forSystemCommissionerPairingUUID_completionHandler___block_invoke;
  v15[3] = &unk_250F22B48;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(v11, v15);

}

- (void)removeDevicePairingWithUUID:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  void *v8;
  HMMTRSystemCommissionerPairingManager *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  const char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  v8 = (void *)MEMORY[0x242656984]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138543618;
    v14 = v11;
    v15 = 2080;
    v16 = "-[HMMTRSystemCommissionerPairingManager removeDevicePairingWithUUID:completionHandler:]";
    _os_log_impl(&dword_23E95B000, v10, OS_LOG_TYPE_ERROR, "%{public}@%s is deprecated", (uint8_t *)&v13, 0x16u);

  }
  objc_autoreleasePoolPop(v8);
  objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:", 5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v7[2](v7, v12);

}

- (void)removeAllDevicePairingsForSystemCommissionerPairingUUID:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[HMMTRSystemCommissionerPairingManager workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __115__HMMTRSystemCommissionerPairingManager_removeAllDevicePairingsForSystemCommissionerPairingUUID_completionHandler___block_invoke;
  block[3] = &unk_250F240D8;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

- (void)cleanUpStaleSystemCommissionerPairingsWithNewlyPairedUUID:(id)a3 vendorID:(id)a4 productID:(id)a5 serialNumber:(id)a6 setupPayload:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  NSObject *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  _QWORD v23[5];
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  -[HMMTRSystemCommissionerPairingManager workQueue](self, "workQueue");
  v17 = objc_claimAutoreleasedReturnValue();
  v23[0] = MEMORY[0x24BDAC760];
  v23[1] = 3221225472;
  v23[2] = __144__HMMTRSystemCommissionerPairingManager_cleanUpStaleSystemCommissionerPairingsWithNewlyPairedUUID_vendorID_productID_serialNumber_setupPayload___block_invoke;
  v23[3] = &unk_250F21B48;
  v23[4] = self;
  v24 = v12;
  v25 = v13;
  v26 = v14;
  v27 = v15;
  v28 = v16;
  v18 = v16;
  v19 = v15;
  v20 = v14;
  v21 = v13;
  v22 = v12;
  dispatch_async(v17, v23);

}

- (void)openCommissioningWindowForSystemCommissionerPairingUUID:(id)a3 duration:(double)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  double v16;

  v8 = a3;
  v9 = a5;
  -[HMMTRSystemCommissionerPairingManager workQueue](self, "workQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __124__HMMTRSystemCommissionerPairingManager_openCommissioningWindowForSystemCommissionerPairingUUID_duration_completionHandler___block_invoke;
  v13[3] = &unk_250F228E8;
  v13[4] = self;
  v14 = v8;
  v16 = a4;
  v15 = v9;
  v11 = v9;
  v12 = v8;
  dispatch_async(v10, v13);

}

- (void)readCommissioningWindowStatusForSystemCommissionerPairingUUID:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[HMMTRSystemCommissionerPairingManager workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __121__HMMTRSystemCommissionerPairingManager_readCommissioningWindowStatusForSystemCommissionerPairingUUID_completionHandler___block_invoke;
  block[3] = &unk_250F240D8;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

- (void)_fetchSystemCommissionerPairingsWithCompletionHandler:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t i;
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
  void *v21;
  void *v22;
  HMMTRSystemCommissionerPairingManager *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  HMMTRSystemCommissionerPairingManager *v36;
  NSObject *v37;
  void *v38;
  void *v39;
  NSObject *v40;
  const char *v41;
  void (**v42)(id, void *, _QWORD);
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  NSObject *log;
  void *v48;
  void *v49;
  void *context;
  HMMTRSystemCommissionerPairingManager *v51;
  id obj;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  id v61;
  void *v62;
  id v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  uint8_t buf[4];
  void *v69;
  __int16 v70;
  void *v71;
  __int16 v72;
  id v73;
  __int16 v74;
  void *v75;
  __int16 v76;
  void *v77;
  __int16 v78;
  void *v79;
  __int16 v80;
  void *v81;
  __int16 v82;
  void *v83;
  __int16 v84;
  void *v85;
  _BYTE v86[128];
  uint64_t v87;

  v87 = *MEMORY[0x24BDAC8D0];
  v42 = (void (**)(id, void *, _QWORD))a3;
  -[HMMTRSystemCommissionerPairingManager storage](self, "storage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "endLocalStorageModeBySyncingToRemote:", 0);

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMTRSystemCommissionerPairingManager storage](self, "storage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pairedNodeIDsOnSystemCommissionerFabric:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v66 = 0u;
  v67 = 0u;
  v64 = 0u;
  v65 = 0u;
  obj = v6;
  v54 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v64, v86, 16);
  if (v54)
  {
    v53 = *(_QWORD *)v65;
    do
    {
      for (i = 0; i != v54; ++i)
      {
        if (*(_QWORD *)v65 != v53)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v64 + 1) + 8 * i);
        -[HMMTRSystemCommissionerPairingManager storage](self, "storage");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "uuidForSystemCommissionerFabricNode:", v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        -[HMMTRSystemCommissionerPairingManager storage](self, "storage");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "serialNumberForSystemCommissionerFabricNode:", v8);
        v59 = (void *)objc_claimAutoreleasedReturnValue();

        -[HMMTRSystemCommissionerPairingManager storage](self, "storage");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "vendorIDForSystemCommissionerFabricNode:", v8);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        -[HMMTRSystemCommissionerPairingManager storage](self, "storage");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "productIDForSystemCommissionerFabricNode:", v8);
        v62 = (void *)objc_claimAutoreleasedReturnValue();

        -[HMMTRSystemCommissionerPairingManager storage](self, "storage");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "categoryForSystemCommissionerFabricNode:", v8);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        -[HMMTRSystemCommissionerPairingManager storage](self, "storage");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "deviceNameForSystemCommissionerFabricNode:", v8);
        v58 = (void *)objc_claimAutoreleasedReturnValue();

        -[HMMTRSystemCommissionerPairingManager storage](self, "storage");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setupPayloadForSystemCommissionerFabricNode:", v8);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        v60 = v16;
        if (v19)
        {
          v63 = 0;
          objc_msgSend(MEMORY[0x24BDDB810], "setupPayloadWithOnboardingPayload:error:", v19, &v63);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v61 = v63;
          if (v61)
          {
            v55 = v20;
            v21 = v19;
            v22 = (void *)MEMORY[0x242656984]();
            v23 = self;
            HMFGetOSLogHandle();
            v24 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
            {
              HMFGetLogIdentifier();
              v25 = v13;
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543874;
              v69 = v26;
              v70 = 2112;
              v71 = v21;
              v72 = 2112;
              v73 = v61;
              _os_log_impl(&dword_23E95B000, v24, OS_LOG_TYPE_ERROR, "%{public}@Onboarding payload %@ in System Commissioner Fabric storage could not be converted: %@", buf, 0x20u);

              v13 = v25;
            }

            objc_autoreleasePoolPop(v22);
            v16 = v60;
            v19 = v21;
            v20 = v55;
            if (!v10)
            {
LABEL_20:
              v34 = v19;
              v35 = (void *)MEMORY[0x242656984]();
              v36 = self;
              HMFGetOSLogHandle();
              v37 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
              {
                HMFGetLogIdentifier();
                v57 = v20;
                v38 = v13;
                v39 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543618;
                v69 = v39;
                v70 = 2112;
                v71 = v8;
                v40 = v37;
                v41 = "%{public}@Missing UUID in System Commissioner Fabric storage for nodeID %@";
                goto LABEL_28;
              }
LABEL_29:

              objc_autoreleasePoolPop(v35);
              v16 = v60;
              v19 = v34;
              goto LABEL_30;
            }
          }
          else
          {
            v61 = 0;
            if (!v10)
              goto LABEL_20;
          }
        }
        else
        {
          v61 = 0;
          v20 = 0;
          if (!v10)
            goto LABEL_20;
        }
        if (!v13)
        {
          v34 = v19;
          v35 = (void *)MEMORY[0x242656984]();
          v36 = self;
          HMFGetOSLogHandle();
          v37 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
            goto LABEL_29;
          HMFGetLogIdentifier();
          v57 = v20;
          v38 = 0;
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v69 = v39;
          v70 = 2112;
          v71 = v8;
          v40 = v37;
          v41 = "%{public}@Missing VendorID in System Commissioner Fabric storage for nodeID %@";
LABEL_28:
          _os_log_impl(&dword_23E95B000, v40, OS_LOG_TYPE_INFO, v41, buf, 0x16u);

          v13 = v38;
          v20 = v57;
          goto LABEL_29;
        }
        if (!v62)
        {
          v34 = v19;
          v35 = (void *)MEMORY[0x242656984]();
          v36 = self;
          HMFGetOSLogHandle();
          v37 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
            goto LABEL_29;
          HMFGetLogIdentifier();
          v57 = v20;
          v38 = v13;
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v69 = v39;
          v70 = 2112;
          v71 = v8;
          v40 = v37;
          v41 = "%{public}@Missing ProductID in System Commissioner Fabric storage for nodeID %@";
          goto LABEL_28;
        }
        if (!v16)
        {
          v34 = v19;
          v35 = (void *)MEMORY[0x242656984]();
          v36 = self;
          HMFGetOSLogHandle();
          v37 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
            goto LABEL_29;
          HMFGetLogIdentifier();
          v57 = v20;
          v38 = v13;
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v69 = v39;
          v70 = 2112;
          v71 = v8;
          v40 = v37;
          v41 = "%{public}@Missing DeviceType in System Commissioner Fabric storage for nodeID %@";
          goto LABEL_28;
        }
        v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDDB888]), "initWithUUID:nodeID:vendorID:productID:deviceType:serialNumber:name:setupPayload:", v10, v8, v13, v62, v16, v59, v58, v20);
        context = (void *)MEMORY[0x242656984]();
        v51 = self;
        HMFGetOSLogHandle();
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "uuid");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "nodeID");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "serialNumber");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "vendorID");
          log = v28;
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "productID");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "deviceType");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "name");
          v56 = v20;
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "setupPayload");
          v43 = v19;
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138545410;
          v69 = v49;
          v70 = 2112;
          v71 = v48;
          v72 = 2112;
          v73 = v46;
          v74 = 2112;
          v75 = v45;
          v76 = 2112;
          v77 = v29;
          v78 = 2112;
          v79 = v30;
          v80 = 2112;
          v81 = v31;
          v82 = 2112;
          v83 = v32;
          v84 = 2112;
          v85 = v33;
          _os_log_impl(&dword_23E95B000, log, OS_LOG_TYPE_INFO, "%{public}@UUID = %@, Node ID = %@, Serial Number = %@, VID = %@, PID = %@, DeviceType = %@, Name = %@, Payload = %@", buf, 0x5Cu);

          v19 = v43;
          v20 = v56;

          v16 = v60;
          v28 = log;

        }
        objc_autoreleasePoolPop(context);
        objc_msgSend(v44, "addObject:", v27);

LABEL_30:
      }
      v54 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v64, v86, 16);
    }
    while (v54);
  }

  v42[2](v42, v44, 0);
}

- (void)_removeSystemCommissionerPairingWithUUID:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  HMMTRSystemCommissionerPairingManager *v12;
  NSObject *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  -[HMMTRSystemCommissionerPairingManager storage](self, "storage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "systemCommissionerFabricNodeIDForUuid:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[HMMTRSystemCommissionerPairingManager browser](self, "browser");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "removeSystemCommissionerFabricAccessoryWithNodeID:completionHandler:", v9, v7);
  }
  else
  {
    v11 = (void *)MEMORY[0x242656984]();
    v12 = self;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543618;
      v16 = v14;
      v17 = 2112;
      v18 = v6;
      _os_log_impl(&dword_23E95B000, v13, OS_LOG_TYPE_ERROR, "%{public}@Couldn't find Node on System Commissioner Fabric with UUID = %@", (uint8_t *)&v15, 0x16u);

    }
    objc_autoreleasePoolPop(v11);
    objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:", 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, v10);
  }

}

- (void)_fetchAllDevicePairingsForSystemCommissionerDevicePairingWithUUID:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, void *);
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  HMMTRSystemCommissionerPairingManager *v13;
  NSObject *v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, _QWORD, void *))a4;
  -[HMMTRSystemCommissionerPairingManager storage](self, "storage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "endLocalStorageModeBySyncingToRemote:", 0);

  -[HMMTRSystemCommissionerPairingManager storage](self, "storage");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "systemCommissionerFabricNodeIDForUuid:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[HMMTRSystemCommissionerPairingManager browser](self, "browser");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "fetchAllDevicePairingsForSystemCommissionerDeviceWithNodeID:completionHandler:", v10, v7);
  }
  else
  {
    v12 = (void *)MEMORY[0x242656984]();
    v13 = self;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138543618;
      v17 = v15;
      v18 = 2112;
      v19 = v6;
      _os_log_impl(&dword_23E95B000, v14, OS_LOG_TYPE_ERROR, "%{public}@Couldn't find Node on System Commissioner Fabric with UUID = %@", (uint8_t *)&v16, 0x16u);

    }
    objc_autoreleasePoolPop(v12);
    objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:", 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, 0, v11);
  }

}

- (void)_removeDevicePairingWithUUID:(id)a3 forSystemCommissionerPairingUUID:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, void *);
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  HMMTRSystemCommissionerPairingManager *v15;
  NSObject *v16;
  void *v17;
  int v18;
  void *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, void *))a5;
  -[HMMTRSystemCommissionerPairingManager storage](self, "storage");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "systemCommissionerFabricNodeIDForUuid:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[HMMTRSystemCommissionerPairingManager browser](self, "browser");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "removeDevicePairingFabricForSystemCommissionerDeviceWithNodeID:fabric:completionHandler:", v12, v8, v10);
  }
  else
  {
    v14 = (void *)MEMORY[0x242656984]();
    v15 = self;
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138543618;
      v19 = v17;
      v20 = 2112;
      v21 = v8;
      _os_log_impl(&dword_23E95B000, v16, OS_LOG_TYPE_ERROR, "%{public}@Couldn't find Node on System Commissioner Fabric with UUID = %@", (uint8_t *)&v18, 0x16u);

    }
    objc_autoreleasePoolPop(v14);
    objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:", 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v10[2](v10, v13);
  }

}

- (void)_removeAllDevicePairingsForSystemCommissionerPairingUUID:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  HMMTRSystemCommissionerPairingManager *v12;
  NSObject *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  -[HMMTRSystemCommissionerPairingManager storage](self, "storage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "systemCommissionerFabricNodeIDForUuid:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[HMMTRSystemCommissionerPairingManager browser](self, "browser");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "removeAllDevicePairingsForSystemCommissionerDeviceWithNodeID:completionHandler:", v9, v7);
  }
  else
  {
    v11 = (void *)MEMORY[0x242656984]();
    v12 = self;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543618;
      v16 = v14;
      v17 = 2112;
      v18 = v6;
      _os_log_impl(&dword_23E95B000, v13, OS_LOG_TYPE_ERROR, "%{public}@Couldn't find Node on System Commissioner Fabric with UUID = %@", (uint8_t *)&v15, 0x16u);

    }
    objc_autoreleasePoolPop(v11);
    objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:", 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, v10);
  }

}

- (void)_cleanUpStaleSystemCommissionerPairingsWithNewlyPairedUUID:(id)a3 vendorID:(id)a4 productID:(id)a5 serialNumber:(id)a6 setupPayload:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  HMMTRSystemCommissionerPairingManagerPairingIdentity *v17;
  void *v18;
  void *v19;
  HMMTRSystemCommissionerPairingManager *v20;
  uint64_t i;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  HMMTRSystemCommissionerPairingManagerPairingIdentity *v33;
  void *v34;
  void *v35;
  _BOOL4 v36;
  HMMTRSystemCommissionerPairingManager *v37;
  NSObject *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  HMMTRSystemCommissionerPairingManager *v42;
  NSObject *v43;
  void *v44;
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  void *v50;
  void *context;
  id obj;
  uint64_t v53;
  uint64_t v54;
  HMMTRSystemCommissionerPairingManagerPairingIdentity *v55;
  HMMTRSystemCommissionerPairingManager *v56;
  void *v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  uint8_t buf[4];
  void *v63;
  __int16 v64;
  id v65;
  __int16 v66;
  uint64_t v67;
  _BYTE v68[128];
  uint64_t v69;

  v69 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v17 = -[HMMTRSystemCommissionerPairingManagerPairingIdentity initWithUUID:vendorID:productID:serialNumber:setupPayload:]([HMMTRSystemCommissionerPairingManagerPairingIdentity alloc], "initWithUUID:vendorID:productID:serialNumber:setupPayload:", v12, v13, v14, v15, v16);
  v55 = v17;
  if (-[HMMTRSystemCommissionerPairingManagerPairingIdentity isIdentifiable](v17, "isIdentifiable"))
  {
    v45 = v16;
    v46 = v15;
    v47 = v14;
    v48 = v13;
    v49 = v12;
    -[HMMTRSystemCommissionerPairingManager storage](self, "storage");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "pairedNodeIDsOnSystemCommissionerFabric:", 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v60 = 0u;
    v61 = 0u;
    v58 = 0u;
    v59 = 0u;
    obj = v19;
    v54 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v58, v68, 16);
    if (!v54)
      goto LABEL_16;
    v20 = self;
    v53 = *(_QWORD *)v59;
    v56 = self;
    while (1)
    {
      for (i = 0; i != v54; ++i)
      {
        if (*(_QWORD *)v59 != v53)
          objc_enumerationMutation(obj);
        v22 = *(_QWORD *)(*((_QWORD *)&v58 + 1) + 8 * i);
        -[HMMTRSystemCommissionerPairingManager storage](v20, "storage");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "uuidForSystemCommissionerFabricNode:", v22);
        v24 = objc_claimAutoreleasedReturnValue();

        -[HMMTRSystemCommissionerPairingManager storage](v20, "storage");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "serialNumberForSystemCommissionerFabricNode:", v22);
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        -[HMMTRSystemCommissionerPairingManager storage](v20, "storage");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "vendorIDForSystemCommissionerFabricNode:", v22);
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        -[HMMTRSystemCommissionerPairingManager storage](v20, "storage");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "productIDForSystemCommissionerFabricNode:", v22);
        v30 = (void *)objc_claimAutoreleasedReturnValue();

        -[HMMTRSystemCommissionerPairingManager storage](v20, "storage");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "setupPayloadForSystemCommissionerFabricNode:", v22);
        v32 = (void *)objc_claimAutoreleasedReturnValue();

        v57 = (void *)v24;
        v33 = -[HMMTRSystemCommissionerPairingManagerPairingIdentity initWithUUID:vendorID:productID:serialNumber:setupPayload:]([HMMTRSystemCommissionerPairingManagerPairingIdentity alloc], "initWithUUID:vendorID:productID:serialNumber:setupPayload:", v24, v28, v30, v26, v32);
        -[HMMTRSystemCommissionerPairingManagerPairingIdentity uuid](v33, "uuid");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMMTRSystemCommissionerPairingManagerPairingIdentity uuid](v17, "uuid");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v34, "isEqual:", v35) & 1) != 0)
        {

        }
        else
        {
          v36 = -[HMMTRSystemCommissionerPairingManagerPairingIdentity isEquivalentTo:](v33, "isEquivalentTo:", v17);

          if (!v36)
            goto LABEL_14;
          context = (void *)MEMORY[0x242656984]();
          v37 = v56;
          HMFGetOSLogHandle();
          v38 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            -[HMMTRSystemCommissionerPairingManagerPairingIdentity uuid](v55, "uuid");
            v39 = objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v63 = v50;
            v64 = 2112;
            v65 = v57;
            v66 = 2112;
            v67 = v39;
            v40 = (void *)v39;
            _os_log_impl(&dword_23E95B000, v38, OS_LOG_TYPE_INFO, "%{public}@Removed stale system commissioner pairing %@ replaced by %@", buf, 0x20u);

          }
          objc_autoreleasePoolPop(context);
          -[HMMTRSystemCommissionerPairingManager storage](v37, "storage");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "removeRecordsForSystemCommissionerFabricNode:", v22);
        }

LABEL_14:
        v17 = v55;
        v20 = v56;
      }
      v54 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v58, v68, 16);
      if (!v54)
      {
LABEL_16:

        v13 = v48;
        v12 = v49;
        v15 = v46;
        v14 = v47;
        v16 = v45;
        goto LABEL_20;
      }
    }
  }
  v41 = (void *)MEMORY[0x242656984]();
  v42 = self;
  HMFGetOSLogHandle();
  v43 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v63 = v44;
    v64 = 2112;
    v65 = v12;
    _os_log_impl(&dword_23E95B000, v43, OS_LOG_TYPE_INFO, "%{public}@A new system commissioner pairing %@ doesn't have sufficient information to identify redundant stale pairings.", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v41);
  v17 = v55;
LABEL_20:

}

- (void)_openCommissioningWindowForSystemCommissionerPairingUUID:(id)a3 duration:(double)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  HMMTRSystemCommissionerPairingManager *v15;
  NSObject *v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  -[HMMTRSystemCommissionerPairingManager storage](self, "storage");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "systemCommissionerFabricNodeIDForUuid:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[HMMTRSystemCommissionerPairingManager browser](self, "browser");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __125__HMMTRSystemCommissionerPairingManager__openCommissioningWindowForSystemCommissionerPairingUUID_duration_completionHandler___block_invoke;
    v18[3] = &unk_250F21270;
    v19 = v9;
    objc_msgSend(v12, "openCommissioningWindowForSystemCommissionerDeviceWithNodeID:duration:completionHandler:", v11, v18, a4);

    v13 = v19;
  }
  else
  {
    v14 = (void *)MEMORY[0x242656984]();
    v15 = self;
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v21 = v17;
      v22 = 2112;
      v23 = v8;
      _os_log_impl(&dword_23E95B000, v16, OS_LOG_TYPE_ERROR, "%{public}@Couldn't find Node on System Commissioner Fabric with UUID = %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v14);
    objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:", 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, _QWORD, void *))v9 + 2))(v9, 0, 0, v13);
  }

}

- (void)_readCommissioningWindowStatusForSystemCommissionerPairingUUID:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, void *);
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  HMMTRSystemCommissionerPairingManager *v12;
  NSObject *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, _QWORD, void *))a4;
  -[HMMTRSystemCommissionerPairingManager storage](self, "storage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "systemCommissionerFabricNodeIDForUuid:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[HMMTRSystemCommissionerPairingManager browser](self, "browser");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "readCommissioningWindowStatusForSystemCommissionerDeviceWithNodeID:completionHandler:", v9, v7);
  }
  else
  {
    v11 = (void *)MEMORY[0x242656984]();
    v12 = self;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543618;
      v16 = v14;
      v17 = 2112;
      v18 = v6;
      _os_log_impl(&dword_23E95B000, v13, OS_LOG_TYPE_ERROR, "%{public}@Couldn't find Node on System Commissioner Fabric with UUID = %@", (uint8_t *)&v15, 0x16u);

    }
    objc_autoreleasePoolPop(v11);
    objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:", 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, 0, v10);
  }

}

- (HMMTRAccessoryServerBrowser)browser
{
  return (HMMTRAccessoryServerBrowser *)objc_loadWeakRetained((id *)&self->_browser);
}

- (HMMTRStorage)storage
{
  return (HMMTRStorage *)objc_loadWeakRetained((id *)&self->_storage);
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_destroyWeak((id *)&self->_storage);
  objc_destroyWeak((id *)&self->_browser);
}

void __125__HMMTRSystemCommissionerPairingManager__openCommissioningWindowForSystemCommissionerPairingUUID_duration_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4;
  id v5;
  id v6;
  void *v7;
  id v8;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = a3;
  v6 = a2;
  objc_msgSend(v6, "qrCodeString:", 0);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "manualEntryCode");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  (*(void (**)(uint64_t, id, void *, id))(v4 + 16))(v4, v8, v7, v5);
}

uint64_t __121__HMMTRSystemCommissionerPairingManager_readCommissioningWindowStatusForSystemCommissionerPairingUUID_completionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_readCommissioningWindowStatusForSystemCommissionerPairingUUID:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __124__HMMTRSystemCommissionerPairingManager_openCommissioningWindowForSystemCommissionerPairingUUID_duration_completionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_openCommissioningWindowForSystemCommissionerPairingUUID:duration:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(double *)(a1 + 56));
}

uint64_t __144__HMMTRSystemCommissionerPairingManager_cleanUpStaleSystemCommissionerPairingsWithNewlyPairedUUID_vendorID_productID_serialNumber_setupPayload___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_cleanUpStaleSystemCommissionerPairingsWithNewlyPairedUUID:vendorID:productID:serialNumber:setupPayload:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72));
}

uint64_t __115__HMMTRSystemCommissionerPairingManager_removeAllDevicePairingsForSystemCommissionerPairingUUID_completionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_removeAllDevicePairingsForSystemCommissionerPairingUUID:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __120__HMMTRSystemCommissionerPairingManager_removeDevicePairingWithUUID_forSystemCommissionerPairingUUID_completionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_removeDevicePairingWithUUID:forSystemCommissionerPairingUUID:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

uint64_t __99__HMMTRSystemCommissionerPairingManager_removeSystemCommissionerPairingWithUUID_completionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_removeSystemCommissionerPairingWithUUID:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __111__HMMTRSystemCommissionerPairingManager_fetchDevicePairingsForSystemCommissionerPairingUUID_completionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchAllDevicePairingsForSystemCommissionerDevicePairingWithUUID:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __94__HMMTRSystemCommissionerPairingManager_fetchSystemCommissionerPairingsWithCompletionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchSystemCommissionerPairingsWithCompletionHandler:", *(_QWORD *)(a1 + 40));
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t15_4900 != -1)
    dispatch_once(&logCategory__hmf_once_t15_4900, &__block_literal_global_4901);
  return (id)logCategory__hmf_once_v16_4902;
}

void __52__HMMTRSystemCommissionerPairingManager_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v16_4902;
  logCategory__hmf_once_v16_4902 = v0;

}

@end
