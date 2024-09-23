@implementation HMMTRControllerFactory

- (void)_setEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  HMMTRControllerFactory *v6;
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
  void *v17;
  uint64_t v18;

  v3 = a3;
  v18 = *MEMORY[0x24BDAC8D0];
  v5 = (void *)MEMORY[0x242656984](self, a2);
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    HMFBooleanToString();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    HMFBooleanToString();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138543874;
    v13 = v8;
    v14 = 2112;
    v15 = v9;
    v16 = 2112;
    v17 = v10;
    _os_log_impl(&dword_23E95B000, v7, OS_LOG_TYPE_INFO, "%{public}@enabled: %@ -> %@", (uint8_t *)&v12, 0x20u);

  }
  objc_autoreleasePoolPop(v5);
  if (v6->_enabled != v3)
  {
    v6->_enabled = v3;
    -[HMMTRControllerFactory _revokeAvailable:](v6, "_revokeAvailable:", v3);
    if (!v3)
    {
      if (-[HMMTRControllerFactory usesCommonStorage](v6, "usesCommonStorage"))
      {
        -[HMMTRControllerFactory sharedDeviceControllerFactory](v6, "sharedDeviceControllerFactory");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "stopControllerFactory");
        -[HMMTRControllerFactory setMatterFactoryRunning:](v6, "setMatterFactoryRunning:", 0);

      }
    }
  }
}

- (BOOL)enabled
{
  HMMTRControllerFactory *v2;
  NSObject *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v2 = self;
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  -[HMMTRControllerFactory workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __33__HMMTRControllerFactory_enabled__block_invoke;
  v5[3] = &unk_250F235A8;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

- (HMMTRControllerFactory)initWithWorkQueue:(id)a3 factoryParams:(id)a4
{
  id v7;
  id v8;
  HMMTRControllerFactory *v9;
  HMMTRControllerFactory *v10;
  HMMTRControllerFactoryStorage *v11;
  HMMTRControllerFactoryStorage *storage;
  uint64_t v13;
  MTRDeviceControllerFactoryParams *factoryParams;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  uint64_t v20;
  NSMutableArray *controllerWrappers;
  uint64_t v22;
  NSMutableSet *disablingTokens;
  objc_super v25;

  v7 = a3;
  v8 = a4;
  v25.receiver = self;
  v25.super_class = (Class)HMMTRControllerFactory;
  v9 = -[HMMTRControllerFactory init](&v25, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_workQueue, a3);
    if (v8)
    {
      v11 = objc_alloc_init(HMMTRControllerFactoryStorage);
      storage = v10->_storage;
      v10->_storage = v11;

      v13 = objc_msgSend(objc_alloc(MEMORY[0x24BDDB698]), "initWithStorage:", v10->_storage);
      factoryParams = v10->_factoryParams;
      v10->_factoryParams = (MTRDeviceControllerFactoryParams *)v13;

      objc_msgSend(v8, "otaProviderDelegate");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[MTRDeviceControllerFactoryParams setOtaProviderDelegate:](v10->_factoryParams, "setOtaProviderDelegate:", v15);

      objc_msgSend(v8, "productAttestationAuthorityCertificates");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[MTRDeviceControllerFactoryParams setProductAttestationAuthorityCertificates:](v10->_factoryParams, "setProductAttestationAuthorityCertificates:", v16);

      objc_msgSend(v8, "certificationDeclarationCertificates");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[MTRDeviceControllerFactoryParams setCertificationDeclarationCertificates:](v10->_factoryParams, "setCertificationDeclarationCertificates:", v17);

      objc_msgSend(v8, "port");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[MTRDeviceControllerFactoryParams setPort:](v10->_factoryParams, "setPort:", v18);

      -[MTRDeviceControllerFactoryParams setShouldStartServer:](v10->_factoryParams, "setShouldStartServer:", objc_msgSend(v8, "shouldStartServer"));
      v19 = 1;
    }
    else
    {
      v19 = 0;
    }
    v10->_usesCommonStorage = v19;
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v20 = objc_claimAutoreleasedReturnValue();
    controllerWrappers = v10->_controllerWrappers;
    v10->_controllerWrappers = (NSMutableArray *)v20;

    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v22 = objc_claimAutoreleasedReturnValue();
    disablingTokens = v10->_disablingTokens;
    v10->_disablingTokens = (NSMutableSet *)v22;

    v10->_enabled = 1;
  }

  return v10;
}

- (id)wrapperWithName:(id)a3 startupParams:(id)a4
{
  id v6;
  id v7;
  HMMTRControllerWrapper *v8;
  void *v9;
  HMMTRControllerWrapper *v10;
  NSObject *v11;
  HMMTRControllerWrapper *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  HMMTRControllerFactory *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  HMMTRControllerWrapper *v23;
  HMMTRControllerWrapper *v24;
  uint64_t v26;
  uint64_t v27;
  void (*v28)(uint64_t);
  void *v29;
  HMMTRControllerFactory *v30;
  HMMTRControllerWrapper *v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  HMMTRControllerWrapper *v35;
  __int16 v36;
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = [HMMTRControllerWrapper alloc];
  -[HMMTRControllerFactory workQueue](self, "workQueue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[HMMTRControllerWrapper initWithWorkQueue:factory:startupParams:name:](v8, "initWithWorkQueue:factory:startupParams:name:", v9, self, v7, v6);

  -[HMMTRControllerFactory workQueue](self, "workQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  v26 = MEMORY[0x24BDAC760];
  v27 = 3221225472;
  v28 = __56__HMMTRControllerFactory_wrapperWithName_startupParams___block_invoke;
  v29 = &unk_250F22458;
  v30 = self;
  v12 = v10;
  v31 = v12;
  dispatch_sync(v11, &v26);

  v18 = (void *)MEMORY[0x242656984](v13, v14, v15, v16, v17);
  v19 = self;
  HMFGetOSLogHandle();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "fabricID", v26, v27, v28, v29, v30);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v33 = v21;
    v34 = 2112;
    v35 = v12;
    v36 = 2112;
    v37 = v22;
    _os_log_impl(&dword_23E95B000, v20, OS_LOG_TYPE_INFO, "%{public}@New controller wrapper %@ for fabric ID %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v18);
  v23 = v31;
  v24 = v12;

  return v24;
}

- (id)stackStorageWithStartupParams:(id)a3 operationalKeyPairTLV:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMMTRControllerFactory *v9;
  NSObject *v10;
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
  void *v23;
  uint64_t v25;
  uint64_t v26;
  char v27;
  _BYTE buf[12];
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
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
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = v11;
    v29 = 2112;
    v30 = v6;
    _os_log_impl(&dword_23E95B000, v10, OS_LOG_TYPE_INFO, "%{public}@Dumping stack storage for params: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v8);
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "ipk");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v13, CFSTR("IPK"));

  v14 = (void *)MEMORY[0x24BDDB5B0];
  objc_msgSend(v6, "rootCertificate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "convertX509Certificate:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v16, CFSTR("f/1/r"));

  v17 = (void *)MEMORY[0x24BDDB5B0];
  objc_msgSend(v6, "operationalCertificate");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "convertX509Certificate:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v19, CFSTR("f/1/n"));

  v26 = 0x12C1384002515;
  v27 = 24;
  objc_msgSend(v6, "vendorID");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  LOWORD(v18) = objc_msgSend(v20, "unsignedShortValue");

  *(_WORD *)((char *)&v26 + 3) = (_WORD)v18;
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", &v26, 9);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v21, CFSTR("f/1/m"));

  objc_msgSend(v12, "setObject:forKeyedSubscript:", v7, CFSTR("f/1/o"));
  *(_QWORD *)buf = 0x104013602002415;
  *(_WORD *)&buf[8] = 6168;
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", buf, 10);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v22, CFSTR("g/fidx"));

  v25 = 0x1829625600002615;
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", &v25, 8);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v23, CFSTR("g/lkgt"));

  return v12;
}

- (id)disableNormalOperation
{
  void *v3;
  void *v4;
  HMMTRControllerFactory *v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v13[5];
  id v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x242656984]();
  v5 = self;
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v16 = v7;
    v17 = 2112;
    v18 = v3;
    _os_log_impl(&dword_23E95B000, v6, OS_LOG_TYPE_INFO, "%{public}@Disabling normal operation with token %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v4);
  -[HMMTRControllerFactory workQueue](v5, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __48__HMMTRControllerFactory_disableNormalOperation__block_invoke;
  v13[3] = &unk_250F22458;
  v13[4] = v5;
  v9 = v3;
  v14 = v9;
  dispatch_async(v8, v13);

  v10 = v14;
  v11 = v9;

  return v11;
}

- (void)enableNormalOperationWithToken:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  HMMTRControllerFactory *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  id v12;
  _QWORD v13[5];
  id v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  v7 = (void *)MEMORY[0x242656984]();
  v8 = self;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v16 = v10;
    v17 = 2112;
    v18 = v6;
    _os_log_impl(&dword_23E95B000, v9, OS_LOG_TYPE_INFO, "%{public}@Enabling normal operation with token %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v7);
  -[HMMTRControllerFactory workQueue](v8, "workQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __57__HMMTRControllerFactory_enableNormalOperationWithToken___block_invoke;
  v13[3] = &unk_250F22458;
  v13[4] = v8;
  v14 = v6;
  v12 = v6;
  dispatch_async(v11, v13);

}

- (id)sharedDeviceControllerFactory
{
  return (id)objc_msgSend(MEMORY[0x24BDDB690], "sharedInstance");
}

- (void)_restartMatterControllerFactory
{
  void *v3;
  HMMTRControllerFactory *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  id v11;
  void *v12;
  HMMTRControllerFactory *v13;
  NSObject *v14;
  void *v15;
  id v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  if (-[HMMTRControllerFactory usesCommonStorage](self, "usesCommonStorage"))
  {
    v3 = (void *)MEMORY[0x242656984]();
    v4 = self;
    HMFGetOSLogHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v18 = v6;
      _os_log_impl(&dword_23E95B000, v5, OS_LOG_TYPE_INFO, "%{public}@Restarting controller factory", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v3);
    -[HMMTRControllerFactory sharedDeviceControllerFactory](v4, "sharedDeviceControllerFactory");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stopControllerFactory");
    -[HMMTRControllerFactory storage](v4, "storage");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "clear");

    -[HMMTRControllerFactory factoryParams](v4, "factoryParams");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0;
    v10 = objc_msgSend(v7, "startControllerFactory:error:", v9, &v16);
    v11 = v16;

    if ((v10 & 1) != 0)
    {
      -[HMMTRControllerFactory setMatterFactoryRunning:](v4, "setMatterFactoryRunning:", 1);
    }
    else
    {
      v12 = (void *)MEMORY[0x242656984]();
      v13 = v4;
      HMFGetOSLogHandle();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v18 = v15;
        v19 = 2112;
        v20 = v11;
        _os_log_impl(&dword_23E95B000, v14, OS_LOG_TYPE_ERROR, "%{public}@Failed to start: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v12);
    }

  }
}

- (id)_createControllerForGetter:(id)a3
{
  id v4;
  void *v5;
  HMMTRControllerFactory *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  HMMTRControllerFactory *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  int v23;
  void *v24;
  __int16 v25;
  id v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x242656984]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    HMFBooleanToString();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 138543874;
    v24 = v8;
    v25 = 2112;
    v26 = v4;
    v27 = 2112;
    v28 = v9;
    _os_log_impl(&dword_23E95B000, v7, OS_LOG_TYPE_INFO, "%{public}@Creating controller for %@ in enabled state: %@", (uint8_t *)&v23, 0x20u);

  }
  objc_autoreleasePoolPop(v5);
  if (v6->_enabled)
  {
    if (!-[HMMTRControllerFactory matterFactoryRunning](v6, "matterFactoryRunning"))
      -[HMMTRControllerFactory _restartMatterControllerFactory](v6, "_restartMatterControllerFactory");
    objc_msgSend(v4, "startupParams");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMMTRControllerFactory _createControllerWithStartupParams:](v6, "_createControllerWithStartupParams:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setCachedDeviceController:", v11);

    v12 = (void *)MEMORY[0x242656984]();
    v13 = v6;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "name");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "cachedDeviceController");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "controllerNodeID");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "startupParams");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "fabricID");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 138544130;
      v24 = v15;
      v25 = 2112;
      v26 = v16;
      v27 = 2112;
      v28 = v18;
      v29 = 2112;
      v30 = v20;
      _os_log_impl(&dword_23E95B000, v14, OS_LOG_TYPE_INFO, "%{public}@Started Matter controller '%@' with Node ID %@ on fabric ID %@", (uint8_t *)&v23, 0x2Au);

    }
    objc_autoreleasePoolPop(v12);
    objc_msgSend(v4, "cachedDeviceController");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v21 = 0;
  }

  return v21;
}

- (void)_removeGetter:(id)a3
{
  id v4;
  void *v5;
  HMMTRControllerFactory *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  int v12;
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x242656984]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138543618;
    v13 = v8;
    v14 = 2112;
    v15 = v4;
    _os_log_impl(&dword_23E95B000, v7, OS_LOG_TYPE_INFO, "%{public}@Removing controller wrapper: %@", (uint8_t *)&v12, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  -[HMMTRControllerFactory controllerWrappers](v6, "controllerWrappers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "removeObject:", v4);

  -[HMMTRControllerFactory controllerWrappers](v6, "controllerWrappers");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");

  if (!v11)
    -[HMMTRControllerFactory _restartMatterControllerFactory](v6, "_restartMatterControllerFactory");

}

- (id)_createControllerWithStartupParams:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  if (objc_msgSend(v4, "usesCommonStorageDelegate"))
    -[HMMTRControllerFactory _createControllerUsingCommonStorageWithStartupParams:](self, "_createControllerUsingCommonStorageWithStartupParams:", v4);
  else
    -[HMMTRControllerFactory _createControllerUsingOwnStorageWithStartupParams:](self, "_createControllerUsingOwnStorageWithStartupParams:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_createControllerUsingCommonStorageWithStartupParams:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  HMMTRControllerFactory *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  HMMTRControllerFactory *v17;
  NSObject *v18;
  void *v19;
  id v21;
  id v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "controllerParams");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x242656984]();
  v7 = self;
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "fabricID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v24 = v9;
    v25 = 2112;
    v26 = v10;
    _os_log_impl(&dword_23E95B000, v8, OS_LOG_TYPE_INFO, "%{public}@Creating controller that uses common storage for fabric ID: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v6);
  -[HMMTRControllerFactory sharedDeviceControllerFactory](v7, "sharedDeviceControllerFactory");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0;
  objc_msgSend(v11, "createControllerOnExistingFabric:error:", v5, &v22);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v22;
  v14 = v13;
  if (v12)
  {
    v15 = v13;
  }
  else
  {
    v21 = v13;
    objc_msgSend(v11, "createControllerOnNewFabric:error:", v5, &v21);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v21;

    if (!v12)
    {
      v16 = (void *)MEMORY[0x242656984]();
      v17 = v7;
      HMFGetOSLogHandle();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v24 = v19;
        v25 = 2112;
        v26 = v15;
        _os_log_impl(&dword_23E95B000, v18, OS_LOG_TYPE_ERROR, "%{public}@Failed to create controller: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v16);
      v12 = 0;
    }
  }

  return v12;
}

- (id)_createControllerUsingOwnStorageWithStartupParams:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  HMMTRControllerFactory *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  HMMTRControllerFactory *v14;
  NSObject *v15;
  void *v16;
  id v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "controllerParams2");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x242656984]();
  v7 = self;
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "fabricID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v20 = v9;
    v21 = 2112;
    v22 = v10;
    _os_log_impl(&dword_23E95B000, v8, OS_LOG_TYPE_INFO, "%{public}@Creating controller that uses own storage for fabric ID: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v6);
  v18 = 0;
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDDB680]), "initWithParameters:error:", v5, &v18);
  v12 = v18;
  if (!v11)
  {
    v13 = (void *)MEMORY[0x242656984]();
    v14 = v7;
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v20 = v16;
      v21 = 2112;
      v22 = v12;
      _os_log_impl(&dword_23E95B000, v15, OS_LOG_TYPE_ERROR, "%{public}@Failed to create controller: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v13);
  }

  return v11;
}

- (void)_revokeAvailable:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v3 = a3;
  v16 = *MEMORY[0x24BDAC8D0];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[HMMTRControllerFactory controllerWrappers](self, "controllerWrappers", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        objc_msgSend(v9, "cachedDeviceController");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "shutdown");

        objc_msgSend(v9, "setCachedDeviceController:", 0);
        objc_msgSend(v9, "_revokeAvailable:", v3);
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

}

- (BOOL)usesCommonStorage
{
  return self->_usesCommonStorage;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (MTRDeviceControllerFactoryParams)factoryParams
{
  return self->_factoryParams;
}

- (HMMTRControllerFactoryStorage)storage
{
  return self->_storage;
}

- (BOOL)matterFactoryRunning
{
  return self->_matterFactoryRunning;
}

- (void)setMatterFactoryRunning:(BOOL)a3
{
  self->_matterFactoryRunning = a3;
}

- (NSMutableArray)controllerWrappers
{
  return self->_controllerWrappers;
}

- (BOOL)factoryOperationEnabled
{
  return self->_factoryOperationEnabled;
}

- (void)setFactoryOperationEnabled:(BOOL)a3
{
  self->_factoryOperationEnabled = a3;
}

- (NSMutableSet)disablingTokens
{
  return self->_disablingTokens;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_disablingTokens, 0);
  objc_storeStrong((id *)&self->_controllerWrappers, 0);
  objc_storeStrong((id *)&self->_storage, 0);
  objc_storeStrong((id *)&self->_factoryParams, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
}

void __57__HMMTRControllerFactory_enableNormalOperationWithToken___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  int v11;
  void *v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "disablingTokens");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObject:", *(_QWORD *)(a1 + 40));

  objc_msgSend(*(id *)(a1 + 32), "disablingTokens");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (!v4)
    v5 = objc_msgSend(*(id *)(a1 + 32), "_setEnabled:", 1);
  v6 = (void *)MEMORY[0x242656984](v5);
  v7 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(a1 + 40);
    v11 = 138543618;
    v12 = v9;
    v13 = 2112;
    v14 = v10;
    _os_log_impl(&dword_23E95B000, v8, OS_LOG_TYPE_INFO, "%{public}@Voted normal operation with token %@", (uint8_t *)&v11, 0x16u);

  }
  objc_autoreleasePoolPop(v6);
}

void __48__HMMTRControllerFactory_disableNormalOperation__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  int v8;
  void *v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "disablingTokens");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", *(_QWORD *)(a1 + 40));

  v3 = (void *)MEMORY[0x242656984](objc_msgSend(*(id *)(a1 + 32), "_setEnabled:", 0));
  v4 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1 + 40);
    v8 = 138543618;
    v9 = v6;
    v10 = 2112;
    v11 = v7;
    _os_log_impl(&dword_23E95B000, v5, OS_LOG_TYPE_INFO, "%{public}@Disabled normal operation with token %@", (uint8_t *)&v8, 0x16u);

  }
  objc_autoreleasePoolPop(v3);
}

void __56__HMMTRControllerFactory_wrapperWithName_startupParams___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "controllerWrappers");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", *(_QWORD *)(a1 + 40));

}

uint64_t __33__HMMTRControllerFactory_enabled__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 8);
  return result;
}

+ (id)factoryParamsWithCommonStorage
{
  id v2;
  HMMTRControllerFactoryStorage *v3;
  void *v4;

  v2 = objc_alloc(MEMORY[0x24BDDB698]);
  v3 = objc_alloc_init(HMMTRControllerFactoryStorage);
  v4 = (void *)objc_msgSend(v2, "initWithStorage:", v3);

  return v4;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t28 != -1)
    dispatch_once(&logCategory__hmf_once_t28, &__block_literal_global_168);
  return (id)logCategory__hmf_once_v29;
}

void __37__HMMTRControllerFactory_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v29;
  logCategory__hmf_once_v29 = v0;

}

@end
