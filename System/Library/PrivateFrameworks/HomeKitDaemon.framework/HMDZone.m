@implementation HMDZone

- (HMDZone)initWithName:(id)a3 uuid:(id)a4 home:(id)a5
{
  id v8;
  id v9;
  id v10;
  HMDZone *v11;
  void *v12;
  uint64_t v13;
  NSString *name;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  NSUUID *uuid;
  void *v19;
  uint64_t v20;
  NSUUID *spiClientIdentifier;
  uint64_t v22;
  HMFMessageDispatcher *msgDispatcher;
  uint64_t v24;
  NSMutableDictionary *currentRooms;
  uint64_t v26;
  NSMutableArray *roomUUIDs;
  objc_super v29;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v29.receiver = self;
  v29.super_class = (Class)HMDZone;
  v11 = -[HMDZone init](&v29, sel_init);
  if (v11)
  {
    objc_msgSend(v8, "hm_truncatedNameString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "copy");
    name = v11->_name;
    v11->_name = (NSString *)v13;

    if (v9)
    {
      v15 = objc_msgSend(v9, "copy");
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1880], "UUID");
      v15 = objc_claimAutoreleasedReturnValue();
    }
    v16 = (void *)v15;
    objc_msgSend(MEMORY[0x24BE3F210], "hmf_cachedInstanceForNSUUID:", v15);
    v17 = objc_claimAutoreleasedReturnValue();
    uuid = v11->_uuid;
    v11->_uuid = (NSUUID *)v17;

    spiClientIdentifierForUUID(v11->_uuid);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE3F210], "hmf_cachedInstanceForNSUUID:", v19);
    v20 = objc_claimAutoreleasedReturnValue();
    spiClientIdentifier = v11->_spiClientIdentifier;
    v11->_spiClientIdentifier = (NSUUID *)v20;

    objc_storeWeak((id *)&v11->_home, v10);
    objc_msgSend(v10, "msgDispatcher");
    v22 = objc_claimAutoreleasedReturnValue();
    msgDispatcher = v11->_msgDispatcher;
    v11->_msgDispatcher = (HMFMessageDispatcher *)v22;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v24 = objc_claimAutoreleasedReturnValue();
    currentRooms = v11->_currentRooms;
    v11->_currentRooms = (NSMutableDictionary *)v24;

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v26 = objc_claimAutoreleasedReturnValue();
    roomUUIDs = v11->_roomUUIDs;
    v11->_roomUUIDs = (NSMutableArray *)v26;

  }
  return v11;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  -[HMDZone msgDispatcher](self, "msgDispatcher");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "deregisterReceiver:", self);

  -[HMDZone home](self, "home");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "administratorHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "deregisterReceiver:", self);

  v6.receiver = self;
  v6.super_class = (Class)HMDZone;
  -[HMDZone dealloc](&v6, sel_dealloc);
}

- (void)configure:(id)a3 queue:(id)a4
{
  id v6;

  v6 = a4;
  -[HMDZone setMsgDispatcher:](self, "setMsgDispatcher:", a3);
  -[HMDZone setWorkQueue:](self, "setWorkQueue:", v6);

  -[HMDZone _registerForMessages](self, "_registerForMessages");
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
  void *v4;
  NSString *v5;
  NSString *name;
  id v7;

  v7 = a3;
  os_unfair_lock_lock_with_options();
  objc_msgSend(v7, "hm_truncatedNameString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (NSString *)objc_msgSend(v4, "copy");
  name = self->_name;
  self->_name = v5;

  os_unfair_lock_unlock(&self->_lock);
}

- (NSArray)roomUUIDs
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = (void *)-[NSMutableArray copy](self->_roomUUIDs, "copy");
  os_unfair_lock_unlock(p_lock);
  return (NSArray *)v4;
}

- (NSArray)rooms
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  -[NSMutableDictionary allValues](self->_currentRooms, "allValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);
  return (NSArray *)v4;
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
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x24BDD17C8];
  -[HMDZone name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDZone uuid](self, "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDZone urlString](self, "urlString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("name: %@  uuid: %@, assistantIdentifier: %@"), v5, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, *MEMORY[0x24BE3EB68]);
  -[HMDZone rooms](self, "rooms");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");

  if (v11)
  {
    v12 = (void *)MEMORY[0x24BDBCEB8];
    -[HMDZone rooms](self, "rooms");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "arrayWithCapacity:", objc_msgSend(v13, "count"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    -[HMDZone rooms](self, "rooms");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v23;
      do
      {
        v19 = 0;
        do
        {
          if (*(_QWORD *)v23 != v18)
            objc_enumerationMutation(v15);
          objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * v19), "dumpState");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "addObject:", v20);

          ++v19;
        }
        while (v17 != v19);
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v17);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, *MEMORY[0x24BE3EB38]);
  }

  return v3;
}

- (HMDZone)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  HMDZone *v6;

  v4 = a3;
  v5 = (void *)MEMORY[0x227676638]();
  v6 = (HMDZone *)-[HMDZone _initWithCoder:](self, "_initWithCoder:", v4);
  objc_autoreleasePoolPop(v5);

  return v6;
}

- (id)_initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  HMDZone *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  NSMutableDictionary *currentRooms;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  NSMutableArray *roomUUIDs;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  _QWORD v40[4];

  v40[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("zoneName"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("zoneUUID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", v6);
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("home"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[HMDZone initWithName:uuid:home:](self, "initWithName:uuid:home:", v5, v7, v8);
  if (v9)
  {
    v34 = v8;
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "hm_decodeArrayOfConditionalObjects:forKey:", objc_opt_class(), CFSTR("rooms"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setArray:", v11);

    v12 = (void *)MEMORY[0x24BDBCF20];
    v40[0] = objc_opt_class();
    v40[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v40, 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setWithArray:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v14, CFSTR("roomUUID"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v33 = v10;
    if (objc_msgSend(v15, "count"))
    {
      -[HMDZone _handleSetRoomsTransactionWithRoomUUIDStrings:error:](v9, "_handleSetRoomsTransactionWithRoomUUIDStrings:error:", v15, 0);
    }
    else
    {
      v29 = v15;
      v30 = v7;
      v31 = v5;
      v32 = v4;
      v37 = 0u;
      v38 = 0u;
      v35 = 0u;
      v36 = 0u;
      v16 = v10;
      v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
      if (v17)
      {
        v18 = v17;
        v19 = *(_QWORD *)v36;
        do
        {
          for (i = 0; i != v18; ++i)
          {
            if (*(_QWORD *)v36 != v19)
              objc_enumerationMutation(v16);
            v21 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
            currentRooms = v9->_currentRooms;
            objc_msgSend(v21, "uuid");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "UUIDString");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSMutableDictionary setObject:forKeyedSubscript:](currentRooms, "setObject:forKeyedSubscript:", v21, v24);

          }
          v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
        }
        while (v18);
      }

      -[NSMutableDictionary allKeys](v9->_currentRooms, "allKeys");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v25, "mutableCopy");
      roomUUIDs = v9->_roomUUIDs;
      v9->_roomUUIDs = (NSMutableArray *)v26;

      v5 = v31;
      v4 = v32;
      v7 = v30;
      v15 = v29;
    }

    v8 = v34;
  }

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v4 = (void *)MEMORY[0x227676638]();
  -[HMDZone home](self, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "encodeConditionalObject:forKey:", v5, CFSTR("home"));

  -[HMDZone name](self, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "encodeObject:forKey:", v6, CFSTR("zoneName"));

  -[HMDZone uuid](self, "uuid");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "UUIDString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "encodeObject:forKey:", v8, CFSTR("zoneUUID"));

  -[HMDZone rooms](self, "rooms");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "hm_encodeArrayOfConditionalObjects:forKey:", v9, CFSTR("rooms"));

  -[HMDZone roomUUIDs](self, "roomUUIDs");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "encodeObject:forKey:", v10, CFSTR("roomUUID"));

  objc_autoreleasePoolPop(v4);
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
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  HMDZone *v18;
  NSObject *v19;
  void *v20;
  _QWORD v21[2];
  _QWORD v22[2];
  _QWORD v23[2];
  uint8_t buf[4];
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  -[HMDZone home](self, "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "administratorHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMDConfigurationMessagePolicy policyWithOperationTypes:](HMDConfigurationMessagePolicy, "policyWithOperationTypes:", 2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = v6;
    +[HMDXPCMessagePolicy policyWithEntitlements:](HMDXPCMessagePolicy, "policyWithEntitlements:", 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v23[1] = v7;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v23, 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "registerForMessage:receiver:policies:selector:", CFSTR("kAddRoomRequestKey"), self, v8, sel__handleAddRoom_);

    objc_msgSend(v4, "administratorHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMDConfigurationMessagePolicy policyWithOperationTypes:](HMDConfigurationMessagePolicy, "policyWithOperationTypes:", 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = v10;
    +[HMDXPCMessagePolicy policyWithEntitlements:](HMDXPCMessagePolicy, "policyWithEntitlements:", 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v22[1] = v11;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v22, 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "registerForMessage:receiver:policies:selector:", CFSTR("kRemoveRoomRequestKey"), self, v12, sel__handleRemoveRoom_);

    objc_msgSend(v4, "administratorHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMDConfigurationMessagePolicy policyWithOperationTypes:](HMDConfigurationMessagePolicy, "policyWithOperationTypes:", 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMDXPCMessagePolicy policyWithEntitlements:](HMDXPCMessagePolicy, "policyWithEntitlements:", 1, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v21[1] = v15;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v21, 2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "registerForMessage:receiver:policies:selector:", CFSTR("kRenameZoneRequestKey"), self, v16, sel__handleRename_);

  }
  else
  {
    v17 = (void *)MEMORY[0x227676638]();
    v18 = self;
    HMFGetOSLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v25 = v20;
      _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_ERROR, "%{public}@Not going to register for messages as home is nil", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v17);
  }

}

- (void)_handleAddRoom:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  HMDZoneModel *v7;
  void *v8;
  void *v9;
  HMDZoneModel *v10;
  void *v11;
  NSMutableArray *roomUUIDs;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[5];
  id v20;
  id v21;

  v4 = a3;
  objc_msgSend(v4, "uuidForKey:", CFSTR("kRoomUUID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDZone home](self, "home");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = [HMDZoneModel alloc];
  -[HMDZone uuid](self, "uuid");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "uuid");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[HMDBackingStoreModelObject initWithObjectChangeType:uuid:parentUUID:](v7, "initWithObjectChangeType:uuid:parentUUID:", 2, v8, v9);

  os_unfair_lock_lock_with_options();
  -[HMDZone _checkForAddValidity:](self, "_checkForAddValidity:", v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    os_unfair_lock_unlock(&self->_lock);
    objc_msgSend(v4, "respondWithError:", v11);
  }
  else
  {
    roomUUIDs = self->_roomUUIDs;
    objc_msgSend(v5, "UUIDString");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](roomUUIDs, "addObject:", v13);

    v14 = (void *)-[NSMutableArray copy](self->_roomUUIDs, "copy");
    -[HMDZoneModel setRoomUUIDs:](v10, "setRoomUUIDs:", v14);

    os_unfair_lock_unlock(&self->_lock);
    objc_msgSend(v6, "backingStore");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "name");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMDBackingStoreTransactionOptions defaultXPCOptions](HMDBackingStoreTransactionOptions, "defaultXPCOptions");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "transaction:options:", v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v18, "add:", v10);
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __26__HMDZone__handleAddRoom___block_invoke;
    v19[3] = &unk_24E799FD0;
    v19[4] = self;
    v20 = v5;
    v21 = v4;
    objc_msgSend(v18, "run:", v19);

  }
}

- (id)_checkForAddValidity:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  NSMutableArray *roomUUIDs;
  void *v17;
  void *v18;
  void *v19;
  unint64_t v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  NSString *name;
  void *v27;
  int v28;
  void *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  NSString *v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  -[HMDZone home](self, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "roomWithUUID:", v4);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  v8 = 2;
  if (v5 && v6)
  {
    objc_msgSend(v5, "roomForEntireHome", 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "uuid");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v4, "isEqual:", v10);

    if ((v11 & 1) != 0)
    {
      v8 = 24;
    }
    else
    {
      objc_msgSend(v7, "home");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "uuid");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "uuid");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v13, "isEqual:", v14);

      if (v15)
      {
        roomUUIDs = self->_roomUUIDs;
        objc_msgSend(v7, "uuid");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "UUIDString");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(roomUUIDs) = -[NSMutableArray containsObject:](roomUUIDs, "containsObject:", v18);

        if ((roomUUIDs & 1) != 0)
        {
          v8 = 1;
        }
        else
        {
          v21 = -[NSMutableArray count](self->_roomUUIDs, "count");
          if (v21 < maximumRoomsPerZone)
          {
            v19 = 0;
            goto LABEL_10;
          }
          v22 = (void *)MEMORY[0x227676638]();
          HMFGetOSLogHandle();
          v23 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "name");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            name = self->_name;
            objc_msgSend(v5, "name");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v28 = 138544130;
            v29 = v24;
            v30 = 2112;
            v31 = v25;
            v32 = 2112;
            v33 = name;
            v34 = 2112;
            v35 = v27;
            _os_log_impl(&dword_2218F0000, v23, OS_LOG_TYPE_INFO, "%{public}@Can't add room %@ to zone %@ in home %@; already at maximum rooms for zone",
              (uint8_t *)&v28,
              0x2Au);

          }
          objc_autoreleasePoolPop(v22);
          v8 = 49;
        }
      }
      else
      {
        v8 = 11;
      }
    }
  }
  objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", v8);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_10:

  return v19;
}

- (void)_handleRemoveRoom:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  HMDZoneModel *v7;
  void *v8;
  void *v9;
  HMDZoneModel *v10;
  NSMutableArray *roomUUIDs;
  void *v12;
  NSMutableArray *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[5];
  id v22;
  id v23;

  v4 = a3;
  objc_msgSend(v4, "uuidForKey:", CFSTR("kRoomUUID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDZone home](self, "home");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = [HMDZoneModel alloc];
  -[HMDZone uuid](self, "uuid");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "uuid");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[HMDBackingStoreModelObject initWithObjectChangeType:uuid:parentUUID:](v7, "initWithObjectChangeType:uuid:parentUUID:", 2, v8, v9);

  os_unfair_lock_lock_with_options();
  roomUUIDs = self->_roomUUIDs;
  objc_msgSend(v5, "UUIDString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(roomUUIDs) = -[NSMutableArray containsObject:](roomUUIDs, "containsObject:", v12);

  if ((_DWORD)roomUUIDs)
  {
    v13 = self->_roomUUIDs;
    objc_msgSend(v5, "UUIDString");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray removeObject:](v13, "removeObject:", v14);

    v15 = (void *)-[NSMutableArray copy](self->_roomUUIDs, "copy");
    -[HMDZoneModel setRoomUUIDs:](v10, "setRoomUUIDs:", v15);

    os_unfair_lock_unlock(&self->_lock);
    objc_msgSend(v6, "backingStore");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "name");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMDBackingStoreTransactionOptions defaultXPCOptions](HMDBackingStoreTransactionOptions, "defaultXPCOptions");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "transaction:options:", v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v19, "add:", v10);
    v21[0] = MEMORY[0x24BDAC760];
    v21[1] = 3221225472;
    v21[2] = __29__HMDZone__handleRemoveRoom___block_invoke;
    v21[3] = &unk_24E799FD0;
    v21[4] = self;
    v22 = v5;
    v23 = v4;
    objc_msgSend(v19, "run:", v21);

  }
  else
  {
    os_unfair_lock_unlock(&self->_lock);
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 2);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "respondWithError:", v20);

  }
}

- (void)_handleRename:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  void *v7;
  HMDZone *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  HMDZoneModel *v14;
  void *v15;
  void *v16;
  HMDZoneModel *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[4];
  id v23;
  id v24;
  uint8_t buf[4];
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "stringForKey:", CFSTR("kZoneName"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = HMMaxLengthForNaming();
  if (objc_msgSend(v5, "length") <= v6)
  {
    -[HMDZone home](self, "home");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDZone name](self, "name");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "replaceName:withNewName:", v12, v5);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      objc_msgSend(v4, "respondWithError:", v13);
    }
    else
    {
      v14 = [HMDZoneModel alloc];
      -[HMDZone uuid](self, "uuid");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "uuid");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = -[HMDBackingStoreModelObject initWithObjectChangeType:uuid:parentUUID:](v14, "initWithObjectChangeType:uuid:parentUUID:", 2, v15, v16);

      -[HMDZoneModel setName:](v17, "setName:", v5);
      objc_msgSend(v11, "backingStore");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "name");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      +[HMDBackingStoreTransactionOptions defaultXPCOptions](HMDBackingStoreTransactionOptions, "defaultXPCOptions");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "transaction:options:", v19, v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v21, "add:", v17);
      v22[0] = MEMORY[0x24BDAC760];
      v22[1] = 3221225472;
      v22[2] = __25__HMDZone__handleRename___block_invoke;
      v22[3] = &unk_24E79BCC8;
      v23 = v4;
      v24 = v5;
      objc_msgSend(v21, "run:", v22);

    }
  }
  else
  {
    v7 = (void *)MEMORY[0x227676638]();
    v8 = self;
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v26 = v10;
      _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_ERROR, "%{public}@New name is longer than the pre-defined max length", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v7);
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 46);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "respondWithError:", v11);
  }

}

- (BOOL)_handleSetRoomsTransactionWithRoomUUIDStrings:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  id v18;
  void *v19;
  NSString *name;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  uint64_t v28;
  NSMutableArray *roomUUIDs;
  uint64_t v30;
  uint64_t v31;
  char v32;
  uint64_t j;
  void *v34;
  void *v35;
  void *v36;
  NSObject *v37;
  id v38;
  void *v39;
  os_unfair_lock_s *lock;
  void *v42;
  id v43;
  id obj;
  HMDZone *v46;
  void *v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  uint8_t v56[128];
  uint8_t buf[4];
  id v58;
  __int16 v59;
  void *v60;
  __int16 v61;
  id v62;
  __int16 v63;
  NSString *v64;
  __int16 v65;
  void *v66;
  _BYTE v67[128];
  uint64_t v68;

  v68 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v46 = self;
  -[HMDZone home](self, "home");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = 0u;
  v55 = 0u;
  v52 = 0u;
  v53 = 0u;
  obj = v5;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v67, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v53;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v53 != v8)
          objc_enumerationMutation(obj);
        v10 = *(_QWORD *)(*((_QWORD *)&v52 + 1) + 8 * i);
        v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", v10);
        objc_msgSend(v47, "roomWithUUID:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
          objc_msgSend(v6, "setObject:forKeyedSubscript:", v12, v10);

      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v67, 16);
    }
    while (v7);
  }

  v13 = (void *)objc_msgSend(obj, "mutableCopy");
  lock = &v46->_lock;
  os_unfair_lock_lock_with_options();
  -[NSMutableDictionary allKeys](v46->_currentRooms, "allKeys");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "removeObjectsInArray:", v14);

  -[NSMutableDictionary allKeys](v46->_currentRooms, "allKeys");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = (void *)objc_msgSend(v15, "mutableCopy");

  v16 = (void *)MEMORY[0x227676638](objc_msgSend(v42, "removeObjectsInArray:", obj));
  HMFGetOSLogHandle();
  v17 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v18 = (id)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary allKeys](v46->_currentRooms, "allKeys", lock);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    name = v46->_name;
    objc_msgSend(v47, "name");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544386;
    v58 = v18;
    v59 = 2112;
    v60 = v19;
    v61 = 2112;
    v62 = obj;
    v63 = 2112;
    v64 = name;
    v65 = 2112;
    v66 = v21;
    _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@About to update the zone from %@ to %@ in zone with name (%@) from home %@", buf, 0x34u);

  }
  objc_autoreleasePoolPop(v16);
  v22 = (void *)MEMORY[0x227676638]();
  HMFGetOSLogHandle();
  v23 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v58 = v24;
    v59 = 2112;
    v60 = v42;
    _os_log_impl(&dword_2218F0000, v23, OS_LOG_TYPE_DEFAULT, "%{public}@Removing Rooms: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v22);
  v25 = (void *)MEMORY[0x227676638]();
  HMFGetOSLogHandle();
  v26 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v58 = v27;
    v59 = 2112;
    v60 = v13;
    _os_log_impl(&dword_2218F0000, v26, OS_LOG_TYPE_DEFAULT, "%{public}@Adding Rooms: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v25);
  v28 = objc_msgSend(obj, "mutableCopy");
  roomUUIDs = v46->_roomUUIDs;
  v46->_roomUUIDs = (NSMutableArray *)v28;

  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  v43 = v13;
  v30 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v48, v56, 16);
  if (v30)
  {
    v31 = *(_QWORD *)v49;
    v32 = 1;
    do
    {
      for (j = 0; j != v30; ++j)
      {
        if (*(_QWORD *)v49 != v31)
          objc_enumerationMutation(v43);
        v34 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * j);
        objc_msgSend(v6, "objectForKeyedSubscript:", v34, lock);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        if (v35)
        {
          -[NSMutableDictionary setObject:forKeyedSubscript:](v46->_currentRooms, "setObject:forKeyedSubscript:", v35, v34);
        }
        else
        {
          v36 = (void *)MEMORY[0x227676638]();
          HMFGetOSLogHandle();
          v37 = (id)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v38 = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v47, "name");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v58 = v38;
            v59 = 2112;
            v60 = v34;
            v61 = 2112;
            v62 = v39;
            _os_log_impl(&dword_2218F0000, v37, OS_LOG_TYPE_ERROR, "%{public}@_handleSetRoomsZoneTransaction:message: Couldn't find the room with UUID %@ in home %@.", buf, 0x20u);

          }
          objc_autoreleasePoolPop(v36);
          if (a4)
          {
            objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 2);
            v32 = 0;
            *a4 = (id)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v32 = 0;
          }
        }

      }
      v30 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v48, v56, 16);
    }
    while (v30);
  }
  else
  {
    v32 = 1;
  }

  -[NSMutableDictionary removeObjectsForKeys:](v46->_currentRooms, "removeObjectsForKeys:", v42);
  os_unfair_lock_unlock(lock);

  return v32 & 1;
}

- (void)addRoomIfNotPresent:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  objc_msgSend(v7, "uuid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UUIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_lock_with_options();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_currentRooms, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_currentRooms, "setObject:forKeyedSubscript:", v7, v5);
    -[NSMutableArray addObject:](self->_roomUUIDs, "addObject:", v5);
  }
  os_unfair_lock_unlock(&self->_lock);

}

- (void)removeRoom:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  objc_msgSend(v6, "uuid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UUIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_lock_with_options();
  -[NSMutableArray removeObject:](self->_roomUUIDs, "removeObject:", v5);
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_currentRooms, "setObject:forKeyedSubscript:", 0, v5);
  os_unfair_lock_unlock(&self->_lock);

}

- (BOOL)updateZoneWithModel:(id)a3 message:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  BOOL v21;

  v8 = a3;
  objc_msgSend(a4, "transactionResult");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "name");
  v10 = objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = (void *)v10;
    -[HMDZone name](self, "name");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "name");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = HMFEqualObjects();

    if ((v14 & 1) == 0)
    {
      objc_msgSend(v8, "name");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "hm_truncatedNameString");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      -[HMDZone home](self, "home");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDZone name](self, "name");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (id)objc_msgSend(v17, "replaceName:withNewName:", v18, v16);

      -[HMDZone setName:](self, "setName:", v16);
      objc_msgSend(v9, "markChanged");
      objc_msgSend(v9, "markSaveToAssistant");

    }
  }
  objc_msgSend(v8, "roomUUIDs");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20)
  {
    if (!-[HMDZone _handleSetRoomsTransactionWithRoomUUIDStrings:error:](self, "_handleSetRoomsTransactionWithRoomUUIDStrings:error:", v20, a5))
    {
      v21 = 0;
      goto LABEL_9;
    }
    objc_msgSend(v9, "markChanged");
    objc_msgSend(v9, "markSaveToAssistant");
  }
  v21 = 1;
LABEL_9:

  return v21;
}

- (void)transactionObjectUpdated:(id)a3 newValues:(id)a4 message:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  HMDZone *v16;
  NSObject *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void (**v22)(_QWORD, _QWORD, _QWORD);
  id v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  id v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v9;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v12 = v11;
  else
    v12 = 0;
  v13 = v12;

  if (v13)
  {
    v23 = 0;
    -[HMDZone updateZoneWithModel:message:error:](self, "updateZoneWithModel:message:error:", v13, v10, &v23);
    v14 = v23;
  }
  else
  {
    v15 = (void *)MEMORY[0x227676638]();
    v16 = self;
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v25 = v18;
      v26 = 2112;
      v27 = v11;
      v28 = 2112;
      v29 = (id)objc_opt_class();
      v19 = v29;
      _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_ERROR, "%{public}@Unknown model object (%@) sent to [%@ transactionObjectUpdated]", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v15);
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 2);
    v14 = (id)objc_claimAutoreleasedReturnValue();
  }
  v20 = v14;
  objc_msgSend(v10, "responseHandler");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    objc_msgSend(v10, "responseHandler");
    v22 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, _QWORD))v22)[2](v22, v20, 0);

  }
}

- (id)modelObjectWithChangeType:(unint64_t)a3
{
  HMDZoneModel *v5;
  void *v6;
  void *v7;
  void *v8;
  HMDZoneModel *v9;
  void *v10;
  void *v11;
  void *v12;

  v5 = [HMDZoneModel alloc];
  -[HMDZone uuid](self, "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDZone home](self, "home");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "uuid");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[HMDBackingStoreModelObject initWithObjectChangeType:uuid:parentUUID:](v5, "initWithObjectChangeType:uuid:parentUUID:", a3, v6, v8);

  -[HMDZone name](self, "name");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDZoneModel setName:](v9, "setName:", v10);

  -[HMDZone roomUUIDs](self, "roomUUIDs");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "mutableCopy");
  -[HMDZoneModel setRoomUUIDs:](v9, "setRoomUUIDs:", v12);

  return v9;
}

- (id)backingStoreObjects:(int64_t)a3
{
  void *v3;
  void *v4;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  -[HMDZone modelObjectWithChangeType:](self, "modelObjectWithChangeType:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v3;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (NSUUID)spiClientIdentifier
{
  return (NSUUID *)objc_getProperty(self, a2, 48, 1);
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_msgDispatcher, 0);
  objc_destroyWeak((id *)&self->_home);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_spiClientIdentifier, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_currentRooms, 0);
  objc_storeStrong((id *)&self->_roomUUIDs, 0);
}

void __25__HMDZone__handleRename___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  uint64_t v3;
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
    v3 = *(_QWORD *)(a1 + 40);
    v5 = CFSTR("kZoneName");
    v6[0] = v3;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "respondWithPayload:", v4);

  }
}

void __29__HMDZone__handleRemoveRoom___block_invoke(uint64_t a1, void *a2)
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

void __26__HMDZone__handleAddRoom___block_invoke(uint64_t a1, void *a2)
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

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (BOOL)hasMessageReceiverChildren
{
  return 0;
}

- (NSString)urlString
{
  void *v2;
  void *v3;

  -[HMDZone uuid](self, "uuid");
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
  _QWORD v19[6];
  _QWORD v20[6];
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  -[HMDZone home](self, "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDZone name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4 && v3)
  {
    objc_msgSend(v3, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v20[0] = *MEMORY[0x24BE81F58];
      -[HMDZone name](self, "name", CFSTR("objectType"), CFSTR("objectName"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v20[1] = v7;
      v19[2] = CFSTR("objectIdentifier");
      -[HMDZone urlString](self, "urlString");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v20[2] = v8;
      v19[3] = CFSTR("objectHome");
      objc_msgSend(v3, "name");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v20[3] = v9;
      v19[4] = CFSTR("objectHomeIdentifier");
      objc_msgSend(v3, "urlString");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v19[5] = CFSTR("objectReference");
      v20[4] = v10;
      v20[5] = self;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v20, v19, 6);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_9;
    }
  }
  else
  {

  }
  v12 = (void *)MEMORY[0x227676638]();
  HMFGetOSLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDZone name](self, "name");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDZone uuid](self, "uuid");
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
    _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@Skipping because attribute(s) is nil: self %@/%@  self.home %@", buf, 0x2Au);

  }
  objc_autoreleasePoolPop(v12);
  v11 = 0;
LABEL_9:

  return (NSDictionary *)v11;
}

@end
