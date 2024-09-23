@implementation HMDHomeReprovisionHandler

- (HMDHomeReprovisionHandler)init
{
  HMDHomeReprovisionHandler *v2;
  HMDHomeReprovisionHandler *v3;
  uint64_t v4;
  NSMutableDictionary *pendingReprovisionRequests;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HMDHomeReprovisionHandler;
  v2 = -[HMDHomeReprovisionHandler init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_reprovisionBrowsingAllowed = 1;
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v4 = objc_claimAutoreleasedReturnValue();
    pendingReprovisionRequests = v3->_pendingReprovisionRequests;
    v3->_pendingReprovisionRequests = (NSMutableDictionary *)v4;

  }
  return v3;
}

- (void)dealloc
{
  HMDHomeReprovisionHandler *v2;
  void *v3;
  void *v4;
  objc_super v5;

  v2 = self;
  if (self)
    self = (HMDHomeReprovisionHandler *)self->_msgDispatcher;
  -[HMDHomeReprovisionHandler deregisterReceiver:](self, "deregisterReceiver:", v2);
  -[HMDHomeReprovisionHandler home]((id *)&v2->super.super.isa);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "administratorHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "deregisterReceiver:", v2);

  v5.receiver = v2;
  v5.super_class = (Class)HMDHomeReprovisionHandler;
  -[HMDHomeReprovisionHandler dealloc](&v5, sel_dealloc);
}

- (void)configure:(id)a3 queue:(id)a4 messageDispatcher:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  HMDHomeReprovisionHandler *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  id WeakRetained;
  void *v17;
  void *v18;
  HMFMessageDispatcher *msgDispatcher;
  uint64_t v20;
  void *v21;
  HMFMessageDispatcher *v22;
  void *v23;
  HMFMessageDispatcher *v24;
  uint64_t v25;
  void *v26;
  HMFMessageDispatcher *v27;
  void *v28;
  id v29;
  _BYTE buf[22];
  _QWORD v31[3];

  v31[2] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v29 = a4;
  v9 = a5;
  if (self)
  {
    objc_storeWeak((id *)&self->_home, v8);
    objc_storeStrong((id *)&self->_workQueue, a4);
    objc_storeStrong((id *)&self->_msgDispatcher, a5);
    objc_msgSend(v8, "accessoryBrowser");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)&self->_accessoryBrowser, v10);
  }
  else
  {
    objc_msgSend(v8, "accessoryBrowser");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  v11 = (void *)MEMORY[0x227676638]();
  v12 = self;
  HMFGetOSLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDHomeReprovisionHandler home]((id *)&v12->super.super.isa);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = v14;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v15;
    _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_INFO, "%{public}@Configured reprovision handler for home %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v11);
  if (self)
  {
    WeakRetained = objc_loadWeakRetained((id *)&v12->_home);
    +[HMDUserMessagePolicy userMessagePolicyWithHome:userPrivilege:remoteAccessRequired:](HMDUserMessagePolicy, "userMessagePolicyWithHome:userPrivilege:remoteAccessRequired:", WeakRetained, 3, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    +[HMDXPCMessagePolicy policyWithEntitlements:](HMDXPCMessagePolicy, "policyWithEntitlements:", 5);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    msgDispatcher = v12->_msgDispatcher;
    v20 = *MEMORY[0x24BDD7D68];
    *(_QWORD *)buf = v18;
    *(_QWORD *)&buf[8] = v17;
    v21 = (void *)MEMORY[0x24BDBCE30];
    v22 = msgDispatcher;
    objc_msgSend(v21, "arrayWithObjects:count:", buf, 2);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMFMessageDispatcher registerForMessage:receiver:policies:selector:](v22, "registerForMessage:receiver:policies:selector:", v20, v12, v23, sel__handleRequestSearchForAccessoriesNeedingReprovisioning_);

    v24 = v12->_msgDispatcher;
    v25 = *MEMORY[0x24BDD7D60];
    v31[0] = v18;
    v31[1] = v17;
    v26 = (void *)MEMORY[0x24BDBCE30];
    v27 = v24;
    objc_msgSend(v26, "arrayWithObjects:count:", v31, 2);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMFMessageDispatcher registerForMessage:receiver:policies:selector:](v27, "registerForMessage:receiver:policies:selector:", v25, v12, v28, sel__handleReprovisionAccessory_);

  }
}

- (id)logIdentifier
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x24BDD17C8];
  -[HMDHomeReprovisionHandler home]((id *)&self->super.super.isa);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)_handleRequestSearchForAccessoriesNeedingReprovisioning:(id)a3
{
  id v4;
  void *v5;
  HMDHomeReprovisionHandler *v6;
  NSObject *v7;
  void *v8;
  id WeakRetained;
  id v10;
  void *v11;
  HMFTimer *disableReprovisionBrowsingTimer;
  OS_dispatch_queue *v13;
  void *v14;
  HMDHomeReprovisionHandler *v15;
  NSObject *v16;
  void *v17;
  HMFTimer *v18;
  void *v19;
  HMDHomeReprovisionHandler *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  void *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint8_t v35[128];
  uint8_t buf[4];
  void *v37;
  __int16 v38;
  HMFTimer *v39;
  __int16 v40;
  uint64_t v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
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
    v37 = v8;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Received request to start searching for accessories need reprovisioning", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v5);
  if (v6 && v6->_reprovisionBrowsingAllowed)
  {
    WeakRetained = objc_loadWeakRetained((id *)&v6->_accessoryBrowser);
    objc_msgSend(WeakRetained, "startDiscoveringAccessoriesNeedingReprovisioning");

    v6->_reprovisionBrowsingPending = 0;
    if (!v6->_disableReprovisionBrowsingTimer)
    {
      v6->_reprovisionBrowsingAllowed = 0;
      v10 = objc_alloc(MEMORY[0x24BE3F298]);
      v11 = (void *)objc_msgSend(v10, "initWithTimeInterval:options:", 1, *(double *)&disableReprivsionBrowsingPeriodInMinutes);
      objc_storeStrong((id *)&v6->_disableReprovisionBrowsingTimer, v11);

      -[HMFTimer setDelegate:](v6->_disableReprovisionBrowsingTimer, "setDelegate:", v6);
      disableReprovisionBrowsingTimer = v6->_disableReprovisionBrowsingTimer;
      v13 = v6->_workQueue;
      -[HMFTimer setDelegateQueue:](disableReprovisionBrowsingTimer, "setDelegateQueue:", v13);

      v14 = (void *)MEMORY[0x227676638](-[HMFTimer resume](v6->_disableReprovisionBrowsingTimer, "resume"));
      v15 = v6;
      HMFGetOSLogHandle();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = v15->_disableReprovisionBrowsingTimer;
        *(_DWORD *)buf = 138543874;
        v37 = v17;
        v38 = 2048;
        v39 = v18;
        v40 = 2048;
        v41 = disableReprivsionBrowsingPeriodInMinutes;
        _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_INFO, "%{public}@Started disable reprovision browsing timer %p for %f sec", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v14);
    }
  }
  else
  {
    v19 = (void *)MEMORY[0x227676638]();
    v20 = v6;
    HMFGetOSLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v37 = v22;
      _os_log_impl(&dword_2218F0000, v21, OS_LOG_TYPE_INFO, "%{public}@Request to start searching for accessories need reprovisioning is deferred", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v19);
    if (v6)
      v20->_reprovisionBrowsingPending = 1;
  }
  objc_msgSend(v4, "respondWithSuccess");
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  -[HMDHomeReprovisionHandler home]((id *)&v6->super.super.isa);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "accessories", 0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (void *)objc_msgSend(v24, "copy");

  v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
  if (v26)
  {
    v27 = v26;
    v28 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v27; ++i)
      {
        if (*(_QWORD *)v32 != v28)
          objc_enumerationMutation(v25);
        v30 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
        if (objc_msgSend(v30, "accessoryReprovisionState") == 1)
          -[HMDHomeReprovisionHandler _reportAccessoryNeedingReprovision:error:]((id *)&v6->super.super.isa, v30, 0);
      }
      v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    }
    while (v27);
  }

}

- (void)_handleReprovisionAccessory:(id)a3
{
  id v4;
  void (**v5)(_QWORD, _QWORD, _QWORD);
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  int v11;
  void *v12;
  HMDHomeReprovisionHandler *v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void (**v25)(_QWORD, _QWORD, _QWORD);
  void *v26;
  HMFMessageDispatcher *v27;
  void *v28;
  void *v29;
  void *v30;
  HMDHomeReprovisionHandler *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  void (**v36)(_QWORD, _QWORD, _QWORD);
  void *v37;
  HMDHomeReprovisionHandler *v38;
  NSObject *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  HMDHomeReprovisionHandler *v44;
  NSObject *v45;
  void *v46;
  void *v47;
  void *v48;
  HMDHomeReprovisionHandler *v49;
  NSObject *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  uint64_t v57;
  void *v58;
  HMFMessageDispatcher *msgDispatcher;
  void *v60;
  void *v61;
  void (**v62)(_QWORD, _QWORD, _QWORD);
  void *v63;
  id v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  HMDAccessoryNetworkCredential *v69;
  void *v70;
  void *v71;
  void *v72;
  HMDAccessoryNetworkCredential *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  id v78;
  void *v79;
  _QWORD v80[5];
  id v81;
  id v82;
  uint8_t buf[4];
  void *v84;
  __int16 v85;
  void *v86;
  uint64_t v87;

  v87 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (isiOSDevice())
  {
    if (self)
    {
      self->_reprovisionBrowsingPending = 0;
      self->_reprovisionBrowsingAllowed = 1;
      -[HMFTimer suspend](self->_disableReprovisionBrowsingTimer, "suspend");
      objc_storeStrong((id *)&self->_disableReprovisionBrowsingTimer, 0);
    }
    else
    {
      objc_msgSend(0, "suspend");
    }
    objc_msgSend(v4, "uuidForKey:", CFSTR("kAccessoryUUID"));
    v5 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      v30 = (void *)MEMORY[0x227676638]();
      v31 = self;
      HMFGetOSLogHandle();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "messagePayload");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v84 = v33;
        v85 = 2112;
        v86 = v34;
        _os_log_impl(&dword_2218F0000, v32, OS_LOG_TYPE_ERROR, "%{public}@Missing target accessory UUID from message payload: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v30);
      objc_msgSend(v4, "responseHandler");
      v35 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v35)
        goto LABEL_44;
      objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 3);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "responseHandler");
      v36 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *, _QWORD))v36)[2](v36, v6, 0);
      goto LABEL_43;
    }
    -[HMDHomeReprovisionHandler home]((id *)&self->super.super.isa);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "homeManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "accessoryWithUUID:", v5);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v9 = v8;
    else
      v9 = 0;
    v10 = v9;

    v79 = v7;
    if (v10)
    {
      if ((objc_msgSend(v10, "reachableTransports") & 1) != 0)
      {
        v76 = v6;
        v78 = v10;
        v43 = (void *)MEMORY[0x227676638]();
        v44 = self;
        HMFGetOSLogHandle();
        v45 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
        {
          HMFGetLogIdentifier();
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "name");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v84 = v46;
          v85 = 2112;
          v86 = v47;
          _os_log_impl(&dword_2218F0000, v45, OS_LOG_TYPE_DEFAULT, "%{public}@Reprovision accessory failed since the accessory: %@ is already in the network", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v43);
        v48 = (void *)MEMORY[0x227676638]();
        v49 = v44;
        HMFGetOSLogHandle();
        v50 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "name");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v84 = v51;
          v85 = 2112;
          v86 = v52;
          _os_log_impl(&dword_2218F0000, v50, OS_LOG_TYPE_INFO, "%{public}@Accessory %@ reprovision state is updated to NotRequired", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v48);
        objc_msgSend(v8, "setAccessoryReprovisionState:", 0);
        objc_msgSend(v8, "uuid");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "updateGenerationCounterWithReason:sourceUUID:shouldNotifyClients:", CFSTR("ReprovisionNotRequired"), v53, 0);

        objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "uuid");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "UUIDString");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setObject:forKeyedSubscript:", v55, CFSTR("kAccessoryUUID"));

        objc_msgSend(v19, "setObject:forKeyedSubscript:", &unk_24E96B5B8, *MEMORY[0x24BDD7BD8]);
        v56 = (void *)MEMORY[0x24BE3F1D0];
        v57 = *MEMORY[0x24BDD7BC8];
        -[HMDHomeReprovisionHandler messageDestination](v49);
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "messageWithName:destination:payload:", v57, v58, v19);
        v25 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();

        if (self)
          msgDispatcher = v49->_msgDispatcher;
        else
          msgDispatcher = 0;
        v10 = v78;
        -[HMFMessageDispatcher sendMessage:completionHandler:](msgDispatcher, "sendMessage:completionHandler:", v25, 0);
        objc_msgSend(v4, "responseHandler");
        v60 = (void *)objc_claimAutoreleasedReturnValue();

        if (v60)
        {
          objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:description:reason:suggestion:underlyingError:", 52, CFSTR("Accessory already in the network"), 0, 0, 0);
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "responseHandler");
          v62 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
          ((void (**)(_QWORD, void *, _QWORD))v62)[2](v62, v61, 0);

        }
        v6 = v76;
        goto LABEL_41;
      }
      v11 = objc_msgSend(v10, "isPaired");
      v12 = (void *)MEMORY[0x227676638]();
      v13 = self;
      HMFGetOSLogHandle();
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = v14;
      if (v11)
      {
        v74 = v6;
        v77 = v10;
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "name");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v84 = v16;
          v85 = 2112;
          v86 = v17;
          _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_INFO, "%{public}@Accessory %@ reprovision state is updated to InProgress", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v12);
        objc_msgSend(v8, "setAccessoryReprovisionState:", 2);
        objc_msgSend(v8, "uuid");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v79, "updateGenerationCounterWithReason:sourceUUID:shouldNotifyClients:", CFSTR("ReprovisionInProgress"), v18, 0);

        objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "uuid");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "UUIDString");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setObject:forKeyedSubscript:", v21, CFSTR("kAccessoryUUID"));

        objc_msgSend(v19, "setObject:forKeyedSubscript:", &unk_24E96B5D0, *MEMORY[0x24BDD7BD8]);
        v22 = (void *)MEMORY[0x24BE3F1D0];
        v23 = *MEMORY[0x24BDD7BC8];
        -[HMDHomeReprovisionHandler messageDestination](v13);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "messageWithName:destination:payload:", v23, v24, v19);
        v25 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();

        objc_msgSend(v4, "transport");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "setTransport:", v26);

        if (self)
          v27 = v13->_msgDispatcher;
        else
          v27 = 0;
        v6 = v74;
        v10 = v77;
        -[HMFMessageDispatcher sendMessage:completionHandler:](v27, "sendMessage:completionHandler:", v25, 0, v74);
        if ((objc_msgSend(v6, "networkRouterSupport") & 8) != 0)
        {
          objc_msgSend(v77, "wiFiUniquePreSharedKey");
          v68 = (void *)objc_claimAutoreleasedReturnValue();

          if (v68)
          {
            v69 = [HMDAccessoryNetworkCredential alloc];
            objc_msgSend(v77, "networkRouterUUID");
            v70 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v77, "networkClientIdentifier");
            v71 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v77, "wiFiUniquePreSharedKey");
            v72 = (void *)objc_claimAutoreleasedReturnValue();
            v73 = -[HMDAccessoryNetworkCredential initWithNetworkRouterUUID:clientIdentifier:wiFiPSK:](v69, "initWithNetworkRouterUUID:clientIdentifier:wiFiPSK:", v70, v71, v72);

            v10 = v77;
            v6 = v75;
            -[HMDHomeReprovisionHandler _reprovisionAccessory:networkCredential:requestMessage:](v13, v77, v73, v4);

          }
          else
          {
            v80[0] = MEMORY[0x24BDAC760];
            v80[1] = 3221225472;
            v80[2] = __57__HMDHomeReprovisionHandler__handleReprovisionAccessory___block_invoke;
            v80[3] = &unk_24E785770;
            v80[4] = v13;
            v81 = v77;
            v82 = v4;
            objc_msgSend(v6, "_createUniquePSKClientConfigurationWithRequestMessage:pairingEvent:completion:", v82, 0, v80);

          }
        }
        else
        {
          -[HMDHomeReprovisionHandler _reprovisionAccessory:networkCredential:requestMessage:](v13, v77, 0, v4);
        }
        goto LABEL_41;
      }
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "name");
        v64 = v10;
        v65 = v6;
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v84 = v63;
        v85 = 2112;
        v86 = v66;
        _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@Reprovision accessory failed since the accessory: %@ is not paired", buf, 0x16u);

        v6 = v65;
        v10 = v64;

      }
      objc_autoreleasePoolPop(v12);
      objc_msgSend(v4, "responseHandler");
      v67 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v67)
        goto LABEL_42;
      objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:description:reason:suggestion:underlyingError:", 10, CFSTR("Accessory not paired"), 0, 0, 0);
      v42 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v37 = (void *)MEMORY[0x227676638]();
      v38 = self;
      HMFGetOSLogHandle();
      v39 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v84 = v40;
        v85 = 2112;
        v86 = v5;
        _os_log_impl(&dword_2218F0000, v39, OS_LOG_TYPE_ERROR, "%{public}@Failed to find accessory with UUID: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v37);
      objc_msgSend(v4, "responseHandler");
      v41 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v41)
        goto LABEL_42;
      objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 2);
      v42 = objc_claimAutoreleasedReturnValue();
    }
    v19 = (void *)v42;
    objc_msgSend(v4, "responseHandler");
    v25 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, _QWORD))v25)[2](v25, v19, 0);
LABEL_41:

LABEL_42:
    v36 = (void (**)(_QWORD, _QWORD, _QWORD))v79;
LABEL_43:

    goto LABEL_44;
  }
  objc_msgSend(v4, "responseHandler");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (v28)
  {
    objc_msgSend(v4, "responseHandler");
    v5 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 48);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, _QWORD))v5)[2](v5, v29, 0);

LABEL_44:
  }

}

- (void)handleFoundAccessoryNeedingReprovisioning:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMDHomeReprovisionHandler *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (!objc_msgSend(v6, "accessoryReprovisionState"))
  {
    v8 = (void *)MEMORY[0x227676638]();
    v9 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "name");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138543618;
      v17 = v11;
      v18 = 2112;
      v19 = v12;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Accessory %@ reprovision state is updated to Required", (uint8_t *)&v16, 0x16u);

    }
    objc_autoreleasePoolPop(v8);
    objc_msgSend(v6, "setAccessoryReprovisionState:", 1);
    -[HMDHomeReprovisionHandler home]((id *)&v9->super.super.isa);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "homeManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "uuid");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "updateGenerationCounterWithReason:sourceUUID:shouldNotifyClients:", CFSTR("ReprovisionRequired"), v15, 0);

    -[HMDHomeReprovisionHandler _reportAccessoryNeedingReprovision:error:]((id *)&v9->super.super.isa, v6, v7);
  }

}

- (void)handleReprovionedAccessory:(id)a3 identifier:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  NSMutableDictionary *pendingReprovisionRequests;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSMutableDictionary *v18;
  void *v19;
  NSMutableDictionary *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  HMFMessageDispatcher *msgDispatcher;
  id v36;

  v36 = a3;
  v8 = a4;
  v9 = a5;
  if (self)
    pendingReprovisionRequests = self->_pendingReprovisionRequests;
  else
    pendingReprovisionRequests = 0;
  -[NSMutableDictionary valueForKey:](pendingReprovisionRequests, "valueForKey:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v36, "setAccessoryReprovisionState:", 0);
    -[HMDHomeReprovisionHandler home]((id *)&self->super.super.isa);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "homeManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "uuid");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "updateGenerationCounterWithReason:sourceUUID:shouldNotifyClients:", CFSTR("ReprovisionNotRequired"), v14, 0);

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "uuid");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "UUIDString");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v17, CFSTR("kAccessoryUUID"));

    if (self)
      v18 = self->_pendingReprovisionRequests;
    else
      v18 = 0;
    -[NSMutableDictionary objectForKey:](v18, "objectForKey:", v8);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (self)
      v20 = self->_pendingReprovisionRequests;
    else
      v20 = 0;
    -[NSMutableDictionary removeObjectForKey:](v20, "removeObjectForKey:", v8);
    if (v9)
    {
      objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", v9, 1, 0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (v21)
        objc_msgSend(v15, "setObject:forKeyedSubscript:", v21, CFSTR("kPairedAccessoryErrorDataKey"));
    }
    else
    {
      objc_msgSend(v19, "networkCredential");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "wiFiPSK");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "networkCredential");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "wiFiPSK");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      if (v25)
        v26 = 3;
      else
        v26 = 2;
      objc_msgSend(v36, "saveWiFiUniquePreSharedKey:credentialType:", v23, v26);

      objc_msgSend(v19, "networkCredential");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "clientIdentifier");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "networkCredential");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "networkRouterUUID");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "saveNetworkClientIdentifier:networkRouterUUID:clearProfileFingerprint:", v27, v29, 1);

    }
    v30 = (void *)MEMORY[0x24BE3F1B0];
    v31 = *MEMORY[0x24BDD7BD0];
    objc_msgSend(v19, "messageIdentifier");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "entitledMessageWithName:identifier:messagePayload:", v31, v32, v15);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    -[HMDHomeReprovisionHandler messageDestination](self);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setDestination:", v34);

    if (self)
      msgDispatcher = self->_msgDispatcher;
    else
      msgDispatcher = 0;
    -[HMFMessageDispatcher sendMessage:completionHandler:](msgDispatcher, "sendMessage:completionHandler:", v33, 0);

  }
}

- (void)timerDidFire:(id)a3
{
  HMFTimer *v4;
  void *v5;
  HMDHomeReprovisionHandler *v6;
  NSObject *v7;
  void *v8;
  id WeakRetained;
  void *v10;
  HMDHomeReprovisionHandler *v11;
  NSObject *v12;
  void *v13;
  HMFTimer *disableReprovisionBrowsingTimer;
  HMFTimer *v15;
  HMFTimer *v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  HMFTimer *v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v16 = (HMFTimer *)a3;
  if (!self)
  {
    dispatch_assert_queue_V2(0);
LABEL_10:
    v4 = v16;
    goto LABEL_11;
  }
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  v4 = v16;
  if (self->_disableReprovisionBrowsingTimer == v16)
  {
    v5 = (void *)MEMORY[0x227676638]();
    v6 = self;
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v18 = v8;
      _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Disable reprovision browsing timer fired", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v5);
    if (v6->_reprovisionBrowsingPending)
    {
      v6->_reprovisionBrowsingPending = 0;
      v6->_reprovisionBrowsingAllowed = 0;
      WeakRetained = objc_loadWeakRetained((id *)&v6->_accessoryBrowser);
      objc_msgSend(WeakRetained, "startDiscoveringAccessoriesNeedingReprovisioning");

      v10 = (void *)MEMORY[0x227676638](-[HMFTimer resume](v6->_disableReprovisionBrowsingTimer, "resume"));
      v11 = v6;
      HMFGetOSLogHandle();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        disableReprovisionBrowsingTimer = v11->_disableReprovisionBrowsingTimer;
        *(_DWORD *)buf = 138543874;
        v18 = v13;
        v19 = 2048;
        v20 = disableReprovisionBrowsingTimer;
        v21 = 2048;
        v22 = disableReprivsionBrowsingPeriodInMinutes;
        _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_INFO, "%{public}@Resumed disable reprovision browsing timer %p for %f sec", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v10);
    }
    else
    {
      v6->_reprovisionBrowsingAllowed = 1;
      -[HMFTimer suspend](v6->_disableReprovisionBrowsingTimer, "suspend");
      v15 = v6->_disableReprovisionBrowsingTimer;
      v6->_disableReprovisionBrowsingTimer = 0;

    }
    goto LABEL_10;
  }
LABEL_11:

}

- (NSUUID)messageTargetUUID
{
  void *v2;
  void *v3;

  -[HMDHomeReprovisionHandler home]((id *)&self->super.super.isa);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSUUID *)v3;
}

- (OS_dispatch_queue)messageReceiveQueue
{
  if (self)
    self = (HMDHomeReprovisionHandler *)self->_workQueue;
  return (OS_dispatch_queue *)self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingReprovisionRequests, 0);
  objc_storeStrong((id *)&self->_disableReprovisionBrowsingTimer, 0);
  objc_destroyWeak((id *)&self->_accessoryBrowser);
  objc_destroyWeak((id *)&self->_home);
  objc_storeStrong((id *)&self->_msgDispatcher, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
}

- (id)home
{
  if (WeakRetained)
    WeakRetained = (id *)objc_loadWeakRetained(WeakRetained + 4);
  return WeakRetained;
}

- (id)messageDestination
{
  id v1;
  id v2;
  void *v3;

  v1 = a1;
  if (a1)
  {
    v2 = objc_alloc(MEMORY[0x24BE3F1B8]);
    objc_msgSend(v1, "messageTargetUUID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v1 = (id)objc_msgSend(v2, "initWithTarget:", v3);

  }
  return v1;
}

- (void)_reportAccessoryNeedingReprovision:(void *)a3 error:
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;

  v5 = a3;
  if (a1)
  {
    v6 = (void *)MEMORY[0x24BDBCED8];
    v16 = v5;
    v7 = a2;
    objc_msgSend(v6, "dictionary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "uuid");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "UUIDString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v10, CFSTR("kAccessoryUUID"));

    objc_msgSend(v8, "setObject:forKeyedSubscript:", &unk_24E96B5E8, *MEMORY[0x24BDD7BD8]);
    if (v16)
    {
      objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", v16, 1, 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
        objc_msgSend(v8, "setObject:forKeyedSubscript:", v11, CFSTR("kPairedAccessoryErrorDataKey"));

    }
    v12 = (void *)MEMORY[0x24BE3F1D0];
    v13 = *MEMORY[0x24BDD7BC8];
    -[HMDHomeReprovisionHandler messageDestination](a1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "messageWithName:destination:payload:", v13, v14, v8);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1[3], "sendMessage:completionHandler:", v15, 0);
    v5 = v16;
  }

}

- (void)_reprovisionAccessory:(void *)a3 networkCredential:(void *)a4 requestMessage:
{
  id v7;
  id v8;
  void *v9;
  id *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  HMDHomeReprovisioningPendingInformation *v14;
  void *v15;
  HMDHomeReprovisioningPendingInformation *v16;
  id v17;
  void *v18;
  id WeakRetained;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  _QWORD v26[4];
  id v27;
  id v28;
  id v29;
  id v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  v25 = a4;
  if (a1)
  {
    v9 = (void *)MEMORY[0x227676638]();
    v10 = a1;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "identifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v32 = v12;
      v33 = 2112;
      v34 = v13;
      _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_INFO, "%{public}@Storing reprovison request message identifier for accessory with identifier: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v9);
    v14 = [HMDHomeReprovisioningPendingInformation alloc];
    objc_msgSend(v25, "identifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[HMDHomeReprovisioningPendingInformation initWithMessageUUID:networkCredential:](v14, "initWithMessageUUID:networkCredential:", v15, v8);

    v17 = v10[7];
    objc_msgSend(v7, "identifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setObject:forKey:", v16, v18);

    objc_initWeak((id *)buf, v10);
    WeakRetained = objc_loadWeakRetained(v10 + 5);
    objc_msgSend(v7, "identifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "wiFiPSK");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "home");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "homeLocationHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "isoCountryCode");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = MEMORY[0x24BDAC760];
    v26[1] = 3221225472;
    v26[2] = __84__HMDHomeReprovisionHandler__reprovisionAccessory_networkCredential_requestMessage___block_invoke;
    v26[3] = &unk_24E791130;
    objc_copyWeak(&v30, (id *)buf);
    v27 = v25;
    v28 = v7;
    v29 = v8;
    objc_msgSend(WeakRetained, "reprovisionAccessoryWithIdentifier:wiFiPSK:countryCode:withCompletion:", v20, v21, v24, v26);

    objc_destroyWeak(&v30);
    objc_destroyWeak((id *)buf);

  }
}

void __57__HMDHomeReprovisionHandler__handleReprovisionAccessory___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD block[4];
  id v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  v8 = *(_QWORD *)(a1 + 32);
  if (v8)
    v9 = *(NSObject **)(v8 + 16);
  else
    v9 = 0;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __57__HMDHomeReprovisionHandler__handleReprovisionAccessory___block_invoke_2;
  block[3] = &unk_24E79AD20;
  v13 = v6;
  v14 = v8;
  v15 = *(id *)(a1 + 40);
  v16 = *(id *)(a1 + 48);
  v17 = v5;
  v10 = v5;
  v11 = v7;
  dispatch_async(v9, block);

}

void __57__HMDHomeReprovisionHandler__handleReprovisionAccessory___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  void *v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  if (*(_QWORD *)(a1 + 32))
  {
    v2 = (void *)MEMORY[0x227676638]();
    v3 = *(id *)(a1 + 40);
    HMFGetOSLogHandle();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = *(_QWORD *)(a1 + 48);
      v7 = *(_QWORD *)(a1 + 32);
      v8 = 138543874;
      v9 = v5;
      v10 = 2112;
      v11 = v6;
      v12 = 2112;
      v13 = v7;
      _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_ERROR, "%{public}@Failed to generate WiFi credential for accessory %@ with error: %@", (uint8_t *)&v8, 0x20u);

    }
    objc_autoreleasePoolPop(v2);
    objc_msgSend(*(id *)(a1 + 56), "respondWithError:", *(_QWORD *)(a1 + 32));
  }
  else
  {
    -[HMDHomeReprovisionHandler _reprovisionAccessory:networkCredential:requestMessage:](*(void **)(a1 + 40), *(void **)(a1 + 48), *(void **)(a1 + 64), *(void **)(a1 + 56));
  }
}

void __84__HMDHomeReprovisionHandler__reprovisionAccessory_networkCredential_requestMessage___block_invoke(id *a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  _QWORD *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  _QWORD *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void (**v35)(_QWORD, _QWORD, _QWORD);
  int v36;
  void *v37;
  __int16 v38;
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(a1 + 7);
  objc_msgSend(a1[4], "responseHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    if (v3)
    {
      v6 = (void *)MEMORY[0x227676638]();
      v7 = WeakRetained;
      HMFGetOSLogHandle();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1[5], "identifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = 138543618;
        v37 = v9;
        v38 = 2112;
        v39 = v10;
        _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_ERROR, "%{public}@Failed to reprovision accessory with identifier: %@", (uint8_t *)&v36, 0x16u);

      }
      objc_autoreleasePoolPop(v6);
      if (v7)
        v11 = (void *)v7[7];
      else
        v11 = 0;
      v12 = a1[5];
      v13 = v11;
      objc_msgSend(v12, "identifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "removeObjectForKey:", v14);

      v15 = (void *)MEMORY[0x227676638]();
      v16 = v7;
      HMFGetOSLogHandle();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1[5], "name");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = 138543618;
        v37 = v18;
        v38 = 2112;
        v39 = v19;
        _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_INFO, "%{public}@Accessory %@ reprovision state is updated to NotRequired", (uint8_t *)&v36, 0x16u);

      }
      objc_autoreleasePoolPop(v15);
      objc_msgSend(a1[5], "setAccessoryReprovisionState:", 0);
      -[HMDHomeReprovisionHandler home]((id *)v16);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "homeManager");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[5], "uuid");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "updateGenerationCounterWithReason:sourceUUID:shouldNotifyClients:", CFSTR("ReprovisionErrored"), v22, 0);

      objc_msgSend(a1[6], "clientIdentifier");
      v23 = objc_claimAutoreleasedReturnValue();
      if (v23)
      {
        v24 = (void *)v23;
        objc_msgSend(a1[5], "networkClientIdentifier");
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v25)
        {
          objc_msgSend(a1[6], "clientIdentifier");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "_removeClientConfigurationWithIdentifier:", v26);

        }
      }
      objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[5], "uuid");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "UUIDString");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "setObject:forKeyedSubscript:", v29, CFSTR("kAccessoryUUID"));

      objc_msgSend(v27, "setObject:forKeyedSubscript:", &unk_24E96B5D0, *MEMORY[0x24BDD7BD8]);
      v30 = (void *)MEMORY[0x24BE3F1D0];
      v31 = *MEMORY[0x24BDD7BC8];
      -[HMDHomeReprovisionHandler messageDestination](v16);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "messageWithName:destination:payload:", v31, v32, v27);
      v33 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7)
        v34 = (void *)v16[3];
      else
        v34 = 0;
      objc_msgSend(v34, "sendMessage:completionHandler:", v33, 0);

    }
    objc_msgSend(a1[4], "responseHandler");
    v35 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id, _QWORD))v35)[2](v35, v3, 0);

  }
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t1_117924 != -1)
    dispatch_once(&logCategory__hmf_once_t1_117924, &__block_literal_global_117925);
  return (id)logCategory__hmf_once_v2_117926;
}

+ (BOOL)hasMessageReceiverChildren
{
  return 0;
}

void __40__HMDHomeReprovisionHandler_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v2_117926;
  logCategory__hmf_once_v2_117926 = v0;

}

@end
