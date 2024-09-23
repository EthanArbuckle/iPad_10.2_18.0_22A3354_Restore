@implementation HMDCHIPXPCClientConnection

- (HMDCHIPXPCClientConnection)initWithRemoteObjectProxy:(id)a3 homeManager:(id)a4 pid:(int)a5 workQueue:(id)a6
{
  id v11;
  id v12;
  id v13;
  HMDCHIPXPCClientConnection *v14;
  HMDCHIPXPCClientConnection *v15;
  NSMutableSet *v16;
  NSMutableSet *subscribedHomeUUIDs;
  objc_super v19;

  v11 = a3;
  v12 = a4;
  v13 = a6;
  v19.receiver = self;
  v19.super_class = (Class)HMDCHIPXPCClientConnection;
  v14 = -[HMDCHIPXPCClientConnection init](&v19, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_remoteObjectProxy, a3);
    objc_storeWeak((id *)&v15->_homeManager, v12);
    v15->_pid = a5;
    objc_storeStrong((id *)&v15->_workQueue, a6);
    v16 = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
    subscribedHomeUUIDs = v15->_subscribedHomeUUIDs;
    v15->_subscribedHomeUUIDs = v16;

  }
  return v15;
}

- (void)deregisterReportHandlers
{
  HMDCHIPXPCClientConnection *v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  HMDCHIPXPCClientConnection *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  HMDCHIPXPCClientConnection *v22;
  id obj;
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

  v2 = self;
  v33 = *MEMORY[0x24BDAC8D0];
  -[HMDCHIPXPCClientConnection workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  -[HMDCHIPXPCClientConnection subscribedHomeUUIDs](v2, "subscribedHomeUUIDs");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v25;
    v7 = 0x24BDD1000uLL;
    v22 = v2;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v25 != v6)
          objc_enumerationMutation(obj);
        v9 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i);
        -[HMDCHIPXPCClientConnection homeManager](v2, "homeManager");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "_homeWithUUID:", v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11)
        {
          v12 = (void *)MEMORY[0x227676638]();
          v13 = v2;
          HMFGetOSLogHandle();
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v15 = v5;
            v16 = v6;
            v17 = v7;
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "shortDescription");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v29 = v18;
            v30 = 2112;
            v31 = v19;
            _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_INFO, "%{public}@Deregistering report handlers from home: %@", buf, 0x16u);

            v7 = v17;
            v6 = v16;
            v5 = v15;
            v2 = v22;
          }

          objc_autoreleasePoolPop(v12);
          objc_msgSend(*(id *)(v7 + 1760), "numberWithInt:", -[HMDCHIPXPCClientConnection pid](v13, "pid"));
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "setCHIPReportHandlerWithSubscriber:handler:", v20, 0);

        }
      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
    }
    while (v5);
  }

  -[HMDCHIPXPCClientConnection subscribedHomeUUIDs](v2, "subscribedHomeUUIDs");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "removeAllObjects");

}

- (void)_registerReportHandlerWithHomeWithUUID:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  HMDCHIPXPCClientConnection *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  HMDCHIPXPCClientConnection *v17;
  NSObject *v18;
  void *v19;
  _QWORD v20[5];
  id v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDCHIPXPCClientConnection workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[HMDCHIPXPCClientConnection homeManager](self, "homeManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_homeWithUUID:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[HMDCHIPXPCClientConnection subscribedHomeUUIDs](self, "subscribedHomeUUIDs");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "containsObject:", v4);

    if ((v9 & 1) == 0)
    {
      v10 = (void *)MEMORY[0x227676638]();
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
        _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_INFO, "%{public}@Registering report handler with home with UUID: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v10);
      -[HMDCHIPXPCClientConnection subscribedHomeUUIDs](v11, "subscribedHomeUUIDs");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "addObject:", v4);

      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", -[HMDCHIPXPCClientConnection pid](v11, "pid"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v20[0] = MEMORY[0x24BDAC760];
      v20[1] = 3221225472;
      v20[2] = __69__HMDCHIPXPCClientConnection__registerReportHandlerWithHomeWithUUID___block_invoke;
      v20[3] = &unk_24E790948;
      v20[4] = v11;
      v21 = v4;
      objc_msgSend(v7, "setCHIPReportHandlerWithSubscriber:handler:", v15, v20);

    }
  }
  else
  {
    v16 = (void *)MEMORY[0x227676638]();
    v17 = self;
    HMFGetOSLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v23 = v19;
      v24 = 2112;
      v25 = v4;
      _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_ERROR, "%{public}@Could not register report handler using unknown home UUID: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v16);
  }

}

- (void)_getDeviceControllerWithFabricId:(unint64_t)a3 accessories:(id)a4 home:(id)a5 remainingHomes:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  HMDCHIPXPCClientConnection *v28;
  NSObject *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  void (*v33)(uint64_t, void *, void *);
  void *v34;
  HMDCHIPXPCClientConnection *v35;
  id v36;
  id v37;
  id v38;
  id v39;
  unint64_t v40;
  uint8_t buf[4];
  void *v42;
  __int16 v43;
  unint64_t v44;
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  while (1)
  {
    while (objc_msgSend(v12, "count"))
    {
      objc_msgSend(v12, "lastObject");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "removeLastObject");
      if (objc_msgSend(v16, "supportsCHIP"))
      {
        v22 = objc_alloc(MEMORY[0x24BE3F1B8]);
        objc_msgSend(v16, "uuid");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = (void *)objc_msgSend(v22, "initWithTarget:", v23);

        objc_msgSend(MEMORY[0x24BE3F1D0], "messageWithName:destination:payload:", *MEMORY[0x24BDD4BF0], v24, 0);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = MEMORY[0x24BDAC760];
        v32 = 3221225472;
        v33 = __106__HMDCHIPXPCClientConnection__getDeviceControllerWithFabricId_accessories_home_remainingHomes_completion___block_invoke;
        v34 = &unk_24E790970;
        v40 = a3;
        v35 = self;
        v36 = v13;
        v39 = v15;
        v20 = v12;
        v37 = v20;
        v38 = v14;
        v26 = v13;
        objc_msgSend(v25, "setResponseHandler:", &v31);
        objc_msgSend(v16, "handleFetchCHIPPairingsMessage:", v25, v31, v32, v33, v34, v35);

        goto LABEL_9;
      }

    }
    if (!objc_msgSend(v14, "count"))
      break;
    objc_msgSend(v14, "lastObject");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = (void *)MEMORY[0x24BDBCEB8];
    objc_msgSend(v17, "hapAccessories");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "arrayWithArray:", v19);
    v20 = (id)objc_claimAutoreleasedReturnValue();

    v21 = objc_msgSend(v14, "removeLastObject");
    v13 = v17;
    v12 = v20;
    if (!v17)
      goto LABEL_11;
  }

  v20 = v12;
LABEL_11:
  v27 = (void *)MEMORY[0x227676638](v21);
  v28 = self;
  HMFGetOSLogHandle();
  v29 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v42 = v30;
    v43 = 2048;
    v44 = a3;
    _os_log_impl(&dword_2218F0000, v29, OS_LOG_TYPE_ERROR, "%{public}@Failed to retrieve remote controller with fabric Id %llu", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v27);
  objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 2);
  v26 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, _QWORD, id))v15 + 2))(v15, 0, v26);
LABEL_9:

}

- (void)getAnyDeviceControllerWithCompletion:(id)a3
{
  void (**v4)(id, _QWORD, void *);
  NSObject *v5;
  void *v6;
  HMDCHIPXPCClientConnection *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  uint64_t v25;
  void *v26;
  HMDCHIPXPCClientConnection *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  HMDCHIPXPCClientConnection *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  HMDCHIPXPCClientConnection *v36;
  NSObject *v37;
  void *v38;
  void *v39;
  HMDCHIPXPCClientConnection *v40;
  void (**v41)(id, _QWORD, void *);
  id obj;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  uint8_t buf[4];
  void *v52;
  __int16 v53;
  void *v54;
  _BYTE v55[128];
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, _QWORD, void *))a3;
  -[HMDCHIPXPCClientConnection workQueue](self, "workQueue");
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
    *(_DWORD *)buf = 138543362;
    v52 = v9;
    _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_INFO, "%{public}@Retrieving any shared remote controller", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v6);
  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  -[HMDCHIPXPCClientConnection homeManager](v7, "homeManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "homes");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v47, v56, 16);
  if (v12)
  {
    v13 = v12;
    v41 = v4;
    obj = v11;
    v40 = v7;
    v14 = 0;
    v15 = 0;
    v16 = *(_QWORD *)v48;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        v18 = v14;
        if (*(_QWORD *)v48 != v16)
          objc_enumerationMutation(obj);
        v19 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * i);
        objc_msgSend(v19, "uuid");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        v45 = 0u;
        v46 = 0u;
        v43 = 0u;
        v44 = 0u;
        objc_msgSend(v19, "hapAccessories");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v43, v55, 16);
        if (v21)
        {
          v22 = v21;
          v23 = *(_QWORD *)v44;
          while (2)
          {
            for (j = 0; j != v22; ++j)
            {
              if (*(_QWORD *)v44 != v23)
                objc_enumerationMutation(v20);
              if (objc_msgSend(*(id *)(*((_QWORD *)&v43 + 1) + 8 * j), "supportsCHIP"))
              {
                objc_msgSend(v19, "uuid");
                v25 = objc_claimAutoreleasedReturnValue();

                v15 = (void *)v25;
                goto LABEL_18;
              }
            }
            v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v43, v55, 16);
            if (v22)
              continue;
            break;
          }
        }
LABEL_18:

      }
      v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v56, 16);
    }
    while (v13);

    if (v15)
    {
      v26 = (void *)MEMORY[0x227676638]();
      v27 = v40;
      HMFGetOSLogHandle();
      v28 = objc_claimAutoreleasedReturnValue();
      v4 = v41;
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v52 = v29;
        v53 = 2112;
        v54 = v15;
        _os_log_impl(&dword_2218F0000, v28, OS_LOG_TYPE_INFO, "%{public}@Retrieved shared remote controller: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v26);
      objc_msgSend(v15, "UUIDString");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(id, void *, void *))v41)[2](v41, v30, 0);

      goto LABEL_32;
    }
    v7 = v40;
    v4 = v41;
    if (v14)
    {
      v35 = (void *)MEMORY[0x227676638]();
      v36 = v40;
      HMFGetOSLogHandle();
      v37 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v52 = v38;
        v53 = 2112;
        v54 = v14;
        _os_log_impl(&dword_2218F0000, v37, OS_LOG_TYPE_INFO, "%{public}@Retrieved shared remote controller with no paired CHIP accessory: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v35);
      objc_msgSend(v14, "UUIDString");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(id, void *, void *))v41)[2](v41, v39, 0);

      v15 = v14;
      goto LABEL_32;
    }
  }
  else
  {

  }
  v31 = (void *)MEMORY[0x227676638]();
  v32 = v7;
  HMFGetOSLogHandle();
  v33 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v52 = v34;
    _os_log_impl(&dword_2218F0000, v33, OS_LOG_TYPE_ERROR, "%{public}@Failed to retrieve any remote controller", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v31);
  objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v4[2](v4, 0, v15);
LABEL_32:

}

- (void)readAttributeWithController:(id)a3 nodeId:(unint64_t)a4 endpointId:(id)a5 clusterId:(id)a6 attributeId:(id)a7 params:(id)a8 completion:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  void (**v19)(id, _QWORD, void *);
  NSObject *v20;
  void *v21;
  HMDCHIPXPCClientConnection *v22;
  NSObject *v23;
  void *v24;
  id v25;
  void *v26;
  id v27;
  void *v28;
  id v29;
  id v30;
  void *v31;
  void *v32;
  id v33;
  id v34;
  void *v35;
  HMDCHIPXPCClientConnection *v36;
  NSObject *v37;
  void *v38;
  void *v39;
  id v40;
  id v41;
  id v42;
  id v43;
  void *v44;
  HMDCHIPXPCClientConnection *v45;
  NSObject *v46;
  id v47;
  id v48;
  void *v49;
  void *v50;
  HMDCHIPXPCClientConnection *v51;
  NSObject *v52;
  void *v53;
  void *v54;
  void *v55;
  id v56;
  void *v57;
  id v58;
  id v59;
  uint8_t buf[4];
  void *v61;
  __int16 v62;
  id v63;
  __int16 v64;
  unint64_t v65;
  __int16 v66;
  id v67;
  __int16 v68;
  id v69;
  __int16 v70;
  id v71;
  __int16 v72;
  id v73;
  uint64_t v74;

  v74 = *MEMORY[0x24BDAC8D0];
  v15 = a3;
  v59 = a5;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  v19 = (void (**)(id, _QWORD, void *))a9;
  -[HMDCHIPXPCClientConnection workQueue](self, "workQueue");
  v20 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v20);

  v21 = (void *)MEMORY[0x227676638]();
  v22 = self;
  HMFGetOSLogHandle();
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544898;
    v61 = v24;
    v62 = 2112;
    v63 = v15;
    v64 = 2048;
    v65 = a4;
    v66 = 2112;
    v67 = v59;
    v68 = 2112;
    v69 = v16;
    v70 = 2112;
    v71 = v17;
    v72 = 2112;
    v73 = v18;
    _os_log_impl(&dword_2218F0000, v23, OS_LOG_TYPE_DEBUG, "%{public}@Reading attribute via controller %@, nodeId 0x%llx, endpointId %@, clusterId %@, attributeId %@, params %@", buf, 0x48u);

  }
  objc_autoreleasePoolPop(v21);
  v25 = v15;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v26 = v25;
  else
    v26 = 0;
  v27 = v26;

  if (v27)
  {
    v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", v27);
    if (v28)
    {
      v56 = v18;
      v29 = v17;
      v30 = v16;
      -[HMDCHIPXPCClientConnection homeManager](v22, "homeManager");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "_homeWithUUID:", v28);
      v32 = (void *)objc_claimAutoreleasedReturnValue();

      if (v32)
      {
        v16 = v30;
        v33 = v30;
        v17 = v29;
        v34 = v29;
        v18 = v56;
        objc_msgSend(v32, "readAttributeWithNodeId:endpointId:clusterId:attributeId:params:completion:", a4, v59, v33, v34, v56, v19);
      }
      else
      {
        v50 = (void *)MEMORY[0x227676638]();
        v51 = v22;
        HMFGetOSLogHandle();
        v52 = objc_claimAutoreleasedReturnValue();
        v16 = v30;
        if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v53 = v50;
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v61 = v54;
          v62 = 2112;
          v63 = v28;
          _os_log_impl(&dword_2218F0000, v52, OS_LOG_TYPE_ERROR, "%{public}@Could not send remote message using unknown home UUID: %@", buf, 0x16u);

          v50 = v53;
        }

        objc_autoreleasePoolPop(v50);
        objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 3);
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        v19[2](v19, 0, v55);

        v32 = 0;
        v17 = v29;
        v18 = v56;
      }
    }
    else
    {
      v44 = (void *)MEMORY[0x227676638]();
      v45 = v22;
      HMFGetOSLogHandle();
      v46 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v58 = v18;
        v47 = v17;
        v48 = v16;
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v61 = v49;
        v62 = 2112;
        v63 = v27;
        _os_log_impl(&dword_2218F0000, v46, OS_LOG_TYPE_ERROR, "%{public}@CHIP Read attribute called with invalid home UUID string: %@", buf, 0x16u);

        v16 = v48;
        v17 = v47;
        v18 = v58;
      }

      objc_autoreleasePoolPop(v44);
      objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 3);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v19[2](v19, 0, v32);
    }

  }
  else
  {
    v35 = (void *)MEMORY[0x227676638]();
    v36 = v22;
    HMFGetOSLogHandle();
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v57 = v35;
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543874;
      v61 = v38;
      v62 = 2112;
      v63 = v25;
      v64 = 2112;
      v65 = (unint64_t)v39;
      v40 = v18;
      v41 = v17;
      v42 = v16;
      v43 = v39;
      _os_log_impl(&dword_2218F0000, v37, OS_LOG_TYPE_ERROR, "%{public}@CHIP Read attribute called with controller of unexpected class: %@ (%@)", buf, 0x20u);

      v16 = v42;
      v17 = v41;
      v18 = v40;

      v35 = v57;
    }

    objc_autoreleasePoolPop(v35);
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 3);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v19[2](v19, 0, v28);
  }

}

- (void)writeAttributeWithController:(id)a3 nodeId:(unint64_t)a4 endpointId:(id)a5 clusterId:(id)a6 attributeId:(id)a7 value:(id)a8 timedWriteTimeout:(id)a9 completion:(id)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  NSObject *v21;
  void *v22;
  HMDCHIPXPCClientConnection *v23;
  NSObject *v24;
  void *v25;
  id v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  HMDCHIPXPCClientConnection *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  void *v43;
  HMDCHIPXPCClientConnection *v44;
  NSObject *v45;
  id v46;
  void *v47;
  const char *v48;
  NSObject *v49;
  uint32_t v50;
  void *v51;
  HMDCHIPXPCClientConnection *v52;
  NSObject *v53;
  void *v54;
  void *v55;
  id v56;
  void *v57;
  id v58;
  id v59;
  id v60;
  uint8_t buf[4];
  void *v62;
  __int16 v63;
  id v64;
  __int16 v65;
  unint64_t v66;
  __int16 v67;
  id v68;
  __int16 v69;
  id v70;
  __int16 v71;
  id v72;
  __int16 v73;
  id v74;
  __int16 v75;
  id v76;
  uint64_t v77;

  v77 = *MEMORY[0x24BDAC8D0];
  v16 = a3;
  v60 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v20 = a9;
  v59 = a10;
  -[HMDCHIPXPCClientConnection workQueue](self, "workQueue");
  v21 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v21);

  v22 = (void *)MEMORY[0x227676638]();
  v23 = self;
  HMFGetOSLogHandle();
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138545154;
    v62 = v25;
    v63 = 2112;
    v64 = v16;
    v65 = 2048;
    v66 = a4;
    v67 = 2112;
    v68 = v60;
    v69 = 2112;
    v70 = v17;
    v71 = 2112;
    v72 = v18;
    v73 = 2112;
    v74 = v19;
    v75 = 2112;
    v76 = v20;
    _os_log_impl(&dword_2218F0000, v24, OS_LOG_TYPE_DEBUG, "%{public}@Writing attribute via controller %@, nodeId 0x%llx, endpointId %@, clusterId %@, attributeId %@, value %@, timedWriteTimeout %@", buf, 0x52u);

  }
  objc_autoreleasePoolPop(v22);
  v26 = v16;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v27 = v26;
  else
    v27 = 0;
  v28 = v27;

  if (v28)
  {
    v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", v28);
    if (v29)
    {
      if (v60 && v17 && v18 && v19)
      {
        v56 = v17;
        -[HMDCHIPXPCClientConnection homeManager](v23, "homeManager");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "_homeWithUUID:", v29);
        v31 = (void *)objc_claimAutoreleasedReturnValue();

        if (v31)
        {
          v32 = v59;
          v17 = v56;
          objc_msgSend(v31, "writeAttributeWithNodeId:endpointId:clusterId:attributeId:value:timedWriteTimeout:completion:", a4, v60, v56, v18, v19, v20, v59);
        }
        else
        {
          v51 = (void *)MEMORY[0x227676638]();
          v52 = v23;
          HMFGetOSLogHandle();
          v53 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v62 = v54;
            v63 = 2112;
            v64 = v29;
            _os_log_impl(&dword_2218F0000, v53, OS_LOG_TYPE_ERROR, "%{public}@Could not send remote message using unknown home UUID: %@", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v51);
          objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 3);
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = v59;
          (*((void (**)(id, _QWORD, void *))v59 + 2))(v59, 0, v55);

          v31 = 0;
          v17 = v56;
        }
        goto LABEL_23;
      }
      v43 = (void *)MEMORY[0x227676638]();
      v44 = v23;
      HMFGetOSLogHandle();
      v45 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v58 = v19;
        v46 = v17;
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v62 = v47;
        v48 = "%{public}@CHIP write attribute called with null values for nonnull parameter";
        v49 = v45;
        v50 = 12;
        goto LABEL_21;
      }
    }
    else
    {
      v43 = (void *)MEMORY[0x227676638]();
      v44 = v23;
      HMFGetOSLogHandle();
      v45 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v58 = v19;
        v46 = v17;
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v62 = v47;
        v63 = 2112;
        v64 = v28;
        v48 = "%{public}@CHIP write attribute called with invalid home UUID string: %@";
        v49 = v45;
        v50 = 22;
LABEL_21:
        _os_log_impl(&dword_2218F0000, v49, OS_LOG_TYPE_ERROR, v48, buf, v50);

        v17 = v46;
        v19 = v58;
      }
    }

    objc_autoreleasePoolPop(v43);
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 3);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = v59;
    (*((void (**)(id, _QWORD, void *))v59 + 2))(v59, 0, v31);
LABEL_23:

    goto LABEL_24;
  }
  v33 = (void *)MEMORY[0x227676638]();
  v34 = v23;
  HMFGetOSLogHandle();
  v35 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v57 = v33;
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = (void *)objc_opt_class();
    *(_DWORD *)buf = 138543874;
    v62 = v36;
    v63 = 2112;
    v64 = v26;
    v65 = 2112;
    v66 = (unint64_t)v37;
    v38 = v20;
    v39 = v18;
    v40 = v19;
    v41 = v17;
    v42 = v37;
    _os_log_impl(&dword_2218F0000, v35, OS_LOG_TYPE_ERROR, "%{public}@CHIP write attribute called with controller of unexpected class: %@ (%@)", buf, 0x20u);

    v17 = v41;
    v19 = v40;
    v18 = v39;
    v20 = v38;

    v33 = v57;
  }

  objc_autoreleasePoolPop(v33);
  objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 3);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = v59;
  (*((void (**)(id, _QWORD, void *))v59 + 2))(v59, 0, v29);
LABEL_24:

}

- (void)invokeCommandWithController:(id)a3 nodeId:(unint64_t)a4 endpointId:(id)a5 clusterId:(id)a6 commandId:(id)a7 fields:(id)a8 timedInvokeTimeout:(id)a9 completion:(id)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  NSObject *v21;
  void *v22;
  HMDCHIPXPCClientConnection *v23;
  NSObject *v24;
  void *v25;
  id v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  HMDCHIPXPCClientConnection *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  void *v43;
  HMDCHIPXPCClientConnection *v44;
  NSObject *v45;
  id v46;
  void *v47;
  const char *v48;
  NSObject *v49;
  uint32_t v50;
  void *v51;
  HMDCHIPXPCClientConnection *v52;
  NSObject *v53;
  void *v54;
  void *v55;
  id v56;
  void *v57;
  id v58;
  id v59;
  id v60;
  uint8_t buf[4];
  void *v62;
  __int16 v63;
  id v64;
  __int16 v65;
  unint64_t v66;
  __int16 v67;
  id v68;
  __int16 v69;
  id v70;
  __int16 v71;
  id v72;
  __int16 v73;
  id v74;
  __int16 v75;
  id v76;
  uint64_t v77;

  v77 = *MEMORY[0x24BDAC8D0];
  v16 = a3;
  v60 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v20 = a9;
  v59 = a10;
  -[HMDCHIPXPCClientConnection workQueue](self, "workQueue");
  v21 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v21);

  v22 = (void *)MEMORY[0x227676638]();
  v23 = self;
  HMFGetOSLogHandle();
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138545154;
    v62 = v25;
    v63 = 2112;
    v64 = v16;
    v65 = 2048;
    v66 = a4;
    v67 = 2112;
    v68 = v60;
    v69 = 2112;
    v70 = v17;
    v71 = 2112;
    v72 = v18;
    v73 = 2112;
    v74 = v19;
    v75 = 2112;
    v76 = v20;
    _os_log_impl(&dword_2218F0000, v24, OS_LOG_TYPE_DEBUG, "%{public}@Invoking command via controller %@, nodeId 0x%llx, endpointId %@, clusterId %@, commandId %@, fields %@, timedInvokeTimeout %@", buf, 0x52u);

  }
  objc_autoreleasePoolPop(v22);
  v26 = v16;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v27 = v26;
  else
    v27 = 0;
  v28 = v27;

  if (v28)
  {
    v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", v28);
    if (v29)
    {
      if (v60 && v17 && v18 && v19)
      {
        v56 = v17;
        -[HMDCHIPXPCClientConnection homeManager](v23, "homeManager");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "_homeWithUUID:", v29);
        v31 = (void *)objc_claimAutoreleasedReturnValue();

        if (v31)
        {
          v32 = v59;
          v17 = v56;
          objc_msgSend(v31, "invokeCommandWithNodeId:endpointId:clusterId:commandId:fields:timedInvokeTimeout:completion:", a4, v60, v56, v18, v19, v20, v59);
        }
        else
        {
          v51 = (void *)MEMORY[0x227676638]();
          v52 = v23;
          HMFGetOSLogHandle();
          v53 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v62 = v54;
            v63 = 2112;
            v64 = v29;
            _os_log_impl(&dword_2218F0000, v53, OS_LOG_TYPE_ERROR, "%{public}@Could not send remote message using unknown home UUID: %@", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v51);
          objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 3);
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = v59;
          (*((void (**)(id, _QWORD, void *))v59 + 2))(v59, 0, v55);

          v31 = 0;
          v17 = v56;
        }
        goto LABEL_23;
      }
      v43 = (void *)MEMORY[0x227676638]();
      v44 = v23;
      HMFGetOSLogHandle();
      v45 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v58 = v19;
        v46 = v17;
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v62 = v47;
        v48 = "%{public}@CHIP invoke command called with invalid nil parameter";
        v49 = v45;
        v50 = 12;
        goto LABEL_21;
      }
    }
    else
    {
      v43 = (void *)MEMORY[0x227676638]();
      v44 = v23;
      HMFGetOSLogHandle();
      v45 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v58 = v19;
        v46 = v17;
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v62 = v47;
        v63 = 2112;
        v64 = v28;
        v48 = "%{public}@CHIP invoke command called with invalid home UUID string: %@";
        v49 = v45;
        v50 = 22;
LABEL_21:
        _os_log_impl(&dword_2218F0000, v49, OS_LOG_TYPE_ERROR, v48, buf, v50);

        v17 = v46;
        v19 = v58;
      }
    }

    objc_autoreleasePoolPop(v43);
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 3);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = v59;
    (*((void (**)(id, _QWORD, void *))v59 + 2))(v59, 0, v31);
LABEL_23:

    goto LABEL_24;
  }
  v33 = (void *)MEMORY[0x227676638]();
  v34 = v23;
  HMFGetOSLogHandle();
  v35 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v57 = v33;
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = (void *)objc_opt_class();
    *(_DWORD *)buf = 138543874;
    v62 = v36;
    v63 = 2112;
    v64 = v26;
    v65 = 2112;
    v66 = (unint64_t)v37;
    v38 = v20;
    v39 = v18;
    v40 = v19;
    v41 = v17;
    v42 = v37;
    _os_log_impl(&dword_2218F0000, v35, OS_LOG_TYPE_ERROR, "%{public}@CHIP invoke command called with controller of unexpected class: %@ (%@)", buf, 0x20u);

    v17 = v41;
    v19 = v40;
    v18 = v39;
    v20 = v38;

    v33 = v57;
  }

  objc_autoreleasePoolPop(v33);
  objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 3);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = v59;
  (*((void (**)(id, _QWORD, void *))v59 + 2))(v59, 0, v29);
LABEL_24:

}

- (void)subscribeAttributeWithController:(id)a3 nodeId:(unint64_t)a4 endpointId:(id)a5 clusterId:(id)a6 attributeId:(id)a7 minInterval:(id)a8 maxInterval:(id)a9 params:(id)a10 establishedHandler:(id)a11
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  NSObject *v22;
  void *v23;
  HMDCHIPXPCClientConnection *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  HMDCHIPXPCClientConnection *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  id v34;
  id v35;
  uint8_t buf[4];
  void *v37;
  __int16 v38;
  id v39;
  __int16 v40;
  unint64_t v41;
  __int16 v42;
  id v43;
  __int16 v44;
  id v45;
  __int16 v46;
  id v47;
  __int16 v48;
  id v49;
  __int16 v50;
  id v51;
  __int16 v52;
  id v53;
  uint64_t v54;

  v54 = *MEMORY[0x24BDAC8D0];
  v17 = a3;
  v35 = a5;
  v34 = a6;
  v18 = a7;
  v19 = a8;
  v20 = a9;
  v21 = a10;
  v33 = a11;
  -[HMDCHIPXPCClientConnection workQueue](self, "workQueue");
  v22 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v22);

  v23 = (void *)MEMORY[0x227676638]();
  v24 = self;
  HMFGetOSLogHandle();
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138545410;
    v37 = v26;
    v38 = 2112;
    v39 = v17;
    v40 = 2048;
    v41 = a4;
    v42 = 2112;
    v43 = v35;
    v44 = 2112;
    v45 = v34;
    v46 = 2112;
    v47 = v18;
    v48 = 2112;
    v49 = v19;
    v50 = 2112;
    v51 = v20;
    v52 = 2112;
    v53 = v21;
    _os_log_impl(&dword_2218F0000, v25, OS_LOG_TYPE_DEBUG, "%{public}@Subscribing attribute via controller %@, nodeId 0x%llx, endpointId %@, clusterId %@, attributeId %@ minInterval %@, maxInterval %@, params %@", buf, 0x5Cu);

  }
  objc_autoreleasePoolPop(v23);
  v27 = (void *)MEMORY[0x227676638]();
  v28 = v24;
  HMFGetOSLogHandle();
  v29 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v37 = v30;
    _os_log_impl(&dword_2218F0000, v29, OS_LOG_TYPE_ERROR, "%{public}@Subscribing attribute is not supported yet", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v27);
  -[HMDCHIPXPCClientConnection remoteObjectProxy](v28, "remoteObjectProxy");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 48);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "handleReportWithController:nodeId:values:error:", v17, a4, 0, v32);

}

- (void)stopReportsWithController:(id)a3 nodeId:(unint64_t)a4 completion:(id)a5
{
  id v8;
  void (**v9)(_QWORD);
  NSObject *v10;
  void *v11;
  HMDCHIPXPCClientConnection *v12;
  NSObject *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  unint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = (void (**)(_QWORD))a5;
  -[HMDCHIPXPCClientConnection workQueue](self, "workQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v10);

  v11 = (void *)MEMORY[0x227676638]();
  v12 = self;
  HMFGetOSLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138543874;
    v16 = v14;
    v17 = 2112;
    v18 = v8;
    v19 = 2048;
    v20 = a4;
    _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_DEBUG, "%{public}@Stop reports with controller %@, nodeId 0x%llx", (uint8_t *)&v15, 0x20u);

  }
  objc_autoreleasePoolPop(v11);
  v9[2](v9);

}

- (void)subscribeWithController:(id)a3 nodeId:(unint64_t)a4 minInterval:(id)a5 maxInterval:(id)a6 params:(id)a7 shouldCache:(BOOL)a8 completion:(id)a9
{
  id v14;
  id v15;
  id v16;
  id v17;
  void (**v18)(id, void *);
  NSObject *v19;
  void *v20;
  HMDCHIPXPCClientConnection *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  __int16 v27;
  id v28;
  __int16 v29;
  unint64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v14 = a3;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v18 = (void (**)(id, void *))a9;
  -[HMDCHIPXPCClientConnection workQueue](self, "workQueue");
  v19 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v19);

  v20 = (void *)MEMORY[0x227676638]();
  v21 = self;
  HMFGetOSLogHandle();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 138543874;
    v26 = v23;
    v27 = 2112;
    v28 = v14;
    v29 = 2048;
    v30 = a4;
    _os_log_impl(&dword_2218F0000, v22, OS_LOG_TYPE_ERROR, "%{public}@Not subscribing with controller: %@, nodeID: 0x%llx: Unsupported", (uint8_t *)&v25, 0x20u);

  }
  objc_autoreleasePoolPop(v20);
  objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 48);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v18[2](v18, v24);

}

- (void)readAttributeCacheWithController:(id)a3 nodeId:(unint64_t)a4 endpointId:(id)a5 clusterId:(id)a6 attributeId:(id)a7 completion:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  void (**v18)(id, _QWORD, void *);
  NSObject *v19;
  void *v20;
  HMDCHIPXPCClientConnection *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  __int16 v27;
  id v28;
  __int16 v29;
  unint64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v14 = a3;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v18 = (void (**)(id, _QWORD, void *))a8;
  -[HMDCHIPXPCClientConnection workQueue](self, "workQueue");
  v19 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v19);

  v20 = (void *)MEMORY[0x227676638]();
  v21 = self;
  HMFGetOSLogHandle();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 138543874;
    v26 = v23;
    v27 = 2112;
    v28 = v14;
    v29 = 2048;
    v30 = a4;
    _os_log_impl(&dword_2218F0000, v22, OS_LOG_TYPE_ERROR, "%{public}@Not reading attribute cache with controller: %@, nodeID: 0x%llx: Unsupported", (uint8_t *)&v25, 0x20u);

  }
  objc_autoreleasePoolPop(v20);
  objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 48);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v18[2](v18, 0, v24);

}

- (void)downloadLogWithController:(id)a3 nodeId:(id)a4 type:(int64_t)a5 timeout:(double)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  void *v16;
  HMDCHIPXPCClientConnection *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void (**v27)(_QWORD, _QWORD, _QWORD);
  void *v28;
  HMDCHIPXPCClientConnection *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  HMDCHIPXPCClientConnection *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  id v38;
  int v39;
  void *v40;
  __int16 v41;
  id v42;
  __int16 v43;
  id v44;
  __int16 v45;
  void *v46;
  __int16 v47;
  void *v48;
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a4;
  v14 = a7;
  -[HMDCHIPXPCClientConnection workQueue](self, "workQueue");
  v15 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v15);

  v16 = (void *)MEMORY[0x227676638]();
  v17 = self;
  HMFGetOSLogHandle();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a5);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a6);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = 138544386;
    v40 = v19;
    v41 = 2112;
    v42 = v12;
    v43 = 2112;
    v44 = v13;
    v45 = 2112;
    v46 = v20;
    v47 = 2112;
    v48 = v21;
    _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_INFO, "%{public}@Download log via controller %@, nodeId %@, logType %@, timeout %@", (uint8_t *)&v39, 0x34u);

  }
  objc_autoreleasePoolPop(v16);
  v22 = v12;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v23 = v22;
  else
    v23 = 0;
  v24 = v23;

  if (v24)
  {
    v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", v24);
    if (v25
      && (-[HMDCHIPXPCClientConnection homeManager](v17, "homeManager"),
          v26 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v26, "_homeWithUUID:", v25),
          v27 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(),
          v26,
          v27))
    {
      objc_msgSend(v27, "downloadLogWithController:nodeId:type:timeout:completion:", v22, v13, a5, v14, a6);
    }
    else
    {
      v28 = (void *)MEMORY[0x227676638]();
      v29 = v17;
      HMFGetOSLogHandle();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = 138543618;
        v40 = v31;
        v41 = 2112;
        v42 = v25;
        _os_log_impl(&dword_2218F0000, v30, OS_LOG_TYPE_ERROR, "%{public}@Could not send remote message using invalid home UUID: %@", (uint8_t *)&v39, 0x16u);

      }
      objc_autoreleasePoolPop(v28);
      v27 = (void (**)(_QWORD, _QWORD, _QWORD))_Block_copy(v14);
      if (v27)
      {
        objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 3);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, _QWORD, void *))v27)[2](v27, 0, v32);

      }
    }
    goto LABEL_18;
  }
  v33 = (void *)MEMORY[0x227676638]();
  v34 = v17;
  HMFGetOSLogHandle();
  v35 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = (void *)objc_opt_class();
    v39 = 138543874;
    v40 = v36;
    v41 = 2112;
    v42 = v22;
    v43 = 2112;
    v44 = v37;
    v38 = v37;
    _os_log_impl(&dword_2218F0000, v35, OS_LOG_TYPE_ERROR, "%{public}@Download log called with controller of unexpected class: %@ (%@)", (uint8_t *)&v39, 0x20u);

  }
  objc_autoreleasePoolPop(v33);
  v25 = _Block_copy(v14);
  if (v25)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 3);
    v27 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    (*((void (**)(void *, _QWORD, _QWORD))v25 + 2))(v25, 0, v27);
LABEL_18:

  }
}

- (id)logIdentifier
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), -[HMDCHIPXPCClientConnection pid](self, "pid"));
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 16, 1);
}

- (MTRDeviceControllerClientProtocol)remoteObjectProxy
{
  return self->_remoteObjectProxy;
}

- (HMDHomeManager)homeManager
{
  return (HMDHomeManager *)objc_loadWeakRetained((id *)&self->_homeManager);
}

- (int)pid
{
  return self->_pid;
}

- (NSMutableSet)subscribedHomeUUIDs
{
  return self->_subscribedHomeUUIDs;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subscribedHomeUUIDs, 0);
  objc_destroyWeak((id *)&self->_homeManager);
  objc_storeStrong((id *)&self->_remoteObjectProxy, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
}

void __106__HMDCHIPXPCClientConnection__getDeviceControllerWithFabricId_accessories_home_remainingHomes_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  id v17;
  NSObject *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  void *v29;
  id v30;
  NSObject *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  id v40;
  id obj;
  void *v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  uint8_t buf[4];
  void *v48;
  __int16 v49;
  void *v50;
  __int16 v51;
  void *v52;
  _BYTE v53[128];
  _QWORD v54[4];

  v54[2] = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = *MEMORY[0x24BDD4960];
  v54[0] = objc_opt_class();
  v54[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v54, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hmf_unarchivedObjectForKey:ofClasses:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v39 = v6;
    v40 = v5;
    v45 = 0u;
    v46 = 0u;
    v43 = 0u;
    v44 = 0u;
    v38 = v9;
    obj = v9;
    v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v53, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v44;
      v13 = 0x24BDD1000;
      while (2)
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v44 != v12)
            objc_enumerationMutation(obj);
          v15 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * i);
          v16 = (void *)MEMORY[0x227676638]();
          v17 = *(id *)(a1 + 32);
          HMFGetOSLogHandle();
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
          {
            HMFGetLogIdentifier();
            v42 = v16;
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "home");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "identifier");
            v21 = a1;
            v22 = v11;
            v23 = v12;
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v48 = v19;
            v49 = 2112;
            v50 = v24;
            _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_DEBUG, "%{public}@Fetched CHIP pairing with fabric Id: %@", buf, 0x16u);

            v12 = v23;
            v11 = v22;
            a1 = v21;
            v13 = 0x24BDD1000uLL;

            v16 = v42;
          }

          objc_autoreleasePoolPop(v16);
          objc_msgSend(v15, "home");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "identifier");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(v13 + 1760), "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 72));
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = objc_msgSend(v26, "isEqualToNumber:", v27);

          if (v28)
          {
            v29 = (void *)MEMORY[0x227676638]();
            v30 = *(id *)(a1 + 32);
            HMFGetOSLogHandle();
            v31 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              v33 = *(void **)(a1 + 72);
              objc_msgSend(*(id *)(a1 + 40), "uuid");
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543874;
              v48 = v32;
              v49 = 2048;
              v50 = v33;
              v51 = 2112;
              v52 = v34;
              _os_log_impl(&dword_2218F0000, v31, OS_LOG_TYPE_INFO, "%{public}@Retrieved shared remote controller with fabric Id %llu: %@", buf, 0x20u);

            }
            objc_autoreleasePoolPop(v29);
            v35 = *(_QWORD *)(a1 + 64);
            objc_msgSend(*(id *)(a1 + 40), "uuid");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v36, "UUIDString");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            (*(void (**)(uint64_t, void *, _QWORD))(v35 + 16))(v35, v37, 0);

            v6 = v39;
            v5 = v40;
            v9 = v38;
            goto LABEL_17;
          }
        }
        v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v53, 16);
        if (v11)
          continue;
        break;
      }
    }

    v6 = v39;
    v5 = v40;
    v9 = v38;
  }
  objc_msgSend(*(id *)(a1 + 32), "_getDeviceControllerWithFabricId:accessories:home:remainingHomes:completion:", *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
LABEL_17:

}

void __69__HMDCHIPXPCClientConnection__registerReportHandlerWithHomeWithUUID___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = (void *)MEMORY[0x227676638]();
  v7 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138543874;
    v14 = v9;
    v15 = 2048;
    v16 = a2;
    v17 = 2112;
    v18 = v5;
    _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_INFO, "%{public}@Dispatching report to client using nodeId %tu, reports %@", (uint8_t *)&v13, 0x20u);

  }
  objc_autoreleasePoolPop(v6);
  objc_msgSend(v5, "xpcEncodedCHIPReportsFromHMFEncodedMessage");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "remoteObjectProxy");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "UUIDString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "handleReportWithController:nodeId:values:error:", v12, a2, v10, 0);

}

+ (id)logCategory
{
  if (logCategory__hmf_once_t39_199164 != -1)
    dispatch_once(&logCategory__hmf_once_t39_199164, &__block_literal_global_199165);
  return (id)logCategory__hmf_once_v40_199166;
}

void __41__HMDCHIPXPCClientConnection_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v40_199166;
  logCategory__hmf_once_v40_199166 = v0;

}

@end
