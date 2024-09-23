@implementation HMDServiceGroup

- (HMDServiceGroup)initWithName:(id)a3 uuid:(id)a4 home:(id)a5 queue:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  HMDServiceGroup *v14;
  uint64_t v15;
  NSString *name;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  NSUUID *uuid;
  void *v21;
  uint64_t v22;
  NSUUID *spiClientIdentifier;
  uint64_t v24;
  HMFMessageDispatcher *msgDispatcher;
  uint64_t v26;
  NSMutableArray *serviceUUIDs;
  uint64_t v28;
  NSMutableDictionary *serviceMapping;
  objc_super v31;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v31.receiver = self;
  v31.super_class = (Class)HMDServiceGroup;
  v14 = -[HMDServiceGroup init](&v31, sel_init);
  if (v14)
  {
    v15 = objc_msgSend(v10, "copy");
    name = v14->_name;
    v14->_name = (NSString *)v15;

    if (v11)
    {
      v17 = objc_msgSend(v11, "copy");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v17 = objc_claimAutoreleasedReturnValue();
    }
    v18 = (void *)v17;
    objc_msgSend(MEMORY[0x1E0D28638], "hmf_cachedInstanceForNSUUID:", v17);
    v19 = objc_claimAutoreleasedReturnValue();
    uuid = v14->_uuid;
    v14->_uuid = (NSUUID *)v19;

    spiClientIdentifierForUUID(v14->_uuid);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D28638], "hmf_cachedInstanceForNSUUID:", v21);
    v22 = objc_claimAutoreleasedReturnValue();
    spiClientIdentifier = v14->_spiClientIdentifier;
    v14->_spiClientIdentifier = (NSUUID *)v22;

    objc_storeStrong((id *)&v14->_workQueue, a6);
    objc_storeWeak((id *)&v14->_home, v12);
    objc_msgSend(v12, "msgDispatcher");
    v24 = objc_claimAutoreleasedReturnValue();
    msgDispatcher = v14->_msgDispatcher;
    v14->_msgDispatcher = (HMFMessageDispatcher *)v24;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v26 = objc_claimAutoreleasedReturnValue();
    serviceUUIDs = v14->_serviceUUIDs;
    v14->_serviceUUIDs = (NSMutableArray *)v26;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v28 = objc_claimAutoreleasedReturnValue();
    serviceMapping = v14->_serviceMapping;
    v14->_serviceMapping = (NSMutableDictionary *)v28;

    if (v13)
      -[HMDServiceGroup _registerForMessages](v14, "_registerForMessages");

  }
  return v14;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  -[HMDServiceGroup msgDispatcher](self, "msgDispatcher");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "deregisterReceiver:", self);

  -[HMDServiceGroup home](self, "home");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "administratorHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "deregisterReceiver:", self);

  v6.receiver = self;
  v6.super_class = (Class)HMDServiceGroup;
  -[HMDServiceGroup dealloc](&v6, sel_dealloc);
}

- (void)configure:(id)a3 queue:(id)a4
{
  id v6;

  v6 = a4;
  -[HMDServiceGroup setMsgDispatcher:](self, "setMsgDispatcher:", a3);
  -[HMDServiceGroup setWorkQueue:](self, "setWorkQueue:", v6);

  -[HMDServiceGroup _registerForMessages](self, "_registerForMessages");
}

- (id)dumpState
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v24;
  void *v25;
  id v26;
  id obj;
  void *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 2);
  v26 = (id)objc_claimAutoreleasedReturnValue();
  v2 = (void *)MEMORY[0x1E0CB3940];
  -[HMDServiceGroup name](self, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDServiceGroup uuid](self, "uuid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UUIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDServiceGroup urlString](self, "urlString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("name: %@, uuid: %@, assistantIdentifier: %@"), v3, v5, v6);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v26, "setObject:forKeyedSubscript:", v25, *MEMORY[0x1E0D27F80]);
  os_unfair_lock_lock_with_options();
  v7 = (void *)-[NSMutableDictionary copy](self->_serviceMapping, "copy");
  os_unfair_lock_unlock(&self->_lock);
  if (objc_msgSend(v7, "count"))
  {
    v24 = v7;
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v7, "count"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    objc_msgSend(v7, "allValues");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v31;
      v10 = (void *)*MEMORY[0x1E0D16320];
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v31 != v9)
            objc_enumerationMutation(obj);
          v12 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
          objc_msgSend(v12, "accessory");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "serviceType");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v14, "hasSuffix:", v10))
          {
            objc_msgSend(v14, "substringToIndex:", objc_msgSend(v14, "length") - objc_msgSend(v10, "length"));
            v15 = objc_claimAutoreleasedReturnValue();

            v14 = (void *)v15;
          }
          v16 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(v13, "uuid");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "UUIDString");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "instanceID");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "stringWithFormat:", CFSTR("Accessory: %@, serviceID: %@, type: %@"), v18, v19, v14);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "addObject:", v20);

        }
        v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
      }
      while (v8);
    }

    objc_msgSend(v26, "setObject:forKeyedSubscript:", v29, *MEMORY[0x1E0D27F60]);
    -[HMDServiceGroup appData](self, "appData");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "dumpState");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setObject:forKeyedSubscript:", v22, *MEMORY[0x1E0D27E60]);

    v7 = v24;
  }

  return v26;
}

- (NSArray)serviceUUIDs
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = (void *)-[NSMutableArray copy](self->_serviceUUIDs, "copy");
  os_unfair_lock_unlock(p_lock);
  return (NSArray *)v4;
}

- (NSString)name
{
  os_unfair_lock_s *p_lock;
  NSString *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_name;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setName:(id)a3
{
  NSString *v4;
  NSString *name;
  id v6;

  v6 = a3;
  os_unfair_lock_lock_with_options();
  v4 = (NSString *)objc_msgSend(v6, "copy");
  name = self->_name;
  self->_name = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)_handleRenameRequest:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  void *v7;
  HMDServiceGroup *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  HMDServiceGroupModel *v16;
  void *v17;
  void *v18;
  HMDServiceGroupModel *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v24[4];
  id v25;
  id v26;
  uint8_t buf[4];
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "stringForKey:", *MEMORY[0x1E0CBAC40]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v11 = (void *)MEMORY[0x1E0CB35C8];
    v12 = 20;
LABEL_7:
    objc_msgSend(v11, "hmErrorWithCode:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "respondWithError:", v13);
    goto LABEL_12;
  }
  v6 = HMMaxLengthForNaming();
  if (objc_msgSend(v5, "length") > v6)
  {
    v7 = (void *)MEMORY[0x1D17BA0A0]();
    v8 = self;
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v28 = v10;
      _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_ERROR, "%{public}@New name is longer than the pre-defined max length", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v7);
    v11 = (void *)MEMORY[0x1E0CB35C8];
    v12 = 46;
    goto LABEL_7;
  }
  -[HMDServiceGroup home](self, "home");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDServiceGroup name](self, "name");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "replaceName:withNewName:", v14, v5);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    objc_msgSend(v4, "respondWithError:", v15);
  }
  else
  {
    v16 = [HMDServiceGroupModel alloc];
    -[HMDServiceGroup uuid](self, "uuid");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "uuid");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = -[HMDBackingStoreModelObject initWithObjectChangeType:uuid:parentUUID:](v16, "initWithObjectChangeType:uuid:parentUUID:", 2, v17, v18);

    -[HMDServiceGroupModel setName:](v19, "setName:", v5);
    objc_msgSend(v13, "backingStore");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "name");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMDBackingStoreTransactionOptions defaultXPCOptions](HMDBackingStoreTransactionOptions, "defaultXPCOptions");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "transaction:options:", v21, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v23, "add:", v19);
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __40__HMDServiceGroup__handleRenameRequest___block_invoke;
    v24[3] = &unk_1E89C21C0;
    v25 = v4;
    v26 = v5;
    objc_msgSend(v23, "run:", v24);

  }
LABEL_12:

}

- (void)fixupServicesForReplacementAccessory:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  objc_msgSend(a3, "services", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        -[HMDServiceGroup setServiceIfPresent:](self, "setServiceIfPresent:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void)setServiceIfPresent:(id)a3
{
  os_unfair_lock_s *p_lock;
  NSMutableArray *serviceUUIDs;
  void *v6;
  void *v7;
  NSMutableDictionary *serviceMapping;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  serviceUUIDs = self->_serviceUUIDs;
  objc_msgSend(v11, "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(serviceUUIDs) = -[NSMutableArray containsObject:](serviceUUIDs, "containsObject:", v7);

  if ((_DWORD)serviceUUIDs)
  {
    serviceMapping = self->_serviceMapping;
    objc_msgSend(v11, "uuid");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "UUIDString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](serviceMapping, "setObject:forKey:", v11, v10);

  }
  os_unfair_lock_unlock(p_lock);

}

- (void)removeServicesForAccessory:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  objc_msgSend(a3, "services", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        -[HMDServiceGroup removeService:](self, "removeService:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

  -[HMDServiceGroup home](self, "home");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "saveWithReason:postSyncNotification:", CFSTR("kServiceRemovedFromGroupNotificationKey"), 1);

}

- (void)removeService:(id)a3
{
  id v4;
  os_unfair_lock_s *p_lock;
  NSMutableArray *serviceUUIDs;
  void *v7;
  void *v8;
  NSMutableDictionary *serviceMapping;
  void *v10;
  void *v11;
  void *v12;
  HMDServiceGroup *v13;
  NSObject *v14;
  void *v15;
  int v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    p_lock = &self->_lock;
    os_unfair_lock_lock_with_options();
    serviceUUIDs = self->_serviceUUIDs;
    objc_msgSend(v4, "uuid");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "UUIDString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray removeObject:](serviceUUIDs, "removeObject:", v8);

    serviceMapping = self->_serviceMapping;
    objc_msgSend(v4, "uuid");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "UUIDString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary removeObjectForKey:](serviceMapping, "removeObjectForKey:", v11);

    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    v12 = (void *)MEMORY[0x1D17BA0A0]();
    v13 = self;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138543362;
      v17 = v15;
      _os_log_impl(&dword_1CD062000, v14, OS_LOG_TYPE_INFO, "%{public}@Cannot remove nil service from service group", (uint8_t *)&v16, 0xCu);

    }
    objc_autoreleasePoolPop(v12);
  }

}

- (HMDServiceGroup)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  HMDServiceGroup *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  NSMutableDictionary *serviceMapping;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  NSMutableArray *serviceUUIDs;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  HMDApplicationData *appData;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  _QWORD v47[4];

  v47[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("home"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), *MEMORY[0x1E0CBAC38]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hm_truncatedNameString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "hm_decodeAndCacheUUIDFromStringForKey:", *MEMORY[0x1E0CBAC58]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[HMDServiceGroup initWithName:uuid:home:queue:](self, "initWithName:uuid:home:queue:", v7, v8, v5, 0);
  if (v9)
  {
    objc_msgSend(v4, "hm_decodeArrayOfConditionalObjects:forKey:", objc_opt_class(), *MEMORY[0x1E0CBAC50]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)MEMORY[0x1E0C99E60];
    v47[0] = objc_opt_class();
    v47[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v47, 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setWithArray:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v13, *MEMORY[0x1E0CBAC48]);
    v41 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = v10;
    v15 = &OBJC_IVAR___HMDAggregationAnalysisLogEvent__rxIDSProxyMessagesCount;
    if (objc_msgSend(v10, "count"))
    {
      v37 = v8;
      v38 = v7;
      v39 = v5;
      v40 = v4;
      v44 = 0u;
      v45 = 0u;
      v42 = 0u;
      v43 = 0u;
      v36 = v10;
      v16 = v10;
      v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
      if (v17)
      {
        v18 = v17;
        v19 = *(_QWORD *)v43;
        do
        {
          for (i = 0; i != v18; ++i)
          {
            if (*(_QWORD *)v43 != v19)
              objc_enumerationMutation(v16);
            v21 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * i);
            objc_msgSend(v21, "uuid", v36, v37, v38, v39, v40);
            v22 = (void *)objc_claimAutoreleasedReturnValue();

            if (v22)
            {
              serviceMapping = v9->_serviceMapping;
              objc_msgSend(v21, "uuid");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v24, "UUIDString");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSMutableDictionary setObject:forKey:](serviceMapping, "setObject:forKey:", v21, v25);

            }
          }
          v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
        }
        while (v18);
      }

      -[NSMutableDictionary allKeys](v9->_serviceMapping, "allKeys");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v26, "mutableCopy");
      v15 = &OBJC_IVAR___HMDAggregationAnalysisLogEvent__rxIDSProxyMessagesCount;
      serviceUUIDs = v9->_serviceUUIDs;
      v9->_serviceUUIDs = (NSMutableArray *)v27;

      v5 = v39;
      v4 = v40;
      v8 = v37;
      v7 = v38;
      v14 = v36;
    }
    if (objc_msgSend(v41, "count", v36, v37, v38, v39, v40))
    {
      -[HMDServiceGroup _handleUpdateServicesTransaction:](v9, "_handleUpdateServicesTransaction:", v41);
    }
    else
    {
      -[NSMutableDictionary allKeys](v9->_serviceMapping, "allKeys");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v29, "mutableCopy");
      v31 = v15[885];
      v32 = *(Class *)((char *)&v9->super.super.isa + v31);
      *(Class *)((char *)&v9->super.super.isa + v31) = (Class)v30;

    }
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HM.appDataRepository"));
    v33 = objc_claimAutoreleasedReturnValue();
    appData = v9->_appData;
    v9->_appData = (HMDApplicationData *)v33;

    -[HMDApplicationData updateParentUUIDIfNil:](v9->_appData, "updateParentUUIDIfNil:", v9->_uuid);
  }

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  int v9;
  int v10;
  void *v11;
  void *v12;
  __CFString *v13;
  __CFString *v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a3;
  -[HMDServiceGroup home](self, "home");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "encodeConditionalObject:forKey:", v4, CFSTR("home"));
  -[HMDServiceGroup name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "encodeObject:forKey:", v5, *MEMORY[0x1E0CBAC38]);

  -[HMDServiceGroup uuid](self, "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "encodeObject:forKey:", v7, *MEMORY[0x1E0CBAC58]);

  v8 = objc_msgSend(v17, "hmd_isForXPCTransport");
  v9 = objc_msgSend(v17, "hmd_isForXPCTransportEntitledForSPIAccess");
  v10 = objc_msgSend(v17, "hmd_isForLocalStore");
  os_unfair_lock_lock_with_options();
  -[NSMutableDictionary allValues](self->_serviceMapping, "allValues");
  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "hm_encodeArrayOfConditionalObjects:forKey:", v11, *MEMORY[0x1E0CBAC50]);

    objc_msgSend(v17, "encodeObject:forKey:", self->_serviceUUIDs, *MEMORY[0x1E0CBAC48]);
  }
  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "hm_encodeArrayOfConditionalObjects:forKey:", v12, *MEMORY[0x1E0CBAC50]);

  }
  os_unfair_lock_unlock(&self->_lock);
  if (v8)
  {
    if (v9)
    {
      v13 = CFSTR("com.apple.homekit-entitledclient.identifer");
      v14 = CFSTR("com.apple.homekit-entitledclient.identifer");
    }
    else
    {
      objc_msgSend(v17, "hmd_applicationBundleIdentifier");
      v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    -[HMDServiceGroup appData](self, "appData");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "applicationDataForIdentifier:", v13);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
      objc_msgSend(v17, "encodeObject:forKey:", v16, CFSTR("HM.appData"));

  }
  else
  {
    -[HMDServiceGroup appData](self, "appData");
    v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "encodeObject:forKey:", v13, CFSTR("HM.appDataRepository"));
  }

}

- (void)_registerForMessages
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  HMDServiceGroup *v21;
  NSObject *v22;
  void *v23;
  _QWORD v24[2];
  _QWORD v25[2];
  _QWORD v26[2];
  uint8_t buf[4];
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  -[HMDServiceGroup home](self, "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "administratorHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *MEMORY[0x1E0CBAAA0];
    +[HMDConfigurationMessagePolicy policyWithOperationTypes:](HMDConfigurationMessagePolicy, "policyWithOperationTypes:", 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = v7;
    +[HMDXPCMessagePolicy policyWithEntitlements:](HMDXPCMessagePolicy, "policyWithEntitlements:", 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v26[1] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "registerForMessage:receiver:policies:selector:", v6, self, v9, sel__handleAddServiceRequest_);

    objc_msgSend(v4, "administratorHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *MEMORY[0x1E0CBABE0];
    +[HMDConfigurationMessagePolicy policyWithOperationTypes:](HMDConfigurationMessagePolicy, "policyWithOperationTypes:", 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = v12;
    +[HMDXPCMessagePolicy policyWithEntitlements:](HMDXPCMessagePolicy, "policyWithEntitlements:", 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v25[1] = v13;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "registerForMessage:receiver:policies:selector:", v11, self, v14, sel__handleRemoveServiceRequest_);

    objc_msgSend(v4, "administratorHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = *MEMORY[0x1E0CBABE8];
    +[HMDConfigurationMessagePolicy policyWithOperationTypes:](HMDConfigurationMessagePolicy, "policyWithOperationTypes:", 2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMDXPCMessagePolicy policyWithEntitlements:](HMDXPCMessagePolicy, "policyWithEntitlements:", 1, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v24[1] = v18;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 2);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "registerForMessage:receiver:policies:selector:", v16, self, v19, sel__handleRenameRequest_);

  }
  else
  {
    v20 = (void *)MEMORY[0x1D17BA0A0]();
    v21 = self;
    HMFGetOSLogHandle();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v28 = v23;
      _os_log_impl(&dword_1CD062000, v22, OS_LOG_TYPE_INFO, "%{public}@Not registering for messages as home is nil", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v20);
  }

}

- (void)_handleAddServiceRequest:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  HMDServiceGroupModel *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  HMDServiceGroupModel *v25;
  void *v26;
  void *v27;
  unint64_t v28;
  NSMutableArray *serviceUUIDs;
  void *v30;
  void *v31;
  NSObject *v32;
  id v33;
  NSString *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  NSObject *v38;
  id v39;
  NSString *name;
  void *v41;
  void *v42;
  NSMutableArray *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  os_unfair_lock_t lock;
  void *v51;
  void *v52;
  void *v53;
  _QWORD v54[5];
  id v55;
  id v56;
  uint8_t buf[4];
  id v58;
  __int16 v59;
  void *v60;
  __int16 v61;
  void *v62;
  __int16 v63;
  NSString *v64;
  __int16 v65;
  void *v66;
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "uuidForKey:", CFSTR("kAccessoryUUID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "numberForKey:", CFSTR("kServiceInstanceID"));
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v5 && v6)
  {
    +[HMDService generateUUIDWithAccessoryUUID:serviceID:](HMDService, "generateUUIDWithAccessoryUUID:serviceID:", v5, v6);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDServiceGroup home](self, "home");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "accessoryWithUUID:", v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v10 = v9;
    else
      v10 = 0;
    v11 = v10;

    v51 = v11;
    objc_msgSend(v11, "serviceWithUUID:", v53);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = v12;
    if (!v12)
    {
      v21 = (void *)MEMORY[0x1D17BA0A0]();
      HMFGetOSLogHandle();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "name");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v58 = v23;
        v59 = 2112;
        v60 = v53;
        v61 = 2112;
        v62 = v24;
        _os_log_impl(&dword_1CD062000, v22, OS_LOG_TYPE_ERROR, "%{public}@Service with UUID %@ does not exist in home %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v21);
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 2);
      v19 = (HMDServiceGroupModel *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "respondWithError:", v19);
      goto LABEL_28;
    }
    objc_msgSend(v12, "type");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "isEqualToString:", *MEMORY[0x1E0D16198]);

    if (v14)
    {
      v15 = (void *)MEMORY[0x1D17BA0A0]();
      HMFGetOSLogHandle();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "name");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v58 = v17;
        v59 = 2112;
        v60 = v53;
        v61 = 2112;
        v62 = v18;
        _os_log_impl(&dword_1CD062000, v16, OS_LOG_TYPE_ERROR, "%{public}@Rejecting attempt to associate acc info service with UUID %@ in home %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v15);
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 3);
      v19 = (HMDServiceGroupModel *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "respondWithError:", v19);
      goto LABEL_28;
    }
    v25 = [HMDServiceGroupModel alloc];
    -[HMDServiceGroup uuid](self, "uuid");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "uuid");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = -[HMDBackingStoreModelObject initWithObjectChangeType:uuid:parentUUID:](v25, "initWithObjectChangeType:uuid:parentUUID:", 2, v26, v27);

    lock = &self->_lock;
    os_unfair_lock_lock_with_options();
    v28 = -[NSMutableArray count](self->_serviceUUIDs, "count");
    if (v28 >= maximumServicesPerServiceGroup)
    {
      v37 = (void *)MEMORY[0x1D17BA0A0]();
      HMFGetOSLogHandle();
      v38 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
      {
        v49 = v37;
        HMFGetLogIdentifier();
        v39 = (id)objc_claimAutoreleasedReturnValue();
        name = self->_name;
        objc_msgSend(v8, "name");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544386;
        v58 = v39;
        v59 = 2112;
        v60 = v7;
        v61 = 2112;
        v62 = v5;
        v63 = 2112;
        v64 = name;
        v65 = 2112;
        v66 = v41;
        _os_log_impl(&dword_1CD062000, v38, OS_LOG_TYPE_INFO, "%{public}@Can't add service %@:%@ to service group %@ in home %@; already at maximum services for group",
          buf,
          0x34u);

        v37 = v49;
      }

      objc_autoreleasePoolPop(v37);
      v36 = 49;
    }
    else
    {
      serviceUUIDs = self->_serviceUUIDs;
      objc_msgSend(v53, "UUIDString");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(serviceUUIDs) = -[NSMutableArray containsObject:](serviceUUIDs, "containsObject:", v30);

      if (!(_DWORD)serviceUUIDs)
      {
        v43 = self->_serviceUUIDs;
        objc_msgSend(v53, "UUIDString");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableArray addObject:](v43, "addObject:", v44);

        v45 = (void *)-[NSMutableArray copy](self->_serviceUUIDs, "copy");
        -[HMDServiceGroupModel setServices:](v19, "setServices:", v45);

        os_unfair_lock_unlock(lock);
        goto LABEL_26;
      }
      v31 = (void *)MEMORY[0x1D17BA0A0]();
      HMFGetOSLogHandle();
      v32 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        v49 = v31;
        HMFGetLogIdentifier();
        v33 = (id)objc_claimAutoreleasedReturnValue();
        v34 = self->_name;
        objc_msgSend(v8, "name");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544386;
        v58 = v33;
        v59 = 2112;
        v60 = v7;
        v61 = 2112;
        v62 = v5;
        v63 = 2112;
        v64 = v34;
        v65 = 2112;
        v66 = v35;
        _os_log_impl(&dword_1CD062000, v32, OS_LOG_TYPE_ERROR, "%{public}@Service %@:%@ already exists in service group %@ in home %@", buf, 0x34u);

        v31 = v49;
      }

      objc_autoreleasePoolPop(v31);
      v36 = 1;
    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", v36, v49);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    os_unfair_lock_unlock(lock);
    if (v42)
    {
      objc_msgSend(v4, "respondWithError:", v42);
LABEL_27:

LABEL_28:
      goto LABEL_29;
    }
LABEL_26:
    objc_msgSend(v8, "backingStore");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "name");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMDBackingStoreTransactionOptions defaultXPCOptions](HMDBackingStoreTransactionOptions, "defaultXPCOptions");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "transaction:options:", v47, v48);
    v42 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v42, "add:", v19);
    v54[0] = MEMORY[0x1E0C809B0];
    v54[1] = 3221225472;
    v54[2] = __44__HMDServiceGroup__handleAddServiceRequest___block_invoke;
    v54[3] = &unk_1E89C0DA8;
    v54[4] = self;
    v55 = v53;
    v56 = v4;
    objc_msgSend(v42, "run:", v54);

    goto LABEL_27;
  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 20);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "respondWithError:", v20);

LABEL_29:
}

- (void)_handleRemoveServiceRequest:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  HMDServiceGroupModel *v9;
  void *v10;
  void *v11;
  NSMutableArray *serviceUUIDs;
  void *v13;
  NSMutableArray *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  id v21;
  NSString *name;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  HMDServiceGroupModel *v29;
  void *v30;
  _QWORD v31[5];
  id v32;
  id v33;
  uint8_t buf[4];
  id v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  NSString *v41;
  __int16 v42;
  void *v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "uuidForKey:", CFSTR("kAccessoryUUID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "numberForKey:", CFSTR("kServiceInstanceID"));
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v5 && v6)
  {
    +[HMDService generateUUIDWithAccessoryUUID:serviceID:](HMDService, "generateUUIDWithAccessoryUUID:serviceID:", v5, v6);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDServiceGroup home](self, "home");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = [HMDServiceGroupModel alloc];
    -[HMDServiceGroup uuid](self, "uuid");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "uuid");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = -[HMDBackingStoreModelObject initWithObjectChangeType:uuid:parentUUID:](v9, "initWithObjectChangeType:uuid:parentUUID:", 2, v10, v11);

    os_unfair_lock_lock_with_options();
    serviceUUIDs = self->_serviceUUIDs;
    objc_msgSend(v30, "UUIDString");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(serviceUUIDs) = -[NSMutableArray containsObject:](serviceUUIDs, "containsObject:", v13);

    if ((serviceUUIDs & 1) != 0)
    {
      v14 = self->_serviceUUIDs;
      objc_msgSend(v30, "UUIDString");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray removeObject:](v14, "removeObject:", v15);

      v16 = (void *)-[NSMutableArray copy](self->_serviceUUIDs, "copy");
      -[HMDServiceGroupModel setServices:](v29, "setServices:", v16);

      os_unfair_lock_unlock(&self->_lock);
    }
    else
    {
      v18 = (void *)MEMORY[0x1D17BA0A0]();
      HMFGetOSLogHandle();
      v19 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        v28 = v18;
        v20 = v8;
        HMFGetLogIdentifier();
        v21 = (id)objc_claimAutoreleasedReturnValue();
        name = self->_name;
        objc_msgSend(v20, "name");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544386;
        v35 = v21;
        v36 = 2112;
        v37 = v7;
        v38 = 2112;
        v39 = v5;
        v40 = 2112;
        v41 = name;
        v42 = 2112;
        v43 = v23;
        _os_log_impl(&dword_1CD062000, v19, OS_LOG_TYPE_ERROR, "%{public}@Service %@:%@ does not exist in group %@ in home %@", buf, 0x34u);

        v8 = v20;
        v18 = v28;

      }
      objc_autoreleasePoolPop(v18);
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 2);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      os_unfair_lock_unlock(&self->_lock);
      if (v24)
      {
        objc_msgSend(v4, "respondWithError:", v24);
LABEL_11:

        goto LABEL_12;
      }
    }
    objc_msgSend(v8, "backingStore", v28);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "name");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMDBackingStoreTransactionOptions defaultXPCOptions](HMDBackingStoreTransactionOptions, "defaultXPCOptions");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "transaction:options:", v26, v27);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v24, "add:", v29);
    v31[0] = MEMORY[0x1E0C809B0];
    v31[1] = 3221225472;
    v31[2] = __47__HMDServiceGroup__handleRemoveServiceRequest___block_invoke;
    v31[3] = &unk_1E89C0DA8;
    v31[4] = self;
    v32 = v30;
    v33 = v4;
    objc_msgSend(v24, "run:", v31);

    goto LABEL_11;
  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 20);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "respondWithError:", v17);

LABEL_12:
}

- (void)transactionObjectUpdated:(id)a3 newValues:(id)a4 message:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  HMDServiceGroup *v17;
  NSObject *v18;
  void *v19;
  id v20;
  int v21;
  void *v22;
  __int16 v23;
  id v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v11 = v9;
  else
    v11 = 0;
  v12 = v11;
  if (v12)
  {
    -[HMDServiceGroup _transactionServiceGroupUpdated:newValues:message:](self, "_transactionServiceGroupUpdated:newValues:message:", 0, v12, v10);
    v13 = v9;
  }
  else
  {
    v13 = v9;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v14 = v13;
    else
      v14 = 0;
    v15 = v14;

    if (v15)
    {
      -[HMDServiceGroup _handleUpdateAppDataModel:message:](self, "_handleUpdateAppDataModel:message:", v15, v10);
    }
    else
    {
      v16 = (void *)MEMORY[0x1D17BA0A0]();
      v17 = self;
      HMFGetOSLogHandle();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = 138543874;
        v22 = v19;
        v23 = 2112;
        v24 = v13;
        v25 = 2112;
        v26 = (id)objc_opt_class();
        v20 = v26;
        _os_log_impl(&dword_1CD062000, v18, OS_LOG_TYPE_ERROR, "%{public}@Unknown model object (%@) sent to [%@ transactionObjectUpdated]", (uint8_t *)&v21, 0x20u);

      }
      objc_autoreleasePoolPop(v16);
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 2);
      v13 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "respondWithError:", v13);
    }
  }

}

- (void)transactionObjectRemoved:(id)a3 message:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  HMDServiceGroup *v12;
  NSObject *v13;
  void *v14;
  id v15;
  void *v16;
  int v17;
  void *v18;
  __int16 v19;
  id v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v6;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v9 = v8;
  else
    v9 = 0;
  v10 = v9;

  if (v10)
  {
    -[HMDServiceGroup _handleRemoveAppDataModel:message:](self, "_handleRemoveAppDataModel:message:", v10, v7);
  }
  else
  {
    v11 = (void *)MEMORY[0x1D17BA0A0]();
    v12 = self;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138543874;
      v18 = v14;
      v19 = 2112;
      v20 = v8;
      v21 = 2112;
      v22 = (id)objc_opt_class();
      v15 = v22;
      _os_log_impl(&dword_1CD062000, v13, OS_LOG_TYPE_ERROR, "%{public}@Unknown model object (%@) sent to [%@ transactionObjectRemoved]", (uint8_t *)&v17, 0x20u);

    }
    objc_autoreleasePoolPop(v11);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "respondWithError:", v16);

  }
}

- (id)updateServiceGroupWithModel:(id)a3 message:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;

  v6 = a3;
  v7 = a4;
  -[HMDServiceGroup home](self, "home");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 21);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v6, "name");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    -[HMDServiceGroup name](self, "name");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = HMFEqualObjects();

    if ((v12 & 1) == 0)
    {
      objc_msgSend(v10, "hm_truncatedNameString");
      v13 = objc_claimAutoreleasedReturnValue();

      -[HMDServiceGroup name](self, "name");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (id)objc_msgSend(v8, "replaceName:withNewName:", v14, v13);

      -[HMDServiceGroup setName:](self, "setName:", v13);
      v10 = (void *)v13;
    }
  }
  if (!v9)
  {
    objc_msgSend(v6, "services");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      objc_msgSend(v6, "services");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDServiceGroup _handleUpdateServicesTransaction:](self, "_handleUpdateServicesTransaction:", v17);

    }
    objc_msgSend(v7, "transactionResult");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "markChanged");
    objc_msgSend(v18, "markSaveToAssistant");

  }
  return v9;
}

- (void)_transactionServiceGroupUpdated:(id)a3 newValues:(id)a4 message:(id)a5
{
  id v7;
  id v8;

  v7 = a5;
  -[HMDServiceGroup updateServiceGroupWithModel:message:](self, "updateServiceGroupWithModel:message:", a4, v7);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "respondWithPayload:error:", 0, v8);

}

- (void)_handleUpdateServicesTransaction:(id)a3
{
  id v4;
  void *i;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t j;
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  NSMutableArray *serviceUUIDs;
  uint64_t v23;
  uint64_t v24;
  uint64_t k;
  uint64_t v26;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  NSString *name;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t m;
  uint64_t v36;
  void *v37;
  void *v38;
  NSObject *v39;
  void *v40;
  NSString *v41;
  id obj;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  void *v46;
  id v47;
  id v48;
  void *v49;
  HMDServiceGroup *v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  uint8_t v67[128];
  uint8_t buf[4];
  void *v69;
  __int16 v70;
  uint64_t v71;
  __int16 v72;
  NSString *v73;
  _BYTE v74[128];
  _BYTE v75[128];
  _BYTE v76[128];
  uint64_t v77;

  v77 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v50 = self;
  -[HMDServiceGroup home](self, "home");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v65 = 0u;
  v66 = 0u;
  v63 = 0u;
  v64 = 0u;
  obj = v4;
  v47 = (id)objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v63, v76, 16);
  if (v47)
  {
    v45 = *(_QWORD *)v64;
    v43 = *MEMORY[0x1E0D16198];
    do
    {
      for (i = 0; i != v47; i = (char *)i + 1)
      {
        if (*(_QWORD *)v64 != v45)
          objc_enumerationMutation(obj);
        v6 = *(_QWORD *)(*((_QWORD *)&v63 + 1) + 8 * (_QWORD)i);
        v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v6);
        v61 = 0u;
        v62 = 0u;
        v59 = 0u;
        v60 = 0u;
        objc_msgSend(v46, "accessories");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v59, v75, 16);
        if (v9)
        {
          v10 = *(_QWORD *)v60;
          while (2)
          {
            for (j = 0; j != v9; ++j)
            {
              if (*(_QWORD *)v60 != v10)
                objc_enumerationMutation(v8);
              v12 = *(id *)(*((_QWORD *)&v59 + 1) + 8 * j);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
                v13 = v12;
              else
                v13 = 0;
              v14 = v13;

              objc_msgSend(v14, "serviceWithUUID:", v7);
              v15 = (void *)objc_claimAutoreleasedReturnValue();

              if (v15)
              {

                objc_msgSend(v15, "type");
                v16 = (void *)objc_claimAutoreleasedReturnValue();
                v17 = objc_msgSend(v16, "isEqualToString:", v43);

                if ((v17 & 1) == 0)
                  objc_msgSend(v49, "setObject:forKeyedSubscript:", v15, v6);
                goto LABEL_20;
              }
            }
            v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v59, v75, 16);
            if (v9)
              continue;
            break;
          }
        }

        v15 = 0;
LABEL_20:

      }
      v47 = (id)objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v63, v76, 16);
    }
    while (v47);
  }

  v18 = (void *)objc_msgSend(obj, "mutableCopy");
  os_unfair_lock_lock_with_options();
  -[NSMutableDictionary allKeys](v50->_serviceMapping, "allKeys");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "removeObjectsInArray:", v19);

  -[NSMutableDictionary allKeys](v50->_serviceMapping, "allKeys");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = (void *)objc_msgSend(v20, "mutableCopy");

  objc_msgSend(v44, "removeObjectsInArray:", obj);
  v21 = objc_msgSend(obj, "mutableCopy");
  serviceUUIDs = v50->_serviceUUIDs;
  v50->_serviceUUIDs = (NSMutableArray *)v21;

  v57 = 0u;
  v58 = 0u;
  v55 = 0u;
  v56 = 0u;
  v48 = v18;
  v23 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v55, v74, 16);
  if (v23)
  {
    v24 = *(_QWORD *)v56;
    do
    {
      for (k = 0; k != v23; ++k)
      {
        if (*(_QWORD *)v56 != v24)
          objc_enumerationMutation(v48);
        v26 = *(_QWORD *)(*((_QWORD *)&v55 + 1) + 8 * k);
        objc_msgSend(v49, "objectForKeyedSubscript:", v26);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        if (v27)
        {
          v28 = (void *)MEMORY[0x1D17BA0A0](-[NSMutableDictionary setObject:forKey:](v50->_serviceMapping, "setObject:forKey:", v27, v26));
          HMFGetOSLogHandle();
          v29 = (id)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            name = v50->_name;
            *(_DWORD *)buf = 138543874;
            v69 = v30;
            v70 = 2112;
            v71 = v26;
            v72 = 2112;
            v73 = name;
            _os_log_impl(&dword_1CD062000, v29, OS_LOG_TYPE_INFO, "%{public}@Add service uuid: %@ to group: %@", buf, 0x20u);

          }
          objc_autoreleasePoolPop(v28);
        }

      }
      v23 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v55, v74, 16);
    }
    while (v23);
  }

  v53 = 0u;
  v54 = 0u;
  v51 = 0u;
  v52 = 0u;
  v32 = v44;
  v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v51, v67, 16);
  if (v33)
  {
    v34 = *(_QWORD *)v52;
    do
    {
      for (m = 0; m != v33; ++m)
      {
        if (*(_QWORD *)v52 != v34)
          objc_enumerationMutation(v32);
        v36 = *(_QWORD *)(*((_QWORD *)&v51 + 1) + 8 * m);
        -[NSMutableDictionary objectForKey:](v50->_serviceMapping, "objectForKey:", v36);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        if (v37)
        {
          v38 = (void *)MEMORY[0x1D17BA0A0](-[NSMutableDictionary removeObjectForKey:](v50->_serviceMapping, "removeObjectForKey:", v36));
          HMFGetOSLogHandle();
          v39 = (id)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            v41 = v50->_name;
            *(_DWORD *)buf = 138543874;
            v69 = v40;
            v70 = 2112;
            v71 = v36;
            v72 = 2112;
            v73 = v41;
            _os_log_impl(&dword_1CD062000, v39, OS_LOG_TYPE_INFO, "%{public}@Remove service uuid: %@ from group: %@", buf, 0x20u);

          }
          objc_autoreleasePoolPop(v38);
        }

      }
      v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v51, v67, 16);
    }
    while (v33);
  }

  os_unfair_lock_unlock(&v50->_lock);
}

- (void)_handleUpdateAppDataModel:(id)a3 message:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  HMDApplicationData *v10;
  void *v11;
  void *v12;
  HMDApplicationData *v13;
  void *v14;
  HMDServiceGroup *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[HMDServiceGroup appData](self, "appData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[HMDServiceGroup appData](self, "appData");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "updateWithModel:", v6);

  }
  else
  {
    v10 = [HMDApplicationData alloc];
    objc_msgSend(v6, "appDataDictionary");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDServiceGroup uuid](self, "uuid");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[HMDApplicationData initWithDictionary:parentUUID:](v10, "initWithDictionary:parentUUID:", v11, v12);
    -[HMDServiceGroup setAppData:](self, "setAppData:", v13);

    v14 = (void *)MEMORY[0x1D17BA0A0]();
    v15 = self;
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "appDataDictionary");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138543618;
      v21 = v17;
      v22 = 2112;
      v23 = v18;
      _os_log_impl(&dword_1CD062000, v16, OS_LOG_TYPE_DEBUG, "%{public}@Updating the application data : %@", (uint8_t *)&v20, 0x16u);

    }
    objc_autoreleasePoolPop(v14);
  }
  objc_msgSend(v7, "transactionResult");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "markChanged");
  objc_msgSend(v7, "respondWithPayload:", 0);

}

- (void)_handleRemoveAppDataModel:(id)a3 message:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  -[HMDServiceGroup setAppData:](self, "setAppData:", 0);
  objc_msgSend(v5, "transactionResult");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "markChanged");
  objc_msgSend(v5, "respondWithPayload:", 0);

}

- (id)modelObjectWithChangeType:(unint64_t)a3
{
  HMDServiceGroupModel *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  os_unfair_lock_t lock;
  HMDServiceGroupModel *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = [HMDServiceGroupModel alloc];
  -[HMDServiceGroup uuid](self, "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDServiceGroup home](self, "home");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "uuid");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = -[HMDBackingStoreModelObject initWithObjectChangeType:uuid:parentUUID:](v5, "initWithObjectChangeType:uuid:parentUUID:", a3, v6, v8);

  v9 = (void *)MEMORY[0x1E0C99DE8];
  -[HMDServiceGroup serviceUUIDs](self, "serviceUUIDs");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "arrayWithCapacity:", objc_msgSend(v10, "count"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  -[NSMutableDictionary allValues](self->_serviceMapping, "allValues");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v13)
  {
    v14 = *(_QWORD *)v25;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v25 != v14)
          objc_enumerationMutation(v12);
        objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * v15), "modelObjectWithChangeType:", a3, lock);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "uuid");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "UUIDString");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "addObject:", v18);

        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v13);
  }

  os_unfair_lock_unlock(lock);
  -[HMDServiceGroup name](self, "name");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDServiceGroupModel setName:](v23, "setName:", v19);

  v20 = (void *)objc_msgSend(v11, "copy");
  -[HMDServiceGroupModel setServices:](v23, "setServices:", v20);

  return v23;
}

- (id)backingStoreObjects:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDServiceGroup modelObjectWithChangeType:](self, "modelObjectWithChangeType:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v6);

  -[HMDServiceGroup appData](self, "appData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (a3 >= 3 && v7)
  {
    -[HMDServiceGroup appData](self, "appData");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "modelObjectWithChangeType:", 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v9);

  }
  return v5;
}

- (void)fixupServiceGroup
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  NSMutableDictionary *serviceMapping;
  void *v13;
  void *v14;
  void *v15;
  NSMutableArray *v16;
  NSMutableArray *serviceUUIDs;
  os_unfair_lock_t lock;
  id obj;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  -[NSMutableDictionary allKeys](self->_serviceMapping, "allKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v21;
    obj = v3;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v21 != v5)
          objc_enumerationMutation(obj);
        v7 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i);
        -[NSMutableDictionary objectForKey:](self->_serviceMapping, "objectForKey:", v7, lock);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "uuid");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "UUIDString");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqual:", v7);

        if ((v11 & 1) == 0)
        {
          serviceMapping = self->_serviceMapping;
          objc_msgSend(v8, "uuid");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "UUIDString");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary setObject:forKey:](serviceMapping, "setObject:forKey:", v8, v14);

          -[NSMutableDictionary removeObjectForKey:](self->_serviceMapping, "removeObjectForKey:", v7);
        }

      }
      v3 = obj;
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v4);
  }

  -[NSMutableDictionary allKeys](self->_serviceMapping, "allKeys");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (NSMutableArray *)objc_msgSend(v15, "mutableCopy");
  serviceUUIDs = self->_serviceUUIDs;
  self->_serviceUUIDs = v16;

  os_unfair_lock_unlock(lock);
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (NSUUID)spiClientIdentifier
{
  return (NSUUID *)objc_getProperty(self, a2, 40, 1);
}

- (NSMutableDictionary)serviceMapping
{
  return self->_serviceMapping;
}

- (void)setServiceMapping:(id)a3
{
  objc_storeStrong((id *)&self->_serviceMapping, a3);
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setWorkQueue:(id)a3
{
  objc_storeStrong((id *)&self->_workQueue, a3);
}

- (HMDHome)home
{
  return (HMDHome *)objc_loadWeakRetained((id *)&self->_home);
}

- (void)setHome:(id)a3
{
  objc_storeWeak((id *)&self->_home, a3);
}

- (HMFMessageDispatcher)msgDispatcher
{
  return self->_msgDispatcher;
}

- (void)setMsgDispatcher:(id)a3
{
  objc_storeStrong((id *)&self->_msgDispatcher, a3);
}

- (HMDApplicationData)appData
{
  return self->_appData;
}

- (void)setAppData:(id)a3
{
  objc_storeStrong((id *)&self->_appData, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appData, 0);
  objc_storeStrong((id *)&self->_msgDispatcher, 0);
  objc_destroyWeak((id *)&self->_home);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_serviceMapping, 0);
  objc_storeStrong((id *)&self->_spiClientIdentifier, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_serviceUUIDs, 0);
}

void __47__HMDServiceGroup__handleRemoveServiceRequest___block_invoke(uint64_t a1, void *a2)
{
  os_unfair_lock_s *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  if (v6)
  {
    v3 = (os_unfair_lock_s *)(*(_QWORD *)(a1 + 32) + 8);
    os_unfair_lock_lock_with_options();
    v4 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
    objc_msgSend(*(id *)(a1 + 40), "UUIDString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v5);

    os_unfair_lock_unlock(v3);
    objc_msgSend(*(id *)(a1 + 48), "respondWithError:", v6);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 48), "respondWithSuccess");
  }

}

void __44__HMDServiceGroup__handleAddServiceRequest___block_invoke(uint64_t a1, void *a2)
{
  os_unfair_lock_s *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  if (v6)
  {
    v3 = (os_unfair_lock_s *)(*(_QWORD *)(a1 + 32) + 8);
    os_unfair_lock_lock_with_options();
    v4 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
    objc_msgSend(*(id *)(a1 + 40), "UUIDString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeObject:", v5);

    os_unfair_lock_unlock(v3);
    objc_msgSend(*(id *)(a1 + 48), "respondWithError:", v6);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 48), "respondWithSuccess");
  }

}

void __40__HMDServiceGroup__handleRenameRequest___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "respondWithError:", a2);
  }
  else
  {
    v3 = *(_QWORD *)(a1 + 40);
    v5 = *MEMORY[0x1E0CBAC40];
    v6[0] = v3;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "respondWithPayload:", v4);

  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (BOOL)hasMessageReceiverChildren
{
  return 0;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t33 != -1)
    dispatch_once(&logCategory__hmf_once_t33, &__block_literal_global_21287);
  return (id)logCategory__hmf_once_v34;
}

void __30__HMDServiceGroup_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v34;
  logCategory__hmf_once_v34 = v0;

}

- (NSString)urlString
{
  void *v2;
  void *v3;

  -[HMDServiceGroup uuid](self, "uuid");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  hm_assistantIdentifier();
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSDictionary)assistantObject
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
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v19[7];
  _QWORD v20[7];
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  -[HMDServiceGroup home](self, "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDServiceGroup name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4 && v3)
  {
    objc_msgSend(v3, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v20[0] = *MEMORY[0x1E0D88A18];
      -[HMDServiceGroup name](self, "name", CFSTR("objectType"), CFSTR("objectName"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v20[1] = v7;
      v19[2] = CFSTR("objectIdentifier");
      -[HMDServiceGroup urlString](self, "urlString");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v20[2] = v8;
      v19[3] = CFSTR("objectHome");
      objc_msgSend(v3, "name");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v20[3] = v9;
      v19[4] = CFSTR("objectHomeIdentifier");
      objc_msgSend(v3, "urlString");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v20[4] = v10;
      v20[5] = self;
      v19[5] = CFSTR("objectReference");
      v19[6] = CFSTR("objectGroupType");
      v20[6] = *MEMORY[0x1E0D88A70];
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 7);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_9;
    }
  }
  else
  {

  }
  v12 = (void *)MEMORY[0x1D17BA0A0]();
  HMFGetOSLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDServiceGroup name](self, "name");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDServiceGroup uuid](self, "uuid");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "UUIDString");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v22 = v14;
    v23 = 2112;
    v24 = v15;
    v25 = 2112;
    v26 = v17;
    v27 = 2112;
    v28 = v3;
    _os_log_impl(&dword_1CD062000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@Skipping because attribute(s) is nil self %@/%@  self.home %@", buf, 0x2Au);

  }
  objc_autoreleasePoolPop(v12);
  v11 = 0;
LABEL_9:

  return (NSDictionary *)v11;
}

@end
