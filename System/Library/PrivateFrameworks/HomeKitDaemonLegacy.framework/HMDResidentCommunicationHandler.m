@implementation HMDResidentCommunicationHandler

- (HMDResidentCommunicationHandler)initWithHome:(id)a3 remoteDispatcher:(id)a4
{
  id v6;
  id v7;
  HMDResidentCommunicationHandler *v8;
  uint64_t v9;
  NSUUID *homeUUID;
  uint64_t v11;
  NSMapTable *deviceMapping;
  uint64_t v13;
  OS_dispatch_queue *workQueue;
  uint64_t v15;
  NSMutableArray *pendingReadRequests;
  uint64_t v17;
  NSMapTable *dispatchedReadRequests;
  objc_super v20;

  v6 = a3;
  v7 = a4;
  v20.receiver = self;
  v20.super_class = (Class)HMDResidentCommunicationHandler;
  v8 = -[HMDResidentCommunicationHandler init](&v20, sel_init);
  if (v8)
  {
    objc_msgSend(v6, "uuid");
    v9 = objc_claimAutoreleasedReturnValue();
    homeUUID = v8->_homeUUID;
    v8->_homeUUID = (NSUUID *)v9;

    v8->_ownerUser = objc_msgSend(v6, "isOwnerUser");
    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v11 = objc_claimAutoreleasedReturnValue();
    deviceMapping = v8->_deviceMapping;
    v8->_deviceMapping = (NSMapTable *)v11;

    objc_msgSend(v7, "workQueue");
    v13 = objc_claimAutoreleasedReturnValue();
    workQueue = v8->_workQueue;
    v8->_workQueue = (OS_dispatch_queue *)v13;

    objc_storeWeak((id *)&v8->_remoteDispatcher, v7);
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v15 = objc_claimAutoreleasedReturnValue();
    pendingReadRequests = v8->_pendingReadRequests;
    v8->_pendingReadRequests = (NSMutableArray *)v15;

    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v17 = objc_claimAutoreleasedReturnValue();
    dispatchedReadRequests = v8->_dispatchedReadRequests;
    v8->_dispatchedReadRequests = (NSMapTable *)v17;

    v8->_numOutstandingReadRequests = 0;
  }

  return v8;
}

- (void)dealloc
{
  void *v3;
  HMDResidentCommunicationHandler *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v12;
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1D17BA0A0](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v14 = v6;
    _os_log_impl(&dword_1CD062000, v5, OS_LOG_TYPE_INFO, "%{public}@Deallocating resident communication handler", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  -[HMDResidentCommunicationHandler pendingReadRequests](v4, "pendingReadRequests");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");

  -[HMDResidentCommunicationHandler dispatchedReadRequests](v4, "dispatchedReadRequests");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");

  objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 54);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDResidentCommunicationHandler _clearAllGeneratedRequests:error:](HMDResidentCommunicationHandler, "_clearAllGeneratedRequests:error:", v10, v11);
  +[HMDResidentCommunicationHandler _clearAllPendingRequests:error:](HMDResidentCommunicationHandler, "_clearAllPendingRequests:error:", v8, v11);

  v12.receiver = v4;
  v12.super_class = (Class)HMDResidentCommunicationHandler;
  -[HMDResidentCommunicationHandler dealloc](&v12, sel_dealloc);
}

- (NSString)description
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0CB3940];
  -[HMDResidentCommunicationHandler homeUUID](self, "homeUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("[RCH %@]"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (void)setDevice:(id)a3 forType:(int64_t)a4
{
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  -[HMDResidentCommunicationHandler deviceForType:](self, "deviceForType:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "isEqual:", v9) & 1) == 0)
  {
    if (v6)
      -[HMDResidentCommunicationHandler removeDeviceForType:](self, "removeDeviceForType:", a4);
    if (v9)
    {
      -[HMDResidentCommunicationHandler deviceMapping](self, "deviceMapping");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObject:forKey:", v9, v8);

    }
  }

}

- (void)removeDeviceForType:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  -[HMDResidentCommunicationHandler deviceMapping](self, "deviceMapping");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    if (-[HMDResidentCommunicationHandler preferredDeviceType](self, "preferredDeviceType") == a3)
    {
      -[HMDResidentCommunicationHandler dispatchedReadRequests](self, "dispatchedReadRequests");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)objc_msgSend(v8, "copy");

      -[HMDResidentCommunicationHandler dispatchedReadRequests](self, "dispatchedReadRequests");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "removeAllObjects");

      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 54);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      +[HMDResidentCommunicationHandler _clearAllGeneratedRequests:error:](HMDResidentCommunicationHandler, "_clearAllGeneratedRequests:error:", v9, v11);

    }
    -[HMDResidentCommunicationHandler deviceMapping](self, "deviceMapping");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "removeObjectForKey:", v12);

  }
}

- (BOOL)containsDevice:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  char v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDResidentCommunicationHandler deviceMapping](self, "deviceMapping");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v7);
        objc_msgSend(v7, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i), (_QWORD)v14);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isEqual:", v4);

        if ((v12 & 1) != 0)
        {
          LOBYTE(v8) = 1;
          goto LABEL_11;
        }
      }
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v8)
        continue;
      break;
    }
  }
LABEL_11:

  return v8;
}

- (id)deviceForType:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;

  -[HMDResidentCommunicationHandler deviceMapping](self, "deviceMapping");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (HMDDevice)preferredDevice
{
  return (HMDDevice *)-[HMDResidentCommunicationHandler deviceForType:](self, "deviceForType:", -[HMDResidentCommunicationHandler preferredDeviceType](self, "preferredDeviceType"));
}

- (int64_t)preferredDeviceType
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v8;
  void *v9;

  -[HMDResidentCommunicationHandler deviceMapping](self, "deviceMapping");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (!v4)
    return 0;
  -[HMDResidentCommunicationHandler deviceMapping](self, "deviceMapping");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", &unk_1E8B32AD8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    return 2;
  -[HMDResidentCommunicationHandler deviceMapping](self, "deviceMapping");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", &unk_1E8B32AF0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9 != 0;
}

- (void)redispatchMessage:(id)a3 target:(id)a4 responseQueue:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  HMDResidentCommunicationHandler *v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[HMDResidentCommunicationHandler workQueue](self, "workQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __74__HMDResidentCommunicationHandler_redispatchMessage_target_responseQueue___block_invoke;
  v15[3] = &unk_1E89C07B8;
  v16 = v8;
  v17 = v9;
  v18 = self;
  v19 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(v11, v15);

}

- (void)timerDidFire:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  HMDResidentCommunicationHandler *v9;

  v4 = a3;
  -[HMDResidentCommunicationHandler workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __48__HMDResidentCommunicationHandler_timerDidFire___block_invoke;
  v7[3] = &unk_1E89C2328;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)_sendMultipleCharacteristicRead
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  __int128 v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  HMDAssertionLogEvent *v13;
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
  _BOOL4 v24;
  void *v25;
  void *v26;
  HMDResidentCommunicationHandler *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  HMDResidentCommunicationHandler *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  HMDResidentCommunicationHandler *v35;
  NSObject *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  void *v43;
  void *v44;
  id v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  HMDResidentCommunicationHandler *v58;
  NSObject *v59;
  void *v60;
  void *v61;
  HMDResidentCommunicationHandler *v62;
  NSObject *v63;
  void *v64;
  __int128 v65;
  id obj;
  id obja;
  uint64_t v69;
  void *v70;
  uint64_t v71;
  void *v72;
  _QWORD v73[4];
  id v74;
  id v75;
  id location;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  _QWORD v81[2];
  _QWORD v82[2];
  uint8_t buf[4];
  void *v84;
  __int16 v85;
  id v86;
  _BYTE v87[128];
  uint64_t v88;

  v88 = *MEMORY[0x1E0C80C00];
  -[HMDResidentCommunicationHandler workQueue](self, "workQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v2);

  -[HMDResidentCommunicationHandler pendingReadRequests](self, "pendingReadRequests");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    v79 = 0u;
    v80 = 0u;
    v77 = 0u;
    v78 = 0u;
    -[HMDResidentCommunicationHandler pendingReadRequests](self, "pendingReadRequests");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v5, "copy");

    obj = v6;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v77, v87, 16);
    if (v7)
    {
      v71 = *(_QWORD *)v78;
      v69 = 9;
      *(_QWORD *)&v8 = 138543362;
      v65 = v8;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v78 != v71)
            objc_enumerationMutation(obj);
          v10 = *(void **)(*((_QWORD *)&v77 + 1) + 8 * i);
          objc_msgSend(v10, "accessoryUUID", v65);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "UUIDString");
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          if (v12)
          {
            objc_msgSend(v70, "hmf_mutableDictionaryForKey:", v12);
            v13 = (HMDAssertionLogEvent *)objc_claimAutoreleasedReturnValue();
            if (!v13)
            {
              objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
              v13 = (HMDAssertionLogEvent *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v70, "setObject:forKey:", v13, v12);
            }
            objc_msgSend(v10, "readMessage");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "messagePayload");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "hmf_numberForKey:", CFSTR("kServiceInstanceID"));
            v16 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v16, "stringValue");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            -[HMDAssertionLogEvent hmf_mutableArrayForKey:](v13, "hmf_mutableArrayForKey:", v17);
            v18 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v18)
            {
              objc_msgSend(MEMORY[0x1E0C99DE8], "array");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v16, "stringValue");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              -[HMDAssertionLogEvent setObject:forKey:](v13, "setObject:forKey:", v18, v19);

            }
            objc_msgSend(v10, "readMessage");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "messagePayload");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "hmf_numberForKey:", CFSTR("kCharacteristicInstanceID"));
            v22 = (void *)objc_claimAutoreleasedReturnValue();

            if ((objc_msgSend(v18, "containsObject:", v22) & 1) == 0)
              objc_msgSend(v18, "addObject:", v22);
            objc_msgSend(v10, "readMessage");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "qualityOfService");
            v24 = HMFQualityOfServiceCompare() == -1;

            if (v24)
            {
              objc_msgSend(v10, "readMessage");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              v69 = objc_msgSend(v25, "qualityOfService");

            }
          }
          else
          {
            v26 = (void *)MEMORY[0x1D17BA0A0]();
            v27 = self;
            HMFGetOSLogHandle();
            v28 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
            {
              HMFGetLogIdentifier();
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v84 = v29;
              v85 = 2112;
              v86 = v10;
              _os_log_impl(&dword_1CD062000, v28, OS_LOG_TYPE_ERROR, "%{public}@Ignoring bad request with nil accessory: %@", buf, 0x16u);

            }
            objc_autoreleasePoolPop(v26);
            v30 = (void *)MEMORY[0x1D17BA0A0]();
            v31 = v27;
            HMFGetOSLogHandle();
            v32 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v32, OS_LOG_TYPE_FAULT))
            {
              HMFGetLogIdentifier();
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = v65;
              v84 = v33;
              _os_log_impl(&dword_1CD062000, v32, OS_LOG_TYPE_FAULT, "%{public}@Submitting ABC event for failure: Accessory UUID cannot be nil", buf, 0xCu);

            }
            objc_autoreleasePoolPop(v30);
            v13 = -[HMDAssertionLogEvent initWithReason:]([HMDAssertionLogEvent alloc], "initWithReason:", CFSTR("Accessory UUID cannot be nil"));
            +[HMDMetricsManager sharedLogEventSubmitter](HMDMetricsManager, "sharedLogEventSubmitter");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "submitLogEvent:", v13);
          }

        }
        v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v77, v87, 16);
      }
      while (v7);
    }
    else
    {
      v69 = 9;
    }

    v81[0] = CFSTR("kAccessoriesListKey");
    v38 = (void *)objc_msgSend(v70, "copy");
    v81[1] = CFSTR("kHomeUUID");
    v82[0] = v38;
    -[HMDResidentCommunicationHandler homeUUID](self, "homeUUID");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "UUIDString");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v82[1] = v40;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v82, v81, 2);
    v72 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = objc_alloc(MEMORY[0x1E0D285D8]);
    -[HMDResidentCommunicationHandler homeUUID](self, "homeUUID");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    obja = (id)objc_msgSend(v42, "initWithTarget:", v43);

    objc_msgSend(MEMORY[0x1E0D285F8], "messageWithName:qualityOfService:destination:payload:", CFSTR("kMultipleCharacteristicReadRequestKey"), v69, obja, v72);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "setIdentifier:", v41);
    objc_initWeak(&location, self);
    v73[0] = MEMORY[0x1E0C809B0];
    v73[1] = 3221225472;
    v73[2] = __66__HMDResidentCommunicationHandler__sendMultipleCharacteristicRead__block_invoke;
    v73[3] = &unk_1E89BF4F0;
    objc_copyWeak(&v75, &location);
    v45 = v41;
    v74 = v45;
    objc_msgSend(v44, "setResponseHandler:", v73);
    -[HMDResidentCommunicationHandler dispatchedReadRequests](self, "dispatchedReadRequests");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDResidentCommunicationHandler pendingReadRequests](self, "pendingReadRequests");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = (void *)objc_msgSend(v47, "copy");
    objc_msgSend(v46, "setObject:forKey:", v48, v44);

    -[HMDResidentCommunicationHandler pendingReadRequests](self, "pendingReadRequests");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "removeAllObjects");

    -[HMDResidentCommunicationHandler remoteDispatcher](self, "remoteDispatcher");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    if (v50)
    {
      ++self->_numOutstandingReadRequests;
      -[HMDResidentCommunicationHandler preferredDevice](self, "preferredDevice");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDResidentCommunicationHandler homeUUID](self, "homeUUID");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "remoteDestinationString");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "remoteDestinationString");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDResidentCommunicationHandler workQueue](self, "workQueue");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "responseHandler");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "sendSecureMessage:target:userID:destination:responseQueue:responseHandler:", v44, v52, v53, v54, v55, v56);

      v57 = (void *)MEMORY[0x1D17BA0A0]();
      v58 = self;
      HMFGetOSLogHandle();
      v59 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v59, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v84 = v60;
        v85 = 2112;
        v86 = v45;
        _os_log_impl(&dword_1CD062000, v59, OS_LOG_TYPE_INFO, "%{public}@Sent off the multi-read request with identifier: %@ and adding it to tracking list", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v57);
    }
    else
    {
      v61 = (void *)MEMORY[0x1D17BA0A0]();
      v62 = self;
      HMFGetOSLogHandle();
      v63 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v84 = v64;
        _os_log_impl(&dword_1CD062000, v63, OS_LOG_TYPE_ERROR, "%{public}@IDS dispatcher is invalid, reporting error", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v61);
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 54);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDResidentCommunicationHandler _processResponse:overallError:messageIdentifier:](v62, "_processResponse:overallError:messageIdentifier:", 0, v51, v45);
    }

    objc_destroyWeak(&v75);
    objc_destroyWeak(&location);

  }
  else
  {
    v34 = (void *)MEMORY[0x1D17BA0A0]();
    v35 = self;
    HMFGetOSLogHandle();
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v84 = v37;
      _os_log_impl(&dword_1CD062000, v36, OS_LOG_TYPE_INFO, "%{public}@No pending read requests to combine?", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v34);
  }
}

- (void)_processResponse:(id)a3 overallError:(id)a4 messageIdentifier:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  int numOutstandingReadRequests;
  void *v26;
  HMDResidentCommunicationHandler *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  HMDResidentCommunicationHandler *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint8_t buf[4];
  void *v42;
  __int16 v43;
  id v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v36 = a3;
  v8 = a4;
  v9 = a5;
  -[HMDResidentCommunicationHandler workQueue](self, "workQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v10);

  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  -[HMDResidentCommunicationHandler dispatchedReadRequests](self, "dispatchedReadRequests");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "copy");

  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v38;
LABEL_3:
    v16 = 0;
    while (1)
    {
      if (*(_QWORD *)v38 != v15)
        objc_enumerationMutation(v12);
      v17 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * v16);
      objc_msgSend(v17, "identifier");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "isEqual:", v9);

      if ((v19 & 1) != 0)
        break;
      if (v14 == ++v16)
      {
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
        if (v14)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
    -[HMDResidentCommunicationHandler dispatchedReadRequests](self, "dispatchedReadRequests");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "objectForKey:", v17);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    -[HMDResidentCommunicationHandler dispatchedReadRequests](self, "dispatchedReadRequests");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "removeObjectForKey:", v17);

    if (!v21)
      goto LABEL_16;
    v23 = v36;
    v24 = +[HMDResidentCommunicationHandler _processResponseForMultireadRequest:overallError:response:](HMDResidentCommunicationHandler, "_processResponseForMultireadRequest:overallError:response:", v21, v8, v36);
    numOutstandingReadRequests = self->_numOutstandingReadRequests;
    self->_numOutstandingReadRequests = numOutstandingReadRequests - 1;
    if (numOutstandingReadRequests == 1)
    {
      -[HMDResidentCommunicationHandler multiReadCoalesceTimer](self, "multiReadCoalesceTimer");
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      if (v34)
      {
        -[HMDResidentCommunicationHandler multiReadCoalesceTimer](self, "multiReadCoalesceTimer");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "suspend");

        -[HMDResidentCommunicationHandler setMultiReadCoalesceTimer:](self, "setMultiReadCoalesceTimer:", 0);
        -[HMDResidentCommunicationHandler _sendMultipleCharacteristicRead](self, "_sendMultipleCharacteristicRead");
      }
    }
    else if (numOutstandingReadRequests <= 0)
    {
      v26 = (void *)MEMORY[0x1D17BA0A0](v24);
      v27 = self;
      HMFGetOSLogHandle();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v42 = v29;
        _os_log_impl(&dword_1CD062000, v28, OS_LOG_TYPE_ERROR, "%{public}@*** invalid reference counter for resident communication read coalese handler", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v26);
      self->_numOutstandingReadRequests = 0;
    }
  }
  else
  {
LABEL_9:

LABEL_16:
    v30 = (void *)MEMORY[0x1D17BA0A0]();
    v31 = self;
    HMFGetOSLogHandle();
    v32 = objc_claimAutoreleasedReturnValue();
    v23 = v36;
    if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v42 = v33;
      v43 = 2112;
      v44 = v9;
      _os_log_impl(&dword_1CD062000, v32, OS_LOG_TYPE_INFO, "%{public}@Cannot find the message with identifier %@ in the dispatched multi-read requests", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v30);
    v21 = 0;
  }

}

- (id)logIdentifier
{
  void *v2;
  void *v3;

  -[HMDResidentCommunicationHandler homeUUID](self, "homeUUID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (NSMapTable)deviceMapping
{
  return self->_deviceMapping;
}

- (void)setDeviceMapping:(id)a3
{
  objc_storeStrong((id *)&self->_deviceMapping, a3);
}

- (NSMutableArray)pendingReadRequests
{
  return self->_pendingReadRequests;
}

- (NSMapTable)dispatchedReadRequests
{
  return self->_dispatchedReadRequests;
}

- (HMFTimer)multiReadCoalesceTimer
{
  return self->_multiReadCoalesceTimer;
}

- (void)setMultiReadCoalesceTimer:(id)a3
{
  objc_storeStrong((id *)&self->_multiReadCoalesceTimer, a3);
}

- (NSUUID)homeUUID
{
  return self->_homeUUID;
}

- (BOOL)isOwnerUser
{
  return self->_ownerUser;
}

- (HMDMessageDispatcher)remoteDispatcher
{
  return (HMDMessageDispatcher *)objc_loadWeakRetained((id *)&self->_remoteDispatcher);
}

- (int)numOutstandingReadRequests
{
  return self->_numOutstandingReadRequests;
}

- (void)setNumOutstandingReadRequests:(int)a3
{
  self->_numOutstandingReadRequests = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_remoteDispatcher);
  objc_storeStrong((id *)&self->_homeUUID, 0);
  objc_storeStrong((id *)&self->_multiReadCoalesceTimer, 0);
  objc_storeStrong((id *)&self->_dispatchedReadRequests, 0);
  objc_storeStrong((id *)&self->_pendingReadRequests, 0);
  objc_storeStrong((id *)&self->_deviceMapping, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
}

void __66__HMDResidentCommunicationHandler__sendMultipleCharacteristicRead__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __66__HMDResidentCommunicationHandler__sendMultipleCharacteristicRead__block_invoke_2;
  v11[3] = &unk_1E89C07B8;
  v11[4] = WeakRetained;
  v12 = v6;
  v13 = v5;
  v14 = *(id *)(a1 + 32);
  v9 = v5;
  v10 = v6;
  dispatch_async(v8, v11);

}

uint64_t __66__HMDResidentCommunicationHandler__sendMultipleCharacteristicRead__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_processResponse:overallError:messageIdentifier:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

void __48__HMDResidentCommunicationHandler_timerDidFire___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "multiReadCoalesceTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2 == v3)
  {
    objc_msgSend(*(id *)(a1 + 40), "setMultiReadCoalesceTimer:", 0);
    objc_msgSend(*(id *)(a1 + 40), "_sendMultipleCharacteristicRead");
  }
  else
  {
    v4 = (void *)MEMORY[0x1D17BA0A0]();
    v5 = *(id *)(a1 + 40);
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138543362;
      v9 = v7;
      _os_log_impl(&dword_1CD062000, v6, OS_LOG_TYPE_INFO, "%{public}@Read request timer is not matching", (uint8_t *)&v8, 0xCu);

    }
    objc_autoreleasePoolPop(v4);
  }
}

void __74__HMDResidentCommunicationHandler_redispatchMessage_target_responseQueue___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  uint64_t v12;
  void *v13;
  HMDRemoteReadRequestMessage *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  NSObject *v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  NSObject *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  id v37;
  NSObject *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  NSObject *v44;
  void *v45;
  void *v46;
  void *context;
  void *contexta;
  void *contextb;
  uint8_t buf[4];
  void *v51;
  __int16 v52;
  void *v53;
  __int16 v54;
  void *v55;
  _QWORD v56[2];

  v56[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "messagePayload");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "mutableCopy");

  v56[0] = CFSTR("kIDSMessageSourceIDKey");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v56, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObjectsForKeys:", v4);

  v5 = *(id *)(a1 + 32);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  if (!v7)
    v5 = (id)objc_msgSend(*(id *)(a1 + 32), "mutableCopy");
  objc_msgSend(v5, "setMessagePayload:", v3);
  objc_msgSend(v5, "setSecureRemote:", 1);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D285D8]), "initWithTarget:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v5, "setDestination:", v8);
  objc_msgSend(v5, "name");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("kCharacteristicReadRequestKey"));

  if ((v10 & 1) != 0)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("kAccessoryUUID"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11 && (v12 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v11)) != 0)
    {
      v13 = (void *)v12;
      v14 = -[HMDRemoteReadRequestMessage initWithReadMessage:accessoryUUID:responseQueue:]([HMDRemoteReadRequestMessage alloc], "initWithReadMessage:accessoryUUID:responseQueue:", v5, v12, *(_QWORD *)(a1 + 56));
      objc_msgSend(*(id *)(a1 + 48), "pendingReadRequests");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "addObject:", v14);

      objc_msgSend(*(id *)(a1 + 48), "multiReadCoalesceTimer");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v16)
      {
        if (*(int *)(*(_QWORD *)(a1 + 48) + 12) < 1)
        {
          v42 = (void *)MEMORY[0x1D17BA0A0]();
          v43 = *(id *)(a1 + 48);
          HMFGetOSLogHandle();
          v44 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            contextb = v42;
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v51 = v45;
            _os_log_impl(&dword_1CD062000, v44, OS_LOG_TYPE_INFO, "%{public}@Sending read request immediately.  Will collect further incoming read packets", buf, 0xCu);

            v42 = contextb;
          }

          objc_autoreleasePoolPop(v42);
          objc_msgSend(*(id *)(a1 + 48), "_sendMultipleCharacteristicRead");
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0D28678], "sharedPreferences");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "preferenceForKey:", CFSTR("residentReadCoalesceTimeout_ms"));
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "numberValue");
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v19)
          {
            context = (void *)MEMORY[0x1D17BA0A0]();
            v20 = *(id *)(a1 + 48);
            HMFGetOSLogHandle();
            v21 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
            {
              HMFGetLogIdentifier();
              v46 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543362;
              v51 = v46;
              _os_log_impl(&dword_1CD062000, v21, OS_LOG_TYPE_ERROR, "%{public}@*** resident communication handler read coalesce timeout missing from preferences", buf, 0xCu);

            }
            objc_autoreleasePoolPop(context);
          }
          objc_msgSend(v19, "doubleValue", v46);
          v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D286C8]), "initWithTimeInterval:options:", 0, v22 / 1000.0);
          objc_msgSend(*(id *)(a1 + 48), "setMultiReadCoalesceTimer:", v23);

          v24 = *(void **)(a1 + 48);
          objc_msgSend(v24, "multiReadCoalesceTimer");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "setDelegate:", v24);

          objc_msgSend(*(id *)(a1 + 48), "multiReadCoalesceTimer");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "resume");

          v27 = (void *)MEMORY[0x1D17BA0A0]();
          v28 = *(id *)(a1 + 48);
          HMFGetOSLogHandle();
          v29 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            contexta = v19;
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v51 = v30;
            _os_log_impl(&dword_1CD062000, v29, OS_LOG_TYPE_INFO, "%{public}@Kicked off the multi-read request timer", buf, 0xCu);

            v19 = contexta;
          }

          objc_autoreleasePoolPop(v27);
        }
      }

    }
    else
    {
      v36 = (void *)MEMORY[0x1D17BA0A0]();
      v37 = *(id *)(a1 + 48);
      HMFGetOSLogHandle();
      v38 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "shortDescription");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v51 = v39;
        v52 = 2112;
        v53 = v40;
        v54 = 2112;
        v55 = v3;
        _os_log_impl(&dword_1CD062000, v38, OS_LOG_TYPE_ERROR, "%{public}@Request message: %@ cannot be redispatched due to invalid payload: %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v36);
      v41 = *(void **)(a1 + 32);
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 3);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "respondWithError:", v13);
    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 48), "preferredDevice");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "name");

    objc_msgSend(v11, "identifier");
    objc_msgSend(*(id *)(a1 + 48), "remoteDispatcher");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = *(_QWORD *)(a1 + 40);
    objc_msgSend(v11, "remoteDestinationString");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "remoteDestinationString");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = *(_QWORD *)(a1 + 56);
    objc_msgSend(v5, "responseHandler");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "sendSecureMessage:target:userID:destination:responseQueue:responseHandler:", v5, v31, v32, v33, v34, v35);

  }
}

+ (void)_processResponseForMultireadRequest:(id)a3 overallError:(id)a4 response:(id)a5
{
  id v7;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  NSObject *v20;
  void *v21;
  NSObject *v22;
  id v23;
  id v24;
  id v25;
  void *v26;
  id v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  __int128 v32;
  id obj;
  id v34;
  id v35;
  uint64_t v36;
  _QWORD block[4];
  id v39;
  id v40;
  id v41;
  id v42;
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
  __int16 v53;
  id v54;
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v35 = a4;
  v34 = a5;
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  obj = v7;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v55, 16);
  if (v8)
  {
    v10 = v8;
    v36 = *(_QWORD *)v44;
    *(_QWORD *)&v9 = 138543618;
    v32 = v9;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v44 != v36)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * i);
        objc_msgSend(v12, "readMessage", v32);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "responseHandler");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (v14)
        {
          v42 = v35;
          v15 = v35;
          +[HMDResidentCommunicationHandler createResponseSubset:overallError:readRequest:error:](HMDResidentCommunicationHandler, "createResponseSubset:overallError:readRequest:error:", v34, v15, v12, &v42);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = v42;

          v18 = (void *)MEMORY[0x1D17BA0A0]();
          v19 = a1;
          HMFGetOSLogHandle();
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138544130;
            v48 = v21;
            v49 = 2112;
            v50 = v12;
            v51 = 2112;
            v52 = v16;
            v53 = 2112;
            v54 = v17;
            _os_log_impl(&dword_1CD062000, v20, OS_LOG_TYPE_INFO, "%{public}@%@ is getting a response %@ with error %@", buf, 0x2Au);

          }
          objc_autoreleasePoolPop(v18);
          objc_msgSend(v12, "responseQueue");
          v22 = objc_claimAutoreleasedReturnValue();
          block[0] = MEMORY[0x1E0C809B0];
          block[1] = 3221225472;
          block[2] = __93__HMDResidentCommunicationHandler__processResponseForMultireadRequest_overallError_response___block_invoke;
          block[3] = &unk_1E89C1B48;
          v23 = v14;
          v40 = v16;
          v41 = v23;
          v39 = v17;
          v24 = v17;
          v25 = v16;
          dispatch_async(v22, block);

        }
        else
        {
          v26 = (void *)MEMORY[0x1D17BA0A0]();
          v27 = a1;
          HMFGetOSLogHandle();
          v28 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "readMessage");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "identifier");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v32;
            v48 = v29;
            v49 = 2112;
            v50 = v31;
            _os_log_impl(&dword_1CD062000, v28, OS_LOG_TYPE_INFO, "%{public}@Response handler is not set for the request %@, skipping", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v26);
        }

      }
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v55, 16);
    }
    while (v10);
  }

}

+ (id)createResponseSubset:(id)a3 overallError:(id)a4 readRequest:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
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
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  NSObject *v37;
  void *v38;
  void *v39;
  id v40;
  NSObject *v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  NSObject *v46;
  void *v47;
  void *v48;
  id v49;
  NSObject *v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  id v58;
  NSObject *v59;
  void *v60;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  id *v70;
  void *v71;
  void *v72;
  _QWORD v73[6];
  _QWORD v74[6];
  uint8_t buf[4];
  void *v76;
  __int16 v77;
  void *v78;
  uint64_t v79;

  v79 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (v11)
  {
    v13 = v11;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 54);
    v13 = (id)objc_claimAutoreleasedReturnValue();
  }
  v14 = v13;
  if (!v10)
  {
    v32 = 0;
    if (!a6)
      goto LABEL_41;
    goto LABEL_40;
  }
  objc_msgSend(v12, "accessoryUUID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "readMessage");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "messagePayload");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "hmf_numberForKey:", CFSTR("kServiceInstanceID"));
  v72 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "readMessage");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "messagePayload");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "hmf_numberForKey:", CFSTR("kCharacteristicInstanceID"));
  v71 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "hmf_dictionaryForKey:", CFSTR("kModifiedCharacteristicsForAccessoryKey"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v70 = a6;
  if (v20)
  {
    v69 = v15;
    objc_msgSend(v15, "UUIDString");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "hmf_dictionaryForKey:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      objc_msgSend(v72, "stringValue");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "hmf_dictionaryForKey:", v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      v64 = v24;
      if (v24)
      {
        objc_msgSend(v71, "stringValue");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "hmf_dictionaryForKey:", v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        v27 = v26;
        if (v26)
        {
          objc_msgSend(v26, "errorFromDataForKey:", CFSTR("kCharacteristicErrorDataKey"));
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v63 = v26;
          if (v28)
          {
            v29 = v28;
            v30 = v22;
            v31 = v28;

            v32 = 0;
            v14 = v31;
            v22 = v30;
            v33 = v69;
            v34 = v64;
          }
          else
          {
            objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("kCharacteristicValue"));
            v52 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("kCharacteristicValueUpdateStateNumberKey"));
            v53 = objc_claimAutoreleasedReturnValue();
            if (!v53)
            {
              objc_msgSend(MEMORY[0x1E0C99E38], "null");
              v53 = objc_claimAutoreleasedReturnValue();
            }
            v62 = (void *)v53;
            if (v52)
            {
              objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("kRemoteMessageTransportAttributionKey"));
              v54 = (void *)objc_claimAutoreleasedReturnValue();
              if (!v54)
              {
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 0);
                v54 = (void *)objc_claimAutoreleasedReturnValue();
              }
              v73[0] = CFSTR("kAccessoryUUID");
              objc_msgSend(v69, "UUIDString");
              v67 = (void *)objc_claimAutoreleasedReturnValue();
              v74[0] = v67;
              v74[1] = v72;
              v73[1] = CFSTR("kServiceInstanceID");
              v73[2] = CFSTR("kCharacteristicInstanceID");
              v74[2] = v71;
              v74[3] = v52;
              v73[3] = CFSTR("kCharacteristicValue");
              v73[4] = CFSTR("kCharacteristicValueUpdateStateNumberKey");
              v73[5] = CFSTR("kRemoteMessageTransportAttributionKey");
              v55 = v62;
              v74[4] = v62;
              v74[5] = v54;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v74, v73, 6);
              v56 = (void *)v52;
              v32 = (void *)objc_claimAutoreleasedReturnValue();

              v14 = 0;
            }
            else
            {
              v68 = v22;
              v57 = (void *)MEMORY[0x1D17BA0A0]();
              v58 = a1;
              HMFGetOSLogHandle();
              v59 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
              {
                HMFGetLogIdentifier();
                v60 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543362;
                v76 = v60;
                _os_log_impl(&dword_1CD062000, v59, OS_LOG_TYPE_ERROR, "%{public}@Value key is missing in the response dictionary", buf, 0xCu);

              }
              objc_autoreleasePoolPop(v57);
              v32 = 0;
              v22 = v68;
              v56 = 0;
              v55 = v62;
            }

            v33 = v69;
            v34 = v64;
            v29 = 0;
          }

          v27 = v63;
        }
        else
        {
          v66 = v22;
          v48 = (void *)MEMORY[0x1D17BA0A0]();
          v49 = a1;
          HMFGetOSLogHandle();
          v50 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v76 = v51;
            v77 = 2112;
            v78 = v71;
            _os_log_impl(&dword_1CD062000, v50, OS_LOG_TYPE_ERROR, "%{public}@Could not find the characteristic instance ID %@ in the service changes", buf, 0x16u);

            v27 = 0;
          }

          objc_autoreleasePoolPop(v48);
          v32 = 0;
          v22 = v66;
          v33 = v69;
          v34 = v64;
        }

      }
      else
      {
        v65 = v22;
        v44 = (void *)MEMORY[0x1D17BA0A0]();
        v45 = a1;
        HMFGetOSLogHandle();
        v46 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v76 = v47;
          v77 = 2112;
          v78 = v72;
          _os_log_impl(&dword_1CD062000, v46, OS_LOG_TYPE_ERROR, "%{public}@Could not find the service instance ID %@ in the accessory changes", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v44);
        v32 = 0;
        v22 = v65;
        v33 = v69;
        v34 = 0;
      }

    }
    else
    {
      v39 = (void *)MEMORY[0x1D17BA0A0]();
      v40 = a1;
      HMFGetOSLogHandle();
      v41 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v69, "UUIDString");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v76 = v42;
        v77 = 2112;
        v78 = v43;
        _os_log_impl(&dword_1CD062000, v41, OS_LOG_TYPE_ERROR, "%{public}@Could not find the accessory %@ in the accessory list", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v39);
      v32 = 0;
      v22 = 0;
      v33 = v69;
    }

  }
  else
  {
    v33 = v15;
    v35 = (void *)MEMORY[0x1D17BA0A0]();
    v36 = a1;
    HMFGetOSLogHandle();
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v76 = v38;
      _os_log_impl(&dword_1CD062000, v37, OS_LOG_TYPE_ERROR, "%{public}@Could not find the modified accessory characteristics key", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v35);
    v32 = 0;
  }

  a6 = v70;
  if (v70)
LABEL_40:
    *a6 = objc_retainAutorelease(v14);
LABEL_41:

  return v32;
}

+ (void)_clearAllGeneratedRequests:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t v22[128];
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1D17BA0A0]();
  v9 = a1;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v24 = v11;
    v25 = 2112;
    v26 = v7;
    _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_INFO, "%{public}@Clearing off all pending dispatched multi-read requests with error: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v8);
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v12 = v6;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v19;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v19 != v15)
          objc_enumerationMutation(v12);
        objc_msgSend(v12, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v16), (_QWORD)v18);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        +[HMDResidentCommunicationHandler _processResponseForMultireadRequest:overallError:response:](HMDResidentCommunicationHandler, "_processResponseForMultireadRequest:overallError:response:", v17, v7, 0);

        ++v16;
      }
      while (v14 != v16);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v14);
  }

}

+ (void)_clearAllPendingRequests:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1D17BA0A0]();
  v9 = a1;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138543618;
    v13 = v11;
    v14 = 2112;
    v15 = v7;
    _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_INFO, "%{public}@Clearing off all pending read requests with error: %@", (uint8_t *)&v12, 0x16u);

  }
  objc_autoreleasePoolPop(v8);
  +[HMDResidentCommunicationHandler _processResponseForMultireadRequest:overallError:response:](HMDResidentCommunicationHandler, "_processResponseForMultireadRequest:overallError:response:", v6, v7, 0);

}

+ (id)logCategory
{
  if (logCategory__hmf_once_t23 != -1)
    dispatch_once(&logCategory__hmf_once_t23, &__block_literal_global_22872);
  return (id)logCategory__hmf_once_v24;
}

void __46__HMDResidentCommunicationHandler_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v24;
  logCategory__hmf_once_v24 = v0;

}

uint64_t __93__HMDResidentCommunicationHandler__processResponseForMultireadRequest_overallError_response___block_invoke(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

@end
