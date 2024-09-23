@implementation HMIHomeKitClient

- (HMIHomeKitClient)init
{
  return -[HMIHomeKitClient initWithCachePolicy:](self, "initWithCachePolicy:", 2);
}

- (HMIHomeKitClient)initWithNoCaching
{
  return -[HMIHomeKitClient initWithCachePolicy:](self, "initWithCachePolicy:", 0);
}

- (HMIHomeKitClient)initWithCachePolicy:(unint64_t)a3
{
  HMIHomeKitClient *v4;
  HMIHomeKitClient *v5;
  NSOperationQueue *v6;
  NSOperationQueue *homeKitOperationQueue;
  HMHomeManager *homeManager;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)HMIHomeKitClient;
  v4 = -[HMIHomeKitClient init](&v10, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_cachePolicy = a3;
    v6 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x24BDD1710]);
    homeKitOperationQueue = v5->_homeKitOperationQueue;
    v5->_homeKitOperationQueue = v6;

    -[NSOperationQueue setName:](v5->_homeKitOperationQueue, "setName:", CFSTR("HMIHomeKitClient HomeKit Delegate Queue"));
    -[NSOperationQueue setMaxConcurrentOperationCount:](v5->_homeKitOperationQueue, "setMaxConcurrentOperationCount:", 1);
    v5->_setup = 0;
    homeManager = v5->_homeManager;
    v5->_homeManager = 0;

  }
  return v5;
}

- (NSArray)homes
{
  -[HMIHomeKitClient setup](self, "setup");
  return self->_homes;
}

- (id)homePersonManagerForHomeUUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[HMIHomeKitClient homes](self, "homes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hmf_firstObjectWithUUID:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v6, "personManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)homeForHMPersonManagerUUID:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  -[HMIHomeKitClient homes](self, "homes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __47__HMIHomeKitClient_homeForHMPersonManagerUUID___block_invoke;
  v9[3] = &unk_24DBEA228;
  v10 = v4;
  v6 = v4;
  objc_msgSend(v5, "na_firstObjectPassingTest:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

uint64_t __47__HMIHomeKitClient_homeForHMPersonManagerUUID___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "personManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqual:", *(_QWORD *)(a1 + 32));

  return v5;
}

- (id)homePersonManagersForCurrentDevice
{
  void *v3;
  void *v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  HMIHomeKitClient *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  __int128 v21;
  void *v22;
  HMIHomeKitClient *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  void *v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v23 = self;
  -[HMIHomeKitClient homes](self, "homes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
  if (v5)
  {
    v7 = v5;
    v8 = *(_QWORD *)v25;
    *(_QWORD *)&v6 = 138543618;
    v21 = v6;
    v22 = v3;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v25 != v8)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        objc_msgSend(v10, "residentDevices", v21);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "na_any:", &__block_literal_global_4);

        if (v12)
        {
          objc_msgSend(v10, "personManager");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (v13)
          {
            objc_msgSend(v3, "addObject:", v13);
          }
          else
          {
            v14 = v4;
            v15 = (void *)MEMORY[0x220735570]();
            v16 = v23;
            HMFGetOSLogHandle();
            v17 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v10, "uuid");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = v21;
              v29 = v18;
              v30 = 2112;
              v31 = v19;
              _os_log_impl(&dword_219D45000, v17, OS_LOG_TYPE_INFO, "%{public}@personManager is nil for homeUUID: %@", buf, 0x16u);

              v3 = v22;
            }

            objc_autoreleasePoolPop(v15);
            v4 = v14;
          }

        }
      }
      v7 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
    }
    while (v7);
  }

  return v3;
}

uint64_t __54__HMIHomeKitClient_homePersonManagersForCurrentDevice__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isCurrentDevice");
}

- (id)photosPersonManagerForHomeUUID:(id)a3 sourceUUID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a4;
  v7 = a3;
  -[HMIHomeKitClient homes](self, "homes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "hmf_firstObjectWithUUID:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v9, "photosPersonManagerWithUUID:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)isCurrentDevicePrimaryResident
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t j;
  void *v13;
  BOOL v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  -[HMIHomeKitClient homes](self, "homes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v21 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * i), "residentDevices");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = 0u;
        v17 = 0u;
        v18 = 0u;
        v19 = 0u;
        v8 = v7;
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
        if (v9)
        {
          v10 = v9;
          v11 = *(_QWORD *)v17;
          while (2)
          {
            for (j = 0; j != v10; ++j)
            {
              if (*(_QWORD *)v17 != v11)
                objc_enumerationMutation(v8);
              v13 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * j);
              if (objc_msgSend(v13, "isCurrentDevice") && (objc_msgSend(v13, "status") & 2) != 0)
              {

                v14 = 1;
                goto LABEL_20;
              }
            }
            v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
            if (v10)
              continue;
            break;
          }
        }

      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
      v14 = 0;
    }
    while (v4);
  }
  else
  {
    v14 = 0;
  }
LABEL_20:

  return v14;
}

- (id)cameraProfileWithUUID:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  _QWORD v22[4];
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  -[HMIHomeKitClient homes](self, "homes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
  if (v19)
  {
    v6 = *(_QWORD *)v29;
    v7 = MEMORY[0x24BDAC760];
    v21 = v5;
    v18 = *(_QWORD *)v29;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v29 != v6)
          objc_enumerationMutation(v5);
        v20 = v8;
        v9 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * v8);
        v24 = 0u;
        v25 = 0u;
        v26 = 0u;
        v27 = 0u;
        objc_msgSend(v9, "accessories");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v25;
          while (2)
          {
            for (i = 0; i != v12; ++i)
            {
              if (*(_QWORD *)v25 != v13)
                objc_enumerationMutation(v10);
              objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * i), "cameraProfiles");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              v22[0] = v7;
              v22[1] = 3221225472;
              v22[2] = __42__HMIHomeKitClient_cameraProfileWithUUID___block_invoke;
              v22[3] = &unk_24DBEA290;
              v23 = v4;
              objc_msgSend(v15, "na_firstObjectPassingTest:", v22);
              v16 = (void *)objc_claimAutoreleasedReturnValue();

              if (v16)
              {

                v5 = v21;
                goto LABEL_19;
              }
            }
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
            if (v12)
              continue;
            break;
          }
        }

        v8 = v20 + 1;
        v5 = v21;
        v6 = v18;
      }
      while (v20 + 1 != v19);
      v16 = 0;
      v19 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    }
    while (v19);
  }
  else
  {
    v16 = 0;
  }
LABEL_19:

  return v16;
}

uint64_t __42__HMIHomeKitClient_cameraProfileWithUUID___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (id)homeWithCameraProfileUUID:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  id v17;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  _QWORD v24[4];
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  -[HMIHomeKitClient homes](self, "homes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
  if (v20)
  {
    v6 = *(_QWORD *)v31;
    v7 = MEMORY[0x24BDAC760];
    v23 = v5;
    v19 = *(_QWORD *)v31;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v31 != v6)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * v8);
        v26 = 0u;
        v27 = 0u;
        v28 = 0u;
        v29 = 0u;
        v21 = v8;
        v22 = v9;
        objc_msgSend(v9, "accessories", v19);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v27;
          while (2)
          {
            for (i = 0; i != v12; ++i)
            {
              if (*(_QWORD *)v27 != v13)
                objc_enumerationMutation(v10);
              objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * i), "cameraProfiles");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              v24[0] = v7;
              v24[1] = 3221225472;
              v24[2] = __46__HMIHomeKitClient_homeWithCameraProfileUUID___block_invoke;
              v24[3] = &unk_24DBEA290;
              v25 = v4;
              objc_msgSend(v15, "na_firstObjectPassingTest:", v24);
              v16 = (void *)objc_claimAutoreleasedReturnValue();

              if (v16)
              {
                v17 = v22;

                v5 = v23;
                goto LABEL_19;
              }

            }
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
            if (v12)
              continue;
            break;
          }
        }

        v8 = v21 + 1;
        v5 = v23;
        v6 = v19;
      }
      while (v21 + 1 != v20);
      v17 = 0;
      v20 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    }
    while (v20);
  }
  else
  {
    v17 = 0;
  }
LABEL_19:

  return v17;
}

uint64_t __46__HMIHomeKitClient_homeWithCameraProfileUUID___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (void)setup
{
  HMIHomeKitClient *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  id v14;
  dispatch_time_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSArray *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  HMIHomeKitClient *v25;
  NSObject *v26;
  uint64_t v27;
  void *v28;
  HMIHomeKitClient *v29;
  void *v30;
  const char *v31;
  void *v32;
  NSArray *homes;
  void *v34;
  HMIHomeKitClient *v35;
  NSObject *v36;
  void *v37;
  void *v38;
  NSObject *v39;
  void *v40;
  void *v41;
  NSArray *obj;
  uint64_t v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _QWORD v48[4];
  NSObject *v49;
  _QWORD v50[4];
  NSObject *v51;
  uint8_t buf[4];
  void *v53;
  __int16 v54;
  void *v55;
  __int16 v56;
  const char *v57;
  __int16 v58;
  void *v59;
  _BYTE v60[128];
  uint64_t v61;

  v2 = self;
  v61 = *MEMORY[0x24BDAC8D0];
  if (!-[HMIHomeKitClient isSetup](self, "isSetup"))
  {
    objc_msgSend(MEMORY[0x24BDD7838], "defaultPrivateConfiguration");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setOptions:", 1);
    objc_msgSend(v3, "setCachePolicy:", -[HMIHomeKitClient cachePolicy](v2, "cachePolicy"));
    objc_msgSend(v3, "setDiscretionary:", 1);
    -[HMIHomeKitClient homeKitOperationQueue](v2, "homeKitOperationQueue");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setDelegateQueue:", v4);

    v5 = dispatch_group_create();
    dispatch_group_enter(v5);
    v6 = (void *)objc_opt_new();
    v7 = MEMORY[0x24BDAC760];
    v50[0] = MEMORY[0x24BDAC760];
    v50[1] = 3221225472;
    v50[2] = __25__HMIHomeKitClient_setup__block_invoke;
    v50[3] = &unk_24DBEA2B8;
    v8 = v5;
    v51 = v8;
    objc_msgSend(v6, "setDidUpdateHomes:", v50);
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD76D8]), "initWithHomeMangerConfiguration:", v3);
    -[HMIHomeKitClient setHomeManager:](v2, "setHomeManager:", v9);

    -[HMIHomeKitClient homeManager](v2, "homeManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setDelegate:", v6);

    dispatch_group_enter(v8);
    -[HMIHomeKitClient homeManager](v2, "homeManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceNow:", 1.0e10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v48[0] = v7;
    v48[1] = 3221225472;
    v48[2] = __25__HMIHomeKitClient_setup__block_invoke_2;
    v48[3] = &unk_24DBE9E78;
    v13 = v8;
    v49 = v13;
    v14 = (id)objc_msgSend(v11, "_refreshBeforeDate:completionHandler:", v12, v48);

    v15 = dispatch_time(0, 10000000000);
    dispatch_group_wait(v13, v15);
    -[HMIHomeKitClient homeManager](v2, "homeManager");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "homes");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      objc_storeStrong((id *)&v2->_homes, v17);
      v46 = 0u;
      v47 = 0u;
      v44 = 0u;
      v45 = 0u;
      obj = v17;
      v18 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v44, v60, 16);
      if (v18)
      {
        v19 = v18;
        v38 = v17;
        v39 = v13;
        v40 = v6;
        v41 = v3;
        v20 = *(_QWORD *)v45;
        v21 = obj;
        do
        {
          v22 = 0;
          v43 = v19;
          do
          {
            if (*(_QWORD *)v45 != v20)
              objc_enumerationMutation(v21);
            v23 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * v22);
            v24 = (void *)MEMORY[0x220735570]();
            v25 = v2;
            HMFGetOSLogHandle();
            v26 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
            {
              HMFGetLogIdentifier();
              v27 = v20;
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v23, "name");
              v29 = v2;
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v23, "isPrimary"))
                v31 = "Yes";
              else
                v31 = "No";
              objc_msgSend(v23, "uuid", v38, v39, v40, v41);
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138544130;
              v53 = v28;
              v54 = 2112;
              v55 = v30;
              v56 = 2080;
              v57 = v31;
              v21 = obj;
              v58 = 2112;
              v59 = v32;
              _os_log_impl(&dword_219D45000, v26, OS_LOG_TYPE_DEBUG, "%{public}@Found home: name: %@, primary: %s, UUID: %@", buf, 0x2Au);

              v2 = v29;
              v20 = v27;
              v19 = v43;
            }

            objc_autoreleasePoolPop(v24);
            ++v22;
          }
          while (v19 != v22);
          v19 = -[NSArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v44, v60, 16);
        }
        while (v19);
        v6 = v40;
        v3 = v41;
        homes = v21;
        v17 = v38;
        v13 = v39;
      }
      else
      {
        homes = obj;
      }
    }
    else
    {
      v34 = (void *)MEMORY[0x220735570]();
      v35 = v2;
      HMFGetOSLogHandle();
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v53 = v37;
        _os_log_impl(&dword_219D45000, v36, OS_LOG_TYPE_ERROR, "%{public}@No homes were located", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v34);
      homes = v35->_homes;
      v35->_homes = (NSArray *)MEMORY[0x24BDBD1A8];
    }

    v2->_setup = 1;
  }
}

void __25__HMIHomeKitClient_setup__block_invoke(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __25__HMIHomeKitClient_setup__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (v3)
  {
    v4 = (void *)MEMORY[0x220735570]();
    HMFGetOSLogHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 138543618;
      v8 = v6;
      v9 = 2112;
      v10 = v3;
      _os_log_impl(&dword_219D45000, v5, OS_LOG_TYPE_ERROR, "%{public}@Error refreshing home data: %@", (uint8_t *)&v7, 0x16u);

    }
    objc_autoreleasePoolPop(v4);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

- (NSOperationQueue)homeKitOperationQueue
{
  return (NSOperationQueue *)objc_getProperty(self, a2, 24, 1);
}

- (BOOL)isSetup
{
  return self->_setup;
}

- (unint64_t)cachePolicy
{
  return self->_cachePolicy;
}

- (HMHomeManager)homeManager
{
  return (HMHomeManager *)objc_getProperty(self, a2, 40, 1);
}

- (void)setHomeManager:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homeManager, 0);
  objc_storeStrong((id *)&self->_homeKitOperationQueue, 0);
  objc_storeStrong((id *)&self->_homes, 0);
}

@end
