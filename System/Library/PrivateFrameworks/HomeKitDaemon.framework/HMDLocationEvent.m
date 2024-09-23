@implementation HMDLocationEvent

- (HMDLocationEvent)initWithModel:(id)a3 home:(id)a4
{
  id v6;
  id v7;
  HMDLocationEvent *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  id v13;
  CLRegion *region;
  void *v15;
  HMDLocationEvent *v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  NSUUID *userUUID;
  id v22;
  objc_super v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v23.receiver = self;
  v23.super_class = (Class)HMDLocationEvent;
  v8 = -[HMDEvent initWithModel:home:](&v23, sel_initWithModel_home_, v6, v7);
  if (v8)
  {
    v9 = (void *)MEMORY[0x24BDD1620];
    v10 = objc_opt_class();
    objc_msgSend(v6, "region");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 0;
    objc_msgSend(v9, "unarchivedObjectOfClass:fromData:error:", v10, v11, &v22);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = v22;
    region = v8->_region;
    v8->_region = (CLRegion *)v12;

    if (!v8->_region)
    {
      v15 = (void *)MEMORY[0x227676638]();
      v16 = v8;
      HMFGetOSLogHandle();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v25 = v18;
        v26 = 2112;
        v27 = v13;
        _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_ERROR, "%{public}@Failed to unarchive region from object model's region: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v15);
    }
    objc_msgSend(v6, "userUUID");
    v19 = objc_claimAutoreleasedReturnValue();
    userUUID = v8->_userUUID;
    v8->_userUUID = (NSUUID *)v19;

  }
  return v8;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v9.receiver = self;
  v9.super_class = (Class)HMDLocationEvent;
  -[HMDEvent description](&v9, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDLocationEvent region](self, "region");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  regionAsString(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@, %@"), v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (BOOL)isActive
{
  return ((-[HMDEvent activationType](self, "activationType") - 1) & 0xFFFFFFFFFFFFFFFDLL) == 0;
}

- (id)emptyModelObject
{
  HMDLocationEventModel *v3;
  void *v4;
  void *v5;
  void *v6;
  HMDLocationEventModel *v7;

  v3 = [HMDLocationEventModel alloc];
  -[HMDEvent uuid](self, "uuid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDEvent eventTrigger](self, "eventTrigger");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HMDBackingStoreModelObject initWithObjectChangeType:uuid:parentUUID:](v3, "initWithObjectChangeType:uuid:parentUUID:", 2, v4, v6);

  return v7;
}

- (void)_registerForMessages
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[5];
  objc_super v15;
  _QWORD v16[3];
  _QWORD v17[3];

  v17[2] = *MEMORY[0x24BDAC8D0];
  v15.receiver = self;
  v15.super_class = (Class)HMDLocationEvent;
  -[HMDEvent _registerForMessages](&v15, sel__registerForMessages);
  -[HMDEvent home](self, "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDUserMessagePolicy userMessagePolicyWithHome:userPrivilege:remoteAccessRequired:](HMDUserMessagePolicy, "userMessagePolicyWithHome:userPrivilege:remoteAccessRequired:", v3, 0, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMDEvent msgDispatcher](self, "msgDispatcher");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDXPCMessagePolicy policyWithEntitlements:](HMDXPCMessagePolicy, "policyWithEntitlements:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v6;
  v17[1] = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v17, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "registerForMessage:receiver:policies:selector:", CFSTR("kRetrieveLocationEventRequestKey"), self, v7, sel__handleRetrieveLocationEventForEventTrigger_);

  -[HMDEvent msgDispatcher](self, "msgDispatcher");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDXPCMessagePolicy policyWithEntitlements:](HMDXPCMessagePolicy, "policyWithEntitlements:", 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v9;
  v16[1] = v4;
  +[HMDRemoteMessagePolicy defaultSecurePrimaryResidentPolicy](HMDRemoteMessagePolicy, "defaultSecurePrimaryResidentPolicy");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16[2] = v10;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v16, 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "registerForMessage:receiver:policies:selector:", CFSTR("kLocationEventOccuredRequestKey"), self, v11, sel__handleLocationEventOccured_);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addObserver:selector:name:object:", self, sel_fmfStatusUpdateNotification_, CFSTR("HMDFMFStatusUpdateNotification"), 0);

  +[HMDFMFHandler sharedHandler](HMDFMFHandler, "sharedHandler");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __40__HMDLocationEvent__registerForMessages__block_invoke;
  v14[3] = &unk_24E777A48;
  v14[4] = self;
  objc_msgSend(v13, "queryFMFStatusWithCompletion:", v14);

}

- (void)fmfStatusUpdateNotification:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  HMDLocationEvent *v9;

  v4 = a3;
  -[HMDEvent workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __48__HMDLocationEvent_fmfStatusUpdateNotification___block_invoke;
  v7[3] = &unk_24E79C268;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (BOOL)doesThisTargetCurrentUser
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  HMDLocationEvent *v10;
  NSObject *v11;
  void *v12;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  -[HMDEvent eventTrigger](self, "eventTrigger");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "home");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDLocationEvent userUUID](self, "userUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "userWithUUID:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "currentUser");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isEqual:", v7);
  if ((v8 & 1) == 0)
  {
    v9 = (void *)MEMORY[0x227676638]();
    v10 = self;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543874;
      v15 = v12;
      v16 = 2112;
      v17 = v6;
      v18 = 2112;
      v19 = v7;
      _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_INFO, "%{public}@Not taking the ownership since this trigger belongs to user %@, this device's user %@", (uint8_t *)&v14, 0x20u);

    }
    objc_autoreleasePoolPop(v9);
  }

  return v8;
}

- (void)checkFMFStatus:(id)a3
{
  id v4;
  void *v5;
  HMDLocationEvent *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x227676638]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543618;
    v11 = v8;
    v12 = 2112;
    v13 = v4;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Checking the ownership with fmfStatus %@", (uint8_t *)&v10, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  if (-[HMDLocationEvent doesThisTargetCurrentUser](v6, "doesThisTargetCurrentUser") && objc_msgSend(v4, "value") == 2)
  {
    -[HMDEvent eventTrigger](v6, "eventTrigger");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "takeOverOwnershipOfTrigger");

  }
}

- (void)_handleUpdateRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  HMDLocationEvent *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  HMDLocationEvent *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  HMDLocationEvent *v28;
  NSObject *v29;
  void *v30;
  id v31;
  _QWORD v32[4];
  id v33;
  id v34;
  id v35;
  uint8_t buf[4];
  void *v37;
  __int16 v38;
  id v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if ((objc_msgSend(v4, "isAuthorizedForLocationAccess") & 1) != 0)
  {
    objc_msgSend(v4, "dataForKey:", CFSTR("kLocationEventRegionKey"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = 0;
    objc_msgSend(MEMORY[0x24BDD1620], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v5, &v35);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v35;
    if (v6)
    {
      if ((HMIsValidRegion() & 1) != 0)
      {
        -[HMDLocationEvent emptyModelObject](self, "emptyModelObject");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        encodeRootObject();
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setRegion:", v9);

        -[HMDEvent eventTrigger](self, "eventTrigger");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "home");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "backingStore");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "name");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        +[HMDBackingStoreTransactionOptions defaultXPCOptions](HMDBackingStoreTransactionOptions, "defaultXPCOptions");
        v31 = v7;
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "transaction:options:", v13, v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v15, "add:", v8);
        v32[0] = MEMORY[0x24BDAC760];
        v32[1] = 3221225472;
        v32[2] = __41__HMDLocationEvent__handleUpdateRequest___block_invoke;
        v32[3] = &unk_24E79BCC8;
        v33 = v4;
        v34 = v8;
        v16 = v8;
        objc_msgSend(v15, "run:", v32);

        v7 = v31;
LABEL_15:

        goto LABEL_16;
      }
      v27 = (void *)MEMORY[0x227676638]();
      v28 = self;
      HMFGetOSLogHandle();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v37 = v30;
        _os_log_impl(&dword_2218F0000, v29, OS_LOG_TYPE_ERROR, "%{public}@Cannot handle update request as provided region is not valid", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v27);
      v25 = (void *)MEMORY[0x24BDD1540];
      v26 = 3;
    }
    else
    {
      v21 = (void *)MEMORY[0x227676638]();
      v22 = self;
      HMFGetOSLogHandle();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v37 = v24;
        v38 = 2112;
        v39 = v7;
        _os_log_impl(&dword_2218F0000, v23, OS_LOG_TYPE_ERROR, "%{public}@Failed to unarchive region from region data: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v21);
      v25 = (void *)MEMORY[0x24BDD1540];
      v26 = 20;
    }
    objc_msgSend(v25, "hmErrorWithCode:", v26);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "respondWithError:", v15);
    goto LABEL_15;
  }
  v17 = (void *)MEMORY[0x227676638]();
  v18 = self;
  HMFGetOSLogHandle();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v37 = v20;
    _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_ERROR, "%{public}@Cannot handle update request as the client is not authorized for location services", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v17);
  objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 85);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "respondWithError:", v5);
LABEL_16:

}

- (void)_handleRetrieveLocationEventForEventTrigger:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  int v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if ((objc_msgSend(v4, "isAuthorizedForLocationAccess") & 1) != 0)
  {
    objc_msgSend(v4, "proxyConnection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "processInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "locationAuthorization");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "mark");

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDLocationEvent region](self, "region");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    encodeRootObject();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v10, CFSTR("kLocationEventRegionKey"));

    -[HMDEvent eventTrigger](self, "eventTrigger");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "mostRecentFireDate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      objc_msgSend(v11, "mostRecentFireDate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v13, CFSTR("kTriggerLastFireDateKey"));

    }
    objc_msgSend(v4, "respondWithPayload:", v8);

  }
  else
  {
    v14 = (void *)MEMORY[0x227676638]();
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138543362;
      v18 = v16;
      _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_ERROR, "%{public}@Client does not have authorization to location", (uint8_t *)&v17, 0xCu);

    }
    objc_autoreleasePoolPop(v14);
    objc_msgSend(v4, "respondWithPayload:", 0);
  }

}

- (id)dumpState
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)HMDLocationEvent;
  -[HMDEvent dumpState](&v13, sel_dumpState);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  v5 = (void *)MEMORY[0x24BDD17C8];
  -[HMDLocationEvent region](self, "region");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDLocationEvent region](self, "region");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "notifyOnEntry");
  HMFBooleanToString();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDLocationEvent region](self, "region");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "notifyOnExit");
  HMFBooleanToString();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("Region: %@, Entry: %@, Exit: %@"), v6, v8, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setObject:forKeyedSubscript:", v11, *MEMORY[0x24BE3EAF8]);
  return v4;
}

- (CLRegion)uniqueRegion
{
  void *v3;
  HMDLocationEvent *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  uint64_t v23;
  void *v24;
  HMDLocationEvent *v25;
  NSObject *v26;
  void *v27;
  const char *v28;
  char isKindOfClass;
  uint64_t v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  NSObject *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  id v45;
  uint64_t v46;
  uint8_t buf[4];
  void *v49;
  __int16 v50;
  uint64_t v51;
  __int16 v52;
  void *v53;
  uint64_t v54;

  v54 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x227676638](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDLocationEvent region](v4, "region");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v49 = v6;
    v50 = 2112;
    v51 = (uint64_t)v7;
    _os_log_impl(&dword_2218F0000, v5, OS_LOG_TYPE_INFO, "%{public}@unique region %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v3);
  v8 = (void *)MEMORY[0x24BDD17C8];
  -[HMDLocationEvent region](v4, "region");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDEvent uuid](v4, "uuid");
  v11 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v11, "UUIDString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("%@-%@"), v10, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMDLocationEvent region](v4, "region");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  LOBYTE(v11) = objc_opt_isKindOfClass();

  -[HMDLocationEvent region](v4, "region");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v11 & 1) != 0)
  {
    v16 = objc_alloc(MEMORY[0x24BDBFA50]);
    objc_msgSend(v15, "center");
    v18 = v17;
    v20 = v19;
    objc_msgSend(v15, "radius");
    v22 = (void *)objc_msgSend(v16, "initWithCenter:radius:identifier:nearbyAllowed:", v13, 1, v18, v20, v21);
    objc_msgSend(v22, "setNotifyOnExit:", objc_msgSend(v15, "notifyOnExit"));
    objc_msgSend(v22, "setNotifyOnEntry:", objc_msgSend(v15, "notifyOnEntry"));
    v23 = objc_msgSend(v22, "setReferenceFrame:", objc_msgSend(v15, "referenceFrame"));
    if (!v22)
    {
      v24 = (void *)MEMORY[0x227676638](v23);
      v25 = v4;
      HMFGetOSLogHandle();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v49 = v27;
        v50 = 2112;
        v51 = (uint64_t)v15;
        v28 = "%{public}@Error getting circle region for unique region, %@";
LABEL_21:
        _os_log_impl(&dword_2218F0000, v26, OS_LOG_TYPE_ERROR, v28, buf, 0x16u);

        goto LABEL_22;
      }
      goto LABEL_22;
    }
    goto LABEL_23;
  }
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[HMDLocationEvent region](v4, "region");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "major");
    v30 = objc_claimAutoreleasedReturnValue();
    if (v30
      && (v31 = (void *)v30,
          objc_msgSend(v15, "minor"),
          v32 = (void *)objc_claimAutoreleasedReturnValue(),
          v32,
          v31,
          v32))
    {
      v33 = objc_alloc(MEMORY[0x24BDBFA40]);
      objc_msgSend(v15, "proximityUUID");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "major");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = objc_msgSend(v35, "unsignedShortValue");
      objc_msgSend(v15, "minor");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = (void *)objc_msgSend(v33, "initWithProximityUUID:major:minor:identifier:", v34, v36, objc_msgSend(v37, "unsignedShortValue"), v13);

    }
    else
    {
      objc_msgSend(v15, "major");
      v44 = (void *)objc_claimAutoreleasedReturnValue();

      v45 = objc_alloc(MEMORY[0x24BDBFA40]);
      objc_msgSend(v15, "proximityUUID");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v44)
      {
        v22 = (void *)objc_msgSend(v45, "initWithProximityUUID:identifier:", v34, v13);
LABEL_18:

        objc_msgSend(v22, "setNotifyOnExit:", objc_msgSend(v15, "notifyOnExit"));
        v46 = objc_msgSend(v22, "setNotifyOnEntry:", objc_msgSend(v15, "notifyOnEntry"));
        if (!v22)
        {
          v24 = (void *)MEMORY[0x227676638](v46);
          v25 = v4;
          HMFGetOSLogHandle();
          v26 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v49 = v27;
            v50 = 2112;
            v51 = (uint64_t)v15;
            v28 = "%{public}@Error getting beacon region for unique region, %@";
            goto LABEL_21;
          }
LABEL_22:

          objc_autoreleasePoolPop(v24);
        }
LABEL_23:

        goto LABEL_24;
      }
      objc_msgSend(v15, "major");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = (void *)objc_msgSend(v45, "initWithProximityUUID:major:identifier:", v34, objc_msgSend(v35, "unsignedShortValue"), v13);
    }

    goto LABEL_18;
  }
  v38 = (void *)MEMORY[0x227676638]();
  HMFGetOSLogHandle();
  v39 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDLocationEvent region](v4, "region");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = objc_opt_class();
    -[HMDLocationEvent region](v4, "region");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v49 = v40;
    v50 = 2112;
    v51 = v42;
    v52 = 2112;
    v53 = v43;
    _os_log_impl(&dword_2218F0000, v39, OS_LOG_TYPE_ERROR, "%{public}@Cannot create unique region for region of unsupported class %@: %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v38);
  v22 = 0;
LABEL_24:

  return (CLRegion *)v22;
}

- (id)createPayload
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v3 = (void *)MEMORY[0x24BDBCED8];
  v10.receiver = self;
  v10.super_class = (Class)HMDLocationEvent;
  -[HMDEvent createPayload](&v10, sel_createPayload);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dictionaryWithDictionary:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMDLocationEvent region](self, "region");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  encodeRootObject();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, CFSTR("kLocationEventRegionKey"));

  v8 = (void *)objc_msgSend(v5, "copy");
  return v8;
}

- (BOOL)isCompatibleWithEvent:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HMDLocationEvent;
  return -[HMDEvent isCompatibleWithEvent:](&v4, sel_isCompatibleWithEvent_, a3);
}

- (HMDLocationEvent)initWithCoder:(id)a3
{
  id v4;
  HMDLocationEvent *v5;
  uint64_t v6;
  CLRegion *region;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMDLocationEvent;
  v5 = -[HMDEvent initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HM.locationEventRegion"));
    v6 = objc_claimAutoreleasedReturnValue();
    region = v5->_region;
    v5->_region = (CLRegion *)v6;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)HMDLocationEvent;
  -[HMDEvent encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  if (objc_msgSend(v4, "hmd_isForXPCTransport")
    && (objc_msgSend(v4, "hmd_isForXPCTransportAuthorizedForLocationAccess") & 1) != 0
    || (objc_msgSend(v4, "hmd_isForLocalStore") & 1) != 0
    || objc_msgSend(v4, "hmd_isForRemoteTransport")
    && !objc_msgSend(v4, "hmd_isForRemoteTransportOnSameAccount")
    || objc_msgSend(v4, "hmd_isForRemoteTransportOnSameAccount")
    && (objc_msgSend(v4, "hmd_isForRemoteGatewayCoder") & 1) == 0)
  {
    -[HMDLocationEvent region](self, "region");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("HM.locationEventRegion"));

  }
}

- (id)modelObjectWithChangeType:(unint64_t)a3
{
  HMDLocationEventModel *v5;
  void *v6;
  void *v7;
  void *v8;
  HMDLocationEventModel *v9;
  void *v10;
  void *v11;
  void *v12;

  v5 = [HMDLocationEventModel alloc];
  -[HMDEvent uuid](self, "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDEvent eventTrigger](self, "eventTrigger");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "uuid");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[HMDBackingStoreModelObject initWithObjectChangeType:uuid:parentUUID:](v5, "initWithObjectChangeType:uuid:parentUUID:", a3, v6, v8);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[HMDEvent isEndEvent](self, "isEndEvent"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDLocationEventModel setEndEvent:](v9, "setEndEvent:", v10);

  -[HMDLocationEvent region](self, "region");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  encodeRootObject();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDLocationEventModel setRegion:](v9, "setRegion:", v12);

  return v9;
}

- (void)_transactionObjectUpdated:(id)a3 newValues:(id)a4 message:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  HMDLocationEvent *v12;
  NSObject *v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  char v27;
  void *v28;
  HMDLocationEvent *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  HMDLocationEvent *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  id v41;
  uint8_t buf[4];
  void *v43;
  __int16 v44;
  id v45;
  __int16 v46;
  void *v47;
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)MEMORY[0x227676638]();
  v12 = self;
  HMFGetOSLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v43 = v14;
    _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_ERROR, "%{public}@Handling transaction updated", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v11);
  v15 = v9;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v16 = v15;
  else
    v16 = 0;
  v17 = v16;

  if (v17)
  {
    -[HMDEvent eventTrigger](v12, "eventTrigger");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "name");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "isEqualToString:", CFSTR("kMigratedEventsToRecordsRequest"));

    if (v20)
    {
      objc_msgSend(v18, "processEventRecords:message:", v17, v10);
    }
    else
    {
      if (objc_msgSend(v17, "propertyWasSet:", CFSTR("region")))
      {
        v21 = (void *)MEMORY[0x24BDD1620];
        v22 = objc_opt_class();
        objc_msgSend(v17, "region");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = 0;
        objc_msgSend(v21, "unarchivedObjectOfClass:fromData:error:", v22, v23, &v41);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = v41;

        if (!v24)
        {
          v33 = (void *)MEMORY[0x227676638]();
          v34 = v12;
          HMFGetOSLogHandle();
          v35 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v43 = v36;
            v44 = 2112;
            v45 = v25;
            _os_log_impl(&dword_2218F0000, v35, OS_LOG_TYPE_ERROR, "%{public}@Failed to unarchive region from event model: %@", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v33);
          objc_msgSend(v10, "respondWithError:", v25);

          goto LABEL_17;
        }
        -[HMDLocationEvent region](v12, "region");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = objc_msgSend(v26, "isEqual:", v24);

        if ((v27 & 1) == 0)
        {
          v28 = (void *)MEMORY[0x227676638]();
          v29 = v12;
          HMFGetOSLogHandle();
          v30 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            -[HMDLocationEvent region](v29, "region");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            regionAsString(v37);
            v38 = v25;
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            regionAsString(v24);
            v39 = v28;
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v43 = v40;
            v44 = 2112;
            v45 = v31;
            v46 = 2112;
            v47 = v32;
            _os_log_impl(&dword_2218F0000, v30, OS_LOG_TYPE_INFO, "%{public}@Updating region %@ to new region %@", buf, 0x20u);

            v28 = v39;
            v25 = v38;

          }
          objc_autoreleasePoolPop(v28);
          -[HMDLocationEvent setRegion:](v29, "setRegion:", v24);
          objc_msgSend(v18, "markChangedForMessage:", v10);
        }

      }
      objc_msgSend(v10, "respondWithSuccess");
    }
LABEL_17:

  }
}

- (BOOL)_activate:(unint64_t)a3 completionHandler:(id)a4
{
  id v6;
  BOOL v7;
  uint64_t v8;
  void *v9;
  void *v10;
  _BOOL4 v11;
  void *v12;
  void *v13;
  objc_super v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v15.receiver = self;
  v15.super_class = (Class)HMDLocationEvent;
  v7 = -[HMDEvent _activate:completionHandler:](&v15, sel__activate_completionHandler_, a3, 0);
  -[HMDLocationEvent uniqueRegion](self, "uniqueRegion");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v8)
  {
    v16[0] = v8;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v16, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = (void *)MEMORY[0x24BDBD1A8];
  }
  v11 = -[HMDLocationEvent isActive](self, "isActive");
  +[HMDLocation sharedManager](HMDLocation, "sharedManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v11)
    objc_msgSend(v12, "registerForRegionUpdate:withDelegate:completionHandler:", v10, self, v6);
  else
    objc_msgSend(v12, "deregisterForRegionUpdate:completionHandler:", v10, v6);

  return v7;
}

- (void)locationEventOccured
{
  void *v3;
  HMDLocationEvent *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  HMDLocationEvent *v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  HMDEventTriggerDevice *v15;
  void *v16;
  void *v17;
  HMDEventTriggerDevice *v18;
  void *v19;
  id v20;
  int v21;
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x227676638](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    HMDEventTriggerActivationTypeAsString(-[HMDEvent activationType](v4, "activationType"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 138543618;
    v22 = v6;
    v23 = 2112;
    v24 = v7;
    _os_log_impl(&dword_2218F0000, v5, OS_LOG_TYPE_INFO, "%{public}@Received a callback that location event has occurred, current activation state: %@", (uint8_t *)&v21, 0x16u);

  }
  objc_autoreleasePoolPop(v3);
  +[HMDLostModeManager sharedManager](HMDLostModeManager, "sharedManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isLost");

  if (v9)
  {
    v10 = (void *)MEMORY[0x227676638]();
    v11 = v4;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 138543362;
      v22 = v13;
      _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_INFO, "%{public}@Device Lost. Not informing that location event has occurred", (uint8_t *)&v21, 0xCu);

    }
    objc_autoreleasePoolPop(v10);
  }
  else
  {
    v14 = -[HMDEvent activationType](v4, "activationType");
    if (v14 == 3)
    {
      v15 = [HMDEventTriggerDevice alloc];
      -[HMDEvent eventTrigger](v4, "eventTrigger");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "home");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = -[HMDEventTriggerDevice initWithCurrentDeviceForHome:](v15, "initWithCurrentDeviceForHome:", v17);

      -[HMDEvent delegate](v4, "delegate");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (id)objc_msgSend(v19, "didOccurEvent:causingDevice:", v4, v18);

    }
    else if (v14 == 1)
    {
      -[HMDLocationEvent informLocationEventOccuranceToResident](v4, "informLocationEventOccuranceToResident");
    }
  }
}

- (void)_handleLocationEventOccured:(id)a3
{
  id v4;
  void *v5;
  HMDLocationEvent *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  HMDEventTriggerDevice *v10;
  void *v11;
  void *v12;
  void *v13;
  HMDEventTriggerDevice *v14;
  void *v15;
  id v16;
  int v17;
  void *v18;
  __int16 v19;
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
    HMDEventTriggerActivationTypeAsString(-[HMDEvent activationType](v6, "activationType"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 138543618;
    v18 = v8;
    v19 = 2112;
    v20 = v9;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Received remote message that location event has occurred, with current activation type %@", (uint8_t *)&v17, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  if (-[HMDEvent activationType](v6, "activationType") == 2)
  {
    v10 = [HMDEventTriggerDevice alloc];
    objc_msgSend(v4, "remoteSourceDevice");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDEvent eventTrigger](v6, "eventTrigger");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "home");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[HMDEventTriggerDevice initWithDevice:forHome:](v10, "initWithDevice:forHome:", v11, v13);

    -[HMDEvent delegate](v6, "delegate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (id)objc_msgSend(v15, "didOccurEvent:causingDevice:", v6, v14);

  }
  objc_msgSend(v4, "respondWithPayload:", 0);

}

- (void)informLocationEventOccuranceToResident
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  HMDRemoteHomeMessageDestination *v7;
  void *v8;
  void *v9;
  HMDRemoteHomeMessageDestination *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  HMDLocationEvent *v15;
  NSObject *v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id location;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  -[HMDEvent eventTrigger](self, "eventTrigger");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "home");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "homeManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "messageDispatcher");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = [HMDRemoteHomeMessageDestination alloc];
  -[HMDEvent uuid](self, "uuid");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uuid");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[HMDRemoteHomeMessageDestination initWithTarget:homeUUID:](v7, "initWithTarget:homeUUID:", v8, v9);

  +[HMDRemoteMessage secureMessageWithName:qualityOfService:destination:messagePayload:](HMDRemoteMessage, "secureMessageWithName:qualityOfService:destination:messagePayload:", CFSTR("kLocationEventOccuredRequestKey"), 17, v10, MEMORY[0x24BDBD1B8]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "identifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __58__HMDLocationEvent_informLocationEventOccuranceToResident__block_invoke;
  v18[3] = &unk_24E798D90;
  objc_copyWeak(&v20, &location);
  v13 = v12;
  v19 = v13;
  v14 = (void *)MEMORY[0x227676638](objc_msgSend(v11, "setResponseHandler:", v18));
  v15 = self;
  HMFGetOSLogHandle();
  v16 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v23 = v17;
    v24 = 2114;
    v25 = v13;
    _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_INFO, "%{public}@Sending message with identifier %{public}@ to inform location event to resident", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v14);
  objc_msgSend(v6, "sendMessage:completionHandler:", v11, 0);

  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);

}

- (void)didEnterRegion:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HMDEvent workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __35__HMDLocationEvent_didEnterRegion___block_invoke;
  v7[3] = &unk_24E79C268;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)didExitRegion:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HMDEvent workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __34__HMDLocationEvent_didExitRegion___block_invoke;
  v7[3] = &unk_24E79C268;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (id)analyticsTriggerEventData
{
  HMDAnalyticsTriggerEventData *v3;
  HMDAnalyticsLocationEventData *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc_init(HMDAnalyticsTriggerEventData);
  -[HMDAnalyticsTriggerEventData setEndEvent:](v3, "setEndEvent:", -[HMDEvent isEndEvent](self, "isEndEvent"));
  v4 = objc_alloc_init(HMDAnalyticsLocationEventData);
  -[HMDLocationEvent region](self, "region");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAnalyticsLocationEventData setNotifyOnEntry:](v4, "setNotifyOnEntry:", objc_msgSend(v5, "notifyOnEntry"));

  -[HMDLocationEvent region](self, "region");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAnalyticsLocationEventData setNotifyOnExit:](v4, "setNotifyOnExit:", objc_msgSend(v6, "notifyOnExit"));

  -[HMDAnalyticsTriggerEventData setLocationEvent:](v3, "setLocationEvent:", v4);
  return v3;
}

- (CLRegion)region
{
  return self->_region;
}

- (void)setRegion:(id)a3
{
  objc_storeStrong((id *)&self->_region, a3);
}

- (NSUUID)userUUID
{
  return self->_userUUID;
}

- (void)setUserUUID:(id)a3
{
  objc_storeStrong((id *)&self->_userUUID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userUUID, 0);
  objc_storeStrong((id *)&self->_region, 0);
}

uint64_t __34__HMDLocationEvent_didExitRegion___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  int v8;
  void *v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x227676638]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 40);
    v8 = 138543618;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_INFO, "%{public}@Received a exit callback from HMDLocation for the region callback: [%@]", (uint8_t *)&v8, 0x16u);

  }
  objc_autoreleasePoolPop(v2);
  return objc_msgSend(*(id *)(a1 + 32), "locationEventOccured");
}

uint64_t __35__HMDLocationEvent_didEnterRegion___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  int v8;
  void *v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x227676638]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 40);
    v8 = 138543618;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_INFO, "%{public}@Received a enter callback from HMDLocation for the region callback : [%@]", (uint8_t *)&v8, 0x16u);

  }
  objc_autoreleasePoolPop(v2);
  return objc_msgSend(*(id *)(a1 + 32), "locationEventOccured");
}

void __58__HMDLocationEvent_informLocationEventOccuranceToResident__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  int v13;
  void *v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v8 = (void *)MEMORY[0x227676638]();
  v9 = WeakRetained;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = *(_QWORD *)(a1 + 32);
    v13 = 138543618;
    v14 = v11;
    v15 = 2112;
    v16 = v12;
    _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Message with identifier %@ to inform location event has been sent", (uint8_t *)&v13, 0x16u);

  }
  objc_autoreleasePoolPop(v8);

}

void __41__HMDLocationEvent__handleUpdateRequest___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  void *v4;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  v2 = *(void **)(a1 + 32);
  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "respondWithError:", a2);
  }
  else
  {
    v5 = CFSTR("kLocationEventRegionKey");
    objc_msgSend(*(id *)(a1 + 40), "region");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = v3;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "respondWithPayload:", v4);

  }
}

void __48__HMDLocationEvent_fmfStatusUpdateNotification___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDFMF fmfStatusWithDict:](HMDFMF, "fmfStatusWithDict:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x227676638]();
  v5 = *(id *)(a1 + 40);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543618;
    v9 = v7;
    v10 = 2112;
    v11 = v3;
    _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_INFO, "%{public}@Received FMF status update notification with %@", (uint8_t *)&v8, 0x16u);

  }
  objc_autoreleasePoolPop(v4);
  objc_msgSend(*(id *)(a1 + 40), "checkFMFStatus:", v3);

}

void __40__HMDLocationEvent__registerForMessages__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "workQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __40__HMDLocationEvent__registerForMessages__block_invoke_2;
  v6[3] = &unk_24E79C268;
  v6[4] = *(_QWORD *)(a1 + 32);
  v7 = v3;
  v5 = v3;
  dispatch_async(v4, v6);

}

uint64_t __40__HMDLocationEvent__registerForMessages__block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  int v8;
  void *v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x227676638]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 40);
    v8 = 138543618;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_INFO, "%{public}@FMF Device Status is %@", (uint8_t *)&v8, 0x16u);

  }
  objc_autoreleasePoolPop(v2);
  return objc_msgSend(*(id *)(a1 + 32), "checkFMFStatus:", *(_QWORD *)(a1 + 40));
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t1_18149 != -1)
    dispatch_once(&logCategory__hmf_once_t1_18149, &__block_literal_global_18150);
  return (id)logCategory__hmf_once_v2_18151;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

void __31__HMDLocationEvent_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v2_18151;
  logCategory__hmf_once_v2_18151 = v0;

}

@end
