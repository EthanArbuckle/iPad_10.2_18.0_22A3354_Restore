@implementation HMDAccessoryNetworkProtectionGroupRegistry

- (HMDAccessoryNetworkProtectionGroupRegistry)initWithHome:(id)a3 notificationCenter:(id)a4
{
  id v6;
  id v7;
  HMDAccessoryNetworkProtectionGroupRegistry *v8;
  uint64_t v9;
  NSMutableDictionary *groupRecords;
  uint64_t v11;
  OS_dispatch_queue *workQueue;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HMDAccessoryNetworkProtectionGroupRegistry;
  v8 = -[HMDAccessoryNetworkProtectionGroupRegistry init](&v14, sel_init);
  if (v8)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v9 = objc_claimAutoreleasedReturnValue();
    groupRecords = v8->_groupRecords;
    v8->_groupRecords = (NSMutableDictionary *)v9;

    objc_storeWeak((id *)&v8->_home, v6);
    objc_storeStrong((id *)&v8->_notificationCenter, a4);
    objc_msgSend(v6, "workQueue");
    v11 = objc_claimAutoreleasedReturnValue();
    workQueue = v8->_workQueue;
    v8->_workQueue = (OS_dispatch_queue *)v11;

  }
  return v8;
}

- (HMDAccessoryNetworkProtectionGroupRegistry)initWithHome:(id)a3 notificationCenter:(id)a4 persistedGroups:(id)a5
{
  id v8;
  id v9;
  id v10;
  HMDAccessoryNetworkProtectionGroupRegistry *v11;
  HMDAccessoryNetworkProtectionGroupRegistry *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  HMDAccessoryNetworkProtectionGroupRegistry *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  NSMutableDictionary *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t j;
  void *v31;
  void *v32;
  void *v33;
  NSMutableDictionary *groupRecords;
  id v36;
  id v37;
  HMDAccessoryNetworkProtectionGroupRegistry *v38;
  id v39;
  id obj;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  uint8_t v49[128];
  uint8_t buf[4];
  void *v51;
  __int16 v52;
  void *v53;
  __int16 v54;
  void *v55;
  uint64_t v56;

  v56 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = -[HMDAccessoryNetworkProtectionGroupRegistry initWithHome:notificationCenter:](self, "initWithHome:notificationCenter:", v8, v9);
  v12 = v11;
  if (v10 && v11)
  {
    v36 = v10;
    v37 = v9;
    v43 = 0u;
    v44 = 0u;
    v41 = 0u;
    v42 = 0u;
    obj = v10;
    v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
    v38 = v12;
    v39 = v8;
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v42;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v42 != v15)
            objc_enumerationMutation(obj);
          v17 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
          v18 = (void *)MEMORY[0x227676638]();
          v19 = v12;
          HMFGetOSLogHandle();
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
          {
            HMFGetLogIdentifier();
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "uuid");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "UUIDString");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v51 = v21;
            v52 = 2112;
            v53 = v23;
            v54 = 2112;
            v55 = v17;
            _os_log_impl(&dword_2218F0000, v20, OS_LOG_TYPE_DEBUG, "%{public}@[%@] Loading persisted group: %@", buf, 0x20u);

            v12 = v38;
            v8 = v39;

          }
          objc_autoreleasePoolPop(v18);
          objc_msgSend(v17, "configureWithHome:", v8);
        }
        v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
      }
      while (v14);
    }

    v24 = obj;
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", objc_msgSend(v24, "count"));
    v25 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    v45 = 0u;
    v46 = 0u;
    v47 = 0u;
    v48 = 0u;
    v26 = v24;
    v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v45, buf, 16);
    if (v27)
    {
      v28 = v27;
      v29 = *(_QWORD *)v46;
      do
      {
        for (j = 0; j != v28; ++j)
        {
          if (*(_QWORD *)v46 != v29)
            objc_enumerationMutation(v26);
          v31 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * j);
          +[HMDAccessoryNetworkProtectionGroupRecord recordWithGroup:active:persisted:](HMDAccessoryNetworkProtectionGroupRecord, "recordWithGroup:active:persisted:", v31, 0, 1, v36, v37);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "uuid");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary setObject:forKeyedSubscript:](v25, "setObject:forKeyedSubscript:", v32, v33);

        }
        v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v45, buf, 16);
      }
      while (v28);
    }

    v12 = v38;
    groupRecords = v38->_groupRecords;
    v38->_groupRecords = v25;

    v8 = v39;
    v10 = v36;
    v9 = v37;
  }

  return v12;
}

- (NSSet)persistedGroups
{
  os_unfair_lock_s *p_lock;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[NSMutableDictionary allValues](self->_groupRecords, "allValues", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        if (objc_msgSend(v9, "isPersisted"))
        {
          objc_msgSend(v9, "group");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObject:", v10);

        }
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

  v11 = (void *)objc_msgSend(v4, "copy");
  os_unfair_lock_unlock(p_lock);
  return (NSSet *)v11;
}

- (NSSet)activeGroups
{
  os_unfair_lock_s *p_lock;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[NSMutableDictionary allValues](self->_groupRecords, "allValues", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        if (objc_msgSend(v9, "isActive"))
        {
          objc_msgSend(v9, "group");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObject:", v10);

        }
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

  v11 = (void *)objc_msgSend(v4, "copy");
  os_unfair_lock_unlock(p_lock);
  return (NSSet *)v11;
}

- (id)groupRecordWithUUID:(id)a3
{
  id v4;
  os_unfair_lock_s *p_lock;
  void *v6;

  v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_groupRecords, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);

  return v6;
}

- (id)groupWithUUID:(id)a3
{
  void *v3;
  void *v4;

  -[HMDAccessoryNetworkProtectionGroupRegistry groupRecordWithUUID:](self, "groupRecordWithUUID:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "group");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)addActiveSurrogateGroup:(id)a3
{
  id v4;
  os_unfair_lock_s *p_lock;
  uint64_t v6;
  void *v7;
  HMDAccessoryNetworkProtectionGroupRegistry *v8;
  NSObject *v9;
  void *v10;
  NSMutableDictionary *groupRecords;
  void *v12;
  void *v13;
  NSMutableDictionary *v14;
  void *v15;
  void *v16;
  char v17;
  char v18;
  NSMutableDictionary *v19;
  void *v20;
  int v22;
  void *v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  p_lock = &self->_lock;
  v6 = os_unfair_lock_lock_with_options();
  v7 = (void *)MEMORY[0x227676638](v6);
  v8 = self;
  HMFGetOSLogHandle();
  v9 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 138543618;
    v23 = v10;
    v24 = 2112;
    v25 = v4;
    _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@Adding active surrogate group: %@", (uint8_t *)&v22, 0x16u);

  }
  objc_autoreleasePoolPop(v7);
  groupRecords = v8->_groupRecords;
  objc_msgSend(v4, "uuid");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](groupRecords, "objectForKeyedSubscript:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    v14 = v8->_groupRecords;
    objc_msgSend(v4, "uuid");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](v14, "objectForKeyedSubscript:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = objc_msgSend(v16, "isActive");
    if ((v17 & 1) == 0)
      objc_msgSend(v16, "setActive:", 1);
    v18 = v17 ^ 1;
  }
  else
  {
    +[HMDAccessoryNetworkProtectionGroupRecord recordWithGroup:active:persisted:](HMDAccessoryNetworkProtectionGroupRecord, "recordWithGroup:active:persisted:", v4, 1, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v8->_groupRecords;
    objc_msgSend(v4, "uuid");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v19, "setObject:forKeyedSubscript:", v16, v20);

    v18 = 1;
  }

  os_unfair_lock_unlock(p_lock);
  return v18;
}

- (id)removeGroupWithUUID:(id)a3
{
  id v4;
  os_unfair_lock_s *p_lock;
  uint64_t v6;
  void *v7;
  HMDAccessoryNetworkProtectionGroupRegistry *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  int v13;
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  p_lock = &self->_lock;
  v6 = os_unfair_lock_lock_with_options();
  v7 = (void *)MEMORY[0x227676638](v6);
  v8 = self;
  HMFGetOSLogHandle();
  v9 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138543618;
    v14 = v10;
    v15 = 2112;
    v16 = v4;
    _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@Removing group with UUID: %@", (uint8_t *)&v13, 0x16u);

  }
  objc_autoreleasePoolPop(v7);
  -[NSMutableDictionary objectForKeyedSubscript:](v8->_groupRecords, "objectForKeyedSubscript:", v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
    -[NSMutableDictionary removeObjectForKey:](v8->_groupRecords, "removeObjectForKey:", v4);
  os_unfair_lock_unlock(p_lock);

  return v11;
}

- (id)markGroupWithUUID:(id)a3 active:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  os_unfair_lock_s *p_lock;
  uint64_t v8;
  void *v9;
  HMDAccessoryNetworkProtectionGroupRegistry *v10;
  NSObject *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v18;
  id v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v4 = a4;
  v24 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  p_lock = &self->_lock;
  v8 = os_unfair_lock_lock_with_options();
  v9 = (void *)MEMORY[0x227676638](v8);
  v10 = self;
  HMFGetOSLogHandle();
  v11 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v12 = (id)objc_claimAutoreleasedReturnValue();
    HMFBooleanToString();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 138543874;
    v19 = v12;
    v20 = 2112;
    v21 = v13;
    v22 = 2112;
    v23 = v6;
    _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_INFO, "%{public}@Marking group as active: %@, group: %@", (uint8_t *)&v18, 0x20u);

  }
  objc_autoreleasePoolPop(v9);
  -[NSMutableDictionary objectForKeyedSubscript:](v10->_groupRecords, "objectForKeyedSubscript:", v6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "group");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSMutableDictionary objectForKeyedSubscript:](v10->_groupRecords, "objectForKeyedSubscript:", v6);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setActive:", v4);

  os_unfair_lock_unlock(p_lock);
  return v15;
}

- (id)logIdentifier
{
  void *v2;
  void *v3;
  void *v4;

  -[HMDAccessoryNetworkProtectionGroupRegistry home](self, "home");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (NSUUID)messageTargetUUID
{
  void *v2;
  void *v3;

  -[HMDAccessoryNetworkProtectionGroupRegistry home](self, "home");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "messageTargetUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSUUID *)v3;
}

- (void)_registerForMessages
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x24BDAC8D0];
  -[HMDAccessoryNetworkProtectionGroupRegistry home](self, "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "administratorHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *MEMORY[0x24BDD4CD0];
  +[HMDXPCMessagePolicy policyWithEntitlements:](HMDXPCMessagePolicy, "policyWithEntitlements:", 5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v6;
  +[HMDConfigurationMessagePolicy policyWithOperationTypes:](HMDConfigurationMessagePolicy, "policyWithOperationTypes:", 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v7;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v9, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "registerForMessage:receiver:policies:selector:", v5, self, v8, sel_handleUpdateAccessoryNetworkProtectionGroupProtectionMode_);

}

- (void)handleUpdateAccessoryNetworkProtectionGroupProtectionMode:(id)a3
{
  id v4;
  void *v5;
  HMDAccessoryNetworkProtectionGroupRegistry *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  HMDAccessoryNetworkProtectionGroupRegistry *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  HMDAccessoryNetworkProtectionGroupRegistry *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  HMDAccessoryNetworkProtectionGroupRegistry *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
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
    v30 = v8;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Handling UpdateAccessoryNetworkProtectionGroupProtectionMode", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v5);
  -[HMDAccessoryNetworkProtectionGroupRegistry home](v6, "home");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "networkRouterSupport");

  if ((v10 & 2) != 0)
  {
    objc_msgSend(v4, "uuidForKey:", *MEMORY[0x24BDD4CE8]);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      objc_msgSend(v4, "numberForKey:", *MEMORY[0x24BDD4CC8]);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (v17)
      {
        v18 = v17;
        v28 = 0;
        -[HMDAccessoryNetworkProtectionGroupRegistry updateTargetProtectionModeForGroupWithUUID:protectionMode:error:requestMessage:](v6, "updateTargetProtectionModeForGroupWithUUID:protectionMode:error:requestMessage:", v16, objc_msgSend(v17, "integerValue"), &v28, v4);
      }
      else
      {
        v23 = (void *)MEMORY[0x227676638]();
        v24 = v6;
        HMFGetOSLogHandle();
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v30 = v26;
          _os_log_impl(&dword_2218F0000, v25, OS_LOG_TYPE_ERROR, "%{public}@Received update group network protection mode with nil for protection mode", buf, 0xCu);

        }
        objc_autoreleasePoolPop(v23);
        objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 20);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "respondWithError:", v27);

        v18 = 0;
      }
    }
    else
    {
      v19 = (void *)MEMORY[0x227676638]();
      v20 = v6;
      HMFGetOSLogHandle();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v30 = v22;
        _os_log_impl(&dword_2218F0000, v21, OS_LOG_TYPE_ERROR, "%{public}@Received update group network protection mode with nil for group UUID", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v19);
      objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 20);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "respondWithError:", v18);
    }

  }
  else
  {
    v11 = (void *)MEMORY[0x227676638]();
    v12 = v6;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      +[HMDHomeKitVersion currentVersion](HMDHomeKitVersion, "currentVersion");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v30 = v14;
      v31 = 2112;
      v32 = v15;
      _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_ERROR, "%{public}@HomeKit version %@ does not meet the minimum version required to support network protection group update", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v11);
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 48);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "respondWithError:", v16);
  }

}

- (void)handleUpdatedAccessoryInitialManufacturerOrCategory:(id)a3
{
  id v4;
  void *v5;
  HMDAccessoryNetworkProtectionGroupRegistry *v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  HMDAccessoryNetworkProtectionGroupRegistry *v13;
  uint8_t buf[4];
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
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
    v15 = v8;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Handling UpdatedAccessoryInitialManufacturerOrCategory", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v5);
  -[HMDAccessoryNetworkProtectionGroupRegistry workQueue](v6, "workQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __98__HMDAccessoryNetworkProtectionGroupRegistry_handleUpdatedAccessoryInitialManufacturerOrCategory___block_invoke;
  v11[3] = &unk_24E79C268;
  v12 = v4;
  v13 = v6;
  v10 = v4;
  dispatch_async(v9, v11);

}

- (void)handleUpdatedAccessoryConfiguredNetworkProtectionGroup:(id)a3
{
  id v4;
  void *v5;
  HMDAccessoryNetworkProtectionGroupRegistry *v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  HMDAccessoryNetworkProtectionGroupRegistry *v13;
  uint8_t buf[4];
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
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
    v15 = v8;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Handling UpdatedAccessoryConfiguredNetworkProtectionGroup", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v5);
  -[HMDAccessoryNetworkProtectionGroupRegistry workQueue](v6, "workQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __101__HMDAccessoryNetworkProtectionGroupRegistry_handleUpdatedAccessoryConfiguredNetworkProtectionGroup___block_invoke;
  v11[3] = &unk_24E79C268;
  v12 = v4;
  v13 = v6;
  v10 = v4;
  dispatch_async(v9, v11);

}

- (void)_registerForAccessoryChanges:(id)a3
{
  id v4;
  void *v5;
  HMDAccessoryNetworkProtectionGroupRegistry *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v14;
  _BYTE buf[18];
  __int16 v16;
  __int128 *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x227676638]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = 0;
    objc_msgSend(v4, "uuid");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(v4, "uuid");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "getUUIDBytes:", buf);

    }
    else
    {
      *(_OWORD *)buf = *MEMORY[0x24BE3F2C8];
    }
    v14 = *(_OWORD *)buf;
    *(_DWORD *)buf = 138543874;
    *(_QWORD *)&buf[4] = v8;
    *(_WORD *)&buf[12] = 1040;
    *(_DWORD *)&buf[14] = 16;
    v16 = 2096;
    v17 = &v14;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Registering for manufacturer, category and configured group update for accessory: %{uuid_t}.16P", buf, 0x1Cu);

  }
  objc_autoreleasePoolPop(v5);
  -[HMDAccessoryNetworkProtectionGroupRegistry notificationCenter](v6, "notificationCenter");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addObserver:selector:name:object:", v6, sel_handleUpdatedAccessoryInitialManufacturerOrCategory_, CFSTR("HMDAccessoryManufacturerUpdatedNotification"), v4);

  -[HMDAccessoryNetworkProtectionGroupRegistry notificationCenter](v6, "notificationCenter");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addObserver:selector:name:object:", v6, sel_handleUpdatedAccessoryInitialManufacturerOrCategory_, CFSTR("HMDAccessoryCategoryUpdatedNotification"), v4);

  -[HMDAccessoryNetworkProtectionGroupRegistry notificationCenter](v6, "notificationCenter");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addObserver:selector:name:object:", v6, sel_handleUpdatedAccessoryConfiguredNetworkProtectionGroup_, CFSTR("HMDAccessoryConfiguredNetworkProtectionGroupUpdatedNotification"), v4);

}

- (void)_setupActiveGroupsForHome
{
  void *v3;
  HMDAccessoryNetworkProtectionGroupRegistry *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  void *v20;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t v26[128];
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x227676638](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)MEMORY[0x24BDD16E0];
    -[HMDAccessoryNetworkProtectionGroupRegistry home](v4, "home");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "accessories");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "numberWithUnsignedInteger:", objc_msgSend(v9, "count"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDAccessoryNetworkProtectionGroupRegistry home](v4, "home");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "name");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v28 = v6;
    v29 = 2112;
    v30 = v10;
    v31 = 2112;
    v32 = v12;
    _os_log_impl(&dword_2218F0000, v5, OS_LOG_TYPE_INFO, "%{public}@Evaluating active network protection groups based on %@ existing accessories for home %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v3);
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  -[HMDAccessoryNetworkProtectionGroupRegistry home](v4, "home", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "accessories");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v23;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v23 != v17)
          objc_enumerationMutation(v14);
        v19 = *(id *)(*((_QWORD *)&v22 + 1) + 8 * v18);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v20 = v19;
        else
          v20 = 0;
        v21 = v20;

        if (objc_msgSend(v21, "supportsNetworkProtection"))
        {
          -[HMDAccessoryNetworkProtectionGroupRegistry _registerForAccessoryChanges:](v4, "_registerForAccessoryChanges:", v21);
          -[HMDAccessoryNetworkProtectionGroupRegistry _setupProtectionGroupForAccessory:shouldNotifyChange:](v4, "_setupProtectionGroupForAccessory:shouldNotifyChange:", v21, 0);
        }

        ++v18;
      }
      while (v16 != v18);
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v16);
  }

}

- (void)_setupProtectionGroupForAccessory:(id)a3 shouldNotifyChange:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  HMDAccessoryNetworkProtectionGroupRegistry *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  HMDAccessoryNetworkProtectionGroupRegistry *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v4 = a4;
  v33 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void *)MEMORY[0x227676638]();
  v8 = self;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "uuid");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "UUIDString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "initialManufacturer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "initialCategoryIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 138544130;
    v26 = v10;
    v27 = 2112;
    v28 = v12;
    v29 = 2112;
    v30 = v13;
    v31 = 2112;
    v32 = v14;
    _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@Setting up protection group for accessory %@ with initialManufacturer: %@ initialCategoryIdentifier: %@", (uint8_t *)&v25, 0x2Au);

  }
  objc_autoreleasePoolPop(v7);
  if ((isAccessoryInDefaultGroup(v6) & 1) != 0)
  {
    -[HMDAccessoryNetworkProtectionGroupRegistry addActiveSurrogateGroupForAccessory:shouldNotifyChange:](v8, "addActiveSurrogateGroupForAccessory:shouldNotifyChange:", v6, v4);
  }
  else
  {
    v15 = (void *)MEMORY[0x227676638]();
    v16 = v8;
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "name");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "uuid");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "UUIDString");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "networkProtectionGroupUUID");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 138544130;
      v26 = v18;
      v27 = 2112;
      v28 = v19;
      v29 = 2112;
      v30 = v21;
      v31 = 2112;
      v32 = v22;
      _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_INFO, "%{public}@Accessory %@/%@ is assigned to non-default group %@", (uint8_t *)&v25, 0x2Au);

    }
    objc_autoreleasePoolPop(v15);
    objc_msgSend(v6, "networkProtectionGroupUUID");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (v23)
    {
      objc_msgSend(v6, "networkProtectionGroupUUID");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDAccessoryNetworkProtectionGroupRegistry _updateGroupWithUUID:active:](v16, "_updateGroupWithUUID:active:", v24, 1);

    }
  }

}

- (BOOL)_evaluateActiveStatusForGroupWithUUID:(id)a3
{
  id v4;
  void *v5;
  HMDAccessoryNetworkProtectionGroupRegistry *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  id v14;
  void *v15;
  id v16;
  void *v17;
  char v18;
  BOOL v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t v25[128];
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x227676638]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v27 = v8;
    v28 = 2112;
    v29 = v4;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@evaluating active status for groupUUID: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  -[HMDAccessoryNetworkProtectionGroupRegistry home](v6, "home", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "accessories");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v22;
    while (2)
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v22 != v12)
          objc_enumerationMutation(v10);
        v14 = *(id *)(*((_QWORD *)&v21 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v15 = v14;
        else
          v15 = 0;
        v16 = v15;

        objc_msgSend(v16, "networkProtectionGroupUUID");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "isEqual:", v4);

        if ((v18 & 1) != 0)
        {
          v11 = 1;
          goto LABEL_16;
        }
      }
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      if (v11)
        continue;
      break;
    }
  }
LABEL_16:

  v19 = -[HMDAccessoryNetworkProtectionGroupRegistry _updateGroupWithUUID:active:](v6, "_updateGroupWithUUID:active:", v4, v11);
  return v19;
}

- (BOOL)_updateGroupWithUUID:(id)a3 active:(BOOL)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  HMDAccessoryNetworkProtectionGroupRegistry *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  HMDAccessoryNetworkProtectionGroupRegistry *v18;
  NSObject *v19;
  void *v20;
  const char *v21;
  HMDAccessoryNetworkProtectionGroupRegistry *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  HMDAccessoryNetworkProtectionGroupRegistry *v26;
  NSObject *v27;
  void *v28;
  HMDAccessoryNetworkProtectionGroupRegistry *v29;
  int v31;
  void *v32;
  __int16 v33;
  id v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  void *v38;
  uint64_t v39;

  v4 = a4;
  v39 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  -[HMDAccessoryNetworkProtectionGroupRegistry groupWithUUID:](self, "groupWithUUID:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[HMDAccessoryNetworkProtectionGroupRegistry groupRecordWithUUID:](self, "groupRecordWithUUID:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isActive");

    if (v9 != (_DWORD)v4)
    {
      -[HMDAccessoryNetworkProtectionGroupRegistry markGroupWithUUID:active:](self, "markGroupWithUUID:active:", v6, v4);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)MEMORY[0x227676638]();
      v12 = self;
      HMFGetOSLogHandle();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        HMFBooleanToString();
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        HMFBooleanToString();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = 138544130;
        v32 = v14;
        v33 = 2112;
        v34 = v10;
        v35 = 2112;
        v36 = v15;
        v37 = 2112;
        v38 = v16;
        _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_INFO, "%{public}@Active status for group %@ changes from %@ to %@", (uint8_t *)&v31, 0x2Au);

      }
      objc_autoreleasePoolPop(v11);
      if ((_DWORD)v4)
      {
        v17 = (void *)MEMORY[0x227676638](-[HMDAccessoryNetworkProtectionGroupRegistry notifyClientsOfAddedGroup:](v12, "notifyClientsOfAddedGroup:", v10));
        v18 = v12;
        HMFGetOSLogHandle();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = 138543618;
          v32 = v20;
          v33 = 2112;
          v34 = v10;
          v21 = "%{public}@Activated network protection group %@";
LABEL_16:
          _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_INFO, v21, (uint8_t *)&v31, 0x16u);

        }
      }
      else
      {
        v17 = (void *)MEMORY[0x227676638](-[HMDAccessoryNetworkProtectionGroupRegistry notifyClientsOfRemovedGroup:](v12, "notifyClientsOfRemovedGroup:", v10));
        v29 = v12;
        HMFGetOSLogHandle();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = 138543618;
          v32 = v20;
          v33 = 2112;
          v34 = v10;
          v21 = "%{public}@De-activated network protection group %@";
          goto LABEL_16;
        }
      }

      objc_autoreleasePoolPop(v17);
      goto LABEL_18;
    }
    v25 = (void *)MEMORY[0x227676638]();
    v26 = self;
    HMFGetOSLogHandle();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = 138543618;
      v32 = v28;
      v33 = 2112;
      v34 = v6;
      _os_log_impl(&dword_2218F0000, v27, OS_LOG_TYPE_INFO, "%{public}@No change in active status for group %@", (uint8_t *)&v31, 0x16u);

    }
    objc_autoreleasePoolPop(v25);
  }
  else
  {
    v4 = MEMORY[0x227676638]();
    v22 = self;
    HMFGetOSLogHandle();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = 138543618;
      v32 = v24;
      v33 = 2112;
      v34 = v6;
      _os_log_impl(&dword_2218F0000, v23, OS_LOG_TYPE_INFO, "%{public}@No change to active status of group %@ that doesn't exist", (uint8_t *)&v31, 0x16u);

    }
    objc_autoreleasePoolPop((void *)v4);
    LOBYTE(v4) = 0;
  }
LABEL_18:

  return v4;
}

- (void)notifyClientsOfAddedGroup:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDAccessoryNetworkProtectionGroupRegistry notificationCenter](self, "notificationCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = *MEMORY[0x24BDD4CB8];
  v6 = v18;
  v19[0] = v4;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "postNotificationName:object:userInfo:", CFSTR("HMDAccessoryNetworkProtectionGroupProtectionModeActivated"), self, v7);

  -[HMDAccessoryNetworkProtectionGroupRegistry home](self, "home");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x24BE3F1D0];
  v10 = *MEMORY[0x24BDD4CA0];
  objc_msgSend(v8, "messageDestination");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v6;
  encodeRootObjectForSPIClients(v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v12;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "messageWithName:destination:payload:", v10, v11, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "setRequiresSPIEntitlement:", 1);
  objc_msgSend(v8, "msgDispatcher");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "sendMessage:completionHandler:", v14, 0);

}

- (void)notifyClientsOfRemovedGroup:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDAccessoryNetworkProtectionGroupRegistry notificationCenter](self, "notificationCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = *MEMORY[0x24BDD4CB8];
  v19[0] = v4;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "postNotificationName:object:userInfo:", CFSTR("HMDAccessoryNetworkProtectionGroupProtectionModeDeactivated"), self, v6);

  -[HMDAccessoryNetworkProtectionGroupRegistry home](self, "home");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x24BE3F1D0];
  v9 = *MEMORY[0x24BDD4CD8];
  objc_msgSend(v7, "messageDestination");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = *MEMORY[0x24BDD4CE8];
  objc_msgSend(v4, "uuid");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "UUIDString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v12;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "messageWithName:destination:payload:", v9, v10, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "setRequiresSPIEntitlement:", 1);
  objc_msgSend(v7, "msgDispatcher");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "sendMessage:completionHandler:", v14, 0);

}

- (void)addActiveSurrogateGroupForAccessory:(id)a3 shouldNotifyChange:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  id v8;
  HMDAccessoryNetworkProtectionGroup *v9;
  HMDAccessoryNetworkProtectionGroup *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  HMDAccessoryNetworkProtectionGroupRegistry *v15;
  NSObject *v16;
  _BOOL4 v17;
  void *v18;
  void *v19;
  HMDAccessoryNetworkProtectionGroupRegistry *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  HMDAccessoryNetworkProtectionGroup *v24;
  BOOL v25;
  void *v26;
  HMDAccessoryNetworkProtectionGroupRegistry *v27;
  NSObject *v28;
  _BOOL4 v29;
  void *v30;
  void *v31;
  HMDAccessoryNetworkProtectionGroup *v32;
  void *v33;
  HMDAccessoryNetworkProtectionGroup *v34;
  void *v35;
  HMDAccessoryNetworkProtectionGroupRegistry *v36;
  NSObject *v37;
  void *v38;
  void *v39;
  HMDAccessoryNetworkProtectionGroup *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  HMDAccessoryNetworkProtectionGroup *v47;
  void *v48;
  uint8_t buf[4];
  void *v50;
  __int16 v51;
  HMDAccessoryNetworkProtectionGroup *v52;
  __int16 v53;
  id v54;
  __int16 v55;
  void *v56;
  __int16 v57;
  void *v58;
  uint64_t v59;

  v4 = a4;
  v59 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  -[HMDAccessoryNetworkProtectionGroupRegistry home](self, "home");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6;
  objc_msgSend(v8, "defaultNetworkProtectionGroupUUID");
  v9 = (HMDAccessoryNetworkProtectionGroup *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = [HMDAccessoryNetworkProtectionGroup alloc];
    objc_msgSend(v8, "defaultNetworkProtectionGroupUUID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "initialManufacturer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "initialCategoryIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[HMDAccessoryNetworkProtectionGroup initWithUUID:manufacturer:category:targetProtectionMode:](v10, "initWithUUID:manufacturer:category:targetProtectionMode:", v11, v12, v13, 0);

    -[HMDAccessoryNetworkProtectionGroup configureWithHome:](v9, "configureWithHome:", v7);
  }

  v14 = (void *)MEMORY[0x227676638]();
  v15 = self;
  HMFGetOSLogHandle();
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = os_log_type_enabled(v16, OS_LOG_TYPE_INFO);
  if (!v9)
  {
    if (v17)
    {
      HMFGetLogIdentifier();
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "name");
      v40 = (HMDAccessoryNetworkProtectionGroup *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "uuid");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "UUIDString");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "initialManufacturer");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "initialCategoryIdentifier");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544386;
      v50 = v39;
      v51 = 2112;
      v52 = v40;
      v53 = 2112;
      v54 = v41;
      v55 = 2112;
      v56 = v42;
      v57 = 2112;
      v58 = v43;
      _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_INFO, "%{public}@Unable to generate surrogate group due to missing information for accessory name: %@ UUID: %@ initialManufacturer: %@ initialCategory: %@ ", buf, 0x34u);

    }
    v44 = v14;
    goto LABEL_21;
  }
  if (v17)
  {
    HMFGetLogIdentifier();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v50 = v18;
    v51 = 2112;
    v52 = v9;
    _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_INFO, "%{public}@Attempting to add active surrogate network protection group: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v14);
  v19 = (void *)MEMORY[0x227676638]();
  v20 = v15;
  HMFGetOSLogHandle();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDAccessoryNetworkProtectionGroup uuid](v9, "uuid");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDAccessoryNetworkProtectionGroupRegistry groupWithUUID:](v20, "groupWithUUID:", v23);
    v24 = (HMDAccessoryNetworkProtectionGroup *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v50 = v22;
    v51 = 2112;
    v52 = v24;
    _os_log_impl(&dword_2218F0000, v21, OS_LOG_TYPE_INFO, "%{public}@Existing network protection group with matching UUID: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v19);
  v25 = -[HMDAccessoryNetworkProtectionGroupRegistry addActiveSurrogateGroup:](v20, "addActiveSurrogateGroup:", v9);
  v26 = (void *)MEMORY[0x227676638]();
  v27 = v20;
  HMFGetOSLogHandle();
  v28 = objc_claimAutoreleasedReturnValue();
  v29 = os_log_type_enabled(v28, OS_LOG_TYPE_INFO);
  if (!v25)
  {
    if (v29)
    {
      HMFGetLogIdentifier();
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDAccessoryNetworkProtectionGroup uuid](v9, "uuid");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "UUIDString");
      v47 = (HMDAccessoryNetworkProtectionGroup *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v50 = v45;
      v51 = 2112;
      v52 = v47;
      v53 = 2112;
      v54 = v8;
      _os_log_impl(&dword_2218F0000, v28, OS_LOG_TYPE_INFO, "%{public}@No change to status of network protection group %@ on behalf of %@", buf, 0x20u);

    }
    v44 = v26;
LABEL_21:
    objc_autoreleasePoolPop(v44);
    goto LABEL_22;
  }
  if (v29)
  {
    HMFGetLogIdentifier();
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDAccessoryNetworkProtectionGroup uuid](v9, "uuid");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDAccessoryNetworkProtectionGroupRegistry groupWithUUID:](v27, "groupWithUUID:", v31);
    v32 = (HMDAccessoryNetworkProtectionGroup *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v50 = v30;
    v51 = 2112;
    v52 = v32;
    _os_log_impl(&dword_2218F0000, v28, OS_LOG_TYPE_INFO, "%{public}@Added and marked active network protection group: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v26);
  if (v4)
  {
    -[HMDAccessoryNetworkProtectionGroup uuid](v9, "uuid");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDAccessoryNetworkProtectionGroupRegistry groupWithUUID:](v27, "groupWithUUID:", v33);
    v34 = (HMDAccessoryNetworkProtectionGroup *)objc_claimAutoreleasedReturnValue();

    v35 = (void *)MEMORY[0x227676638]();
    v36 = v27;
    HMFGetOSLogHandle();
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v50 = v38;
      v51 = 2112;
      v52 = v34;
      _os_log_impl(&dword_2218F0000, v37, OS_LOG_TYPE_INFO, "%{public}@Notifying for added network protection group %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v35);
    -[HMDAccessoryNetworkProtectionGroupRegistry notifyClientsOfAddedGroup:](v36, "notifyClientsOfAddedGroup:", v34);

  }
LABEL_22:

}

- (void)configure
{
  -[HMDAccessoryNetworkProtectionGroupRegistry _setupActiveGroupsForHome](self, "_setupActiveGroupsForHome");
  -[HMDAccessoryNetworkProtectionGroupRegistry _registerForMessages](self, "_registerForMessages");
}

- (void)handleAddOrUpdateAccessoryNetworkProtectionGroupModel:(id)a3 message:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMDAccessoryNetworkProtectionGroupRegistry *v9;
  NSObject *v10;
  void *v11;
  NSMutableDictionary *groupRecords;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  HMDAccessoryNetworkProtectionGroupRegistry *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  HMDAccessoryNetworkProtectionGroup *v22;
  void *v23;
  void *v24;
  NSMutableDictionary *v25;
  void *v26;
  void *v27;
  HMDAccessoryNetworkProtectionGroupRegistry *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  void (*v37)(uint64_t);
  void *v38;
  HMDAccessoryNetworkProtectionGroupRegistry *v39;
  id v40;
  uint8_t buf[4];
  void *v42;
  __int16 v43;
  id v44;
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x227676638]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v42 = v11;
    v43 = 2112;
    v44 = v6;
    _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Handling add/update of accessory network protection group model: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v8);
  os_unfair_lock_lock_with_options();
  groupRecords = v9->_groupRecords;
  objc_msgSend(v6, "uuid");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](groupRecords, "objectForKeyedSubscript:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    objc_msgSend(v14, "setPersisted:", 1);
    objc_msgSend(v14, "group");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "transactionObjectUpdated:newValues:message:", 0, v6, v7);

    os_unfair_lock_unlock(&v9->_lock);
    v16 = (void *)MEMORY[0x227676638]();
    v17 = v9;
    HMFGetOSLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "uuid");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "UUIDString");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v42 = v19;
      v43 = 2112;
      v44 = v21;
      _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_INFO, "%{public}@Marked existing record for network protection group %@ as persisted", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v16);
  }
  else
  {
    v22 = -[HMDAccessoryNetworkProtectionGroup initWithModel:]([HMDAccessoryNetworkProtectionGroup alloc], "initWithModel:", v6);
    -[HMDAccessoryNetworkProtectionGroupRegistry home](v9, "home");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDAccessoryNetworkProtectionGroup configureWithHome:](v22, "configureWithHome:", v23);

    +[HMDAccessoryNetworkProtectionGroupRecord recordWithGroup:active:persisted:](HMDAccessoryNetworkProtectionGroupRecord, "recordWithGroup:active:persisted:", v22, 0, 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v9->_groupRecords;
    objc_msgSend(v6, "uuid");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v25, "setObject:forKeyedSubscript:", v24, v26);

    os_unfair_lock_unlock(&v9->_lock);
    v27 = (void *)MEMORY[0x227676638]();
    v28 = v9;
    HMFGetOSLogHandle();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "uuid");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "UUIDString");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v42 = v30;
      v43 = 2112;
      v44 = v32;
      _os_log_impl(&dword_2218F0000, v29, OS_LOG_TYPE_INFO, "%{public}@Added new inactive accessory network protection group model %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v27);
    -[HMDAccessoryNetworkProtectionGroupRegistry workQueue](v28, "workQueue");
    v33 = objc_claimAutoreleasedReturnValue();
    v35 = MEMORY[0x24BDAC760];
    v36 = 3221225472;
    v37 = __108__HMDAccessoryNetworkProtectionGroupRegistry_handleAddOrUpdateAccessoryNetworkProtectionGroupModel_message___block_invoke;
    v38 = &unk_24E79C268;
    v39 = v28;
    v40 = v6;
    dispatch_async(v33, &v35);

    objc_msgSend(v7, "transactionResult", v35, v36, v37, v38, v39);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "markChanged");

    objc_msgSend(v7, "respondWithPayload:", 0);
  }

}

- (void)handleRemoveAccessoryNetworkProtectionGroupModel:(id)a3 message:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMDAccessoryNetworkProtectionGroupRegistry *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  HMDAccessoryNetworkProtectionGroupRegistry *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x227676638]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "uuid");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "UUIDString");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 138543618;
    v26 = v11;
    v27 = 2112;
    v28 = v13;
    _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Handling remove of accessory network group model %@", (uint8_t *)&v25, 0x16u);

  }
  objc_autoreleasePoolPop(v8);
  objc_msgSend(v6, "uuid");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessoryNetworkProtectionGroupRegistry removeGroupWithUUID:](v9, "removeGroupWithUUID:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    if (objc_msgSend(v15, "isActive"))
    {
      objc_msgSend(v15, "group");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDAccessoryNetworkProtectionGroupRegistry notifyClientsOfRemovedGroup:](v9, "notifyClientsOfRemovedGroup:", v16);

    }
    objc_msgSend(v7, "transactionResult");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "markChanged");

    objc_msgSend(v7, "respondWithPayload:", 0);
  }
  else
  {
    v18 = (void *)MEMORY[0x227676638]();
    v19 = v9;
    HMFGetOSLogHandle();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "uuid");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "UUIDString");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 138543618;
      v26 = v21;
      v27 = 2112;
      v28 = v23;
      _os_log_impl(&dword_2218F0000, v20, OS_LOG_TYPE_ERROR, "%{public}@Accessory network protection group %@ doesn't exist to remove", (uint8_t *)&v25, 0x16u);

    }
    objc_autoreleasePoolPop(v18);
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 2);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "respondWithError:", v24);

  }
}

- (void)handleAddedAccessory:(id)a3
{
  id v4;
  NSObject *workQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  workQueue = self->_workQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __67__HMDAccessoryNetworkProtectionGroupRegistry_handleAddedAccessory___block_invoke;
  v7[3] = &unk_24E79C268;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(workQueue, v7);

}

- (void)handleRemovedAccessory:(id)a3
{
  id v4;
  NSObject *workQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  workQueue = self->_workQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __69__HMDAccessoryNetworkProtectionGroupRegistry_handleRemovedAccessory___block_invoke;
  v7[3] = &unk_24E79C268;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(workQueue, v7);

}

- (int64_t)targetProtectionModeForGroupWithUUID:(id)a3
{
  void *v3;
  void *v4;
  int64_t v5;

  -[HMDAccessoryNetworkProtectionGroupRegistry groupWithUUID:](self, "groupWithUUID:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    v5 = objc_msgSend(v3, "targetProtectionMode");
  else
    v5 = 0;

  return v5;
}

- (BOOL)updateTargetProtectionModeForGroupWithUUID:(id)a3 protectionMode:(int64_t)a4 error:(id *)a5
{
  return -[HMDAccessoryNetworkProtectionGroupRegistry updateTargetProtectionModeForGroupWithUUID:protectionMode:error:requestMessage:](self, "updateTargetProtectionModeForGroupWithUUID:protectionMode:error:requestMessage:", a3, a4, a5, 0);
}

- (BOOL)updateTargetProtectionModeForGroupWithUUID:(id)a3 protectionMode:(int64_t)a4 error:(id *)a5 requestMessage:(id)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  const __CFString *v18;
  void *v19;
  HMDAccessoryNetworkProtectionGroupRegistry *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  HMDAccessoryNetworkProtectionGroupRegistry *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  int v35;
  void *v36;
  __int16 v37;
  int64_t v38;
  __int16 v39;
  id v40;
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a6;
  if (a5)
    *a5 = 0;
  -[HMDAccessoryNetworkProtectionGroupRegistry groupRecordWithUUID:](self, "groupRecordWithUUID:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
  {
    v14 = objc_msgSend(v12, "isPersisted");
    objc_msgSend(v13, "group");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v14)
    {
      objc_msgSend(v15, "modelWithObjectChangeType:", 2);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = CFSTR("Update network protection group protection mode");
    }
    else
    {
      objc_msgSend(v15, "modelForVersion:", 4);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = CFSTR("Create network protection group");
    }

    v25 = (void *)MEMORY[0x227676638]();
    v26 = self;
    HMFGetOSLogHandle();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = 138543874;
      v36 = v28;
      v37 = 2048;
      v38 = a4;
      v39 = 2112;
      v40 = v10;
      _os_log_impl(&dword_2218F0000, v27, OS_LOG_TYPE_INFO, "%{public}@Updating target protection mode to: %ld, on group with UUID:%@", (uint8_t *)&v35, 0x20u);

    }
    objc_autoreleasePoolPop(v25);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a4);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setTargetProtectionMode:", v29);

    +[HMDBackingStoreTransactionOptions optionsWithSource:destination:mustReplay:mustPush:](HMDBackingStoreTransactionOptions, "optionsWithSource:destination:mustReplay:mustPush:", 1, 2, 0, 0);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDAccessoryNetworkProtectionGroupRegistry home](v26, "home");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "backingStore");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "transaction:options:", v18, v30);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v33, "add:withMessage:", v17, v11);
    objc_msgSend(v33, "run");

  }
  else
  {
    v19 = (void *)MEMORY[0x227676638]();
    v20 = self;
    HMFGetOSLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "UUIDString");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = 138543618;
      v36 = v22;
      v37 = 2112;
      v38 = (int64_t)v23;
      _os_log_impl(&dword_2218F0000, v21, OS_LOG_TYPE_ERROR, "%{public}@Cannot find network protection group with UUID %@", (uint8_t *)&v35, 0x16u);

    }
    objc_autoreleasePoolPop(v19);
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 2);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v24;
    if (a5)
      *a5 = objc_retainAutorelease(v24);
    objc_msgSend(v11, "respondWithError:", v17);
  }

  return v13 != 0;
}

- (id)accessoriesForGroupWithUUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  -[HMDAccessoryNetworkProtectionGroupRegistry home](self, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accessories");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __74__HMDAccessoryNetworkProtectionGroupRegistry_accessoriesForGroupWithUUID___block_invoke;
  v10[3] = &unk_24E7812F8;
  v11 = v4;
  v7 = v4;
  objc_msgSend(v6, "hmf_objectsPassingTest:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)handleAccessoryTransportAdded:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  NSObject *workQueue;
  _QWORD v8[5];
  id v9;

  objc_msgSend(a3, "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  if (v6)
  {
    workQueue = self->_workQueue;
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __76__HMDAccessoryNetworkProtectionGroupRegistry_handleAccessoryTransportAdded___block_invoke;
    v8[3] = &unk_24E79C268;
    v8[4] = self;
    v9 = v6;
    dispatch_async(workQueue, v8);

  }
}

- (HMDHome)home
{
  return (HMDHome *)objc_loadWeakRetained((id *)&self->_home);
}

- (NSNotificationCenter)notificationCenter
{
  return self->_notificationCenter;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_destroyWeak((id *)&self->_home);
  objc_storeStrong((id *)&self->_groupRecords, 0);
}

void __76__HMDAccessoryNetworkProtectionGroupRegistry_handleAccessoryTransportAdded___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x227676638]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(void **)(a1 + 40);
    v13 = 138543618;
    v14 = v5;
    v15 = 2112;
    v16 = v6;
    _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_INFO, "%{public}@Handling accessory transport added for accessory: %@", (uint8_t *)&v13, 0x16u);

  }
  objc_autoreleasePoolPop(v2);
  objc_msgSend(*(id *)(a1 + 32), "notificationCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeObserver:name:object:", *(_QWORD *)(a1 + 32), CFSTR("HMDAccessoryTransportAddedNotification"), *(_QWORD *)(a1 + 40));

  if ((objc_msgSend(*(id *)(a1 + 40), "supportsNetworkProtection") & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "_registerForAccessoryChanges:", *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 32), "_setupProtectionGroupForAccessory:shouldNotifyChange:", *(_QWORD *)(a1 + 40), 1);
  }
  else
  {
    v8 = (void *)MEMORY[0x227676638]();
    v9 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "supportsNetworkProtection");
      HMFBooleanToString();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543618;
      v14 = v11;
      v15 = 2112;
      v16 = v12;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Not creating protection group for accessory, supportsNetworkProtection: %@", (uint8_t *)&v13, 0x16u);

    }
    objc_autoreleasePoolPop(v8);
  }
}

uint64_t __74__HMDAccessoryNetworkProtectionGroupRegistry_accessoriesForGroupWithUUID___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "networkProtectionGroupUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 32));

  return v4;
}

void __69__HMDAccessoryNetworkProtectionGroupRegistry_handleRemovedAccessory___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  const char *v18;
  NSObject *v19;
  os_log_type_t v20;
  uint32_t v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x227676638]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(void **)(a1 + 40);
    v24 = 138543618;
    v25 = v5;
    v26 = 2112;
    v27 = v6;
    _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_DEBUG, "%{public}@Handling removed accessory: %@", (uint8_t *)&v24, 0x16u);

  }
  objc_autoreleasePoolPop(v2);
  v7 = *(id *)(a1 + 40);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;

  if (v9)
  {
    objc_msgSend(*(id *)(a1 + 32), "notificationCenter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "removeObserver:name:object:", *(_QWORD *)(a1 + 32), CFSTR("HMDAccessoryTransportAddedNotification"), v9);

    if ((objc_msgSend(v9, "supportsNetworkProtection") & 1) == 0)
    {
      v14 = (void *)MEMORY[0x227676638]();
      v15 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        HMFGetLogIdentifier();
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = 138543362;
        v25 = v17;
        v18 = "%{public}@Accessory does not support network protection";
        v19 = v16;
        v20 = OS_LOG_TYPE_DEBUG;
        v21 = 12;
        goto LABEL_14;
      }
LABEL_17:

      objc_autoreleasePoolPop(v14);
      goto LABEL_18;
    }
    objc_msgSend(v9, "networkProtectionGroupUUID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v11)
    {
      v14 = (void *)MEMORY[0x227676638]();
      v15 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = *(void **)(a1 + 40);
        v24 = 138543618;
        v25 = v22;
        v26 = 2112;
        v27 = v23;
        _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_INFO, "%{public}@No network protection group UUID for removed accessory %@", (uint8_t *)&v24, 0x16u);

      }
      goto LABEL_17;
    }
    v12 = *(void **)(a1 + 32);
    objc_msgSend(v9, "networkProtectionGroupUUID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v12) = objc_msgSend(v12, "_evaluateActiveStatusForGroupWithUUID:", v13);

    if ((_DWORD)v12)
    {
      v14 = (void *)MEMORY[0x227676638]();
      v15 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = 138543618;
        v25 = v17;
        v26 = 2112;
        v27 = v9;
        v18 = "%{public}@Removed accessory %@ is not the last in the network protection group";
        v19 = v16;
        v20 = OS_LOG_TYPE_INFO;
        v21 = 22;
LABEL_14:
        _os_log_impl(&dword_2218F0000, v19, v20, v18, (uint8_t *)&v24, v21);

        goto LABEL_17;
      }
      goto LABEL_17;
    }
  }
LABEL_18:

}

void __67__HMDAccessoryNetworkProtectionGroupRegistry_handleAddedAccessory___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  int v21;
  void *v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x227676638]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 40);
    v21 = 138543618;
    v22 = v5;
    v23 = 2112;
    v24 = v6;
    _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_DEBUG, "%{public}@Handling added accessory: %@", (uint8_t *)&v21, 0x16u);

  }
  objc_autoreleasePoolPop(v2);
  v7 = *(id *)(a1 + 40);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;

  if (v9)
  {
    objc_msgSend(v9, "transportInformationInstances");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "count");

    if (v11)
    {
      if ((objc_msgSend(v9, "supportsNetworkProtection") & 1) != 0)
      {
        objc_msgSend(*(id *)(a1 + 32), "_registerForAccessoryChanges:", v9);
        objc_msgSend(*(id *)(a1 + 32), "_setupProtectionGroupForAccessory:shouldNotifyChange:", v9, 1);
      }
      else
      {
        v17 = (void *)MEMORY[0x227676638]();
        v18 = *(id *)(a1 + 32);
        HMFGetOSLogHandle();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
        {
          HMFGetLogIdentifier();
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = 138543362;
          v22 = v20;
          _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_DEBUG, "%{public}@Accessory does not support network protection", (uint8_t *)&v21, 0xCu);

        }
        objc_autoreleasePoolPop(v17);
      }
    }
    else
    {
      v12 = (void *)MEMORY[0x227676638]();
      v13 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        HMFGetLogIdentifier();
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = 138543362;
        v22 = v15;
        _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_DEBUG, "%{public}@There are no transportInformationInstances", (uint8_t *)&v21, 0xCu);

      }
      objc_autoreleasePoolPop(v12);
      objc_msgSend(*(id *)(a1 + 32), "notificationCenter");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "addObserver:selector:name:object:", *(_QWORD *)(a1 + 32), sel_handleAccessoryTransportAdded_, CFSTR("HMDAccessoryTransportAddedNotification"), v9);

    }
  }

}

void __108__HMDAccessoryNetworkProtectionGroupRegistry_handleAddOrUpdateAccessoryNetworkProtectionGroupModel_message___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "uuid");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_evaluateActiveStatusForGroupWithUUID:", v2);

}

void __101__HMDAccessoryNetworkProtectionGroupRegistry_handleUpdatedAccessoryConfiguredNetworkProtectionGroup___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "object");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "userInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("HMDAccessoryPreviousConfiguredNetworkProtectionGroupUUIDKey"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = v6;
    else
      v7 = 0;
    v8 = v7;

    v9 = (void *)MEMORY[0x227676638]();
    v10 = *(id *)(a1 + 40);
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "name");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "uuid");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "UUIDString");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "UUIDString");
      v19 = v9;
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "networkProtectionGroupUUID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "UUIDString");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544386;
      v21 = v17;
      v22 = 2112;
      v23 = v16;
      v24 = 2112;
      v25 = v12;
      v26 = 2112;
      v27 = v13;
      v28 = 2112;
      v29 = v15;
      _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_INFO, "%{public}@Accessory %@/%@ is leaving group %@ and joining group %@", buf, 0x34u);

      v9 = v19;
    }

    objc_autoreleasePoolPop(v9);
    if (v8)
      objc_msgSend(*(id *)(a1 + 40), "_evaluateActiveStatusForGroupWithUUID:", v8);
    objc_msgSend(*(id *)(a1 + 40), "_setupProtectionGroupForAccessory:shouldNotifyChange:", v4, 1);

  }
}

void __98__HMDAccessoryNetworkProtectionGroupRegistry_handleUpdatedAccessoryInitialManufacturerOrCategory___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "object");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  if (v4)
  {
    v5 = (void *)MEMORY[0x227676638]();
    v6 = *(id *)(a1 + 40);
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "name");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "uuid");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "UUIDString");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "initialManufacturer");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "initialCategoryIdentifier");
      v22 = v5;
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544386;
      v24 = v8;
      v25 = 2112;
      v26 = v9;
      v27 = 2112;
      v28 = v11;
      v29 = 2112;
      v30 = v12;
      v31 = 2112;
      v32 = v13;
      _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Accessory %@/%@ has updated initialManufacturer: %@, initialCategory: %@", buf, 0x34u);

      v5 = v22;
    }

    objc_autoreleasePoolPop(v5);
    if ((isAccessoryInDefaultGroup(v4) & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 40), "addActiveSurrogateGroupForAccessory:shouldNotifyChange:", v4, 1);
    }
    else
    {
      v14 = (void *)MEMORY[0x227676638]();
      v15 = *(id *)(a1 + 40);
      HMFGetOSLogHandle();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "name");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "uuid");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "UUIDString");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "networkProtectionGroupUUID");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v24 = v17;
        v25 = 2112;
        v26 = v18;
        v27 = 2112;
        v28 = v20;
        v29 = 2112;
        v30 = v21;
        _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_INFO, "%{public}@Accessory %@/%@ is assigned to non-default group %@", buf, 0x2Au);

      }
      objc_autoreleasePoolPop(v14);
    }
  }

}

+ (id)logCategory
{
  if (logCategory__hmf_once_t10_83487 != -1)
    dispatch_once(&logCategory__hmf_once_t10_83487, &__block_literal_global_83488);
  return (id)logCategory__hmf_once_v11_83489;
}

void __57__HMDAccessoryNetworkProtectionGroupRegistry_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v11_83489;
  logCategory__hmf_once_v11_83489 = v0;

}

@end
